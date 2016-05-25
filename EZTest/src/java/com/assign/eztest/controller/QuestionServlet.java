/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.assign.eztest.controller;

import com.assign.eztest.controller.dao.CategoryDao;
import com.assign.eztest.controller.dao.QuestionDao;
import com.assign.eztest.model.CategoryModel;
import com.assign.eztest.model.QuestionModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Eztest
 */
public class QuestionServlet extends HttpServlet {

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
        QuestionDao pdao = new QuestionDao(con);
        CategoryDao cdao = new CategoryDao(con);

        String redirectPage = "index.jsp";
        RequestDispatcher rd = null;
        PrintWriter out = response.getWriter();

        String servletPath = request.getServletPath();
        System.out.println("Servlet Path" + servletPath);
        switch (servletPath) {
            case "/addQuestion":
                int ccid = Integer.parseInt(request.getParameter("id"));
                int quesCount = Integer.parseInt(request.getParameter("qc"));

                if (quesCount > 20) {
                    redirectPage = "exceededQuota.jsp";
                    break;
                }
                request.setAttribute("Catid", ccid);
                redirectPage = "addQuestion.jsp";
                break;
            case "/saveQuestion":
                String Question = request.getParameter("name");
                String Option1 = request.getParameter("option_1");
                String Option2 = request.getParameter("option_2");
                String Option3 = request.getParameter("option_3");
                String Option4 = request.getParameter("option_4");
                String correct_ans = request.getParameter("correct_answer");
                int cat_Id = Integer.parseInt(request.getParameter("catid"));

                QuestionModel quesModel = new QuestionModel();
                quesModel.setQuestion(Question);
                quesModel.setOpt_1(Option1);
                quesModel.setOpt_2(Option2);
                quesModel.setOpt_3(Option3);
                quesModel.setOpt_4(Option4);
                quesModel.setCorrect_ans(correct_ans);
                quesModel.setCat_id(cdao.findCatById(cat_Id));

                boolean isSaved = pdao.saveQuestion(quesModel);
                if (isSaved) {
                    request.setAttribute("success", "Question saved successfully");
                }
                redirectPage = "/listQuestion?id=" + cat_Id;
                break;

            case "/listQuestion":
                int cat_id = Integer.parseInt(request.getParameter("id"));
                CategoryModel cmodel = cdao.findCatById(cat_id);
                List<QuestionModel> listCategories = pdao.ListQuestion(cat_id);
                int qc = 0;
                try {
                    qc = cdao.countQuestion(cat_id);
                } catch (SQLException ex) {
                    Logger.getLogger(QuestionServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.setAttribute("quesList", listCategories);
                request.setAttribute("cmodel", cmodel);
                request.setAttribute("cidd", cat_id);
                request.setAttribute("qc", qc);
                redirectPage = "listQuestion.jsp";
                break;

            case "/deleteQuestion":
                int id = Integer.parseInt(request.getParameter("id"));
                int cid = Integer.parseInt(request.getParameter("cid"));
                boolean isDeleted = pdao.deleteQuestion(id);

                if (isDeleted) {
                    request.setAttribute("Success", "Question deleted successfully");
                }
                redirectPage = "/listQuestion?id=" + cid;
                break;

            case "/editQuestion":
                int editid = Integer.parseInt(request.getParameter("id"));
                QuestionModel qObj = pdao.findQuesById(editid);
                request.setAttribute("qmodel", qObj);

                List<CategoryModel> category = cdao.ListCategories();
                request.setAttribute("listCategories", category);

                redirectPage = "editQuestion.jsp";
                break;

            case "/updateQuestion":
                int uid = Integer.parseInt(request.getParameter("id"));
                String uQuestion = request.getParameter("name");
                String uOption1 = request.getParameter("option_1");
                String uOption2 = request.getParameter("option_2");
                String uOption3 = request.getParameter("option_3");
                String uOption4 = request.getParameter("option_4");
                String ucorrect_ans = request.getParameter("correct_answer");
                int ucat_Id = Integer.parseInt(request.getParameter("category"));

                QuestionModel uquesModel = new QuestionModel();
                uquesModel.setQues_id(uid);
                uquesModel.setQuestion(uQuestion);
                uquesModel.setOpt_1(uOption1);
                uquesModel.setOpt_2(uOption2);
                uquesModel.setOpt_3(uOption3);
                uquesModel.setOpt_4(uOption4);
                uquesModel.setCorrect_ans(ucorrect_ans);
                uquesModel.setCat_id(cdao.findCatById(ucat_Id));

                boolean isUpdated = pdao.updateQuestion(uquesModel);
                if (isUpdated) {
                    request.setAttribute("success", "Question saved successfully");
                }
                redirectPage = "/listQuestion?id=" + ucat_Id;
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
