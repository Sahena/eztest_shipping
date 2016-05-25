/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.assign.eztest.controller;

import com.assign.eztest.controller.dao.CategoryDao;
import com.assign.eztest.controller.dao.UserDao;
import com.assign.eztest.model.CategoryModel;
import com.assign.eztest.model.QuestionModel;
import com.assign.eztest.model.UserModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Eztest
 */
public class DashboardServlet extends HttpServlet {

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
        Connection con = (Connection) getServletContext().getAttribute("con");
        UserDao udao = new UserDao(con);

        CategoryDao cdao = new CategoryDao(con);
//        ProductDao pdao = new ProductDao(con);

        String redirectPage = "index.jsp";
        RequestDispatcher rd = null;
        PrintWriter out = response.getWriter();

        String servletPath = request.getServletPath();
        System.out.println(servletPath);
        switch (servletPath) {
            case "/dashboard":
//                int countCat=cdao.countCategory();
//                request.setAttribute("countCat", countCat);
//                
//                int countPro = pdao.countProduct();
//                request.setAttribute("countPro", countPro);

                String username = request.getParameter("email");
                String password = request.getParameter("password");

                UserModel umodel = new UserModel();
                umodel.setEmail(username);
                umodel.setPassword(password);
                int isadmin = udao.checkadmin(umodel);
                if (isadmin == 1) {
                    redirectPage = "dashboard.jsp";
                } else if (isadmin == 2) {
                    redirectPage = "testmaster_dashboard.jsp";
                } else if(isadmin == 3){
                    redirectPage = "student_dashboard";
                }else{
                    redirectPage ="login";
                }
                request.getSession().setAttribute("userType", isadmin); // this is the change thats it for servletx                
                break;

            case "/student_dashboard":
                List<CategoryModel> listCategories = cdao.ListCategories();
                request.setAttribute("categories", listCategories);
                redirectPage = "student_dashboard.jsp";

                break;
            default:
                redirectPage = "index.jsp";
        }
        rd = request.getRequestDispatcher(redirectPage);
        rd.forward(request, response);
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
