import 'dart:developer';

class SocketListener{

  void onSocketConnect(data){
    log("SocketListener \"onSocketConnect\": $data");
  }

  void onSocketDisconnect(data){
    log("SocketListener \"onSocketDisconnect\": $data");
  }

  void onSocketInfoRoom(data){
    log("SocketListener \"onSocketInfoRoom\": $data");
  }


  void onSocketReadyRoom(data){
    log("SocketListener \"onSocketReadyRoom\": $data");
  }


  void onSocketRolePlayer(data){
    log("SocketListener \"onSocketRolePlayer\": $data");
  }

  void onSocketMessageRoom(data){
    log("SocketListener \"onSocketMessageRoom\": $data");
  }

  void onSocketMessageWolf(data){
    log("SocketListener \"onSocketMessageWolf\": $data");
  }

  void onSocketMessageDie(data){
    log("SocketListener \"onSocketMessageDie\": $data");
  }


}