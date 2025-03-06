package service;

import model.Phone;

import java.util.List;

public interface IPhoneService {
    List<Phone> getPhone();
    void addPhone(Phone phone);
    boolean editPhone(int id, Phone phone);
    boolean deletePhone(int id);
    Phone findById(int id);
    List<Phone> searchPhone(String name);
}
