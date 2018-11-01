/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

/**
 *
 * @author neo
 */
public class SMSUtil {
    private static final String URL = "http://api.esms.vn/MainService.svc/xml/SendMultipleMessage_V2/";
    private static final String APIKey = "986DEF10E06CBACDE901C0E32CB9AF";
    private static final String SecretKey = "94CC81E3970F92249E259FE860123F";
    
    public static void sendSMS(String phone, String message) throws IOException{
        URL obj;
        try {
            obj = new URL(URL);

            HttpURLConnection con = (HttpURLConnection) obj.openConnection();
            
            String customers = "";

            String[] lstPhone = phone.split(",");

            for (int i = 0; i < lstPhone.length; i++) {
                customers = customers + "<CUSTOMER>"
                        + "<PHONE>" + lstPhone[i].replace(" ", "") + "</PHONE>"
                        + "</CUSTOMER>";
            }

            //message tieng viet khong dau 160 ky tu   
            String SampleXml = "<RQST>"
                    + "<APIKEY>" + APIKey + "</APIKEY>"
                    + "<SECRETKEY>" + SecretKey + "</SECRETKEY>"
                    + "<ISFLASH>0</ISFLASH>"
                    + "<UNICODE>0</UNICODE>"
                    + "<SMSTYPE>7</SMSTYPE>"
                    + "<CONTENT>" + message + "</CONTENT>"
                    + "<CONTACTS>" + customers + "</CONTACTS>"
                    + "</RQST>";
            //message tieng viet co dau 70 ky tu
//            String SampleXml = "<RQST>"
//                    + "<APIKEY>" + APIKey + "</APIKEY>"
//                    + "<SECRETKEY>" + SecretKey + "</SECRETKEY>"
//                    + "<ISFLASH>0</ISFLASH>"
//                    + "<UNICODE>1</UNICODE>"
//                    + "<CONTENT>" + URLEncoder.encode(message,"UTF-8").replace("+", "%20") + "</CONTENT>"                                     
//                    + "<CONTACTS>" + customers + "</CONTACTS>"
//                    + "</RQST>";

            String postData = SampleXml.trim();

            con.setDoOutput(true);
            con.setRequestMethod("POST");

            con.setFixedLengthStreamingMode(postData.getBytes().length);
            con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            //send the POST out
            PrintWriter out = new PrintWriter(con.getOutputStream());
            out.print(postData);
            out.close();

            int responseCode = con.getResponseCode();
            System.out.println("\nSending 'GET' request to URL : " + URL);
            System.out.println("Response Code : " + responseCode);
            if (responseCode == 200)
            {
                //Check CodeResult from response
            }
            
            BufferedReader in = new BufferedReader(
                    new InputStreamReader(con.getInputStream()));
            String inputLine;
            StringBuffer response = new StringBuffer();

            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();

            //print result
            System.out.println(response.toString());
        } catch (MalformedURLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
