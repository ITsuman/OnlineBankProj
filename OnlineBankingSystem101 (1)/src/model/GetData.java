package model;

import java.sql.*;

public class GetData {
	static Connection cn=null;
	static String url="jdbc:oracle:thin:@localhost:1521:xe";
	static String user="debolina";
	static String pass="debolina";
	public static Connection GetConnection(){
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			cn=DriverManager.getConnection(url,user,pass);
		}catch(Exception e){
			System.out.println(e);
		}return cn;
	}
}
