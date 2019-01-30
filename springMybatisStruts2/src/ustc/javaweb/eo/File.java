package ustc.javaweb.eo;

import java.sql.Timestamp;

public class File {
	private String filename;
	private String filedir;
	private String filetype;
	private String filesort;
	private String fileintro;
	private String username;
	private String useremail;
	private Timestamp updatetime;
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFiledir() {
		return filedir;
	}
	
	public String getFilesort() {
		return filesort;
	}
	public void setFilesort(String filesort) {
		this.filesort = filesort;
	}
	public void setFiledir(String filedir) {
		this.filedir = filedir;
	}
	public String getFiletype() {
		return filetype;
	}
	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}
	public String getFileintro() {
		return fileintro;
	}
	public void setFileintro(String fileintro) {
		this.fileintro = fileintro;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUseremail() {
		return useremail;
	}
	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}
	public Timestamp getUpdatetime() {
		return updatetime;
	}
	public void setUpdatetime(Timestamp updatetime) {
		this.updatetime = updatetime;
	}
	
}
