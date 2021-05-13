package com.akao.fileupload;

import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.junit.Test;

import com.opensymphony.xwork2.ActionSupport;
public class FileUpLoadAction extends ActionSupport {
    private File file1;
	private String file1FileName;
	private String file1ContentType;
	


	public void setFile1(File file1) {
		this.file1 = file1;
	}



	


	public void setFile1FileName(String file1FileName) {
		this.file1FileName = file1FileName;
	}






	public void setFile1ContentType(String file1ContentType) {
		this.file1ContentType = file1ContentType;
	}


	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		String path=ServletActionContext.getServletContext().getRealPath("/upload");
//		System.out.println(path);
//		String str2=path.substring(0,path.lastIndexOf("\\"));
//		str2+="\\WEB-INF\\classes\\com\\akao\\fileupload";
//		System.out.println(path);
//		String fString=ServletActionContext.getServletContext().getRealPath("/upload")+"\\"+file1FileName;
//		String args1="python3 "+str2+"\\createQa.py "+fString;
//		System.out.println("arg1:"+args1);
//		System.out.println(fString);
		String str2=path.substring(0,path.lastIndexOf("/"));
		str2+="/WEB-INF/classes/com/akao/fileupload";
		System.out.println(path);
        File destFile=new File(path,file1FileName);
     	FileUtils.copyFile(file1, destFile);
     	String fString=ServletActionContext.getServletContext().getRealPath("/upload")+"/"+file1FileName;
    	String args1="python3 "+str2+"/createQa.py "+fString;
    	System.out.println("arg1:"+args1);
    	System.out.println(fString);
    	try{
           Process pr=Runtime.getRuntime().exec(args1);
           BufferedReader in = new BufferedReader(new InputStreamReader(
            pr.getInputStream()));
          String line;
           while ((line = in.readLine()) != null) {
           System.out.println(line);
           }
          in.close();
           pr.waitFor();        
           } 
        catch (Exception e) {
           e.printStackTrace();
        }

     	return SUCCESS;

	}

}
