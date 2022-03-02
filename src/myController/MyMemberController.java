package myController;

import java.io.UnsupportedEncodingException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kic.mskim.MskimRequestMapping;
import kic.mskim.RequestMapping;
import myModel.MyMember;
import myService.MyMemberDao;



@WebServlet("/myMember/*")
public class MyMemberController extends  MskimRequestMapping {

	@RequestMapping("myMemberInput")
	public String myMemberInput(HttpServletRequest request, HttpServletResponse response) {
		
		return "/myView/myMember/myMemberInput.jsp";  
		} //회원가입

	@RequestMapping("myMemberPro")
	public String myMemberPro(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		MyMemberDao mmd = new MyMemberDao();
		String myname = request.getParameter("myname");
		int num1 = mmd.insertmyMember1(request);
		String msg = "";
		String url = "";

		if (num1 > 0) {
			msg = myname+"님의 가입이 완료되었습니다 :) ";
			url = request.getContextPath()+"/myMember/myLoginForm";
		} else {
			msg = "회원가입이 실패하였습니다 ㅠㅠ";
			url = request.getContextPath()+"/myMain";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "/myView/myAlert.jsp";
		
	} //회원가입 확인
	
	@RequestMapping("myLoginForm")
	public String myLoginForm(HttpServletRequest request, HttpServletResponse response) {
		return "/myView/myMember/myLoginForm.jsp";
	} //로그인
	
	@RequestMapping("myLoginPro")
	public String myLoginPro(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String myid = request.getParameter("myid");
		String mypasswd = request.getParameter("mypasswd");

		MyMemberDao mmd = new MyMemberDao();

		MyMember mm = mmd.selectMyOne(myid);

		String msg = "아이디를 확인하세요";
		String url = request.getContextPath()+"/myMember/myLoginForm";

		if(mm != null) {
			if(mypasswd.equals(mm.getMypasswd())) {
				request.getSession().setAttribute("mymemberId", myid);
				msg = mm.getMyname()+"님 로그인되었습니다";
				url = request.getContextPath() +"/myView/myMain.jsp";
				 
			} else {
				msg ="비밀번호가 다릅니다.";
			}
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "/myView/myAlert.jsp";
	}//로그인 확인
	
	@RequestMapping("myLogout")
	public String myLogout(HttpServletRequest request, HttpServletResponse response) {
		String curlog = (String)request.getSession().getAttribute("mymemberId");
		request.getSession().invalidate();
		
		String msg = curlog+"님이 로그아웃되었습니다!";
		String url = request.getContextPath()+"/myMember/myLoginForm";
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "/myView/myAlert.jsp";
	}

	
}
