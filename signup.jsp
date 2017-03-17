<%-- 
    Document   : signup
    Created on : Feb 11, 2017, 11:14:56 AM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="dbconnect.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/voting_system","root","");
                    String fname =  request.getParameter("fname");
                    String lname =  request.getParameter("lname");
                    String dob =  request.getParameter("dob");
                    String email = request.getParameter("email");
                    String dpt =  request.getParameter("dpt");
                    String pname = request.getParameter("pname");
                    String uname = request.getParameter("uname");
                    String pwd = request.getParameter("pwd");
                    String mobile_no = request.getParameter("mobile");
                    Statement st = conn.createStatement();
                    
                    int i = st.executeUpdate("insert into candidates(first_name, last_name, date_of_birth, email, party_name,department,userid, password,mobile_no,votes) values ('"+fname+"','"+lname+"','"+dob+"','"+email+"','"+dpt+"','"+pwd+"','"+uname+"','"+pname+"','"+mobile_no+"',0)");
                    if(i>0){
                    %>
                    <h1>Signed up successfully</h1>
                    <%}
else{%>
<h1>Error</h1>
<%}
                    %>
    </body>
</html>
