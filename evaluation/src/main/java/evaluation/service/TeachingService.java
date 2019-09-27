package evaluation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import evaluation.dao.TeachingDao;
import evaluation.entity.Classtb;
import evaluation.entity.Course;
import evaluation.entity.Faculty;
import evaluation.entity.Major;

import evaluation.entity.Teacher;
import evaluation.entity.Teaching;

@Service
public class TeachingService {
	@Autowired
	private TeachingDao teachingDao;
	
	public List<Faculty> getFacultyname(){
		return teachingDao.getFacultyname();
	}
	
	public List<Classtb> getClassname(){
		return teachingDao.getClassname();
	}
	
	public List<Teaching> getTeaching(){
		return teachingDao.getTeaching();
	}
	
	public List<Major> getMajorname(int facultyid){
		return teachingDao.getMajorname(facultyid);
	}
	
	public List<Course> getCoursename(int majorid){
		return teachingDao.getCoursename(majorid);
	}
	
	public List<Teacher> getTeachername(int majorid){
		return teachingDao.getTeachername(majorid);
	}
	
	public int insertTeaching(Teaching teaching) {
		int cnt=teachingDao.isTeaching(teaching.getTeachingid());
    	if(cnt>0){
			return -2;
		}
		int i= teachingDao.insertTeaching(teaching);
		return i;
	}
	
	public int delTeaching(int teachingid) {
		return teachingDao.delTeaching(teachingid);
	}
	
	public List<Teaching> getCourse(){
		return teachingDao.getCourse();
	}
	
	public int delcheck(String[] ids1) {
		return teachingDao.delcheck(ids1);
	}
	//模糊查询
		public List<Teaching> mhselect(String name){
					List<Teaching> list = teachingDao.mhselect(name);
					return list;
					
				}
		
	
}
