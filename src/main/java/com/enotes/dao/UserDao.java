package com.enotes.dao;

import com.enotes.entities.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDao {
    private Connection connection;
    public UserDao(Connection connection) {
        this.connection=connection;
    }


    public boolean saveUser(User user){
        boolean f = false;
        try {
            String query = "insert into user(name,email,password) values(?,?,?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1,user.getName());
            preparedStatement.setString(2,user.getEmail());
            preparedStatement.setString(3,user.getPassword());
            preparedStatement.executeUpdate();
            f = true;
        }catch (Exception e){
            e.printStackTrace();
        }

        return f;
    }

public User getUserEmailAndPassword(String email, String password){
    User user = null;
    try {
        String query="select * from user where email =? and password =?";

        PreparedStatement preparedStatement = this.connection.prepareStatement(query);
        preparedStatement.setString(1,email);
        preparedStatement.setString(2,password);

        ResultSet set = preparedStatement.executeQuery();

        if (set.next()) {
            user= new User();
//            Data From DB
            String name = set.getString("name");
//          set To user Object
            user.setName(name);
            user.setId(set.getInt("id"));
            user.setEmail(set.getString("email"));
            user.setPassword(set.getString("password"));

        }
    }catch (Exception e){
        e.printStackTrace();
    }
    return user;
}
    
}
