package com.akao.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.akao.entiy.Admin;
import com.akao.utils.HibernateUtils;

public class AdminDao {
     public boolean login(Admin admin)
     {	Session session=null;
		Transaction tx=null;
    	 try {
			
				session=HibernateUtils.getSession();
				tx=session.beginTransaction();
				System.out.println(admin.getAdminname());
				System.out.println(admin.getPwd());
				Query q=session.createQuery("from Admin a where a.adminname=? and a.pwd=?");
				q.setParameter(0, admin.getAdminname());
				q.setParameter(1, admin.getPwd());
				if(q.list().size()>0)
				{
					return true;
				}
				else {
					return false;
				}
			} catch (Exception e) {
				throw new RuntimeException();
			}
     }
}
