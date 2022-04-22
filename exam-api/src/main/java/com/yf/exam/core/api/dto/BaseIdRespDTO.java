package com.yf.exam.core.api.dto;

import com.yf.exam.core.api.dto.BaseDTO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * <p>
 * 主键通用响应类，用于添加后返回内容
 * </p>
 *
 * @author xieRW
 * @since 2021-04-20 12:15
 */
@Data
@ApiModel(value="主键通用响应类", description="主键通用响应类")
@AllArgsConstructor
@NoArgsConstructor
public class BaseIdRespDTO extends BaseDTO {

    @ApiModelProperty(value = "主键ID", required=true)
    private Long id;
}
