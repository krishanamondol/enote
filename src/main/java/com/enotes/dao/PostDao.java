package com.enotes.dao;

import com.enotes.entities.Post;
import com.enotes.entities.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PostDao {

    private final Connection connection;

    public PostDao(Connection connection) {
        this.connection = connection;
    }

    public boolean addNote(String title,String content,int userid){
        boolean f = false;
        try {
            String query = "insert into post(title,content,userid) values(?,?,?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1,title);
            preparedStatement.setString(2,content);
            preparedStatement.setInt(3,userid);
            int i = preparedStatement.executeUpdate();
            if (i == 1) {
              f = true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return f;
    }

    public List<Post> getData(int id){
        Post post = null;
        List<Post> list = new ArrayList<Post>();
        try {
        String query = "select * from post where userid=? order by id DESC ";
        PreparedStatement preparedStatement = this.connection.prepareStatement(query);
        preparedStatement.setInt(1,id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                post = new Post();
                post.setId(resultSet.getInt(1));
                post.setTitle(resultSet.getString(2));
                post.setContent(resultSet.getString(3));
                //post.setpDate(resultSet.getDate(4));
                list.add(post);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return list;
    }


    public Post getDateById(String noteId){
    Post post = null;
    try {
        String query = "select * from post where id=?";
        PreparedStatement preparedStatement = this.connection.prepareStatement(query);
        preparedStatement.setInt(1, Integer.parseInt(noteId));
        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet.next()) {
            post = new Post();
            post.setId(resultSet.getInt(1));
            post.setTitle(resultSet.getString(2));
            post.setContent(resultSet.getString(3));
        }
    }catch (Exception e){
        e.printStackTrace();
    }
    return post;
    }

    public boolean updatePost(String postNo,String title,String content){
        boolean f = false;
        try {
            String query = "UPDATE post SET title=?,content=? WHERE id=?";
            PreparedStatement preparedStatement = this.connection.prepareStatement(query);
            preparedStatement.setString(1,title);
            preparedStatement.setString(2,content);
            preparedStatement.setString(3, String.valueOf(Integer.parseInt(postNo)));
            int i = preparedStatement.executeUpdate();
            if (i == 1) {
               f = true;
            }
//            ResultSet resultSet = preparedStatement.executeQuery();
        }catch (Exception e){
            e.printStackTrace();
        }
        return f;
    }

    public boolean deleteNote(String postId){
        boolean f = false;
        try {
        String query = "DELETE FROM post WHERE id=?";
        PreparedStatement preparedStatement = this.connection.prepareStatement(query);
        preparedStatement.setInt(1, Integer.parseInt(postId));
        int x = preparedStatement.executeUpdate();
            if (x == 1) {
               f = true;
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

}

