package com.example.bai_lam_them.service;

import com.example.bai_lam_them.dto.PigDto;
import com.example.bai_lam_them.model.Origin;
import com.example.bai_lam_them.model.Pig;
import com.example.bai_lam_them.repository.BaseRepository;
import com.example.bai_lam_them.repository.PigRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class    PigService implements IPigService {
    PigRepository pigRepository = new PigRepository();

    @Override
    public List<PigDto> getPig() {
        return pigRepository.getPig();
    }

    @Override
    public List<PigDto> searchStatus(String status) {
        return pigRepository.searchStatus(status);
    }

    @Override
    public List<PigDto> searchCode(String code) {
        return pigRepository.searchCode(code);
    }

    @Override
    public List<PigDto> searchOrigin(String origin) {
        return pigRepository.searchOrigin(origin);
    }

    @Override
    public boolean deletePig(int id) {
        return pigRepository.deletePig(id);
    }

    @Override
    public boolean editPig(int id, Pig pig) {
        Pig pigDto = findById(id);
        if (pigDto != null) {
            pigRepository.editPig(id, pig);
            return true;
        }
        return false;
    }

    @Override
    public Pig findById(int id) {
        Connection connection = BaseRepository.getConnectDB();
        Pig pig = null;
        String query = "select * from pig where id = ?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int findId = resultSet.getInt("id");
                String code = resultSet.getString("code_pig");
                String importedDate = resultSet.getString("imported_date");
                double importedWeight = resultSet.getDouble("imported_weight");
                String exportedDate = resultSet.getString("exported_date");
                double exportedWeight = resultSet.getDouble("exported_weight");
                String status = resultSet.getString("status");
                int idOrigin = resultSet.getInt("id_origin");
                pig = new Pig(findId, code, importedDate, importedWeight, exportedDate, exportedWeight, status, idOrigin);
                break;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return pig;
    }

    @Override
    public List<Origin> findName() {
        Connection connection = BaseRepository.getConnectDB();
        List<Origin> origin =new ArrayList<>();
        String query = "select * from origin";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int findId = resultSet.getInt("id");
                String findName = resultSet.getString("name");
                Origin origin1 = new Origin(findId, findName);
                origin.add(origin1);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return origin;
    }

    @Override
    public Pig findStatus(String status) {
        Connection connection = BaseRepository.getConnectDB();
        Pig pig = null;
        String query = "select status from pig";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int findId = resultSet.getInt("id");
                String code = resultSet.getString("code_pig");
                String importedDate = resultSet.getString("imported_date");
                double importedWeight = resultSet.getDouble("imported_weight");
                String exportedDate = resultSet.getString("exported_date");
                double exportedWeight = resultSet.getDouble("exported_weight");
                String findStatus = resultSet.getString("status");
                int idOrigin = resultSet.getInt("id_origin");
                pig = new Pig(findId, code, importedDate, importedWeight, exportedDate, exportedWeight, findStatus, idOrigin);
                break;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return pig;
    }
}
