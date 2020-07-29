<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head>
  <meta charset="UTF-8">
  <title><Table> Responsive</title>
  
  
  
      <link rel="stylesheet" href="css/style.css">

  
</head>

<body>

    <h1></span> <span class="yellow">Candidate</pan></h1>


<table class="container">
	<thead>
		<tr>
			<th><h1><font color="yellow">USERID</h1></th>
			<th><h1><font color="yellow">NAME OF CANDIDATE</h1></th>
			<th><h1><font color="yellow">PARTY</h1></th>
			<th><h1><font color="yellow">EMAIL</h1></th>
		</tr>
	</thead>
	   
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="insert.jsp" method="post">


                
    <%!int no,newno;
    String kname,myparty,lname;
    %>
    <%!String newname,newCanName,myemail; %>
    <%
   
    	
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
myemail=rss.getString(4);
%>


      <tr>   
         <td><%=no %></td>
       <td> <%=kname %><%=lname %></td>
         <td> <%=myparty%></td>
         <td> <%=myemail%></td>
         
    
   	
 
	    
  </tr>
    
    



	<%
	
	}
	%>

	<tr><td><a href=searchcandidate.html Method=post><b> <i><font color="#F08080"> SEARCH<br></a></td>
	<td><a href=updatecandidate.html Method=post><b> <i><font color="#F08080"> UPDATE</td>
	<td><a href=finish.jsp Method=post><b> <i><font color="#F08080"> BACK</td>
	<td><a href=deletecandidate.html Method=post><b> <i><font color="#F08080"> DELETE</td></tr>


	</table>

	
	<tr>
    <td><center><form action="" value="submit" Name="vote"></center><td>	
	</tr>
	
   	
</form>
</body>
</html>