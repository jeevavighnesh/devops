package com.aynna.gradling;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

public class Main {

  public static void main(String[] args) {
      String buf = "";
      StringBuffer stringBuffer = new StringBuffer();
      final String flag = "i";
      String username = "Revature";
//      String command = "bash /home/" + username + "/Documents/devops/scripting/serve/tomcat_server.sh -" + flag;
//      String command = "sudo bash /home/" + username + "/Documents/devops/scripting/serve/apache_serve.sh -" + flag;
      String command = "cmd C:\\Users\\" + username + "\\Documents\\Vighnesh\\devops\\batching\\tomcat_serve.bat install";

    try {
      Process process = Runtime.getRuntime().exec(command);
      process.waitFor();
      BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
      while ((buf=reader.readLine()) != null){
          stringBuffer.append(buf + "\n");
      }
        System.out.println("Response: " + stringBuffer.toString());
    } catch (IOException | InterruptedException e) {
        e.printStackTrace();
    }

  }

}
