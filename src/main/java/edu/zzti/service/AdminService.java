package edu.zzti.service;

import edu.zzti.bean.Admin;
import java.util.HashMap;

public interface AdminService {
    //shc
    Integer adminLogin(HashMap map);
    Admin adminFindByLoginname(String loginname);
    void adminUpdatePassword(String loginname,String newPassword);
}

