package ustc.javaweb.service.impl;
import java.util.List;

//import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ustc.javaweb.eo.File;
import ustc.javaweb.eo.User;
import ustc.javaweb.po.FileMapper;
import ustc.javaweb.service.FileManager;

@Service("fileManager")
public class FileManagerImpl implements FileManager {
	@Autowired
	private FileMapper fileMapper;

	public void add(File u) throws Exception {
		fileMapper.save(u);
	}
	public List<File> getFiles() {
		return this.fileMapper.getFiles();
	}
	
	public List<File> getuploadFiles(String email) {
		return this.fileMapper.getuploadFiles(email);
	}
	public List<File> getTypeFiles(String type) {
		return this.fileMapper.getTypeFiles(type);
	}
	public List<File> getSortFiles(String sort) {
		return this.fileMapper.getSortFiles(sort);
	}
	
	
	public FileMapper getFileMapper() {
		return fileMapper;
	}
	public void setFileMapper(FileMapper fileMapper) {
		this.fileMapper = fileMapper;
	}
	
}
