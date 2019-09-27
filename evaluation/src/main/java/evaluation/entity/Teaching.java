package evaluation.entity;

public class Teaching {
	private int teachingid;
	private int courseid;
	private int classid;
	private int teacherid;

	
	
	
	private Teach_v tv;
	private Classtb cla;
	public Classtb getCla() {
		return cla;
	}
	public void setCla(Classtb cla) {
		this.cla = cla;
	}
	public Course getCou() {
		return cou;
	}
	public void setCou(Course cou) {
		this.cou = cou;
	}
	private Course cou;
	public Teach_v getTv() {
		return tv;
	}
	public void setTv(Teach_v tv) {
		this.tv = tv;

	}
	public int getTeachingid() {
		return teachingid;
	}
	public void setTeachingid(int teachingid) {
		this.teachingid = teachingid;
	}
	public int getCourseid() {
		return courseid;
	}
	public void setCourseid(int courseid) {
		this.courseid = courseid;
	}
	public int getClassid() {
		return classid;
	}
	public void setClassid(int classid) {
		this.classid = classid;
	}
	public int getTeacherid() {
		return teacherid;
	}
	public void setTeacherid(int teacherid) {
		this.teacherid = teacherid;
	}
   private Teacher teacher;

public Teacher getTeacher() {
	return teacher;
}
public void setTeacher(Teacher teacher) {
	this.teacher = teacher;
}
}
