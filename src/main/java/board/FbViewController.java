package board;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.CookieManager;

@WebServlet("/fbview.do")
public class FbViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		FreeboardDAO dao = new FreeboardDAO();
		String idx = req.getParameter("idx");
		
		String cookie = "visit";
		System.out.println(CookieManager.readCookie(req, "visit"));
		String vistitidx = "visit"+ idx;
		
		if(CookieManager.readCookie(req, vistitidx).equals(cookie)) {
		}
		else {
			CookieManager.makeCookie(resp,vistitidx,cookie,86400);
			dao.updateVisitCount(idx);
		}
		
		
		FreeboardDTO dto = dao.selectView(idx);
		dao.close();
		
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("./view.jsp")
			.forward(req, resp);
		
	}
}
