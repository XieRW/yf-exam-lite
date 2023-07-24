package com.yf.exam.modules.exam.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.yf.exam.modules.exam.entity.ExamDepart;

import java.util.List;

/**
* <p>
* 考试部门业务类
* </p>
*
* @author xieRW
* @since 2021-09-03 17:24
*/
public interface ExamDepartService extends IService<ExamDepart> {

    /**
     * 保存全部
     * @param examId
     * @param departs
     */
    void saveAll(Long examId, List<Long> departs);


    /**
     * 根据考试查找对应的班级
     * @param examId
     * @return
     */
    List<Long> listByExam(Long examId);
}
