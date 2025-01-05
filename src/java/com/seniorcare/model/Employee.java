/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.seniorcare.model;

/**
 *
 * @author adamh
 */


public class Employee {
    private int empID;
    private String empName;
    private String empEmail;
    private String empRole;
    private String empGender;

    // Default constructor
    public Employee() {
    }

    // Parameterized constructor
    public Employee(int empID, String empName, String empEmail, String empRole, String empGender) {
        this.empID = empID;
        this.empName = empName;
        this.empEmail = empEmail;
        this.empRole = empRole;
        this.empGender = empGender;
    }

    // Getters and Setters
    public int getEmpID() {
        return empID;
    }

    public void setEmpID(int empID) {
        this.empID = empID;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName;
    }

    public String getEmpEmail() {
        return empEmail;
    }

    public void setEmpEmail(String empEmail) {
        this.empEmail = empEmail;
    }

    public String getEmpRole() {
        return empRole;
    }

    public void setEmpRole(String empRole) {
        this.empRole = empRole;
    }

    public String getEmpGender() {
        return empGender;
    }

    public void setEmpGender(String empGender) {
        this.empGender = empGender;
    }

    // Optional: toString() method for debugging
    @Override
    public String toString() {
        return "Employee{" +
                "empID=" + empID +
                ", empName='" + empName + '\'' +
                ", empEmail='" + empEmail + '\'' +
                ", empRole='" + empRole + '\'' +
                ", empGender='" + empGender + '\'' +
                '}';
    }
}

