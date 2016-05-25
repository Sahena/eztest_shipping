/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.assign.eztest.controller.dao;

import com.assign.eztest.model.CategoryModel;
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
public class CategoryDao {

    Connection con;
    PreparedStatement pstm;
    ResultSet rs;

    public CategoryDao(Connection con) {
        this.con = con;
    }

    public CategoryDao() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public boolean saveCategory(CategoryModel catModel) {

        boolean isSaved = false;
        String query = "INSERT INTO tbl_category(category) VALUES (?)";
        try {
            pstm = con.prepareStatement(query);
            pstm.setString(1, catModel.getCategory());

            int save = pstm.executeUpdate();
            if (save == 1) {
                isSaved = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return isSaved;
    }

    public List<CategoryModel> ListCategories() {

        List<CategoryModel> categories = new ArrayList<>();
        String query = "SELECT * FROM tbl_category";
        try {
            pstm = con.prepareStatement(query);
            rs = pstm.executeQuery();
            int catid = 0;
            while (rs.next()) {
                CategoryModel category = new CategoryModel();
                catid = countQuestion(rs.getInt("cat_id"));
                category.setCountQues(catid);
                category.setCat_id(rs.getInt("cat_id"));
                category.setCategory(rs.getString("category"));
                category.setIscomplete(rs.getString("iscomplete"));
                categories.add(category);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return categories;
    }

    public int countQuestion(int id) throws SQLException {
        PreparedStatement pstm1;
        ResultSet rs1;
        String query = "Select count(ques_id) From tbl_question where cat_id=?";
        int count = 0;
        try {
            pstm1 = con.prepareStatement(query);
            pstm1.setInt(1, id);
            rs1 = pstm1.executeQuery();

            while (rs1.next()) {
                count = rs1.getInt("count(ques_id)");

            }
            rs1.close();
            pstm1.close();
        } catch (SQLException ex) {
            Logger.getLogger(QuestionDao.class.getName()).log(Level.SEVERE, null, ex);
        } 
        return count;
    }

    public boolean deleteCategories(int id) {

        boolean isDeleted = false;
        String query = "DELETE FROM tbl_category WHERE cat_id=?";
        try {
            pstm = con.prepareStatement(query);
            pstm.setInt(1, id);
            int delete = pstm.executeUpdate();
            if (delete == 1) {
                isDeleted = true;

            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return isDeleted;
    }

    public boolean editCategories(int id) {

        boolean isEdited = false;
        String query = "UPDATE category SET cat_name=? WHERE cat_id=''";

        return isEdited;
    }

    public CategoryModel findCatById(int editCatid) {

        CategoryModel category = new CategoryModel();
        String query = "SELECT * FROM tbl_category WHERE cat_id=?";

        try {
            pstm = con.prepareStatement(query);
            pstm.setInt(1, editCatid);

            rs = pstm.executeQuery();

            while (rs.next()) {
                category.setCat_id(rs.getInt("cat_id"));
                category.setCategory(rs.getString("category"));
                category.setIscomplete(rs.getString("iscomplete"));

            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return category;
    }

    public boolean UpdateCategory(CategoryModel catModel_upd) {

        boolean isUpdate = false;
        String query = "Update tbl_category SET category=?, iscomplete=? where cat_id=?";
        try {
            pstm = con.prepareStatement(query);
            pstm.setString(1, catModel_upd.getCategory());
            pstm.setString(2, catModel_upd.getIscomplete());
            pstm.setInt(3, catModel_upd.getCat_id());

            int update = pstm.executeUpdate();

            if (update == 1) {

                isUpdate = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return isUpdate;
    }

    public int countCategory() {
        String query = "Select count(cat_id) From category";
        int count = 0;
        try {
            pstm = con.prepareStatement(query);
            rs = pstm.executeQuery();

            while (rs.next()) {
                count = rs.getInt("count(cat_id)");

            }
        } catch (SQLException ex) {
//            Logger.getLogger(ProductDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }
}
