package myModel;

import java.sql.Date;

public class MyBoard {
	private int mynum;
	private String mywriter;
	private String mypass;
	private String mysubject;
	private String mycontent;
	private String myfile1;
	private String myboardid;
	private Date myregdate;
	private String myip;
	private int myreadcnt;
	private int myref;
	private int myreflevel;
	private int myrefstep;
	
	
	public MyBoard() {
		
	}


	public MyBoard(int mynum, String mywriter, String mypass, String mysubject, String mycontent, String myfile1,
			String myboardid, Date myregdate, String myip, int myreadcnt, int myref, int myreflevel, int myrefstep) {
		super();
		this.mynum = mynum;
		this.mywriter = mywriter;
		this.mypass = mypass;
		this.mysubject = mysubject;
		this.mycontent = mycontent;
		this.myfile1 = myfile1;
		this.myboardid = myboardid;
		this.myregdate = myregdate;
		this.myip = myip;
		this.myreadcnt = myreadcnt;
		this.myref = myref;
		this.myreflevel = myreflevel;
		this.myrefstep = myrefstep;
	}


	public int getMynum() {
		return mynum;
	}


	public void setMynum(int mynum) {
		this.mynum = mynum;
	}


	public String getMywriter() {
		return mywriter;
	}


	public void setMywriter(String mywriter) {
		this.mywriter = mywriter;
	}


	public String getMypass() {
		return mypass;
	}


	public void setMypass(String mypass) {
		this.mypass = mypass;
	}


	public String getMysubject() {
		return mysubject;
	}


	public void setMysubject(String mysubject) {
		this.mysubject = mysubject;
	}


	public String getMycontent() {
		return mycontent;
	}


	public void setMycontent(String mycontent) {
		this.mycontent = mycontent;
	}


	public String getMyfile1() {
		return myfile1;
	}


	public void setMyfile1(String myfile1) {
		this.myfile1 = myfile1;
	}


	public String getMyboardid() {
		return myboardid;
	}


	public void setMyboardid(String myboardid) {
		this.myboardid = myboardid;
	}


	public Date getMyregdate() {
		return myregdate;
	}


	public void setMyregdate(Date myregdate) {
		this.myregdate = myregdate;
	}


	public String getMyip() {
		return myip;
	}


	public void setMyip(String myip) {
		this.myip = myip;
	}


	public int getMyreadcnt() {
		return myreadcnt;
	}


	public void setMyreadcnt(int myreadcnt) {
		this.myreadcnt = myreadcnt;
	}


	public int getMyref() {
		return myref;
	}


	public void setMyref(int myref) {
		this.myref = myref;
	}


	public int getMyreflevel() {
		return myreflevel;
	}


	public void setMyreflevel(int myreflevel) {
		this.myreflevel = myreflevel;
	}


	public int getMyrefstep() {
		return myrefstep;
	}


	public void setMyrefstep(int myrefstep) {
		this.myrefstep = myrefstep;
	}


	@Override
	public String toString() {
		return "MyBoard [mynum=" + mynum + ", mywriter=" + mywriter + ", mypass=" + mypass + ", mysubject=" + mysubject
				+ ", mycontent=" + mycontent + ", myfile1=" + myfile1 + ", myboardid=" + myboardid + ", myregdate="
				+ myregdate + ", myip=" + myip + ", myreadcnt=" + myreadcnt + ", myref=" + myref + ", myreflevel="
				+ myreflevel + ", myrefstep=" + myrefstep + "]";
	}
	
	
	
	
	
	
}//end class

