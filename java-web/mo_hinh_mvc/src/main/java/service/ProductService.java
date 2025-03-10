package service;

import model.Product;
import repository.IProductRepository;
import repository.ProductRepository;

import java.util.List;

public class ProductService implements IProductService {
        IProductRepository productRepository = new ProductRepository();
    @Override
    public List<Product> getAll() {
            return productRepository.getAll();
    }

    @Override
    public boolean addProduct(Product product) {
        return productRepository.addProduct(product);
    }

    @Override
    public boolean editProduct(int id, Product product) {
        Product product1 = productRepository.findById(id);
        if (product1!=null){
            productRepository.editProduct(id,product);
            return true;
        }
        return false;
    }

    @Override
    public boolean deleteProduct(int id) {
      return  productRepository.deleteProduct(id);
    }

    @Override
    public List<Product> searchProduct(String name) {
       return productRepository.searchProduct(name);
    }

    @Override
    public Product findById(int id) {
      return productRepository.findById(id);
    }
}
