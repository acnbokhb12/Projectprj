/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import dao.AccountDAO;
import dto.Account;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
public class LoginServlet extends HttpServlet {

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
            String email = request.getParameter("txtemail");
            String password = request.getParameter("txtpassword");
            String url = "";
            boolean hasError = false;
            if (email != null && password != null) {
                AccountDAO d = new AccountDAO();
                Account acc = d.getAccount(email, password);
                
                if (acc != null && acc.getaStatusId() != 4 && acc.getaStatusId() != 3) {
                    HttpSession session = request.getSession();
                    session.setAttribute("UserAcc", acc);
                    if (acc.getRole().equals("Admin")) {
                        url = IConstant.DASHBOARDSERVLET;
                    } else {
                        url = IConstant.GETMEALPLASERVLET;
                    }
                    request.getRequestDispatcher("ControllerServlet?action=" + url).forward(request, response);
                    return;
                } else {
                    hasError = true;
                    if (acc == null) {
                        request.setAttribute("loginError", "Wrong Email or Password!");
                    } else if (acc.getaStatusId() == 3) {
                        request.setAttribute("AccountBand", "Your account was banned!");
                    } else if (acc.getaStatusId() == 4) {
                        request.setAttribute("AccountDeleted", "Your account was deleted!");
                    } 
                    request.setAttribute("emailError", email);
                    request.setAttribute("passwordError", password);
                }              
            }
            if (hasError) {
          request.getRequestDispatcher("ControllerServlet?action=" + IConstant.LOGINJSP).forward(request, response);
            }
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
