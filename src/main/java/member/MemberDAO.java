package member;

import common.DBConnPool;
import common.JDBConnect;
import jakarta.servlet.ServletContext;
import member.MemberDTO;

public class MemberDAO extends DBConnPool {

	public MemberDAO() {
		super();
	}
	
	public int join(MemberDTO dto) {
		int result = 0;
		try {
			String query = "INSERT INTO member ( "
					+ " id, pass, name, email, phone) "
					+ " VALUES ( ?,?,?,?,? )";
			psmt = con.prepareStatement(query);

			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getEmail());
			psmt.setString(5, dto.getPhone());

			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("회원가입 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public MemberDTO login(String user_id, String user_pass) {
		String query = "SELECT * FROM member WHERE id= ? AND pass= ?";
		MemberDTO dto = new MemberDTO();
		
		try {
			psmt=con.prepareStatement(query);
			
			psmt.setString(1, user_id);
			psmt.setString(2, user_pass);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getString(1));
				dto.setPass(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setEmail(rs.getString(4));
				dto.setPhone(rs.getString(5));				
			}
			
		}
		catch(Exception e) {
			System.out.println("로그인 중 예외발생");
			e.printStackTrace();
		}
		return dto;
	}
	
	public int infoUpdate(MemberDTO dto) {
		int result = 0;
		try {
			
			String query = " UPDATE member SET name=?, email=?, phone=?, pass=? "
					+ " WHERE id=? ";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getEmail());
			psmt.setString(3, dto.getPhone());
			psmt.setString(5, dto.getId());
			psmt.setString(4, dto.getPass());
			
			result = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("정보 수정 중 예외 발생");
		}
		return result;
	}
	
	public int idcheck(String id) {
		int result =0;
		String query = "SELECT COUNT(*) from member WHERE id=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			rs.next();
			result = rs.getInt(1);
		}
		catch (Exception e){
			System.out.println("아이디 중복 확인 중 예외 발생");
			e.printStackTrace();
			
		}	
		return result;
	}
	
	public MemberDTO findpw(String id, String email) {
		String query = "SELECT * FROM member WHERE id= ? AND email= ?";
		MemberDTO dto = new MemberDTO();
		try {
			psmt=con.prepareStatement(query);
			
			psmt.setString(1, id);
			psmt.setString(2, email);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getString(1));
				dto.setPass(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setEmail(rs.getString(4));
				dto.setPhone(rs.getString(5));				
			}
				
		}
		catch(Exception e) {
			System.out.println("비밀번호 찾기 중 예외발생");
			e.printStackTrace();
		}
		return dto;
	}
}
