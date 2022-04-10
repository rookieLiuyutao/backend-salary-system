package com.yutao.system.mapper;

import java.util.Date;
import java.util.List;
import com.yutao.system.domain.SysAttendance;
import org.apache.ibatis.annotations.Param;

/**
 * 出勤Mapper接口
 * 
 * @author yutao
 * @date 2022-01-06
 */

public interface SysAttendanceMapper 
{
    /**
     * 查询出勤
     * 
     * @param absenceId 出勤主键
     * @return 出勤
     */
    public SysAttendance selectSysAttendanceByAbsenceId(Long absenceId);

    /**
     * 查询出勤列表
     * 
     * @param sysAttendance 出勤
     * @return 出勤集合
     */
    public List<SysAttendance> selectSysAttendanceList(SysAttendance sysAttendance);

    /**
     * 新增出勤
     * 
     * @param sysAttendance 出勤
     * @return 结果
     */
    public int insertSysAttendance(SysAttendance sysAttendance);

    /**
     * 修改出勤
     * 
     * @param sysAttendance 出勤
     * @return 结果
     */
    public int updateSysAttendance(SysAttendance sysAttendance);

    /**
     * 删除出勤
     * 
     * @param absenceId 出勤主键
     * @return 结果
     */
    public int deleteSysAttendanceByAbsenceId(Long absenceId);

    /**
     * 批量删除出勤
     * 
     * @param absenceIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysAttendanceByAbsenceIds(Long[] absenceIds);

    /**
     * 根据用户id查询迟到次数
     * @param userId
     * @return
     */
    public int countLateTimesByUserId(@Param("userId") Long userId, Date dateTime);
}
