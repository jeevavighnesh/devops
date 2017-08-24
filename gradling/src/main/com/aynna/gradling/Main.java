package com.aynna.gradling;

import java.io.IOException;
import java.io.InputStream;

public class Main {

  public static void main(String[] args) {
      int buf =0;
      StringBuffer stringBuffer = new StringBuffer();
      String command = "/C:\\Users\\Revature\\Documents\\Vighnesh\\devops\\batching\\apache_serve.bat";

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
