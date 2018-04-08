package cn.testin.util;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.NoSuchBeanDefinitionException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

public class ApplicationContextUtil implements ApplicationContextAware {

	private static ApplicationContext context;
	
	@Override
	public void setApplicationContext(ApplicationContext content) throws BeansException {
		ApplicationContextUtil.context = content;
	}

	public static ApplicationContext getContext(){
		return context;
	}

	public static Object getBean(String name) throws BeansException {
        return context.getBean(name);
    }
 
    public static Object getBean(String name, Class requiredType)
            throws BeansException {
        return context.getBean(name, requiredType);
    }
 
    public static boolean containsBean(String name) {
        return context.containsBean(name);
    }
 
    public static boolean isSingleton(String name) throws NoSuchBeanDefinitionException {
        return context.isSingleton(name);
    }
 
    public static Class getType(String name) throws NoSuchBeanDefinitionException {
        return context.getType(name);
    }
 
    public static String[] getAliases(String name) throws NoSuchBeanDefinitionException {
        return context.getAliases(name);
    }
}
