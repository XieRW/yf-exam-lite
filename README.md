# 在线考试系统

# 项目演示
项目地址：https://github.com/XieRW/yf-exam-lite.git
管理账号：admin/admin 学员账号：person/person

# 介绍
一款多角色在线培训考试系统，系统集成了用户管理、角色管理、班级管理、题库管理、试题管理、试题导入导出、考试管理、在线考试、错题训练等功能，考试流程完善。


# 技术栈
SpringBoot / Redis / Shiro / Vue / MySQL

# 产品功能

## 系统完善：完善的权限控制和用户系统
权限控制：基于Shiro和JWT开发的权限控制功能。    
用户系统：用户管理、班级管理、角色管理等。    

## 多角色：多角色支持    
考试端：学生学员角色、支持在线考试、查看分数、训练错题。    
管理端：题库管理、试题管理、考试管理、用户班级管理、查看考试情况等等。    

## 定员考试：考试权限定义    
完全公开：任何人员都可以参与考试。    
指定部门：只有选中部门的人员才可以看到考试。    

## 多题型：常用题型支持    
支持题型：单选题、多选题、判断题。    
难易程度：普通、困难。    

## 便捷组卷：题库组卷    
题库组卷：指定题库、分数、数量；题目、选项随机排序、杜绝作弊    


# 环境要求
JDK 1.8+  [点此下载](https://cdn.yfhl.net/java-win/jdk-8u181-windows-x64.exe)        
Mysql5.7+  [点此下载](https://cdn.yfhl.net/java-win/mysql-installer-community-5.7.31.0.msi)    

# 安装资源
1、安装JDK1.8    
https://cdn.yfhl.net/java-win/jdk-8u181-windows-x64.exe     

2、安装MySQL    
https://cdn.yfhl.net/java-win/mysql-installer-community-5.7.31.0.msi    
-- 安装过程可能需要VC++    
-- https://www.microsoft.com/zh-cn/download/confirmation.aspx?id=40784    
-- 安装数据库管理工具    
https://cdn.yfhl.net/java-win/SQLyog.12.3.1.0.zip    

# 快速运行
1、自行安装MySQL数据库（版本最好大于5.7），将`安装资源中`的`数据库初始化.sql`导入到安装好的数据库    
2、安装Java环境，要求JDK版本大于1.8
3、请修改外置配置文件：application.properties 改成您自己的MySQL配置    
4、Windows通过start.bat运行，Linux运行start.sh运行    
5、如果无意外，可通过：http://localhost:8101 访问到项目了    
6、管理员账号密码：admin/admin 学员账号：person/person