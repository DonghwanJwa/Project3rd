package com.jamong.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jamong.domain.BoardVO;
import com.jamong.domain.BookVO;
import com.jamong.domain.MemberVO;

@Repository
public class BookDAOImpl implements BookDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<BoardVO> getBList(String mem_id) {
		return this.sqlSession.selectList("create_list",mem_id);
	}

	@Override
	public List<BoardVO> getSearchBook(HashMap<String, Object> searchMap) {
		return this.sqlSession.selectList("search_book",searchMap);
	}

	@Override
	public List<BoardVO> getSearchScrollBook(HashMap<String, Object> searchMap) {
		return this.sqlSession.selectList("search_scroll_book",searchMap);
	}

	@Override
	public List<BoardVO> recomBook() {	
		return this.sqlSession.selectList("index_book");
	}

	@Override
	public MemberVO getMember(String mem_id) {
		return this.sqlSession.selectOne("mem_myinfo",mem_id);
	}

	@Override
	public void insertBook(HashMap<String, Object> bm) {
		this.sqlSession.insert("book_in",bm);
	}

	@Override
	public int selectBookNo(HashMap<String, Object> bm) {
		return this.sqlSession.selectOne("book_sel",bm);
	}

	@Override
	public List<BookVO> selectBookList(BookVO b) {
		return this.sqlSession.selectList("book_list",b);
	}

	@Override
	public BoardVO bookInnerInfo(int book_no) {
		return this.sqlSession.selectOne("book_info",book_no);
	}

	@Override
	public BookVO getBook(int book_no) {
		return this.sqlSession.selectOne("book_get",book_no);
	}

	@Override
	public List<BoardVO> myBookList(int mem_no) {
		return this.sqlSession.selectList("my_book_List",mem_no);
	}
	
  @Override
	public List<BoardVO> bookScroll(HashMap<String, Object> bookScroll) {
		return this.sqlSession.selectList("my_book_scroll",bookScroll);
	}

  @Override
	public void recommendUpUpdate(BookVO bk) {
		this.sqlSession.update("rec_up",bk);
	}

	@Override
	public void recommendDownUpdate(BookVO bk) {
		this.sqlSession.update("rec_down",bk);
	}

	@Override
	public int recommendNum(BookVO bk) {
		return this.sqlSession.selectOne("rec_count",bk);
	}

	@Override
	public void bookDel(int book_no) {
		this.sqlSession.delete("book_del",book_no);
	}

	@Override
	public List<BoardVO> categoryArticleBK(String cat_name) {
		return this.sqlSession.selectList("cat_book_list",cat_name);
	}

	@Override
	public List<BoardVO> bookBannerList() {
		return this.sqlSession.selectList("book_banner");
	}

	@Override
	public List<BookVO> chartBookCount() {
		return this.sqlSession.selectList("BookCount");
	}

}