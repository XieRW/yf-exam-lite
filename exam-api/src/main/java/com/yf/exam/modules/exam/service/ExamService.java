package com.yf.exam.modules.exam.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yf.exam.core.api.dto.PagingReqDTO;
import com.yf.exam.modules.exam.dto.ExamDTO;
import com.yf.exam.modules.exam.dto.request.ExamSaveReqDTO;
import com.yf.exam.modules.exam.dto.response.ExamOnlineRespDTO;
import com.yf.exam.modules.exam.dto.response.ExamReviewRespDTO;
import com.yf.exam.modules.exam.entity.Exam;

/**
* <p>
* 考试业务类
* </p>
*
* @author xieRW
* @since 2021-07-25 16:18
*/
public interface ExamService extends IService<Exam> {

    /**
     * 保存考试信息
     * @param reqDTO
     */
    void save(ExamSaveReqDTO reqDTO);

    /**
     * 查找考试详情
     * @param id
     * @return
     */
    ExamSaveReqDTO findDetail(Long id);

    /**
     * 查找考试详情--简要信息
     * @param id
     * @return
     */
    ExamDTO findById(Long id);

    /**
    * 分页查询数据
    * @param reqDTO
    * @return
    */
    IPage<ExamDTO> paging(PagingReqDTO<ExamDTO> reqDTO);


    /**
     * 在线考试分页响应类-考生视角
     * @param reqDTO
     * @return
     */
    IPage<ExamOnlineRespDTO> onlinePaging(PagingReqDTO<ExamDTO> reqDTO);


    /**
     * 待阅试卷列表
     * @param reqDTO
     * @return
     */
    IPage<ExamReviewRespDTO> reviewPaging(PagingReqDTO<ExamDTO> reqDTO);
}
