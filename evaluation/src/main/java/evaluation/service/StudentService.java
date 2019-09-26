package evaluation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import evaluation.dao.StudentDao;
import evaluation.entity.Student;



@Service
public class StudentService {
	
	//注入接口
	 @Autowired
	 private StudentDao studentDao;	
	 
	 //查询所有
		public List<Student> getStus(){
			return studentDao.getStus();
		}
		
		//根据id查询	
		public Student getStudentBystuid(int studentid) {
			return studentDao.getStudentBystuid(studentid);
			
		}
		
		//修改
		public int updateStudent(Student student) {
			return studentDao.updateStudent( student);
		}
		
		//删除
		public int studentdel(int studentid) {
			return studentDao.studentdel(studentid);
		}
		
		//批量删除
		public int studentall(String[] aa1){
			
			return studentDao.studentall(aa1);
		}
        public int studentadd(Student student){
			
			return studentDao.studentadd(student);
		} 
	}
