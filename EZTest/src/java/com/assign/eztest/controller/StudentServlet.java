/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.assign.eztest.controller;

import com.assign.eztest.controller.dao.QuestionDao;
import com.assign.eztest.controller.dao.StudentDao;
import com.assign.eztest.controller.dao.UserDao;
import com.assign.eztest.model.QuestionModel;
import com.assign.eztest.model.StudentModel;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
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
public class StudentServlet extends HttpServlet {

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
//        UserDao udao = new UserDao(con);
        QuestionDao qdao = new QuestionDao(con);
        StudentDao sdao = new StudentDao(con);

        String redirectPage = "index.jsp";
        RequestDispatcher rd = null;
        PrintWriter out = response.getWriter();

        String servletPath = request.getServletPath();
        System.out.println(servletPath);
        switch (servletPath) {
            case "/student_question":
                int categoryid = Integer.parseInt(request.getParameter("id"));
                List<QuestionModel> questionList = qdao.ListQuestion(categoryid);
                request.setAttribute("qlist", questionList);
                request.setAttribute("cid", categoryid);
                redirectPage = "student_question.jsp";
                break;

            case "/submitQuestion":

                int cid = Integer.parseInt(request.getParameter("cid"));
                int userid = Integer.parseInt(request.getParameter("userid"));
//                int quesid = Integer.parseInt(request.getParameter("quesid"));

                boolean isdelete = sdao.deleteAns();
                String[] quesids = request.getParameterValues("quesid");
                String[] answers = request.getParameterValues("answer");

                for (int i = 0; i < quesids.length; i++) {
                    StudentModel smodel = new StudentModel();
                    int qid = Integer.parseInt(quesids[i]);
                    String ans = answers[i];
                    smodel.setQues_id(qdao.findQuesById(qid));
                    smodel.setStudent_answer(ans);
                    smodel.setUser_id(userid);
                    boolean issaved = sdao.saveStudentAns(smodel);

                }
                redirectPage = "studentResult?userid=" + userid + "&cid" + cid;

                break;

            case "/studentResult":
                int cidd = Integer.parseInt(request.getParameter("cid"));
                int usrid = Integer.parseInt(request.getParameter("userid"));
                List<StudentModel> stlist = sdao.getAnswer(usrid);
                String category=stlist.get(0).getQues_id().getCat_id().getCategory();
                List<QuestionModel> quesList = qdao.ListQuestion(cidd);
                request.setAttribute("catname", category);
                request.setAttribute("stlist", stlist);

                redirectPage = "student_result.jsp";
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
