package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

import java.util.Date;

/**
 * 工资对象 sys_salary
 * 
 * @author ruoyi
 * @date 2022-01-06
 */
public class SysSalary extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 工资发放记录id */
    private Long salaryId;

    /** 用户ID */
    @Excel(name = "用户ID")
    private Long userId;

    /** 部门名称 */
    @Excel(name = "部门名称")
    private String deptName;

    /** 银行卡号 */
    @Excel(name = "银行卡号")
    private Long bankcardId;

    /** 开资时间 */

    @Excel(name = "发放时间", dateFormat = "yyyy-MM-dd", type = Excel.Type.EXPORT)
    private Date updateTime;



    /** 基础工资 */
    @Excel(name = "基础工资")
    private Double income;

    /** 全勤奖金 */
    @Excel(name = "全勤奖金")
    private Double rewards;


    /** 迟到罚款 */
    @Excel(name = "迟到罚款")
    private Double cost;

    /** 税前总工资 */
    @Excel(name = "税前总工资")
    private Double beforeTax;

    public void setSalaryId(Long salaryId) 
    {
        this.salaryId = salaryId;
    }

    public Long getSalaryId() 
    {
        return salaryId;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setDeptName(String deptName) 
    {
        this.deptName = deptName;
    }

    public String getDeptName() 
    {
        return deptName;
    }
    public void setBankcardId(Long bankcardId) 
    {
        this.bankcardId = bankcardId;
    }

    public Long getBankcardId() 
    {
        return bankcardId;
    }
    public void setIncome(Double income)
    {
        this.income = income;
    }
    @Override
    public Date getUpdateTime() {
        return updateTime;
    }

    @Override
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
    public Double getIncome()
    {
        return income;
    }
    public void setRewards(Double rewards)
    {
        this.rewards = rewards;
    }

    public Double getRewards()
    {
        return rewards;
    }
    public void setCost(Double cost)
    {
        this.cost = cost;
    }

    public Double getCost()
    {
        return cost;
    }
    public void setBeforeTax(Double beforeTax)
    {
        this.beforeTax = beforeTax;
    }

    public Double getBeforeTax()
    {
        return beforeTax;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("salaryId", getSalaryId())
            .append("userId", getUserId())
            .append("deptName", getDeptName())
            .append("bankcardId", getBankcardId())
            .append("updateTime", getUpdateTime())
            .append("income", getIncome())
            .append("rewards", getRewards())
            .append("cost", getCost())
            .append("beforeTax", getBeforeTax())
            .toString();
    }


}
