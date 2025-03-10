package service;

import model.Product;

import java.util.List;

public interface IProductService {
    List<Product> getProduct();

    void addProduct(Product product);

    boolean editProduct(int id, Product product);

    boolean deleteProduct(int id);

    List<Product> searchProduct(String name);
    Product findById(int id);
}
