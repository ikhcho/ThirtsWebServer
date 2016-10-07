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

	public SpeedVo SearchSpeed_f(String id) {
		// TODO Auto-generated method stub
		return template.selectOne("thirts.searchSpeed_f",id);
	}
	
	public SpeedVo SearchSpeed_p(String id) {
		// TODO Auto-generated method stub
		return template.selectOne("thirts.searchSpeed_p",id);
	}
	
	public SpeedVo SearchSpeed_t(String id) {
		// TODO Auto-generated method stub
		return template.selectOne("thirts.searchSpeed_t",id);
	}
	
	public SpeedVo SearchSpeed_r(String id) {
		// TODO Auto-generated method stub
		return template.selectOne("thirts.searchSpeed_r",id);
	}
	
	public List<SpeedVo> searchAllSpeed(String id) {
		// TODO Auto-generated method stub
		return template.selectList("thirts.searchAllSpeed",id);
	}
	
	public SpeedVo selectOneAllSpeed(int num) {
		// TODO Auto-generated method stub
		return template.selectOne("thirts.selectOneAllSpeed",num);
	}
	
	public List<SpeedVo> selectAllSpeed(String macaddress) {
		// TODO Auto-generated method stub
		return template.selectList("thirts.selectAllSpeed",macaddress);
	}

}
