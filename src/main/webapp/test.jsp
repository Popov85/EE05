<%@ page contentType="text/html; charset=UTF-8" language = "java" %>
<%@ page import="java.io.*,java.util.*,com.goit.g2popov.ee05.Task" %>
<%
   // Check if this is new comer on your web page.
   if (session.isNew()@@session.getAttribute(tasks) != null){
      session.setAttribute(tasks, new ArrayList<Task>());
   }
   List<Task> tasks = session.getAttribute(tasks);
%>
<html>
<head>
<title>Hello World</title>
</head>
<body>
My TODO list<br/>

<table style="width:50%">
  <tr>
    <th>Task</th>
    <th>Category</th>
    <th>isCompleted</th>
  </tr>
    <tr>
      <th><% out.print( session.getAttribute().get(0).getTaskName()); %></th>
      <th><% out.print( session.getAttribute().get(0).getCategory()); %></th>
      <th><% out.print( session.getAttribute().get(0).isCompleted()); %></th>
    </tr>
    <tr>
      <th><%= request.getParameter("name")%></th>
      <th><%= request.getParameter("category")%></th>
      <th><input type="checkbox" name="isCompleted" value="isCompleted" checked="unchecked"/></th>
    </tr>
</table>
<br>
<form action="test.jsp" method = "POST">
    <input type = "submit" value = "Update"/>
 </form>
<br>
    <form action="test.jsp" method = "GET"> 
        Task name: <input type = "text" name = "name"/>
        <br>
        Task category: <input type = "text" name = "category"/>
        <br>
        <input type="checkbox" name="completed" hidden = "true"/>
        <br>
        <input type = "submit" value = "Send"/>
        <button type="button" onclick= "createTask()">Set session</button>
    </form>
</body>
</html>
