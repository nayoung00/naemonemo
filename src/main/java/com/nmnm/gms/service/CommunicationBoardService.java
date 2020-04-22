package com.nmnm.gms.service;

import java.util.List;
import com.nmnm.gms.domain.CommunicationBoard;

public interface CommunicationBoardService {

  void add(CommunicationBoard communicationboard) throws Exception;

  List<CommunicationBoard> list() throws Exception;

  int delete(int no) throws Exception;

  CommunicationBoard get(int no) throws Exception;

  int update(CommunicationBoard communicationboard) throws Exception;

  List<CommunicationBoard> search(String keyword) throws Exception;
}
