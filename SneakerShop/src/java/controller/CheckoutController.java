/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.DAOFactory;
import dal.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;
import model.Order;
import model.OrderLine;

/**
 *
 * @author nguye
 */
public class CheckoutController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private boolean isAuthenticated(HttpServletRequest request)
    {
        User user = (User) request.getSession().getAttribute("user");
        return user != null;
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        User user = (User) request.getSession().getAttribute("user");        

        helper.Helper.addActionUser(user, "Checkout");
           
        if(isAuthenticated(request))
        {
            //User user = (User) request.getSession().getAttribute("user");
            Order order = (Order) request.getSession().getAttribute("order");

            DAOFactory.getOrderDAO().addOrder(user);                        
            int oid = DAOFactory.getOrderDAO().getOrder(user);
            for (OrderLine line : order.getLines()) {
                DAOFactory.getOrderDAO().addOrderLine(oid, line.getShoe().getSid(), line.getQuantity(), line.getPrice());
            }
             request.getSession().setAttribute("order", null);
             response.getWriter().println("order created!");
                        
            response.sendRedirect("view");
            
        } else {
            response.getWriter().println("Access denied!");
        }
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
        processRequest(request, response);
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
        processRequest(request, response);
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
