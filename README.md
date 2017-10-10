# homework
任务管理系统说明
开发工具：    idea + Tomcat + MySQL
框架： ssm + maven
主要功能：用户，任务的增删改查（模糊查询），文件的上传下载
数据表：
任务表：status表示任务是否被接收，success表示任务是否完成
用户表:（用户表的code, status本来打算用于邮箱认证，不过时间不够就没去做了）
修改：新增了md5加密，还有拦截器功能，修复了select选择条件出错的bug,界面做了微调，不过还是炒鸡丑（勿怪）。
管理员：admin/admin  普通用户：user/user
