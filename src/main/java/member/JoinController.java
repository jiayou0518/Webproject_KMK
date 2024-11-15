package member;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.JSFunction;

@WebServlet("/join.do")
public class JoinController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		MemberDTO dto = new MemberDTO();
		
		dto.setId(req.getParameter("uid"));
		dto.setPass(req.getParameter("pass"));
		dto.setName(req.getParameter("uname"));
		dto.setEmail(req.getParameter("email"));
		dto.setPhone(req.getParameter("pnumber"));
		
		MemberDAO dao = new MemberDAO();
		int result = dao.join(dto);
		dao.close();
		
		
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/join.jsp")
			.forward(req, resp);
		
		if(result==1) {
			resp.sendRedirect("../join.do");
			System.out.println("회원가입성공");			
		}
		else {
			JSFunction.alertLocation(resp, "회원가입을 실패했습니다..", "../join.do");
		}
	}
}
