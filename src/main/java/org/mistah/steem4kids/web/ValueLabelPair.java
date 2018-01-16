package org.mistah.steem4kids.web;

public class ValueLabelPair {

    private String value;
    private String label;

    public ValueLabelPair() {
        super();
    }

    public ValueLabelPair(String value, String label) {
        super();
        this.value = value;
        this.label = label;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

}
