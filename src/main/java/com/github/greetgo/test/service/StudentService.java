package com.github.greetgo.test.service;

import com.github.greetgo.test.model.Student;
import com.github.greetgo.test.model.StudyMode;

import java.util.List;

/**
 * Created by Kasyanov Maxim on 1/20/2017.
 */
public interface StudentService {

    void insert(Student student);

    List<Student> getStudentList();

    void delete(int id);

    List<StudyMode> studyModeList();
}
