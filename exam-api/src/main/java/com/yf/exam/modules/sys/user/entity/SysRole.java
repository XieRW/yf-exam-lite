package com.yf.exam.modules.sys.user.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;



/**
* <p>
* 角色实体类
* </p>
*
* @author xieRW
* @since 2021-04-13 16:57
*/
@Data
@TableName("sys_role")
public class SysRole extends Model<SysRole> {

    private static final long serialVersionUID = 1L;
    
    /**
    * 角色ID编码
    */
    @TableId(value = "id", type = IdType.AUTO)
    private String id;
    
    /**
    * 角色名称
    */
    @TableField("role_name")
    private String roleName;
    
}
