package com.yf.exam.modules.sys.config.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;


/**
* <p>
* 通用配置请求类
* </p>
*
* @author xieRW
* @since 2021-04-17 09:12
*/
@Data
@ApiModel(value="通用配置", description="通用配置")
public class SysConfigDTO implements Serializable {

    private static final long serialVersionUID = 1L;


    @ApiModelProperty(value = "ID", required=true)
    private Long id;

    @ApiModelProperty(value = "系统名称")
    private String siteName;

    @ApiModelProperty(value = "前端LOGO")
    private String frontLogo;

    @ApiModelProperty(value = "后台LOGO")
    private String backLogo;
    
}
