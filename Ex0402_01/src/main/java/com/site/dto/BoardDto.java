package com.site.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardDto {
	private int bid;
	private String bname;
	private String btitle;
	private String bcontent;
	private String bdate;
	private int bhit;
	private int bgroup;
	private int bstep;
	private int bindent;
	private String fileName;
}
