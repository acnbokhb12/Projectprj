/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import dao.FoodDAO;
import dto.Food;
import dto.Ingredient;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
public class addToCartServlet extends HttpServlet {

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
            String idFood = request.getParameter("idfood");
            String quantityBuy = request.getParameter("quantityF");
            String btnType = request.getParameter("btnAdd");
            FoodDAO fd = new FoodDAO();
            ArrayList<Ingredient> ingr = fd.getIngredientsByFoodId(idFood);
            float totalPrice = fd.getTotalPriceIng(ingr);
            boolean addsuccess = false;
             HashMap <Integer ,String > listFstatus = fd.getFoodStatus();
            Food f = null;
            if (btnType.equals("Food")) {
                f = fd.getFoodWithTypeAndIngredients(idFood, "Food");
            } else if (btnType.equals("Ingredient")) {
                f = fd.getFoodWithTypeAndIngredients(idFood, "Ingredient");
            }

            if (f != null && f.getfStatusId() ==1) {
                HttpSession session = request.getSession();
                HashMap<Food, Integer> cartUser = (HashMap<Food, Integer>) session.getAttribute("cart");
                int quantity = 1;
              
                try {
                    quantity = Integer.parseInt(quantityBuy);
                  
                } catch (NumberFormatException e) {
                    // Handle the error or set a default value
                }
                if (cartUser == null) {
                    cartUser = new HashMap<>();
                    cartUser.put(f, quantity);
                }else{
                    boolean find = false;
                    for(Food mtp : cartUser.keySet() ){
                        if(mtp.getFoodId() == Integer.parseInt(idFood) && mtp.getTypeToBuy().equals(btnType)  ){
                            cartUser.put(mtp, cartUser.get(mtp)+quantity);
                            find = true;
                            break;
                        }
                    }
                    if(!find){
                        cartUser.put(f, quantity);
                    }
                    
                } 
                addsuccess = true;
                
                session.setAttribute("cart", cartUser);
                
            }  
                request.setAttribute("addSuccess", addsuccess);
                request.setAttribute("Food", f);
                request.setAttribute("ListIngr", ingr);
                 request.setAttribute("ListFoodStatus", listFstatus);
                request.setAttribute("TotalPriceIng", totalPrice);
                request.getRequestDispatcher("ControllerServlet?action=" + IConstant.DETAILFOOD).forward(request, response);
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
