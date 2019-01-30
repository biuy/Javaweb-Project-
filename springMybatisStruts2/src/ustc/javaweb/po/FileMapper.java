package ustc.javaweb.po;

import java.util.List;

import ustc.javaweb.eo.File;
import ustc.javaweb.eo.User;

public interface FileMapper {
	public void save(File u);
	public List<File> getFiles();
	public List<File> getuploadFiles(String email);
	public List<File> getTypeFiles(String type);
	public List<File> getSortFiles(String sort);
}