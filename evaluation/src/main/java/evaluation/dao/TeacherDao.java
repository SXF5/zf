package evaluation.dao;

import java.util.List;

import evaluation.entity.Teacher;
import org.apache.ibatis.annotations.Param;

public interface TeacherDao {
	List<Teacher> getTeachers();

	List<Teacher> getTeachersmajor();	
	//根据id查询
	Teacher getTeacherByid(int teacherid);
	//查询一组
	int getCount();
	//根据账号查询
	int getTeacherByNum(String teachernumber);
	//新增
	int addTeacher(Teacher teacher);
	//删除
	int delTeacher(String teachernumber);
	//修改
	int updateTeacher(Teacher teacher);

	//查询所有
	Teacher getTeacher(Teacher teacher);
   
	//批量删除
	int delAllTeacher(String[] ids);

	//模糊查询
		List<Teacher> mhselect(@Param("name")String name);
}
