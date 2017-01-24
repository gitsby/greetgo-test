package com.github.greetgo.test.service.impl;

import com.github.greetgo.test.model.Student;
import com.github.greetgo.test.model.StudyMode;
import com.github.greetgo.test.service.StudentService;
import com.github.greetgo.test.persistence.StudentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Kasyanov Maxim on 1/20/2017.
 */
@Service
public class StudentServiceImpl implements StudentService {

    private final StudentMapper studentMapper;

    @Autowired
    public StudentServiceImpl(StudentMapper studentMapper) {
        this.studentMapper = studentMapper;
    }

    @Override
    public void insert(Student student) {
        studentMapper.insertStudent(student);
    }

    @Override
    public List<Student> getStudentList() {
        return studentMapper.studentList();
    }

    @Override
    public void delete(int id) {
        studentMapper.delete(id);
    }

    @Override
    public List<StudyMode> studyModeList() {
        return studentMapper.studyModeList();
    }
}
