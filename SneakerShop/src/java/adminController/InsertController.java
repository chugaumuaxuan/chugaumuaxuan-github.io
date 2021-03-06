/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adminController;

import dal.AdminDAO;
import dal.BrandDAO;
import dal.DAOFactory;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Admin;
import model.Brand;
import model.Shoe;

/**
 *
 * @author nguye
 */
public class InsertController extends HttpServlet {

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
        Admin admin = (Admin) request.getSession().getAttribute("admin");
        return admin != null;
    }
    
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
        
        if (isAuthenticated(request)) {
            String bid = request.getParameter("brandname");

            if (bid == null) {
                bid = "0";
            }

            ArrayList<Brand> brands = DAOFactory.getBrandDAO().getAllBrands();
            request.setAttribute("brands", brands);

            ArrayList<Shoe> shoes = DAOFactory.getAdminDAO().getAllProductsByAdmin();
            request.setAttribute("shoes", shoes);

            request.getRequestDispatcher("adminview/Insert.jsp").forward(request, response);
            
        } else {
            response.getWriter().println("Access denied!");
        }
        
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
        
        if (isAuthenticated(request)) {
            String raw_sid = request.getParameter("sid");
            String name = request.getParameter("sname");
            String raw_trend = request.getParameter("trend");
            String raw_size = request.getParameter("size");
            String raw_retail = request.getParameter("retail");
            String raw_price = request.getParameter("price");
            String raw_sale = request.getParameter("status");

            String raw_br = request.getParameter("brandname");

            Shoe s = new Shoe();
            s.setSid(raw_sid);
            s.setSname(name);
            s.setTrend(raw_trend.equals("yes"));
            s.setSize(Float.parseFloat(raw_size));
            s.setRetail(Float.parseFloat(raw_retail));
            s.setPrice(Float.parseFloat(raw_price));
            s.setSale(raw_sale.equals("sale"));

            Brand b = new Brand();
            b.setBid(Integer.parseInt(raw_br));
            s.setBr(b);

            DAOFactory.getAdminDAO().insert(s);
            response.sendRedirect("adminhome");
            
        } else {
            response.getWriter().println("Access denied!");
        }
        
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
