package qaboard;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.BoardPage;

@WebServlet("/qalist.do")
public class QAListController extends HttpServlet{
	public static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		QAboardDAO dao = new QAboardDAO();
		
		Map<String,Object> map = new HashMap<String, Object>();
		
		
				String searchField = req.getParameter("searchField");
				String searchWord = req.getParameter("searchWord");
				if(searchWord != null) {
					map.put("searchField",searchField);
					map.put("searchWord", searchWord);
				}
				
				int totalCount = dao.selectCount(map);
				ServletContext application = getServletContext();
				int pageSize = Integer.parseInt(
						application.getInitParameter("POSTS_PER_PAGE"));
				int blockPage = Integer.parseInt(
						application.getInitParameter("PAGES_PER_BLOCK"));
				int pageNum =1;
				String pageTemp = req.getParameter("pageNum");
				if(pageTemp!=null && !pageTemp.equals(""))
					pageNum = Integer.parseInt(pageTemp);
				
				//목록에 출력할 게시물 범위 계산
				int start = (pageNum-1)*pageSize+1;
				int end = pageNum * pageSize;
				//DAO로 전달하기 위해 Map에 저장
				map.put("start", start);
				map.put("end", end);
				List<QAboardDTO> boardLists = dao.selectListPage(map);
				dao.close();
				
				//뷰에 전달할 매개변수 추가
				//목록 하단에 출력할 페이지 바로가기 링크를 얻어온 후 Map에 추가
				String pagingImg = BoardPage.pagingStr(totalCount, 
						pageSize, blockPage, pageNum, "./qalist.do");
				map.put("pagingImg", pagingImg);
				map.put("totalCount", totalCount);
				map.put("PageSize", pageSize);
				map.put("pageNum", pageNum);
				
				//전달할 데이터를 request 영역에 저장 후 View로 포워드
				req.setAttribute("boardLists", boardLists);
				req.setAttribute("map", map);
				req.getRequestDispatcher("./qalist.jsp").forward(req, resp);
	}
	
}
