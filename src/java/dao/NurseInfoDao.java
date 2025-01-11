/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

/**
 *
 * @author adamh
 */

import com.seniorcare.model.NurseInfo;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import util.DBConnection;

public class NurseInfoDao {

public NurseInfo getNurseInfoById(Integer empId) {
    NurseInfo nurseInfo = null;
    String query = "SELECT * FROM NURSE WHERE EMP_ID = ?";

    try (Connection con = DBConnection.createConnection();
         PreparedStatement ps = con.prepareStatement(query)) {

        ps.setInt(1, empId); // Set emp_id parameter in the query
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            nurseInfo = new NurseInfo();
            nurseInfo.setEmpId(rs.getInt("EMP_ID"));
            nurseInfo.setNurseCertification(rs.getString("NURSE_CERTIFICATION"));
            nurseInfo.setNurseShift(rs.getString("NURSE_SHIFT"));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return nurseInfo;
}


public boolean updateNurseInfo(NurseInfo updatedNurseInfo) {
    String query = "UPDATE NURSE SET NURSE_CERTIFICATION = ?, NURSE_SHIFT = ? WHERE EMP_ID = ?";

    try (Connection con = DBConnection.createConnection();
         PreparedStatement ps = con.prepareStatement(query)) {

        ps.setString(1, updatedNurseInfo.getNurseCertification());
        ps.setString(2, updatedNurseInfo.getNurseShift());
        ps.setInt(3, updatedNurseInfo.getEmpId()); // Use emp_id to update

        int rowsUpdated = ps.executeUpdate();
        return rowsUpdated > 0;
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return false;
}




   

  

    
}