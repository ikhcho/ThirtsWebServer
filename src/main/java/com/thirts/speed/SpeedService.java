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
	
	public List<SpeedVo> selectAllSpeed(String id) {
		return dao.selectAllSpeed(id);
	}
	
}
