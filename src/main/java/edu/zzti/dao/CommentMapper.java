package edu.zzti.dao;

import edu.zzti.bean.Comment;

public interface CommentMapper {


    //xwq

    //xwq


    //shc

    //shc
    int deleteByPrimaryKey(Integer cId);

    int insert(Comment record);

    int insertSelective(Comment record);

    Comment selectByPrimaryKey(Integer cId);

    int updateByPrimaryKeySelective(Comment record);

    int updateByPrimaryKey(Comment record);
}