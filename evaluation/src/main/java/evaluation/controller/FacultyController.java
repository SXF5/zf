package evaluation.controller;

import java.io.InputStream;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import evaluation.entity.Course;
import evaluation.entity.Faculty;
import evaluation.service.FacultyService;
import evaluation.util.Excelutil;
import evaluation.entity.Result;
import evaluation.entity.Teacher;

@Controller
@RequestMapping("/faculty")
public class FacultyController {
	
	//注入service
	 @Autowired
	 private FacultyService facultyService;
	
	//院系列表
	 @RequestMapping("/facultylist")
	 public ModelAndView facultylist() {
		   List<Faculty> faculties=facultyService.getFaculty();
		   ModelAndView mv=new ModelAndView("faculty/facultylist");
		   mv.addObject("faculties", faculties);
		   return mv;
	 }
	 
	 //新增页面
	 @RequestMapping("/addfaculty")
	 public ModelAndView addfaculty() {
	 	 ModelAndView mv=new ModelAndView("faculty/addfaculty");
	 	 return mv;
	  }
	 
	 //新增提交
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
	 
	 //删除
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
	 
	 //批量删除
	 @RequestMapping("/delchecked")
	 @ResponseBody
	 public Result delchecked(String aa) {
		 String[] ids1=aa.split(",");
		   int i=facultyService.delchecked(ids1);
		   System.out.println(i);
		   if(i>0) {
			   return new Result(1, "删除成功");
		   }else {
			   return new Result(0, "删除失败");
		   }
	 }
	 
	 //修改
	 @RequestMapping("/update")
		public ModelAndView edit(int facultyid){
			ModelAndView mv=new ModelAndView("faculty/editfaculty");
			Faculty faculty=facultyService.getFacultybyId(facultyid);
			mv.addObject("faculty", faculty);
			return mv;
		}
	 
	 //修改提交
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
	   
	 //模糊查询
		@RequestMapping("mselect")
		public ModelAndView mselect(String facultyname) {
			List<Faculty> list = facultyService.mhselect(facultyname);
			for(Faculty da : list) {
				//System.out.println(da.getFacultyname());
			}
				
			
			ModelAndView mv = new ModelAndView("faculty/facultylist");
			mv.addObject("faculties",list);
			return mv;
		}
	
	//Excel
		@RequestMapping("facultyimport")
		public String test() {
			return "/faculty/faculty-import";
		}
		
		//Excelutil 
		@RequestMapping("Excelfaculty")
		public String excelin(MultipartFile file,ModelMap map) throws Exception {
			InputStream in = file.getInputStream();
	        Faculty faculty =null;
	        List<List<Object>> listob = null;
	        listob=new Excelutil().getBankListByExcel(in, file.getOriginalFilename());
	        in.close();
	        int result = 0;
	        for(int i=0;i<listob.size();i++) {
	        	List<Object> li = listob.get(i);
	        	faculty = new Faculty();
	        	faculty.setFacultynumber(String.valueOf(li.get(0)));
	        	faculty.setFacultyname(String.valueOf(li.get(1)));
	        	result = facultyService.insertFaculty(faculty);
	        }
	        //System.out.println(result);
	        if (result>0) {
	         	map.put("reslut1", 1);
	 		}else {
	 			map.put("reslut1", 2);
	 		}
	       return "teacher/teacher-import";
		}
		
		
}
