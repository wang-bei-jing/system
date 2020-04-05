package edu.zzti.dao;

import edu.zzti.bean.Admin;
import edu.zzti.bean.AdminExample;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface AdminMapper {

    int adminLogin(HashMap map);
    Admin findByLoginname(String loginname);
    void updatePassword(@Param("loginname") String sno,@Param("password") String password);

    long countByExample(AdminExample example);

    int deleteByExample(AdminExample example);

    int insert(Admin record);

    int insertSelective(Admin record);

    List<Admin> selectByExample(AdminExample example);

    int updateByExampleSelective(@Param("record") Admin record, @Param("example") AdminExample example);

    int updateByExample(@Param("record") Admin record, @Param("example") AdminExample example);
}