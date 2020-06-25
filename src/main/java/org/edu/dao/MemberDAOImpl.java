package org.edu.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.edu.vo.MemberVO;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements IF_MemberDAO{
	private static String mapperQuery = "org.edu.dao.IF_MemberDAO"; //static 한번쓰고 말거
	
	@Inject
	private SqlSession sqlSession;//sqlSession사용위해 Inject
	//오버라이드-다형성(형태가 다양하다)
	
	@Override
	public void insertMember(MemberVO memberVO) throws Exception {
		sqlSession.insert(mapperQuery + ".insertMember", memberVO);//memberMapper.xml과 연결
		
	}

	@Override
	public List<MemberVO> selectMember() throws Exception {
		return sqlSession.selectList(mapperQuery + ".selectMember");
		
	}

	@Override
	public void updateMember(MemberVO memberVO) throws Exception {
		sqlSession.update(mapperQuery + ".updateMember", memberVO);
		
	}

	@Override
	public void deleteMember(String user_id) throws Exception {
		sqlSession.delete(mapperQuery + ".deleteMember", user_id);
		
	}

}
