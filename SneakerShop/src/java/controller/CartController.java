/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.DAOFactory;
import dal.ShoeDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Shoe;
import model.Order;
import model.OrderLine;
import model.User;

/**
 *
 * @author nguye
 */
public class CartController extends HttpServlet {

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
        
        request.getRequestDispatcher("/view/Cart.jsp").forward(request, response);
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
        
        User user = (User) request.getSession().getAttribute("user");        

        helper.Helper.addActionUser(user, "Add to Cart");
        
        String sid = request.getParameter("id");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        Shoe shoe = DAOFactory.getShoeDAO().getShoe(sid);
        Order order = (Order)request.getSession().getAttribute("order");        
        if(order == null)
            order = new Order();
        
        boolean isExist = false;
        for (OrderLine line : order.getLines()) {
            if(line.getShoe().getSid().equals(sid))
            {
                line.setQuantity(line.getQuantity() + quantity);
                isExist = true;
                break;
            }
        }
        if(!isExist)
        {
            OrderLine line = new OrderLine();
            line.setOrder(order);
            line.setShoe(shoe);
            line.setQuantity(quantity);
            line.setPrice(shoe.getRetail());
            order.getLines().add(line);
        }
        request.getSession().setAttribute("order", order);
        response.sendRedirect("home");
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
