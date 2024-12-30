// package com.axsos.login.service;

// import java.lang.StackWalker.Option;
// import java.util.Optional;

// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.stereotype.Service;

// import com.axsos.login.model.Student;
// import com.axsos.login.repository.StudentRepo;

// @Service
// public class StudentService {
// @Autowired
// private StudentRepo studentRepo;

// public void createStudent(Student student) {
// studentRepo.save(student);
// }
// public Iterable<Student> getAllStudents() {
// return studentRepo.findAll();
// }
// public Student getStudent(Long id) {
// return studentRepo.findById(id).orElse(null);
// }

// public void updateStudent(Student student, Long id) {
//     Optional<Student> optionalStudent = studentRepo.findById(id);
//     if(optionalStudent.isPresent()) {
//         Student studentToUpdate = optionalStudent.get();
//         studentToUpdate.setName(student.getName());
//         studentToUpdate.setAge(student.getAge());
//         studentToUpdate.setGrade(student.getGrade());
//         studentToUpdate.setStuClass(student.getStuClass());
//         studentRepo.save(studentToUpdate);
//     }

// }
// public void deleteStudent(Long id) {
// studentRepo.deleteById(id);
// }

// }
