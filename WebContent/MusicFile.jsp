<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>
<body>
<%session=request.getSession();
  HashMap<Integer,String> emp=new HashMap<Integer,String>();
  emp=(HashMap<Integer,String>)session.getAttribute("musicID");
  %>
   <table border=1>
      <tr>
        <th> MUSIC ID  </th>
        <th> MUSIC TITLE  </th>
      </tr>
      <%for(Map.Entry entry:emp.entrySet()){ %>
         <tr>
            <td> <%=entry.getKey() %>   </td>
            <td> <%=entry.getValue()%>  </td>
         </tr>
       <%} %>     
  </table>
<div class="footer" >
         <a href="SecondHomePage.jsp" style="color: orange"> Navigate to Home Page </a>
         <br/>
           copyright © 2014 Online Music Store My Tunes
       </div>
</body>
</html>