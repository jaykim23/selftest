package com.site.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberDto {
	
	private String id;
	private String pw;
	private String name;
	private String nname;
	private String email1;
	private String email2;
	private String tel;
	private String address1;
	private String address2;
	private String gender;
	private String hobby;
	private Timestamp date;
	

}
