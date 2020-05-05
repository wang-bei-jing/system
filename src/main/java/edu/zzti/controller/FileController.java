package edu.zzti.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import edu.zzti.bean.*;
import edu.zzti.service.TeacherService;
import edu.zzti.service.TopicSelectService;
import edu.zzti.service.TopicService;
import edu.zzti.service.WeekDocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/file")
public class FileController {

    private final TopicService topicService;

    private final WeekDocumentService weekDocumentService;

    public FileController(TopicService topicService, WeekDocumentService weekDocumentService) {
        this.topicService = topicService;
        this.weekDocumentService = weekDocumentService;
    }

    //文件上传
    @ResponseBody
    @RequestMapping(value="/uploadTopicFile",method=RequestMethod.POST)
    public void uploadDocument(MultipartFile file, Integer tno, Integer dTId, String remark, HttpServletRequest request) throws IOException {
        String path = request.getSession().getServletContext().getRealPath("upload")+"/"+tno+"/topic/"+dTId;
        String fileName = file.getOriginalFilename();
        WeekDocument weekDocument =new WeekDocument();
        weekDocument.setdTId(dTId);
        weekDocument.setDocumentname(fileName);
        System.out.println(weekDocument.getDocumentname());
        weekDocument.setCategory("3");
        weekDocument.setRemark(remark);
        Date date = new Date();
        Timestamp timestamp = new Timestamp(date.getTime());
        weekDocument.setWkTime(timestamp);
        weekDocumentService.add(weekDocument);
        System.out.println("uploadTopicFile--"+weekDocument.toString());
        File dir = new File(path,fileName);
        if(!dir.exists()){
            dir.mkdirs();
        }
        file.transferTo(dir);
    }

    //文件下载
    @ResponseBody
    @RequestMapping("/downloadTopicFile")
    public void downloadTopicFile(HttpServletRequest request, HttpServletResponse response,Integer dId) throws Exception{
        WeekDocument weekDocument = weekDocumentService.selectById(dId);
        String documentname = weekDocument.getDocumentname();
        //下载文件路径
        String pathFileName = "";
        if (weekDocument.getCategory().equals("3")){
            Integer dTId = weekDocument.getdTId();
            Integer tno = topicService.selectTopicById(dTId).getTno();
            pathFileName = request.getSession().getServletContext().getRealPath("upload")+"/"+tno+"/topic/"+dTId+"/"+documentname;
        }
        System.out.println(pathFileName);
        //获取输入流
        InputStream bis = new BufferedInputStream(new FileInputStream(new File(pathFileName)));
        //假如以中文名下载的话
        String filename = documentname;
        //转码，免得文件名中文乱码
        filename = URLEncoder.encode(filename,"UTF-8");
        //设置文件下载头
        response.addHeader("Content-Disposition", "attachment;filename=" + filename);
        //1.设置文件ContentType类型，这样设置，会自动判断下载文件类型
        response.setContentType("multipart/form-data");
        BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
        int len = 0;
        while((len = bis.read()) != -1){
            out.write(len);
            out.flush();
        }
        out.close();
    }

    //文件下载
    @ResponseBody
    @RequestMapping("/download")
    public void download(HttpServletRequest request, HttpServletResponse response,Integer dId) throws Exception{
        WeekDocument weekDocument = weekDocumentService.selectBy(dId);
        String documentname = weekDocument.getDocumentname();
        String sSno = "";
        //下载文件路径
        String pathFileName = "";
        if (weekDocument.getCategory().equals("1")){
            String week = weekDocument.getWeek();
            sSno = weekDocument.getStudent().getSno();
            pathFileName = request.getSession().getServletContext().getRealPath("upload")+"/"+sSno+"/weekDocuments/"+week+"/"+documentname;
        }
        if (weekDocument.getCategory().equals("2")){
            sSno = weekDocument.getStudent().getSno();
            pathFileName = request.getSession().getServletContext().getRealPath("upload")+"/"+sSno+"/testFile/"+documentname;
        }
        System.out.println(pathFileName);
        //获取输入流
        InputStream bis = new BufferedInputStream(new FileInputStream(new File(pathFileName)));
        //假如以中文名下载的话
        String filename = documentname;
        //转码，免得文件名中文乱码
        filename = URLEncoder.encode(filename,"UTF-8");
        //设置文件下载头
        response.addHeader("Content-Disposition", "attachment;filename=" + filename);
        //1.设置文件ContentType类型，这样设置，会自动判断下载文件类型
        response.setContentType("multipart/form-data");
        BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
        int len = 0;
        while((len = bis.read()) != -1){
            out.write(len);
            out.flush();
        }
        out.close();
    }

