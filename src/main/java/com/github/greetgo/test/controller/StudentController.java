package com.github.greetgo.test.controller;

import com.github.greetgo.test.model.Student;
import com.github.greetgo.test.model.StudyMode;
import com.github.greetgo.test.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Created by Kasyanov Maxim on 1/19/2017.
 */
@RestController
@RequestMapping("student")
public class StudentController {

    private final StudentService studentService;

    @Autowired
    public StudentController(StudentService studentService) {
        this.studentService = studentService;
    }


    @GetMapping(value = "list")
    public ResponseEntity<List<Student>> studentList() {
        return new ResponseEntity<>(studentService.getStudentList(), HttpStatus.OK);
    }

    @GetMapping(value = "add")
    @ResponseStatus(HttpStatus.OK)
    public void addStudent(Student student, @RequestParam("study_mode_id") int id){
        StudyMode studyMode = new StudyMode(id);
        student.setStudyMode(studyMode);
        studentService.insert(student);
    }

    @DeleteMapping(value = "delete/{id}")
    @ResponseStatus(HttpStatus.OK)
    public void deleteStudent(@PathVariable int id) {
        studentService.delete(id);
    }

    @GetMapping(value = "studyMode/list")
    public ResponseEntity<List<StudyMode>> studyModeList(){
        return new ResponseEntity<>(studentService.studyModeList(),HttpStatus.OK);
    }
}
