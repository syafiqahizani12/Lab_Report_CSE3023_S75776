package com.lab.dao;

import com.lab.model.Product;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class productDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3307/cse3023";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String INSERT_SQL
            = "INSERT INTO products (name, category, price, quantity) VALUES (?, ?, ?, ?)";

    private static final String SELECT_ALL
            = "SELECT * FROM products";

    private static final String SELECT_BY_ID
            = "SELECT * FROM products WHERE id=?";

    private static final String UPDATE_SQL
            = "UPDATE products SET name=?, category=?, price=?, quantity=? WHERE id=?";

    private static final String DELETE_SQL
            = "DELETE FROM products WHERE id=?";

    // connection
    protected Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }

    // INSERT
    public void insertProduct(Product p) {
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(INSERT_SQL)) {

            ps.setString(1, p.getName());
            ps.setString(2, p.getCategory());
            ps.setDouble(3, p.getPrice());
            ps.setInt(4, p.getQuantity());
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // SELECT ALL
    public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();

        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(SELECT_ALL); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                list.add(new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("category"),
                        rs.getDouble("price"),
                        rs.getInt("quantity")
                ));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // SELECT BY ID
    public Product getProduct(int id) {
        Product p = null;

        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(SELECT_BY_ID)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                p = new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("category"),
                        rs.getDouble("price"),
                        rs.getInt("quantity")
                );
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;
    }

    // UPDATE
    public void updateProduct(Product p) {
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(UPDATE_SQL)) {

            ps.setString(1, p.getName());
            ps.setString(2, p.getCategory());
            ps.setDouble(3, p.getPrice());
            ps.setInt(4, p.getQuantity());
            ps.setInt(5, p.getId());

            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // DELETE
    public void deleteProduct(int id) {
        try (Connection conn = getConnection(); PreparedStatement ps = conn.prepareStatement(DELETE_SQL)) {

            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
