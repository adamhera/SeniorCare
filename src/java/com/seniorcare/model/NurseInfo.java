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
public class NurseInfo {
    private String empEmail;
    private String nurseCertification;
    private String nurseShift;
     private int empID;
    // Default constructor (no arguments)
    public NurseInfo() {
    }

    // Parameterized constructor
    public NurseInfo(String empEmail, String nurseCertification, String nurseShift, int empID) {
        this.empEmail = empEmail;
        this.nurseCertification = nurseCertification;
        this.nurseShift = nurseShift;
        this.empID = empID;
    }

    public NurseInfo(String nurseCertification, String nurseShift) {
        
    }

    // Getters and setters
    public String getEmpEmail() {
        return empEmail;
    }

    public void setEmpEmail(String empEmail) {
        this.empEmail = empEmail;
    }

    public String getNurseCertification() {
        return nurseCertification;
    }

    public void setNurseCertification(String nurseCertification) {
        this.nurseCertification = nurseCertification;
    }

    public String getNurseShift() {
        return nurseShift;
    }

    public void setNurseShift(String nurseShift) {
        this.nurseShift = nurseShift;
    }

    public int getEmpId() {
        return empID;
    }

    public void setEmpId(int empID) {
        this.empID = empID;
    }

    
}
