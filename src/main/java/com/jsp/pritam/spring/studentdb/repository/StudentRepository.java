package com.jsp.pritam.spring.studentdb.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.jsp.pritam.spring.studentdb.entity.Student;

@Repository
public class StudentRepository {

	EntityManagerFactory emf = Persistence.createEntityManagerFactory("mysql-config");
	
	public String addStudent(Student student) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();
        
        try {
            // Check if student with the given ID already exists
            Student existingStudent = em.find(Student.class, student.getStudentId());
            if (existingStudent != null) {
                return "ID already exists. Duplicate ID not accepted.";
            }

            et.begin();
            em.persist(student); // Save new student
            et.commit();
            return "Student added successfully!";
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
            return "Error occurred while adding student. Please try again.";
        } finally {
            em.close();
        }
    }

	
	public List<Student> getAllStudents(){
		EntityManager em = emf.createEntityManager();
		Query query = em.createQuery("SELECT s FROM Student s" );
		List<Student> students = query.getResultList();
		em.close();
		return students;
	}
	
	public Student getStudentById(int studentId) {
	    EntityManager em = emf.createEntityManager();
	    Student student = em.find(Student.class, studentId);
	    em.close();
	    return student;
	}

	public boolean updateStudent(Student student) {
	    EntityManager em = emf.createEntityManager();
	    EntityTransaction et = em.getTransaction();
	    
	    try {
	        et.begin();
	        Student existingStudent = em.find(Student.class, student.getStudentId());

	        if (existingStudent != null) {
	            existingStudent.setStudentName(student.getStudentName());
	            existingStudent.setStudentEmail(student.getStudentEmail());
	            existingStudent.setStudentAge(student.getStudentAge());
	            existingStudent.setStudentMarks(student.getStudentMarks());
	            em.merge(existingStudent);
	            et.commit();
	            return true;
	        }
	    } catch (Exception e) {
	        et.rollback();
	    } finally {
	        em.close();
	    }
	    
	    return false;
	}

	public Student getStudentByIdStudent(int studentId) {
        EntityManager em = emf.createEntityManager();
        Student student = em.find(Student.class, studentId);
        em.close();
        return student;
    }

    public boolean deleteStudent(int studentId) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        try {
            et.begin();
            Student student = em.find(Student.class, studentId);

            if (student != null) {
                em.remove(student);
                et.commit();
                return true;
            }
        } catch (Exception e) {
            if (et.isActive()) {
                et.rollback();
            }
        } finally {
            em.close();
        }

        return false;
    }
}
