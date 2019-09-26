package evaluation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import evaluation.entity.Course;
import evaluation.entity.ResultMsg;
import evaluation.service.CourseService;

@Controller
@RequestMapping("/course")
public class CourseController {
	@Autowired
	private CourseService courseService;
	
	//查看
	@RequestMapping("/course-list")
	public ModelAndView courselist(){
		List<Course> list = courseService.getallcourse();
		/*for(Course course : list) 
			System.out.println(course);*/
		ModelAndView mv = new ModelAndView("course/course-list");
		mv.addObject("list",list);
		return mv;
	}
	//新增页面
	@RequestMapping("/course-add")
	public ModelAndView courseadd(){
		ModelAndView mv = new ModelAndView("course/course-add");
		return mv;
	}

	//新增
	@RequestMapping("/addcourse")
	@ResponseBody
	public ResultMsg addcourse(Course course) {
		System.out.println(course.getCoursename());
		
		int i=courseService.addcourse(course);
		if(i>0) {
			return new ResultMsg(1, "新增成功");
		}else {
			return new ResultMsg(2, "新增失败");
		}
	}
	//修改
	@RequestMapping("course-update")
	public ModelAndView courseipdate(Integer courseid) {
		List<Course> list = courseService.getidcourse(courseid);

		ModelAndView mv = new ModelAndView("course/course-update");
		mv.addObject("list",list);
		return mv;
	}
	
	
	@RequestMapping("updatecourse")
	@ResponseBody
	public ResultMsg updatecourse(Course course) {
		int i = courseService.updatecourse(course);
		if(i>0) {
			return new ResultMsg(1, "修改成功");
		}else {
			return new ResultMsg(2, "修改失败");
		}
	}
	
	//删除
	@RequestMapping("byidcourse")
	@ResponseBody
	public ResultMsg byidcourse(int courseid) {
		int i = courseService.byidcourse(courseid);
		if(i>0) {
			return new ResultMsg(1, "删除成功");
		}else {
			return new ResultMsg(2, "删除 失败");
		}
	}
    
	//批量删除
	@RequestMapping("byincourse")
	@ResponseBody
	public ResultMsg byincourse(String ids) {
		System.out.println(ids);
		String[] courseids = ids.split(",");
		int i = courseService.byincourse(courseids);
		if(i>0) {
			return new ResultMsg(1, "删除成功");
		}else {
			return new ResultMsg(2, "删除 失败");
		}
	}
	
	//模糊查询
	@RequestMapping("mselect")
	public ModelAndView mselect(String coursename) {
		List<Course> list = courseService.mhselect(coursename);
		/*for(Course course : list) {
			System.out.println(course.getCourseid());
		}*/
			
		
		ModelAndView mv = new ModelAndView("course/course-list");
		mv.addObject("list",list);
		return mv;
	}
	//课程信息excel导入
	@RequestMapping("courseimport")
	public ModelAndView courseimport() {
		ModelAndView mv = new ModelAndView("course/course-import");
		
		return mv;
	}
	
	
}
