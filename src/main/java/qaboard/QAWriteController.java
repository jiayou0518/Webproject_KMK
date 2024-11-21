package qaboard;

import java.io.IOException;

import freeboard.FreeboardDAO;
import freeboard.FreeboardDTO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.JSFunction;

@WebServlet("/qawrite.do")
public class QAWriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		if(session.getAttribute("UserId")==null) {
			JSFunction.alertLocation(resp, "로그인 후 이용해주세요.", "./login.do");
			return;
		}
		//로그인이 완료된 상태라면 쓰기페이지를 포워드한다.
		req.getRequestDispatcher("./qawrite.jsp")
			.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		if(session.getAttribute("UserId")==null) {
			JSFunction.alertLocation(resp, "로그인 후 이용해주세요.", "./login.do");
			return;
		}
		
		QAboardDTO dto = new QAboardDTO();
		//작성자 아이디는 session 영역에 저장된 데이터를 이용한다.
		dto.setId(session.getAttribute("UserId").toString());
		//제목과 내용등은 사용자가 전송한 폼값을 받은 후 저장한다.
		dto.setTitle(req.getParameter("title"));
		dto.setContent(req.getParameter("content"));
		dto.setQapass(req.getParameter("qapass"));
		
		QAboardDAO dao = new QAboardDAO();
		
		int result = dao.insertWrite(dto);
		if(result==1) { // 글쓰기 성공
			resp.sendRedirect("./qalist.do");
		}
		else { //글쓰기 실패
			//글쓰기 페이지로 다시 돌아간다
			JSFunction.alertLocation(resp, "글쓰기에 실패했습니다.", "./qawrite.do");
		}
	}
}
