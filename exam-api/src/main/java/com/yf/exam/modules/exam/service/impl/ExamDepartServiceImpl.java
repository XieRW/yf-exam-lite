package com.yf.exam.modules.exam.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yf.exam.core.exception.ServiceException;
import com.yf.exam.modules.exam.entity.ExamDepart;
import com.yf.exam.modules.exam.mapper.ExamDepartMapper;
import com.yf.exam.modules.exam.service.ExamDepartService;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;

/**
* <p>
* 考试部门业务实现类
* </p>
*
* @author xieRW
* @since 2021-09-03 17:24
*/
@Service
public class ExamDepartServiceImpl extends ServiceImpl<ExamDepartMapper, ExamDepart> implements ExamDepartService {

    @Override
    public void saveAll(Long examId, List<Long> departs) {

        // 先删除
        QueryWrapper<ExamDepart> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(ExamDepart::getExamId, examId);
        this.remove(wrapper);

        // 再增加
        if(CollectionUtils.isEmpty(departs)){
            throw new ServiceException(1, "请至少选择选择一个班级！！");
        }
        List<ExamDepart> list = new ArrayList<>();

        for(Long id: departs){
            ExamDepart depart = new ExamDepart();
            depart.setDepartId(id);
            depart.setExamId(examId);
            list.add(depart);
        }

        this.saveBatch(list);
    }

    @Override
    public List<Long> listByExam(Long examId) {
        // 先删除
        QueryWrapper<ExamDepart> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(ExamDepart::getExamId, examId);
        List<ExamDepart> list = this.list(wrapper);
        List<Long> ids = new ArrayList<>();
        if(!CollectionUtils.isEmpty(list)){
            for(ExamDepart item: list){
                ids.add(item.getDepartId());
            }
        }

        return ids;

    }
}
