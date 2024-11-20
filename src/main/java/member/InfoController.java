package member;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.JSFunction;

@WebServlet("/info.do")
public class InfoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("./infoUpdat.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
				
		MemberDTO dto = new MemberDTO();
		
		dto.setId(session.getAttribute("UserId").toString());
		if(req.getParameter("pass").equals(req.getParameter("repass"))){
			dto.setPass(req.getParameter("pass"));
		}
		else { 
			JSFunction.alertBack(resp, "비밀번호 재입력이 같지 않습니다.");
			}
		dto.setName(req.getParameter("uname"));
		dto.setEmail(req.getParameter("email"));
		dto.setPhone(req.getParameter("pnumber"));
		
		MemberDAO dao = new MemberDAO();
		int result = dao.infoUpdate(dto);
		dao.close();
		
		if(result==1) { 
			resp.sendRedirect("./login.do");
			session.setAttribute("UserId", dto.getId());
			session.setAttribute("UserName", dto.getName());
		}
	}
}
