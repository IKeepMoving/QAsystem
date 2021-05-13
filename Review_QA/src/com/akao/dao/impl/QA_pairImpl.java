package com.akao.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;



import com.akao.dao.IQA_pairDao;
import com.akao.entiy.QA_pair;
import com.akao.utils.HibernateUtils;

public class QA_pairImpl implements IQA_pairDao {

	public List<QA_pair> getAll() {
		// TODO Auto-generated method stub
		Session session=null;
		Transaction tx=null;
		try{
		
			session=HibernateUtils.getSession();
			tx=session.beginTransaction();
			Query q=session.createQuery("from QA_pair");
			return q.list();
		}catch(Exception e)
		{
			throw new RuntimeException(e);
		}finally{
			tx.commit();
			session.close();
		}
	
	}

	public QA_pair findById(Serializable id) {
		Session session = null;
		Transaction tx = null;
		try {
			// ��ȡSession
			session = HibernateUtils.getSession();
			// ��������
			tx = session.beginTransaction();
			// ������ѯ
			return (QA_pair) session.get(QA_pair.class, id);
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			tx.commit();
			session.close();
		}
	
	}

	public void save(QA_pair qa_pair) {
		// TODO Auto-generated method stub
		Session session = null;
		Transaction tx = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			// ִ�б������
			session.save(qa_pair);
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			tx.commit();
			session.close();
		}
	}

	public void update(QA_pair qa_pair) {
		// TODO Auto-generated method stub
		Session session = null;
		Transaction tx = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			session.update(qa_pair);
			
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			tx.commit();
			session.close();
		}
		
	}

	public void deleteByid(Serializable id) {
		// TODO Auto-generated method stub
		Session session = null;
		Transaction tx = null;
		try {
			session = HibernateUtils.getSession();
			tx = session.beginTransaction();
			// �ȸ���id��ѯ�������ж�ɾ��
			Object obj = session.get(QA_pair.class, id);
			if (obj != null) {
				session.delete(obj);
			}
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			tx.commit();
			session.close();
		}
	}

	public List<QA_pair> findByQuestion(String question) {
		// TODO Auto-generated method stub
		Session session=null;
		Transaction tx=null;
		try{
			session=HibernateUtils.getSession();
			tx=session.beginTransaction();
			Query q = session.createQuery("from QA_pair d where question like ?");
			q.setString(0, "%"+question+"%");
			return q.list();
		}catch(Exception e)
		{
			throw new RuntimeException(e);
		}finally{
			tx.commit();
			session.close();
		}
	}

}
