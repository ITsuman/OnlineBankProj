<!DOCTYPE html>
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


<ul class="nav">
<li><a href="Customer.jsp">Home</a></li>
<li><a href="Check.jsp">Check Balance</a></li>
<li><a href="Transfer.jsp">Transfer</a>
<li><a href="DD.jsp">DD Request</a>
<li><a href="Status.jsp">Request Status</a>
<li><a href="C_logout">log out</a>
</ul>

<form action="Transfer" method="post">
<table align="center">
<tr><td>Beneficiary's name</td><td> <input type="text" name="bname"></td></tr>
<tr><td>Transfer To(Acc No.) </td><td> <input type="text" name="accno"></td></tr>
<tr><td>Amount </td><td> <input type="text" name="amm"></td></tr>
<tr><td>Date</td><td> <input type="date" name="date"></td></tr>
<tr><td colspan="2" align="right"><input type="submit" value="Okk"></td></tr>
</table>


</form>
</body>

</html>