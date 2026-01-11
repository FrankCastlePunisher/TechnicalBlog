package Dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import entities.Product;

public class Cartdao {

    private Connection con;

    public Cartdao(Connection con) {
        this.con = con;
    }

    // Add item to cart
    public boolean addToCart(int uid, int pid) {
        boolean f = false;
        try {
            String q = "INSERT INTO cart(uid, pid) VALUES(?, ?)";
            PreparedStatement pst = con.prepareStatement(q);
            pst.setInt(1, uid);
            pst.setInt(2, pid);
            int rows = pst.executeUpdate();
            if (rows > 0) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    // Remove item from cart
    public boolean removeFromCart(int uid, int pid) {
        boolean f = false;
        try {
            String q = "DELETE FROM cart WHERE uid=? AND pid=?";
            PreparedStatement pst = con.prepareStatement(q);
            pst.setInt(1, uid);
            pst.setInt(2, pid);
            int rows = pst.executeUpdate();
            if (rows > 0) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    // Get all items for a user
    public List<Product> getCartItems(int uid) {
        List<Product> list = new ArrayList<>();
        try {
            String q = "SELECT p.* FROM product p INNER JOIN cart c ON p.pid=c.pid WHERE c.uid=?";
            PreparedStatement pst = con.prepareStatement(q);
            pst.setInt(1, uid);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                list.add(new Product(
                        rs.getInt("pid"),
                        rs.getString("pname"),
                        rs.getString("pdesc"),
                        rs.getInt("pprice"),
                        rs.getString("ppic")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void clearCart(int uid) {
        try {
            String q = "DELETE FROM cart WHERE uid=?";
            PreparedStatement pst = con.prepareStatement(q);
            pst.setInt(1, uid);
            pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
