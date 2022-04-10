package com.ruoyi.system.service;

import com.ruoyi.system.domain.SysBank;

import java.util.List;

/**
 * 银行扣税Service接口
 *
 * @author ruoyi
 * @date 2022-01-06
 */

public interface ISysBankService {
    /**
     * 查询银行扣税
     *
     * @param bankcardId 银行扣税主键
     * @return 银行扣税
     */
    public SysBank selectSysBankByBankcardId(Long bankcardId);

    /**
     * 查询银行扣税列表
     *
     * @param sysBank 银行扣税
     * @return 银行扣税集合
     */
    public List<SysBank> selectSysBankList(SysBank sysBank);

    /**
     * 计算所有的税后工资
     *
     * @param sysBank
     * @return
     */
    public int updateAllList(SysBank sysBank);

    /**
     * 根据税前工资算税后工资
     * @param beforeTax
     * @return
     */
    public Double getTax(Double beforeTax);

    /**
     * 新增银行扣税
     *
     * @param sysBank 银行扣税
     * @return 结果
     */
    public int insertSysBank(SysBank sysBank);

    /**
     * 修改银行扣税
     *
     * @param sysBank 银行扣税
     * @return 结果
     */
    public int updateSysBank(SysBank sysBank);

    /**
     * 批量删除银行扣税
     *
     * @param bankcardIds 需要删除的银行扣税主键集合
     * @return 结果
     */
    public int deleteSysBankByBankcardIds(Long[] bankcardIds);

    /**
     * 删除银行扣税信息
     *
     * @param bankcardId 银行扣税主键
     * @return 结果
     */
    public int deleteSysBankByBankcardId(Long bankcardId);


    /**
     * 导入银行表
     *
     * @param bankList
     * @param isUpdateSupport
     * @param operaName
     * @return
     */
    public String importBankList(List<SysBank> bankList, Boolean isUpdateSupport, String operaName);
}
