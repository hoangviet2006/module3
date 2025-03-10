package service;

import model.Electronics;
import model.Product;
import repository.ElectronicsRepository;

import java.util.List;

public interface IElectronicsService {
    List<Product> getElectronics();
    boolean addElectronics(Electronics electronics);
    boolean editElectronics(int id, Electronics electronics);
    boolean deleteElectronics(int id);
    List<Product> searchElectronics(String name);
}
