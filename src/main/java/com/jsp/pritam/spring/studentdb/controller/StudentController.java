package com.jsp.pritam.spring.studentdb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jsp.pritam.spring.studentdb.entity.Student;
import com.jsp.pritam.spring.studentdb.service.StudentService;

@Controller
public class StudentController {

	@Autowired
	private StudentService studentService;
	
	@RequestMapping(value = "/add-students", method = RequestMethod.POST)
    public ModelAndView addStudent(Student student) {
        String resultMessage = studentService.addStudent(student);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("add_student.jsp");

        // Check the resultMessage and pass it to the view
        if (resultMessage.equals("Student added successfully!")) {
            mav.addObject("successMessage", resultMessage);
        } else {
            mav.addObject("errorMessage", resultMessage);
        }

        return mav;
    }



	
	@RequestMapping(value = "/display-all-students", method = RequestMethod.GET)
	public ModelAndView displayStudents() {
		List<Student> students = studentService.getAllStudents();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("display_student.jsp");
		mav.addObject("students", students);
		return mav;
	}
	
	@RequestMapping(value = "/validate-student", method = RequestMethod.POST)
	public ModelAndView validateStudent(Student student) {
	    int studentId = student.getStudentId();  // Get studentId directly from Student object
	    Student foundStudent = studentService.getStudentById(studentId);

	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("update_student.jsp");

	    if (foundStudent == null) {
	        mav.addObject("errorMessage", "No student found with ID: " + studentId);
	    } else {
	        mav.addObject("student", foundStudent);
	    }

	    return mav;
	}

	@RequestMapping(value = "/update-student", method = RequestMethod.POST)
	public ModelAndView updateStudent(Student student) {
	    boolean updated = studentService.updateStudent(student);
	    
	    ModelAndView mav = new ModelAndView();
	    mav.setViewName("update_student.jsp");

	    if (updated) {
	        mav.addObject("successMessage", "Student updated successfully!");
	    } else {
	        mav.addObject("errorMessage", "Error updating student. Please try again.");
	    }

	    return mav;
	}

	@RequestMapping(value = "/validate-student-for-delete", method = RequestMethod.POST)
    public ModelAndView validateStudentForDelete(Student student) {
        int studentId = student.getStudentId();
        Student foundStudent = studentService.getStudentById(studentId);

        ModelAndView mav = new ModelAndView();
        mav.setViewName("delete_student.jsp");

        if (foundStudent == null) {
            mav.addObject("errorMessage", "No student found with ID: " + studentId);
        } else {
            mav.addObject("student", foundStudent);
        }

        return mav;
    }

    @RequestMapping(value = "/delete-student", method = RequestMethod.POST)
    public ModelAndView deleteStudent(Student student) {
        int studentId = student.getStudentId();
        boolean isDeleted = studentService.deleteStudent(studentId);

        ModelAndView mav = new ModelAndView();
        mav.setViewName("delete_student.jsp");

        if (isDeleted) {
            mav.addObject("successMessage", "Student deleted successfully!");
        } else {
            mav.addObject("errorMessage", "Error deleting student. Please try again.");
        }

        return mav;
    }
}