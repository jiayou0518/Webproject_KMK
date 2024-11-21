package qaboard;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.CookieManager;
import utils.JSFunction;

@WebServlet("/qaview.do")
public class QAViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		if(session.getAttribute("UserId")==null) {
			JSFunction.alertLocation(resp, "로그인 후 이용해주세요.", "./login.do");
			return;
		}
		//로그인이 완료된 상태라면 쓰기페이지를 포워드한다.
		req.getRequestDispatcher("./fbview.jsp")
			.forward(req, resp);
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		QAboardDAO dao = new QAboardDAO();
		String idx = req.getParameter("idx");
		String qapass = req.getParameter("qapass");
		
		String cookie = "visit";
		System.out.println(CookieManager.readCookie(req, "visit"));
		String vistitidx = "visit"+ idx;
		
		if(CookieManager.readCookie(req, vistitidx).equals(cookie)) {
		}
		else {
			CookieManager.makeCookie(resp,vistitidx,cookie,86400);
			dao.updateVisitCount(idx);
		}
		
		QAboardDTO dto = dao.selectView(idx);
		dto.setContent(dto.getContent().replace("\r\n", "<br/>"));
		
		dao.close();
		
		req.setAttribute("qapass", qapass);
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("./qaview.jsp")
			.forward(req, resp);
		
	}
}
