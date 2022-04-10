package com.yutao.system.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.yutao.common.exception.ServiceException;
import com.yutao.common.utils.DateUtils;
import com.yutao.common.utils.StringUtils;
import com.yutao.system.domain.SysAttendance;
import com.yutao.system.domain.SysBank;
import com.yutao.system.mapper.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.yutao.system.domain.SysSalary;
import com.yutao.system.service.ISysSalaryService;

/**
 * 工资Service业务层处理
 * 
 * @author yutao
 * @date 2022-01-06
 */
@Service
public class SysSalaryServiceImpl implements ISysSalaryService 
{
    @Autowired
    private SysSalaryMapper sysSalaryMapper;

    @Autowired
    private SysUserMapper sysUserMapper;

    @Autowired
    private SysAttendanceMapper sysAttendanceMapper;

    @Autowired
    private  SysUserPostMapper sysUserPostMapper;

    @Autowired
    private SysPostMapper sysPostMapper;

    /**
     * 查询工资
     * 
     * @param salaryId 工资主键
     * @return 工资
     */
    @Override
    public SysSalary selectSysSalaryBySalaryId(Long salaryId)
    {
        return sysSalaryMapper.selectSysSalaryBySalaryId(salaryId);
    }

    /**
     * 查询工资列表
     * 
     * @param sysSalary 工资
     * @return 工资
     */
    @Override
    public List<SysSalary> selectSysSalaryList(SysSalary sysSalary)
    {
        return sysSalaryMapper.selectSysSalaryList(sysSalary);
    }

    /**
     * 新增工资
     * 
     * @param sysSalary 工资
     * @return 结果
     */
    @Override
    public int insertSysSalary(SysSalary sysSalary)
    {
        if (sysSalary.getUpdateTime()==null){
            sysSalary.setUpdateTime(new Date());

        }
        return sysSalaryMapper.insertSysSalary(sysSalary);
    }

    /**
     * 修改工资
     * 
     * @param sysSalary 工资
     * @return 结果
     */
    @Override
    public int updateSysSalary(SysSalary sysSalary)
    {
        sysSalary.setUpdateTime(DateUtils.getNowDate());
        return sysSalaryMapper.updateSysSalary(sysSalary);
    }

    /**
     * 批量删除工资
     * 
     * @param salaryIds 需要删除的工资主键
     * @return 结果
     */
    @Override
    public int deleteSysSalaryBySalaryIds(Long[] salaryIds)
    {
        return sysSalaryMapper.deleteSysSalaryBySalaryIds(salaryIds);
    }

    /**
     * 删除工资信息
     * 
     * @param salaryId 工资主键
     * @return 结果
     */
    @Override
    public int deleteSysSalaryBySalaryId(Long salaryId)
    {
        return sysSalaryMapper.deleteSysSalaryBySalaryId(salaryId);
    }

    /**
     * 从工资表中拿出银行表所需要的对应数据
     * @param sysSalary 工资
     * @return
     */

    @Override
    public List<SysBank> createBankList(SysSalary sysSalary) {
        List<SysSalary> salaryList = sysSalaryMapper.selectSysSalaryList(sysSalary);
        List<SysBank> res = new ArrayList<>();
        for (SysSalary aSysSalary:salaryList){
            SysBank aBankData = new SysBank();
            aBankData.setBankcardId(aSysSalary.getBankcardId());
            aBankData.setBeforeTax(aSysSalary.getBeforeTax());
            aBankData.setUserName(sysUserMapper.selectUserById(aSysSalary.getUserId()).getUserName());
            res.add(aBankData);
        }
        return res;
    }


    @Override
    public String importSalary(List<SysSalary> salaryList, Boolean isUpdateSupport, String operaName) {
        if (StringUtils.isNull(salaryList) || salaryList.size() == 0)
        {
            throw new ServiceException("导入用户数据不能为空！");
        }
        int successNum = 0;
        int failureNum = 0;
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();
        for (SysSalary sysSalary : salaryList)
        {
            try
            {
                // 验证是否存在这个用户
                SysSalary u = sysSalaryMapper.selectSysSalaryBySalaryId(sysSalary.getSalaryId());
                if (StringUtils.isNull(u))
                {
                    sysSalary.setSalaryId(sysSalary.getSalaryId());
                    this.insertSysSalary(sysSalary);
                    successNum++;
                    successMsg.append("<br/>" + successNum + "工资信息" + sysSalary.getSalaryId() + " 导入成功");
                }
                else if (isUpdateSupport)
                {
                    sysSalary.setUpdateBy(operaName);
                    this.updateSysSalary(sysSalary);
                    successNum++;
                    successMsg.append("<br/>").append(successNum).append("工资信息 ").append(sysSalary.getSalaryId()).append(" 更新成功");
                }
                else
                {
                    failureNum++;
                    failureMsg.append("<br/>").append(failureNum).append("工资信息").append(sysSalary.getSalaryId()).append(" 已存在");
                }
            }
            catch (Exception e)
            {
                failureNum++;
                String msg = "<br/>" + failureNum + "工资" + sysSalary.getSalaryId() + " 导入失败：";
                failureMsg.append(msg).append(e.getMessage());

            }
        }
        if (failureNum > 0)
        {
            failureMsg.insert(0, "很抱歉，导入失败！共 " + failureNum + " 条数据格式不正确，错误如下：");
            throw new ServiceException(failureMsg.toString());
        }
        else
        {
            successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
        }
        return successMsg.toString();
    }


    /**
     * 根据用户id查询迟到次数
     * @param absenceId
     * @return
     */

    public void calculateTheTotalLateFine(Long absenceId,Double rewards) {
        SysAttendance sysAttendance= sysAttendanceMapper.selectSysAttendanceByAbsenceId(absenceId);
        Long userId  = sysAttendance.getUserId();
        double res = sysAttendanceMapper.countLateTimesByUserId(userId,sysAttendance.getUpdateTime())*100.00;
        if (res == 0){
            sysSalaryMapper.updateBonusByUserId(userId,rewards);
        }else {
            sysSalaryMapper.updateBonusByUserId(userId,0.0);
            sysSalaryMapper.updateCostByUserId(userId,res);
        }
    }


    public int updateAllList(SysSalary salary) {
        List<SysSalary> list = sysSalaryMapper.selectSysSalaryList(salary);
        for (SysSalary sysSalary:list){
            if (sysSalary.getCost()==0){
                sysSalary.setRewards(1000.00);
            }
            Long postId =  sysUserPostMapper.selectPostByUserId(sysSalary.getUserId());
            double baseIncome = sysPostMapper.selectPostById((long) postId).getPostSalary();
            if (sysSalary.getIncome()==0.0||sysSalary.getIncome()==null){
                sysSalary.setIncome(baseIncome);
            }
            if (sysSalary.getCost()==0.0){
                sysSalary.setRewards(1000.00);
            }
            sysSalary.setBeforeTax(sysSalary.getIncome()+sysSalary.getRewards()-sysSalary.getCost());

            this.updateSysSalary(sysSalary);
        }
        return list.size();
    }
}
