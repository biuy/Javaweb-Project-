package ustc.javaweb.action;

import com.opensymphony.xwork2.ModelDriven;

import java.io.*;
import java.util.*;
import java.text.SimpleDateFormat;
import java.sql.Timestamp; 

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import ustc.javaweb.baseaction.McBaseAction;
import ustc.javaweb.eo.File;
import ustc.javaweb.service.FileManager;
import ustc.javaweb.vo.UploadInfo;
import ustc.javaweb.action.FileUtil;

public class FileUploadAction extends McBaseAction implements ModelDriven<UploadInfo> {
	private UploadInfo info = new UploadInfo();

	@Autowired
	private FileManager fileManager;
	
	private List<File> files;
	
	private File file;	
	  
	     	
	public String doc() throws Exception {
		File f=new File();
		f.setFiletype("doc");
		f.setFiledir("/upload/doc");
		this.Upload(f);
		fileManager.add(f);
        return "success";
	}
	
	public String video() throws Exception {
		File f=new File();
		f.setFiletype("video");
		f.setFiledir("/upload/video");
		this.Upload(f);
		fileManager.add(f);
        return "success";
	}
	
	public String pic() throws Exception {
		File f=new File();
		f.setFiletype("pic");
		f.setFiledir("/upload/pic");
		this.Upload(f);
		fileManager.add(f);
        return "success";
	}
	
	
	public void Upload(File f) throws Exception {
		System.out.println(info.getFileFileName());
		Date date = new Date();
		String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
		System.out.println(nowTime);
		f.setFilesort(info.getFilesort());
		f.setFileintro(info.getFileintro());
		f.setFilename(info.getFileFileName());
		Timestamp newdate = Timestamp.valueOf(nowTime);
		f.setUpdatetime(newdate);
		
		f.setUseremail((String) session.getAttribute("email"));
		f.setUsername((String) session.getAttribute("name"));

		InputStream is = new FileInputStream(info.getFile());
		//warning??!!!
		String target = ServletActionContext.getServletContext().getRealPath(f.getFiledir());
		System.out.println(target);
		
		OutputStream os = new FileOutputStream(target + "\\" + f.getFilename());
		byte buffer[] = new byte[1024];
		int cnt = 0;
		while ((cnt = is.read(buffer)) > 0) {
			os.write(buffer, 0, cnt);
		}
		os.close();
		is.close();
		FileUtil.copy(info.getFile(), new java.io.File(target + "\\" + f.getFilename()));
		//和上面的操作一样，但可以把target改为本地目录使文件上传到本地查看如"D:/"。
	}
	
	public UploadInfo getModel() {
		return info;
	}

	public UploadInfo getInfo() {
		return info;
	}

	public void setInfo(UploadInfo info) {
		this.info = info;
	}

	public FileManager getFileManager() {
		return fileManager;
	}

	public void setFileManager(FileManager fileManager) {
		this.fileManager = fileManager;
	}
	
	public String uploadlist() {
		String email = (String)session.getAttribute("email");
		this.files = this.fileManager.getuploadFiles(email);
		return "uploadlist";
	}
	public String doclist() {
		String type = "doc";
		this.files = this.fileManager.getTypeFiles(type);
		return "doclist";
	}
	public String testlist() {
		String sort = "考试资料";
		this.files = this.fileManager.getSortFiles(sort);
		return "doclist";
	}
	public String explist() {
		String sort = "实验报告";
		this.files = this.fileManager.getSortFiles(sort);
		return "doclist";
	}
	public String noticelist() {
		String sort = "通知文档";
		this.files = this.fileManager.getSortFiles(sort);
		return "doclist";
	}
	
	public String videolist() {
		String type = "video";
		this.files = this.fileManager.getTypeFiles(type);
		return "videolist";
	}
	public String piclist() {
		String type = "pic";
		this.files = this.fileManager.getTypeFiles(type);
		return "piclist";
	}
	
	public String list() {
		this.files = this.fileManager.getFiles();
		return "list";
	}
	

	public List<File> getFiles() {
		return  files;
	}

	public void setFiles(List<File> files) {
		this.files = files;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}
	
}
