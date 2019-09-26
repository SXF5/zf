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
import evaluation.entity.Major;
import evaluation.entity.ResultMsg;
import evaluation.entity.Teacher;
import evaluation.service.FacultyService;
import evaluation.service.MajorService;
import evaluation.util.Excelutil;

@Controller
@RequestMapping("/major")
public class MajorController {
	
	//注入service
	@Autowired
	private MajorService majorService;
	@Autowired
	private FacultyService facultyService;
	 
	//专业列表 查询所有专业信息
	@RequestMapping("/majorlist")
	public ModelAndView majorlist() {
		List<Major> majors=majorService.getMajor();
		ModelAndView mView=new ModelAndView("major/majorlist");
		mView.addObject("majors", majors);
		return mView;
	}
	
	//根据id删除
	@RequestMapping(value="/delmajor",produces= {"text/plain;charset=UTF-8"})
	@ResponseBody
	public ResultMsg delmajor(int majorid) {
		int i=majorService.deleteMajor(majorid);
		if (i>0) {
			return new ResultMsg(1,"删除专业信息成功");
		}else {
			return new ResultMsg(0,"删除专业信息失败");
		}
	}
	
	//新增页面
	@RequestMapping("/addmajor")
	public ModelAndView addmajor() {
		List<Faculty> faculty=facultyService.getFaculty();
		ModelAndView mView =new ModelAndView("major/addmajor");
		mView.addObject("faculty", faculty);
		return mView;
	}
	
	//新增提交
	@RequestMapping(value="/addmajor_submit",produces= {"text/plain;charset=UTF-8"})//produce设置响应格式编码
	@ResponseBody
	public ResultMsg addmajor_submit(int majorid,String majornumber,String majorname,int facultyid) {
		Major major=new Major();
		major.setMajorid(majorid);
		major.setMajornumber(majornumber);
		major.setMajorname(majorname);
		major.setFacultyid(facultyid);
		int i=majorService.addMajor(major);
		if (i>0) {
			return new ResultMsg(1, "添加专业成功");
		} else if(i==-2) {
			return new ResultMsg(2, "该专业已存在");
		}
		return new ResultMsg(0, "添加专业失败");
	}
	
	//修改页面
	@RequestMapping("/updatemajor")
	public ModelAndView updatemajor(int majorid) {
		Major major=majorService.getMajorById(majorid);
		List<Faculty> faculty=facultyService.getFaculty();
		ModelAndView mView =new ModelAndView("major/updatemajor");
		mView.addObject("major", major);
		mView.addObject("faculty",faculty);
		return mView;
	}
	
	//修改提交
	@RequestMapping(value="/updatemajor_submit",produces= {"text/plain;charset=UTF-8"})
	@ResponseBody
	public ResultMsg updatemajor_submit(Major major){
		//更新信息
		int i=majorService.updateMajor(major);
		if(i>0){
			return new ResultMsg(1,"修改专业信息成功");
		}else{
			return new ResultMsg(0,"修改专业信息失败");
		}
	}
	
	//批量删除
		@RequestMapping("delallmajor")
		@ResponseBody
		public ResultMsg delallmajor(String ids) {
			
			String[] majorids = ids.split(",");
			int i = majorService.delAllMajor(majorids);
			if(i>0) {
				return new ResultMsg(1, "删除成功");
			}else {
				return new ResultMsg(2, "删除 失败");
			}
		}
    
		//模糊查询
		@RequestMapping("mselect")
		public ModelAndView mselect(String majorname) {
			List<Major> list = majorService.mhselect(majorname);
			/*for(Course course : list) {
				System.out.println(course.getCourseid());
			}*/
				
			
			ModelAndView mv = new ModelAndView("major/majorlist");
			mv.addObject("majors",list);
			return mv;
		}
		
		//Excel
				@RequestMapping("majorimport")
				public String test() {
					return "/major/major-import";
				}
				
				//Excelutil 
				@RequestMapping("Excelmajor")
				public String excelin(MultipartFile file,ModelMap map) throws Exception {
					InputStream in = file.getInputStream();
			        Major major =null;
			        List<List<Object>> listob = null;
			        listob=new Excelutil().getBankListByExcel(in, file.getOriginalFilename());
			        in.close();
			        int result = 0;
			        for(int i=0;i<listob.size();i++) {
			        	major = new Major();
			        	List<Object> li = listob.get(i);
			        	major.setMajornumber(String.valueOf(li.get(0)));
			        	major.setMajorname(String.valueOf(li.get(1)));
			        	major.setFacultyid(Integer.valueOf((String) li.get(2)));
			        	result = majorService.addMajor(major);
			        }
			        //System.out.println(result);
			        if (result>0) {
			         	map.put("reslut1", 1);
			 		}else {
			 			map.put("reslut1", 2);
			 		}
			       return "major/major-import";
				}
}
