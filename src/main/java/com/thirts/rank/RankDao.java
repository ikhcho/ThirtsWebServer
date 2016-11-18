package com.thirts.rank;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;


@Repository("rankDao")
public class RankDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSessionTemplate template;

	public List<RankVo> searchRank_m(String location) {
		// TODO Auto-generated method stub
		return template.selectList("thirts.searchRank_m",location);
	}
	public List<RankVo> searchRank_a(String location) {
		// TODO Auto-generated method stub
		return template.selectList("thirts.searchRank_a",location);
	}
	public List<RankVo> searchRank_s(String location) {
		// TODO Auto-generated method stub
		return template.selectList("thirts.searchRank_s",location);
	}
	
	

}
