package com.jgpyb.utils;

public enum CODE {
    SUCCESS(200), ERROR(404);

    private int code;

    CODE(int code) {
        this.code = code;
    }
}
