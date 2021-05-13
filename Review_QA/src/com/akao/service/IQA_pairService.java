package com.akao.service;

import java.io.Serializable;
import java.util.List;

import com.akao.entiy.QA_pair;

public interface IQA_pairService {
	         List<QA_pair> getAll();
			//根据主键查询
	         List<QA_pair> findByQuestion(String question);
	         QA_pair findById(Serializable id);
	         void update(QA_pair qa_pair);
	         void deleteByid(Serializable id);
	         void save(QA_pair qa_pair);
	
			
		
}
