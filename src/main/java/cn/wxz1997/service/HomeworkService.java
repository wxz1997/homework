package cn.wxz1997.service;

import cn.wxz1997.entity.Item;
import cn.wxz1997.entity.User;
import cn.wxz1997.util.PageModel;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.List;

public interface HomeworkService {
    User login(User user);
    User userinfo(Integer userId);
    List<User> allUser(User user, PageModel pageModel);
    void register(User user);

    void addItem(Item item);
    void updateItem(Item item);
    void deleteItem(Integer itemId);
    List<Item> itemList(Item item, PageModel pageModel);
    List<Item> allItem(Item item, PageModel pageModel);
    List<Item> myItem(Integer userId, Item item, PageModel pageModel);
    List<Item> seeone(Integer userId, Item item, PageModel pageModel);
    void recevied(Item item);
    Item selectByItemId(Integer itemId);
    void giveup(Integer itemId);
    List<Item> itemPage(Item item, PageModel pageModel);
}
