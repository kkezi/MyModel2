package myService;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



import myModel.MyBoard;
import myUtil.MyJdbcConnection;


public class MyBoardDao {
	
	public int nextMyNum() {
		Connection con1 = MyJdbcConnection.getConnection();
		PreparedStatement pstmt1 = null;
		String mysql = "select myboardseq.nextval from dual";
		ResultSet rs1 = null;
		
		try {
			pstmt1 = con1.prepareStatement(mysql);
			rs1 = pstmt1.executeQuery();
			rs1.next();
			return rs1.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			MyJdbcConnection.close(con1, pstmt1, rs1);
		}
		return 0;
		
	}
	
	
	
	
	
	public int insertMyBoard(MyBoard mb) {
		
		
		System.out.println(mb);
		Connection con1 = MyJdbcConnection.getConnection();
		PreparedStatement pstmt1 = null;
		
		String mysql = "insert into myboard " + " values(?,?,?,?,?,?,?,sysdate,?,0,?,?,?)";
		
		try {
			pstmt1 = con1.prepareStatement(mysql);
			pstmt1.setInt(1, mb.getMynum());
			pstmt1.setString(2, mb.getMywriter());
			pstmt1.setString(3, mb.getMypass());
			pstmt1.setString(4, mb.getMysubject());
			pstmt1.setString(5, mb.getMycontent());
			pstmt1.setString(6, mb.getMyfile1());
			pstmt1.setString(7, mb.getMyboardid());
			pstmt1.setString(8, mb.getMyip());
			pstmt1.setInt(9, mb.getMyref());
			pstmt1.setInt(10, mb.getMyreflevel());
			pstmt1.setInt(11, mb.getMyrefstep());
			
			
			return pstmt1.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			MyJdbcConnection.close(con1, pstmt1, null);
		}
		
		return 0;
	}//end insert
	
	
	
	public int countMyBoard(String myboardid) {
		Connection con1 = MyJdbcConnection.getConnection();
		PreparedStatement pstmt1 = null;
		String mysql = "select count(*) from myboard where myboardid=?";
		ResultSet rs1 = null;
		
		try {
			pstmt1 = con1.prepareStatement(mysql);
			pstmt1.setString(1,myboardid);
			rs1 = pstmt1.executeQuery();
			rs1.next();
			
			return rs1.getInt(1);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			MyJdbcConnection.close(con1,pstmt1,rs1);
			
		}
		
		return 0;
	} //count메서드

	
	
	public List<MyBoard> myBoardList(int mypageInt, int mylimit, int countmyboard, String myboardid){
		Connection con1 = MyJdbcConnection.getConnection();
		PreparedStatement pstmt1 = null;
		ResultSet rs1 = null;
		List<MyBoard>  list1 = new ArrayList<MyBoard>();
		String mysql = "select * from ( "
				+ " select rownum rnum, b.*from ( "
				+ " select * from myboard where myboardid = ? "
				+ " order by myref desc, myrefstep asc) b) "
				+ " where rnum BETWEEN ? AND ? ";
		try {
			pstmt1 = con1.prepareStatement(mysql);
			pstmt1.setString(1, myboardid);
			pstmt1.setInt(2, (mypageInt-1)*mylimit+1);
			pstmt1.setInt(3, mypageInt*mylimit);
			rs1 = pstmt1.executeQuery();
			
			while(rs1.next()) {
				MyBoard mb = new MyBoard();
				mb.setMynum(rs1.getInt("mynum"));
				mb.setMywriter(rs1.getString("mywriter"));
				mb.setMypass(rs1.getString("mypass"));
				mb.setMysubject(rs1.getString("mysubject"));
				mb.setMycontent(rs1.getString("mycontent"));
				mb.setMyfile1(rs1.getString("myfile1"));
				mb.setMyref(rs1.getInt("myref"));
				mb.setMyrefstep(rs1.getInt("myrefstep"));
				mb.setMyreflevel(rs1.getInt("myreflevel"));
				mb.setMyreadcnt(rs1.getInt("myreadcnt"));
				mb.setMyregdate(rs1.getDate("myregdate"));
				list1.add(mb);
				
				
				
				
			}
			return list1;
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			MyJdbcConnection.close(con1,pstmt1,rs1);
		}
		
		
		
		return list1;
		
	}//end list메서드
	
	
	
