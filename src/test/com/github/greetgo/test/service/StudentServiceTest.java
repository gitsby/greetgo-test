package com.github.greetgo.test.service;

import com.github.greetgo.test.model.Student;
import com.github.greetgo.test.model.StudyMode;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.support.AnnotationConfigContextLoader;

import static org.testng.Assert.assertEquals;

/**
 * Created by Kasyanov Maxim on 1/25/2017.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {TestConfig.class},loader = AnnotationConfigContextLoader.class)
public class StudentServiceTest extends org.springframework.test.context.testng.AbstractTransactionalTestNGSpringContextTests {

    @Autowired
    private StudentService studentService;

    private Student testStudent = new Student("Test","Testov","test-group",new StudyMode(1));

    @Test
    public void studentInsertTest(){
        int recordCount = studentService.getStudentList().size();
        studentService.insert(testStudent);
        assertEquals(recordCount + 1,studentService.getStudentList().size());
    }
}
