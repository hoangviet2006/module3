package repository;

import model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> getAll();
    boolean addProduct(Product product);
    boolean editProduct(int id,Product product);
    boolean deleteProduct(int id);
    List<Product> searchProduct(String name);
    Product findById(int id);

}
