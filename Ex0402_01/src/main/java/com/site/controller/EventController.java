package com.site.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.site.dto.CommentDto;
import com.site.service.EventService;

@Controller
public class EventController {
	
	@Autowired
	EventService eventService;
	
	
	@RequestMapping("/event/event")
	public String event() {
			
		return "/event/event";
	}
	
	
	@RequestMapping("/event/event_view")
	public String event_view() {
		
		return "/event/event_view";
	}
	
	
	@RequestMapping("/event/commentWrite_check")
	//ajax로 보내니까
	@ResponseBody
	public Map<String,Object> commentWrite_check(CommentDto commentDto) {
		Map map = new HashMap<String, Object>();
		System.out.println("getBid : "+commentDto.getBid());
		System.out.println("getCommentContent : "+commentDto.getCommentContent());
		System.out.println("getCommentNo : "+commentDto.getCommentNo());
		System.out.println("getCommentPw : "+commentDto.getCommentPw());
		System.out.println("getId : "+commentDto.getId());
		System.out.println("getCommentDate : "+commentDto.getCommentDate());
		System.out.println("commentDto : "+commentDto.getId());
		//디비에 저장되는게 있기때문에 나중에는 필요 없다
		System.out.println("controller : "+commentDto.getCommentContent());
		CommentDto dto = eventService.commentWrite_check(commentDto);
		
		//DB에서 데이터를 받아올것.
		map.put("dto", dto);
		return map;
	}
	@RequestMapping("/event/commentUpdate_check")
	//ajax로 보내니까
	@ResponseBody
	public Map<String,Object> commentUpdate_check(CommentDto commentDto) {
		Map map = new HashMap<String, Object>();
		System.out.println("commentDto : "+commentDto.getId());
		//디비에 저장되는게 있기때문에 나중에는 필요 없다
		System.out.println("controller : "+commentDto.getCommentContent());
		CommentDto dto = eventService.commentWrite_check(commentDto);
		
		//DB에서 데이터를 받아올것.
		map.put("dto", dto);
		return map;
	}
	
	
}
