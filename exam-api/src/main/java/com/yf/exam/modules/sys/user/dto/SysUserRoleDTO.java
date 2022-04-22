package com.yf.exam.modules.sys.user.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;


/**
* <p>
* 用户角色请求类
* </p>
*
* @author xieRW
* @since 2021-04-13 16:57
*/
@Data
@ApiModel(value="用户角色", description="用户角色")
public class SysUserRoleDTO implements Serializable {

    private static final long serialVersionUID = 1L;
    
    
    @ApiModelProperty(value = "ID", required=true)
    private Long id;
    
    @ApiModelProperty(value = "用户ID", required=true)
    private Long userId;
    
    @ApiModelProperty(value = "角色ID", required=true)
    private Long roleId;
    
}
