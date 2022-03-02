package myModel;

public class MyMember {
	String myid, mypasswd,myname,mytel,myemail,mypicture;
	int mygender;
	
	public MyMember(String myid, String mypasswd, String myname,
			int mygender, String mytel, String myemail, String mypicture) {
		
		super();
		this.myid=myid;
		this.mypasswd = mypasswd;
		this.myname = myname;
		this.mygender = mygender;
		this.mytel = mytel;
		this.myemail = myemail;
		this.mypicture = mypicture;
		
		
	}

	public String getMyid() {
		return myid;
	}

	public void setMyid(String myid) {
		this.myid = myid;
	}

	public String getMypasswd() {
		return mypasswd;
	}

	public void setMypasswd(String mypasswd) {
		this.mypasswd = mypasswd;
	}

	public String getMyname() {
		return myname;
	}

	public void setMyname(String myname) {
		this.myname = myname;
	}

	public String getMytel() {
		return mytel;
	}

	public void setMytel(String mytel) {
		this.mytel = mytel;
	}

	public String getMyemail() {
		return myemail;
	}

	public void setMyemail(String myemail) {
		this.myemail = myemail;
	}

	public String getMypicture() {
		return mypicture;
	}

	public void setMypicture(String mypicture) {
		this.mypicture = mypicture;
	}

	public int getMygender() {
		return mygender;
	}

	public void setMygender(int mygender) {
		this.mygender = mygender;
	}

	@Override
	public String toString() {
		return "MyMember [myid=" + myid + ", mypasswd=" + mypasswd + ", myname=" + myname + ", mytel=" + mytel
				+ ", myemail=" + myemail + ", mypicture=" + mypicture + ", mygender=" + mygender + "]";
	}
	
	
	
	
	
	


}
