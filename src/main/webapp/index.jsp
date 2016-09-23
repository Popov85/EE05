<%@ page contentType="text/html; charset=UTF-8" language = "java" %>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import = "java.util.Map" %>
<%@ page import="com.goit.g2popov.ee05.*"%>

<%
   // Check if this is the first launch
   if (session.getAttribute("tasks") == null){
      List<Task> tasks = new ArrayList<Task>();
	  tasks.add(new Task("defaultTask", "defaultCategory"));
	  session.setAttribute("tasks", tasks);
	  session.setAttribute("counter", 1);
   } else {
	   // add tasks if present
	   if (!request.getParameter("name").equals("") && !request.getParameter("category").equals("")) {
				List<Task> tasks =(ArrayList<Task>) session.getAttribute("tasks");
				Task newTask = new Task(request.getParameter("name"), request.getParameter("category"));
				tasks.add(newTask);
				session.setAttribute("tasks", tasks);
				int quantityOfTasks = (int) session.getAttribute("counter");
				quantityOfTasks++;
				session.setAttribute("counter", quantityOfTasks);
	   }
	   // delete tasks if they are checked
	   Map<String, String[]> parameters = request.getParameterMap();
	   String[] values = getSelectedTasks(parameters);
	   if (values.length != 0) {
		   	ArrayList<Task> tasks =(ArrayList<Task>) session.getAttribute("tasks");
			ArrayList<Task> newTasks = deleteTasks(tasks, values);
			session.setAttribute("tasks", newTasks);
			session.setAttribute("counter", newTasks.size());
	   }
   }
%>

<html>
<head>
<title>TODO</title>
</head>
<body>
<h1 style="width:50%"><center>My TODO list ( ${counter} )</center></h1>
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
		 <td><div><input type="checkbox" name="task" value="<%= myValue%>"></div></td>   
      </tr>		 
   <%counter++;}%>
  
</table>
<br>
    <input type="submit" value="Update Tasks" />
<br>
        Task name: <input type = "text" name = "name"/>
        <br>
        Task category: <input type = "text" name = "category"/>
        <br>
        <input type = "submit" value = "Add Task"/>
    </form>
	
<%! 
   public String[] getSelectedTasks(Map<String, String[]> parameters) {
		String[] values = new String[0];
		for(String parameter : parameters.keySet()) {
			if(parameter.toLowerCase().startsWith("task")) {
				values = parameters.get(parameter);
			}
		}
	   return values;   
   } 
%>

<%! 
   // returns an updated list of tasks
   public ArrayList<Task> deleteTasks(ArrayList<Task> tasks, String[] values) {
	   if (tasks.size() == values.length) {
		   tasks.clear();
		   return tasks;
	   }
	   List<Task> tasksToRemove = new ArrayList<Task>();
	   for (int i = 0; i < values.length; i++) {
			String indexStr = values[i].replaceAll("task", "");
			int index = Integer.parseInt(indexStr);
			tasksToRemove.add(tasks.get(index));		 
       }
	   tasks.removeAll(tasksToRemove); 
	   return tasks;
   } 
%>
</body>
</html>
