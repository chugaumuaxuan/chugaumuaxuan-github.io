/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dal.DAOFactory;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import model.Subscriber;

/**
 *
 * @author nguye
 */
public class AddNewSubscriberController extends HttpServlet {

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
        
//        String sub_email = (String) request.getParameter("sub_email");
//        sub_email = "";
//        request.setAttribute("sub_email", sub_email);
//        request.setAttribute("notice", "");
        
        request.getRequestDispatcher("/view/Home.jsp").forward(request, response);
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
        
        String sub_email = request.getParameter("sub_email");
        Subscriber sub = new Subscriber();
        sub.setSubmail(sub_email);
        
        DAOFactory.getUserDAO().addNewSubscriber(sub);
        response.getWriter().println("Add success");
        
//        String sub_email = (String) request.getParameter("sub_email");
//        try {
//            if (!DAOFactory.getUserDAO().addNewSubscriber(sub_email)) {
//                request.setAttribute("sub_email", sub_email);
//                request.setAttribute("notice", "This mail has already been a subscriber!");
//                request.getRequestDispatcher("/view/Home.jsp").forward(request, response);
//            } else {
//                response.getWriter().println("Add success");
//            }
//        } catch (Exception ex) {
//            Logger.getLogger(AddNewSubscriberController.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        Subscriber sub = new Subscriber(sub_email);
//        HttpSession session= request.getSession();
//        session.setAttribute("sub", sub);
        
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
