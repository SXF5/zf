package evaluation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import evaluation.entity.ResultMsg;
import evaluation.entity.Score;

import evaluation.service.ScoreService;

@Controller
@RequestMapping("/score")
public class ScoreController {
	@Autowired
	private ScoreService scoreService;
	
	//专业列表 查询所有专业信息
	@RequestMapping("scorelist")
    public ModelAndView scorelist() {
		List<Score> scores=scoreService.getScore();
		//List<Score> scores2=scoreService.getScore2();
		//List<Score> scores3=scoreService.getScore3();
		//List<Teaching> teachings=scoreService.getTeacher();
		ModelAndView mView=new ModelAndView("score/scorelist");
		mView.addObject("scores", scores);
		//mView.addObject("scores2", scores2);
		//mView.addObject("scores3", scores3);
		//mView.addObject("teachings", teachings);
		return mView;
	}
	
	//根据id删除
		@RequestMapping(value="/delscore",produces= {"text/plain;charset=UTF-8"})
		@ResponseBody
		public ResultMsg delscore(int scoreid) {
			int i=scoreService.deleteScore(scoreid);
			if (i>0) {
				return new ResultMsg(1,"删除专业信息成功");
			}else {
				return new ResultMsg(0,"删除专业信息失败");
			}
		}
		
	
	//批量删除
			@RequestMapping("delallscore")
			@ResponseBody
			public ResultMsg delallscore(String ids) {
				
				String[] scoreids = ids.split(",");
				int i = scoreService.delAllScore(scoreids);
				if(i>0) {
					return new ResultMsg(1, "删除成功");
				}else {
					return new ResultMsg(2, "删除 失败");
				}
			}
	    
			//模糊查询
			@RequestMapping("mselect")
			public ModelAndView mselect(int teachingid) {
				List<Score> list = scoreService.mhselect(teachingid);
				/*for(Course course : list) {
					System.out.println(course.getCourseid());
				}*/
					
				
				ModelAndView mv = new ModelAndView("score/scorelist");
				mv.addObject("scores",list);
				return mv;
			}
	
}
