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
public class StudentModel {

    private int id;
    private String student_answer;
    private int user_id;
    private QuestionModel ques_id;

    public QuestionModel getQues_id() {
        return ques_id;
    }

    public void setQues_id(QuestionModel ques_id) {
        this.ques_id = ques_id;
    }
    private String compareAns;

    public String getCompareAns() {
        return compareAns;
    }

    public void setCompareAns(String compareAns) {
        this.compareAns = compareAns;
    }
    

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStudent_answer() {
        return student_answer;
    }

    public void setStudent_answer(String student_answer) {
        this.student_answer = student_answer;
    }

  
    
}
