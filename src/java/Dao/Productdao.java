package Dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import entities.Product;

public class Productdao {

    private Connection con;

    public Productdao(Connection con) {
        this.con = con;
    }

    public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();
        try {
            String q = "SELECT * FROM product";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(q);
            while (rs.next()) {
                int pid = rs.getInt("pid");
                String pname = rs.getString("pname");
                String pdesc = rs.getString("pdesc");
                int pprice = rs.getInt("pprice");
                String ppic = rs.getString("ppic");

                Product p = new Product(pid, pname, pdesc, pprice, ppic);
                list.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Product getProductById(int pid) {
        Product p = null;
        try {
            String q = "SELECT * FROM product WHERE pid=?";
            PreparedStatement pst = con.prepareStatement(q);
            pst.setInt(1, pid);
            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                int id = rs.getInt("pid");
                String name = rs.getString("pname");
                String desc = rs.getString("pdesc");
                int price = rs.getInt("pprice");
                String pic = rs.getString("ppic");
                p = new Product(id, name, desc, price, pic);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;
    }

}
