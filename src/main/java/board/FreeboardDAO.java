package board;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;
import jakarta.servlet.http.Cookie;

public class FreeboardDAO extends DBConnPool {
	
	public int selectCount(Map<String, Object>map) {
		int totalCount = 0;
		//오라클의 그룹함수는 count()를 사용해서 쿼리문 작성
		String query = "SELECT COUNT(*) FROM freeboard";
		//매개변수로 전달된 검색어가 있는 경우에만 where절을 동적으로 추가
		if (map.get("searchWord")!=null) {
			query+=" WHERE "+map.get("searchField")+" "
					+ " LIKE '%"+map.get("searchWord")+"%' ";
		}
		try {
			//Statement 인스턴스 생성(정적쿼리문 실행)
			stmt = con.createStatement();
			//쿼리문을 실행한 후 결과를 ResultSet으로 반환한다.
			rs = stmt.executeQuery(query);
			/*count()함수는 조건에 상관없이 항상 결과가 인출되므로 if문과 같은
			조건절없이 바로 next()함수를 실행할 수 있다. */
			rs.next();
			//반환된 결과를 저장한다.
			totalCount = rs.getInt(1);
		}
		catch (Exception e) {
			System.out.println("게시물 카운트 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount;
	}
	
	
	public List<FreeboardDTO> selectListPage(
			Map<String,Object> map){
		List<FreeboardDTO> board = new Vector<FreeboardDTO>();
		String query =
				" SELECT * FROM ( "
				+ " SELECT Tb.*, ROWNUM rNum FROM ( "
				+ "		SELECT * FROM freeboard "
				+ "			INNER JOIN member "
				+ "				on member.id = freeboard.id";
		if(map.get("searchWord") !=null) {
			query += " WHERE "+ map.get("searchField")
				  +" LIKE '%" + map.get("searchWord") + "%'";
		}
		query += "		ORDER BY idx DESC "
				+ "		) Tb "
				+ " ) "
				+ " WHERE rNum BETWEEN ? AND ? ";
		try {
			psmt=con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs=psmt.executeQuery();
			
			while(rs.next()) {
				FreeboardDTO dto = new FreeboardDTO();
				
				dto.setIdx(rs.getInt(1));
				dto.setId(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setVisitcount(rs.getInt(6));
				dto.setLikecount(rs.getInt(7));
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
	
	public FreeboardDTO selectView(String idx) {
		FreeboardDTO dto = new FreeboardDTO();
		//내부조인(Inner Join )을 이용해서 쿼리문 작성. member테이블의 name컬럼까지 포함
		String query = "SELECT Bo.*, Me.name FROM freeboard Bo "
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
				dto.setLikecount(rs.getInt(7));
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
		
		
		//visitcount 컬럼은 number타입이므로 산술연산이 가능함.
		//1을 더한 결과를 컬럼에 재반영하는 형식으로 update 쿼리문 작성.
		String query = "UPDATE freeboard SET "
				+ " visitcount = visitcount+1 "
				+ " WHERE idx=? ";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			/*
			쿼리 실행시 주로 아래의 두가지 메서드를 사용한다.
			executeQuery() : select계열의 쿼리문을 실행한다. 반환타입은 resultSet.
			executeUpdate() : insert, update, delete계열의 쿼리문을 실행한다. 반환타입은 int.
			만약 쿼리 실행 후 별도의 반환값이 필요하지 않다면 위 2개의 메서드 중 어떤 것을 사용해도 무방하다.
			*/
//			psmt.executeQuery();
			int result = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("게시물 조회수 증가 중 예외 발생");
			e.printStackTrace();
		}
	}
	
	public int insertWrite(FreeboardDTO dto) {
		int result = 0;
		try {
			/* default값이 있는 3개의 컬럼을 제외한 나머지 컬럼에 대해서만 insert 쿼리문을 작성.
			 * 일련번호 idx의 경우에는 시퀀스를 사용. */
			String query = "INSERT INTO freeboard ( "
					+ " idx, id, title, content )"
					+ " VALUES ( seq_board_num.NEXTVAL,?,?,?)";
			//쿼리문을 인수로 preparedStatement 인스턴스 생성
			psmt = con.prepareStatement(query);
			//인스턴스를 통해 인파라미터 설정
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			//쿼리문 실행. insert 쿼리의 경우 입력된 행의 갯수가 반환됨.
			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
}
	
	
