<%-- 
    Document   : newjsp
    Created on : Feb 9, 2017, 10:15:01 AM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<%@include file ="dbconnect.jsp" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <%
            dbconnect d = new dbconnect("voting_system");
            d.setStatement("select * from candidates where userid = ? and password = ?");
            d.s.setString(1, request.getParameter("uname"));
            d.s.setString(2, request.getParameter("pwd"));
            ResultSet r = d.result();
            if(r.next()){%>
                        <center><h1>
            <%
                        
                        out.println("logged in");
                        d.setStatement("select image,votes from candidates where userid = ?");
                        d.s.setString(1, request.getParameter("uname"));
                        ResultSet rs = d.result();
                        rs.next();%>
                        <br>
                        <%
                        out.println("Votes-"+rs.getInt("votes"));
                        %>
                        <br>
                        <%do{%>
                        <img src="<%=rs.getString("image") %>" width="500" height="500"/>
                        <%}while(rs.next());
                    %>
                        </h1>
                        </center>
                    <%
                    }else{
                        out.println("wrong userid or password");
                    } 
            %>
    </body>
</html>
