package evaluation.controller;

import java.io.InputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import evaluation.entity.ResultMsg;
import evaluation.entity.Teacher;
import evaluation.service.TeacherService;
import evaluation.util.Excelutil;

@Controller
@RequestMapping("/teacher")
public class TeacherController {
	
	//注入service
	@Autowired
	private TeacherService teacherService;
	
	//教师列表
	@RequestMapping("/teacher-list")
	 public ModelAndView index() {
		List<Teacher> teachers=teacherService.getTeachers();
		 ModelAndView mv=new ModelAndView("teacher/teacher-list");
		 mv.addObject("teachers", teachers);
		 return mv;
	 }
		
	@RequestMapping("/delete")
	 public ModelAndView delete(String teachernumber) {
		 teacherService.delTeacher(teachernumber);
		 ModelAndView mv=new ModelAndView("teacher/teacher-list");
		 return mv;
	 }

	//新增页面
	@RequestMapping("/add")
	 public ModelAndView add() {
		 ModelAndView mv=new ModelAndView("teacher/add");
		 return mv;
	 }
	//新增提交
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

	//修改页面
	@RequestMapping("/update")
	 public ModelAndView update(int teacherid) {
		 Teacher teacher=teacherService.getTeacherByid(teacherid);
		 ModelAndView mv=new ModelAndView("teacher/update");
		 mv.addObject("teacher", teacher);
		 return mv;
	 }
	
	//修改提交
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
	



	//登录页面   
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

	 
	 //登录判断
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
	 
	//批量删除
		@RequestMapping("delallteacher")
		@ResponseBody
		public ResultMsg byincourse(String ids) {
			//System.out.println(ids);
			String[] teacherids = ids.split(",");
			int i = teacherService.delAllTeacher(teacherids);
			if(i>0) {
				return new ResultMsg(1, "删除成功");
			}else {
				return new ResultMsg(2, "删除 失败");
			}
		}
	 
		//模糊查询
		@RequestMapping("mselect")
		public ModelAndView mselect(String name) {
			List<Teacher> list = teacherService.mhselect(name);							
			ModelAndView mv = new ModelAndView("teacher/teacher-list");
			mv.addObject("teachers",list);
			return mv;
		}
		
		//Excel
		@RequestMapping("teacherimport")
		public String test() {
			return "/teacher/teacher-import";
		}
		
		//Excelutil 
		@RequestMapping("Excelteacher")
		public String excelin(MultipartFile file,ModelMap map) throws Exception {
			InputStream in = file.getInputStream();
	        Teacher teacher =null;
	        List<List<Object>> listob = null;
	        listob=new Excelutil().getBankListByExcel(in, file.getOriginalFilename());
	        in.close();
	        int result = 0;
	        for(int i=0;i<listob.size();i++) {
	        	teacher = new Teacher();
	        	List<Object> li = listob.get(i);
	        	teacher.setName(String.valueOf(li.get(0)));
	        	teacher.setTeachernumber(String.valueOf(li.get(1)));
	        	teacher.setSex(String.valueOf(li.get(2)));
	        	teacher.setPassword(String.valueOf(li.get(3)));
	        	teacher.setPower(Integer.valueOf((String) li.get(4)));
	        	teacher.setMajorid(Integer.valueOf((String) li.get(5)));
	        	result = teacherService.addTeacher(teacher);
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

