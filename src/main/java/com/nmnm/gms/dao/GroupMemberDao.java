package com.nmnm.gms.dao;

import java.util.List;
import com.nmnm.gms.domain.Group;
import com.nmnm.gms.domain.GroupMember;

// 데이터를 저장하고 꺼내는 방식(파일, 클라우드저장소, DB 등)에 상관없이
// DAO 사용법을 통일하기 위해
// 메서드 호출 규칙을 정의한다.
//
public interface GroupMemberDao {

	// 회원 초대(추가)
	int insert(GroupMember memberNo) throws Exception;

	// groupNo가 n인 member list
	List<Group> findAll() throws Exception;

	GroupMember findByNo(int memberNo) throws Exception;

	// register 변경
	int update(GroupMember memberNo) throws Exception;

	// 회원 추방
	int delete(int memberNo) throws Exception;

	List<Group> findByKeyword(String keyword) throws Exception;

}