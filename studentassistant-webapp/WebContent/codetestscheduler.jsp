<%@page import="java.sql.ResultSet"%>
<%@page import="Database.DatabaseFile"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN" dir="ltr">
    <head profile="http://gmpg.org/xfn/11">
        <title>Time Table Task</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <meta http-equiv="imagetoolbar" content="no" />
        <link rel="stylesheet" href="styles/layout.css" type="text/css" />
        <%@page errorPage="ErrorPage.jsp"%>
        <%@page session="true" %>        
        <link href="styles/jquery-ui.css" rel="stylesheet" type="text/css"/>
        <script src="scripts/jquery-1.5.js"></script>
        <script src="scripts/jquery-ui-1.8.17.custom.min.js"></script>
         <script type="text/javascript">
               $(function() {
                       $("#datepicker").datepicker({ dateFormat: "yy-mm-dd" }).val()
               });
         </script>
         <script type="text/javascript">
               $(function() {
                       $("#datepicker1").datepicker({ dateFormat: "yy-mm-dd" }).val()
               });
         </script>
    </head>
    <body id="top">
        <div class="wrapper row1">
            <div id="header" class="clear">
                <div class="fl_left">
                    <h1><a href="index.jsp">Time Table Task</a></h1>
                    <p>Information System
                        <span style="padding-left: 250px; color: red;"> Welcome : <%=session.getAttribute("x")%></span>
                    </p>
                </div>
                <div class="fl_right">
                    
                </div>
            </div>
        </div>
        <!-- ####################################################################################################### -->
        <div class="wrapper row2">
            <div class="rnd">
                <!-- ###### -->
                <div id="topnav">
                    <ul>
                        <li><a href="userprofile.jsp">USER PROFILE</a></li>
                        <li><a href="teacherprofile.jsp">ADD TEACHER PROFILE</a></li>
                        <li><a href="viewteacherprofile.jsp">VIEW TEACHER'S PROFILE</a></li> 
                        <li><a href="gentimetable.jsp">GENERATE TIME TABLE</a></li>   
                        <li><a href="viewtimetable.jsp">VIEW TIME TABLE</a></li>
                        <li class="last"><a href="Signout.jsp">Sign Out</a></li>
                    </ul>
                </div>
                <!-- ###### -->
            </div>
        </div>
        <!-- ####################################################################################################### -->
        <div class="wrapper row3">
            <div class="rnd">
                <div id="container" class="clear">
                    <!-- ####################################################################################################### -->
                 
                  <h1>Test Schedule Time Table</h1>
                   
                  <form action="codetestscheduler.jsp" method="post">
                    
                  <table align="center" border="0px" width="100px">

                      <tr>
                      <td>Teacher Name</td>
                      <td><select name="name" style="width:340px;">       
                               <option value="-select-">-select-</option>
                              <%
                              try
                              {
                                  ResultSet rs = null;

                                  String sql = "SELECT teacherid, FullName FROM teacherinfo";

                                  DatabaseFile obj = new DatabaseFile();

                                  rs = obj.codeselect(sql);

                                  while(rs.next())
                                  {
                                      %>
                                      <option value="<%=rs.getString(2)%>"><%=rs.getString(2)%></option>
                                      <%
                                  }
                                rs.close();

                              }
                              catch(Exception e)
                              {
                              e.printStackTrace();    
                              }
                              %>
                          </select>
                      </td>
                  </tr>
                          
                  <tr>
                    <td>Term:</td><td><input type="text" name="term" size="54px"/></td>
                  </tr>
                  
                  <tr>
                    <td>Test No:</td><td><input type="text" name="testno" size="54px"/></td>
                  </tr>
                 
                  <tr >
                      <td>Sections</td>
                      <td><select name="sections" style="width:340px;">  
                             <option value="-select-">-select-</option>
                              <%
                              try
                              {
                                  ResultSet rs = null;

                                  String sql = "SELECT * FROM sections";

                                  DatabaseFile obj = new DatabaseFile();

                                  rs = obj.codeselect(sql);

                                  while(rs.next())
                                  {
                                      %>
                                      <option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
                                      <%
                                  }
                                rs.close();

                              }
                              catch(Exception e)
                              {
                              e.printStackTrace();    
                              }
                              %>
                          </select>
                      </td>
                  </tr>
                      
                 <tr>
                  <td>Grades</td>
                  <td><select name="grades" style="width:340px;">  
                           <option value="-select-">-select-</option>
                          <%
                          try
                          {
                              ResultSet rs = null;
                              
                              String sql = "SELECT * FROM grade";
                              
                              DatabaseFile obj = new DatabaseFile();
                              
                              rs = obj.codeselect(sql);
                              
                              while(rs.next())
                              {
                                  %>
                                  <option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
                                  <%
                              }
                                                              rs.close();

                          }
                          catch(Exception e)
                          {
                          e.printStackTrace();    
                          }
                          %>
                      </select>
                  </td>
                      
                  </tr>
                      
                  <tr >
                      <td>Subjects</td>
                      <td><select name="subjects" style="width:340px;">     
                              <option value="-select-">-select-</option>
                              <%
                              try
                              {
                                  ResultSet rs = null;

                                  String sql = "SELECT * FROM subject";

                                  DatabaseFile obj = new DatabaseFile();

                                  rs = obj.codeselect(sql);

                                  while(rs.next())
                                  {
                                      %>
                                      <option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
                                      <%
                                  }
                                rs.close();

                              }
                              catch(Exception e)
                              {
                              e.printStackTrace();    
                              }
                              %>
                          </select>
                      </td>
                  </tr>
                  
                  <tr>
                    <td>From Date:</td><td><input type="text" id="datepicker" name="datepicker" size="54px"/></td>
                  </tr>
                          
                  <tr>
                    <td>To Date:</td><td><input type="text" id="datepicker1" name="datepicker1" size="54px"/></td>
                  </tr>
                         
                  <tr>
                      <td>&nbsp;</td>
                      <td><input type="submit" value="Submit"/><input type="reset" value="Reset"/></td>
                  </tr>
              
                  </table>
                         
                   <br/>
                   
                   <h1>Available Test Schedule For Particular Subject.</h1>
                          
                    <%
                        try
                        {
                            if((!request.getParameter("name").equalsIgnoreCase("-select-")) 
                                    && (!request.getParameter("sections").equalsIgnoreCase("-select-")) 
                                    && (!request.getParameter("grades").equalsIgnoreCase("-select-"))
                                    && (!request.getParameter("subjects").equalsIgnoreCase("-select-"))
                                    && ((request.getParameter("term") != null) && (!request.getParameter("term").equalsIgnoreCase("")) && (!request.getParameter("term").equalsIgnoreCase("")))
                                    && ((request.getParameter("testno") != null) && (!request.getParameter("testno").equalsIgnoreCase("")) && (!request.getParameter("testno").equalsIgnoreCase("")))
                                    && ((request.getParameter("datepicker") != null) && (!request.getParameter("datepicker").equalsIgnoreCase("")) && (!request.getParameter("datepicker").equalsIgnoreCase("")))
                                    && ((request.getParameter("datepicker1") != null) && (!request.getParameter("datepicker1").equalsIgnoreCase("")) && (!request.getParameter("datepicker1").equalsIgnoreCase("")))
                                    )
                             {
                                 int g = 1;
                             
                                 out.println("<table border='2px' align='center'>");
                                 out.println("<tr>");
                                 out.println("<th>Sno</th>");
                                 out.println("<th>Day</th>");                
                                 out.println("<th>8 to 9 am</th>");
                                 out.println("<th>9 to 10 am</th>");
                                 out.println("<th>10 to 11 am</th>");
                                 out.println("<th>11 to 12 am</th>");                                
                                 out.println("<th>01 to 02 pm</th>"); 
                                 out.println("<th>02 to 03 pm</th>"); 
                                 out.println("<th>03 to 04 pm</th>");                                                                                                                                                                                                   
                                 out.println("</tr>");
                                 
                                 DatabaseFile objDatabaseFile = new DatabaseFile();

                                 String sql11 = "SELECT sectionsname "
                                                        + "FROM sections "
                                                        + "WHERE sectionid = '"+request.getParameter("sections").toString().trim()+"'";

                                 ResultSet rs11 = objDatabaseFile.codeselect(sql11);

                                 String section = "";
                                 
                                 while (rs11.next()) 
                                 {
                                      section = rs11.getString("sectionsname");              
                                 }
                                 rs11.close();
                                 
                                 String sql = "SELECT * FROM timetable_"+section+" WHERE Grade="+request.getParameter("grades").toString().trim();

                                 System.out.println(sql);
                                 
                                 ResultSet rs = objDatabaseFile.codeselect(sql);
                            
                                 while(rs.next())
                                 {      
                                    String s1 = rs.getString("8_9");
                                    String s2 = rs.getString("9_10");
                                    String s3 = rs.getString("10_11");
                                    String s4 = rs.getString("11_12");
                                    String s5 = rs.getString("1_2");
                                    String s6 = rs.getString("2_3");
                                    String s7 = rs.getString("3_4");                                   
                                                     
                                     String sql1 = "SELECT subjectid, subjectname "
                                                        + "FROM subject "
                                                        + "WHERE subjectid = '"+s1+"'";

                                                ResultSet rs1 = objDatabaseFile.codeselect(sql1);

                                                while (rs1.next()) 
                                                {
                                                    if(request.getParameter("subjects").toString().trim().equalsIgnoreCase(rs1.getString("subjectid")))
                                                    {                                                        
                                                        s1 = rs1.getString("subjectname");                                                    
                                                    }
                                                    else
                                                    {
                                                        s1 = "-";
                                                    }
                                                }
                                                
                                                rs1.close();

                                                String sql2 = "SELECT subjectid, subjectname "
                                                        + "FROM subject "
                                                        + "WHERE subjectid = '"+s2+"'";

                                                ResultSet rs2 = objDatabaseFile.codeselect(sql2);

                                                while (rs2.next()) 
                                                {
                                                    if(request.getParameter("subjects").toString().trim().equalsIgnoreCase(rs2.getString("subjectid")))
                                                    {  
                                                         s2 = rs2.getString("subjectname");
                                                    }
                                                    else
                                                    {
                                                        s2 = "-";
                                                    }
                                                }
                                                
                                                rs2.close();

                                                String sql3 = "SELECT subjectid,  subjectname "
                                                        + "FROM subject "
                                                        + "WHERE subjectid = '"+s3+"'";

                                                ResultSet rs3 = objDatabaseFile.codeselect(sql3);

                                                while (rs3.next()) 
                                                {
                                                    if(request.getParameter("subjects").toString().trim().equalsIgnoreCase(rs3.getString("subjectid")))
                                                    {  
                                                        s3 = rs3.getString("subjectname");
                                                    }
                                                    else
                                                    {
                                                        s3 = "-";
                                                    }
                                                }

                                                rs3.close();

                                                String sql4 = "SELECT subjectid, subjectname "
                                                        + "FROM subject "
                                                        + "WHERE subjectid = '"+s4+"'";

                                                ResultSet rs4 = objDatabaseFile.codeselect(sql4);

                                                while (rs4.next()) 
                                                {
                                                    if(request.getParameter("subjects").toString().trim().equalsIgnoreCase(rs4.getString("subjectid")))
                                                    {  
                                                        s4 = rs4.getString("subjectname");
                                                    }
                                                    else
                                                    {
                                                        s4 = "-";
                                                    }
                                                }

                                                rs4.close();

                                                String sql5 = "SELECT subjectid, subjectname "
                                                        + "FROM subject "
                                                        + "WHERE subjectid = '"+s5+"'";

                                                ResultSet rs5 = objDatabaseFile.codeselect(sql5);

                                                while (rs5.next()) 
                                                {
                                                    if(request.getParameter("subjects").toString().trim().equalsIgnoreCase(rs5.getString("subjectid")))
                                                    {  
                                                        s5 = rs5.getString("subjectname");
                                                    }
                                                    else
                                                    {
                                                        s5 = "-";
                                                    }
                                                }
                                            
                                                rs5.close();

                                                String sql6 = "SELECT subjectid, subjectname "
                                                        + "FROM subject "
                                                        + "WHERE subjectid = '"+s6+"'";

                                                ResultSet rs6 = objDatabaseFile.codeselect(sql6);

                                                while (rs6.next()) 
                                                {
                                                    if(request.getParameter("subjects").toString().trim().equalsIgnoreCase(rs6.getString("subjectid")))
                                                    {  
                                                        s6 = rs6.getString("subjectname");
                                                    }
                                                    else
                                                    {
                                                        s6 = "-";
                                                    }
                                                }

                                                rs6.close();

                                                String sql7 = "SELECT subjectid, subjectname "
                                                        + "FROM subject "
                                                        + "WHERE subjectid = '"+s7+"'";

                                                ResultSet rs7 = objDatabaseFile.codeselect(sql7);

                                                while (rs7.next()) 
                                                {
                                                    if(request.getParameter("subjects").toString().trim().equalsIgnoreCase(rs7.getString("subjectid")))
                                                    {  
                                                        s7 = rs7.getString("subjectname");
                                                    }
                                                    else
                                                    {
                                                        s7 = "-";
                                                    }
                                                }

                                              rs7.close();

                                     out.println("<tr><td>" + g++ + "</td><td>" 
                                             + rs.getString("Day") + "</td><td>" 
                                             + s1 + "</td><td>" 
                                             + s2 +  "</td><td>" 
                                             + s3 +  "</td><td>" 
                                             + s4 +  "</td><td>" 
                                             + s5 +  "</td><td>" 
                                             + s6 +  "</td><td>" 
                                             + s7 +  "</td>"                                                                                                                                 
                                             + "</tr>");
                                 }
                                
                                 out.println("</table>");                                                                 
                            }
                            else
                            {
                               %>
                                   <jsp:forward page="testscheduler.jsp">
                                       <jsp:param name="msg" value="Please Fill All Details"></jsp:param>               
                                   </jsp:forward>
                               <%
                            }
                        }
                        catch(Exception e)
                        {
                            e.printStackTrace();
                        }
                     %>
                     
                  </div>

                    <%
                        //getting response
                        try {
                            out.println("<font color = 'red'>");

                            if ((request.getParameter("msg") != null) && (!(request.getParameter("msg").trim().equals("")))) {
                                out.println(request.getParameter("msg"));
                            }

                            out.println("</font>");
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>                   
                </div>                
         </div>              
    </body>
</html>
