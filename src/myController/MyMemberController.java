package myController;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

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
			url = request.getContextPath()+"/myMember/myMain";
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
	
	@RequestMapping("myMain")
	public String myMain(HttpServletRequest request, HttpServletResponse response) {
		return "/myView/myMain.jsp";
	}//메인페이지
	
	@RequestMapping("myLogout")
	public String myLogout(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String curlog = (String)session.getAttribute("mymemberId");
		request.getSession().invalidate();
		
		String msg = curlog+"님이 로그아웃되었습니다!";
		String url = request.getContextPath()+"/myMember/myLoginForm";
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "/myView/myAlert.jsp";
	}//로그아웃
	
	
	@RequestMapping("myDeleteForm")
	public String myDeleteForm(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String curlog = (String)session.getAttribute("mymemberId");
		//로그인이 안되면
		String msg = "로그인을 먼저 해주세요";
		String url = request.getContextPath()+"/myMember/myLoginForm";

		if(curlog != null && !curlog.trim().equals("") ) { //로그인이 되면
			request.setAttribute("curlog", curlog);
			return "/myView/myMember/myDeleteForm.jsp";
			
			
		}
			request.setAttribute("msg", msg);
			request.setAttribute("url", url);
		return "/myView/myAlert.jsp";
		
	} //회원탙퇴
	

	
	@RequestMapping("myDeletePro")
	public String myDeletePro(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String curlog = (String)session.getAttribute("mymemberId");
		
		//로그인이 안되면
		String msg = "로그인을 먼저 해주세요";
		String url = request.getContextPath()+"/myMember/myLoginForm";
		
		if(curlog != null && !curlog.trim().equals("")) {// 로그인이 되면 
			String mypasswd = request.getParameter("mypasswd");
			
			MyMemberDao mmd = new MyMemberDao();
			MyMember mm = mmd.selectMyOne(curlog);
			
			if(mm.getMypasswd().equals(mypasswd)) { // 비번도 같으면
				int num1 = mmd.deleteInfo(curlog); //탈퇴하기
				
				if(num1 == 0) { //삭제 오류발생시
					msg = curlog+ "님 탈퇴 오류 발생";
					url = request.getContextPath()+"/myMember/myMain";
				} else { //삭제 성공시 
					session.invalidate(); //로그아웃시키기
					msg = curlog+"님 탈퇴되었습니다";
					url =request.getContextPath()+"/myMember/myMain";
				}
			} else { //비번 다르면
			msg = "비밀번호가 다릅니다";
			url = request.getContextPath()+"/myMember/myDeleteForm";
		 }
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "/myView/myAlert.jsp";	
	} //회원탈퇴 완료
	
	
	@RequestMapping("myMemberUpdate") 
	public String myMemberUpdate(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String curlog = (String)session.getAttribute("mymemberId");
		//로그인이 안되면 
		String msg = "로그인이 필요합니다";
		String url = request.getContextPath()+"/myMember/myLoginForm";
		
		//로그인이 되면
		if(curlog != null && !curlog.trim().equals("")) {
			MyMemberDao mmd = new MyMemberDao();
			MyMember mm = mmd.selectMyOne(curlog);
			request.setAttribute("m", mm);
			return "/myView/myMember/myMemberUpdate.jsp";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "/myView/myAlert.jsp";
	} //회원정보 수정
	
	@RequestMapping("myMemberUpdatePro")
	public String myMemberUpdatePro(HttpServletRequest request, HttpServletResponse response) {
		
		
		
		HttpSession session = request.getSession();
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String curlog = (String)session.getAttribute("mymemberId");
		int num1 = 0;
		//수정 못할때 
		String msg = "비밀번호가 다릅니다. 확인 후 다시 입력하세요";
		String url = request.getContextPath() +"/myMember/myMemberUpdate";
		
		//로그인 안될때
		if(curlog == null || curlog.trim().equals("")) { //로그인 정보가 없을때
			msg = "로그인이 필요합니다";
			url = request.getContextPath()+"/myMember/myLoginForm";
			
		 } else { 
			String mytel = request.getParameter("mytel");
			String myemail = request.getParameter("myemail");
			String mypicture = request.getParameter("mypicture");
			String mypasswd = request.getParameter("mypasswd");
			
			MyMemberDao mmd = new MyMemberDao();
			MyMember mm = mmd.selectMyOne(curlog);
			System.out.println(mm);
			mm.setMytel(mytel);
			mm.setMyemail(myemail);
			mm.setMypicture(mypicture);
			
			
			if(mm.getMypasswd().equals(mypasswd)) {
				
				num1 = mmd.updateInfo(mm);
				msg ="회원정보 수정되었습니다";
				url = request.getContextPath()+"/myMember/myMain";
			} 
			}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "/myView/myAlert.jsp";
	} //회원정보 수정완료
	
	@RequestMapping("myPasswdForm") 
	public String myPasswdForm(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String curlog = (String)session.getAttribute("mymemberId");
		//로그인이 안되면 
		String msg = "로그인이 필요합니다";
		String url = request.getContextPath()+"/myMember/myLoginForm";
		
		//로그인이 되면
		if(curlog != null && !curlog.trim().equals("")) {
			request.setAttribute("curlog", curlog);
			return "/myView/myMember/myPasswdForm.jsp";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "/myView/myAlert.jsp";
	} //비밀번호 수정
	
	
	
	@RequestMapping("myPasswdPro") 
	public String myPasswdPro(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String curlog = (String)session.getAttribute("mymemberId");
		//로그인이 안되면 
		String msg = "로그인이 필요합니다";
		String url = request.getContextPath()+"/myMember/myLoginForm";
		
		//로그인이 되면
		if(curlog != null && !curlog.trim().equals("")) {
			
			MyMemberDao mmd = new MyMemberDao();
		 	MyMember mm = mmd.selectMyOne(curlog);
		 	String mypasswd = request.getParameter("mypasswd");
		 	String mypasswd_new = request.getParameter("mypasswd_new");
		 
		 if(mypasswd.equals(mm.getMypasswd())) {
			  int num = mmd.newPasswd(curlog, mypasswd_new);
			 if(num > 0 ) {
				 msg= "비밀번호가 수정되었습니다";
				 url = request.getContextPath()+"/myMember/myMain";
			 } else { 
				 msg = "비밀번호 변경 오류가 발생되었습니다";
				 url = request.getContextPath()+"/myMember/myMain";
			 }
		 } else {
			 msg="비밀번호가 현재 비밀번호와 다릅니다";
			 url = request.getContextPath() +"/myMember/myPasswdForm";
		 }
		 
		 
	} 
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "/myView/myAlert.jsp";
	} //비밀번호 수정완료
	
	
	@RequestMapping("myPictureForm")
	public String myPictureForm(HttpServletRequest request, HttpServletResponse response) {
		return "/mySingle/myPictureForm.jsp";
		
	} //사진 수정
	
	
	@RequestMapping("myPicturePro")
	public String myPicturePro(HttpServletRequest request, HttpServletResponse reponse) {
		
		String mypath = request.getServletContext().getRealPath("/")+"myUpload/";
		String myfilename = null;

		MultipartRequest multi1 = null;
		try {
			multi1 = new MultipartRequest(request, mypath, 10*1024*1024, "utf-8");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		myfilename =  multi1.getFilesystemName("mypicture");
		request.setAttribute("myfilename", myfilename);
		
		return "/mySingle/myPicturePro.jsp";
	} // 사진 수정완료 
	
	
	@RequestMapping("readmyId")
	public String readmyId(HttpServletRequest request, HttpServletResponse response) {
		
		String myid = request.getParameter("myid");

		if(myid == null) {
			myid ="";
		}

		MyMemberDao mmd = new MyMemberDao();
		MyMember mm = mmd.selectMyOne(myid);
		String mychk = mm == null? "false":"true";
		
		request.setAttribute("mychk", mychk);
		return "/mySingle/readmyId.jsp";
	}
	
	
	
	
}