package com.yutao.system.service.impl;

import java.util.List;

import com.yutao.common.exception.ServiceException;
import com.yutao.common.utils.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.yutao.system.mapper.SysBankMapper;
import com.yutao.system.domain.SysBank;
import com.yutao.system.service.ISysBankService;

/**
 * 银行扣税Service业务层处理
 * 
 * @author yutao
 * @date 2022-01-06
 */
@Service
public class SysBankServiceImpl implements ISysBankService
{
    @Autowired
    private SysBankMapper sysBankMapper;



    /**
     * 查询银行扣税
     * 
     * @param bankcardId 银行扣税主键
     * @return 银行扣税
     */
    @Override
    public SysBank selectSysBankByBankcardId(Long bankcardId)
    {
        return sysBankMapper.selectSysBankByBankcardId(bankcardId);
    }

    /**
     * 查询银行扣税列表
     * 
     * @param sysBank 银行扣税
     * @return 银行扣税
     */
    @Override
    public List<SysBank> selectSysBankList(SysBank sysBank)
    {
        return sysBankMapper.selectSysBankList(sysBank);
    }


    /**
     * 计算出所有工资信息
     * @param sysBank
     * @return
     */
    @Override
    public int updateAllList(SysBank sysBank) {
        List<SysBank> list = sysBankMapper.selectSysBankList(sysBank);
        for (SysBank aSysBank:list){
            aSysBank.setAfterTax(aSysBank.getBeforeTax()-this.getTax(aSysBank.getBeforeTax()));
            aSysBank.setDeduction(this.getTax(aSysBank.getBeforeTax()));
            this.updateSysBank(aSysBank);
        }
        return list.size();
    }

    @Override
    public Double getTax(Double beforeTax) {
        double tax;
        if(beforeTax>=0 && beforeTax<1500){
            tax = (beforeTax)*0.03 - 0;
        }else if(beforeTax>=1500 && beforeTax<4500){
            tax = (beforeTax)*0.1 - 105;

        }else if(beforeTax>=4500 && beforeTax<9000){
            tax = (beforeTax)*0.2 - 555;

        }else if(beforeTax>=9000 && beforeTax<35000){
            tax = (beforeTax)*0.25 - 1005;

        }else if(beforeTax>=35000 && beforeTax<55000){
            tax = (beforeTax)*0.30 - 2755;

        }else if(beforeTax>=55000 && beforeTax<80000){
            tax = (beforeTax)*0.35 - 5505;

        }else{
            tax = (beforeTax)*0.45 - 13505;
        }
        return tax;
    }


    /**
     * 新增银行扣税
     * 
     * @param sysBank 银行扣税
     * @return 结果
     */
    @Override
    public int insertSysBank(SysBank sysBank)
    {
        return sysBankMapper.insertSysBank(sysBank);
    }

    /**
     * 修改银行扣税
     * 
     * @param sysBank 银行扣税
     * @return 结果
     */
    @Override
    public int updateSysBank(SysBank sysBank)
    {
        return sysBankMapper.updateSysBank(sysBank);
    }

    /**
     * 批量删除银行扣税
     * 
     * @param bankcardIds 需要删除的银行扣税主键
     * @return 结果
     */
    @Override
    public int deleteSysBankByBankcardIds(Long[] bankcardIds)
    {
        return sysBankMapper.deleteSysBankByBankcardIds(bankcardIds);
    }

    /**
     * 删除银行扣税信息
     * 
     * @param bankcardId 银行扣税主键
     * @return 结果
     */
    @Override
    public int deleteSysBankByBankcardId(Long bankcardId)
    {
        return sysBankMapper.deleteSysBankByBankcardId(bankcardId);
    }

    @Override
    public String importBankList(List<SysBank> bankList, Boolean isUpdateSupport, String operaName) {
        if (StringUtils.isNull(bankList) || bankList.size() == 0)
        {
            throw new ServiceException("导入用户数据不能为空！");
        }
        int successNum = 0;
        int failureNum = 0;
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();
        for (SysBank sysBank : bankList)
        {
            try
            {
                // 验证是否存在这个用户
                SysBank u = sysBankMapper.selectSysBankByBankcardId(sysBank.getBankcardId());
                if (StringUtils.isNull(u))
                {
                    sysBank.setBankcardId(sysBank.getBankcardId());
                    this.insertSysBank(sysBank);
                    successNum++;
                    successMsg.append("<br/>" + successNum + "工资信息" + sysBank.getBankcardId() + " 导入成功");
                }
                else if (isUpdateSupport)
                {
                    sysBank.setUpdateBy(operaName);
                    this.updateSysBank(sysBank);
                    successNum++;
                    successMsg.append("<br/>").append(successNum).append("工资信息 ").append(sysBank.getBankcardId()).append(" 更新成功");
                }
                else
                {
                    failureNum++;
                    failureMsg.append("<br/>").append(failureNum).append("工资信息").append(sysBank.getBankcardId()).append(" 已存在");
                }
            }
            catch (Exception e)
            {
                failureNum++;
                String msg = "<br/>" + failureNum + "工资" + sysBank.getBankcardId() + " 导入失败：";
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


}
