package com.yf.exam.modules.sys.user.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;



/**
* <p>
* 用户角色实体类
* </p>
*
* @author xieRW
* @since 2021-04-13 16:57
*/
@Data
@TableName("sys_user_role")
public class SysUserRole extends Model<SysUserRole> {

    private static final long serialVersionUID = 1L;
    
    /**
    * ID
    */
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;
    
    /**
    * 用户ID
    */
    @TableField("user_id")
    private Long userId;
    
    /**
    * 角色ID
    */
    @TableField("role_id")
    private String roleId;
    
}
