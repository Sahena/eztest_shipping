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
public class QuestionModel {
    private int ques_id;
    private String question;
    private String opt_1;
    private String opt_2;
    private String opt_3;
    private String opt_4;
    private String correct_ans;
    CategoryModel cat_id;

    public int getQues_id() {
        return ques_id;
    }

    public void setQues_id(int ques_id) {
        this.ques_id = ques_id;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getOpt_1() {
        return opt_1;
    }

    public void setOpt_1(String opt_1) {
        this.opt_1 = opt_1;
    }

    public String getOpt_2() {
        return opt_2;
    }

    public void setOpt_2(String opt_2) {
        this.opt_2 = opt_2;
    }

    public String getOpt_3() {
        return opt_3;
    }

    public void setOpt_3(String opt_3) {
        this.opt_3 = opt_3;
    }

    public String getOpt_4() {
        return opt_4;
    }

    public void setOpt_4(String opt_4) {
        this.opt_4 = opt_4;
    }

    public String getCorrect_ans() {
        return correct_ans;
    }

    public void setCorrect_ans(String correct_ans) {
        this.correct_ans = correct_ans;
    }

    public CategoryModel getCat_id() {
        return cat_id;
    }

    public void setCat_id(CategoryModel cat_id) {
        this.cat_id = cat_id;
    }
}
