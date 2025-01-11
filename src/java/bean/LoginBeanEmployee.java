/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

import java.io.Serializable;

public class LoginBeanEmployee implements Serializable {
    private String email;  // Renamed from 'username' to 'email' for clarity
    private String password;
    private String role;   // This stores the user's role (e.g., Admin, Nurse)
    private int employeeId;
    
    public LoginBeanEmployee() {
    }

    public LoginBeanEmployee(String email, String password, String role) {
        this.email = email;
        this.password = password;
        this.role = role;
    }

    

    // Getter and Setter for email
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    // Getter and Setter for password
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    // Getter and Setter for role
    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

     // Getter and Setter for employeeId (nurseId)
    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }
}
