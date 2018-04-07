package cn.testin.utils;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;
import org.springframework.util.PropertyPlaceholderHelper;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Properties;

/**
 * @Description: 自定义装载配置文件类,可以使用若干变量来声明一个配置的key
 * @author Medivh
 * @date 2016年7月9日 下午6:03:15
 	examples:
	 
	project=file-cloud
	env=prod
	author = https://www.github.com/devpage
	support-part=spring-framework.properties
	
	protocol =https
	site=www.github.com
	author = devpage
	site.author=${site}/${author}
	domain=${protocol}://${site.author}
	blog=${domain}/blog
	url=issue
	blog.url=${blog}/${url}
	
	wellcome=${blog.url}
	${protocol}://${site}/${author}=491835898@qq.com

 */
public class ApplicationPropertyConfigurer extends PropertyPlaceholderConfigurer{
	
	//默认配置的前缀
	private String defaultPropertyPrefix = "default_";
	//应用默认配置
	private static Map<String,String> defaultConfigs = new HashMap<String, String>();
	
	@Override
	protected void processProperties(ConfigurableListableBeanFactory beanFactoryToProcess, Properties props) throws BeansException {
		PropertyPlaceholderHelper helper = new PropertyPlaceholderHelper(
				DEFAULT_PLACEHOLDER_PREFIX, 
				DEFAULT_PLACEHOLDER_SUFFIX,
				DEFAULT_VALUE_SEPARATOR, false);
		for (Entry<Object, Object> entry : props.entrySet()) {
			String stringKey = String.valueOf(entry.getKey());
			String stringValue = String.valueOf(entry.getValue());
			if((stringKey.contains(DEFAULT_PLACEHOLDER_PREFIX)&&stringKey.contains(DEFAULT_PLACEHOLDER_SUFFIX)&&(stringKey.indexOf(DEFAULT_PLACEHOLDER_PREFIX)<stringKey.indexOf(DEFAULT_PLACEHOLDER_SUFFIX)))){
				stringKey = getReplacedStringKey(stringKey,helper,props);
			}
			stringValue = helper.replacePlaceholders(stringValue, props);
			//
			if(stringKey.startsWith(this.defaultPropertyPrefix)){
				ApplicationPropertyConfigurer.defaultConfigs.put(stringKey, stringValue);
			}
		}
		super.processProperties(beanFactoryToProcess, props);
	}
	
	public String getReplacedStringKey(String stringKey,PropertyPlaceholderHelper helper,Properties props){
		if(stringKey.contains(DEFAULT_PLACEHOLDER_PREFIX)&&stringKey.contains(DEFAULT_PLACEHOLDER_SUFFIX)&&(stringKey.indexOf(DEFAULT_PLACEHOLDER_PREFIX)<stringKey.indexOf(DEFAULT_PLACEHOLDER_SUFFIX))){
			//before of target
			String prefix = stringKey.substring(0,stringKey.indexOf(DEFAULT_PLACEHOLDER_PREFIX));
			//replace
			String refString = stringKey.substring(stringKey.indexOf(DEFAULT_PLACEHOLDER_PREFIX), stringKey.indexOf(DEFAULT_PLACEHOLDER_SUFFIX)+1);
			//after of target
			String suffix = stringKey.substring(stringKey.indexOf(DEFAULT_PLACEHOLDER_SUFFIX)+1);
			//get target from props data
			String refStringValue = helper.replacePlaceholders(refString, props);
			//build a new local key
			String newKey = prefix+refStringValue+suffix;
			//while until the key not contains of ${}
			return getReplacedStringKey(newKey,helper,props);
		}
		return stringKey;
	}
	
	public void setDefaultPropertyPrefix(String defaultPropertyPrefix) {
		this.defaultPropertyPrefix = defaultPropertyPrefix;
	}

	public static Map<String, String> getDefaultConfigure(){
		return Collections.unmodifiableMap(ApplicationPropertyConfigurer.defaultConfigs);
	}
	
}
