package myController;

import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kic.mskim.MskimRequestMapping;
import kic.mskim.RequestMapping;
import myModel.MyBoard;
import myService.MyBoardDao;


@WebServlet("/myBoard/*")
public class MyBoardController extends MskimRequestMapping {
	
	
	@RequestMapping("myList")
	public String myList(HttpServletRequest request, HttpServletResponse response) {
		
		MyBoardDao mbd = new MyBoardDao();
		int countmyboard = mbd.countMyBoard("1");

		List<MyBoard> list1 = mbd.myBoardList(1, 10, countmyboard,"1");
		
		request.setAttribute("list1", list1);
		return "/view/board/list2.jsp";  //${list}
		}
	
	
	
}
