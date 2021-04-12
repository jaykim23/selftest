package com.site.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.site.dto.CommentDto;

@Mapper
public interface EventMapper {

	int insertCommentWrite(CommentDto commentDto);

	CommentDto selectCommentWrite(int commentNo);

}
