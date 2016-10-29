package com.thirts.pi;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.thirts.speed.SpeedVo;



@Service("piService")
public class PiService {
	@Resource(name="piDao")
	PiDao dao;

	public int SaveBeacon(PiVo vo) {
		return dao.SaveBeacon(vo);
	}
	
	public List<PiVo> selectAllBeacon() {
		return dao.selectAllBeacon();
	}

}
