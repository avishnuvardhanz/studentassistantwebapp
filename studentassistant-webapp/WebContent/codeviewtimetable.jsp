<%@page import="java.sql.ResultSet"%>
<%@page import="Database.DatabaseFile"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN" dir="ltr">
    <head profile="http://gmpg.org/xfn/11">
        <title>Student Assistant</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <meta http-equiv="imagetoolbar" content="no" />
        <link rel="stylesheet" href="styles/layout.css" type="text/css" />
        <%@page errorPage="ErrorPage.jsp"%>
        <%@page session="true" %>
        	<script src="https://www.gstatic.com/firebasejs/8.6.1/firebase-app.js"></script>
				<script src="https://www.gstatic.com/firebasejs/8.6.1/firebase-auth.js"></script>
				<script src="https://www.gstatic.com/firebasejs/8.6.1/firebase-database.js"></script> 
    </head>
    <body id="top">
        <div class="wrapper row1">
            <div id="header" class="clear">
                <div class="fl_left">
                    <h1><a href="index.jsp">StudentAssistant</a></h1>
                    
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
                        <li class="active"><a href="viewtimetable.jsp">VIEW TIME TABLE</a></li>  
                      <li><a href="sharefile.jsp">SHAREFILE</a></li>   
                         <li><a href="viewfile.jsp">VIEWFILE</a></li>
                                    <li><a href="viewfbtime.jsp">VIEW UPLOADED TIMETABLE</a></li>                    
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
                    <h1>View Time Table</h1>
                   
                  <form action="codeviewtimetable.jsp" method="post">
                    
                  <table align="center" border="0px" width="100px">

                      <tr>
                      <td>Sections</td>
                      
                      <td><select name="sections" style="width:340px;">    
                               <option value="-select-">-select-</option>
                              <%
                              try
                              {
                                  ResultSet rs = null;

                                  String sql = "SELECT sectionid, sectionsname FROM sections";

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
                          
                  <tr >
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
                           
                  <tr>
                      <td>&nbsp;</td>
                      <td><input type="submit" value="Submit"/><input type="reset" value="Reset"/></td>
                  </tr>
              
                  </table>
                      
                  <br/>
                  <br/>
                  
                  <h1>View Teacher Time Table</h1>
                   
                  <form action="codeviewteachertimetable.jsp" method="post">
                    
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
                      <td>&nbsp;</td>
                      <td><input type="submit" value="Submit"/><input type="reset" value="Reset"/></td>
                  </tr>
                   
                  </table>
                          

                   <br/>
                   
                    

                 
                   
                  
                    <%
                        try
                        {
                            if((!request.getParameter("sections").equalsIgnoreCase("-select-")) && (!request.getParameter("grades").equalsIgnoreCase("-select-")))
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

                                 String sql = "SELECT * FROM timetable_"+request.getParameter("sections").toString().trim()+" WHERE Grade="+request.getParameter("grades").toString().trim();

                                 System.out.println(sql);
                                 
                                 DatabaseFile objDatabaseFile = new DatabaseFile();

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
                                                     
                                     String sql1 = "SELECT subjectname "
                                                        + "FROM subject "
                                                        + "WHERE subjectid = '"+s1+"'";

                                                ResultSet rs1 = objDatabaseFile.codeselect(sql1);

                                                while (rs1.next()) 
                                                {
                                                    s1 = rs1.getString("subjectname");
                                                }
                                                
                                                rs1.close();

                                                                                
                                                String sql2 = "SELECT subjectname "
                                                        + "FROM subject "
                                                        + "WHERE subjectid = '"+s2+"'";

                                                ResultSet rs2 = objDatabaseFile.codeselect(sql2);

                                                while (rs2.next()) 
                                                {
                                                    s2 = rs2.getString("subjectname");
                                                }

                                                String sql3 = "SELECT subjectname "
                                                        + "FROM subject "
                                                        + "WHERE subjectid = '"+s3+"'";

                                                ResultSet rs3 = objDatabaseFile.codeselect(sql3);

                                                while (rs3.next()) 
                                                {
                                                    s3 = rs3.getString("subjectname");
                                                }

                                                rs3.close();

                                                String sql4 = "SELECT subjectname "
                                                        + "FROM subject "
                                                        + "WHERE subjectid = '"+s4+"'";

                                                ResultSet rs4 = objDatabaseFile.codeselect(sql4);

                                                while (rs4.next()) 
                                                {
                                                    s4 = rs4.getString("subjectname");
                                                }
                                                 
                                                rs4.close();

                                                String sql5 = "SELECT subjectname "
                                                        + "FROM subject "
                                                        + "WHERE subjectid = '"+s5+"'";

                                                ResultSet rs5 = objDatabaseFile.codeselect(sql5);

                                                while (rs5.next()) 
                                                {
                                                    s5 = rs5.getString("subjectname");
                                                }

                                                rs5.close();

                                                String sql6 = "SELECT subjectname "
                                                        + "FROM subject "
                                                        + "WHERE subjectid = '"+s6+"'";

                                                ResultSet rs6 = objDatabaseFile.codeselect(sql6);

                                                while (rs6.next()) 
                                                {
                                                    s6 = rs6.getString("subjectname");
                                                }

                                                rs6.close();

                                                String sql7 = "SELECT subjectname "
                                                        + "FROM subject "
                                                        + "WHERE subjectid = '"+s7+"'";

                                                ResultSet rs7 = objDatabaseFile.codeselect(sql7);

                                                while (rs7.next()) 
                                                {
                                                    s7 = rs7.getString("subjectname");
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
                                
                                 rs.close();

                                 out.println("</table>");
                             }
                        }
                        catch(Exception e)
                        {
                            e.printStackTrace();
                        }
                 
                       try
                        {
                            if(!request.getParameter("name").equalsIgnoreCase("-select-"))
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

                                String sql = "SELECT DISTINCT 8_9, 9_10, 10_11, 11_12, 1_2, 2_3, 3_4, Day FROM timetable_"+request.getParameter("name").toString().trim() +" GROUP BY Day";

                                 System.out.println(sql);
                                 
                                 DatabaseFile objDatabaseFile = new DatabaseFile();

                                 ResultSet rs = objDatabaseFile.codeselect(sql);
                            
                                 while(rs.next())
                                 {      
                                    String s1 = rs.getString("8_9").toString().trim().equalsIgnoreCase("0") ? "-" : rs.getString("8_9");
                                    String s2 = rs.getString("9_10").toString().trim().equalsIgnoreCase("0") ? "-" : rs.getString("9_10");
                                    String s3 = rs.getString("10_11").toString().trim().equalsIgnoreCase("0") ? "-" : rs.getString("10_11");
                                    String s4 = rs.getString("11_12").toString().trim().equalsIgnoreCase("0") ? "-" : rs.getString("11_12");
                                    String s5 = rs.getString("1_2").toString().trim().equalsIgnoreCase("0") ? "-" : rs.getString("1_2");
                                    String s6 = rs.getString("2_3").toString().trim().equalsIgnoreCase("0") ? "-" : rs.getString("2_3");
                                    String s7 = rs.getString("3_4").toString().trim().equalsIgnoreCase("0") ? "-" : rs.getString("3_4");                                  
                                                     
                                     String sql1 = "SELECT subjectname "
                                                        + "FROM subject "
                                                        + "WHERE subjectid = '"+s1+"'";

                                                ResultSet rs1 = objDatabaseFile.codeselect(sql1);

                                                while (rs1.next()) 
                                                {
                                                    s1 = rs1.getString("subjectname");
                                                }

                                                rs1.close();

                                                String sql2 = "SELECT subjectname "
                                                        + "FROM subject "
                                                        + "WHERE subjectid = '"+s2+"'";

                                                ResultSet rs2 = objDatabaseFile.codeselect(sql2);

                                                while (rs2.next()) 
                                                {
                                                    s2 = rs2.getString("subjectname");
                                                }

                                                rs2.close();
                                                                                
                                                String sql3 = "SELECT subjectname "
                                                        + "FROM subject "
                                                        + "WHERE subjectid = '"+s3+"'";

                                                ResultSet rs3 = objDatabaseFile.codeselect(sql3);

                                                while (rs3.next()) 
                                                {
                                                    s3 = rs3.getString("subjectname");
                                                }
                                                
                                                rs3.close();


                                                String sql4 = "SELECT subjectname "
                                                        + "FROM subject "
                                                        + "WHERE subjectid = '"+s4+"'";

                                                ResultSet rs4 = objDatabaseFile.codeselect(sql4);

                                                while (rs4.next()) 
                                                {
                                                    s4 = rs4.getString("subjectname");
                                                }

                                                rs4.close();

                                                String sql5 = "SELECT subjectname "
                                                        + "FROM subject "
                                                        + "WHERE subjectid = '"+s5+"'";

                                                ResultSet rs5 = objDatabaseFile.codeselect(sql5);

                                                while (rs5.next()) 
                                                {
                                                    s5 = rs5.getString("subjectname");
                                                }

                                                rs5.close();

                                                String sql6 = "SELECT subjectname "
                                                        + "FROM subject "
                                                        + "WHERE subjectid = '"+s6+"'";

                                                ResultSet rs6 = objDatabaseFile.codeselect(sql6);

                                                while (rs6.next()) 
                                                {
                                                    s6 = rs6.getString("subjectname");
                                                }

                                                rs6.close();

                                                String sql7 = "SELECT subjectname "
                                                        + "FROM subject "
                                                        + "WHERE subjectid = '"+s7+"'";

                                                ResultSet rs7 = objDatabaseFile.codeselect(sql7);

                                                while (rs7.next()) 
                                                {
                                                    s7 = rs7.getString("subjectname");
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
                        }
                        catch(Exception e)
                        {
                            e.printStackTrace();
                        }
                    %>
                    </form></form></form>
                    <label>UPLOAD CLASS</label> 
                    <select name="Uploadto" id="group1" style="width:150px;">                        
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
                                  <option value="<%=rs.getString("gradename")%>"><%=rs.getString("gradename")%></option>
                                    
                                  
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
                      
   <label for="days"><b>DAY</b></label>
    <select name="days" id="day">
  <option value="monday">monday</option>
  <option value="tuesday">tuesday</option>
  <option value="wednesday">wednesday</option>
  <option value="thursday">thursday</option>
  <option value="friday">friday</option>
  <option value="saturday">saturday</option>
  <option value="sunday">sunday</option>
</select>

<br>
 <label for="time"><b>TIME</b></label>
   <select name="time" id="time">
     <option value="8.00 AM to 9.00 AM">8.00 to 9.00</option>
  <option value="9.00 AM to 10.00 AM">9.00 to 10.00</option>
  <option value="10.00 AM to 11.00 AM">10.00 to 11.00</option>
  <option value="11.00 AM to 12.00 PM">11.00 to 12.00</option>
  <option value="1.00 PM to 2.00 PM">1.00 to 2.00</option>
  <option value="2.00 PM to 3.00 PM">2.00 to 3.00</option>
    <option value="3.00 PM to 04.00 PM">3.00 to 4.00</option>

</select>
   </br>                     
    <label for="subject"><b>SUBJECT</b></label>
                      <select name="Uploadto" id="subname"  style="width:150px;">                        
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
                                  <option value="<%=rs.getString("subjectname")%>"><%=rs.getString("subjectname")%></option>
                                    
                                  
                                  <%
                             
                                  String hai="subjectid";
                              }
                              rs.close();
                          }
                          catch(Exception e)
                          {
                          e.printStackTrace();    
                          }
                          %>
                      </select>   
                     
                   
                         <label for="Teacher"><b>Teacher</b></label>
                           <select name="Uploadto" id="staff" style="width:150px;">                        
                          <%
                          try
                          {
                        	
                              ResultSet rs = null;
                          
                              String sql = "SELECT * FROM teacherinfo";
                              
                              DatabaseFile obj = new DatabaseFile();
                              
                              rs = obj.codeselect(sql);
                              
                              while(rs.next())
                              {
                                  %>
                                  <option value="<%=rs.getString("FullName")%>"><%=rs.getString("FullName")%></option>
                                    
                                  
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
                         	
 
         
        <label for="Room"><b>ROOM</b></label>
    <select name="room" id="hall">
  <option value="s1">s1</option>
  <option value="s2">s2</option>
  <option value="s3">s3</option>
  <option value="Lab_1">Lab_1</option>
  <option value="Lab_2">Lab_2</option>

</select>
               
       <button id="send" >send</button>                 
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
          
      <script>	 
			  // Your web app's Firebase configuration
			var firebaseConfig = {
		apiKey: "AIzaSyDBUt9s5Z3jZ7ZEVaHzcYTiRFnzvtE1qM0",
		authDomain: "classpweb-13af9.firebaseapp.com",
		databaseURL: "https://classpweb-13af9-default-rtdb.firebaseio.com",
		projectId: "classpweb-13af9",
		storageBucket: "classpweb-13af9.appspot.com",
		messagingSenderId: "930070330423",
		appId: "1:930070330423:web:d8bb3f1b64509fe13fd3b2"
	};
	// Initialize Firebase
	firebase.initializeApp(firebaseConfig);
			  var hallV,staffV,subnameV,timeV,groupV,dayV;
			  function Ready()
				{
				groupV =document.getElementById('group1').value;
				dayV =document.getElementById('day').value;
				hallV =document.getElementById('hall').value;
				staffV =document.getElementById('staff').value;
				subnameV =document.getElementById('subname').value;
				timeV =document.getElementById('time').value;
				}
				document.getElementById('send').onclick=function()
				{ 
				Ready();
				firebase.database().ref(groupV).child(dayV).push().set({hall: hallV,staff: staffV,subname: subnameV,time: timeV});
				}
			 
			  </script>              
                   
              
    </body>
</html>
