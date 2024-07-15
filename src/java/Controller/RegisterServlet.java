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
public class RegisterServlet extends HttpServlet {

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
            String email = request.getParameter("txtemail").trim();
            String password = request.getParameter("txtpassword");
            String repass = request.getParameter("txtRepass");
            String username = request.getParameter("txtusername");
//            String url ="";

            if (email != null && password != null && repass != null && username != null) {
                if (email.matches("^[a-zA-Z0-9._%+-]+@gmail\\.com$")) {
                    AccountDAO acd = new AccountDAO();
                    Account acc = acd.checkAccountExist(email);
//                    check acc exist
                    if (acc == null) {
//                        copare to pass
                        if (repass.equals(password)) {
                            if (!username.trim().isEmpty()) {
//                                start insert acc to sql
                                acd.signUpAccount(email, password, username);
                                Account newAcc =  acd.getAccount(email, password);
                                if(newAcc != null){
                                    HttpSession session = request.getSession();
                                    session.setAttribute("UserAcc", newAcc);
                                    request.getRequestDispatcher("ControllerServlet?action="+ IConstant.HOME).forward(request, response);
                                    return;
                                }else{
                                     request.setAttribute("errorRegister", "Register failed");                                 
                                }

                            } else {
                                request.setAttribute("errorUserName", "username must not be empty");
                            }
                        } else {
                            request.setAttribute("errorSamePass", "Passwords are not the same");
                        }
                    }else{
                             request.setAttribute("emailExist", "Email existed");
                    }
                } else {
                    request.setAttribute("errorEmail", "Invalid email address (e.g. example@gmail.com)");
                }
                request.setAttribute("oldEmail", email);
                request.setAttribute("oldPass", password);
                request.setAttribute("oldRePass", repass);
                request.setAttribute("oldUserName", username);
                request.getRequestDispatcher("ControllerServlet?action=" + IConstant.REGISTERJSP).forward(request, response);
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
