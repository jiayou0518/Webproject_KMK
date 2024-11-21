package freeboard;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.JSFunction;

@WebServlet("/fbdelete.do")
public class fbDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		if(session.getAttribute("UserId")==null) {
			JSFunction.alertLocation(resp, "로그인 후 이용해주세요.", "./login.do");
			return;
		}
		
		//게시물 얻어오기 : 열람에서 사용한 메서드를 그대로 사용한다
		String idx = req.getParameter("idx");
		FreeboardDAO dao = new FreeboardDAO();
		FreeboardDTO dto = dao.selectView(idx);
		
		/*
		작성자 본인 확인 : DTO에 저장된 아이디와 session영역에 저장된 아이디를 비교하여 본인이 아니라면
			경고창을 띄운다 
		 */
		if(!dto.getId().equals(session.getAttribute("UserId")
				.toString())) {
			JSFunction.alertBack(resp, "작성자 본인만 삭제할 수 있습니다.");
			return;
		}
		
				
		
		int result = dao.deletepost(idx);
		dao.close();
		if(result==1) { //게시물 삭제 성공 시 첨부파일도 삭제
		
		JSFunction.alertLocation(resp, "삭제되었습니다.", "./fblist.do");
		}
	}
}
