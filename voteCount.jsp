<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <meta charset="UTF-8">
  <title><Table> Responsive</title>
  
  
  
      <link rel="stylesheet" href="css/style.css">

  
</head>
<body onload="noBack();"
onpageshow="if(event.persisted) noBack();" onunload="">
<script type="text/javascript">
	window.history.forward();
	function noBack() {window.history.forward()}
	</script>
<%
String s3 =(String)session.getAttribute("s2");
session.setAttribute("s3", s3);
System.out.println(s3);
	
	
	String radio=request.getParameter("vote");
	
	System.out.println("radio button name==>"+radio);

	
	    	
	    Class.forName("oracle.jdbc.driver.OracleDriver");
	     Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","system");
		System.out.println("Connected..!!! welcome page");
		 Statement sts=con.createStatement();
		//ResultSet rss=sts.executeQuery("select * from candidate"); 
		PreparedStatement pst,pst1;
		
	
			
		
	 		
		
						//if(radio.equals("83"))
						//{
							
							
							 pst=con.prepareStatement("update candidate set vote=vote+1 where party=?");
							
						//	 pst.setInt(1, 83);
							 pst.setString(1, radio);
							
							 pst.executeUpdate();
							
							
							
							
							
							 System.out.println("Added************************************************");
					
					//	}
	
	
		 	 		
						
							 ResultSet rs=sts.executeQuery("update user1 set voting=1 where enrollment="+s3);
						
						
						
						
						
						
						 System.out.println("Added************************************************");
				
					
		

							


	
	%>	
	<script type="text/javascript">
	window.history.forward();
	function noBack() {window.history.forward()}
	</script>
 <h1></span> <span class="yellow">THANKS FOR VOTING</pan></h1>
    
     <tr><td><a href="image1.html"><font color="yellow">HOME</form><br></td></tr>	 
    

</body>
</html>