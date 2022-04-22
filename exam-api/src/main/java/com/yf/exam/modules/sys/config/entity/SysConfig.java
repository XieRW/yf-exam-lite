package com.yf.exam.modules.sys.config.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;



/**
* <p>
* 通用配置实体类
* </p>
*
* @author xieRW
* @since 2021-04-17 09:12
*/
@Data
@TableName("sys_config")
public class SysConfig extends Model<SysConfig> {

    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    @TableId(value = "id", type = IdType.ID_WORKER_STR)
    private Long id;

    /**
     * 系统名称
     */
    @TableField("site_name")
    private String siteName;

    /**
     * 前端LOGO
     */
    @TableField("front_logo")
    private String frontLogo;

    /**
     * 后台LOGO
     */
    @TableField("back_logo")
    private String backLogo;
    
}
