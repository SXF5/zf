package evaluation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import evaluation.entity.Classtb;
import evaluation.entity.Course;
import evaluation.entity.Faculty;
import evaluation.entity.Major;
import evaluation.entity.Teacher;
import evaluation.entity.Teaching;
import evaluation.service.TeachingService;

import evaluation.entity.Result;

@Controller
@RequestMapping("/teaching")
public class TeachingController {
	@Autowired
	private TeachingService teachingService;
	
	
	//select得到院系
	@RequestMapping("getFacultyname")
	@ResponseBody
	public List<Faculty> getFacultyname(Model model,Faculty faculty){
		List<Faculty> facultylist=teachingService.getFacultyname();
		model.addAttribute("facultylist",facultylist);
		return facultylist;
	}
	
	//select得到班级
	@RequestMapping("getClassname")
	@ResponseBody
	public List<Classtb> getClassname(Model model,Classtb classtb){
		List<Classtb> classlist=teachingService.getClassname();
		model.addAttribute("classlist",classlist);
		return classlist;
	}
	
	//select得到专业
	@RequestMapping("getMajorname")
	@ResponseBody
	public List<Major> getMajorname(@RequestParam(value="parentid")Integer facultyid,Model model){
		List<Major> majorlist=teachingService.getMajorname(facultyid);
		model.addAttribute("majorlist",majorlist);
		return majorlist;
	}
	
	//select得到课程
	@RequestMapping("getCoursename")
	@ResponseBody
	public List<Course> getCoursename(@RequestParam(value="parentid")Integer majorid,Model model){
		List<Course> courselist=teachingService.getCoursename(majorid);
		model.addAttribute("courselist",courselist);
		return courselist;
	}
	
	//select得到教师
	@RequestMapping("getTeachername")
	@ResponseBody
	public List<Teacher> getTeachername(@RequestParam(value="parentid")Integer majorid,Model model){
		List<Teacher> teacherlist=teachingService.getTeachername(majorid);
		model.addAttribute("teacherlist",teacherlist);
		return teacherlist;
	}
	
	//授课列表
	 @RequestMapping("/teachinglist")
	 public ModelAndView teachinglist() {
		   List<Teaching> teachings=teachingService.getCourse();
		   ModelAndView mv=new ModelAndView("teaching/teachinglist");
		   mv.addObject("teachings", teachings);
		   
		   return mv;
	 }
	 
	 //新增授课
	 @RequestMapping("/add_submit")
	 @ResponseBody
	 public Result add_submit(Integer courseid,Integer classid,Integer teacherid) {
		Teaching teaching=new Teaching();
		teaching.setCourseid(courseid);
		teaching.setClassid(classid);
		teaching.setTeacherid(teacherid);
		
		 int i=teachingService.insertTeaching(teaching);
		 if(i>0) {
			 return new Result(1,"新增成功");
		 }else if(i==-2){
			 return new Result(2,"该课程已存在");
		} else {
			 return new Result(0,"新增失败");
		}
	 }
	 
	 //单个删除授课
	 @RequestMapping("/del")
	 @ResponseBody
	 public Result del(int teachingid) {
		   int i=teachingService.delTeaching(teachingid);
		   if(i>0) {
			   return new Result(1, "删除成功");
		   }else {
			   return new Result(0, "删除失败");
		   }
	 }
	 
	 //批量删除
	 @RequestMapping("/delcheck")
	 @ResponseBody
	 public Result delcheck(String aa) {
		 String[] ids1=aa.split(",");
		   int i=teachingService.delcheck(ids1);		  
		   if(i>0) {
			   return new Result(1, "删除成功");
		   }else {
			   return new Result(0, "删除失败");
		   }
	 }
	 
	//模糊查询
			@RequestMapping("mselect")
			public ModelAndView Mselect(String name) {
				List<Teaching> list = teachingService.mhselect(name);							
				ModelAndView mv = new ModelAndView("teaching/teachinglist");
				mv.addObject("teachings",list);
				return mv;
			}

}
