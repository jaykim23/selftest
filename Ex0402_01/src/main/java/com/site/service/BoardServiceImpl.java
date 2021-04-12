package com.site.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.site.dto.BoardDto;
import com.site.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardMapper boardMapper;
	@Autowired
	PageNumber pageNumber;

	List<BoardDto> list;
	Map<String, Object> map;
	BoardDto boardDto;
	BoardDto preDto;
	BoardDto nextDto;

	@Override
	// 여기서 매개변수 listpage는 이전에 넘어온게 있는 것이고 밑에 있는 page는 그냥 첨음에 들어왔을때 페이지이다
	public Map<String, Object> boardListAll(String listPage, String category, String search) {
		list = new ArrayList<BoardDto>();
		int page = 1;// 처음 들어왔을때 페이지 초기화
		int limit = 10;// 페이지가 나오는 갯수

		if (listPage != null && listPage != "") {
			page = Integer.parseInt(listPage);
		}

		int startrow = (page - 1) * limit + 1; // 시작 게시글번호 1,11,21...
		int endrow = startrow + limit - 1; // 마지막 게시글번호 10,20,30...

		if (category == null || category.equals("")) {
			list = boardMapper.selectBoardListAll(startrow, endrow);
		} else if (category.equals("title")) { // opt:title search:제목
			list = boardMapper.selectBoardListTitle(startrow, endrow, search);
		} else if (category.equals("content")) { // opt:title search:제목
			list = boardMapper.selectBoardListContent(startrow, endrow, search);
		} else if (category.equals("all")) { // opt:title search:제목
			list = boardMapper.selectBoardListSearchAll(startrow, endrow, search);
		}
		map = pageNumber.pageNumber(page, limit, category, search);
		map.put("list", list);
		return map;
	}// boardListAll

	@Override
	public Map<String, Object> boardContent_view(String bid, String page, String category, String search) {
		// content에 관련한 정보를 가져오기
		// 조회수 1증가
		boardMapper.selectUpHit(bid);
		//content 1개 가져오기
		boardDto = boardMapper.selectBoardContent_view(bid);
		
		//리스트 가져오는 메소드
		if (category == null || category.equals("")) {
			//이전글 다음글 가지고 옴
			preDto=boardMapper.selectBoardContent_pre(bid);
			nextDto=boardMapper.selectBoardContent_next(bid);
		} else if (category.equals("title")) { // opt:title search:제목
			preDto=boardMapper.selectBoardContent_preTitle(bid);
			nextDto = boardMapper.selectBoardContent_nextTitle(bid);
		} else if (category.equals("content")) { // opt:title search:제목
			preDto = boardMapper.selectBoardContent_preContent(bid);
			nextDto=boardMapper.selectBoardContent_nextContent(bid);
		} else if (category.equals("all")) { // opt:title search:제목
			preDto = boardMapper.selectBoardContent_preAll(bid);
			nextDto = boardMapper.selectBoardContent_nextAll(bid);
		}
		
		
		
		
		
		map.put("boardDto", boardDto);
		map.put("preDto", preDto);
		map.put("nextDto", nextDto);
		map.put("category", category);
		map.put("search", search);
		map.put("page", page);
		return map;
	}// boardContent_view

	@Override
	public void boardWrite(BoardDto boardDto, MultipartFile file) {
		// 원본파일이름
		String fileName = file.getOriginalFilename();
		// 확장자명 가져오기
		String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase();
		if (fileNameExtension != "") {
			String fileUrl = "C:/workspace/Ex0402_01/src/main/resources/static/upload/";
			// 파일 이름 재정의
			String uploadFileName = RandomStringUtils.randomAlphanumeric(20) + "." + fileNameExtension;
			
			File f = new File(fileUrl + uploadFileName);
			try {
				file.transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 파일이름저장
			boardDto.setFileName(uploadFileName);
		} else {
			boardDto.setFileName("");
		}

		// mapper전달
		boardMapper.insertBoardWrite(boardDto);

	}// boardWrite

	@Override
	public void boardModify(BoardDto boardDto, MultipartFile file) {
		// 원본파일이름
		String org_fileName = file.getOriginalFilename();
		System.out.println("impl : " + org_fileName);
		if (file.getSize() != 0) { // 파일사이즈가 0이 아니면
			// 파일 저장 위치
			String fileUrl = "C:/workspace/Ex0402_01/src/main/resources/static/upload/";
			// 신규파일이름(32자리 이름 생성.확장자명)
			long time = System.currentTimeMillis();
			String uploadFileName = String.format("%d_%s", time, org_fileName);
			File f = new File(fileUrl + uploadFileName);
			try {
				file.transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 파일이름저장
			boardDto.setFileName(uploadFileName);
		} else {
			// 기존 파일이름을 그대로 저장시키면 됨.
			// boardDto.setFileName("");
		}

		// mapper전달
		boardMapper.updateBoardModify(boardDto);

		return;
	}// boardWrite

	@Override
	public Map<String, Object> boardModify_view(String bid, String page, String category, String search) {
		// 콘텐츠 한개 가져오기
		boardDto = boardMapper.selectBoardContent_view(bid);// 모디파이랑 똑같기 떄문에
		map.put("boardDto", boardDto);
		map.put("category", category);
		map.put("search", search);
		map.put("page", page);
		return map;
	}

	@Override
	public void boardReply(BoardDto boardDto, MultipartFile file) {
		// 원본파일이름
		String org_fileName = file.getOriginalFilename();
		System.out.println("impl : " + org_fileName);
		if (file.getSize() != 0) { // 파일사이즈가 0이 아니면
			// 파일 저장 위치
			String fileUrl = "C:/workspace/Ex0402_01/src/main/resources/static/upload/";
			// 신규파일이름(32자리 이름 생성.확장자명)
			long time = System.currentTimeMillis();
			String uploadFileName = String.format("%d_%s", time, org_fileName);
			File f = new File(fileUrl + uploadFileName);
			try {
				file.transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 파일이름저장
			boardDto.setFileName(uploadFileName);
		} else {
			// 기존 파일이름을 그대로 저장시키면 됨.
			boardDto.setFileName("");
		}

		// mapper전달
		boardMapper.insertBoardReply(boardDto);
		boardMapper.insertBoardReplyPlus(boardDto);
		return;
	}

	@Override
	public void boardDelete(String bid) {
		boardMapper.deleteBoardDelete(bid);
	}

}// BoardServiceImpl
