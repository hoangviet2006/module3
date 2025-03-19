package com.example.bai_lam_them.repository;

import com.example.bai_lam_them.dto.PigDto;
import com.example.bai_lam_them.model.Pig;

import java.util.List;

public interface IPigRepository {
    List<PigDto> getPig();
    List<PigDto> searchStatus(String status);
    List<PigDto> searchCode(String code);
    List<PigDto> searchOrigin(String origin);
    boolean deletePig(int id);
    boolean editPig(int id, Pig pig);
}
