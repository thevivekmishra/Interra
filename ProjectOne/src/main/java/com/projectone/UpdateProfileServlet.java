package com.projectone;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get updated profile details from the form
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        String mobile = request.getParameter("mobile");
        String doj = request.getParameter("doj");
        String gender = request.getParameter("gender");

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

            // Query to update user details
            PreparedStatement pst = con.prepareStatement("UPDATE user SET name = ?, address = ?, mobile = ?, DOJ = ?, gender = ? WHERE email = ?");
            pst.setString(1, name);
            pst.setString(2, address);
            pst.setString(3, mobile);
            pst.setString(4, doj);
            pst.setString(5, gender);
            pst.setString(6, email);

            int rowsAffected = pst.executeUpdate();

            if (rowsAffected > 0) {
                // Update successful, refresh session and redirect to profile
                session.setAttribute("session_name", name);
                session.setAttribute("address", address);
                session.setAttribute("mobile", mobile);
                session.setAttribute("DOJ", doj);
                session.setAttribute("gender", gender);
                RequestDispatcher rd = request.getRequestDispatcher("/profile.jsp");
                rd.forward(request, response);
            } else {
                // Update failed, return to profile page
                response.sendRedirect("error.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
