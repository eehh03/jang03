package org.edu.service;

import java.util.List;

import javax.inject.Inject;
import org.edu.dao.IF_BoardDAO;
import org.edu.vo.BoardVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class BoardServiceImpl implements IF_BoardService {

	@Inject
	private IF_BoardDAO boardDAO;

	@Transactional
	@Override
	public void insertBoard(BoardVO boardVO) throws Exception {
		boardDAO.insertBoard(boardVO);
		//board는sql세션필요x dao꺼 불러옴되서.
		//첨부파일용 서비스추가
		String[] files = boardVO.getFiles();
		if(files == null) { return;}//게시판입력시 첨부파일이 null이면 insert만 하고 끝냄
		for(String fileName : files) { //getFiles 여러개면 files로 .
			 boardDAO.insertAttach(fileName);
			}//첨부파일이 5개면 5번 실행되는데 에러나도 트랜잭션(원상복귀)
		}

	@Override
	public List<BoardVO> selectBoard() throws Exception {
		return boardDAO.selectBoard();
	}

	@Override
	public void updateBoard(BoardVO boardVO) throws Exception {
		boardDAO.updateBoard(boardVO);
	}
	
	@Transactional
	@Override
	public void deleteBoard(Integer bno) throws Exception {
		boardDAO.deleteAttach(bno);
		boardDAO.deleteBoard(bno);
	}

	@Override
	public BoardVO viewBoard(Integer bno) throws Exception {
		return boardDAO.viewBoard(bno);
	}

	@Override
	public List<String> selectAttach(Integer bno) throws Exception {
		return boardDAO.selectAttach(bno);
	}
}
