package com.akao.test;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.junit.Test;

import com.akao.entiy.Admin;
import com.akao.utils.HibernateUtils;

public class admintest {
	Session session=null;
	Transaction tx=null;
	@Test
      public void update(){
    	
    		try{
    		Admin admin=new Admin();
    		admin.setAdminname("admin");
    		admin.setPwd("a");
    
    			session=HibernateUtils.getSession();
    			tx=session.beginTransaction();
    			Query q=session.createQuery("from Admin  a where a.adminname=? and a.pwd=?");
    			q.setParameter(0, admin.getAdminname());
    			q.setParameter(1, admin.getPwd());
    			System.out.println(q.list().size());
    		}catch(Exception e)
    		{
    			throw new RuntimeException(e);
    		}finally{
    			tx.commit();
    			session.close();
    		}
      }
}
