<%@ page contentType="text/html; charset=UTF-8" language = "java" %>
<html>
<head>
<title>Hello World</title>
</head>
<body>
My TODO list<br/>

<table style="width:100%">
  <tr>
    <th>Task</th>
    <th>Category</th>
    <th>isCompleted</th>
  </tr>
    <tr>
      <th><%= request.getParameter("name")%></th>
      <th><%= request.getParameter("category")%></th>
      <th><input type="checkbox" name="isCompleted" value="isCompleted"/></th>
    </tr>
</table>
<br>
    <form action="test.jsp" method = "GET">
        Task name: <input type = "text" name = "name"/>
        <br>
        Task category: <input type = "text" name = "category"/>
        <br>
        <input type = "submit" name = "submit"/>
    </form>
</body>
</html>
