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
    }

    @Override
    public List<ImportedGoods> getAll() {
        return iImportedGoodsList;
    }
}
