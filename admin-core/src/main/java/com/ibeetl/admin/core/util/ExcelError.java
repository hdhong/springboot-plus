package com.ibeetl.admin.core.util;

public class ExcelError {
    Integer row;
    Integer col;
    String cel;
    String msg;
    public Integer getRow() {
        return row;
    }
    public void setRow(Integer row) {
        this.row = row;
    }
    public Integer getCol() {
        return col;
    }
    public void setCol(Integer col) {
        this.col = col;
    }
    public String getCel() {
        return cel;
    }
    public void setCel(String cel) {
        this.cel = cel;
    }
    public String getMsg() {
        return msg;
    }
    public void setMsg(String msg) {
        this.msg = msg;
    }
    @Override
    public String toString() {
        return "ExcelError [row=" + row + ", col=" + col + ", cel=" + cel + ", msg=" + msg + "]";
    }
    
    
}
