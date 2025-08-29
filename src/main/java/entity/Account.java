/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author mac
 */
public class Account {
    private int id ; 
    private String username ; 
    private String password ;
    private int isSell;
    private int isAdmin ;

    public Account(int id, String username, String password, int isSell, int isAdmin) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.isSell = isSell;
        this.isAdmin = isAdmin;
    }

 

    public Account(String username, String password) {
        this.username = username;
        this.password = password;
    }

    

    public Account() {
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getIsSell() {
        return isSell;
    }

    public void setIsSell(int isSell) {
        this.isSell = isSell;
    }

    public int getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(int isAdmin) {
        this.isAdmin = isAdmin;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "Account{" + "id=" + id + ", username=" + username + ", password=" + password + ", isSell=" + isSell + ", isAdmin=" + isAdmin + '}';
    }

    
    
    
}

