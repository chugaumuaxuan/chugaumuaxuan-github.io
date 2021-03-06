/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package authentication;

import dal.DAOFactory;
import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author nguye
 */
public class RegisterController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = (String) request.getParameter("username");
        String loginname = (String) request.getParameter("loginname");
        String address = (String) request.getParameter("address");
        String phone = (String) request.getParameter("phone");
        String mail = (String) request.getParameter("mail");
        username = "";
        loginname = "";
        address = "";
        phone = "";
        mail = "";
        request.setAttribute("username", username);
        request.setAttribute("loginname", loginname);
        request.setAttribute("address", address);
        request.setAttribute("phone", phone);
        request.setAttribute("mail", mail);
        request.setAttribute("notice", "");
        request.getRequestDispatcher("Register.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = (String) request.getParameter("username");
        String loginname = (String) request.getParameter("loginname");
        String password = (String) request.getParameter("password");
        String address = (String) request.getParameter("address");
        String phone = (String) request.getParameter("phone");
        String mail = (String) request.getParameter("mail");
        try {
            if (!DAOFactory.getUserDAO().addNewUser(username, loginname, password, address, phone, mail)) {
                request.setAttribute("username", username);
                request.setAttribute("loginname", loginname);
                request.setAttribute("address", address);
                request.setAttribute("phone", phone);
                request.setAttribute("mail", mail);
                request.setAttribute("notice", "Login Name has existed");
                request.getRequestDispatcher("Register.jsp").forward(request, response);
            } else {
                response.sendRedirect("home");
            }
        } catch (Exception ex) {
            Logger.getLogger(RegisterController.class.getName()).log(Level.SEVERE, null, ex);
        }
        User user = new User(loginname, password);
        HttpSession session= request.getSession();
        session.setAttribute("user", user);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
