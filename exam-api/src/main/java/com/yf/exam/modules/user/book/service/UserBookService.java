package com.yf.exam.modules.user.book.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yf.exam.core.api.dto.PagingReqDTO;
import com.yf.exam.modules.user.book.dto.UserBookDTO;
import com.yf.exam.modules.user.book.entity.UserBook;



/**
* <p>
* 错题本业务类
* </p>
*
* @author xieRW
* @since 2021-05-27 17:56
*/
public interface UserBookService extends IService<UserBook> {

    /**
    * 分页查询数据
    * @param reqDTO
    * @return
    */
    IPage<UserBookDTO> paging(PagingReqDTO<UserBookDTO> reqDTO);

    /**
     * 加入错题本
     * @param quId
     * @param examId
     */
    void addBook(Long examId, Long quId);

    /**
     * 查找第一个错题
     * @param quId
     * @param examId
     * @return
     */
    Long findNext(String examId, String quId);
}
