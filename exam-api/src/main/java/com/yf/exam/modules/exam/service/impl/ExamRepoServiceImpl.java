package com.yf.exam.modules.exam.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.yf.exam.core.exception.ServiceException;
import com.yf.exam.core.utils.BeanMapper;
import com.yf.exam.modules.exam.dto.ext.ExamRepoExtDTO;
import com.yf.exam.modules.exam.entity.ExamRepo;
import com.yf.exam.modules.exam.mapper.ExamRepoMapper;
import com.yf.exam.modules.exam.service.ExamRepoService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.List;

/**
* <p>
* 考试题库业务实现类
* </p>
*
* @author xieRW
* @since 2021-09-05 11:14
*/
@Service
public class ExamRepoServiceImpl extends ServiceImpl<ExamRepoMapper, ExamRepo> implements ExamRepoService {


    @Transactional(rollbackFor = Exception.class)
    @Override
    public void saveAll(Long examId, List<ExamRepoExtDTO> list) {

        // 先删除
        QueryWrapper<ExamRepo> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(ExamRepo::getExamId, examId);
        this.remove(wrapper);

        // 再增加
        if(CollectionUtils.isEmpty(list)){
            throw new ServiceException(1, "必须选择题库！");
        }
        List<ExamRepo> repos = BeanMapper.mapList(list, ExamRepo.class);
        for(ExamRepo item: repos){
            item.setExamId(examId);
        }

        this.saveBatch(repos);
    }

    @Override
    public List<ExamRepoExtDTO> listByExam(Long examId) {
        return baseMapper.listByExam(examId);
    }

    @Override
    public void clear(Long examId) {

        // 先删除
        QueryWrapper<ExamRepo> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(ExamRepo::getExamId, examId);
        this.remove(wrapper);
    }


}
