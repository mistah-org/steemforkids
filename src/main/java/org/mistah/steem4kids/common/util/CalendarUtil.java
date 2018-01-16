package org.mistah.steem4kids.common.util;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public final class CalendarUtil {

    static public Date getFirstDayOfCurrentMonth() {
        return getFirstDayOfMonth(null);
    }

    static public Date getLastDayOfCurrentMonth() {
        return getLastDayOfMonth(null);
    }

    static public Date getFirstDayOfMonth(Calendar cal) {
        if (cal == null) {
            cal = Calendar.getInstance();
        }

        Calendar firstDay = Calendar.getInstance();
        firstDay.setTime(cal.getTime());
        firstDay.set(Calendar.DAY_OF_MONTH, 1);

        firstDay.set(Calendar.MILLISECOND, 0);
        firstDay.set(Calendar.SECOND, 0);
        firstDay.set(Calendar.MINUTE, 0);
        firstDay.set(Calendar.HOUR_OF_DAY, 0);

        return firstDay.getTime();
    }

    static public Date getLastDayOfMonth(Calendar cal) {
        if (cal == null) {
            cal = Calendar.getInstance();
        }

        Calendar lastDay = Calendar.getInstance();
        lastDay.setTime(cal.getTime());
        lastDay.set(Calendar.DAY_OF_MONTH, lastDay.getActualMaximum(Calendar.DAY_OF_MONTH));

        lastDay.set(Calendar.MILLISECOND, lastDay.getMaximum(Calendar.MILLISECOND));
        lastDay.set(Calendar.SECOND,      lastDay.getMaximum(Calendar.SECOND));
        lastDay.set(Calendar.MINUTE,      lastDay.getMaximum(Calendar.MINUTE));
        lastDay.set(Calendar.HOUR_OF_DAY, lastDay.getMaximum(Calendar.HOUR_OF_DAY));

        return lastDay.getTime();
    }

    static public Date[] getWeekDateRange(Date anyDayOfMonth, int targetWeek) {
        Date[] dateRange = new Date[2];

        Calendar cal = new GregorianCalendar();
        cal.setTime(anyDayOfMonth);
        cal.set(Calendar.DATE, 1);

        if (targetWeek > cal.getActualMaximum(Calendar.WEEK_OF_MONTH)) {
            throw new RuntimeException("target week exceeds maximum number of weeks");
        }

        while (cal.get(Calendar.WEEK_OF_MONTH) < targetWeek) {
            // advance to the next day
            cal.add(Calendar.DAY_OF_YEAR, 1);
        }

        dateRange[0] = cal.getTime();

        while (cal.get(Calendar.WEEK_OF_MONTH) == targetWeek) {
            // advance to the next day
            cal.add(Calendar.DAY_OF_YEAR, 1);
        }
        // subtract one day to get end date of week
        cal.add(Calendar.DATE, -1);
        dateRange[1] = cal.getTime();

        return dateRange;
    }
}
