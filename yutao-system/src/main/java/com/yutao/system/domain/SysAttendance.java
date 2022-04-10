package com.yutao.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.yutao.common.annotation.Excel;
import com.yutao.common.core.domain.BaseEntity;

/**
 * 出勤对象 sys_attendance
 *
 * @author yutao
 * @date 2022-01-12
 */
public class SysAttendance extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 缺勤记录id */
    private Long absenceId;

    /** 用户ID */
    @Excel(name = "用户ID")
    private Long userId;

    public void setAbsenceId(Long absenceId)
    {
        this.absenceId = absenceId;
    }

    public Long getAbsenceId()
    {
        return absenceId;
    }
    public void setUserId(Long userId)
    {
        this.userId = userId;
    }

    public Long getUserId()
    {
        return userId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("absenceId", getAbsenceId())
                .append("userId", getUserId())
                .append("updateTime", getUpdateTime())
                .toString();
    }
}
