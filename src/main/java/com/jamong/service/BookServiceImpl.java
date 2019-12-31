package com.jamong.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jamong.dao.BoardDAO;
import com.jamong.dao.BookDAO;
import com.jamong.dao.FeedDAO;
import com.jamong.dao.RecommendDAO;
import com.jamong.dao.SubscribeDAO;
import com.jamong.domain.BoardVO;
import com.jamong.domain.BookVO;
import com.jamong.domain.MemberVO;
import com.jamong.domain.SubscribeVO;

@Service
public class BookServiceImpl implements BookService {

	@Autowired
	private BoardDAO boardDao;	
	@Autowired
	private BookDAO bookDao;
	@Autowired
	private FeedDAO feedDao;
	@Autowired
	private SubscribeDAO subDao;
	@Autowired
	private RecommendDAO recDao;

	@Override
	public List<BoardVO> getBList(String mem_id) {
		return this.bookDao.getBList(mem_id);
	}

	@Override
	public List<BoardVO> getSearchBook(HashMap<String, Object> searchMap) {
		return this.bookDao.getSearchBook(searchMap);
	}

	@Override
	public List<BoardVO> getSearchScrollBook(HashMap<String, Object> searchMap) {
		return this.bookDao.getSearchScrollBook(searchMap);
	}

	@Override
	public List<BoardVO> recomBook() {
		return this.bookDao.recomBook();
	}

	@Override
	public MemberVO getMember(String mem_id) {
		return this.bookDao.getMember(mem_id);
	}

	@Transactional
	@Override
	public void createBook(HashMap<String, Object> bm) {
		this.bookDao.insertBook(bm);
		int book_no = this.bookDao.selectBookNo(bm);
		bm.put("book_no",book_no);
		this.boardDao.updateBookNo(bm);
		List<SubscribeVO> followerList = this.subDao.followerList(bm.get("mem_no"));
		if(followerList.size() > 0) {
			bm.put("fList",followerList);
			this.feedDao.addBookFeed(bm);
		}
	}

	@Override
	public List<BookVO> selectBookList(BookVO b) {
		return this.bookDao.selectBookList(b);
	}

	@Override
	public List<BoardVO> getBKList(int book_no) {
		return this.boardDao.getBKList(book_no);
	}

	@Override
	public BoardVO bookInnerInfo(int book_no) {
		return this.bookDao.bookInnerInfo(book_no);
	}

	@Override
	public List<BoardVO> bookInfoCont(HashMap<String, Object> binfo) {
		return this.boardDao.bookInfoCont(binfo);
	}

	@Override
	public BookVO getBook(int book_no) {
		return this.bookDao.getBook(book_no);
	}

	@Override
	public List<BoardVO> myBookList(int mem_no) {
		return this.bookDao.myBookList(mem_no);
	}
	
	@Transactional
	@Override
	public int recommendUp(BookVO bk) {
		this.recDao.recommendUpInsert(bk);
		this.bookDao.recommendUpUpdate(bk);
		return this.bookDao.recommendNum(bk);
	}

	@Transactional
	@Override
	public int recommendDown(BookVO bk) {
		this.recDao.recommendDownDelete(bk);
		this.bookDao.recommendDownUpdate(bk);
		return this.bookDao.recommendNum(bk);
	}
	
	@Override
	public List<BoardVO> bookScroll(HashMap<Object, Object> bookScroll) {
		return this.bookDao.bookScroll(bookScroll);
	}

	@Override
	public List<BoardVO> bkEditList(HashMap<String, Object> be) {
		return this.boardDao.bkEditList(be);
	}

}
