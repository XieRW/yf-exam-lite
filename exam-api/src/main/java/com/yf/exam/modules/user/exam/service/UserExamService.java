package com.yf.exam.modules.user.exam.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yf.exam.core.api.dto.PagingReqDTO;
import com.yf.exam.modules.user.exam.dto.request.UserExamReqDTO;
import com.yf.exam.modules.user.exam.dto.response.UserExamRespDTO;
import com.yf.exam.modules.user.exam.entity.UserExam;



/**
* <p>
* 考试记录业务类
* </p>
*
* @author xieRW
* @since 2021-09-21 15:13
*/
public interface UserExamService extends IService<UserExam> {

    /**
    * 分页查询数据
    * @param reqDTO
    * @return
    */
    IPage<UserExamRespDTO> paging(PagingReqDTO<UserExamReqDTO> reqDTO);

    /**
     * 分页查询数据
     * @param reqDTO
     * @return
     */
    IPage<UserExamRespDTO> myPaging(PagingReqDTO<UserExamReqDTO> reqDTO);


    /**
     * 考试完成后加入成绩
     * @param userId
     * @param examId
     * @param score
     * @param passed
     */
    void joinResult(Long userId, Long examId, Integer score, boolean passed);
}
