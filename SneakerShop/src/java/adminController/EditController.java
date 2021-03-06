/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package adminController;

import dal.BrandDAO;
import dal.AdminDAO;
import dal.DAOFactory;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Brand;
import model.Shoe;

/**
 *
 * @author nguye
 */
public class EditController extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Edit</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Edit at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        String raw_id = request.getParameter("sid");
        if (raw_id == null || raw_id.equals("")) {
            response.getWriter().print("id is invalid!");
        } else {
            Shoe s = DAOFactory.getAdminDAO().getOneProductByAdmin(raw_id);
            request.setAttribute("shoes", s);
            
            ArrayList<Brand> brands = DAOFactory.getBrandDAO().getAllBrands();
            request.setAttribute("brands", brands);
            
            request.getRequestDispatcher("/adminview/Edit.jsp").forward(request, response);
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
        
        String sid = request.getParameter("sid");
        String name = request.getParameter("sname");
        Brand br = DAOFactory.getBrandDAO().getOneBrand(Integer.parseInt(request.getParameter("brandname")));
        Date redate = Date.valueOf(request.getParameter("redate"));
        boolean trend = Boolean.parseBoolean(request.getParameter("trend"));
        Float size = Float.parseFloat(request.getParameter("size"));
        Float retail = Float.parseFloat(request.getParameter("retail"));
        Float price = Float.parseFloat(request.getParameter("price"));
        boolean status = Boolean.parseBoolean(request.getParameter("status"));
        
        DAOFactory.getAdminDAO().update(new Shoe(sid, name, redate, trend, size, retail, price, status, br));
        response.sendRedirect("adminhome");

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
