package com.ruoyi.system.service;

import java.util.Date;
import java.util.List;
import com.ruoyi.system.domain.SysAttendance;

/**
 * 出勤Service接口
 * 
 * @author ruoyi
 * @date 2022-01-06
 */
public interface ISysAttendanceService 
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
     * 批量删除出勤
     * 
     * @param absenceIds 需要删除的出勤主键集合
     * @return 结果
     */
    public int deleteSysAttendanceByAbsenceIds(Long[] absenceIds);

    /**
     * 删除出勤信息
     * 
     * @param absenceId 出勤主键
     * @return 结果
     */
    public int deleteSysAttendanceByAbsenceId(Long absenceId);




}
