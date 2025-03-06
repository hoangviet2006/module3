package repository;

import model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository{
    private static List<Product> list = new ArrayList<>();
    static {
        list.add(new Product(1,"Ao",100000000,2,"áo polo"));
        list.add(new Product(2,"Quan",20000000,2,"Quần Jean"));
        list.add(new Product(3,"Giay",5000000,2,"Giày Âu"));
    }
    @Override
    public List<Product> getProduct() {
        return list;
    }

    @Override
    public void addProduct(Product product) {
        list.add(product);
    }

    @Override
    public boolean editProduct(int id, Product product) {
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getId()==id){
                list.set(i,product);
                return true;
            }
        }
        return false;
    }

    @Override
    public boolean deleteProduct(int id) {
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getId()==id){
                list.remove(i);
                return true;
            }
        }
        return false;
    }

    @Override
    public List<Product> searchProduct(String name) {
        List<Product> newProduct = new ArrayList<>();
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getName().contains(name)){
                newProduct.add(list.get(i));
            }
        }
        return newProduct;
    }

}
