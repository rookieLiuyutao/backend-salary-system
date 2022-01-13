package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 银行扣税对象 sys_bank
 * 
 * @author ruoyi
 * @date 2022-01-06
 */
public class SysBank extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 银行卡号 */
    @Excel(name = "银行卡号")
    private Long bankcardId;

    /** 用户名 */
    @Excel(name = "用户名")
    private String userName;

    /** 税前工资 */
    @Excel(name = "税前工资")
    private Double beforeTax;

    /** 扣除税款 */
    @Excel(name = "扣除税款")
    private Double deduction;

    /** 税后工资 */
    @Excel(name = "税后工资")
    private Double afterTax;

    public void setBankcardId(Long bankcardId) 
    {
        this.bankcardId = bankcardId;
    }

    public Long getBankcardId() 
    {
        return bankcardId;
    }
    public void setUserName(String userName) 
    {
        this.userName = userName;
    }

    public String getUserName() 
    {
        return userName;
    }
    public void setBeforeTax(Double beforeTax)
    {
        this.beforeTax = beforeTax;
    }

    public Double getBeforeTax()
    {
        return beforeTax;
    }
    public void setDeduction(Double deduction)
    {
        this.deduction = deduction;
    }

    public Double getDeduction()
    {
        return deduction;
    }
    public void setAfterTax(Double afterTax)
    {
        this.afterTax = afterTax;
    }

    public Double getAfterTax()
    {
        return afterTax;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("bankcardId", getBankcardId())
            .append("userName", getUserName())
            .append("beforeTax", getBeforeTax())
            .append("deduction", getDeduction())
            .append("afterTax", getAfterTax())
            .toString();
    }
}
