/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.assign.eztest.controller.dao;

import com.assign.eztest.model.CategoryModel;
import com.assign.eztest.model.QuestionModel;
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
public class QuestionDao {

    Connection con;
    PreparedStatement pstm;
    ResultSet rs;
    CategoryDao cdao;

    public QuestionDao(Connection con) {
        this.con = con;
        cdao = new CategoryDao(con);
    }

    public boolean saveQuestion(QuestionModel quesModel) {
        boolean isSaved = false;
        String query = "INSERT INTO tbl_question(question,opt_1,opt_2,opt_3,opt_4,cat_id,correct_ans) VALUES (?,?,?,?,?,?,?)";
        try {
            pstm = con.prepareStatement(query);
            pstm.setString(1, quesModel.getQuestion());
            pstm.setString(2, quesModel.getOpt_1());
            pstm.setString(3, quesModel.getOpt_2());
            pstm.setString(4, quesModel.getOpt_3());
            pstm.setString(5, quesModel.getOpt_4());
            pstm.setInt(6, quesModel.getCat_id().getCat_id());
            pstm.setString(7, quesModel.getCorrect_ans());

            int save = pstm.executeUpdate();
            if (save == 1) {
                isSaved = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return isSaved;
    }

    public List<QuestionModel> ListQuestion(int cat_id) {
        List<QuestionModel> qlist = new ArrayList<>();
        CategoryModel catmodel = new CategoryModel();
        String query = "SELECT * FROM tbl_question where cat_id=?";
        try {
            pstm = con.prepareStatement(query);
            pstm.setInt(1, cat_id);
            rs = pstm.executeQuery();
            while (rs.next()) {
                QuestionModel ques = new QuestionModel();
                ques.setQues_id(rs.getInt("ques_id"));
                ques.setQuestion(rs.getString("question"));
                ques.setOpt_1(rs.getString("opt_1"));
                ques.setOpt_2(rs.getString("opt_2"));
                ques.setOpt_3(rs.getString("opt_3"));
                ques.setOpt_4(rs.getString("opt_4"));
                ques.setCorrect_ans(rs.getString("correct_ans"));
                ques.setCat_id(cdao.findCatById(rs.getInt("cat_id")));
                qlist.add(ques);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return qlist;
    }

    public boolean deleteQuestion(int id) {
        boolean isDeleted = false;
        String query = "DELETE FROM tbl_question WHERE ques_id=?";
        try {
            pstm = con.prepareStatement(query);
            pstm.setInt(1, id);
            int delete = pstm.executeUpdate();
            if (delete == 1) {
                isDeleted = true;

            }
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return isDeleted;
    }

    public QuestionModel findQuesById(int editid) {
        QuestionModel qmodel = new QuestionModel();
        String query = "SELECT * FROM tbl_question WHERE ques_id=?";

        try {
            pstm = con.prepareStatement(query);
            pstm.setInt(1, editid);

            rs = pstm.executeQuery();

            while (rs.next()) {
                qmodel.setQues_id(rs.getInt("ques_id"));
                qmodel.setQuestion(rs.getString("question"));
                qmodel.setOpt_1(rs.getString("opt_1"));
                qmodel.setOpt_2(rs.getString("opt_2"));
                qmodel.setOpt_3(rs.getString("opt_3"));
                qmodel.setOpt_4(rs.getString("opt_4"));
                qmodel.setCorrect_ans(rs.getString("correct_ans"));
                qmodel.setCat_id(cdao.findCatById(rs.getInt("cat_id")));
            }

        } catch (SQLException ex) {
            Logger.getLogger(CategoryDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return qmodel;
    }

    public boolean updateQuestion(QuestionModel uquesModel) {
        boolean isUpdate = false;
        String query = "Update tbl_question SET question=?, opt_1=?, opt_2=?, opt_3=?, opt_4=?, cat_id=?,correct_ans=? where ques_id=?";
        try {
            pstm = con.prepareStatement(query);
            pstm.setString(1, uquesModel.getQuestion());
            pstm.setString(2, uquesModel.getOpt_1());
            pstm.setString(3, uquesModel.getOpt_2());
            pstm.setString(4, uquesModel.getOpt_3());
            pstm.setString(5, uquesModel.getOpt_4());
            pstm.setInt(6, uquesModel.getCat_id().getCat_id());
            pstm.setString(7, uquesModel.getCorrect_ans());
            pstm.setInt(8, uquesModel.getQues_id());
            int update = pstm.executeUpdate();

            if (update == 1) {

                isUpdate = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return isUpdate;
    }

    public QuestionModel listQuestionByQidCid(int cat_id, int quesid) {
        QuestionModel ques = new QuestionModel();
        CategoryModel catmodel = new CategoryModel();
        String query = "SELECT * FROM tbl_question where cat_id=? and ques_id";
        try {
            pstm = con.prepareStatement(query);
            pstm.setInt(1, cat_id);
            pstm.setInt(2, quesid);
            rs = pstm.executeQuery();
            while (rs.next()) {

                ques.setQues_id(rs.getInt("ques_id"));
                ques.setQuestion(rs.getString("question"));
                ques.setOpt_1(rs.getString("opt_1"));
                ques.setOpt_2(rs.getString("opt_2"));
                ques.setOpt_3(rs.getString("opt_3"));
                ques.setOpt_4(rs.getString("opt_4"));
                ques.setCorrect_ans(rs.getString("correct_ans"));
                ques.setCat_id(cdao.findCatById(rs.getInt("cat_id")));

            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ques;
    }

}
