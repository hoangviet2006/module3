package service;

import model.ImportedGoods;

import java.util.ArrayList;
import java.util.List;

public class ImportedGoodsService implements IImportedGoods {
    private static List<ImportedGoods> iImportedGoodsList = new ArrayList<>();

    static {
        iImportedGoodsList.add(new ImportedGoods(1, "Điện Thoại", 50000000));
        iImportedGoodsList.add(new ImportedGoods(2, "Máy Tính", 50000000));
        iImportedGoodsList.add(new ImportedGoods(3, "Máy Bay", 50000000));
        iImportedGoodsList.add(new ImportedGoods(4, "Máy Giặt", 50000000));
        iImportedGoodsList.add(new ImportedGoods(5, "TiVI", 50000000));
        iImportedGoodsList.add(new ImportedGoods(6, "Tủ Lạnh", 50000000));
        iImportedGoodsList.add(new ImportedGoods(7, "Máy Lạnh", 50000000));
        iImportedGoodsList.add(new ImportedGoods(8, "Máy Hút Bụi", 50000000));
        iImportedGoodsList.add(new ImportedGoods(9, "Loa", 50000000));
        iImportedGoodsList.add(new ImportedGoods(10, "Xe Máy", 50000000));
        iImportedGoodsList.add(new ImportedGoods(15, "Xe Máy", 50000000));
    }

    @Override
    public List<ImportedGoods> getAll() {
        return iImportedGoodsList;
    }

    @Override
    public void add(ImportedGoods importedGoods) {
        iImportedGoodsList.add(importedGoods);
    }

    @Override
    public boolean delete(int id) {
        for (int i = 0; i < iImportedGoodsList.size(); i++) {
            if (iImportedGoodsList.get(i).getId() == id) {
                iImportedGoodsList.remove(i);
                return true;
            }
        }
        return false;
    }

    @Override
    public boolean edit(int id, ImportedGoods importedGoods) {
        for (int i = 0; i < iImportedGoodsList.size(); i++) {
            if (iImportedGoodsList.get(i).getId()==id){
                iImportedGoodsList.set(i,importedGoods);
                return true;
            }
        }
        return false;
    }



    @Override
    public List<ImportedGoods> search(int id) {
        List<ImportedGoods> list = getAll();
        List<ImportedGoods> newList = new ArrayList<>();
        for (int i = 0; i < list.size(); i++) {
            if (list.get(i).getId() == id) {
                newList.add(list.get(i));
                break;
            }
        }
        return newList;
    }

    @Override
    public ImportedGoods findById(int id) {
        for (int i = 0; i < iImportedGoodsList.size(); i++) {
            if (iImportedGoodsList.get(i).getId()==id){
                return iImportedGoodsList.get(i);
            }
        }
        return null;
    }
}
