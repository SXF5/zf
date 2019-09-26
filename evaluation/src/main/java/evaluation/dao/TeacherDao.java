package evaluation.dao;

import java.util.List;


import evaluation.entity.Teacher;
import evaluation.util.Page;

public interface TeacherDao {
	
	List<Teacher> getTeachersmajor();
	
	List<Teacher> getTeachers(Page<Teacher> page);
	
	Teacher getTeacherByid(int teacherid);
	
	int getCount();
	
	int getTeacherByNum(String teachernumber);
	
	int addTeacher(Teacher teacher);
	
	int delTeacher(String teachernumber);
	
	int updateTeacher(Teacher teacher);
	
    List<Teacher> getteacherpower();
	int updatepower(Teacher teacher);
	
	Teacher getTeacher(Teacher teacher);


}
