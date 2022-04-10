package com.yutao.system.service;

import com.yutao.system.domain.SysBank;
import com.yutao.system.domain.SysSalary;

import java.util.List;

/**
 * 工资Service接口
 *
 * @author yutao
 * @date 2022-01-06
 */
public interface ISysSalaryService {
    /**
     * 查询工资
     *
     * @param salaryId 工资主键
     * @return 工资
     */
    public SysSalary selectSysSalaryBySalaryId(Long salaryId);

    /**
     * 查询工资列表
     *
     * @param sysSalary 工资
     * @return 工资集合
     */
    public List<SysSalary> selectSysSalaryList(SysSalary sysSalary);

    /**
     * 新增工资
     *
     * @param sysSalary 工资
     * @return 结果
     */
    public int insertSysSalary(SysSalary sysSalary);

    /**
     * 修改工资
     *
     * @param sysSalary 工资
     * @return 结果
     */
    public int updateSysSalary(SysSalary sysSalary);

    /**
     * 批量删除工资
     *
     * @param salaryIds 需要删除的工资主键集合
     * @return 结果
     */
    public int deleteSysSalaryBySalaryIds(Long[] salaryIds);

    /**
     * 删除工资信息
     *
     * @param salaryId 工资主键
     * @return 结果
     */
    public int deleteSysSalaryBySalaryId(Long salaryId);

    /**
     * 由工资表生成银行表
     *
     * @param sysSalary 工资
     * @return 银行表集合
     */
    public List<SysBank> createBankList(SysSalary sysSalary);


    /**
     * 导入工资表
     * @param salaryList
     * @param isUpdateSupport
     * @param operaName
     * @return
     */
    public String importSalary(List<SysSalary> salaryList, Boolean isUpdateSupport, String operaName);

    /**
     * 计算总罚款
     * @param absenceId
     * @return
     */
    public void calculateTheTotalLateFine(Long absenceId,Double rewards);

    public int updateAllList(SysSalary salary);
}
