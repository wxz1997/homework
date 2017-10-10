package cn.wxz1997.controller;

import cn.wxz1997.entity.Item;
import cn.wxz1997.entity.User;
import cn.wxz1997.service.HomeworkService;
import cn.wxz1997.util.Constants;
import cn.wxz1997.util.PageModel;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.jws.WebParam;
import javax.mail.Session;
import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/item")
public class ItemController {

    @Autowired
    private HomeworkService homeworkService;

    @RequestMapping("/addItem")
    public ModelAndView addDocument(
            Item item,
            ModelAndView mv,
            HttpSession session)throws Exception{
            if(!item.getFile().isEmpty()) {
                // 上传文件路径
                String path = session.getServletContext().getRealPath("/upload/");
                System.out.println(path);
                // 上传文件名
                String fileName = item.getFile().getOriginalFilename();
                File filepath = new File(path,fileName);
                // 判断路径是否存在，如果不存在就创建一个
                if (!filepath.getParentFile().exists()) {
                    filepath.getParentFile().mkdirs();
                }
                // 将上传文件保存到一个目标文件当中
                item.getFile().transferTo(new File(path+File.separator+ fileName));
                // 设置fileName
                item.setFileName(fileName);
            }
            // 设置任务创建者
            item.setCreateUser((User) session.getAttribute("user_session"));
            // 插入数据库
            homeworkService.addItem(item);
            mv.setViewName("redirect:/item/allItem");
            // 返回
            return mv;
    }


    @RequestMapping(value="/downLoad")
    public ResponseEntity<byte[]> downLoad(Integer id, HttpSession session) throws Exception{
        // 根据id查询文档
        Item target = homeworkService.selectByItemId(id);
        String fileName = target.getFileName();
        // 上传文件路径
        String path = session.getServletContext().getRealPath("/upload/");
        // 获得要下载文件的File对象
        File file = new File(path+File.separator+ fileName);
        // 创建springframework的HttpHeaders对象
        HttpHeaders headers = new HttpHeaders();
        // 下载显示的文件名，解决中文名称乱码问题
        String downloadFielName = new String(fileName.getBytes("UTF-8"),"iso-8859-1");
        // 通知浏览器以attachment（下载方式）打开图片
        headers.setContentDispositionFormData("attachment", downloadFielName);
        // application/octet-stream ： 二进制流数据（最常见的文件下载）。
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        // 201 HttpStatus.CREATED
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
        headers, HttpStatus.CREATED);
    }



    @RequestMapping("/recevied")
    public String recevied(ModelAndView mv, Integer id, HttpSession session){
        Item item = homeworkService.selectByItemId(id);
        if(item.getStatus() == 0){
            item.setReceviedUser((User)session.getAttribute("user_session"));
            item.setReceviedTime(new Date());
            item.setStatus(1);
            homeworkService.recevied(item);
            return "redirect:/item/myItem";
        }
        return "redirect:/item/itemList";
    }


    @RequestMapping("/itemList")
    public ModelAndView itemList(ModelAndView mv, Item item, Integer pageIndex){
        // 创建分页对象
        PageModel pageModel = new PageModel();
        // 如果参数pageIndex不为null，设置pageIndex，即显示第几页
        if(pageIndex != null){
            pageModel.setPageIndex(pageIndex);
        }
        List<Item> itemList = homeworkService.itemList(item, pageModel);
        mv.addObject("pageModel", pageModel);
        mv.addObject("itemList", itemList);
        mv.setViewName("itemList");
        return mv;
    }

    @RequestMapping("/allItem")
    public ModelAndView allItem(Integer pageIndex, @RequestParam(value="stat", required=false)String stat,Item item, ModelAndView mv){
        if(stat != null && stat!=""){
            Integer status = Integer.parseInt(stat);
            item.setStatus(status);
        }

        // 创建分页对象
        PageModel pageModel = new PageModel();
        // 如果参数pageIndex不为null，设置pageIndex，即显示第几页
        if(pageIndex != null){
            pageModel.setPageIndex(pageIndex);
        }
        List<Item> allItem = homeworkService.allItem(item, pageModel);
        mv.addObject("pageModel", pageModel);
        mv.addObject("allItem", allItem);
        mv.setViewName("allItem");
        return mv;
    }

    @RequestMapping("/myItem")
    public ModelAndView myItem(ModelAndView mv, HttpSession session, Item item, Integer pageIndex){
        // 创建分页对象
        PageModel pageModel = new PageModel();
        // 如果参数pageIndex不为null，设置pageIndex，即显示第几页
        if(pageIndex != null){
            pageModel.setPageIndex(pageIndex);
        }
        List<Item> myItem = homeworkService.myItem(((User)session.getAttribute("user_session")).getUserId(), item, pageModel);
        mv.addObject("pageModel", pageModel);
        mv.addObject("myItem", myItem);
        mv.setViewName("myItem");
        return mv;
    }

    @RequestMapping("/seeone")
    public ModelAndView seeone(ModelAndView mv, Integer id, Item item, Integer pageIndex){
        // 创建分页对象
        PageModel pageModel = new PageModel();
        // 如果参数pageIndex不为null，设置pageIndex，即显示第几页
        if(pageIndex != null){
            pageModel.setPageIndex(pageIndex);
        }
        List<Item> onesItem = homeworkService.seeone(id, item, pageModel);
        mv.addObject("pageModel", pageModel);
        mv.addObject("onesItem", onesItem);
        mv.setViewName("onesItem");
        return mv;
    }

    @RequestMapping(value="/pageTest")
    public ModelAndView pageTest(Integer pageIndex,
                                 Item item,
                                 ModelAndView mv){

        System.out.println("**********test**********" + item);
        // 创建分页对象
        PageModel pageModel = new PageModel();
        // 如果参数pageIndex不为null，设置pageIndex，即显示第几页
        if(pageIndex != null){
            pageModel.setPageIndex(pageIndex);
        }

        List<Item> itemPage = homeworkService.itemPage(item, pageModel);

        mv.addObject("itemPage", itemPage);
        mv.addObject("pageModel", pageModel);
        // 返回页面
        mv.setViewName("pageTest");
        return mv;
    }

    @RequestMapping("/giveup")
    public String giveup(Integer id){
        homeworkService.giveup(id);
        return "redirect:/item/myItem";
    }

    @RequestMapping("/deleteItem")
    public String deleteItem(Integer id ){
        homeworkService.deleteItem(id);
        return "redirect:/item/allItem";
    }

    @RequestMapping("/toUpdateItem")
    public String toUpdateItem(Integer id , Model model){
        Item item = homeworkService.selectByItemId(id);
        System.out.println(item);
        model.addAttribute("item", item);
        return "updateItem";
    }

    @RequestMapping("/updateItem")
    public String updateItem(Item item, HttpSession session)throws Exception{
        if(!item.getFile().isEmpty()) {
            // 上传文件路径
            String path = session.getServletContext().getRealPath("/upload/");
            System.out.println(path);
            // 上传文件名
            String fileName = item.getFile().getOriginalFilename();
            File filepath = new File(path,fileName);
            // 判断路径是否存在，如果不存在就创建一个
            if (!filepath.getParentFile().exists()) {
                filepath.getParentFile().mkdirs();
            }
            // 将上传文件保存到一个目标文件当中
            item.getFile().transferTo(new File(path+File.separator+ fileName));
            // 设置fileName
            item.setFileName(fileName);
        }

        homeworkService.updateItem(item);
        return "redirect:/item/allItem";
    }

}
