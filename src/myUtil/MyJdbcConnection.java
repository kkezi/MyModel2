package myUtil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MyJdbcConnection {

	public static Connection getConnection()	 {
		Connection con1 = null;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			 con1 = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","kic","1111");
			 System.out.println("ok db11");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("error db11");
			e.printStackTrace();
		}
		return con1; 
		
	
		}
		
	//나중에 닫아줄때 매번 익셉션 처리 안하기 위해서 close 만든다
	public static void close(Connection con1, PreparedStatement pstmt1, ResultSet rs1) {
	 try {
		 if(con1!=null) {
			 con1.commit();
			 con1.close();
		 }
		 if(pstmt1!=null) {
			 pstmt1.close();
		 }
		 if(rs1!=null) {
			 rs1.close();
		 }
	 } catch(SQLException e) {
		 e.printStackTrace();
		 
	 }


}
	
} //end class 
