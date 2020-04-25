package edu.zzti.controller;

import edu.zzti.bean.Student;
import edu.zzti.bean.Teacher;
import edu.zzti.service.StudentService;
import edu.zzti.service.TeacherService;
import edu.zzti.utils.PoiUtil;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileInputStream;
import java.util.ArrayList;

import java.util.List;
@Controller
public class MapController {
    @Autowired
    StudentService studentService;
    @Autowired
    TeacherService teacherService;
    //======================================导入学生========================================
    @ResponseBody
    @RequestMapping(value = "/importStudents", method = RequestMethod.POST)
    public ModelAndView importExcel(HttpServletRequest request, MultipartFile file) throws Exception {
        System.out.println("进控制器了");
        String path = request.getSession().getServletContext().getRealPath("upload");
        String fileName = file.getOriginalFilename();
        String newpathName=path+fileName;
        System.out.println(fileName);
        File dir = new File(path,fileName);
        if(!dir.exists()){
            dir.mkdirs();
        }else {
            File deletefile = new File(newpathName);
            deletefile.delete();
            System.out.println("删除完毕");
            dir.mkdirs();
        }
        file.transferTo(dir);
        //loadExcelData
        List<Student> dataList = this.loadStudentsExcelData(dir.getPath());
        //saveExcelData
        this.saveStudentsExcelData(dataList);
        //卸磨杀驴= =
        String delpathName=path+"/"+fileName;
        System.out.println("卸磨杀驴:"+delpathName);
        File deletefile = new File(delpathName);
        deletefile.delete();
        System.out.println("删除完毕");
            return new ModelAndView("redirect:/studentSelectAll");

    }

    protected List<Student> loadStudentsExcelData(String excelPath) throws Exception {
        System.out.println("进loadExcelData了");
        FileInputStream fileInputStream = new FileInputStream(excelPath);
        System.out.println("1");
        XSSFWorkbook workbook = new XSSFWorkbook(fileInputStream);
        System.out.println("2");
        Sheet sheet = workbook.getSheet("学生名单");
        System.out.println("3");
        //先存list里面再输入到数据库
        List<Student> studentList = new ArrayList<Student>();
        // 处理当前页，循环读取每一行
      /*  String createUser = this.currentUserName();*/
        for (int rowNum = 1; rowNum <= sheet.getLastRowNum(); rowNum++) {
            XSSFRow row = (XSSFRow) sheet.getRow(rowNum);
            String sno = PoiUtil.getCellValue(row.getCell(0));
            String name = PoiUtil.getCellValue(row.getCell(1));
            String department = PoiUtil.getCellValue(row.getCell(2));
            String classes = PoiUtil.getCellValue(row.getCell(3));
            /*Student.Occupy occupy = DataDict.Occupy.getByDesc(PoiUtil.getCellValue(row.getCell(4)));*/
            Student student = new Student();
            student.setSno(sno);
            student.setName(name);
            student.setDepartment(department);
            student.setClasses(classes);
            /*wowMap.setCreateUser(createUser);*/
            studentList.add(student);
        }

        fileInputStream.close();
        return studentList;
    }
    protected void saveStudentsExcelData(List<Student> dataList) {
        System.out.println("要保存咯输出一下List");
        for (int i=0;i<dataList.size();i++){
            System.out.println(dataList.get(i).toString());
        }
        studentService.batchInsert(dataList);
    }

    //======================================导入老师==========================================
    @ResponseBody
    @RequestMapping(value = "/importTeachers", method = RequestMethod.POST)
    public ModelAndView importTeachers(HttpServletRequest request, MultipartFile file) throws Exception {
        System.out.println("进控制器了");
        String path = request.getSession().getServletContext().getRealPath("upload");
        String fileName = file.getOriginalFilename();
        String newpathName=path+fileName;
        System.out.println(fileName);
        File dir = new File(path,fileName);
        if(!dir.exists()){
            dir.mkdirs();
        }else {
            File deletefile = new File(newpathName);
            deletefile.delete();
            System.out.println("删除完毕");
            dir.mkdirs();
        }
        file.transferTo(dir);
        //loadExcelData
        List<Teacher> dataList = this.loadTeachersExcelData(dir.getPath());
        //saveExcelData
        this.saveTeachersExcelData(dataList);
        //卸磨杀驴= =
        String delpathName=path+"/"+fileName;
        System.out.println("卸磨杀驴:"+delpathName);
        File deletefile = new File(delpathName);
        deletefile.delete();
        System.out.println("删除完毕");
        return new ModelAndView("redirect:/teacherSelectAll");
    }

    protected List<Teacher> loadTeachersExcelData(String excelPath) throws Exception {
        System.out.println("进loadExcelData了");
        FileInputStream fileInputStream = new FileInputStream(excelPath);
        System.out.println("1");
        XSSFWorkbook workbook = new XSSFWorkbook(fileInputStream);
        System.out.println("2");
        Sheet sheet = workbook.getSheet("教师名单");
        System.out.println("3");
        //先存list里面再输入到数据库
        List<Teacher> teacherList = new ArrayList<Teacher>();
        // 处理当前页，循环读取每一行
        /*  String createUser = this.currentUserName();*/
        for (int rowNum = 1; rowNum <= sheet.getLastRowNum(); rowNum++) {
            XSSFRow row = (XSSFRow) sheet.getRow(rowNum);
            String tnostr = PoiUtil.getCellValue(row.getCell(0));
            String name = PoiUtil.getCellValue(row.getCell(1));
            String department = PoiUtil.getCellValue(row.getCell(2));
            String identitystr = PoiUtil.getCellValue(row.getCell(3));
            int tno=Integer.valueOf(tnostr);
            int identity=Integer.valueOf(identitystr);
            Teacher teacher=new Teacher();
            teacher.setTno(tno);
            teacher.setName(name);
            teacher.setDepartment(department);
            teacher.setIdentity(identity);
            /*wowMap.setCreateUser(createUser);*/
            teacherList.add(teacher);
        }

        fileInputStream.close();
        return teacherList;
    }
    protected void saveTeachersExcelData(List<Teacher> dataList) {
        System.out.println("要保存咯输出一下List");
        for (int i=0;i<dataList.size();i++){
            System.out.println(dataList.get(i).toString());
        }
        teacherService.batchInsertTeacher(dataList);
    }

}
