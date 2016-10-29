package com.thirts.pi;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.thirts.speed.SpeedVo;


@Repository("piDao")
public class PiDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSessionTemplate template;

	public int SaveBeacon(PiVo vo) {
		return template.insert("thirts.SaveBeacon",vo);
	}
	
	public List<PiVo> selectAllBeacon() {
		// TODO Auto-generated method stub
		return template.selectList("thirts.selectAllBeacon");
	}
}
