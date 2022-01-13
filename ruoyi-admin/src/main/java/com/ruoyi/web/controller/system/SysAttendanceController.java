package com.ruoyi.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
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
import com.ruoyi.system.domain.SysAttendance;
import com.ruoyi.system.service.ISysAttendanceService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 出勤Controller
 * 
 * @author ruoyi
 * @date 2022-01-06
 */
@RestController
@RequestMapping("/system/attendance")
public class SysAttendanceController extends BaseController
{
    @Autowired
    private ISysAttendanceService sysAttendanceService;

    /**
     * 查询出勤列表
     */
    @PreAuthorize("@ss.hasPermi('system:attendance:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysAttendance sysAttendance)
    {
        startPage();
        List<SysAttendance> list = sysAttendanceService.selectSysAttendanceList(sysAttendance);
        return getDataTable(list);
    }

    /**
     * 导出出勤列表
     */
    @PreAuthorize("@ss.hasPermi('system:attendance:export')")
    @Log(title = "出勤", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysAttendance sysAttendance)
    {
        List<SysAttendance> list = sysAttendanceService.selectSysAttendanceList(sysAttendance);
        ExcelUtil<SysAttendance> util = new ExcelUtil<SysAttendance>(SysAttendance.class);
        util.exportExcel(response, list, "出勤数据");
    }

    /**
     * 获取出勤详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:attendance:query')")
    @GetMapping(value = "/{absenceId}")
    public AjaxResult getInfo(@PathVariable("absenceId") Long absenceId)
    {
        return AjaxResult.success(sysAttendanceService.selectSysAttendanceByAbsenceId(absenceId));
    }

    /**
     * 新增出勤
     */
    @PreAuthorize("@ss.hasPermi('system:attendance:add')")
    @Log(title = "出勤", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysAttendance sysAttendance)
    {
        return toAjax(sysAttendanceService.insertSysAttendance(sysAttendance));
    }

    /**
     * 修改出勤
     */
    @PreAuthorize("@ss.hasPermi('system:attendance:edit')")
    @Log(title = "出勤", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysAttendance sysAttendance)
    {
        return toAjax(sysAttendanceService.updateSysAttendance(sysAttendance));
    }

    /**
     * 删除出勤
     */
    @PreAuthorize("@ss.hasPermi('system:attendance:remove')")
    @Log(title = "出勤", businessType = BusinessType.DELETE)
	@DeleteMapping("/{absenceIds}")
    public AjaxResult remove(@PathVariable Long[] absenceIds)
    {
        return toAjax(sysAttendanceService.deleteSysAttendanceByAbsenceIds(absenceIds));
    }
}
