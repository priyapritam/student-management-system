package com.jsp.pritam.spring.studentdb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jsp.pritam.spring.studentdb.entity.Student;
import com.jsp.pritam.spring.studentdb.repository.StudentRepository;

@Service
public class StudentService {

	@Autowired
	private StudentRepository studentRepository;
	
	public String addStudent(Student student) {
        return studentRepository.addStudent(student);
    }

	
	public List<Student> getAllStudents(){
		return studentRepository.getAllStudents();
	}
	
	public Student getStudentById(int studentId) {
	    return studentRepository.getStudentById(studentId);
	}

	public boolean updateStudent(Student student) {
	    return studentRepository.updateStudent(student);
	}

	public Student getStudentByIdStudent(int studentId) {
        return studentRepository.getStudentById(studentId);
    }

    public boolean deleteStudent(int studentId) {
        return studentRepository.deleteStudent(studentId);
    }
}
