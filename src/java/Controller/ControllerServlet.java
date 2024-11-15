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
public class ControllerServlet extends HttpServlet {

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
            String ac = request.getParameter("action");
            String url = "";
            String a= "";
            if (ac == null || ac.isEmpty()) {
                ac = IConstant.HOME;
            }
            switch (ac) {

                case IConstant.WELLCOME:
                    url = "home.jsp";
                    break;
                case IConstant.HOME:
                    url = "ManageHomeServlet";
                    break;
                case IConstant.REGISTERJSP:
                    url = "register.jsp";
                    break;
                case IConstant.LOGINSERVLET:
                    url = "LoginServlet";
                    break;
                case IConstant.LOGINJSP:
                    url = "login.jsp";
                    break;
                case IConstant.ADMIN:
                    url="dashboard.jsp";
                    break;
                case IConstant.DASHBOARDSERVLET:
                    url="DashboardAdminServlet";
                    break;    
                case IConstant.LOGOUT:
                    url = "LogoutServlet";
                    break;
                case IConstant.MENUJSP:
                    url = "menu.jsp";
                    break;
                case IConstant.MENUSERVLET:
                    url = "ManageMenuServlet";
                    break;
                case IConstant.MANAGECATEGORIES:
                    url = "ManageCategoriesServlet";
                    break;
                case IConstant.DETAILFOODSERVLET:
                    url = "DetailFoodServlet";
                    break;
                case IConstant.DETAILFOODJSP:
                    url = "product.jsp";
                    break;    
                case IConstant.MANAGECART:
                    url = "manageCartServlet";
                    break;
                case IConstant.CART:
                    url = "cart.jsp";
                    break;
                case IConstant.MANAGEWEEKLYMENU:
                    url="ManageWeeklyMenuServlet";
                    break;
                case IConstant.WEEKLYMAINJSP:
                    url= "weeklymain.jsp";
                    break;
                case IConstant.MENUDETAILJSP:
                    url= "weeklydetail.jsp";
                    break;
                case IConstant.GETMEALPLASERVLET:
                    url= "GetMealPlanServlet";
                    break;
                case IConstant.MEALPLAN:
                    url= "weekly.jsp";
                    break;      
                case IConstant.ORDERHISTORYSERVLET:
                    url="OrderHistoryServlet";
                    break;
//                ADMIN
                case IConstant.ORDERMANAGESERVLET:
                    url="ManageOrderAdminServlet";
                    break;
                case IConstant.ORDERMANAGEJSP:
                    url="manageOrder.jsp";
                    break;
                case IConstant.MENUMANAGESERVLET:
                    url="ManageMenuAdminServlet";
                    break;
                case IConstant.MENUMANAGEJSP:
                    url="manageProduct.jsp";
                    break;
                case IConstant.USERMANAGESERVLET:
                    url="ManageUserAdminServlet";
                    break;
                case IConstant.USERMANAGEJSP:
                    url="manageUser.jsp";
                    break;     
                case IConstant.ORDERHIST0RYJSP:
                    url="orderHistory.jsp";
                    break;
                default:
                    // If no matching action is found, set a default URL
                    url = "ManageHomeServlet";
                    break;
            }
             
            request.getRequestDispatcher(url).forward(request, response);
            

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
