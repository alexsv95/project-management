package ru.sosnov.projectmanagement.model.enums;

import com.fasterxml.jackson.annotation.JsonCreator;

public enum ProjectStatus {
    REGISTERED("Зарегистрирован"), PROGRESS("В работе"), DONE("Завершен");

    private String value;

    ProjectStatus(String text) {
        value = text;
    }

    @Override
    public String toString() {
        return value;
    }

    @JsonCreator
    public static ProjectStatus create (String value) {
        if(value == null) {
            throw new IllegalArgumentException();
        }
        for(ProjectStatus v : values()) {
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
