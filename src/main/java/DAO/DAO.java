  package DAO;

import entity.Account;
import entity.Category;
import entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import static java.util.Collections.list;
import java.util.List;

public class DAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public Account checkLogin(String user, String pass) {
        try {
            String query = "SELECT * FROM Acc.Users WHERE username = ? AND password = ?";
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();

            if (rs.next()) {
                return new Account(
                    rs.getInt("id"),
                    rs.getString("username"),
                    rs.getString("password"),
                    rs.getInt("isSell"),
                    rs.getInt("isAdmin")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return null;
    }

    public List<Product> getProductByUserId(int id) {
        List<Product> list = new ArrayList<>();

        try {
            String query = "SELECT * FROM Acc.products WHERE user_id = ?;";
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1,id);

            rs = ps.executeQuery();

            while (rs.next()) {
               list.add(new Product(
                    rs.getInt("id"),
                    rs.getString("name_product"),
                    rs.getString("img"),
                    rs.getDouble("price"),
                    rs.getString("title"),
                    rs.getString("description")
                )) ;
                    
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

        return list;
    }
    

    public void deleteProduct(String pid) {
        String query = "DELETE FROM Acc.products WHERE id = ?; "; // Giả sử bảng là "product"
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, pid);
            int rowsAffected = ps.executeUpdate(); // đúng kiểu dữ liệu
            if (rowsAffected > 0) {
                System.out.println("Deleted product with ID: " + pid);
            } else {
                System.out.println("No product found with ID: " + pid);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
    
        public void deleteUser(String pid) {
        String query = "DELETE FROM Acc.Users WHERE id = ?; "; 
        try {
            conn = new DBcontext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, pid);
            int rowsAffected = ps.executeUpdate(); // đúng kiểu dữ liệu
            if (rowsAffected > 0) {
                System.out.println("Deleted user with ID: " + pid);
            } else {
                System.out.println("No user found with ID: " + pid);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
 
    
    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String query = "SELECT * FROM Acc.categories;";
        try {
           conn = new DBcontext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt("cateID"),
                            rs.getString("cateName")));
            }   
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
     
   public void insertProduct (String name , String img ,double price ,
           String tittle, String description,String category, int sellId){
       String query = "INSERT INTO Acc.products (name_product, img, price, title, description, cateID, user_id)\n" +
                       "values (?,?,?,?,?,?,?);";
        try {
           conn = new DBcontext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, img);
            ps.setDouble(3, price);
            ps.setString(4, tittle);
            ps.setString(5, description);
            ps.setString(6, category);
            ps.setInt(7, sellId);
            ps.executeUpdate();  
        } catch (Exception e) {
            e.printStackTrace();
        }
       
   }
   
   public List<Product> getAllProduct() {
    List<Product> list = new ArrayList<>();
    String query = "SELECT * FROM Acc.products;";
    try {
      conn = new DBcontext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
        while (rs.next()) {
           list.add(new Product(
                    rs.getInt("id"),
                    rs.getString("name_product"),
                    rs.getString("img"),
                    rs.getDouble("price"),
                    rs.getString("title"),
                    rs.getString("description")
                )) ;
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return list;
}
   public Product getProductByID(String id) {
        String query = "select * from Acc.products\n"
                + "where id = ?";
        try {
             conn = new DBcontext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(
                    rs.getInt("id"),
                    rs.getString("name_product"),
                    rs.getString("img"),
                    rs.getDouble("price"),
                    rs.getString("title"),
                    rs.getString("description")
                ); 
            }
        } catch (Exception e) {
        }
        return null;
    }
   public void editProduct ( String name , String img , String price ,
           String tittle, String description,String category ,String pid){
       String query = "UPDATE Acc.products \n" +
"SET name_product = ?, img = ?, price = ?, title = ?, description = ?, cateID = ? \n" +
"WHERE id = ?;";
        try {
           conn = new DBcontext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query); 
       
            ps.setString(1, name);
            ps.setString(2, img);
            ps.setString(3, price);
            ps.setString(4, tittle);
            ps.setString(5, description);
            ps.setString(6, category);
            ps.setString(7, pid);
            
            ps.executeUpdate();  
        } catch (Exception e) {
            e.printStackTrace();
        }
        
   }
   
     public void addToCart ( int cusId , int productId,int quantity){
       String query = "INSERT INTO Acc.Cart ( CustomerID, ProductID, Quantity)\n" +
                       "values (?,?,?);";
        try {
           conn = new DBcontext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            
            ps.setInt(1, cusId);
            ps.setInt(2, productId);
            ps.setInt(3, quantity);
           
            ps.executeUpdate();  
        } catch (Exception e) {
            e.printStackTrace();
        }
     }
      public void clearCart(int customerId) {
    String query = "DELETE FROM Acc.Cart WHERE CustomerID = ? ; ";
    try {
        conn = new DBcontext().getConnection();
        ps = conn.prepareStatement(query);
        ps.setInt(1, customerId);
        ps.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

  public int createOrder(int customerId, String status) {
    String query = "INSERT INTO Acc.Orders (CustomerID, OrderDate, Status) VALUES (?, NOW(), ?);";
    ResultSet generatedKeys = null;
    try {
        conn = new DBcontext().getConnection();
        ps = conn.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);
        ps.setInt(1, customerId);
        ps.setString(2, status);
        ps.executeUpdate();

        generatedKeys = ps.getGeneratedKeys();
        if (generatedKeys.next()) {
            return generatedKeys.getInt(1); // Trả về OrderID vừa tạo
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (generatedKeys != null) generatedKeys.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    return -1;
}
  public void addOrderDetail(int orderId, int productId, int quantity, double subtotal) {
    String query = "INSERT INTO Acc.OrderDetails (OrderID, ProductID, Quantity, Subtotal) VALUES (?, ?, ?, ?); ";
    try {
        conn = new DBcontext().getConnection();
        ps = conn.prepareStatement(query);
        ps.setInt(1, orderId);
        ps.setInt(2, productId);
        ps.setInt(3, quantity);
        ps.setDouble(4, subtotal);
        ps.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
  
  
   public List<Account> getAllAccount() {
    List<Account> list = new ArrayList<>();
    String query = "SELECT * FROM Acc.Users;";
    try {
      conn = new DBcontext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
        while (rs.next()) {
           list.add(new Account(
                    rs.getInt("id"),
                    rs.getString("username"),
                    rs.getString("password"),
                    rs.getInt("isSell"),
                    rs.getInt("isAdmin")
                 )) ;
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return list;
}
  
  

 
    
           
}
