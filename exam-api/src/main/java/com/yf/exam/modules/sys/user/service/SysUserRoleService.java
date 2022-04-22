package com.yf.exam.modules.sys.user.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.yf.exam.modules.sys.user.dto.SysUserRoleDTO;
import com.yf.exam.modules.sys.user.entity.SysUserRole;
import com.yf.exam.core.api.dto.PagingReqDTO;

import java.util.List;

/**
* <p>
* 用户角色业务类
* </p>
*
* @author xieRW
* @since 2021-04-13 16:57
*/
public interface SysUserRoleService extends IService<SysUserRole> {

    /**
    * 分页查询数据
    * @param reqDTO
    * @return
    */
    IPage<SysUserRoleDTO> paging(PagingReqDTO<SysUserRoleDTO> reqDTO);

    /**
     * 查找用户角色列表
     * @param userId
     * @return
     */
    List<String> listRoles(Long userId);

    /**
     * 保存全部角色
     * @param userId
     * @param ids
     * @return
     */
    String saveRoles(Long userId, List<String> ids);

    /**
     * 是否学生
     * @param userId
     * @return
     */
    boolean isStudent(Long userId);

    /**
     * 是否老师
     */
    boolean isTeacher(Long userId);

    /**
     * 是否管理
     * @param userId
     * @return
     */
    boolean isAdmin(Long userId);
}
