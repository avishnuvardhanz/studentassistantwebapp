<%@page import="Database.DatabaseFile"%>
<%@page import="java.sql.*" %>
<%@page  session="true" %>
<%
try
{
   
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    

    session.setAttribute("x", username);
   
    int count = 0;
    

    try
    {
         
        if( ((username!=null) && (!username.trim().equals(""))) && ((password!=null) && (!password.trim().equals(""))))
        {
            ResultSet rs = null;

            String sql = "SELECT * FROM userinfo "
                    + " WHERE UserName = '"+username+"' and  Password = '"+password+"'";

        
            DatabaseFile obj = new DatabaseFile();
            rs = obj.codeselect(sql);

            while(rs.next())
            {
                count = rs.getInt(1);
              
               
                 %>
                 <jsp:forward page="userprofile.jsp"></jsp:forward>
                 <%
            }    
                                          
           rs.close();
                 %>
                 <jsp:forward page="index.jsp">
                     <jsp:param name="msg" value="Incorrect Username or Password"/>
                 </jsp:forward>
                 <%           
        }
        else
        {
             
                 %>
                 <jsp:forward page="index.jsp">
                     <jsp:param name="msg" value="Please Fill Username or Password"/>
                 </jsp:forward>
                 <%
        }
    }
    catch(Exception e)
    {
          e.printStackTrace();     
    }
    
}
catch(Exception e)
{
    e.printStackTrace();
}
%>
