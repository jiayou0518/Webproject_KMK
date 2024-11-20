package member;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.JSFunction;

@WebServlet("/join.do")
public class JoinController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("./join.jsp").forward(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();
		
		
		dto.setName(req.getParameter("uname"));
		dto.setEmail(req.getParameter("email"));
		dto.setPhone(req.getParameter("pnumber"));
		if(dao.idcheck(req.getParameter("uid").toString())==1) {
			JSFunction.alertBack(resp, "이미 사용중인 아이디입니다.");
		}
		else {
			dto.setId(req.getParameter("uid"));
		}
		if(req.getParameter("pass").equals(req.getParameter("repass"))){
			dto.setPass(req.getParameter("pass"));
		}
		else { 
			JSFunction.alertBack(resp, "비밀번호 재입력이 같지 않습니다.");
//			JSFunction.alertLocation(resp, , "./join.do");
			}
		
		int result = dao.join(dto);
		dao.close();
		
		if(result==1) {
			JSFunction.alertLocation(resp, "회원가입 되었습니다.", "./login.do");		
		}
	}
}
