package com.example.bai_lam_them.repository;

import com.example.bai_lam_them.dto.PigDto;
import com.example.bai_lam_them.model.Pig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PigRepository implements IPigRepository {
    private final static String SELECT_ALL = "select p.id,p.code_pig,p.imported_date,p.imported_weight,p.exported_date,p.exported_weight,p.id_origin,o.`name`,p.`status` from pig p left join origin o on p.id_origin= o.id";
    private final static String EDIT = "update pig set code_pig=?,imported_date=?,imported_weight=?,exported_date=?,exported_weight=?,`status`=?,id_origin=? where id=?";
    private final static String DELETE = "delete from pig where id=?";
    private final static String SEARCH_STATUS = "select p.id,p.code_pig,p.imported_date,p.imported_weight,p.exported_date,p.exported_weight,p.id_origin,o.`name`,p.`status` from pig p left join origin o on p.id_origin= o.id where `status` like ?";
    private final static String SEARCH_CODE = "select p.id,p.code_pig,p.imported_date,p.imported_weight,p.exported_date,p.exported_weight,p.id_origin,o.`name`,p.`status` from pig p left join origin o on p.id_origin= o.id where code_pig like ?";
    private final static String SEARCH_ORIGIN = "select p.id,p.code_pig,p.imported_date,p.imported_weight,p.exported_date,p.exported_weight,p.id_origin,o.`name`,p.`status` from pig p left join origin o on p.id_origin= o.id where `name` like ?";

    @Override
    public List<PigDto> getPig() {
        Connection connection = BaseRepository.getConnectDB();
        List<PigDto> pigDtoList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String code = resultSet.getString("code_pig");
                String importedDate = resultSet.getString("imported_date");
                double importedWeight = resultSet.getDouble("imported_weight");
                String exportedDate = resultSet.getString("exported_date");
                double exportedWeight = resultSet.getDouble("exported_weight");
                String status = resultSet.getString("status");
                int idOrigin = resultSet.getInt("id_origin");
                String name = resultSet.getString("name");
                PigDto pig = new PigDto(id, code, importedDate, importedWeight, exportedDate, exportedWeight, status, idOrigin, name);
                pigDtoList.add(pig);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return pigDtoList;
    }

    @Override
    public List<PigDto> searchStatus(String status) {
        Connection connection = BaseRepository.getConnectDB();
        List<PigDto> pigDtoList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_STATUS);
            preparedStatement.setString(1, "%" + status + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int idSearch = resultSet.getInt("id");
                String codeSearch = resultSet.getString("code_pig");
                String importedDateSearch = resultSet.getString("imported_date");
                double importedWeightSearch = resultSet.getDouble("imported_weight");
                String exportedDateSearch = resultSet.getString("exported_date");
                double exportedWeightSearch = resultSet.getDouble("exported_weight");
                String statusSearch = resultSet.getString("status");
                int idOriginSearch = resultSet.getInt("id_origin");
                String nameSearch = resultSet.getString("name");
                PigDto pig = new PigDto(idSearch, codeSearch, importedDateSearch, importedWeightSearch, exportedDateSearch, exportedWeightSearch, statusSearch, idOriginSearch, nameSearch);
                pigDtoList.add(pig);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return pigDtoList;
    }

    @Override
    public List<PigDto> searchCode(String code) {
        Connection connection = BaseRepository.getConnectDB();
        List<PigDto> pigDtoList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_CODE);
            preparedStatement.setString(1, "%" + code + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int idSearch = resultSet.getInt("id");
                String codeSearch = resultSet.getString("code_pig");
                String importedDateSearch = resultSet.getString("imported_date");
                double importedWeightSearch = resultSet.getDouble("imported_weight");
                String exportedDateSearch = resultSet.getString("exported_date");
                double exportedWeightSearch = resultSet.getDouble("exported_weight");
                String statusSearch = resultSet.getString("status");
                int idOriginSearch = resultSet.getInt("id_origin");
                String nameSearch = resultSet.getString("name");
                PigDto pig = new PigDto(idSearch, codeSearch, importedDateSearch, importedWeightSearch, exportedDateSearch, exportedWeightSearch, statusSearch, idOriginSearch, nameSearch);
                pigDtoList.add(pig);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return pigDtoList;
    }

    @Override
    public List<PigDto> searchOrigin(String origin) {
        Connection connection = BaseRepository.getConnectDB();
        List<PigDto> pigDtoList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_ORIGIN);
            preparedStatement.setString(1, "%" + origin + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int idSearch = resultSet.getInt("id");
                String codeSearch = resultSet.getString("code_pig");
                String importedDateSearch = resultSet.getString("imported_date");
                double importedWeightSearch = resultSet.getDouble("imported_weight");
                String exportedDateSearch = resultSet.getString("exported_date");
                double exportedWeightSearch = resultSet.getDouble("exported_weight");
                String statusSearch = resultSet.getString("status");
                int idOriginSearch = resultSet.getInt("id_origin");
                String nameSearch = resultSet.getString("name");
                PigDto pig = new PigDto(idSearch, codeSearch, importedDateSearch, importedWeightSearch, exportedDateSearch, exportedWeightSearch, statusSearch, idOriginSearch, nameSearch);
                pigDtoList.add(pig);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return pigDtoList;
    }

    @Override
    public boolean deletePig(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1, id);
            int row = preparedStatement.executeUpdate();
            return row == 1;
        } catch (SQLException e) {
            System.out.println("Lỗi");
            return false;
        }
    }

    @Override
    public boolean editPig(int id, Pig pig) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(EDIT);
            preparedStatement.setString(1, pig.getCodePig());
            preparedStatement.setString(2, pig.getImportedDate());
            preparedStatement.setDouble(3, pig.getImportedWeight());
            preparedStatement.setString(4, pig.getExportedDate());
            preparedStatement.setDouble(5, pig.getExportedWeight());
            preparedStatement.setString(6, pig.getStatus());
            preparedStatement.setInt(7, pig.getIdOrigin());
            preparedStatement.setInt(8, pig.getId());
            int row = preparedStatement.executeUpdate();
            return row == 1;
        } catch (SQLException e) {
            System.out.println("Lỗi");
            return false;
        }
    }
}
