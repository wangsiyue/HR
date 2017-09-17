package com.yc.web.util;

import java.io.File;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class UploadFileUtil {

	/**
	 * 
	 * @param request
	 * @param files
	 * @param picProjectFile : 图片服务器的位置   tomcat/webapps/uploadBookImages/
	 * @param  picProjectUrl  : 图片服务器的url   http://localhost:8080/uploadBookImages/
	 * @return	图片项目在服务器中的webapps下面的名字 uploadPdfs
	 */
	public static Map<String, UploadFile> uploadFile(HttpServletRequest request, List<MultipartFile> files, String picRootName ) {
		Map<String, UploadFile> map = new HashMap<String, UploadFile>();
		if (files != null && files.size() > 0) {
			//request.getSession().getServletContext().getRealPath("/")  ==>C:\tomcat\apache-tomcat.xxx\webapps\douban
			//getParentFile  ==>C:\tomcat\apache-tomcat.xxx\webapps\
			File webappsfile=new File( request.getSession().getServletContext().getRealPath("/")).getParentFile();
			File picFile=new File(  webappsfile, picRootName);
			//构建图片服务器的url地址 ==>http://localhost:8080/uploadPdfs
			String picBasePath =  request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/"+picRootName ;
			
			for (MultipartFile multipartFile : files) {
				try {
					String originalFilename = multipartFile.getOriginalFilename();
					
					if(  multipartFile.isEmpty() ){
						continue;
					}
					// 生成新文件名,与时间相关
					String newfilename = getUniqueFileName()+ originalFilename.substring(originalFilename.lastIndexOf("."));
					String saveDir=picFile.getAbsolutePath()+getNowDateStr();
					
					String newFilePath=saveDir+newfilename;
					//http://localhost:8080/uploadPdfs/2017/2/20/xxx.pdf
					String newFileUrl= picBasePath+getNowDateStr()+newfilename;
					
					File saveDirFile=new File( saveDir);
					
					if (!saveDirFile.exists()) {
						saveDirFile.mkdirs();
					}

					File imageFile = new File(newFilePath);

					UploadFile uploadFile = new UploadFile();
					uploadFile.contentType = multipartFile.getContentType();
					uploadFile.size = multipartFile.getSize();
					uploadFile.originalFileName = originalFilename;
					uploadFile.newFileName = newfilename;
					uploadFile.newFilePath=newFilePath;
					uploadFile.newFileUrl=newFileUrl;

					map.put(originalFilename, uploadFile);

					multipartFile.transferTo(imageFile);

				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return map;
	}

	/**
	 * 如果一个文件夹下面保存超过1000个文件，就会影响文件访问性能，所以上传的文件要分散存储, 这里用年月日作为目录层级 * 获取当前日期字符串
	 * * @param separator * @return "2017/2/20"
	 */
	private static String getNowDateStr() {
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		int month = now.get(Calendar.MONTH) + 1;
		int day = now.get(Calendar.DATE);
		return File.separator+year + File.separator + month + File.separator + day+File.separator;
	}

	/**
	 *  生成唯一的文件名
	 * @return
	 */
	private static String getUniqueFileName() {
		String str = UUID.randomUUID().toString();
		return str.replace("-", "");
	}

	public static class UploadFile {
		String originalFileName;	//原始文件名
		String newFileName;			//新文件名
		String newFilePath;			//新文件在服务器上的保存
		String newFileUrl;			//新文件的访问路径
		long size;					//文件大小
		String contentType;			//文件类型
		
		

		public String getNewFilePath() {
			return newFilePath;
		}

		public void setNewFilePath(String newFilePath) {
			this.newFilePath = newFilePath;
		}

		public String getNewFileUrl() {
			return newFileUrl;
		}

		public void setNewFileUrl(String newFileUrl) {
			this.newFileUrl = newFileUrl;
		}

		public String getOriginalFileName() {
			return originalFileName;
		}

		public void setOriginalFileName(String originalFileName) {
			this.originalFileName = originalFileName;
		}

		public String getNewFileName() {
			return newFileName;
		}

		public void setNewFileName(String newFileName) {
			this.newFileName = newFileName;
		}

		public long getSize() {
			return size;
		}

		public void setSize(long size) {
			this.size = size;
		}

		public String getContentType() {
			return contentType;
		}

		public void setContentType(String contentType) {
			this.contentType = contentType;
		}

	}
}
