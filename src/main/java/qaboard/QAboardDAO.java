package qaboard;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;
import freeboard.FreeboardDTO;

public class QAboardDAO extends DBConnPool{
	public int selectCount(Map<String, Object>map) {
		int totalCount = 0;
		String query = "SELECT COUNT(*) FROM qaboard";
		if (map.get("searchWord")!=null) {
			query+=" WHERE "+map.get("searchField")+" "
					+ " LIKE '%"+map.get("searchWord")+"%' ";
		}
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		}
		catch (Exception e) {
			System.out.println("게시물 카운트 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount;
	}
	
	public List<QAboardDTO> selectListPage(
			Map<String,Object> map){
		List<QAboardDTO> board = new Vector<QAboardDTO>();
		String query =
				" SELECT * FROM ( "
				+ " SELECT Tb.*, ROWNUM rNum FROM ( "
				+ "	SELECT * FROM qaboard "
				+ "	INNER JOIN member "
				+ " on member.id = qaboard.id ";
		if(map.get("searchWord") !=null) {
			query += " WHERE "+ map.get("searchField")
				  +" LIKE '%" + map.get("searchWord") + "%'";
		}
		query += "	ORDER BY idx DESC "
				+ "	) Tb "
				+ " ) "
				+ " WHERE rNum BETWEEN ? AND ? ";
		try {
			psmt=con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			System.out.println(query);
			rs=psmt.executeQuery();
			
			while(rs.next()) {
				QAboardDTO dto = new QAboardDTO();
				
				dto.setIdx(rs.getInt(1));
				dto.setId(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setVisitcount(rs.getInt(6));
				dto.setQapass(rs.getString(7));
				dto.setName(rs.getString("name"));
				
				board.add(dto);
			}
		}
		catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return board;
	}
	
	public int insertWrite(QAboardDTO dto) {
		int result = 0;
		try {
			/* default값이 있는 3개의 컬럼을 제외한 나머지 컬럼에 대해서만 insert 쿼리문을 작성.
			 * 일련번호 idx의 경우에는 시퀀스를 사용. */
			String query = "INSERT INTO qaboard ( "
					+ " idx, id, title, content, qapass )"
					+ " VALUES ( seq_board_num.NEXTVAL,?,?,?,?)";
			//쿼리문을 인수로 preparedStatement 인스턴스 생성
			psmt = con.prepareStatement(query);
			//인스턴스를 통해 인파라미터 설정
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getQapass());
			//쿼리문 실행. insert 쿼리의 경우 입력된 행의 갯수가 반환됨.
			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public QAboardDTO selectView(String idx) {
		QAboardDTO dto = new QAboardDTO();
		//내부조인(Inner Join )을 이용해서 쿼리문 작성. member테이블의 name컬럼까지 포함
		String query = "SELECT Bo.*, Me.name FROM qaboard Bo "
				+ " INNER JOIN member Me ON Bo.id = Me.id "
				+ " WHERE idx=?"; //쿼리문 템플릿 준비
		try {
			psmt = con.prepareStatement(query); //쿼리문 준비
			psmt.setString(1, idx); //인파라미터 설정
			rs = psmt.executeQuery(); //쿼리문 실행
			
			//하나의 게시물을 인출하므로 if문으로 조건에 맞는 게시물이 있는지 확인
			if(rs.next()) {
				// 결과를 DTO 객체에 저장(member테이블의 name까지 저장한다.
				dto.setIdx(rs.getInt(1));
				dto.setId(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setVisitcount(rs.getInt(6));
				dto.setQapass(rs.getString(7));
				dto.setName(rs.getString("name"));
				
			}
		}
		catch(Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}
	
public void updateVisitCount(String idx) {
		
		String query = "UPDATE qaboard SET "
				+ " visitcount = visitcount+1 "
				+ " WHERE idx=? ";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			int result = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("게시물 조회수 증가 중 예외 발생");
			e.printStackTrace();
		}
	}
	
	public int deletepost(String idx) {
		int result=0;
		try {
			String query = "DELETE FROM qaboard WHERE idx=?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}

}
