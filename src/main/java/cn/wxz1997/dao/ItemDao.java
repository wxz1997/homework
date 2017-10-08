package cn.wxz1997.dao;

import cn.wxz1997.entity.Item;
import cn.wxz1997.util.PageModel;

import java.util.List;
import java.util.Map;

public interface ItemDao {
    void addItem(Item item);
    void updateItem(Item item);
    void deleteItem(Integer itemId);
    List<Item> selectAll(Map<String, Object> params);
    List<Item> selectList(Map<String, Object> params);
    List<Item> selectMy(Map<String, Object> params);
    Item selectByItemId(Integer itemId);
    void addMyItem(Item item);
    void updateById(Integer itemId);
    Item selectByReceviedId(Integer receviedId);
    Integer count(Map<String, Object> params);
    List<Item> selectByPage(Map<String, Object> params);
}
