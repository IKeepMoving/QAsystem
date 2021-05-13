package com.akao.dao;

import java.io.Serializable;
import java.util.List;

import com.akao.entiy.QA_pair;

public interface IQA_pairDao {
	 //��ѯȫ������
	  List<QA_pair> getAll();
	//����������ѯ����
	  QA_pair findById(Serializable id);
	  
	  
	//�������
	void save(QA_pair qa_pair);
	
	//�޸�����
	void update(QA_pair qa_pair);
	//ɾ������
	void deleteByid(Serializable id);
	
	//ģ����ѯ
	List<QA_pair> findByQuestion(String question);
	
}
