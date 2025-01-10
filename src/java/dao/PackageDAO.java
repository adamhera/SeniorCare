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
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import util.DBConnection;

public class PackageDAO {
    public Package getPackageById(int packageId) throws Exception {
        Package pkg = null;

        // Use DBConnection utility to get the connection
        try (Connection conn = DBConnection.createConnection()) {
            String query = "SELECT * FROM Package WHERE Package_ID = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, packageId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                pkg = new Package(
                    rs.getInt("Package_ID"),
                    rs.getString("Package_Name"),
                    rs.getString("Package_Description"),
                    rs.getDouble("Package_Price")
                );
            }

            rs.close();
            stmt.close();
        }

        return pkg;
    }

    public boolean updatePackage(Package pkg) throws Exception {
        // Use DBConnection utility to get the connection
        try (Connection conn = DBConnection.createConnection()) {
            String query = "UPDATE Package SET Package_Name = ?, Package_Description = ?, Package_Price = ? WHERE Package_ID = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, pkg.getName());
            stmt.setString(2, pkg.getDescription());
            stmt.setDouble(3, pkg.getPrice());
            stmt.setInt(4, pkg.getId());

            int rowsUpdated = stmt.executeUpdate();
            stmt.close();
            return rowsUpdated > 0;
        }
    }
}
