/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

/**
 *
 * @author MP2-4
 */
import bean.SessionBean;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.ArrayList;

public class SessionDAO {

    //connection method
    private Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/drivesmart_db",
                "root", "");
    }

    //insert method

    public boolean bookSession(SessionBean session) {

        boolean result = false;
        try (Connection conn = getConnection()) {
            String sql = "INSERT INTO training_sessions (student_name, branch_location,lesson_type,status) VALUES (?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, session.getStudent_name());
            ps.setString(2, session.getBranch_location());
            ps.setString(3, session.getLesson_type());
            ps.setString(4, session.getStatus());
            return ps.execute();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    //retrieve method
    public List<SessionBean> getAllSessions() throws Exception {
        List<SessionBean> list = new ArrayList<>();

        try {

            Connection conn = getConnection();

            String sql
                    = "SELECT * FROM Training_Sessions "
                    + "ORDER BY branch_location ASC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                SessionBean s
                        = new SessionBean();

                s.setSession_id(
                        rs.getInt("session_id"));

                s.setStudent_name(
                        rs.getString("student_name"));

                s.setBranch_location(
                        rs.getString("branch_location"));

                s.setLesson_type(
                        rs.getString("lesson_type"));

                s.setStatus(
                        rs.getString("status"));

                list.add(s);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }
}
