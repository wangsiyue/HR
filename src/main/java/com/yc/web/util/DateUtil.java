package com.yc.web.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;



public class DateUtil {
	private static SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd"); 
	private static SimpleDateFormat tf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	private static SimpleDateFormat sf = new SimpleDateFormat("yyyy_MM_dd_hh_mm_ss");
	

	/**
	 * 检验传入的字符串是否为空
	 * @param s 被检验的字符串
	 * @return 如果字符串为空对象或空字符串，则返回true
	 */
	public static boolean isNullOrBlank(final String s) {
		if (s == null) {
			return true;
		}
		if (s.trim().equals("")) {
			return true;
		}
		return false;
	}
	
	/**
	 * 检验传入的数字是否为空
	 * @param s 传入的短整型数字
	 * @return 如果为空对象或值为-1则为真
	 */
	public static boolean isNullOrBlank(final Short s) {
		if (s == null || s.intValue() == -1) {
			return true;
		}
		return false;
	}
	
	/**
	 * 将字符串转换成日期类型
	 * @param date 传入的字符串
	 * @return 转换成的日期值
	 */
	public static Date parseDate(String date)
	{
		Date ret = null;
		if(date != null && date != "")
		{
			try {
				ret = df.parse(date);
			} catch (ParseException e) {
				ret = null;
			}
		}
		return ret;
	}
	
	/**
	 * 将日期类型转换成"yyyy-MM-dd"字符串
	 * @param date 传入的日期值
	 * @return 字符串类型的日期值
	 */
	public static String formatDate(Date date)
	{
		String ret = "";
		try {
			ret = df.format(date);
		}
		catch(Exception e)
		{
			ret = "";
		}
		return ret;
	}
	
	/**
	 * 将日期类型转换成"yyyy-MM-dd hh:mm:ss"字符串
	 * @param date
	 * @return
	 */
	public static String formatTime(Date date)
	{
		String ret = "";
		try {
			ret = tf.format(date);
		}
		catch(Exception e)
		{
			ret = "";
		}
		return ret;
	}
	
	/**
	 * 将日期类型转换成"yyyy_MM_dd_hh_mm_ss"字符串
	 * @param date
	 * @return
	 */
	public static String formatDateTime(Date date)
	{
		String ret = "";
		try {
			ret = sf.format(date);
		}
		catch(Exception e)
		{
			ret = "";
		}
		return ret;
	}
	
	/**
	 * 将类似"编号/名称"的字符串以"/"进行拆分
	 * @param idandname
	 * @return 字符串数组
	 */
	public static String[] splitIdAndName(String idandname)
	{
		String[] obj = idandname.split("/");
		return obj;
	}
	
	/**
	 * 将路径以"\\"符进行拆分
	 * @param path
	 * @return
	 */
	public static String[] splitPath(String path)
	{
		String[] obj = null;
		if(path != null && !path.equals(""))
			obj = path.split("\\\\");
		return obj;
	}
}
