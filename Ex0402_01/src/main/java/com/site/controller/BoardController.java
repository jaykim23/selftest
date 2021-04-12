package com.site.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.site.dto.BoardDto;
import com.site.service.BoardService;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	Map<String, Object> map;
	
	@RequestMapping("/index")
	public String index() {
		return"/index";
	}
	@RequestMapping("/board/list")	//이게 처음에는 넘어가는게 없으니까 찾을 수가 없지만 @nullable을 쓰면 없어도 넘어간다
	public String list(@RequestParam @Nullable String page,
			@RequestParam @Nullable String category,
			@RequestParam @Nullable String search,Model model) {
		
		map= boardService.boardListAll(page,category,search);
		model.addAttribute("map",map);
		return"/board/list";
	}
	
	@RequestMapping("/board/content_view")
	public String content_view(@RequestParam @Nullable String page,
			@RequestParam @Nullable String category,
			@RequestParam @Nullable String search,
			@RequestParam @Nullable String bid,Model model) {
		map = boardService.boardContent_view(bid,page,category,search);
		model.addAttribute("map",map);
		return"board/content_view";
	}
	
	@RequestMapping("/board/modify")
	public String modify(BoardDto boardDto,@RequestParam @Nullable String page,
			@RequestParam @Nullable String category,
			@RequestParam @Nullable String search,@RequestPart MultipartFile file) throws Exception {
		
		boardService.boardModify(boardDto,file);
		search = URLEncoder.encode(search,"utf-8");
		return "redirect:/board/list?page="+page+"&category="+category+"&search="+search;
	}//write
	
	@RequestMapping("board/modify_view")
	public String modify_view(@RequestParam @Nullable String page,
			@RequestParam @Nullable String category,
			@RequestParam @Nullable String search,
			@RequestParam @Nullable String bid,Model model) {
		map = boardService.boardModify_view(bid,page,category,search);
		model.addAttribute("map",map);
		return"board/modify_view";
	}
	
	@RequestMapping("board/reply_view")
	public String reply_view(@RequestParam @Nullable String page,
			@RequestParam @Nullable String category,
			@RequestParam @Nullable String search,
			@RequestParam @Nullable String bid,Model model) {
		//같아서 또 같은거 들고온다
		map = boardService.boardModify_view(bid,page,category,search);
		model.addAttribute("map",map);
		return"board/reply_view";
	}
	
	@RequestMapping("/board/reply")
	public String reply(BoardDto boardDto,
			@RequestParam @Nullable String page,
			@RequestParam @Nullable String category,
			@RequestParam @Nullable String search,
			@RequestParam @Nullable String bid,@RequestPart MultipartFile file) throws Exception {//파일 받을 때는 requestpart로 받아야 한다.
		
		System.out.println(boardDto.getBcontent());
		boardService.boardReply(boardDto,file);
		search = URLEncoder.encode(search,"utf-8");
		return "redirect:/board/list?page="+page+"&category="+category+"&search="+search;
	}//write
	@RequestMapping("/board/delete")
	public String reply(
			@RequestParam @Nullable String page,
			@RequestParam @Nullable String category,
			@RequestParam @Nullable String search,
			@RequestParam  String bid) throws Exception {//파일 받을 때는 requestpart로 받아야 한다.
		
		boardService.boardDelete(bid);
		search = URLEncoder.encode(search,"utf-8");
		return "redirect:/board/list?page="+page+"&category="+category+"&search="+search;
	}//write
	
	@RequestMapping("/board/write_view")
	public String write_view() {
		return "board/write_view";
	}
	
	@RequestMapping("/board/write")
	public String write(BoardDto boardDto,MultipartFile file) {
		
		boardService.boardWrite(boardDto,file);
		
		return "redirect:/board/list";
	}//write
	@RequestMapping("/board/write1")
	public String write1(BoardDto boardDto,MultipartFile file) {
		
		boardService.boardWrite(boardDto,file);
		
		return "redirect:/board/list";
	}//write
	
	
	
	
	
	
}
