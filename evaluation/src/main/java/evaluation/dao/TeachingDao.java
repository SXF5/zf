package evaluation.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import evaluation.entity.Classtb;
import evaluation.entity.Course;
import evaluation.entity.Faculty;
import evaluation.entity.Major;
import evaluation.entity.Teacher;
import evaluation.entity.Teaching;

public interface TeachingDao {

	List<Faculty> getFacultyname();
	
	List<Classtb> getClassname();
	
	List<Teaching> getTeaching();
	
	List<Major> getMajorname(int facultyid);
	
	List<Course> getCoursename(int majorid);
	
	List<Teacher> getTeachername(int majorid);
	
	int insertTeaching(Teaching teaching);
	
	int delTeaching(int teachingid);
	
	int isTeaching(int teachingid);
	
	List<Teaching> getCourse();
	
	int delcheck(String[] ids1);
	//模糊查询
	List<Teaching> mhselect(@Param("name")String name);
	
}