	public MyBoard selectMyBoard(int mynum) {
		Connection con1 = MyJdbcConnection.getConnection();
		PreparedStatement pstmt1 = null;
		String mysql = "select * from myboard where mynum=?";
		ResultSet rs1 = null;
		
		try {
			pstmt1 = con1.prepareStatement(mysql);
			pstmt1.setInt(1,mynum);
			rs1 = pstmt1.executeQuery();
			while(rs1.next()) {
				MyBoard mb = new MyBoard();
						mb.setMynum(rs1.getInt("mynum"));
						mb.setMywriter(rs1.getString("mywriter"));
						mb.setMypass(rs1.getString("mypass"));
						mb.setMysubject(rs1.getString("mysubject"));
						mb.setMycontent(rs1.getString("mycontent"));
						mb.setMyfile1(rs1.getString("myfile1"));
						mb.setMyref(rs1.getInt("myref"));
						mb.setMyrefstep(rs1.getInt("myrefstep"));
						mb.setMyreflevel(rs1.getInt("myreflevel"));
						mb.setMyreadcnt(rs1.getInt("myreadcnt"));
						mb.setMyregdate(rs1.getDate("myregdate"));
						return mb;
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			MyJdbcConnection.close(con1,pstmt1,rs1);
			
		}
		
		return null;
	} //board select 메서드
	
	
	public int updateMyBoard(MyBoard mb) {
		Connection con1 = MyJdbcConnection.getConnection();
		PreparedStatement pstmt1 = null;
		
		String mysql = "update myboard set mysubject=?, mycontent=?, "
				+ " myfile1 =? where mynum= ? ";
		
		try {
			pstmt1 = con1.prepareStatement(mysql);
			pstmt1.setString(1, mb.getMysubject());
			pstmt1.setString(2, mb.getMycontent());
			pstmt1.setString(3, mb.getMyfile1());
			pstmt1.setInt(4, mb.getMynum());
			
			return pstmt1.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			MyJdbcConnection.close(con1, pstmt1, null);
		}
		
		
		
		return 0;
	} //update메서드
	
		public int deleteMyBoard(int mynum) {
			
			Connection con1 = MyJdbcConnection.getConnection();
			PreparedStatement pstmt1 = null;
			
			String mysql = "delete from myboard where mynum = ? ";
			
			try {
				pstmt1 = con1.prepareStatement(mysql);
				pstmt1.setInt(1, mynum);
				
				return pstmt1.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				MyJdbcConnection.close(con1, pstmt1, null);
			}
			
			
			return 0;
		}//delete
	
		public void readMyCountUp(int mynum) {
			
			Connection con1 = MyJdbcConnection.getConnection();
			PreparedStatement pstmt1 = null;
			String mysql ="update myboard set myreadcnt = myreadcnt + 1 where mynum =?";
			

			try {
				pstmt1 = con1.prepareStatement(mysql);

				pstmt1.setInt(1, mynum);
				 pstmt1.executeUpdate();
			
			} catch (SQLException e){
				e.printStackTrace();
			} finally {
				MyJdbcConnection.close(con1,pstmt1,null);
			}
			
		}//조회수 올리는 메서드
		
		
		
		public void myrefStepAdd(int myref, int myrefstep) {
			Connection con1 = MyJdbcConnection.getConnection();
			PreparedStatement pstmt1 = null;
			String mysql ="update myboard set myrefstep = myrefstep +1 where myref =? and myrefstep > ?";
			

			try {
				pstmt1 = con1.prepareStatement(mysql);
				pstmt1.setInt(1, myref);
				pstmt1.setInt(2, myrefstep);
				pstmt1.executeUpdate();
			
			} catch (SQLException e){
				e.printStackTrace();
			} finally {
				MyJdbcConnection.close(con1,pstmt1,null);
			}
			
		} //end 답글메서드
	
	
}//end class
