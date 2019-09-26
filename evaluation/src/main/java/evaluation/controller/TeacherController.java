package evaluation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import evaluation.entity.ResultMsg;
import evaluation.entity.Student;
import evaluation.entity.Teacher;
import evaluation.service.TeacherService;
import evaluation.util.Page;

@Controller
@RequestMapping("/teacher")
public class TeacherController {
	@Autowired
	private TeacherService teacherService;
	
	/*@RequestMapping("/teacher-list")
	 public ModelAndView index() {
		List<Teacher> teachers=teacherService.getTeachers();
		 ModelAndView mv=new ModelAndView("teacher/teacher-list");
		 mv.addObject("teachers", teachers);
		 return mv;
	 }*/
	@RequestMapping("/teacher-list")
	 public ModelAndView index() {		     
		 // 将分页参数封装到分页对象中
         Page<Teacher> page = new Page<Teacher>();
         page.setPageIndex(0);
         page.setPageSize(8);
         List<Teacher> teachers=teacherService.getTeachers(page);
		 //teacherService.RecordsList(page);	 
		 //List<Teacher> teachers = page.getDataList();	 
		 //page.setDataList(teachers);
		 ModelAndView mv=new ModelAndView("teacher/teacher-list");		 
		 mv.addObject("teachers", teachers);
		 mv.addObject("totalPageCount",page.getTotalPageCount());
		 return mv;
	 }
	@RequestMapping("/teacher-page")
	 public ModelAndView teacherPage(int pageIndex) {		     
		 // 将分页参数封装到分页对象中
        Page<Teacher> page = new Page<Teacher>();
        page.setPageIndex(8*(pageIndex-1)+1);
        page.setPageSize(8*(pageIndex-1)+8);
        List<Teacher> teachers=teacherService.getTeachers(page);
		teacherService.RecordsList(page);	 
		 List<Teacher> datalist = page.getDataList();	 
		 page.setDataList(teachers);
		 ModelAndView mv=new ModelAndView("teacher/teacher-list");		 
		 mv.addObject("teachers", teachers);
		 mv.addObject("datalist",datalist);
		 return mv;
	 }
	 
	@RequestMapping("/delete")
	 public ModelAndView delete(String teachernumber) {
		 teacherService.delTeacher(teachernumber);
		 ModelAndView mv=new ModelAndView("teacher/teacher-list");
		 return mv;
	 }
	
	@RequestMapping("/add")
	 public ModelAndView add() {
		 ModelAndView mv=new ModelAndView("teacher/add");
		 return mv;
	 }
	
	@RequestMapping("/add-submit")
	 public ResultMsg add_submit(Teacher teacher) {
		//新增教师
			int i=teacherService.addTeacher(teacher);
			if(i>0){
				return new ResultMsg(1,"添加成功");
			}else if(i==-2){
				return new ResultMsg(2,"该教师已经存在");
			}
			return new ResultMsg(0,"添加失败");
		}
	@RequestMapping("/update")
	 public ModelAndView update(int teacherid) {
		 Teacher teacher=teacherService.getTeacherByid(teacherid);
		 ModelAndView mv=new ModelAndView("teacher/update");
		 mv.addObject("teacher", teacher);
		 return mv;
	 }
	
	@RequestMapping("/update-submit")
	 public ResultMsg update_submit(Teacher teacher) {
		//新增教师
			int i=teacherService.updateTeacher(teacher);
			if(i>0){
				return new ResultMsg(1,"修改成功");
			}else if(i==-2){
				return new ResultMsg(2,"该教师已经存在");
			}
			return new ResultMsg(0,"修改失败");
		}
	
	@RequestMapping("/teacherlist")
	public ModelAndView studentlist() {
		List<Teacher> teachers =teacherService.getTeachersmajor();
		ModelAndView mv = new ModelAndView("teacher/teacher-list");
		mv.addObject("teachers", teachers);
		return mv;
	}
        
	 @RequestMapping("/login")
     public ModelAndView login() {
    	 ModelAndView mv=new ModelAndView("teacher/login");
    	 return mv;
}
	 
	 @RequestMapping("/managerlogin")
	 public ModelAndView  managerlogin(Model model,Teacher teacher){
		 model.addAttribute("teacher",teacher);
		 ModelAndView mv=new ModelAndView("teacher/managerlogin");
		 ModelAndView mv2=new ModelAndView("teacher/error");
		 boolean isLogin=teacherService.login(teacher.getTeachernumber(),teacher.getPassword());
		 if(isLogin) {
			 System.out.println("hello");
			 return mv;
		 }
		return mv2;
		
		
	 }
	 
}

