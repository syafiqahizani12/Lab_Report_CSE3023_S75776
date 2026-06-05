/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import java.sql.*;
import java.util.*;
import com.Model.Car;

public class CarDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3307/carshop";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String INSERT
            = "INSERT INTO CarPricelist (Brand, Model, Cyclinder, Price) VALUES (?, ?, ?, ?)";

    private static final String SELECT_ALL
            = "SELECT * FROM CarPricelist";

    private static final String SELECT_BY_ID
            = "SELECT * FROM CarPricelist WHERE Car_id=?";

    private static final String UPDATE
            = "UPDATE CarPricelist SET Brand=?, Model=?, Cyclinder=?, Price=? WHERE Car_id=?";

    private static final String DELETE
            = "DELETE FROM CarPricelist WHERE Car_id=?";

    protected Connection getConnection() throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public List<Car> selectAll() throws Exception {
        List<Car> list = new ArrayList<>();
        Connection conn = getConnection();
        PreparedStatement ps = conn.prepareStatement(SELECT_ALL);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            list.add(new Car(
                    rs.getInt("Car_id"),
                    rs.getString("Brand"),
                    rs.getString("Model"),
                    rs.getInt("Cyclinder"),
                    rs.getDouble("Price")
            ));
        }
        return list;
    }

    public void insert(Car c) throws Exception {
        Connection conn = getConnection();
        PreparedStatement ps = conn.prepareStatement(INSERT);
        ps.setString(1, c.getBrand());
        ps.setString(2, c.getModel());
        ps.setInt(3, c.getCylinder());
        ps.setDouble(4, c.getPrice());
        ps.executeUpdate();
    }

    public void delete(int id) throws Exception {
        Connection conn = getConnection();
        PreparedStatement ps = conn.prepareStatement(DELETE);
        ps.setInt(1, id);
        ps.executeUpdate();
    }

    public Car selectById(int id) throws Exception {
        Connection conn = getConnection();
        PreparedStatement ps = conn.prepareStatement(SELECT_BY_ID);
        ps.setInt(1, id);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            return new Car(
                    rs.getInt("Car_id"),
                    rs.getString("Brand"),
                    rs.getString("Model"),
                    rs.getInt("Cyclinder"),
                    rs.getDouble("Price")
            );
        }
        return null;
    }

    public void update(Car c) throws Exception {
        Connection conn = getConnection();
        PreparedStatement ps = conn.prepareStatement(UPDATE);
        ps.setString(1, c.getBrand());
        ps.setString(2, c.getModel());
        ps.setInt(3, c.getCylinder());
        ps.setDouble(4, c.getPrice());
        ps.setInt(5, c.getCarId());
        ps.executeUpdate();
    }
}
