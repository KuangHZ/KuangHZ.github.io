package com.offcn.bean;

public class CategroyTop {
    private String title;
    private Integer num;
    private Float scoreavg;
    private Float persent;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Float getScoreavg() {
        return scoreavg;
    }

    public void setScoreavg(Float scoreavg) {
        this.scoreavg = scoreavg;
    }

    public Float getPersent() {
        return persent;
    }

    public void setPersent(Float persent) {
        this.persent = persent;
    }

    @Override
    public String toString() {
        return "CategroyTop{" +
                "title='" + title + '\'' +
                ", num=" + num +
                ", scoreavg=" + scoreavg +
                ", persent=" + persent +
                '}';
    }
}
