package edu.zzti.dao;

import edu.zzti.bean.Comment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CommentMapper {

    //xwq开始
    List<Comment> selectPeople(String id);

    List<Comment> selectByTwo(@Param("one") String one,@Param("two") String two);

    List<Comment> selectAll(String id);
    //xwq结束

    int deleteByPrimaryKey(Integer cId);

    int insert(Comment record);

    int insertSelective(Comment record);

    Comment selectByPrimaryKey(Integer cId);

    int updateByPrimaryKeySelective(Comment record);

    int updateByPrimaryKey(Comment record);
}