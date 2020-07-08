package org.edu.service;

import java.util.List;

import org.edu.vo.MemberVO;
import org.edu.vo.PageVO;

public interface IF_MemberService {
public void insertMember(MemberVO memberVO) throws Exception;
public List<MemberVO> selectMember(PageVO pageVO) throws Exception;
public void updateMember(MemberVO memberVO) throws Exception;//업데이트시 다른것도 다 보내야 하니 클래스객체를 보냄
public void deleteMember(String user_id) throws Exception;
public MemberVO viewMember(String user_id) throws Exception;
public int countUserId(PageVO pageVO) throws Exception;

}
