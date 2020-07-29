<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

  <meta charset="UTF-8">
 
  
      <link rel="stylesheet" href="css/style.css">

  
</head>



	   
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body onload="noBack();"
onpageshow="if(event.persisted) noBack();" onunload="" >
<script type="text/javascript">
	window.history.forward();
	function noBack() {window.history.forward()}
	</script>
<form action="voteCount.jsp" method="post">

<%

String s2= (String)session.getAttribute("s1");
session.setAttribute("s2", s2);
String newotp=request.getParameter("otp");
String oldotp=(String)session.getAttribute("os");
//int oldotp=(Integer)session.getAttribute("os");
System.out.println(newotp);
System.out.println(oldotp);


if(oldotp.equals(newotp)){%>



    <h1></span> <span class="yellow">Candidate</pan></h1>
	<meta charset="UTF-8">
  <title><Table> Responsive</title>
	<link rel="stylesheet" href="css/style.css">
<table class="container">
	<thead>
		<tr>
			<th><h1>CANDIDATE ID</h1></th>
			<th><h1>NAME OF CANDIDATE</h1></th>
			<th><h1>PARTY</h1></th>
			<th><h1>VOTE</h1></th>
		</tr>
	</thead><% 
 %>   
<%!int no,newno;
String kname,myparty,lname;
%>
<%!String newname,newCanName; %>
<%
try{

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection co=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
System.out.println("Connected..!!! welcome page");
Statement sts=co.createStatement();
ResultSet rss=sts.executeQuery("select * from candidate"); 

//String newname=(String)request.getAttribute("name");
//String yasir=request.getParameter("name");


//out.println(yasir);
while(rss.next()){

%>
<% no=rss.getInt(1);

kname=(String)rss.getString(2);
lname=(String)rss.getString(3);

myparty=rss.getString(5);
%>


<tr>   
<td><%=no %></td>
<td> <%=kname%><%=lname %></td>
<td> <%=myparty%></td>


	<td><input type="radio" name="vote" value="<%=myparty%>"><br></td>


</tr>


<%




}






/*rss.close();
sts.close();
co.close();*/
}

catch(Exception e){
}


%></table>


<tr>
<td><center><input type="submit" value="submit" Name="vote"></center><td>	
</tr>

<%out.println("otp is  matched");}	

else
{
	out.println( "otp is not matched plzz try again");
	response.sendRedirect("login.html");%>
	<script type="text/javascript">
    alert('<%="Entered OTP is not valid...try again"%>');
</script>


<tr><td><a href="login.html"> login</form><br></td></tr>
<tr><td><a href="finish.jsp">Finish</form><br></td></tr>
<% 

}%>
	</table>
	</body>
</html>
    



