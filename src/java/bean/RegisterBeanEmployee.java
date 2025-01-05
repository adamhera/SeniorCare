/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author adamh
 */
public class RegisterBeanEmployee {
    private String name;
    private String email;
    private String role;
    private String status;
    private String gender;
    private String password;

    public RegisterBeanEmployee() {
    }

    public RegisterBeanEmployee(String name, String email, String role, String status, String gender, String password) {
        this.name = name;
        this.email = email;
        this.role = role;
        this.status = status;
        this.gender = gender;
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {
        return email;
    }

    public String getRole() {
        return role;
    }

    public String getStatus() {
        return status;
    }

    public String getGender() {
        return gender;
    }

    public String getPassword() {
        return password;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    
}
