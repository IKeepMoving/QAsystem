package com.rance.chatui.enity;

/**
 * @author Double_X on 2018/5/31
 * @version v1.0
 * @Email 12****085@qq.com
 * @describe 添加描述
 */
public class QA_pair {
    private int id;
    private String question;
    private String answer;
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getQuestion() {
        return question;
    }
    public void setQuestion(String question) {
        this.question = question;
    }
    public String getAnswer() {
        return answer;
    }
    public void setAnswer(String answer) {
        this.answer = answer;
    }

    @Override
    public String toString() {
        // TODO Auto-generated method stub
        return "Employee [empId=" + id + ", empName=" + question
                + ", workDate=" + answer + "]";
    }
}
