    import DAO.DAO;
    import entity.Product;
    import java.util.List;

    public class TestDB {
         public static void main(String[] args) {
            DAO dao = new DAO();

            int testUserId = 1; // Thay id phù hợp trong database của bạn

            List<Product> products = dao.getProductByUserId(testUserId);

            if (products != null && !products.isEmpty()) {
                System.out.println("Danh sách sản phẩm của user " + testUserId + ":");
                for (Product p : products) {
                    System.out.println(
                        "ID: " + p.getId() +
                        ", Name: " + p.getNameProduct() +
                        ", Price: " + p.getPrice() +
                        ", Title: " + p.getTitle()
                    );
                }
            } else {
                System.out.println("Không tìm thấy sản phẩm nào cho user " + testUserId);
            }
 
        }
    }
