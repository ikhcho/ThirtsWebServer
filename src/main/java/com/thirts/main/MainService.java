package com.thirts.main;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.thirts.account.LoginVo;
import com.thirts.speed.SpeedVo;



@Service("mainService")
public class MainService {
	@Resource(name="mainDao")
	MainDao dao;

	public List<MainVo> selectAllList(String id) {
		return dao.selectAllList(id);
	}
	
	public MainVo SearchCount(){
		return dao.SearchCount();
	}
	
}
