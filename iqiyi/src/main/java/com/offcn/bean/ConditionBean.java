package com.offcn.bean;

import com.offcn.util.PageRequest;

public class ConditionBean extends PageRequest {
    //保存分类地区
    private String area;
    //保存分类类型
    private String type;
    //保存电影名称
    private String mname;
    //搜索关键字
    private String keyword;

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname;
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    @Override
    public String toString() {
        return "ConditionBean{" +
                "area='" + area + '\'' +
                ", type='" + type + '\'' +
                ", mname='" + mname + '\'' +
                ", keyword='" + keyword + '\'' +
                '}';
    }
}
