package service;

import model.ImportedGoods;

import java.util.List;

public interface IImportedGoods {
    List<ImportedGoods> getAll();
    void  add(ImportedGoods importedGoods);
    boolean delete(int id);
    boolean edit(int id,ImportedGoods importedGoods);
    List<ImportedGoods> search(int id);
    ImportedGoods findById(int id);
}
