package com.thirts.member;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


@Service("loginService")
public class LoginService {
	@Resource(name="loginDao")
	LoginDao dao;

	public int SaveAccount(NewaccountVo vo) {
		return dao.SaveAccount(vo);
	}
	
	public LoginVo SearchAccount(String id){
		return dao.SearchAccount(id);
	}
}