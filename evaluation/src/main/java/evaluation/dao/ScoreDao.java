package evaluation.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;


import evaluation.entity.Score;
import evaluation.entity.Teaching;

public interface ScoreDao {
	
	//查看所有
     List<Score> getScore();
//     List<Score> getScore2();
//     List<Score> getScore3();
     //删除
	int deleteScore(int scoreid);
	//查询得分教师
	//List<Teaching> getTeacher();
	//根据id批量删除
	int delAllScore(String[] ids);
	//模糊查询
	List<Score> mhselect(@Param("teachername")String teachername);
	

}
