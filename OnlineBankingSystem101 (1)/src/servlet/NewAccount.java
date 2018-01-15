package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.GetData;

/**
 * Servlet implementation class NewAccount
 */
@WebServlet("/NewAccount")
public class NewAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			Connection cn=GetData.GetConnection();
			int acc=(int)(Math.random()*1000000);
			int loop=1;
			while(loop==1){
			String sql0="select account_number from account where account_number=?";
			PreparedStatement ps0=cn.prepareStatement(sql0);
			ps0.setInt(1, acc);
			ResultSet rs0=ps0.executeQuery();
			if(rs0.next()){
				loop=1;
			}else{
				loop=0;
			}
			}
			Date now=new Date();
			String d=now.toString(); 
			PrintWriter pw=response.getWriter();
			
		String sql5="select email from customer where email=?";
		PreparedStatement ps5=cn.prepareStatement(sql5);
		ps5.setString(1, request.getParameter("e_name"));
		ResultSet res5=ps5.executeQuery();
		if(res5.next()){
			RequestDispatcher rd=request.getRequestDispatcher("NewCustomer.html");
			rd.include(request, response);
			pw.println("Email Already Exist...");
		}else{
			String sql="insert into customer values(?,?,?,?,?,?)";
			
			
			
			
			
			
			PreparedStatement ps=cn.prepareStatement(sql);
			ps.setInt(1, acc);
			ps.setString(2,request.getParameter("c_name"));
			ps.setString(3,request.getParameter("e_name"));
			ps.setString(4,request.getParameter("ph_name"));
			ps.setString(5,request.getParameter("a_name"));
			ps.setString(6,request.getParameter("p_name"));
			ps.execute();
			String sql1="insert into account values(?,?,?,?,?,?)";
			PreparedStatement ps1=cn.prepareStatement(sql1);
			ps1.setInt(1, acc);
			ps1.setInt(2,0);
			ps1.setInt(3,0);
			ps1.setInt(4,0);
			ps1.setString(5,d);
			ps1.setString(6,"Account Opened");
			ps1.execute();
			String sql2="insert into balance values(?,?)";
			PreparedStatement ps2=cn.prepareStatement(sql2);
			ps2.setInt(1,acc);
			ps2.setInt(2, 0);
			ps2.execute();
			
			
			RequestDispatcher rd=request.getRequestDispatcher("NewCustomer.html");
			rd.include(request, response);
			pw.println("Your Account Number is  "+acc);
		}
	}catch(Exception e){
		System.out.println(e);
	}

}
}