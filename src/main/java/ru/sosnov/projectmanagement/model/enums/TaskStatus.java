package ru.sosnov.projectmanagement.model.enums;

import com.fasterxml.jackson.annotation.JsonCreator;

public enum TaskStatus {

    PROGRESS("В работе"), DONE("Выполнена");

    private String value;

    TaskStatus(String text) {
        value = text;
    }

    @Override
    public String toString() {
        return value;
    }

    @JsonCreator
    public static TaskStatus create (String value) {
        if(value == null) {
            throw new IllegalArgumentException();
        }
        for(TaskStatus v : values()) {
            if(value.equals(v.getValue())) {
                return v;
            }
        }
        throw new IllegalArgumentException();
    }

    public String getValue() {
        return value;
    }
}
