package com.jamong.dao;

import java.util.List;

import com.jamong.domain.MemberVO;

public interface AdminMemDAO {

	int memCount(MemberVO me);
	
	List<MemberVO> memList(MemberVO me);

	MemberVO memInfo(int no);

	void memDrop(MemberVO me);

}
