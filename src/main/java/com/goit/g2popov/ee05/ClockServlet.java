package com.goit.g2popov.ee05;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;


/**
 * Created by Andrey on 9/20/2016.
 */
public class ClockServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        out.println(new Date());
            HttpSession session;
        req.getSession();

            ArrayList<Task> tasks = new ArrayList<>();
            for (Task task : tasks) {
                    task.getTaskName();
            }

        //session.setAttribute("g","h");
    }
}
