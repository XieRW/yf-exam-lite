package com.yf.exam.modules.paper.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.yf.exam.modules.paper.dto.ext.PaperQuDetailDTO;
import com.yf.exam.modules.paper.entity.PaperQu;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
* <p>
* 试卷考题Mapper
* </p>
*
* @author xieRW
* @since 2021-05-25 16:33
*/
public interface PaperQuMapper extends BaseMapper<PaperQu> {

    /**
     * 统计客观分
     * @param paperId
     * @return
     */
    int sumObjective(@Param("paperId") Long paperId);

    /**
     * 统计主观分
     * @param paperId
     * @return
     */
    int sumSubjective(@Param("paperId") Long paperId);

    /**
     * 找出全部试题列表
     * @param paperId
     * @return
     */
    List<PaperQuDetailDTO> listByPaper(@Param("paperId") Long paperId);
}


