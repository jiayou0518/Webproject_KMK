package member;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.JSFunction;

@WebServlet("/findpw.do")
public class FindpwController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("./findpass.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.findpw(req.getParameter("uid"),req.getParameter("email"));
		
		
		session.setAttribute("UserName", dto.getName());
		session.setAttribute("Userpass", dto.getPass());
		
		
		if(dto.getPass()==null) {
			JSFunction.alertBack(resp, "아이디 또는 이메일을 확인해주세요.");
		}
		req.setAttribute("dto", dto);
		resp.sendRedirect("./findpw.do");
		dao.close();
	}
}
