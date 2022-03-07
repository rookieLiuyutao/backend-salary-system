package com.ruoyi.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ruoyi.system.domain.SysAttendance;
import com.ruoyi.system.domain.SysBank;
import com.ruoyi.system.service.ISysAttendanceService;
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
import com.ruoyi.system.domain.SysSalary;
import com.ruoyi.system.service.ISysSalaryService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

/**
 * 工资Controller
 * 
 * @author ruoyi
 * @date 2022-01-06
 */
@RestController
@RequestMapping("/system/salary")
public class SysSalaryController extends BaseController
{
    @Autowired
    private ISysSalaryService sysSalaryService;
    @Autowired
    private ISysAttendanceService sysAttendanceService;

    /**
     * 查询工资列表
     */
    @PreAuthorize("@ss.hasPermi('system:salary:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysSalary sysSalary)
    {
        startPage();
        List<SysSalary> list = sysSalaryService.selectSysSalaryList(sysSalary);
        return getDataTable(list);
    }

    /**
     * 导出工资列表
     */
    @PreAuthorize("@ss.hasPermi('system:salary:export')")
    @Log(title = "工资", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysSalary sysSalary)
    {
        List<SysSalary> list = sysSalaryService.selectSysSalaryList(sysSalary);
        ExcelUtil<SysSalary> util = new ExcelUtil<SysSalary>(SysSalary.class);
        util.exportExcel(response, list, "工资数据");
    }

    /**
     * 获取工资详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:salary:query')")
    @GetMapping(value = "/{salaryId}")
    public AjaxResult getInfo(@PathVariable("salaryId") Long salaryId)
    {
        return AjaxResult.success(sysSalaryService.selectSysSalaryBySalaryId(salaryId));
    }

    /**
     * 新增工资
     */
    @PreAuthorize("@ss.hasPermi('system:salary:add')")
    @Log(title = "工资", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysSalary sysSalary)
    {
        return toAjax(sysSalaryService.insertSysSalary(sysSalary));
    }

    /**
     * 修改工资
     */
    @PreAuthorize("@ss.hasPermi('system:salary:edit')")
    @Log(title = "工资", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysSalary sysSalary)
    {
        return toAjax(sysSalaryService.updateSysSalary(sysSalary));
    }

    /**
     * 删除工资
     */
    @PreAuthorize("@ss.hasPermi('system:salary:remove')")
    @Log(title = "工资", businessType = BusinessType.DELETE)
	@DeleteMapping("/{salaryIds}")
    public AjaxResult remove(@PathVariable Long[] salaryIds)
    {
        return toAjax(sysSalaryService.deleteSysSalaryBySalaryIds(salaryIds));
    }

    /**
     * 导入工资表
     * @param file
     * @param updateSupport
     * @return
     * @throws Exception
     */
    @Log(title = "工资管理", businessType = BusinessType.IMPORT)
    @PostMapping("/importData")
    @PreAuthorize("@ss.hasPermi('system:salary:import')")
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception
    {
        ExcelUtil<SysSalary> util = new ExcelUtil<SysSalary>(SysSalary.class);
        List<SysSalary> salaryList = util.importExcel(file.getInputStream());
//        LoginUser loginUser = tokenService.getLoginUser(ServletUtils.getRequest());
        String operName = getUsername();
        String message = sysSalaryService.importSalary(salaryList, updateSupport, operName);
        return AjaxResult.success(message);
    }

    @GetMapping("/importTemplate")
    public AjaxResult importTemplate()
    {
        ExcelUtil<SysSalary> util = new ExcelUtil<SysSalary>(SysSalary.class);
        return util.importTemplateExcel("用户数据");
    }

    /**
     * 导出递交给银行的工资列表
     */
    @PreAuthorize("@ss.hasPermi('system:salary:exportToBank')")
    @Log(title = "递交给银行的表", businessType = BusinessType.EXPORT)
    @PostMapping("/bankExport")
    public void bankExport(HttpServletResponse response, SysSalary sysSalary)
    {
        List<SysBank> list = sysSalaryService.createBankList(sysSalary);
        ExcelUtil<SysBank> util = new ExcelUtil<SysBank>(SysBank.class);
        util.exportExcel(response, list, "递交给银行的表");
    }

    /**
     * 导出递交给银行的工资列表
     */
    @PreAuthorize("@ss.hasPermi('system:salary:handleLateFine')")
    @Log(title = "填入罚金", businessType = BusinessType.EXPORT)
    @PostMapping("/handleSalary")
    public AjaxResult handleLateFine(SysAttendance sysAttendance,SysSalary sysSalary)
    {
        List<SysAttendance> list = sysAttendanceService.selectSysAttendanceList(sysAttendance);
        for (SysAttendance s:list){
            sysSalaryService.calculateTheTotalLateFine(s.getAbsenceId(),500.00);

        }
        sysSalaryService.updateAllList(sysSalary);
        return AjaxResult.success();
    }

}
