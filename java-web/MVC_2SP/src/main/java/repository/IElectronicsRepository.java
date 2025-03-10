package repository;

import model.Electronics;
import model.Product;

import java.util.List;

public interface IElectronicsRepository {
    List<Product> getElectronics();
    boolean addElectronics(Electronics electronics);
    boolean editElectronics(int id, Electronics electronics);
    boolean deleteElectronics(int id);
    List<Product> searchElectronics(String name);
    Electronics findById(int id);
}
