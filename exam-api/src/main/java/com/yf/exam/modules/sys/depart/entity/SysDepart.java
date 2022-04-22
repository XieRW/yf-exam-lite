package com.yf.exam.modules.sys.depart.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;



/**
* <p>
* 部门信息实体类
* </p>
*
* @author xieRW
* @since 2021-09-02 17:25
*/
@Data
@TableName("sys_depart")
public class SysDepart extends Model<SysDepart> {

    private static final long serialVersionUID = 1L;
    
    /**
    * ID
    */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;
    
    /**
    * 1公司2部门
    */
    @TableField("dept_type")
    private Integer deptType;
    
    /**
    * 所属上级
    */
    @TableField("parent_id")
    private Long parentId;
    
    /**
    * 部门名称
    */
    @TableField("dept_name")
    private String deptName;
    
    /**
    * 部门编码
    */
    @TableField("dept_code")
    private String deptCode;
    
    /**
    * 排序
    */
    private Integer sort;
    
}
