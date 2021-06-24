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
 	<script src="https://www.gstatic.com/firebasejs/8.6.1/firebase-app.js"></script>
			<script src="https://www.gstatic.com/firebasejs/8.6.1/firebase-auth.js"></script>
			<script src="https://www.gstatic.com/firebasejs/8.6.1/firebase-database.js"></script> 
			<script src="https://www.gstatic.com/firebasejs/8.6.1/firebase-storage.js"></script>
			<script src="https://www.gstatic.com/firebasejs/8.6.1/firebase-app.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.6.1/firebase-auth.js"></script>
<script src="https://www.gstatic.com/firebasejs/8.6.1/firebase-database.js"></script> 
<script src="https://www.gstatic.com/firebasejs/8.6.1/firebase-storage.js"></script>
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
         <li><a href="viewtimetable.jsp">VIEW TIME TABLE</a></li>  
          <li><a href="sharefile.jsp">SHAREFILE</a></li>   
                         <li class="active"><a href="viewfile.jsp">VIEWFILE</a></li>
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
      <h1>FILE SHARING TO FIREBASE</h1>
      
    
                    
          <table align="center" border="0px" width="100px">
              
           <tr >
                  <td>Grades</td>
                  <td><select name="Uploadto" id="groupc" style="width:340px;">                        
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
                  </td>
                      
                </tr>
                
             
            <tr>       <ul id="list" class="li">
                   
                   
					</ul>  </tr>      
             
              
          </table>
 <button id="search">view</button>

<button onClick="window.location.reload();">Refresh Page</button>
  
  <script id="MainScript">

var select="hai";
 // Your web app's Firebase configuration
  var firebaseConfig = {
    apiKey: "AIzaSyDBUt9s5Z3jZ7ZEVaHzcYTiRFnzvtE1qM0",
    authDomain: "classpweb-13af9.firebaseapp.com",
    databaseURL: "https://classpweb-13af9-default-rtdb.firebaseio.com",
    projectId: "classpweb-13af9",
    storageBucket: "classpweb-13af9.appspot.com",
    messagingSenderId: "930070330423",
    appId: "1:930070330423:web:a6cfbc37b2b4178b3fd3b2"
  };
  // Initialize Firebase
  firebase.initializeApp(firebaseConfig);
  
  var stdNo=0;	
  function addItemsToList(name,fileloc,groupc1){
  var ul=document.getElementById('list');
  var header=document.createElement('h4');

  
  var _name =document.createElement('li');
  var _fileloc =document.createElement('button');
 var _del =document.createElement('button');

var hhh="(click)";
var jj=groupc1;
  header.innerHTML='File-'+ (++stdNo);
  
  _name.innerHTML='name: '+name;
_fileloc.innerHTML="Download"+hhh.link(fileloc) +"";
_del.innerHTML = 'DELETE';
 _del.onclick = function() {
	   
		var abc = firebase.database().ref('uploads').child(groupc1);
	var key_to_delete = fileloc;
	var query = abc.orderByChild('url').equalTo(key_to_delete);
	query.on('child_added', function(snapshot)
	{
	    snapshot.ref.remove();
		
	});
	_del.disabled = true;
	 

	    };


ul.appendChild(header);
ul.appendChild(_name);
   
ul.appendChild(_fileloc);
ul.appendChild(_del);
	 }
	 	
	 
	
	document.getElementById("search").onclick = function FetchAllData(){
	
const groupc = document.getElementById('groupc').value;
	 firebase.database().ref('uploads').child(groupc).once('value',function(snapshot){
	 
	 snapshot.forEach(
	 
	 function(ChildSnapshot){

	 let name= ChildSnapshot.val().name;
	let fileloc=ChildSnapshot.val().url;	
	let groupc1=groupc;


	 addItemsToList(name,fileloc,groupc1);
	
	 }
	 
	 
	 );
	 
	 
	 });
document.getElementById("search").disabled = true;
	 }
	 window.onload(FetchAllData());
	

</script>      
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