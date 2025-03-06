package service;

import model.Phone;

import java.util.ArrayList;
import java.util.List;

public class PhoneService implements IPhoneService {
    private static List<Phone> phoneList = new ArrayList<>();

    static {
        phoneList.add( new Phone(1,"Iphone",1000000,"128GB"));
        phoneList.add( new Phone(2,"SamSung",2000000,"64GB"));
        phoneList.add( new Phone(3,"ReadMe",3000000,"128GB"));
        phoneList.add( new Phone(4,"RealMe",4000000,"256GB"));
        phoneList.add( new Phone(5,"NoKiA",5000000,"128GB"));
        phoneList.add( new Phone(6,"ViVo",6000000,"64GB"));
        phoneList.add( new Phone(7,"HueWie",7000000,"128GB"));
        phoneList.add( new Phone(8,"ROG",8000000,"256GB"));
        phoneList.add( new Phone(9,"Oppo",9000000,"128GB"));
    }

    @Override
    public List<Phone> getPhone() {
     return phoneList;
    }

    @Override
    public void addPhone(Phone phone) {
        phoneList.add(phone);
    }

    @Override
    public boolean editPhone(int id,Phone phone) {
        for (int i = 0; i < phoneList.size(); i++) {
            if (phoneList.get(i).getId()==id){
                phoneList.set(i,phone);
                return true;
            }
        }
        return false;
    }

    @Override
    public boolean deletePhone(int id) {
        for (int i = 0; i < phoneList.size(); i++) {
            if (phoneList.get(i).getId()==id){
                phoneList.remove(i);
                return true;
            }
        }
        return false;
    }

    @Override
    public Phone findById(int id) {
        for (int i = 0; i < phoneList.size(); i++) {
            if (phoneList.get(i).getId()==id){
                return phoneList.get(i);
            }
        }
        return null;
    }

    @Override
    public List<Phone> searchPhone(String name) {
       List<Phone> newPhone= new ArrayList<>();
        for (int i = 0; i < phoneList.size(); i++) {
                if (phoneList.get(i).getName().contains(name)){
                    newPhone.add(phoneList.get(i));
                }
        }
        return newPhone;
    }
}
