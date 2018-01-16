package org.mistah.steem4kids.web;

import java.text.DateFormat;
import java.text.FieldPosition;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

public class MultiDateFormat extends DateFormat {

    /** auto-generated serialVersionUID */
    private static final long serialVersionUID = -8545986358215178128L;

    private static final List<? extends DateFormat> DATE_FORMATS = Arrays.asList(

            // one-digit month and day
            new SimpleDateFormat("yyyy-M-d"),
            new SimpleDateFormat("yyyy/M/d"),
            new SimpleDateFormat("yyyyMd"),

            // two-digit month and day
            new SimpleDateFormat("yyyy-MM-dd"),
            new SimpleDateFormat("yyyy/MM/dd"),
            new SimpleDateFormat("yyyyMMdd"),

            new SimpleDateFormat("yyyy-MM"),
            new SimpleDateFormat("yyyy/MM"),
            new SimpleDateFormat("yyyyMM"),

            new SimpleDateFormat("dd-MM-yyyy"),
            new SimpleDateFormat("mm/dd/yyyy"));

    @Override
    public StringBuffer format(final Date date, final StringBuffer toAppendTo, final FieldPosition fieldPosition) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
        return toAppendTo.append(sdf.format(date));
    }

    @Override
    public Date parse(final String source, final ParsePosition pos) {
        Date res = null;
        for (final DateFormat dateFormat : DATE_FORMATS) {
            dateFormat.setLenient(false);
            if ((res = dateFormat.parse(source, pos)) != null) {
                return res;
            }
        }

        return null;
    }
}
