package com.site.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.dto.MemberDto;
import com.site.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberMapper memberMapper;

	@Override
	public Map loginCheck(String id, String pw) {
		Map map = new HashMap<String, Object>();
		MemberDto memberDto = memberMapper.selectLoginCheck(id,pw);
		String message = "id와 pw가 일치하지 않습니다.";
		int loginCheck=-1;
		if(memberDto != null) {
			loginCheck=1;//dto 데이터가 있으면 성공!
			message="로그인이 정상적으로 되었습니다.";
		}
		map.put("memberDto", memberDto);
		map.put("loginCheck", loginCheck);
		map.put("message", message);

		return map;
	}
	

	
}
