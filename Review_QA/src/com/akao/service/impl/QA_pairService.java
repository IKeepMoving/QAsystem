package com.akao.service.impl;

import java.io.Serializable;
import java.util.List;

import com.akao.dao.IQA_pairDao;
import com.akao.dao.impl.QA_pairImpl;
import com.akao.entiy.QA_pair;
import com.akao.service.IQA_pairService;
import com.sun.org.apache.bcel.internal.generic.NEW;

public class QA_pairService implements IQA_pairService{
	private IQA_pairDao qaPairsDao=new QA_pairImpl();

	public List<QA_pair> getAll() {
		// TODO Auto-generated method stub
		return qaPairsDao.getAll();
	}

	public List<QA_pair> findByQuestion(String question) {
		// TODO Auto-generated method stub
		return qaPairsDao.findByQuestion(question);
	}

	public QA_pair findById(Serializable id) {
		// TODO Auto-generated method stub
		return qaPairsDao.findById(id);
	}

	public void update(QA_pair qa_pair) {
		// TODO Auto-generated method stub
		qaPairsDao.update(qa_pair);
		
	}

	public void deleteByid(Serializable id) {
		// TODO Auto-generated method stub
		qaPairsDao.deleteByid(id);
	}

	public void save(QA_pair qa_pair) {
		// TODO Auto-generated method stub
		qaPairsDao.save(qa_pair);
	}

}
