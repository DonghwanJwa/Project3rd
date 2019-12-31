package com.jamong.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jamong.dao.BoardDAO;
import com.jamong.dao.FeedDAO;
import com.jamong.dao.MemberDAO;
import com.jamong.dao.ReplyDAO;
import com.jamong.dao.SubscribeDAO;
import com.jamong.dao.SympathyDAO;
import com.jamong.domain.BoardVO;
import com.jamong.domain.SubscribeVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDao;
	@Autowired
	private MemberDAO memberDao;
	@Autowired
	private SympathyDAO sympathyDao;
	@Autowired
	private ReplyDAO replyDao;
	@Autowired
	private SubscribeDAO subDao;
	@Autowired
	private FeedDAO feedDao;

	@Transactional
	@Override
	public void insertBoard(HashMap<String, Object> bm,int mem_no) {
		this.boardDao.insertBoard(bm);
		this.memberDao.updateArticleCount(mem_no,1);
		BoardVO articleVO = this.boardDao.newArticleNum(bm.get("mem_no"));
		// 최신글 번호( 세션 아이디에서 가장 최근 게시글 )
		List<SubscribeVO> followerList = this.subDao.followerList(bm.get("mem_no"));
		// 팔로우내역 셀렉트( 세션 아이디로 )
		if(followerList.size() > 0 && articleVO.getBo_lock() == 1) {
			bm.put("fList",followerList);
			bm.put("aVO",articleVO);
			this.feedDao.addArticleFeed(bm);
			// 피드를 인서트 함
		}
	}

	@Transactional
	@Override
	public BoardVO getUserBoardCont(int bo_no) {
		this.boardDao.updateHit(bo_no);
		return this.boardDao.getUserBoardCont(bo_no);
	}

	@Override
	public List<BoardVO> getListAll(BoardVO b) {
		return this.boardDao.getListAll(b);
	}

	@Override
	public List<BoardVO> recomArticle() {
		return this.boardDao.recomArticle();
	}

	@Transactional
	@Override
	public int sympathyUp(BoardVO bo) {
		this.sympathyDao.sympathyUpInsert(bo);
		this.boardDao.sympathyUpUpdate(bo);
		return this.boardDao.sympathyNum(bo);
	}

	@Transactional
	@Override
	public int sympathyDown(BoardVO bo) {
		this.sympathyDao.sympathyDownDelete(bo);
		this.boardDao.sympathyDownUpdate(bo);
		return this.boardDao.sympathyNum(bo);
	}	

	@Override
	public int switchBoardLock(BoardVO bo) {
		return this.boardDao.switchBoardLock(bo);
	}

	@Override
	public int boardBan(BoardVO bo) {
		return this.boardDao.boardBan(bo);
	}

	@Override
	public List<BoardVO> bestList() {	
		List<BoardVO> blist = this.boardDao.bestList(); 
		for(BoardVO b : blist) {
			String titleText = b.getBo_title();
			String titleChanged = titleText.replaceAll("(?s)<[^>]*>(\\s*<[^>]*>)*"," ");
			b.setBo_title(titleChanged);
		}
		return blist;
	}

	@Override
	public List<BoardVO> getSearchPost(HashMap<String, Object> searchMap) {
		return this.boardDao.getSearchPost(searchMap);
	}

	@Override
	public List<BoardVO> getSearchScrollPost(HashMap<String, Object> searchMap) {
		return this.boardDao.getSearchScrollPost(searchMap);
	}

	@Override
	public List<BoardVO> infinitiScrollDown(int bo_no) {
		return this.boardDao.infinitiScrollDown(bo_no);
	}

	@Override
	public List<BoardVO> getUserBoardCatArticle(String cat_name) {
		return this.boardDao.getUserBoardCatArticle(cat_name);
	}

	@Override
	public List<BoardVO> categoryArticle(String cat_name) {
		return this.boardDao.categoryArticle(cat_name);
	}

	@Override
	public List<BoardVO> getProfile(int mem_no) {
		return this.boardDao.getProfile(mem_no);
	}

	@Transactional
	@Override
	public void articleDelete(int bo_no,int mem_no) {
		this.boardDao.articleDelete(bo_no);
		this.replyDao.replyDelete(bo_no);
		this.sympathyDao.sympathyArticleDelete(bo_no);
		this.memberDao.updateArticleCount(mem_no,-1);
	}

	@Override
	public List<BoardVO> getUserBoardContList(int mem_no) {
		return this.boardDao.getUserBoardContList(mem_no);
	}

	@Override
	public void updateBoard(HashMap<String, Object> bm) {
		this.boardDao.updateBoard(bm);
	}

	@Override
	public BoardVO getNextBoardCont(HashMap<String, Object> bm) {
		return this.boardDao.getNextBoardCont(bm);
	}

	@Override
	public BoardVO getPreBoardCont(HashMap<String, Object> bm) {
		return this.boardDao.getPreBoardCont(bm);
	}

	@Override
	public List<BoardVO> profileScroll(HashMap<Object, Object> scroll) {
		return this.boardDao.profileScroll(scroll);
	}
	
	
}
