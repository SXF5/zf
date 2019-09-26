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
import evaluation.entity.ResultMsg;
import evaluation.service.CourseService;
import evaluation.util.Excelutil;


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
		//System.out.println(ids);
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
	
/*	//excel
	@RequestMapping("Excelin")
    public String importfile(MultipartFile file) throws Exception {
        InputStream in = file.getInputStream();
        Course course = null;
        int result = 0;
        XSSFWorkbook xssfWorkbook = new XSSFWorkbook(in);
        //HSSFWorkbook hssfWorkbook = new HSSFWorkbook(in);
        for(int numSheet = 0; numSheet < xssfWorkbook.getNumberOfSheets(); numSheet++){
            XSSFSheet xssfSheet = xssfWorkbook.getSheetAt(numSheet);
            if(xssfSheet == null) continue;

            for(int rowNum = 1; rowNum <= xssfSheet.getLastRowNum(); rowNum++){
                XSSFRow xssfRow = xssfSheet.getRow(rowNum);
                System.out.println("开始---------"+xssfRow.getLastCellNum());
                course = new Course();
                for(int i = 0; i < xssfRow.getLastCellNum(); i++){
                    XSSFCell cell = xssfRow.getCell(i);
                    xssfRow.getCell(i).setCellType(cell.CELL_TYPE_STRING);
                    if(i == 0) course.setCoursenumber(xssfRow.getCell(0).getStringCellValue());
                    if(i == 1) course.setCoursename(xssfRow.getCell(1).getStringCellValue());
                    if(i == 2) course.setMajorid(Integer.valueOf(xssfRow.getCell(2).getStringCellValue()));
                }
                result = courseService.addcourse(course);
            }
        }
        if(result >= 0)
            return "success";
        else
            return "fail";
    }*/
	
	@RequestMapping("courseimport")
	public String test() {
		return "/course/course-import";
	}
	
	//Excelutil 
	@RequestMapping("Excelin")
	public String excelin(MultipartFile file,ModelMap map) throws Exception {
		InputStream in = file.getInputStream();
        Course course = null;
        List<List<Object>> listob = null;
        listob=new Excelutil().getBankListByExcel(in, file.getOriginalFilename());
        in.close();
        int result = 0;
        for(int i=0;i<listob.size();i++) {
        	course = new Course();
        	List<Object> li = listob.get(i);
        	course.setCoursenumber(String.valueOf(li.get(0)));
        	course.setCoursename(String.valueOf(li.get(1)));
        	course.setMajorid(Integer.valueOf((String) li.get(2)));
        	result = courseService.addcourse(course);
        }
        //System.out.println(result);
        if (result>0) {
         	map.put("reslut1", 1);
 		}else {
 			map.put("reslut1", 2);
 		}
       return "course/course-import";
	}
}
