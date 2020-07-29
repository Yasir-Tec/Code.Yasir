-<%@page import="java.util.Properties"%>
<%@page import="java.util.Random"%>
<%@page import="javax.mail.*"%>
<%@ page import = "java.io.*"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@ page import = "javax.mail.internet.*"%>
<%@ page import = "javax.mail.AuthenticationFailedException.*"%>
<%@ page import = "javax.mail.Authenticator.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <meta charset="UTF-8">
  <title>Login Form</title>
  
  
  
      <link rel="stylesheet" href="css1/style.css">

</head>
<body onload="noBack();"
onpageshow="if(event.persisted) noBack();" onunload="" >
<script type="text/javascript">
	window.history.forward();
	function noBack() {window.history.forward()}
	</script>
<form action="verifyOTP.jsp" method="post">
<%
// public static void send(final String from,final String password,String to,String sub,String msg){


    String s1= (String)session.getAttribute("usr");	
    session.setAttribute("s1", s1);
	Random rand = new Random();
 	int otp = rand.nextInt(900) + 1000;
 	String s=Integer.toString(otp);
 	session.setAttribute("os",s);
 	final String mail=request.getParameter("email");
 	System.out.println("your email is :"+mail);

		final String from="yasirshaikhkhan4633@gmail.com";
    	final String password="MdYasir@1234#shaikh";
    	final String to=mail;
    	String sub="Voting System Verification...";
    	String msg="your otp is"+s;
    	
    	
    	System.out.println("your OTP is :"+s);
          //Get properties object    
          Properties props = new Properties();    
          props.put("mail.smtp.host", "smtp.gmail.com");    
          props.put("mail.smtp.socketFactory.port", "465");    
          props.put("mail.smtp.socketFactory.class",    
                    "javax.net.ssl.SSLSocketFactory");    
          props.put("mail.smtp.auth", "true");    
          props.put("mail.smtp.port", "465");    
          //get Session   
          
          Session mailSession = Session.getInstance(props, new Authenticator() {

        @Override

        protected PasswordAuthentication getPasswordAuthentication() {

            return new PasswordAuthentication(from, password);

        }

    });
          
          /*Session session3 = Session.getDefaultInstance(props,    
           new javax.mail.Authenticator() {    
           protected PasswordAuthentication getPasswordAuthentication() {    
           return new PasswordAuthentication(from,password);  
           }    
          });    */
          //compose message    
          //try {    
           MimeMessage message = new MimeMessage( mailSession);    
           message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));    
           message.setSubject(sub);    
           message.setText(msg);    
           //send message  
           Transport.send(message);    
           System.out.println("message sent successfully");    
         // } catch (MessagingException e) {throw new RuntimeException(e);
          //}    
       %>
         
          <div class="login">
  <div class="login-triangle"></div>
  
  <h2 class="login-header">ENTER OTP HERE</h2>

  <form class="login-container">
    <p><input type="text" name="otp" placeholder="OTP"  required pattern="[0-9]{4}" title="enter 4 digit otp"></p>
  
    <p><input type="submit" value="VERIFY"></p>
  </form>
</div>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
         


</form>

</body>
</html>