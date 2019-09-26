package evaluation.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import evaluation.entity.Course;

public interface CourseDao {
	//查看Course
	List<Course> getallcourse ();
	//新增Course
	int addcourse (Course course);
	//修改Course
	int updatecourse(Course course);
	//根据id查询
	List<Course> getidcourse (int courseid);
	//根据id删除用户
	int byidcourse(int courseid);
	//批量删除
	int byincourse(String[] ids);
	//模糊查询
	List<Course> mhselect(@Param("coursename")String coursename);
	
}
