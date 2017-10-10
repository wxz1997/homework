package cn.wxz1997.service.impl;

import ch.qos.logback.classic.Logger;
import cn.wxz1997.dao.ItemDao;
import cn.wxz1997.dao.UserDao;
import cn.wxz1997.entity.Item;
import cn.wxz1997.entity.User;
import cn.wxz1997.service.HomeworkService;
import cn.wxz1997.util.PageModel;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
public class HomeworkServiceImpl  implements HomeworkService{

    private Logger logger = (Logger) LoggerFactory.getLogger(this.getClass());

    @Autowired
    private UserDao userDao;

    @Autowired
    private ItemDao itemDao;

    //用于混淆md5
    private final String slat = "jfsbjs54543728b*&*65jhdbs[]54";
    //加密
    private String getMD5(String seckillId){
        String base = seckillId + "/" + slat;
        String md5 = DigestUtils.md5DigestAsHex(base.getBytes());
        return md5;
    }

    @Override
    public User login(User user) {
        user.setPassword(getMD5(user.getPassword()));
        User user1 = userDao.selectByUsernameAndPasswork(user);
        return user1;
    }

    @Override
    public User userinfo(Integer userId) {
        User user1 = userDao.selectByUserId(userId);
        return user1;
    }

    @Override
    public List<User> allUser(User user, PageModel pageModel) {
        Map<String,Object> params = new HashMap<>();
        if(user != null){
            params.put("user", user);
        }
        //查询总条数
        int recordCount = userDao.count(params);
        pageModel.setRecordCount(recordCount);

        if(recordCount > 0){
            /** 开始分页查询数据：查询第几页的数据 */
            params.put("pageModel", pageModel);
        }
        List<User> allUser = userDao.selectAll(params);
        return allUser;
    }

    @Override
    public void register(User user) {
        user.setPassword(getMD5(user.getPassword()));
        userDao.addUser(user);
        return;
    }

    @Override
    public void addItem(Item item) {
        itemDao.addItem(item);
        return;
    }

    @Override
    public void updateItem(Item item) {
        itemDao.updateItem(item);
        return;
    }

    @Override
    public void deleteItem(Integer itemId) {
        itemDao.deleteItem(itemId);
        return;
    }

    @Override
    public List<Item> itemList(Item item, PageModel pageModel) {

        Map<String,Object> params = new HashMap<>();
        if(item != null){
            params.put("item", item);
        }
        //查询总条数
        int recordCount = itemDao.count(params);
        pageModel.setRecordCount(recordCount);

        if(recordCount > 0){
            /** 开始分页查询数据：查询第几页的数据 */
            params.put("pageModel", pageModel);
        }
        List<Item> itemList = itemDao.selectList(params);
        return itemList;
    }

    @Override
    public List<Item> allItem(Item item, PageModel pageModel) {
        Map<String,Object> params = new HashMap<>();
        if(item != null){
            params.put("item", item);
        }
        //查询总条数
        int recordCount = itemDao.count(params);
        pageModel.setRecordCount(recordCount);

        if(recordCount > 0){
            /** 开始分页查询数据：查询第几页的数据 */
            params.put("pageModel", pageModel);
        }
        List<Item> allItem = itemDao.selectAll(params);
        return allItem;
    }


    @Override
    public void recevied(Item item) {
        itemDao.addMyItem(item);
        return;
    }

    @Override
    public Item selectByItemId(Integer itemId) {
        return itemDao.selectByItemId(itemId);
    }

    @Override
    public void giveup(Integer itemId) {
        itemDao.updateById(itemId);
        return;
    }

    @Override
    public List<Item> myItem(Integer userId, Item item, PageModel pageModel) {
        Map<String,Object> params = new HashMap<>();
        params.put("userId", userId);
        if(item != null){
            params.put("item", item);
        }
        //查询总条数
        int recordCount = itemDao.count(params);
        pageModel.setRecordCount(recordCount);

        if(recordCount > 0){
            /** 开始分页查询数据：查询第几页的数据 */
            params.put("pageModel", pageModel);
        }
        List<Item> myItem = itemDao.selectMy(params);
        return myItem;
    }

    public List<Item> seeone(Integer userId, Item item, PageModel pageModel) {
        Map<String,Object> params = new HashMap<>();
        params.put("userId", userId);
        if(item != null){
            params.put("item", item);
        }
        //查询总条数
        int recordCount = itemDao.count(params);
        pageModel.setRecordCount(recordCount);

        if(recordCount > 0){
            /** 开始分页查询数据：查询第几页的数据 */
            params.put("pageModel", pageModel);
        }
        List<Item> onesItem = itemDao.selectMy(params);
        return onesItem;
    }

    @Override
    public List<Item> itemPage(Item item, PageModel pageModel) {
        Map<String,Object> params = new HashMap<>();
        if(item != null){
            params.put("item", item);
        }
        //查询总条数
        int recordCount = itemDao.count(params);
        pageModel.setRecordCount(recordCount);

        if(recordCount > 0){
            /** 开始分页查询数据：查询第几页的数据 */
            params.put("pageModel", pageModel);
        }
        List<Item> pageTest = itemDao.selectByPage(params);
        return pageTest;
    }
}
