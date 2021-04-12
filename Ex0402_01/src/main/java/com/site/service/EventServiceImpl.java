package com.site.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.dto.CommentDto;
import com.site.mapper.EventMapper;

@Service
public class EventServiceImpl implements EventService {
	
	@Autowired
	
	EventMapper eventMapper;
	
	
	@Override
	public CommentDto commentWrite_check(CommentDto commentDto) {
		
		//댓글 insert
		eventMapper.insertCommentWrite(commentDto);
		//keyProperty="commentNo" -> commentDto.getCommentNO 로 읽을 수 있음 그니깐 번호를 안에서 셀렉트해서 받은다음 끄렁와서 넣는다.
		int commentNo = commentDto.getCommentNo();
		
		System.out.println("commentDto.getCommentNO() : "+commentDto.getCommentNo());
		System.out.println("commentDto.getCommentDate() : "+commentDto.getCommentDate());
		
		//저장된 insert-> select 해서 가져온다 
		CommentDto dto = eventMapper.selectCommentWrite(commentNo);
		return dto;
	}

}
