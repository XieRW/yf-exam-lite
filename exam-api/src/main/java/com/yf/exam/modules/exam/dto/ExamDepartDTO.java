package com.yf.exam.modules.exam.dto;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;


/**
* <p>
* 考试部门数据传输类
* </p>
*
* @author xieRW
* @since 2021-09-03 17:24
*/
@Data
@ApiModel(value="考试部门", description="考试部门")
public class ExamDepartDTO implements Serializable {

    private static final long serialVersionUID = 1L;
    
    
    @ApiModelProperty(value = "ID", required=true)
    private Long id;
    
    @ApiModelProperty(value = "考试ID", required=true)
    private Long examId;
    
    @ApiModelProperty(value = "部门ID", required=true)
    private String departId;
    
}
