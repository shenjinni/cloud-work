package cn.testin.util;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;

public class RequestUtil
{

    @SuppressWarnings("unchecked")
	public static void setHttpServletRequest(HttpServletRequest request)
    {
        reqLocal.set(request);
    }

    public static void clearHttpReqResponse()
    {
        reqLocal.remove();
        responseLocal.remove();
    }

    @SuppressWarnings("unchecked")
	public static void setHttpServletResponse(HttpServletResponse response)
    {
        responseLocal.set(response);
    }

    public static HttpServletRequest getHttpServletRequest()
    {
        return (HttpServletRequest)reqLocal.get();
    }

    public static HttpServletResponse getHttpServletResponse()
    {
        return (HttpServletResponse)responseLocal.get();
    }

    private RequestUtil()
    {
    }

    public static String getString(HttpServletRequest request, String key, String defaultValue)
    {
        String value = request.getParameter(key);
        if(StringUtil.isEmpty(value))
            return defaultValue;
        else
            return value.replace("'", "''").trim();
    }

    public static String getString(HttpServletRequest request, String key)
    {
        return getString(request, key, "");
    }

    public static String getSecureString(HttpServletRequest request, String key, String defaultValue)
    {
        String value = request.getParameter(key);
        if(StringUtil.isEmpty(value))
            return defaultValue;
        else
            return filterInject(value);
    }

    public static String getSecureString(HttpServletRequest request, String key)
    {
        return getSecureString(request, key, "");
    }

    public static String filterInject(String str)
    {
        String injectstr = "\\|exec|insert|select|delete|update|chr|truncate|char|<script";
        Pattern regex = Pattern.compile(injectstr, 226);
        Matcher matcher = regex.matcher(str);
        str = matcher.replaceAll("");
        str = str.replace("'", "''");
        return str;
    }

    public static String getLowercaseString(HttpServletRequest request, String key)
    {
        return getString(request, key).toLowerCase();
    }

    public static int getInt(HttpServletRequest request, String key)
    {
        return getInt(request, key, 0);
    }

    public static int getInt(HttpServletRequest request, String key, int defaultValue)
    {
        String str = request.getParameter(key);
        if(StringUtil.isEmpty(str))
            return defaultValue;
        else
            return Integer.parseInt(str);
    }

    public static long getLong(HttpServletRequest request, String key)
    {
        return getLong(request, key, 0L);
    }

    public static Long[] getLongAry(HttpServletRequest request, String key)
    {
        String aryKey[] = request.getParameterValues(key);
        if(aryKey == null || aryKey.length == 0)
            return null;
        Long aryLong[] = new Long[aryKey.length];
        for(int i = 0; i < aryKey.length; i++)
            aryLong[i] = Long.valueOf(Long.parseLong(aryKey[i]));

        return aryLong;
    }

    public static String[] getStringAry(HttpServletRequest request, String key)
    {
        return request.getParameterValues(key);
    }

    public static Long[] getLongAryByStr(HttpServletRequest request, String key)
    {
        String sysUserId = request.getParameter(key);
        String aryId[] = sysUserId.split(",");
        Long lAryId[] = new Long[aryId.length];
        for(int i = 0; i < aryId.length; i++)
            lAryId[i] = Long.valueOf(Long.parseLong(aryId[i]));

        return lAryId;
    }

    public static String[] getStringAryByStr(HttpServletRequest request, String key)
    {
        String sysUserId = request.getParameter(key);
        String aryId[] = sysUserId.split(",");
        String lAryId[] = new String[aryId.length];
        for(int i = 0; i < aryId.length; i++)
            lAryId[i] = aryId[i];

        return lAryId;
    }

    public static Integer[] getIntAry(HttpServletRequest request, String key)
    {
        String aryKey[] = request.getParameterValues(key);
        Integer aryInt[] = new Integer[aryKey.length];
        for(int i = 0; i < aryKey.length; i++)
            aryInt[i] = Integer.valueOf(Integer.parseInt(aryKey[i]));

        return aryInt;
    }

    public static Float[] getFloatAry(HttpServletRequest request, String key)
    {
        String aryKey[] = request.getParameterValues(key);
        Float fAryId[] = new Float[aryKey.length];
        for(int i = 0; i < aryKey.length; i++)
            fAryId[i] = Float.valueOf(Float.parseFloat(aryKey[i]));

        return fAryId;
    }

    public static long getLong(HttpServletRequest request, String key, long defaultValue)
    {
        String str = request.getParameter(key);
        if(StringUtil.isEmpty(str))
            return defaultValue;
        else
            return Long.parseLong(str);
    }

    public static float getFloat(HttpServletRequest request, String key)
    {
        return getFloat(request, key, 0.0F);
    }

    public static float getFloat(HttpServletRequest request, String key, float defaultValue)
    {
        String str = request.getParameter(key);
        if(StringUtil.isEmpty(str))
            return defaultValue;
        else
            return Float.parseFloat(request.getParameter(key));
    }

