<%-- 
    Document   : vlogin
    Created on : Feb 22, 2017, 9:39:26 PM
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
            d.setStatement("select * from signed_up where userid = ? and password = ?");
            d.s.setString(1, request.getParameter("uname"));
            d.s.setString(2, request.getParameter("pwd"));
            ResultSet r = d.result();
            if(r.next()){%>
                        <center><h1>
                                <%          boolean valid = r.getBoolean("valid");
                                if(!valid){
                                    out.println("Vote given already");
                                    return;
                                }
                        out.println("logged in");
                        d.setStatement("select * from candidates order by id asc");
                        ResultSet rs = d.result();
                        %>
                            </h1>
                        <center>
                            <table border="1" cellpadding="5" cellspacing="5">
                                <tr>
                                    <th>ID</th>
                                    <th>Name of the candidate</th>
                                    <th>Party name</th>
                                </tr>
                                <%while(rs.next()){%>
                                <tr>
                                    <td><%out.println(rs.getInt("id")); %></td>
                                    <td><%out.println(rs.getString("first_name")+" "+rs.getString("last_name")); %></td>
                                    <td><%out.println(rs.getString("party_name")); %></td>
                                </tr>
                                <%}%>
                            </table><br>
                            <h1>Enter the ID of the candidate you want to vote</h1>
                            <form action="votegiven.jsp" method="post">
                                <input type="password" name="vote">
                                <input type="submit">
                            </form>
                        </center>
                    <% 
                        %> 
                    <%
                    }else{%>
                    <center> <h1>   
                            <%
                        out.println("wrong userid or password");
                    } 
            %>
                        </h1>
                    </center>
    </body>
</html>
