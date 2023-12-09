package model;

public class Supplier {
    private int id;
    private String nameSup;
    private String phoneNumber;
    private String email;
    private int idCate;
    private String address;

    public Supplier( String nameSup, String phoneNumber, String email, int idCate, String address) {

        this.nameSup = nameSup;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.idCate = idCate;
        this.address = address;
    }


    public Supplier(int id, String nameSup, String phoneNumber, String email, int idCate, String address) {
        this.id = id;
        this.nameSup = nameSup;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.idCate = idCate;
        this.address = address;
    }

    public String getNameSup() {
        return nameSup;
    }

    public void setNameSup(String nameSup) {
        this.nameSup = nameSup;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getIdCate() {
        return idCate;
    }

    public void setIdCate(int idCate) {
        this.idCate = idCate;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
