package com.yf.exam.modules.qu.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import lombok.Data;



/**
* <p>
* 试题题库实体类
* </p>
*
* @author xieRW
* @since 2021-05-25 13:23
*/
@Data
@TableName("el_qu_repo")
public class QuRepo extends Model<QuRepo> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 试题
     */
    @TableField("qu_id")
    private Long quId;

    /**
     * 归属题库
     */
    @TableField("repo_id")
    private Long repoId;

    /**
     * 题目类型
     */
    @TableField("qu_type")
    private Integer quType;

    /**
     * 排序
     */
    private Integer sort;
    
}
