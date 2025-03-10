package service;

import model.Electronics;
import model.Product;
import repository.ElectronicsRepository;

import java.util.List;

public class ElectronicsService implements IElectronicsService{
    ElectronicsRepository electronicsRepository = new ElectronicsRepository();
    @Override
    public List<Product> getElectronics() {
       return electronicsRepository.getElectronics();
    }

    @Override
    public boolean addElectronics(Electronics electronics) {
        return electronicsRepository.addElectronics(electronics);
    }

    @Override
    public boolean editElectronics(int id, Electronics electronics) {
        Electronics electronics1 = electronicsRepository.findById(id);
            if (electronics1!=null){
                electronicsRepository.editElectronics(id,electronics);
                return true;
            }
        return false;
    }

    @Override
    public boolean deleteElectronics(int id) {
        return electronicsRepository.deleteElectronics(id);
    }

    @Override
    public List<Product> searchElectronics(String name) {
        return electronicsRepository.searchElectronics(name);
    }
}
