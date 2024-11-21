package member;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;
import member.MemberDTO;
import utils.CookieManager;
import utils.JSFunction;

@WebServlet("/login.do")
public class LoginController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("./login.jsp").forward(req, resp);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		MemberDTO dto = new MemberDTO();
		
		String user_id =req.getParameter("user_id");
		String user_pass=req.getParameter("user_pass");
		
		
		MemberDAO dao = new MemberDAO();
		
		
		MemberDTO rs = dao.login(user_id, user_pass);
		dao.close();
		
		if(rs.getId()!=null){
			//세션 영역에 아이디와 이름을 저장한다.
			if(req.getParameter("id_rem")!=null) {
				CookieManager.makeCookie(resp,"loginId",user_id,86400);
				session.setAttribute("SaveId", rs.getId());
			}
			else {
	    		//로그인에 성공했지만 체크를 해제한 상태라면 쿠키를 삭제한다.
	    		CookieManager.deleteCookie(resp,"loginId");
	    		session.removeAttribute("SaveId");
	    	}
			session.setAttribute("UserId", rs.getId());
			session.setAttribute("UserName", rs.getName());
			session.setAttribute("UserEmail", rs.getEmail());
			session.setAttribute("UserPhone", rs.getPhone());					
			
			/* 세션영역에 저장된 속성값은 페이지를 이동하더라도 유지되므로 로그인 페이지로 이동한다.
			그리고 웹브라우즈러르 완전히 닫을 때까지 저장된 정보는 유지된다. */
			resp.sendRedirect("./login.do");
		}
		else {
			JSFunction.alertLocation(resp, "아이디와 비밀번호를 확인해주세요.", "./login.do");
		}
		
		
		
	}
	
	
	
}
