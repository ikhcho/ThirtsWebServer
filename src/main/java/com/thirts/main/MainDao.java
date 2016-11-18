package com.thirts.main;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;


@Repository("mainDao")
public class MainDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSessionTemplate template;

	public List<MainVo> selectAllList(String id) {
		// TODO Auto-generated method stub
		return template.selectList("thirts.selectAllList",id);
	}
	
	public MainVo SearchCount() {
		// TODO Auto-generated method stub
		return template.selectOne("thirts.SearchCount");
	}

}
