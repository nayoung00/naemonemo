package com.nmnm.gms.service;

import java.util.List;
import com.nmnm.gms.domain.Co;

public interface CoService {

  void add(Co co) throws Exception;

  List<Co> list() throws Exception;

  int delete(int coNo) throws Exception;

  Co get(int coNo) throws Exception;

  int update(Co co) throws Exception;

  List<Co> search(String keyword) throws Exception;

  List<Co> categorySearch(String keyword2) throws Exception;
}
