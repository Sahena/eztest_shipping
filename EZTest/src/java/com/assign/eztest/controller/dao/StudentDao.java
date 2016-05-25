/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.assign.eztest.controller.dao;

import com.assign.eztest.model.StudentModel;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Eztest
 */
public class StudentDao {

    Connection con;
    PreparedStatement pstm;
    ResultSet rs;
    QuestionDao qdao;

    public StudentDao(Connection con) {
        this.con = con;
        qdao = new QuestionDao(con);
    }

    public boolean saveStudentAns(StudentModel smodel) {
        boolean isSaved = false;
        String query = "INSERT INTO tbl_answer_compare(user_id,ques_id,student_answer) VALUES (?,?,?)";
        try {
            pstm = con.prepareStatement(query);
            pstm.setInt(1, smodel.getUser_id());
            pstm.setInt(2, smodel.getQues_id().getQues_id());
            pstm.setString(3, smodel.getStudent_answer());

            int save = pstm.executeUpdate();
            if (save == 1) {
                isSaved = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return isSaved;
    }

    public boolean deleteAns() {
        boolean isSaved = false;
        String query = "DELETE FROM tbl_answer_compare";
        try {
            pstm = con.prepareStatement(query);
            int save = pstm.executeUpdate();
            if (save == 1) {
                isSaved = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return isSaved;
    }

    public List<StudentModel> getAnswer(int usrid) {

        List<StudentModel> sslist = new ArrayList<>();
        String query = "SELECT * FROM tbl_answer_compare";
        try {
            pstm = con.prepareStatement(query);
            rs = pstm.executeQuery();
            while (rs.next()) {
                StudentModel ssmodel = new StudentModel();
                ssmodel.setQues_id(qdao.findQuesById(rs.getInt("ques_id")));
                String corrAns = getCorrectAns(rs.getInt("ques_id"));
                ssmodel.setCompareAns(corrAns);
                ssmodel.setStudent_answer(rs.getString("student_answer"));
                sslist.add(ssmodel);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return sslist;
    }

    private String getCorrectAns(int aInt) {
        String correctans = "";
        PreparedStatement pstm1;
        ResultSet rs1;
        String query = "SELECT * FROM tbl_question where ques_id=?";
        try {
            pstm1 = con.prepareStatement(query);

            pstm1.setInt(1, aInt);
            rs1 = pstm1.executeQuery();
            while (rs1.next()) {
                correctans = rs1.getString("correct_ans");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return correctans;
    }

}
