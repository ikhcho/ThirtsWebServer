package com.thirts.member;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("loginDao")
public class LoginDao {

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSessionTemplate template;
	
	public int SaveAccount(NewaccountVo vo) {
		return template.insert("thirts.saveAccount",vo);
	}

	public LoginVo SearchAccount(String id) {
		// TODO Auto-generated method stub
		return template.selectOne("thirts.searchAccount",id);
	}
}
