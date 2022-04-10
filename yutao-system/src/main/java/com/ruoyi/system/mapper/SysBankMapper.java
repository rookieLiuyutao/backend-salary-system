package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.SysBank;

/**
 * 银行扣税Mapper接口
 * 
 * @author ruoyi
 * @date 2022-01-06
 */
public interface SysBankMapper 
{
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
     * 删除银行扣税
     * 
     * @param bankcardId 银行扣税主键
     * @return 结果
     */
    public int deleteSysBankByBankcardId(Long bankcardId);

    /**
     * 批量删除银行扣税
     * 
     * @param bankcardIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysBankByBankcardIds(Long[] bankcardIds);
}
