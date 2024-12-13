package com.projectone;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        PrintWriter out = response.getWriter();
        
        try {
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/firstproject", "root", "root");
            
            PreparedStatement pst = con.prepareStatement("SELECT * FROM user WHERE email=? AND password=?");
            
            pst.setString(1, email);
            pst.setString(2, password);
            
            ResultSet rs = pst.executeQuery();
            
            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("session_name", rs.getString("name"));
                session.setAttribute("email", email);
                session.setAttribute("password", password); 
                session.setAttribute("address", rs.getString("address"));
                session.setAttribute("DOJ", rs.getString("DOJ"));
                session.setAttribute("mobile", rs.getString("mobile"));
                
                RequestDispatcher rd = request.getRequestDispatcher("/welcome.jsp");
                rd.forward(request, response);
            } else {
                response.setContentType("text/html");
                out.print("<h3>Email ID did not match</h3>");
                RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
                rd.include(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html");
            out.print("<h3>Error occurred: " + e.getMessage() + "</h3>");
            RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
            rd.include(request, response);
        }
    }
}
