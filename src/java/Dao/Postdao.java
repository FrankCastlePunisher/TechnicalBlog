/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Dao;

import entities.Category;
import entities.Post;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import entities.Comments;
//import java.security.Timestamp;
import java.sql.Timestamp;

public class Postdao {

    Connection con;

    public Postdao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getAllCategory() {
        ArrayList<Category> list = new ArrayList<>();

        try {
            String q = "select * from categories";
            Statement st = this.con.createStatement();
            ResultSet set = st.executeQuery(q);

            while (set.next()) {
                int cid = set.getInt("cid");
                String name = set.getString("name");
                String description = set.getString("description");

                Category c = new Category(cid, name, description);
                list.add(c);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean savePost(Post p) {
        boolean f = false;

        try {

            String q = "insert into posts(ptitle,pcontent,pcode,ppic,cid,userid) values(?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(q);
            pstmt.setString(1, p.getPtitle());
            pstmt.setString(2, p.getPcontent());
            pstmt.setString(3, p.getPcode());
            pstmt.setString(4, p.getPpic());
            pstmt.setInt(5, p.getCid());
            pstmt.setInt(6, p.getUserid());
            pstmt.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }
//    get allpost

    public List<Post> getAllposts() {
        List<Post> list = new ArrayList<>();
        //fetch all post
        try {

            PreparedStatement p = con.prepareStatement("select * from posts order by pid desc");
            ResultSet set = p.executeQuery();
            while (set.next()) {

                int pid = set.getInt("pid");
                String ptitle = set.getString("ptitle");
                String pcontent = set.getString("pcontent");
                String pcode = set.getString("pcode");
                String ppic = set.getString("ppic");
                Timestamp date = set.getTimestamp("pdate");
                int cid = set.getInt("cid");
                int userid = set.getInt("userid");
                Post post = new Post(pid, ptitle, pcontent, pcode, ppic, date, cid, userid);

                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Post> getPostbycid(int cid) {
        List<Post> list = new ArrayList<>();
        //fetch all post by id
        //fetch all post
        try {

            PreparedStatement p = con.prepareStatement("select * from posts where cid=?");
            p.setInt(1, cid);
            ResultSet set = p.executeQuery();
            while (set.next()) {

                int pid = set.getInt("pid");
                String ptitle = set.getString("ptitle");
                String pcontent = set.getString("pcontent");
                String pcode = set.getString("pcode");
                String ppic = set.getString("ppic");
                Timestamp date = set.getTimestamp("pdate");
                int userid = set.getInt("userid");
                Post post = new Post(pid, ptitle, pcontent, pcode, ppic, date, cid, userid);

                list.add(post);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Post getPostByPostid(int postid) {
        Post post = null;
        String q = "select * from posts where pid=?";
        try {
            PreparedStatement p = this.con.prepareStatement(q);
            p.setInt(1, postid);
            ResultSet set = p.executeQuery();
            if (set.next()) {
                int pid = set.getInt("pid");
                String ptitle = set.getString("ptitle");
                String pcontent = set.getString("pcontent");
                String pcode = set.getString("pcode");
                String ppic = set.getString("ppic");
                Timestamp date = set.getTimestamp("pdate");
                int userid = set.getInt("userid");
                int cid = set.getInt("cid");
                post = new Post(pid, ptitle, pcontent, pcode, ppic, date, cid, userid);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return post;
    }

    public ArrayList<Post> getRecentPosts(int limit) {
        ArrayList<Post> list = new ArrayList<>();
        try {
            String query = "SELECT * FROM posts ORDER BY pid DESC LIMIT ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, limit);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Post post = new Post(
                        rs.getInt("pid"),
                        rs.getString("ptitle"),
                        rs.getString("pcontent"),
                        rs.getString("pcode"),
                        rs.getString("ppic"),
                        rs.getTimestamp("pdate"),
                        rs.getInt("cid"),
                        rs.getInt("userid")
                );
                list.add(post);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean addComment(String msg, int pid, int uid) {
        boolean f = false;
        try {
            String q = "insert into comment(commentdesc, pid, uid) values(?,?,?)";
            PreparedStatement ps = con.prepareStatement(q);
            ps.setString(1, msg);
            ps.setInt(2, pid);
            ps.setInt(3, uid);
            ps.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public int countCommentOnPost(int pid) {
        int count = 0;
        try {
            String q = "select count(*) from comment where pid=?";
            PreparedStatement ps = con.prepareStatement(q);
            ps.setInt(1, pid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public ArrayList<Comments> fetchAllComments(int pid) {
        ArrayList<Comments> list = new ArrayList<>();
        try {
            String q = "select * from comment where pid=?";
            PreparedStatement ps = con.prepareStatement(q);
            ps.setInt(1, pid);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Comments c = new Comments(
                        rs.getInt("comid"),
                        rs.getString("commentdesc"),
                        rs.getInt("pid"),
                        rs.getInt("uid")
                );
                list.add(c);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

}
