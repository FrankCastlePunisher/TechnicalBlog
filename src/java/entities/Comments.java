/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entities;

public class Comments {

    private int comid;
    private String commentdesc;
    private int pid;
    private int uid;

    //constructor
    public Comments(int comid, String commentdesc, int pid, int uid) {
        this.comid = comid;
        this.commentdesc = commentdesc;
        this.pid = pid;
        this.uid = uid;
    }

    public Comments(String commentdesc, int pid, int uid) {
        this.commentdesc = commentdesc;
        this.pid = pid;
        this.uid = uid;
    }

    //getters and setters
    public int getComid() {
        return comid;
    }

    public void setComid(int comid) {
        this.comid = comid;
    }

    public String getCommentdesc() {
        return commentdesc;
    }

    public void setCommentdesc(String commentdesc) {
        this.commentdesc = commentdesc;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }
}
