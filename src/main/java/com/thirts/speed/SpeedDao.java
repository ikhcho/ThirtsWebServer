package com.thirts.speed;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;


@Repository("speedDao")
public class SpeedDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSessionTemplate template;

	public int SaveSpeed(SpeedVo vo) {
		return template.insert("thirts.saveSpeed",vo);
	}

	public SpeedVo SearchSpeed(String id) {
		// TODO Auto-generated method stub
		return template.selectOne("thirts.searchSpeed",id);
	}

	public List<SpeedVo> selectAllSpeed() {
		// TODO Auto-generated method stub
		return template.selectList("thirts.allSpeed");
	}

}
