package com.ruoyi.system.service.impl;

import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SysAttendanceMapper;
import com.ruoyi.system.domain.SysAttendance;
import com.ruoyi.system.service.ISysAttendanceService;

/**
 * 出勤Service业务层处理
 * 
 * @author ruoyi
 * @date 2022-01-06
 */
@Service
public class SysAttendanceServiceImpl implements ISysAttendanceService 
{
    @Autowired
    private SysAttendanceMapper sysAttendanceMapper;

    /**
     * 查询出勤
     * 
     * @param absenceId 出勤主键
     * @return 出勤
     */
    @Override
    public SysAttendance selectSysAttendanceByAbsenceId(Long absenceId)
    {
        return sysAttendanceMapper.selectSysAttendanceByAbsenceId(absenceId);
    }

    /**
     * 查询出勤列表
     * 
     * @param sysAttendance 出勤
     * @return 出勤
     */
    @Override
    public List<SysAttendance> selectSysAttendanceList(SysAttendance sysAttendance)
    {
        return sysAttendanceMapper.selectSysAttendanceList(sysAttendance);
    }

    /**
     * 新增出勤
     * 
     * @param sysAttendance 出勤
     * @return 结果
     */
    @Override
    public int insertSysAttendance(SysAttendance sysAttendance)
    {
        if (sysAttendance.getUpdateTime()==null){
            sysAttendance.setUpdateTime(new Date());

        }
        return sysAttendanceMapper.insertSysAttendance(sysAttendance);
    }

    /**
     * 修改出勤
     * 
     * @param sysAttendance 出勤
     * @return 结果
     */
    @Override
    public int updateSysAttendance(SysAttendance sysAttendance)
    {
        return sysAttendanceMapper.updateSysAttendance(sysAttendance);
    }

    /**
     * 批量删除出勤
     * 
     * @param absenceIds 需要删除的出勤主键
     * @return 结果
     */
    @Override
    public int deleteSysAttendanceByAbsenceIds(Long[] absenceIds)
    {
        return sysAttendanceMapper.deleteSysAttendanceByAbsenceIds(absenceIds);
    }

    /**
     * 删除出勤信息
     * 
     * @param absenceId 出勤主键
     * @return 结果
     */
    @Override
    public int deleteSysAttendanceByAbsenceId(Long absenceId)
    {
        return sysAttendanceMapper.deleteSysAttendanceByAbsenceId(absenceId);
    }






}
