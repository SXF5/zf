package evaluation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import evaluation.dao.FacultyDao;
import evaluation.entity.Course;
import evaluation.entity.Faculty;


@Service
public class FacultyService {
	//注入接口
	@Autowired
	private FacultyDao facultyDao;
    
	//新增
	public int insertFaculty(Faculty faculty) {
		int cnt=facultyDao.isFacultybyname(faculty.getFacultyname());
    	if(cnt>0){
			return -2;
		}
		int i= facultyDao.addFaculty(faculty);
		return i;
	}
	
	//删除
	public int delFaculty(int facultyid) {
		return facultyDao.delFaculty(facultyid);
	}
	
	//批量删除
	public int delchecked(String[] ids1) {
		return facultyDao.delchecked(ids1);
	}
	
	//修改
	public int updateFaculty(Faculty faculty){
		int cnt=facultyDao.isFacultybyname(faculty.getFacultyname());
    	if(cnt>0){
			return -2;
		}
		int i= facultyDao.updateFaculty(faculty);
		return i;
	}
	
	//查询所有
	public List<Faculty> getFaculty() {
		return facultyDao.getFaculty();
	}
	
	//根据id查询
	public Faculty getFacultybyId(int facultyid) {
		return facultyDao.getFacultybyId(facultyid);
	}
	
	//模糊查询
		public List<Faculty> mhselect(String facultyname){
			List<Faculty> list =facultyDao.mhselect(facultyname);
			return list;
			
		}

}
