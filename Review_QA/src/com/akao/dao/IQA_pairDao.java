package com.akao.dao;

import java.io.Serializable;
import java.util.List;

import com.akao.entiy.QA_pair;

public interface IQA_pairDao {
	 //查询全部问题
	  List<QA_pair> getAll();
	//根据主键查询问题
	  QA_pair findById(Serializable id);
	  
	  
	//添加问题
	void save(QA_pair qa_pair);
	
	//修改问题
	void update(QA_pair qa_pair);
	//删除问题
	void deleteByid(Serializable id);
	
	//模糊查询
	List<QA_pair> findByQuestion(String question);
	
}
