package com.site.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.site.dto.BoardDto;

@Mapper
public interface BoardMapper {
	
	//list
	List<BoardDto> selectBoardListAll(int startrow, int endrow);
	int listCount();
	List<BoardDto> selectBoardListTitle(int startrow, int endrow, String search);
	int listCountTitle(String search);
	List<BoardDto> selectBoardListContent(int startrow, int endrow, String search);
	int listCountContent(String search);
	List<BoardDto> selectBoardListSearchAll(int startrow, int endrow, String search);
	int listCountSearchAll(String search);
	
	
	//content_view
	BoardDto selectBoardContent_view(String bid);
	//전체 앞뒤
	BoardDto selectBoardContent_pre(String bid);
	BoardDto selectBoardContent_next(String bid);
	//제목 검색
	BoardDto selectBoardContent_preTitle(String bid);
	BoardDto selectBoardContent_nextTitle(String bid);
	//내용 검색
	BoardDto selectBoardContent_preContent(String bid);
	BoardDto selectBoardContent_nextContent(String bid);
	//전체 검색
	BoardDto selectBoardContent_preAll(String bid);
	BoardDto selectBoardContent_nextAll(String bid);
	
	//hit
	void selectUpHit(String bid);
	
	//write
	void insertBoardWrite(BoardDto boardDto);
	//modify
	void updateBoardModify(BoardDto boardDto);
	//reply
	void insertBoardReply(BoardDto boardDto);
	void insertBoardReplyPlus(BoardDto boardDto);
	void deleteBoardDelete(String bid);



}
