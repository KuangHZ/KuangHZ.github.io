package com.offcn.bean;

public class Categroymovietable {
    private Integer numid;

    private String categroy;

    private String url;

    private String title;

    private String source;

    public Integer getNumid() {
        return numid;
    }

    public void setNumid(Integer numid) {
        this.numid = numid;
    }

    public String getCategroy() {
        return categroy;
    }

    public void setCategroy(String categroy) {
        this.categroy = categroy;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    @Override
    public String toString() {
        return "Categroymovietable{" +
                "numid=" + numid +
                ", categroy='" + categroy + '\'' +
                ", url='" + url + '\'' +
                ", title='" + title + '\'' +
                ", source='" + source + '\'' +
                '}';
    }
}