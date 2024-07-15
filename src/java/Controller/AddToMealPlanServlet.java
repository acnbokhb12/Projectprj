/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Controller;

import dao.FoodDAO;
import dao.WeeklyDAO;
import dto.Account;
import dto.Food;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
public class AddToMealPlanServlet extends HttpServlet {
   
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
            HttpSession session = request.getSession();
//            WeeklyDAO wld = new WeeklyDAO();
            FoodDAO fd = new FoodDAO();
            String date = request.getParameter("date");
            String fid = request.getParameter("foodid");
//            Account acc = (Account) session.getAttribute("CustomerAcc");
//            String AID = String.valueOf(acc.getAccId());
            Food food = fd.getFoodById(fid);
            food.setCategories(fd.getCateByFoodId(fid));
            HashMap<String,ArrayList<Food>> mealMap = (HashMap<String, ArrayList<Food>>) session.getAttribute("dateFood");
            ArrayList<Food> foodL = new ArrayList<>();
            String yes = "yes";

            if (mealMap == null) {
                mealMap = new HashMap<>();

                foodL.add(food);

                mealMap.put(date, foodL);
                yes = "rong";

            } else {
                boolean coko = false;
                for (String key : mealMap.keySet()) {
                    if (key.equalsIgnoreCase(date)) {
                        foodL = mealMap.get(date);
                        coko = true;
                        break;
                    }
                }
                if (coko) {
                    boolean find = false;
                    if (foodL != null) {
                        yes = "null";
                        for (Food f : foodL) {
                            if (f.getFoodId() == Integer.parseInt(fid)) {
                                find = true;
                                yes = "co";
                                break;
                            }
                        }
                        if (!find) {
                            foodL.add(food);
                            yes = "co nhung ko co cai do";
                        }
                    }
                } else {
                    foodL.add(food);
                    yes = "hash rong";

                }
                mealMap.put(date, foodL);
            }
            session.setAttribute("dateFood", mealMap);
            request.setAttribute("y", yes);
//            request.setAttribute("date", date);

            request.getRequestDispatcher("weekly.jsp").forward(request, response);
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
