package com.aynna.gradling;

import java.io.IOException;
import java.io.InputStream;

public class Main {

  public static void main(String[] args) {
      int buf =0;
      StringBuffer stringBuffer = new StringBuffer();
      final String flag = "s";
      String command = "/home/vighnesh/Documents/devops/scripting/serve/tomcat_server.sh -" + flag;
//      String command = "/home/vighnesh/Documents/devops/scripting/serve/apache_serve.sh -" + flag;
//      String command = "//Documents/devops/scripting/serve/tomcat_server.sh";

    try {
      Process process = Runtime.getRuntime().exec(command);
      InputStream inputStream = process.getInputStream();
      while ((buf=inputStream.read()) != -1){
          stringBuffer.append((char)buf);
      }
        System.out.println("Response: " + stringBuffer.toString());
    } catch (IOException e) {
      e.printStackTrace();
    }

  }

}
