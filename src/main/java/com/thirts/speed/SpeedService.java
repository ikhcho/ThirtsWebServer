package com.thirts.speed;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;



@Service("speedService")
public class SpeedService {
	@Resource(name="speedDao")
	SpeedDao dao;

	public int SaveSpeed(SpeedVo vo) {
		return dao.SaveSpeed(vo);
	}

	public SpeedVo SearchSpeed(String id){
		return dao.SearchSpeed(id);
	}
	
	public SpeedVo SearchSpeed_f(String id){
		return dao.SearchSpeed_f(id);
	}
	
	public SpeedVo SearchSpeed_p(String id){
		return dao.SearchSpeed_p(id);
	}
	
	public SpeedVo SearchSpeed_t(String id){
		return dao.SearchSpeed_t(id);
	}
	
	public SpeedVo SearchSpeed_r(String id){
		return dao.SearchSpeed_r(id);
	}
	
	public List<SpeedVo> searchAllSpeed(String id) {
		return dao.searchAllSpeed(id);
	}
	
	public SpeedVo selectOneAllSpeed(int num){
		return dao.selectOneAllSpeed(num);
	}
	
	public List<SpeedVo> selectAllSpeed(String macaddress) {
		return dao.selectAllSpeed(macaddress);
	}
	
}
