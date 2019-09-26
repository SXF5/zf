package evaluation.controller;

import java.io.InputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import evaluation.entity.Classtb;

import evaluation.entity.Student;
import evaluation.entity.Teacher;
import evaluation.service.ClasstbService;
import evaluation.service.StudentService;
import evaluation.util.Excelutil;
import evaluation.entity.ResultMsg;

@Controller
@RequestMapping("/student")
public class StudentController {
	
	//注入service
	@Autowired
	private StudentService getStus;
	private ClasstbService claser;

	
	//学生列表
	@RequestMapping("/studentlist")
	public ModelAndView studentlist() {
		List<Student> students = getStus.getStus();
		ModelAndView mv = new ModelAndView("student/studentlist");
		mv.addObject("students", students);
		
		return mv;
	}
	
//	//修改页面
//	@RequestMapping("/studentedit")
//	public ModelAndView studentedit(int studentid) {

//年龄计算
	@RequestMapping("/getAge")

	public ModelAndView getAge(String  birthday) throws ParseException{
		  System.out.println("1");
		 SimpleDateFormat myFormatter = new SimpleDateFormat("yyyy-MM-dd");
		 Date mydate = myFormatter.parse(birthday);
		 ModelAndView mv = new ModelAndView();
		 int age = getAgeByBirth(mydate);
	     mv.addObject("age", age);
         return mv;	
	}
	

	//修改提交
	
	private int getAgeByBirth(Date mydate) {
	// TODO Auto-generated method stub
	return 0;
}
	@RequestMapping("/studentedit")
	public ModelAndView studentedit(int studentid) {

		Student stu = getStus.getStudentBystuid(studentid);

		ModelAndView mv = new ModelAndView("student/studentedit");
		mv.addObject("stu", stu);
		return mv;
	}

	@RequestMapping("/studentadd")
	public ModelAndView studentadd() {
		ModelAndView mv = new ModelAndView("student/studentadd");
		return mv;
	}
	@RequestMapping("addstudent")
	@ResponseBody
	public ResultMsg addstudent(Student student) {

		int i = getStus.studentadd(student);
		if (i > 0) {
			return new ResultMsg(1, "更新成功");
		}
		return new ResultMsg(0, "更新失败");
	}
	
	@RequestMapping("updatestucontroll")
	@ResponseBody
	public ResultMsg update(Student student) {

		int i = getStus.updateStudent(student);
		if (i > 0) {

			

			return new ResultMsg(1, "更新学生成功");

		}

		

		return new ResultMsg(0, "更新学生失败");

	}
	
	//删除
	@RequestMapping("studentdel")
	@ResponseBody
	public ResultMsg studentdel(int studentid) {

		int i = getStus.studentdel(studentid);

		if (i > 0) {
			return new ResultMsg(1, "删除成功");
		}
		return new ResultMsg(0, "删除失败");
	}
	
	//批量删除
	@RequestMapping("studentall")
	@ResponseBody
	public ResultMsg studentall(String aa) {

		String[] aa1 = aa.split(",");
		int i = getStus.studentall(aa1);
		System.out.println(aa);
		System.out.println(aa.length());
		if (i > 0) {
			return new ResultMsg(1, "删除成功");
		}
		return new ResultMsg(0, "删除失败");
	}
	
	//Excel
	@RequestMapping("studentimport")
	public String test() {
		return "/student/student-import";
	}
	
	//Excelutil 
	@RequestMapping("Excelstudent")
	public String excelin(MultipartFile file,ModelMap map) throws Exception {
		InputStream in = file.getInputStream();
		Student student =null;
        List<List<Object>> listob = null;
        listob=new Excelutil().getBankListByExcel(in, file.getOriginalFilename());
        in.close();
        int result = 0;
        for(int i=0;i<listob.size();i++) {
        	student = new Student();
        	List<Object> li = listob.get(i);
        	student.setStudentnumber(String.valueOf(li.get(0)));
        	student.setName(String.valueOf(li.get(1)));
        	student.setPassword(String.valueOf(li.get(2)));
        	student.setPower(Integer.valueOf((String) li.get(3)));
        	student.setClassid(Integer.valueOf((String) li.get(4)));
        	result = getStus.studentadd(student);
        }
        //System.out.println(result);
        if (result>0) {
         	map.put("reslut1", 1);
 		}else {
 			map.put("reslut1", 2);
 		}
       return "student/student-import";
	}

}
