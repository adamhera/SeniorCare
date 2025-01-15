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
    private String nursePackage;  // Added field for the package the nurse is enrolled in

    public NurseInfo() {
    }

    public NurseInfo(String empEmail, String nurseCertification, String nurseShift, int empID, String nursePackage) {
        this.empEmail = empEmail;
        this.nurseCertification = nurseCertification;
        this.nurseShift = nurseShift;
        this.empID = empID;
        this.nursePackage = nursePackage; // Initialize package
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

    public String getNursePackage() {
        return nursePackage;  // Getter for the nurse's selected package
    }

    public void setNursePackage(String nursePackage) {
        this.nursePackage = nursePackage;  // Setter for the nurse's selected package
    }
}
