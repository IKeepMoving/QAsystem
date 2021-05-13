package com.akao.action;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.akao.dao.AdminDao;
import com.akao.entiy.Admin;
import com.akao.entiy.QA_pair;
import com.akao.utils.HibernateUtils;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.sun.org.apache.bcel.internal.generic.NEW;

public class AdminAction  extends ActionSupport implements ModelDriven<Admin>{
         private Admin admin=new Admin();

		public Admin getAdmin() {
			return admin;
		}

		public void setAdmin(Admin admin) {
			this.admin = admin;
		}

		public Admin getModel() {
			// TODO Auto-generated method stub
			return admin;
		}
		private AdminDao adminDao=new AdminDao();
		public String login(){
			try {
			
				if(adminDao.login(admin))
				{
					return SUCCESS;
				}
				else {
					return "reLogin";
				}
			} catch (Exception e) {
				throw new RuntimeException();
			}
	
	
		}
        
}
