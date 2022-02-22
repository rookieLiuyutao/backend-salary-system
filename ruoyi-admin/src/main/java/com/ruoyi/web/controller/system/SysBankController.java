package com.ruoyi.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.system.domain.SysBank;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.service.ISysBankService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

/**
 * 银行扣税Controller
 * 
 * @author ruoyi
 * @date 2022-01-06
 */
@RestController
@RequestMapping("/system/bank")
public class SysBankController extends BaseController
{
    @Autowired
    private ISysBankService sysBankService;

    /**
     * 查询银行扣税列表
     */
    @PreAuthorize("@ss.hasPermi('system:bank:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysBank sysBank)
    {
        startPage();
        List<SysBank> list = sysBankService.selectSysBankList(sysBank);
        return getDataTable(list);
    }

    /**
     * 修改银行扣税
     */
    @Log(title = "银行扣税", businessType = BusinessType.UPDATE)
    @RequestMapping("/handleTax")
    public AjaxResult handleTax( SysBank sysBank)
    {
        return AjaxResult.success(sysBankService.updateAllList(sysBank));
    }

    /**
     * 导出银行扣税列表
     */
    @PreAuthorize("@ss.hasPermi('system:bank:export')")
    @Log(title = "银行扣税", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysBank sysBank)
    {
        List<SysBank> list = sysBankService.selectSysBankList(sysBank);
        ExcelUtil<SysBank> util = new ExcelUtil<SysBank>(SysBank.class);
        util.exportExcel(response, list, "银行扣税数据");
    }

    /**
     * 获取银行扣税详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:bank:query')")
    @GetMapping(value = "/{bankcardId}")
    public AjaxResult getInfo(@PathVariable("bankcardId") Long bankcardId)
    {
        return AjaxResult.success(sysBankService.selectSysBankByBankcardId(bankcardId));
    }

    /**
     * 新增银行扣税
     */
    @PreAuthorize("@ss.hasPermi('system:bank:add')")
    @Log(title = "银行扣税", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysBank sysBank)
    {
        return toAjax(sysBankService.insertSysBank(sysBank));
    }




    /**
     * 修改银行扣税
     */
    @PreAuthorize("@ss.hasPermi('system:bank:edit')")
    @Log(title = "银行扣税", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysBank sysBank)
    {
        return toAjax(sysBankService.updateSysBank(sysBank));
    }

    /**
     * 删除银行扣税
     */
    @PreAuthorize("@ss.hasPermi('system:bank:remove')")
    @Log(title = "银行扣税", businessType = BusinessType.DELETE)
	@DeleteMapping("/{bankcardIds}")
    public AjaxResult remove(@PathVariable Long[] bankcardIds)
    {
        return toAjax(sysBankService.deleteSysBankByBankcardIds(bankcardIds));
    }



    /**
     * 导入工资表
     * @param file
     * @param updateSupport
     * @return
     * @throws Exception
     */
    @Log(title = "银行", businessType = BusinessType.IMPORT)
    @PostMapping("/importBankData")
    @PreAuthorize("@ss.hasPermi('system:bank:import')")
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception
    {
        ExcelUtil<SysBank> util = new ExcelUtil<SysBank>(SysBank.class);
        List<SysBank> bankList = util.importExcel(file.getInputStream());
        String operaName = getUsername();
        String message = sysBankService.importBankList(bankList, updateSupport, operaName);
        return AjaxResult.success(message);
    }



}
