<!DOCTYPE html>
<%@page import="java.io.PrintWriter"%>
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
</head>
<body id="c">
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
<div style="width: 15%;background-color: rgba(0,0,0,0.1);border-bottom-color: white;padding-top: 15px;float: left;padding-right: 20px;height: auto;">
<ul>
<i><font size="6px;">DD Nos.</font></i>
<br>
<hr>
<%
	try{
		session=request.getSession(false);
		String acc2=(String)session.getAttribute("acc");
		Connection cn=GetData.GetConnection();
		String sql="select dd_no from demanddraft where account_number=?";
		PreparedStatement ps=cn.prepareStatement(sql);
		ps.setString(1, acc2);
		ResultSet rs=ps.executeQuery();
		while(rs.next()){
%>
<li><%= rs.getString(1) %></li>
<%}
	}catch(Exception e){
		System.out.println(e);
	}
%>
</ul>
</div>
<div style="width: 30%;float: left;padding-left: 70px;">
<table>
<form action="Status" >
	<tr><td>Enter the DD no: </td><td><input type="text" name="dd"></td><td><input type="submit" value="Ok"></td></tr>
	<tr></tr>
</form>
</table>
</div>	
</body>

</html>