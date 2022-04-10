package com.yutao.system.mapper;

import java.util.List;
import com.yutao.system.domain.SysSalary;
import org.apache.ibatis.annotations.Param;

/**
 * 工资Mapper接口
 * 
 * @author yutao
 * @date 2022-01-06
 */
public interface SysSalaryMapper 
{
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
     * 删除工资
     * 
     * @param salaryId 工资主键
     * @return 结果
     */
    public int deleteSysSalaryBySalaryId(Long salaryId);

    /**
     * 批量删除工资
     * 
     * @param salaryIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysSalaryBySalaryIds(Long[] salaryIds);

    /**
     * 根据id更新奖金
     * @param userId
     * @param rewards
     * @return
     */
    public int updateBonusByUserId(@Param("userId") Long userId,@Param("rewards") Double rewards);

    /**
     * 根据id更新罚款
     * @param userId
     * @param cost
     * @return
     */
    public int updateCostByUserId(@Param("userId") Long userId,@Param("cost") Double cost);
}
