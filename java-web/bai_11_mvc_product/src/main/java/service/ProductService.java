package service;

import model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductService implements IProductService{
    private static List<Product> list = new ArrayList<>();
    static {
        list.add(new Product(1,"Ao",100000000,2,"áo polo"));
        list.add(new Product(2,"Quan",20000000,2,"Quần Jean"));
        list.add(new Product(3,"Giay",5000000,2,"Giày Âu"));
    }
    @Override
    public Product findById(int id) {
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getId()==id){
                return list.get(i);
            }
        }
        return null;
    }
}
