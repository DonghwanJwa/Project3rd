package com.jamong.service;

import java.util.List;

import com.jamong.domain.MemberVO;

public interface AdminMemService {
	
	int memCount(MemberVO me);
	
	List<MemberVO> memList(MemberVO me);

	MemberVO memberInfo(int no);

	void memDrop(MemberVO me);

	void memRestore(MemberVO me);

}
