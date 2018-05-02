package cn.testin.bean;


import cn.testin.basic.BasicPage;

import java.util.Date;

public class Article extends BasicPage {
    private Long articleId;

    private String articleTitle;
    
    private String articleSource;

    private String articleType;

    private String articleImage;

    private String articleBrief;

    private String articleSort;

    private String articleUrl;

    private String articleCode;

    private String exhibitionDate;

    private Date createTime;

    private String articleContent;

    public Long getArticleId() {
        return articleId;
    }

    public void setArticleId(Long articleId) {
        this.articleId = articleId;
    }

    public String getArticleTitle() {
        return articleTitle;
    }

    public String getArticleSource() {
		return articleSource;
	}

	public void setArticleSource(String articleSource) {
		this.articleSource = articleSource;
	}

	public void setArticleTitle(String articleTitle) {
        this.articleTitle = articleTitle == null ? null : articleTitle.trim();
    }

    public String getArticleType() {
        return articleType;
    }

    public void setArticleType(String articleType) {
        this.articleType = articleType == null ? null : articleType.trim();
    }

    public String getArticleImage() {
        return articleImage;
    }

    public void setArticleImage(String articleImage) {
        this.articleImage = articleImage == null ? null : articleImage.trim();
    }

    public String getArticleBrief() {
        return articleBrief;
    }

    public void setArticleBrief(String articleBrief) {
        this.articleBrief = articleBrief == null ? null : articleBrief.trim();
    }

    public String getArticleSort() {
        return articleSort;
    }

    public void setArticleSort(String articleSort) {
        this.articleSort = articleSort == null ? null : articleSort.trim();
    }

    public String getArticleUrl() {
        return articleUrl;
    }

    public void setArticleUrl(String articleUrl) {
        this.articleUrl = articleUrl == null ? null : articleUrl.trim();
    }

    public String getArticleCode() {
        return articleCode;
    }

    public void setArticleCode(String articleCode) {
        this.articleCode = articleCode == null ? null : articleCode.trim();
    }

    public String getExhibitionDate() {
        return exhibitionDate;
    }

    public void setExhibitionDate(String exhibitionDate) {
        this.exhibitionDate = exhibitionDate == null ? null : exhibitionDate.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getArticleContent() {
        return articleContent;
    }

    public void setArticleContent(String articleContent) {
        this.articleContent = articleContent == null ? null : articleContent.trim();
    }
}