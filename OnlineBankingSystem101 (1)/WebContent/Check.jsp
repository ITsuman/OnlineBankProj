<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="model.GetData"%>
<%@page import="java.sql.Connection"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Global Bank</title>
<style type="text/css">
#c{
background-color: #d3e4ff;
}
.nav{
background-color: #c0cee5;
color: black;
text align:center;
padding: 20px 0 20px 0;
}
.nav >li{
display: inline-block;
padding:0 25px 0 25px; 
}
.nav > li > a{
text-decoration: none;
color: #ffffff;
}
.nav > li >a:hover{
color: silver;
}
</style>

<script type="text/javascript">

</script>
</head>
<body id="c">
<%
	
	session=request.getSession(false);
	String acc1=(String)session.getAttribute("acc");
	if(acc1==null)
	{
		 //RequestDispatcher rd=request.getRequestDispatcher("Home.jsp");
		 //rd.include(request,response);
		
		 response.sendRedirect("./Home.jsp");
	}
%>
<table  width="100%" height="50%" >
<tr><th height="50" width="50%" align="left" ><b><Font color="navy" ><font size="5"><img alt="" src="eb8.png" height="80px" width="160px"><i>...With us,You're sure</i></Font></b></th>
<th align="right" ><font color="navy" size="4px">Call Us At : 1800 3500 7896 <br><a href="Adminlogin.html">ADMIN</a></font></th>
</tr>
</table>

<ul class="nav">
<li><a href="Customer.jsp">Home</a></li>
<li><a href="Check.jsp">Check Balance</a></li>
<li><a href="Transfer.jsp">Transfer</a>
<li><a href="DD.jsp">DD Request</a>
<li><a href="Status.jsp">Request Status</a>
<li><a href="C_logout">log out</a>
</ul>

<p style="background-color: rgba(0,0,0,0.2);width: 100%;height: 40px;border-style: dotted; font-size: 22px;color: white;padding: 10px 0px 10px 0px;text-align: center;">
<%
	try{
		Connection con=GetData.GetConnection();
		session=request.getSession(false);
		String acc3=(String)session.getAttribute("acc");
		String sql1="select balance from balance where account_number=?";
		PreparedStatement ps=con.prepareStatement(sql1);
		ps.setString(1, acc3);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
		{
			out.println("Your Account Balance is  "+rs.getString(1));
		}
	}catch(Exception e){
		System.out.print(e);
	}
%>
</p>
<table align="center">
<tr><th style="padding-left: 35px;">Particulars</th><th style="padding-left: 35px;">Date</th>
<th style="padding-left: 35px;">Credit</th><th style="padding-left: 35px;">Debit</th>
<th style="padding-left: 35px;">Balance</th></tr>
<%
try{
	Connection con=GetData.GetConnection();
	session=request.getSession(false);
	String acc2=(String)session.getAttribute("acc");
	String sql="select * from account where account_number=?";
	PreparedStatement ps=con.prepareStatement(sql);
	ps.setString(1, acc2);
	ResultSet rs=ps.executeQuery();
	while(rs.next())
	{
%>
<tr><td style="padding-left: 35px;padding-top: 15px;"><%= rs.getString(6) %></td><td style="padding-left: 35px; padding-top: 15px;"><%= rs.getString(5) %></td>
<td style="padding-left: 35px;padding-top: 15px;"><%= rs.getString(3) %></td>
<td style="padding-left: 35px;padding-top: 15px;"><%= rs.getString(4) %></td>
<td style="padding-left: 35px;padding-top: 15px;"><%= rs.getString(2) %></td></tr>
<%
	}
}catch(Exception e){
	System.out.println(e);
	
}
%>
</table>
</body>
</html>