package com.akao.action;

import java.util.List;

import org.junit.Test;


import com.akao.entiy.QA_pair;
import com.akao.service.IQA_pairService;
import com.akao.service.impl.QA_pairService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.util.ValueStack;
import com.sun.org.apache.bcel.internal.generic.NEW;

public class PairAction extends ActionSupport implements ModelDriven<QA_pair>{
	
	  private QA_pair qa_pair=new QA_pair();
	  
	
      
	public QA_pair getQa_pair() {
		return qa_pair;
	}

	public void setQa_pair(QA_pair qa_pair) {
		this.qa_pair = qa_pair;
	}

	public QA_pair getModel() {
		
		return qa_pair;
	}
	 private IQA_pairService qa_pairService=new QA_pairService();
	 public String list() {
   	  try {
			List<QA_pair> listPair=qa_pairService.getAll();
			 ActionContext.getContext().getContextMap().put("listPair", listPair);
			 return "list";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return ERROR;
		}
	
	}
	 public String delete(){
		 try{
			 int id=qa_pair.getId();
			 qa_pairService.deleteByid(id);
			 return list();
		 }catch (Exception e) {
			// TODO: handle exception
			 e.printStackTrace();
				return ERROR;
		}
	 }
     public String viewUpdate(){
   	  try {
   		
   		 
   		  //3.1��ȡ��ǰ�޸ļ�¼������ֵ
   		  int id=qa_pair.getId();
   		  //��service ��ѯ
   		  QA_pair pair=qa_pairService.findById(id);
   		  //���ݻ���
   		  //a �ȵõ�ֵջ
   		  ValueStack vs=ActionContext.getContext().getValueStack();
   		  vs.pop();
   		  vs.push(pair); //pair�������ջ��
   		 return "update";
   	
   		  
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return ERROR;
		}
     }
     
     //�޸�Ա��
     public String update(){
   	  try {
   		  if(qa_pair.getId()==0)
   		  {
   			  qa_pairService.save(qa_pair);
   			 return list();
   		  }
   		  else{
   			qa_pairService.update(qa_pair);
      		 return list();
   		  }
   		  
   	
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return ERROR;
		}
     }

}
