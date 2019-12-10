package com.jamong.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.jamong.dao.BoardDAO;
import com.jamong.domain.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO boardDao;

	@Override
	public void insertBoard(BoardVO b) {
		this.boardDao.insertBoard(b);
	}

	@Override
	public List<BoardVO> getListAll(BoardVO b) {
		return this.boardDao.getListAll(b);
	}

}
