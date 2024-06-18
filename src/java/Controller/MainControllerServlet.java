/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DELL
 */
public class MainControllerServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
              String ac = request.getParameter("action");
            String url ="";
            out.print("<p>"+ ac+" </p>");
//            
            if(ac==null){
                ac =IConstant.HOME;
                
//                out.print("<p>"+ ac+" </p>");

            }
            switch(ac){
                case IConstant.WELLCOME:
                    url = "home.jsp";
                    break;
                case IConstant.HOME:
                    url="ManageHomeServlet";
                    break;
                case IConstant.REGISTER:
                    url = "register.jsp";
                    break;
                case IConstant.LOGINSERVLET:
                    url="LoginServlet";
                    break;
                case IConstant.LOGINJSP:
                    url="login.jsp";
                    break;
                case IConstant.ADMIN:
                    url="adminHome.jsp";
                    break;
                case IConstant.LOGOUT:
                    url= "LogoutServlet";
                    break;
                case IConstant.MENUJSP:
                    url="menu.jsp";
                    break;
                case IConstant.MANAGEFOOD:
                    url="ManageFoodServlet";
                   break;
                case IConstant.MANAGECATEGORIES:
                    url="ManageCategoriesServlet";
                    break;
                }
            request.getRequestDispatcher(url).forward(request, response);
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