    //删除
    @ResponseBody
    @RequestMapping(value="/del/{dId}", method=RequestMethod.DELETE)
    public Msg del(HttpServletRequest request,@PathVariable("dId")Integer dId){
        WeekDocument weekDocument = weekDocumentService.selectById(dId);
        Integer dTId = weekDocument.getdTId();
        Integer tno = topicService.selectTopicById(dTId).getTno();
        String documentname = weekDocument.getDocumentname();
        String pathFileName = request.getSession().getServletContext().getRealPath("upload")+"/"+tno+"/topic/"+dTId+"/"+documentname;
        try {
            pathFileName = URLDecoder.decode(pathFileName, "UTF-8");
            System.out.println(pathFileName);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        File file = new File(pathFileName);
        deleteFile(file);
        weekDocumentService.deleteByPrimaryKey(dId);
        return Msg.success();
    }
    private void deleteFile(File file) {
        if (file.exists()) {//判断文件是否存在
            if (file.isFile()) {//判断是否是文件
                file.delete();//删除文件
            } else if (file.isDirectory()) {//否则如果它是一个目录
                File[] files = file.listFiles();//声明目录下所有的文件 files[];
                for (int i = 0;i < files.length;i ++) {//遍历目录下所有的文件
                    this.deleteFile(files[i]);//把每个文件用这个方法进行迭代
                }
                file.delete();//删除文件夹
            }
        } else {
            System.out.println("所删除的文件不存在");
        }
    }

    /**
     * 修改记录
     */
    @ResponseBody
    @RequestMapping(value="/upd/{dId}",method= RequestMethod.PUT)
    public Msg upd(WeekDocument weekDocument){
        System.out.println("upd--grade.toString()"+weekDocument.toString());
        weekDocumentService.upd(weekDocument);
        return Msg.success();
    }

    /**
     * 查询详细信息
     */
    @ResponseBody
    @RequestMapping("/detail/{dId}")
    public Msg detail(@PathVariable("dId")Integer dId){
        WeekDocument weekDocument = weekDocumentService.selectBy(dId);
        return Msg.success().add("weekDocument",weekDocument);
    }

    @ResponseBody
    @RequestMapping("/findTopic/{dTId}")
    public Msg findTopic(@RequestParam(value = "pn", defaultValue = "1")Integer pn, @PathVariable("dTId")Integer dTId, String category) {
        PageHelper.startPage(pn, 5);
        List<WeekDocument> weekDocumentList = weekDocumentService.findTopic(dTId,category);
        for (WeekDocument weekDocument : weekDocumentList) {
            System.out.println(weekDocument.toString());
        }
        PageInfo page = new PageInfo(weekDocumentList, 2);
        return Msg.success().add("pageInfo", page);
    }

    @ResponseBody
    @RequestMapping("/findTopicBy/{tno}")
    public Msg findTopicBy(@RequestParam(value = "pn", defaultValue = "1")Integer pn, @PathVariable("tno")Integer tno, String category) {
        PageHelper.startPage(pn, 5);
        List<WeekDocument> weekDocumentList = weekDocumentService.findTopicBy(tno,category);
        for (WeekDocument weekDocument : weekDocumentList) {
            System.out.println(weekDocument.toString());
        }
        PageInfo page = new PageInfo(weekDocumentList, 2);
        return Msg.success().add("pageInfo", page);
    }

    @ResponseBody
    @RequestMapping("/findWeekDocument/{tno}")
    public Msg findWeekDocument(@RequestParam(value = "pn", defaultValue = "1")Integer pn, @PathVariable("tno")Integer tno, String category) {
        PageHelper.startPage(pn, 5);
        List<WeekDocument> weekDocumentList = weekDocumentService.findBy(tno,category);
        for (WeekDocument weekDocument : weekDocumentList) {
            System.out.println(weekDocument.toString());
        }
        PageInfo page = new PageInfo(weekDocumentList, 2);
        return Msg.success().add("pageInfo", page);
    }

    /**
     * 查询所有课题
     */
    @ResponseBody
    @RequestMapping("/topic/{tno}")
    public Msg topic(@PathVariable("tno")Integer tno){
        List<Topic> topicList=topicService.selectTopicByTno(tno);
        return Msg.success().add("topicList", topicList);
    }
}

