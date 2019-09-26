package evaluation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import evaluation.dao.TeacherDao;
import evaluation.entity.Teacher;

import evaluation.util.Page;


@Service
public class TeacherService {
	@Autowired
	private TeacherDao teacherDao;
	
	public List<Teacher> getTeachersmajor(){
		return teacherDao.getTeachersmajor();
	}
	
	public List<Teacher> getTeachers(Page<Teacher> page){
		return teacherDao.getTeachers(page);
	}
	
	public int delTeacher(String teachernumber) {
		return teacherDao.delTeacher(teachernumber);
	}
	
	public int getCount() {
		return teacherDao.getCount();
	}
	
	public int addTeacher(Teacher teacher) {
		return teacherDao.addTeacher(teacher);
	}
	
	public int updateTeacher(Teacher teacher) {
		return teacherDao.updateTeacher(teacher);
	}
	

	public int resetpwd(int teacherid) {
		return teacherDao.resetpwd(teacherid);
	}
	
	public Teacher getTeacherByid(int teacherid) {
		return teacherDao.getTeacherByid(teacherid);
	}
	

    public void RecordsList(Page<Teacher> page) {
        int count=teacherDao.getCount();//获取所有消息的数量
        page.setTotalCount(count);
        //判断传入的页面是否合法
        if(page.getPageIndex()>page.getTotalPageCount()) {
            //确保页面不会超过总页数
            page.setPageIndex(page.getTotalPageCount());
        }
        
        List<Teacher> teachers=teacherDao.getTeachers(page);
        page.setDataList(teachers);
    }

	public boolean login(String teachernumber,String password) {
		Teacher teacher=new Teacher();
		teacher.setTeachernumber(teachernumber);
		teacher.setPassword(password);
		Teacher t=teacherDao.getTeacher(teacher);
		if(t!=null){
			return true;
		}
		return false;
		}
		

}

