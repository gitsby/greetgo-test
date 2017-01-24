package com.github.greetgo.test.service.persistence;

import com.github.greetgo.test.model.Student;
import com.github.greetgo.test.model.StudyMode;
import org.apache.ibatis.annotations.*;

import java.util.List;

/**
 * Created by Kasyanov Maxim on 1/20/2017.
 */
public interface StudentMapper {

    @Insert("INSERT INTO student(name, surname, group_, study_mode_id)" +
            "VALUES(#{name}, #{surname}, #{group}, #{studyMode.id})")
    @Options(useGeneratedKeys = true, keyProperty = "id", keyColumn = "id")
    void insertStudent(Student student);


    @Results({
            @Result(property = "id", column = "id"),
            @Result(property = "name", column = "column"),
            @Result(property = "surname", column = "surname"),
            @Result(property = "group", column = "group_"),
            @Result(property = "studyMode", column = "study_mode_id", one = @One(select ="com.github.greetgo.test.service.persistence.StudentMapper.getStudyModeById"))
    })
    @Select("SELECT id, name, surname, group_, study_mode_id from student where is_del != true")
    List<Student> studentList();


    @Select("select id, name from study_mode where id= #{id}")
    StudyMode getStudyModeById(int id);


    @Update("UPDATE student SET is_del = true where id = #{id}")
    void delete(int id);


    @Results({
            @Result(property = "id", column = "id"),
            @Result(property = "name", column = "name")
    })
    @Select("select * from study_mode")
    List<StudyMode> studyModeList();
}