    public static boolean getBoolean(HttpServletRequest request, String key)
    {
        return getBoolean(request, key, false);
    }

    public static boolean getBoolean(HttpServletRequest request, String key, boolean defaultValue)
    {
        String str = request.getParameter(key);
        if(StringUtil.isEmpty(str))
            return defaultValue;
        if(StringUtils.isNumeric(str))
            return Integer.parseInt(str) == 1;
        else
            return Boolean.parseBoolean(str);
    }

    public static Short getShort(HttpServletRequest request, String key)
    {
        return getShort(request, key, Short.valueOf((short)0));
    }

    public static Short getShort(HttpServletRequest request, String key, Short defaultValue)
    {
        String str = request.getParameter(key);
        if(StringUtil.isEmpty(str))
            return defaultValue;
        else
            return Short.valueOf(Short.parseShort(str));
    }

    

    public static String getUrl(HttpServletRequest request)
    {
        StringBuffer urlThisPage = new StringBuffer();
        urlThisPage.append(request.getRequestURI());
        @SuppressWarnings("rawtypes")
		Enumeration e = request.getParameterNames();
        String para = "";
        String values = "";
        urlThisPage.append("?");
        for(; e.hasMoreElements(); urlThisPage.append("&"))
        {
            para = (String)e.nextElement();
            values = request.getParameter(para);
            urlThisPage.append(para);
            urlThisPage.append("=");
            urlThisPage.append(values);
        }

        return urlThisPage.substring(0, urlThisPage.length() - 1);
    }

    public static String getPrePage(HttpServletRequest request)
    {
        return request.getHeader("Referer");
    }

   
    @SuppressWarnings({ "rawtypes", "unchecked" })
	public static Map getParameterValueMap(HttpServletRequest request, boolean remainArray, boolean isSecure)
    {
        Map map = new HashMap();
        for(Enumeration params = request.getParameterNames(); params.hasMoreElements();)
        {
            String key = params.nextElement().toString();
            String values[] = request.getParameterValues(key);
            if(values != null)
                if(values.length == 1)
                {
                    String tmpValue = values[0];
                    if(tmpValue != null)
                    {
                        tmpValue = tmpValue.trim();
                        if(!tmpValue.equals(""))
                        {
                            if(isSecure)
                                tmpValue = filterInject(tmpValue);
                            if(!tmpValue.equals(""))
                                map.put(key, tmpValue);
                        }
                    }
                } else
                {
                    String rtn = getByAry(values, isSecure);
                    if(rtn.length() > 0)
                        if(remainArray)
                            map.put(key, rtn.split(","));
                        else
                            map.put(key, rtn);
                }
        }

        return map;
    }

    private static String getByAry(String aryTmp[], boolean isSecure)
    {
        String rtn = "";
        for(int i = 0; i < aryTmp.length; i++)
        {
            String str = aryTmp[i].trim();
            if(!str.equals(""))
                if(isSecure)
                {
                    str = filterInject(str);
                    if(!str.equals(""))
                        rtn = (new StringBuilder(String.valueOf(rtn))).append(str).append(",").toString();
                } else
                {
                    rtn = (new StringBuilder(String.valueOf(rtn))).append(str).append(",").toString();
                }
        }

        if(rtn.length() > 0)
            rtn = rtn.substring(0, rtn.length() - 1);
        return rtn;
    }

    public static String getStringValues(HttpServletRequest request, String paramName)
    {
        String values[] = request.getParameterValues(paramName);
        if(values == null || values.length == 0)
            return "";
        String tmp = "";
        for(int i = 0; i < values.length; i++)
            if(i == 0)
                tmp = (new StringBuilder(String.valueOf(tmp))).append(values[i]).toString();
            else
                tmp = (new StringBuilder(String.valueOf(tmp))).append(",").append(values[i]).toString();

        return tmp;
    }

    public static Locale getLocal(HttpServletRequest request)
    {
        Locale local = request.getLocale();
        if(local == null)
            local = Locale.CHINA;
        return local;
    }

    public static final String getErrorUrl(HttpServletRequest request)
    {
        String errorUrl = (String)request.getAttribute("javax.servlet.error.request_uri");
        if(errorUrl == null)
            errorUrl = (String)request.getAttribute("javax.servlet.forward.request_uri");
        if(errorUrl == null)
            errorUrl = (String)request.getAttribute("javax.servlet.include.request_uri");
        if(errorUrl == null)
            errorUrl = request.getRequestURL().toString();
        return errorUrl;
    }

   

    @SuppressWarnings("rawtypes")
	private static ThreadLocal reqLocal = new ThreadLocal();
    @SuppressWarnings("rawtypes")
	private static ThreadLocal responseLocal = new ThreadLocal();

}

