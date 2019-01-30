package ustc.javaweb.service;

import java.util.List;

import ustc.javaweb.eo.File;

public interface FileManager {
	public abstract void add(File file) throws Exception;
	public List<File> getFiles();
	public List<File> getuploadFiles(String email);
	public List<File> getTypeFiles(String type);
	public List<File> getSortFiles(String sort);
}

