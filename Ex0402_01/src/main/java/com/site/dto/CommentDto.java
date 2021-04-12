package com.site.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommentDto {
	
	private int commentNo;
	private int bid;//BoardDto
	private String id; //MemberDto
	private String commentPw;
	private String commentContent;
	private Timestamp commentDate;
	
	
}
