package myController;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import kic.mskim.MskimRequestMapping;
import kic.mskim.RequestMapping;
import myModel.MyBoard;
import myService.MyBoardDao;


@WebServlet("/myBoard/*")
public class MyBoardController extends MskimRequestMapping {
	
	
	@RequestMapping("myList")
	public String myList(HttpServletRequest request, HttpServletResponse response) {
		
		String myboardid = "";
		int mypageInt = 1;
		int mylimit = 5;

		//myboardid 게시판 여러개 관리 
		HttpSession session = request.getSession();
		if(request.getParameter("myboardid")!=null) {
			session.setAttribute("myboardid", request.getParameter("myboardid"));
			session.setAttribute("mypageNum", "1");
		}
		myboardid = (String)session.getAttribute("myboardid");

		if(myboardid == null) {
			myboardid = "1";
		}



		//mypageNum이 파라미터로 넘어왔을때는 세션으로 저장하기 ---> 글 입력하고 현재 페이지로 오게 하는 것 
		if(request.getParameter("mypageNum")!= null) {
			session.setAttribute("mypageNum", request.getParameter("mypageNum"));
		}
		String mypageNum = (String)session.getAttribute("mypageNum");
		if(mypageNum==null) {
			mypageNum="1";
		}
		mypageInt = Integer.parseInt(mypageNum);




		MyBoardDao mbd = new MyBoardDao();
		int countmyboard = mbd.countMyBoard(myboardid);


		List<MyBoard> list1 = mbd.myBoardList(mypageInt,mylimit,countmyboard,myboardid);

		int myboardnum = countmyboard - mylimit*(mypageInt-1); 
		/*
		1p -- 1 ~ 5
		2p -- 6 ~ 10
		3p -- 11 ~ 15 
		*/
		int mybottomLine = 5;
		int mystartPage = (mypageInt-1)/mybottomLine * mybottomLine + 1 ; //1,6,11
		int myendPage = mystartPage + mybottomLine -1; //5,10,15
		int mymaxPage = (countmyboard/mylimit) + (countmyboard % mylimit ==0? 0:1);
		if(myendPage > mymaxPage) myendPage = mymaxPage;


		String myboardName="공지사항";
		switch(myboardid) {
		case "3": myboardName="QnA"; break;
		case "2": myboardName= "자유게시판"; break;

		}
		
		
		request.setAttribute("myboardName", myboardName);
		request.setAttribute("myboardid", myboardid);
		request.setAttribute("mypageInt", mypageInt);
		request.setAttribute("myboardnum", myboardnum);
		request.setAttribute("countmyboard", countmyboard);
		request.setAttribute("mystartPage", mystartPage);
		request.setAttribute("mybottomLine", mybottomLine);
		request.setAttribute("myendPage", myendPage);
		request.setAttribute("mymaxPage", mymaxPage);
		request.setAttribute("list1", list1);
		
		
		
		return "/myView/myBoard/myList.jsp";  //${list}
		}
	
	
	
	
	@RequestMapping("myWriteForm")
	public String myWriteForm(HttpServletRequest request, HttpServletResponse response) {

		return "/myView/myBoard/myWriteForm.jsp";
	}
	
	
	@RequestMapping("myWritePro")
	public String myWritePro(HttpServletRequest request, HttpServletResponse response) {

		String mypath = request.getServletContext().getRealPath("/")+"/myboardupload/";
		int mysize = 10*1024*1024;
		MultipartRequest multi1 = null ;
		try {
			multi1 = new MultipartRequest(request,mypath,mysize,"UTF-8");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		MyBoard mb = new MyBoard();

		mb.setMywriter(multi1.getParameter("mywriter"));
		mb.setMypass(multi1.getParameter("mypass"));
		mb.setMysubject(multi1.getParameter("mysubject"));
		mb.setMycontent(multi1.getParameter("mycontent"));
		mb.setMyfile1(multi1.getFilesystemName("myfile1"));
		mb.setMyip(request.getLocalAddr());



		HttpSession session = request.getSession();
		String myboardid = (String)session.getAttribute("myboardid");
		if(myboardid==null) {
			myboardid = "1";
		}
		mb.setMyboardid(myboardid);

		MyBoardDao mbd = new MyBoardDao();



		//새 게시글인 경우 
		mb.setMynum(mbd.nextMyNum());


		//ref==num으로 만들기
		mb.setMyref(mb.getMynum());

		int num1 = mbd.insertMyBoard(mb);

		String msg = "게시물 등록 실패ㅠㅠ";
		String url = request.getContextPath()+"/myBoard/myWriteForm";
		if(num1 ==1) {
			msg = "게시물 등록 성공";
			url = request.getContextPath()+"/myBoard/myList";
		}




		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "/myView/myAlert.jsp";
	}
	
	
	@RequestMapping("myBoardInfo")
	public String myBoardInfo(HttpServletRequest request, HttpServletResponse response) {

		int mynum = Integer.parseInt(request.getParameter("mynum"));
		MyBoardDao mbd = new MyBoardDao();
		MyBoard mb = mbd.selectMyBoard(mynum); //원래 것 가져오기
		mbd.readMyCountUp(mynum); //조회수

		//myboardid 게시판 여러개 관리
		HttpSession session = request.getSession();
		String myboardid ="";
		if(request.getParameter("myboardid")!=null) {
			session.setAttribute("myboardid", request.getParameter("myboardid"));
			session.setAttribute("mypageNum", "1");
		}
		myboardid = (String)session.getAttribute("myboardid");

		if(myboardid == null) {
			myboardid = "1";
		}
		String myboardName="공지사항";
		switch(myboardid) {
		case "3": myboardName="QnA"; break;
		case "2": myboardName= "자유게시판"; break;

		}
		request.setAttribute("myboardName", myboardName);
		request.setAttribute("mb", mb);
		return "/myView/myBoard/myBoardInfo.jsp";
	}
	
	@RequestMapping("myBoardUpdateForm")
	public String myBoardUpdateForm(HttpServletRequest request, HttpServletResponse response) {

		int mynum = Integer.parseInt(request.getParameter("mynum"));
		MyBoardDao mbd = new MyBoardDao();
		MyBoard mb = mbd.selectMyBoard(mynum);
		request.setAttribute("mb", mb);
		
		return "/myView/myBoard/myBoardUpdateForm.jsp";
	}
	
	
	@RequestMapping("myBoardUpdatePro")
	public String myBoardUpdatePro(HttpServletRequest request, HttpServletResponse response) {

		String mypath = request.getServletContext().getRealPath("/")+"/myboardupload/";
		int mysize = 10*1024*1024;
		MultipartRequest multi1 = null;
		try {
			multi1 = new MultipartRequest(request,mypath,mysize,"UTF-8");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		MyBoard mb = new MyBoard();

		mb.setMynum(Integer.parseInt(multi1.getParameter("mynum")));
		mb.setMypass(multi1.getParameter("mypass"));
		mb.setMysubject(multi1.getParameter("mysubject"));
		mb.setMycontent(multi1.getParameter("mycontent"));
		mb.setMyfile1(multi1.getFilesystemName("myfile1"));

		MyBoardDao mbd = new MyBoardDao();

		if(mb.getMyfile1()==null || mb.getMyfile1().equals(""))	 {
			mb.setMyfile1(multi1.getParameter("myfile2"));
		}

		MyBoard m = mbd.selectMyBoard(mb.getMynum());

		String msg = "비밀번호가 다릅니다";
		String url = request.getContextPath()+"/myBoard/myBoardUpdateForm?mynum="+mb.getMynum();

		//비번이 같으면 수정가능 
		if (mb.getMypass().equals(m.getMypass())) {
			if(mbd.updateMyBoard(mb)>0) {
				msg="수정완료";
				url = request.getContextPath()+"/myBoard/myBoardInfo?mynum="+mb.getMynum();
			} else {
				msg = "수정실패";
			}
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
	return "/myView/myAlert.jsp";
	}
	
	
	@RequestMapping("myBoardReplyForm")
	public String myBoardReplyForm(HttpServletRequest request, HttpServletResponse response) {
	
		int mynum = Integer.parseInt(request.getParameter("mynum"));
		MyBoardDao mbd = new MyBoardDao();
		MyBoard mb = mbd.selectMyBoard(mynum);//원래의 것 가져오기 
		
		request.setAttribute("mb", mb);
		return "/myView/myBoard/myBoardReplyForm.jsp";
	}
	
	
	
	@RequestMapping("myBoardReplyPro")
	public String myBoardReplyPro(HttpServletRequest request, HttpServletResponse response) {
	
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}


		MyBoardDao mbd = new MyBoardDao();
		MyBoard mb = new MyBoard();

		mb.setMywriter(request.getParameter("mywriter"));
		mb.setMypass(request.getParameter("mypass"));
		mb.setMysubject(request.getParameter("mysubject"));
		mb.setMycontent(request.getParameter("mycontent"));
		mb.setMyfile1("");
		mb.setMyip(request.getLocalAddr());



		//boardid 
		HttpSession session = request.getSession();
		String myboardid = (String)session.getAttribute("myboardid");
		if(myboardid == null){
			myboardid ="1";
		}
		mb.setMyboardid(myboardid);


		int mynum = Integer.parseInt(request.getParameter("mynum"));
		int myref = Integer.parseInt(request.getParameter("myref"));
		int myreflevel = Integer.parseInt(request.getParameter("myreflevel"));
		int myrefstep = Integer.parseInt(request.getParameter("myrefstep"));


		String msg = "답변 오류발생";
		String url = request.getContextPath()+"/myBoard/myBoardReplyForm?mynum="+mynum;

		mbd.myrefStepAdd(myref, myrefstep);

		mb.setMynum(mbd.nextMyNum());
		mb.setMyref(myref);
		mb.setMyreflevel(myreflevel+1);
		mb.setMyrefstep(myrefstep+1);

		if(mbd.insertMyBoard(mb) > 0) {
			msg = "답변 등록 완료";
			url = request.getContextPath()+"/myBoard/myList";
		
	}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "/myView/myAlert.jsp";
	}
	
	
	@RequestMapping("myBoardDeleteForm")
	public String myBoardDeletForm(HttpServletRequest request, HttpServletResponse response) {
		
		int mynum = Integer.parseInt(request.getParameter("mynum"));
		request.setAttribute("mynum", mynum);
		return "/myView/myBoard/myBoardDeleteForm.jsp";
	
	}
	
	

	@RequestMapping("myBoardDeletePro")
	public String myBoardDeletPro(HttpServletRequest request, HttpServletResponse response) {
	
		int mynum = Integer.parseInt(request.getParameter("mynum"));
		String mypass = request.getParameter("mypass");
		MyBoardDao mbd = new MyBoardDao();
		MyBoard mb = mbd.selectMyBoard(mynum);

		String msg = "비밀번호가 다릅니다";
		String url = request.getContextPath()+"/myBoard/myBoardDeleteForm?mynum="+mynum;

		if(mypass.equals(mb.getMypass())){//비번이 같으면 
			if(mbd.deleteMyBoard(mynum)>0) {
				msg = "게시글이 삭제되었습니다";
			} else {
				msg = "게시글 삭제가 실패하였습니다";
			}

			url = request.getContextPath()+"/myBoard/myList";
		}


		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "/myView/myAlert.jsp";
	}
	
}
