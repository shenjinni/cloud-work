package cn.testin.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

/**
 * properties文件读取
 * 
 * @author guwei
 * @time 2018-01-23
 */
public class PropertiesUtil {

	private static String path = null;

	private static final String fileName = "app.properties";
	/**
	 * 初始化绝对路径下的properties文件
	 */
	static {
		// String userdir = System.getProperty("user.dir");
		String userdir = Thread.currentThread().getContextClassLoader().getResource("").getPath();
		path = userdir + File.separator + fileName;
	}

	/**
	 * 依据Key获取properties文件中对应的value
	 * 
	 * @param propertyKey
	 * @return
	 * @throws IOException
	 */
	public static String getProperty(String propertyKey) throws IOException {
		Properties pr = null;
		FileInputStream input = null;
		try {
			input = new FileInputStream(path);
			pr = new Properties();
			pr.load(input);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			input.close();
		}
		return pr.getProperty(propertyKey) == null || "".equals(pr.getProperty(propertyKey)) ? ""
				: pr.getProperty(propertyKey);
	}
}
