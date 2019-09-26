package evaluation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import evaluation.dao.MajorDao;
import evaluation.entity.Course;
import evaluation.entity.Major;

@Service
public class MajorService {
	//注入接口
	@Autowired
	private MajorDao majorDao;
	//查询所有
	public List<Major> getMajor(){
		return majorDao.getMajor();
	}
	//删除
	public int deleteMajor(int majorid) {
		return majorDao.deleteMajor(majorid);
	}
	//新增
	public int addMajor(Major major) {
		return majorDao.addMajor(major);
	}
	//修改
	public int updateMajor(Major major) {
		return majorDao.updateMajor(major);
	}
	//根据ID查询
	public Major getMajorById(int majorid) {
		return majorDao.getMajorById(majorid);
	}
	//根据id批量删除
	public int delAllMajor(String[] ids) {
		return majorDao.delAllMajor(ids);
	}
	//模糊查询
	public List<Major> mhselect(String majorname){
			List<Major> list = majorDao.mhselect(majorname);
			return list;
			
		}
}
