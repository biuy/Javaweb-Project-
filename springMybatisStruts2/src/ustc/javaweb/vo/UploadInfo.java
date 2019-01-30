package ustc.javaweb.vo;

import java.io.File;

public class UploadInfo {
	private File file;
	private String fileFileName;
	private String fileContentType;
	private String filesort;
	private String fileintro;
	
	public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}
	public String getFileFileName() {
		return fileFileName;
	}
	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}
	public String getFileContentType() {
		return fileContentType;
	}
	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}
	public String getFilesort() {
		return filesort;
	}
	public void setFilesort(String filesort) {
		this.filesort = filesort;
	}
	public String getFileintro() {
		return fileintro;
	}
	public void setFileintro(String fileintro) {
		this.fileintro = fileintro;
	}
	
	
}
