package cn.wxz1997.dao;

import cn.wxz1997.entity.User;

import java.util.List;
import java.util.Map;

public interface UserDao {
    User selectByUsernameAndPasswork(User user);
    User selectByUserId(Integer userId);
    List<User> selectAll(Map<String, Object> params);
    Integer count(Map<String, Object> params);
    void addUser(User user);
}
