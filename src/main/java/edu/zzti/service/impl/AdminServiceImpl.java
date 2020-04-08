package edu.zzti.service.impl;

import edu.zzti.bean.Admin;
import edu.zzti.dao.AdminMapper;
import edu.zzti.service.AdminService;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service
public class AdminServiceImpl implements AdminService {

    AdminMapper adminMapper;

    public Integer adminLogin(HashMap map) {
        return adminMapper.adminLogin(map);
    }


    public Admin adminFindByLoginname(String loginname) {
        return adminMapper.findByLoginname(loginname);
    }

    public void adminUpdatePassword(String loginname, String newPassword) {
        adminMapper.updatePassword(loginname,newPassword);
    }
}
