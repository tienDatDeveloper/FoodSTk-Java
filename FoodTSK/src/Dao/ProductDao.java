/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Dao;

import DB.ConnectDB;
import EndCode.Md5;
import Model.Product;
import Model.User;
import com.mysql.cj.jdbc.Blob;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


/**
 *
 * @author tien
 */
public class ProductDao {
   private ConnectDB dB ;
    private Product product;
    private Connection connection;
    public ProductDao() {
        dB=new ConnectDB();
        this.connection=dB.GetConnect();
    }
    
     public ArrayList<Product>getAllRows(int id)throws Exception{
        ArrayList<Product> lst=new ArrayList<Product>();
        String sql="select * from product where CategoryID="+id+"";
        ResultSet rs=connection.createStatement().executeQuery(sql);
           
    // user lh=null;
        while(rs.next()){
          
            product=new Product(rs.getInt("id"),
                    rs.getString("name"),
                    rs.getInt("CategoryID"),
                    rs.getInt("quantity"),
                    rs.getInt("price")
                   );
            lst.add(product);
        }
        //Blob imageBlob = list.get(i).getImage();
        return lst;
 }
 public boolean insertProduct(Product product) throws FileNotFoundException {
       // PreparedStatement statement = null;
        try {
            //InputStream is = new FileInputStream(new File(String.valueOf(product.getImage()) ));
            String sql = "insert into product(name, CategoryID, quantity, price) values(?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareCall(sql);
            statement.setString(1, product.getName());
            statement.setInt(2, product.getCategoryID());
            statement.setInt(3, product.getQuantity());
            statement.setInt(4, product.getPrice());
            statement.execute();
            return  true;
        } catch (SQLException ex) {
            System.out.print(ex.getMessage());
        }
        return false;
    }
 public ArrayList<Product>getAllRows()throws Exception{
        ArrayList<Product> lst=new ArrayList<Product>();
        String sql="select * from product";
        ResultSet rs=connection.createStatement().executeQuery(sql);
       // user lh=null;
        while(rs.next()){
            Product  product=new Product(rs.getInt("id"),rs.getString("name"),rs.getInt("CategoryID"),rs.getInt("quantity"),rs.getInt("price"));
            lst.add(product);
        }
     return lst;
 }
   public ArrayList<Product> searchProduct(String key) throws SQLException{
         ArrayList<Product> lst=new ArrayList<Product>();
        String nameString="%"+key+"%";
        String sql="select * from product WHERE name LIKE ?";
         PreparedStatement stmt=connection.prepareStatement(sql);
           stmt.setString(1,"%"+key+"%");

        try(ResultSet rs=stmt.executeQuery();) {
            while (rs.next()) {
                product=new Product(rs.getInt("id"),rs.getString("name"),rs.getInt("CategoryID"),rs.getInt("quantity"),rs.getInt("price"));
                 lst.add(product);
            }
        } catch (Exception e) {
        }
       
     return lst;
    }
   public Product getbyId(int id){
        String sql="select * from product where id="+id+"";
        try {
             ResultSet rs=connection.createStatement().executeQuery(sql); while(rs.next()){
            product=new Product(rs.getInt("id"),rs.getString("name"),rs.getInt("CategoryID"),rs.getInt("quantity"),rs.getInt("price"));
        }
        } catch (Exception e) {
             e.printStackTrace();
        }
    
    // user lh=null;
    
     return product;
 }
      public int updateProduct(Product product){
            
         
     String sql = "UPDATE product SET name='"+product.getName()+"', CategoryID='"+product.getCategoryID()+"'"
             + ", quantity='"+product.getQuantity()+"', price='"+product.getPrice()+"' "
             + "WHERE id='"+product.getId()+"'";
     try(PreparedStatement pstmt = connection.prepareStatement(sql,
                          Statement.RETURN_GENERATED_KEYS);) {
            //thực thi
             int rowAffected = pstmt.executeUpdate();
             if (rowAffected>0) {
                 return 1;
             
         }
     } catch (Exception ex) {
         System.out.println(ex.getMessage());
     }
     return 0;
 }
      public int deleteProduct(int id){
        String sql = "DELETE FROM product WHERE id="+id+";";
        try(PreparedStatement pstmt = connection.prepareStatement(sql,
                          Statement.RETURN_GENERATED_KEYS);) {
            //thực thi
             int rowAffected = pstmt.executeUpdate();
             if (rowAffected>0) {
                 return 1;
             
         }
     } catch (Exception ex) {
         System.out.println(ex.getMessage());
     }
     return 0;
 }
    
     
}
