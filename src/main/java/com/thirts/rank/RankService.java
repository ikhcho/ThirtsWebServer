package com.thirts.rank;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;



@Service("rankService")
public class RankService {
	@Resource(name="rankDao")
	RankDao dao;

	
	public List<RankVo> searchRank_m(String location) {
		return dao.searchRank_m(location);
	}
	public List<RankVo> searchRank_a(String location) {
		return dao.searchRank_a(location);
	}
	public List<RankVo> searchRank_s(String location) {
		return dao.searchRank_s(location);
	}
	
	
}
