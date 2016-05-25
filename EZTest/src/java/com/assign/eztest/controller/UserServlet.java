/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.assign.eztest.controller;

import com.assign.eztest.controller.dao.UserDao;
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
public class UserServlet extends HttpServlet {

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

        String redirectPage = "index.jsp";
        RequestDispatcher rd = null;
        PrintWriter out = response.getWriter();

        String servletPath = request.getServletPath();
        System.out.println(servletPath);
        switch (servletPath) {
            case "/register":
                redirectPage = "register.jsp";
                break;

            case "/saveUser":
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String isAdmin = request.getParameter("isAdmin");
               
                UserModel userModel = new UserModel();
                userModel.setName(name);
                userModel.setEmail(email);
                userModel.setPassword(password);
                userModel.setIsadmin(isAdmin);

                boolean isSaved = udao.saveUser(userModel);
                if (isSaved) {
                    request.setAttribute("success", "User Saved Successfully");
                }
                redirectPage = "/listUser";
                break;

            case "/listUser":
                List<UserModel> userList = udao.listUser();
                request.setAttribute("userlist", userList);
                redirectPage = "listUser.jsp";
                break;

            case "/deleteUser":
                int id = Integer.parseInt(request.getParameter("id"));
                boolean isDeleted = udao.deleteUser(id);

                if (isDeleted) {
                    request.setAttribute("Success", "user deleted successfully");
                }
                redirectPage = "/listUser";
                break;

            case "/editUser":
                int editCatid = Integer.parseInt(request.getParameter("id"));
                UserModel umodel = udao.findCatById(editCatid);
                request.setAttribute("user", umodel);
                redirectPage = "editUser.jsp";
                break;

            case "/updateUser":
                UserModel uModel_upd = new UserModel();
                String Name_upd = request.getParameter("name");
                String Email_upd = request.getParameter("email");
                String isAdmin_upd = request.getParameter("isAdmin");
                 if (isAdmin_upd == null) {
                    isAdmin_upd = "0";
                }
                int upduserId = Integer.parseInt(request.getParameter("userid")); //editCtegory.jsp

                uModel_upd.setUser_id(upduserId);
                uModel_upd.setName(Name_upd);
                uModel_upd.setEmail(Email_upd);
                uModel_upd.setIsadmin(isAdmin_upd);

                boolean isUpdated = udao.UpdateUser(uModel_upd);

                if (isUpdated) {
                    request.setAttribute("success", "user saved successfully!!");
                } else {
                    request.setAttribute("success", "user not saved!!");
                }

                redirectPage = "/listUser";
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
