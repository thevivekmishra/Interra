package com.projectone;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.RequestDispatcher;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // Get form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        String mobile = request.getParameter("mobile");
        String doj = request.getParameter("doj");
        String gender = request.getParameter("gender"); // Gender field
        
        PrintWriter out = response.getWriter();
        
        try {
          
            if (name == null || email == null || password == null || address == null || mobile == null || doj == null || gender == null) {
                out.println("<h3>All fields are required!</h3>");
                RequestDispatcher rd = request.getRequestDispatcher("/registration.jsp");
                rd.include(request, response);
                return;
            }
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/firstproject", "root", "root");

            // Check if the email is already registered
            PreparedStatement pst = con.prepareStatement("SELECT * FROM user WHERE email = ?");
            pst.setString(1, email);
            var rs = pst.executeQuery();
            if (rs.next()) {
                out.println("<h3>Email is already registered!</h3>");
                RequestDispatcher rd = request.getRequestDispatcher("/register.jsp");
                rd.include(request, response);
                return;
            }
            
            // Insert the user data into the database
            pst = con.prepareStatement("INSERT INTO user (name, email, password, address, mobile, doj, gender) VALUES (?, ?, ?, ?, ?, ?, ?)");
            pst.setString(1, name);
            pst.setString(2, email);
            pst.setString(3, password); 
            pst.setString(4, address);
            pst.setString(5, mobile);
            pst.setString(6, doj);
            pst.setString(7, gender);
            
            int rowsAffected = pst.executeUpdate();
            
            if (rowsAffected > 0) {
                out.println("<h3>Registration successful! You can <a href='login.jsp'>Login here</a>.</h3>");
                RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
                rd.forward(request, response);
            } else {
                out.println("<h3>Registration failed! Please try again.</h3>");
                RequestDispatcher rd = request.getRequestDispatcher("/register.jsp");
                rd.include(request, response);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
            RequestDispatcher rd = request.getRequestDispatcher("/register.jsp");
            rd.include(request, response);
        }
    }
}
