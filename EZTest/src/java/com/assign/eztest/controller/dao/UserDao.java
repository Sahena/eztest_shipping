/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.assign.eztest.controller.dao;

import com.assign.eztest.model.UserModel;
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
public class UserDao {

    Connection con;
    PreparedStatement pstm;
    ResultSet rs;

    public UserDao(Connection con) {
        this.con = con;
    }

    public boolean authenticate(UserModel userModel) {

        boolean isUserPresent = false;

        String query = "SELECT * FROM tbl_user WHERE email=? and password=?";
        try {
            pstm = con.prepareStatement(query);
            pstm.setString(1, userModel.getEmail());
            pstm.setString(2, userModel.getPassword());
            rs = pstm.executeQuery();
            while (rs.next()) {
                isUserPresent = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return isUserPresent;
    }

    public boolean saveUser(UserModel userModel) {

        boolean isSaved = false;
        String query = "INSERT INTO tbl_user(name,email,password,isadmin) VALUES (?,?,?,?)";
        try {
            pstm = con.prepareStatement(query);
            pstm.setString(1, userModel.getName());
            pstm.setString(2, userModel.getEmail());
            pstm.setString(3, userModel.getPassword());
            pstm.setString(4, userModel.getIsadmin());

            int save = pstm.executeUpdate();
            if (save == 1) {
                isSaved = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return isSaved;
    }

    public List<UserModel> listUser() {
        List<UserModel> ulist = new ArrayList<>();

        String query = "Select * from tbl_user";

        try {
            pstm = con.prepareStatement(query);
            rs = pstm.executeQuery();
            while (rs.next()) {
                UserModel umodel = new UserModel();
                umodel.setUser_id(rs.getInt("user_id"));
                umodel.setName(rs.getString("name"));
                umodel.setEmail(rs.getString("email"));
                umodel.setPassword(rs.getString("password"));
                umodel.setIsadmin(rs.getString("isadmin"));
                ulist.add(umodel);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return ulist;

    }

    public boolean deleteUser(int id) {
        boolean isDeleted = false;
        String query = "DELETE FROM tbl_user WHERE user_id=?";
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

    public UserModel findCatById(int edituid) {
        UserModel usermodel = new UserModel();
        String query = "SELECT * FROM tbl_user WHERE user_id= ?";

        try {
            pstm = con.prepareStatement(query);
            pstm.setInt(1, edituid);

            rs = pstm.executeQuery();

            while (rs.next()) {
                usermodel.setUser_id(rs.getInt("user_id"));
                usermodel.setName(rs.getString("name"));
                usermodel.setEmail(rs.getString("email"));
                usermodel.setIsadmin(rs.getString("isadmin"));

            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return usermodel;
    }

    public boolean UpdateUser(UserModel uModel_upd) {
        boolean isUpdate = false;
        String query = "Update tbl_user SET name=?,email=?,isadmin=? where user_id=?";
        try {
            pstm = con.prepareStatement(query);
            pstm.setString(1, uModel_upd.getName());
            pstm.setString(2, uModel_upd.getEmail());
            pstm.setString(3, uModel_upd.getIsadmin());
            pstm.setInt(4, uModel_upd.getUser_id());

            int update = pstm.executeUpdate();

            if (update == 1) {

                isUpdate = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CategoryDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return isUpdate;
    }

    public int checkadmin(UserModel umodel) {
        int isadmin = 0;
        String query = "SELECT * FROM tbl_user WHERE email=? and password=?";
        try {
            pstm = con.prepareStatement(query);
            pstm.setString(1, umodel.getEmail());
            pstm.setString(2, umodel.getPassword());
            rs = pstm.executeQuery();
            while (rs.next()) {
                isadmin = Integer.parseInt(rs.getString("isadmin"));
                
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return isadmin;
        
    }

}
