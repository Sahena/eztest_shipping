/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.assign.eztest.model;

/**
 *
 * @author Eztest
 */
public class CategoryModel {
    private int cat_id;
    private String category;
    private String iscomplete;
    private int countQues;

    public int getCountQues() {
        return countQues;
    }

    public void setCountQues(int countQues) {
        this.countQues = countQues;
    }

    public int getCat_id() {
        return cat_id;
    }

    public void setCat_id(int cat_id) {
        this.cat_id = cat_id;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getIscomplete() {
        return iscomplete;
    }

    public void setIscomplete(String iscomplete) {
        this.iscomplete = iscomplete;
    }
    
}
