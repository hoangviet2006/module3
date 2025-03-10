package service;

import model.Product;

import java.util.List;

public interface IProductService {
    List<Product> getAll();
    boolean addProduct(Product product);
    boolean editProduct(int id,Product product);
    Product findById(int id);
    boolean deleteProduct(int id);
    List<Product> searchProduct(String name);

}
