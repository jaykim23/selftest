package com.site.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.site.dto.BoardDto;

public interface BoardService {

	Map<String, Object> boardListAll(String page, String category, String search);

	Map<String, Object> boardContent_view(String bid, String page, String category, String search);

	Map<String, Object> boardModify_view(String bid, String page, String category, String search);

	void boardWrite(BoardDto boardDto, MultipartFile file);

	void boardModify(BoardDto boardDto, MultipartFile file);

	void boardReply(BoardDto boardDto, MultipartFile file);

	void boardDelete(String bid);


}
