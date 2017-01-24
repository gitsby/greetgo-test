package com.github.greetgo.test.model;

/**
 * Created by Kasyanov Maxim on 1/25/2017.
 */
public class StudyMode implements GenericModel {

    private int id;

    private String name;

    public StudyMode() {
    }

    public StudyMode(int id) {
        this.id = id;
    }

    public StudyMode(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
