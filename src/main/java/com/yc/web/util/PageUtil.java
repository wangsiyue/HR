package com.yc.web.util;

public class PageUtil {
	private int pageNo=1;//当前页数
	private int pageSize=2;//每页显示的页数
	private int totalSize;//总条数
	private int totalPages;//总页数
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getPageSize() {
		return pageSize;
	}
	//设置每页显示的行数
	public void setPageSize(int pageSize) {
		if(pageSize<=2){
			this.pageSize=3;
		}else{
			this.pageSize = pageSize;
		}
	}
	//首页
	public void getfirstPage(){
		pageNo=1;
	}
	//末页
	public void getLastPage(){
		pageNo=totalPages;
	}
	//上一页
	public int getProPageNo(){
		int proPageNo=1;
		if(this.pageNo>1){
			proPageNo=pageNo-1;
		}else{
			proPageNo=1;
		}
		return proPageNo;
	}
	//下一页
	public int getNextPageNo(){
		int nextPageNo=1;
		if(this.pageNo<this.getTotalPages()){
			nextPageNo=pageNo+1;
		}else{
			nextPageNo=this.getTotalPages();
		}
		return nextPageNo;
	}
	//获取总页数
	public int getTotalSize() {
		return totalSize;
	}
	public void setTotalSize(int totalSize) {
		this.totalSize = totalSize;
	}
	public int getTotalPages() {
		return this.totalSize%this.pageSize==0 ? this.totalSize/this.pageSize:this.totalSize/this.pageSize+1;
	}
}
