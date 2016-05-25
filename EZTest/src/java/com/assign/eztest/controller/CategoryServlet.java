/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.assign.eztest.controller;

import com.assign.eztest.controller.dao.CategoryDao;
import com.assign.eztest.controller.dao.QuestionDao;
import com.assign.eztest.model.CategoryModel;
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
public class CategoryServlet extends HttpServlet {

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
        CategoryDao cdao = new CategoryDao(con);

        String redirectPage = "index.jsp";
        RequestDispatcher rd = null;
        PrintWriter out = response.getWriter();

        String servletPath = request.getServletPath();
        System.out.println("Servlet Path" + servletPath);

        switch (servletPath) {
            case "/addCategory":
                redirectPage = "addCategory.jsp";
                break;

            case "/saveCategory":
                String catName = request.getParameter("cat_name");
                CategoryModel catModel = new CategoryModel();
                catModel.setCategory(catName);

                boolean isSaved = cdao.saveCategory(catModel);
                if (isSaved) {
                    request.setAttribute("success", "Category saved successfully");
                }
                redirectPage = "/listCategory";
                break;

            case "/listCategory":

                List<CategoryModel> listCategories = cdao.ListCategories();
                request.setAttribute("categories", listCategories);

                redirectPage = "listCategory.jsp";
                break;

            case "/deleteCategory":
                int id = Integer.parseInt(request.getParameter("id"));
                boolean isDeleted = cdao.deleteCategories(id);

                if (isDeleted) {
                    request.setAttribute("Success", "Category deleted successfully");
                }
                redirectPage = "/listCategory";
                break;

            case "/editCategory":
                int editCatid = Integer.parseInt(request.getParameter("id"));
                CategoryModel catObj = cdao.findCatById(editCatid);
                request.setAttribute("category", catObj);
                redirectPage = "editCategory.jsp";
                break;

            case "/updateCategory":
                CategoryModel catModel_upd = new CategoryModel();
                String catName_upd = request.getParameter("name");
                int updCatId = Integer.parseInt(request.getParameter("catid")); //editCtegory.jsp
                String isComplete = request.getParameter("isComplete");
                if (isComplete == null) {
                    isComplete = "0";

                }

                catModel_upd.setCat_id(updCatId);
                catModel_upd.setCategory(catName_upd);
                catModel_upd.setIscomplete(isComplete);
                boolean isUpdated = cdao.UpdateCategory(catModel_upd);

                if (isUpdated) {
                    request.setAttribute("success", "category saved successfully!!");
                } else {
                    request.setAttribute("success", "category not saved!!");
                }

                redirectPage = "/listCategory";
                break;

            default:
                redirectPage = "dashboard.jsp";
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
