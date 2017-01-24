package com.github.greetgo.test.model;

/**
 * Created by Kasyanov Maxim on 1/20/2017.
 */
public class Student implements GenericModel {

    private Long id;

    private String name;

    private String surname;

    // FIXME: 1/25/2017 сделать объект, когда будет больше атрибутов относящихся к группе
    private String group;

    private StudyMode studyMode;

    public Student() {
    }

    public Student(String name, String surname, String group, StudyMode studyMode) {
        this.name = name;
        this.surname = surname;
        this.group = group;
        this.studyMode = studyMode;
    }

    public Student(Long id, String name, String surname, String group, StudyMode studyMode) {
        this.id = id;
        this.name = name;
        this.surname = surname;
        this.group = group;
        this.studyMode = studyMode;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getGroup() {
        return group;
    }

    public void setGroup(String group) {
        this.group = group;
    }

    public StudyMode getStudyMode() {
        return studyMode;
    }

    public void setStudyMode(StudyMode studyMode) {
        this.studyMode = studyMode;
    }
}
