package evaluation.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import evaluation.entity.Faculty;
import evaluation.service.FacultyService;
import evaluation.entity.Result;

@Controller
@RequestMapping("/faculty")
public class FacultyController {
	 @Autowired
	 private FacultyService facultyService;
	
	
	 @RequestMapping("/facultylist")
	 public ModelAndView facultylist() {
		   List<Faculty> faculties=facultyService.getFaculty();
		   ModelAndView mv=new ModelAndView("faculty/facultylist");
		   mv.addObject("faculties", faculties);
		   return mv;
	 }
	 
	 @RequestMapping("/addfaculty")
	 public ModelAndView addfaculty() {
	 	 ModelAndView mv=new ModelAndView("faculty/addfaculty");
	 	 return mv;
	  }
	 
	 @RequestMapping("/add_submit")
	 @ResponseBody
	 public Result add_submit(String facultynumber,String facultyname) {
		Faculty faculty=new Faculty();
		faculty.setFacultyname(facultyname);
		faculty.setFacultynumber(facultynumber);
		 int i=facultyService.insertFaculty(faculty);
		 if(i>0) {
			 return new Result(1,"新增成功!");
		 }else if(i==-2){
			 return new Result(2,"该学院已存在");
		} else {
			 return new Result(0,"新增失败!");
		}
	 }
	 
	 @RequestMapping("/del")
	 @ResponseBody
	 public Result del(int facultyid) {
		   int i=facultyService.delFaculty(facultyid);
		   if(i>0) {
			   return new Result(1, "删除成功");
		   }else {
			   return new Result(0, "删除失败");
		   }
	 }
	 
	 @RequestMapping("/delchecked")
	 @ResponseBody
	 public Result delchecked(String aa) {
		 String[] ids1=aa.split(",");
		   int i=facultyService.delchecked(ids1);		  
		   if(i>0) {
			   return new Result(1, "删除成功");
		   }else {
			   return new Result(0, "删除失败");
		   }
	 }
	 
	 
	 @RequestMapping("/update")
		public ModelAndView edit(int facultyid){
			ModelAndView mv=new ModelAndView("faculty/editfaculty");
			Faculty faculty=facultyService.getFacultybyId(facultyid);
			mv.addObject("faculty", faculty);
			return mv;
		}
	 
	   @RequestMapping("/update_submit")
		@ResponseBody
		public Result update_submit(Faculty faculty){
			//修改学院
			int i=facultyService.updateFaculty(faculty);
			if(i>0) {
				 return new Result(1,"修改成功!");
			 }else if(i==-2){
				 return new Result(2,"该学院已存在");
			} else {
				 return new Result(0,"修改失败!");
			}
		 }
}
