package evaluation.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import evaluation.entity.Classtb;
import evaluation.entity.GetageByBirthday;
import evaluation.entity.Student;
import evaluation.service.ClasstbService;
import evaluation.service.StudentService;

import evaluation.entity.ResultMsg;

@Controller
@RequestMapping("/student")
public class StudentController {
	@Autowired
	private StudentService getStus;
	@Autowired
	private ClasstbService claser;

	// 读取学生
	@RequestMapping("/studentlist")
	public ModelAndView studentlist() {
		List<Student> students = getStus.getStus();
		ModelAndView mv = new ModelAndView("student/studentlist");
		mv.addObject("students", students);

		return mv;
	}

//年龄计算
	@RequestMapping("/getAge")

	public ModelAndView getAge(String birthday) throws ParseException {
		System.out.println("1");
		SimpleDateFormat myFormatter = new SimpleDateFormat("yyyy-MM-dd");
		Date mydate = myFormatter.parse(birthday);
		ModelAndView mv = new ModelAndView();
		int age = getAgeByBirth(mydate);
		mv.addObject("age", age);
		return mv;

	}

	private int getAgeByBirth(Date mydate) {
		// TODO Auto-generated method stub
		return 0;
	}

	// 修改学生界面
	@RequestMapping("/studentedit")
	public ModelAndView studentedit(int studentid) {

		Student stu = getStus.getStudentBystuid(studentid);
		List<Classtb> clas = claser.getclass();
		ModelAndView mv = new ModelAndView("student/studentedit");
		mv.addObject("stu", stu);
     	mv.addObject("clas",clas);
		return mv;
	}

	// 修改学生
	@RequestMapping("updatestucontroll")
	@ResponseBody
	public ResultMsg update(Student student) {
		int i = getStus.updateStudent(student);
		if (i > 0) {

			return new ResultMsg(1, "更新学生成功");

		}

		return new ResultMsg(0, "更新学生失败");

	}

	// 增加学生界面
	@RequestMapping("/studentadd")
	public ModelAndView studentadd() {
		ModelAndView mv = new ModelAndView("student/studentadd");
		return mv;
	}

	// 增加学生
	@RequestMapping("addstudent")
	@ResponseBody
	public ResultMsg addstudent(Student student) {

		int i = getStus.studentadd(student);
		if (i > 0) {
			return new ResultMsg(1, "更新成功");
		}
		return new ResultMsg(0, "更新失败");
	}

	// 删除学生
	@RequestMapping("studentdel")
	@ResponseBody
	public ResultMsg studentdel(int studentid) {

		int i = getStus.studentdel(studentid);

		if (i > 0) {
			return new ResultMsg(1, "删除成功");
		}
		return new ResultMsg(0, "删除失败");
	}

	// 学生批量删除
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

}
