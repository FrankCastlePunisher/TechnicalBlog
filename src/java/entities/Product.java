package entities;

public class Product {
    private int pid;
    private String pname;
    private String pdesc;
    private int pprice;
    private String ppic;

    public Product(int pid, String pname, String pdesc, int pprice, String ppic) {
        this.pid = pid;
        this.pname = pname;
        this.pdesc = pdesc;
        this.pprice = pprice;
        this.ppic = ppic;
    }

    public Product(String pname, String pdesc, int pprice, String ppic) {
        this.pname = pname;
        this.pdesc = pdesc;
        this.pprice = pprice;
        this.ppic = ppic;
    }

    public Product() {
    }

    // Getters
    public int getPid() { return pid; }
    public String getPname() { return pname; }
    public String getPdesc() { return pdesc; }
    public int getPprice() { return pprice; }
    public String getPpic() { return ppic; }

    // Setters
    public void setPid(int pid) { this.pid = pid; }
    public void setPname(String pname) { this.pname = pname; }
    public void setPdesc(String pdesc) { this.pdesc = pdesc; }
    public void setPprice(int pprice) { this.pprice = pprice; }
    public void setPpic(String ppic) { this.ppic = ppic; }
}
