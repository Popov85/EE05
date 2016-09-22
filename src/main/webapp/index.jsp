<%@ page contentType="text/html; charset=UTF-8" language = "java" %>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import = "java.util.Map" %>
<%@ page import="com.goit.g2popov.ee05.*"%>

<%
   // Check if this is new comer on your web page.
   if (session.isNew()||session.getAttribute("tasks") == null){
      List<Task> tasks = new ArrayList<Task>();
	  tasks.add(new Task("defaultTask", "defaultCategory"));
	  session.setAttribute("tasks", tasks);
   } else {
	   // add tasks if present
	   if (!request.getParameter("name").equals("") && !request.getParameter("category").equals("")) {
				List<Task> tasks =(ArrayList<Task>) session.getAttribute("tasks");
				Task newTask = new Task(request.getParameter("name"), request.getParameter("category"));
				tasks.add(newTask);
				session.setAttribute("tasks", tasks);
	   }
	   // delete tasks if checked
	   // TODO
	   Map<String, String[]> parameters = request.getParameterMap();
			for(String parameter : parameters.keySet()) {
					if(parameter.toLowerCase().startsWith("task")) {
						String[] values = parameters.get(parameter);

					}
		}
   }
%>

<html>
<head>
<title>Hello World</title>
</head>
<body>
<h1 style="width:50%"><center>My TODO list</center></h1>
<form action = "index.jsp" method = "POST">
<table style="width:50%">
  <tr>
    <th>Task</th>
    <th>Category</th>
    <th>isCompleted</th>
  </tr>
	<%
	 ArrayList<Task> tasks =(ArrayList<Task>) session.getAttribute("tasks");
	 int counter = 0;
	 for (Task task : tasks) {
		String myValue = "task"+counter;		 
	 %>
	 <tr>
		 <td><% out.print(task.getTaskName()); %></td>
		 <td><% out.print(task.getCategory()); %></td>
		 <td><% if (task.isCompleted()) {%> 
		         <div><input type="checkbox" name="task" value="<%= myValue%>" checked></div>
				<% } else {%> 
				 <div><input type="checkbox" name="task" value="<%= myValue%>"></div>
			<%}%>
		  </td>   
      </tr>		 
   <%counter++;}%>
  
</table>
<br>
    <input type="submit" value="Update Tasks" />
</form>
<br>
    <form action="index.jsp" method = "POST">
        Task name: <input type = "text" name = "name"/>
        <br>
        Task category: <input type = "text" name = "category"/>
        <br>
        <input type = "submit" value = "Add Task"/>
    </form>
	
<%! 
   public String addTask() {
	   return "";   
   } 
%>

<%! 
   // returns number of tasks deleted
   public int deleteTask() {

	   return 0;
   } 
%>
</body>
</html>
