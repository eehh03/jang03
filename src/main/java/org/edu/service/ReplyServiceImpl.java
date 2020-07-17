package org.edu.service;

import java.util.List;

import javax.inject.Inject;

import org.edu.dao.IF_ReplyDAO;
import org.edu.vo.ReplyVO;
import org.springframework.stereotype.Service;
@Service
public class ReplyServiceImpl implements IF_ReplyService {
	@Inject
	private IF_ReplyDAO replyDAO;
	
	@Override
	public List<ReplyVO> selectReply(Integer bno) throws Exception {
		return replyDAO.selectReply(bno);
	}

	@Override
	public void insertReply(ReplyVO replyVO) throws Exception {
		replyDAO.insertReply(replyVO);
	}

	@Override
	public void updateReply(ReplyVO replyVO) throws Exception {
		replyDAO.updateReply(replyVO);
	}

	@Override
	public void deleteReply(Integer rno) throws Exception {
		replyDAO.deleteReply(rno);
	}

}
