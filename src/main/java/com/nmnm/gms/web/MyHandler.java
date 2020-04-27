// package com.nmnm.gms.web;
//
// import org.apache.ibatis.session.SqlSession;
// import org.apache.logging.log4j.LogManager;
// import org.apache.logging.log4j.Logger;
// import org.springframework.beans.factory.annotation.Autowired;
// import org.springframework.stereotype.Repository;
// import org.springframework.web.socket.CloseStatus;
// import org.springframework.web.socket.TextMessage;
// import org.springframework.web.socket.WebSocketSession;
// import org.springframework.web.socket.handler.TextWebSocketHandler;
// import com.nmnm.gms.dao.MemberDao;
//
// @Repository
// public class MyHandler extends TextWebSocketHandler {
//
// private final Logger logger = LogManager.getLogger(getClass());
//
//
// @Autowired
// SqlSession sqlSession;
//
// @Override
// public void afterConnectionEstablished(WebSocketSession session) throws Exception {
//
// }
//
// @Override
// protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception
// {
// MemberDao dao = sqlSession.getMapper(MemberDao.class);
// this.logger.info(message.getPayload());
// session.sendMessage(new TextMessage(dao.));
// }
//
// @Override
// public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception
// {
//
// }
// }
