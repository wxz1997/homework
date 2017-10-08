package cn.wxz1997.entity;

import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;
import java.util.Date;

public class Item implements Serializable{
    private Integer itemId;
    private User createUser;
    private Date createTime;
    private User receviedUser;
    private Date receviedTime;
    private String itemName; //名称
    private String introduction; //简介
    private String fileName; //文件名
    private MultipartFile file;		// 文件
    private Integer status; //接收状态
    private Integer success; //是否完成

    public Item() {
    }

    public Integer getItemId() {
        return itemId;
    }

    public void setItemId(Integer itemId) {
        this.itemId = itemId;
    }

    public User getCreateUser() {
        return createUser;
    }

    public void setCreateUser(User createUser) {
        this.createUser = createUser;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public User getReceviedUser() {
        return receviedUser;
    }

    public void setReceviedUser(User receviedUser) {
        this.receviedUser = receviedUser;
    }

    public Date getReceviedTime() {
        return receviedTime;
    }

    public void setReceviedTime(Date receviedTime) {
        this.receviedTime = receviedTime;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public Integer getSuccess() {
        return success;
    }

    public void setSuccess(Integer success) {
        this.success = success;
    }

    @Override
    public String toString() {
        return "Item{" +
                "itemId=" + itemId +
                ", createUser=" + createUser +
                ", createTime=" + createTime +
                ", receviedUser=" + receviedUser +
                ", receviedTime=" + receviedTime +
                ", itemName='" + itemName + '\'' +
                ", introduction='" + introduction + '\'' +
                ", fileName='" + fileName + '\'' +
                ", file=" + file +
                ", status=" + status +
                ", success=" + success +
                '}';
    }
}
