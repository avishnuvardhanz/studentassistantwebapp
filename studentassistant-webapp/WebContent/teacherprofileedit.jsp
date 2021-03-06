<%@page import="Database.*"%>
<%@page import="java.sql.*"%>
<%@page errorPage="ErrorPage.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="EN" lang="EN" dir="ltr">
<head profile="http://gmpg.org/xfn/11">
<title>StudentAssistant</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="styles/layout.css" type="text/css" />

<link href="styles/jquery-ui.css" rel="stylesheet" type="text/css"/>
<script src="scripts/jquery-1.5.js"></script>
<script src="scripts/jquery-ui-1.8.17.custom.min.js"></script>

 <script type="text/javascript">
       $(function() {
               $("#datepicker").datepicker({ dateFormat: "yy-mm-dd" }).val()
       });
 </script>

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
                        <li class="active"><a href="teacherprofile.jsp">ADD TEACHER PROFILE</a></li>
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
      <h1>Teacher Registration Form</h1>
      
      <form action="codeEdit.jsp" method="post">
                    
          <%
                        try
                        {
                             DatabaseFile objDatabaseFile = new DatabaseFile();
                                                       
                             if ((request.getParameter("index") != null) && (!(request.getParameter("index").trim().equals("")))) 
                             {
                                 String sql11 = "SELECT FullName, Age, Nationality, ContactNo, Address, PassportNo, PassportExpiryDate, VisaType, SchoolAccommodation, Tutor, Grade "
                                         + "FROM teacherinfo "
                                         + "WHERE teacherid = '"+request.getParameter("index")+"'";
                                 
                                ResultSet rs11 = objDatabaseFile.codeselect(sql11);
                            
                                while(rs11.next())
                                {          
                                   %>
                                  <table align="center" border="0px" width="100px">
              
                                  <tr >
                                      <td>Full Name:</td><td><input type="text" name="fullname" value="<%=rs11.getString(1)%>" size="54px"/></td>
                                  </tr>

                                  <tr >
                                      <td>Age:</td><td><input type="text" name="age" value="<%=rs11.getString(2)%>" size="54px"/></td>
                                  </tr>

                                  <tr >
                                      <td>Nationality:</td><td><input type="text" name="nationality" value="<%=rs11.getString(3)%>" size="54px"/></td>
                                  </tr>

                                  <tr >
                                      <td>Contact No:</td><td><input type="text" name="contactno" value="<%=rs11.getString(4)%>" size="54px"/></td>
                                  </tr>

                                  <tr >
                                      <td>Email:</td><td><input type="text" name="address" value="<%=rs11.getString(5)%>"  size="54px"/></td>
                                  </tr>

                                  <tr >
                                      <td>Subjects</td>
                                      <td><select name="subjects" multiple="multiple" style="width:340px;">                         
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

                                 <tr >
                                      <td>Grades</td>
                                      <td><select name="grades" multiple="multiple" style="width:340px;">                        
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
                                      <td>Sections</td>
                                      <td><select name="sections" multiple="multiple" style="width:340px;">                        
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

                                  <tr >
                                      <td>Designation:</td><td><input type="text" name="grade" value="<%=rs11.getString("Grade")%>" size="54px"/></td>
                                  </tr>
                                  
                                  <tr >
                                      <td>&nbsp;</td><td><input type="hidden" name="hide" value="<%=request.getParameter("index")%>" size="54px"/></td>
                                  </tr>

                                  <tr>
                                      <td>&nbsp;</td>
                                      <td><input type="submit" value="Submit"/><input type="reset" value="Reset"/></td>
                                  </tr>

                              </table>
                                   <%
                                }
                                rs11.close();
                             }
                             
                        }
                        catch(Exception e)
                        {
                            e.printStackTrace();
                        }
          %>
                    
      </form>
                      
      <%
      out.println("<font color = 'red' >");
      
      //getting response
      try
      {
          if( (request.getParameter("msg") != null) && (!(request.getParameter("msg").trim().equals(""))) )
          {
              out.println(request.getParameter("msg"));
          }
      }
      catch(Exception e)
      {
          e.printStackTrace();
      }
      
      out.println("</font>");
      %>
      
      <!-- ####################################################################################################### -->
    </div>
  </div>
        </div>
<!-- ####################################################################################################### 
<div class="wrapper row4">
  <div class="rnd">
    <div id="footer" class="clear">
       ####################################################################################################### 
      <div class="fl_left clear">
        <div class="fl_left center"><img src="images/demo/worldmap.gif" alt="" /><br />
          <a href="#">Find Us With Google Maps &raquo;</a></div>
        <address>
        Address Line 1<br />
        Address Line 2<br />
        Town/City<br />
        Postcode/Zip<br />
        <br />
        Tel: xxxx xxxx xxxxxx<br />
        Email: <a href="#">contact@domain.com</a>
        </address>
      </div>
      <div class="fl_right">
        <div id="social" class="clear">
          <p>Stay Up to Date With Whats Happening</p>
          <ul>
            <li><a style="background-position:0 0;" href="#">Twitter</a></li>
            <li><a style="background-position:-72px 0;" href="#">LinkedIn</a></li>
            <li><a style="background-position:-142px 0;" href="#">Facebook</a></li>
            <li><a style="background-position:-212px 0;" href="#">Flickr</a></li>
            <li><a style="background-position:-282px 0;" href="#">RSS</a></li>
          </ul>
        </div>
        <div id="newsletter">
          <form action="#" method="post">
            <fieldset>
              <legend>Subscribe To Our Newsletter:</legend>
              <input type="text" value="Enter Email Here&hellip;" onfocus="this.value=(this.value=='Enter Email Here&hellip;')? '' : this.value ;" />
              <input type="text" id="subscribe" value="Submit" />
            </fieldset>
          </form>
        </div>
      </div>
       ####################################################################################################### 
    </div>
  </div>
</div>
 ####################################################################################################### 
<div class="wrapper">
  <div id="copyright" class="clear">
    <p class="fl_left">Copyright &copy; 2011 - All Rights Reserved - <a href="#">Domain Name</a></p>
    <p class="fl_right">Template by <a href="http://www.os-templates.com/" title="Free Website Templates">OS Templates</a></p>
  </div>
</div>-->
</body>
</html>
