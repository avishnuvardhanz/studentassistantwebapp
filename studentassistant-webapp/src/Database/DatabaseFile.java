

package Database;

import java.sql.*;


public class DatabaseFile {
    
   
    public ResultSet codeselect(String sql)
    {
        ResultSet rs = null;
        
        try
        {
            
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/collegetimetable", "root", "");
            
            Statement  st  = con.createStatement();
            
            rs  = st.executeQuery(sql);
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return rs;
    }
    
    
    public void codeinsert(String sql)
    {
         try
        {
            
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/collegetimetable", "root", "");
            
            Statement  st = con.createStatement();
            
            st.executeUpdate(sql);
           
            st.close();
            
            con.commit();
            
            con.close();
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
    
   
    public void codeupdate(String sql)
    {
         try
        {
            
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/collegetimetable", "root", "");
            
            Statement   st = con.createStatement();
            
            st.executeUpdate(sql);
            
            st.close();
            
            con.close();
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
    
   
    public void codedelete(String sql)
    {
         try
        {
            
            Class.forName("com.mysql.jdbc.Driver");
            
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/collegetimetable", "root", "");
            
            Statement  st  = con.createStatement();
            
            st.executeUpdate(sql);
            
            st.close();
            
            con.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }    
}