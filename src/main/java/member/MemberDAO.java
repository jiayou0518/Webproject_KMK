package member;

import common.JDBConnect;
import jakarta.servlet.ServletContext;

public class MemberDAO extends JDBConnect {
	public MemberDAO(String drv, String url, String id, String pw) {
		//super()를 통해 부모클래스의 생성자를 호출한다.
		super(drv,url,id,pw);
	}
	
	public MemberDAO(ServletContext application) {
		super(application);
	}
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

}
