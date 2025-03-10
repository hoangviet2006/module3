package service;

import model.Product;
import repository.IProductRepository;
import repository.ProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductService implements IProductService {
    IProductRepository productRepository = new ProductRepository();

    @Override
    public List<Product> getProduct() {
       return  productRepository.getProduct();
    }

    @Override
    public void addProduct(Product product) {
        productRepository.addProduct(product);
    }

    @Override
    public boolean editProduct(int id, Product product) {
      return productRepository.editProduct(id,product);
    }

    @Override
    public boolean deleteProduct(int id) {
       return productRepository.deleteProduct(id);
    }

    @Override
    public List<Product> searchProduct(String name) {
        return productRepository.searchProduct(name);
    }

    @Override
    public Product findById(int id) {
        List<Product> product = productRepository.getProduct();
        for (Product product1 : product) {
            if (product1.getId() == id) {
                return product1;
            }
        }
        return null;
    }
}
