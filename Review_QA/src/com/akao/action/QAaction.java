package com.akao.action;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.junit.Test;

import com.akao.entiy.QA_pair;
import com.akao.service.IQA_pairService;
import com.akao.service.impl.QA_pairService;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class QAaction extends ActionSupport implements ServletRequestAware,ServletResponseAware  {
        
        private  HttpServletRequest request;  
        private  HttpServletResponse  response;
		private  String question;
		private  String s;
		
		public String getQuestion() {
			return question;
		}

		public void setQuestion(String question) {
			this.question = question;
		}

		private IQA_pairService qa_pairService=new QA_pairService();

		public void setServletResponse(HttpServletResponse response) {
			// TODO Auto-generated method stub
			this.response=response;
		}

		public void setServletRequest(HttpServletRequest request) {
			// TODO Auto-generated method stub
			this.request = request; 
		}
		
		public void search()
		{
			  this.response.setContentType("text/json;charset=utf-8");
	          this.response.setCharacterEncoding("UTF-8");
			Gson gson=new Gson();
			try {
				s=URLEncoder.encode(question, "UTF-8");
			} catch (UnsupportedEncodingException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		  List<QA_pair> qa_pairs=qa_pairService.findByQuestion(question);
		  String qa_answer=gson.toJson(qa_pairs);
		  System.out.println("GSON-->"+qa_answer);
		  try {
			this.response.getWriter().write(qa_answer);
		   } catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		   }
		     
		}
	
        
}
