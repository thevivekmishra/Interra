package com.projectone;

import java.io.IOException;
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

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");

        if (email == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/firstproject", "root", "root");

            // Query to fetch user details
            PreparedStatement pst = con.prepareStatement("SELECT * FROM user WHERE email = ?");
            pst.setString(1, email);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                session.setAttribute("session_name", rs.getString("name"));
                session.setAttribute("address", rs.getString("address"));
                session.setAttribute("mobile", rs.getString("mobile"));
                session.setAttribute("DOJ", rs.getString("DOJ"));
                session.setAttribute("gender", rs.getString("gender"));

                RequestDispatcher rd = request.getRequestDispatcher("/profile.jsp");
                rd.forward(request, response);
            } else {
                response.sendRedirect("login.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
