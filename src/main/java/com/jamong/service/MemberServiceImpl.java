package com.jamong.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jamong.dao.BoardDAO;
import com.jamong.dao.MemberDAO;
import com.jamong.dao.SympathyDAO;
import com.jamong.domain.BoardVO;
import com.jamong.domain.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDao;
	
	@Autowired
	private SympathyDAO sympathyDao;
	
	@Override
	public void cat_update(MemberVO vo) {
		this.memberDao.cat_update(vo);
	}
	@Transactional
	@Override
	public void mem_update_del(MemberVO vo) {//회원탈퇴
		//this.sympathyDao.mem_update_del(vo);
		this.memberDao.mem_update_del(vo);
	}
	@Override
	public void pass_update(MemberVO vo) {
		this.memberDao.pass_update(vo);
	}
	@Override
	public MemberVO author_info(String mem_id) {
		return memberDao.author_info(mem_id);
	}
	@Override
	public MemberVO memberSelect_pwd(MemberVO vo) {
		return this.memberDao.memberSelect_pwd(vo);
	}
	@Override
	public MemberVO memberSelect_id(MemberVO vo) {
		return this.memberDao.memberSelect_id(vo);
	}

	@Override
	public MemberVO mem_emailCheck(MemberVO m) {
		return this.memberDao.mem_emailCheck(m);
	}	
	
	@Override
	public int memberUpdate(HashMap<String, Object> bm) {
		return this.memberDao.memberUpdate(bm);
	}

	@Override
	public void insertMember(MemberVO m) {
		this.memberDao.insertMember(m);
	}

	@Override
	public MemberVO idCheck(String id) {
		return this.memberDao.idCheck(id); 
	}

	@Override
	public MemberVO loginCheck(String login_id) {
		return this.memberDao.loginCheck(login_id);
	}
    @Override
    public MemberVO pwdCK(String pass_modify_id) {
        return this.memberDao.pwdCK(pass_modify_id);
    }
	@Override
	public MemberVO getMemberID(int mem_no) {
		return this.memberDao.getMemberID(mem_no);
	}
    @Override
	public MemberVO pwdcheck(String pass_modify_id) {
		return this.memberDao.pwdcheck(pass_modify_id);
	}

	@Override
	public MemberVO emailCheck(MemberVO m) {
		return this.memberDao.emailCheck(m);
	}

	@Override
	public MemberVO adminLogin(String adm_id) {
		return this.memberDao.adminLogin(adm_id);
	}

	@Override
	public MemberVO get(String mem_id) {
		return this.memberDao.get(mem_id);
	}

	@Override
	public MemberVO profileCheck(String mem_id) {
		return this.memberDao.profileCheck(mem_id);
	}
  
	@Override
	public MemberVO getMemberFav(int mem_no) {
		return this.memberDao.getMemberFav(mem_no);
	}
	
	@Override
	public List<MemberVO> getSearchMember(HashMap<String, Object> searchMap) {
		return this.memberDao.getSearchMember(searchMap);
	}

	@Override
	public List<MemberVO> getSearchScrollMember(HashMap<String, Object> searchMap) {
		return this.memberDao.getSearchScrollMember(searchMap);
	}
	
	@Override
	public List<MemberVO> recomAuthor() {	
		return this.memberDao.recomAuthor();
	}

	@Override
	public List<MemberVO> categoryMember() {
		return this.memberDao.categoryMember();
	}
	
	@Override
	public void updateProfile(MemberVO mp) {
		this.memberDao.updateProfile(mp);
	}

	@Override
	public MemberVO getAccusee(int ac_member) {
		return this.memberDao.getAccusee(ac_member);
	}
	
}
