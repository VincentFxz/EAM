package com.thinkgem;

import org.apache.xerces.impl.dv.util.Base64;

import java.io.*;

/**
 * Created by vincentfxz on 15/11/18.
 */
public class Test {
    public static void main(String[] args) {
        int a = 1598436703;
        System.out.println(Integer.bitCount(a));
        ByteArrayOutputStream ba = new ByteArrayOutputStream();
        ba.write(a);
        System.out.println(ba.toByteArray().length);
        System.out.println(new String(ba.toByteArray()));
        String filename = "/Users/vincentfxz/Desktop/wangwang.jpg";
        String targetFilename = "/Users/vincentfxz/Desktop/wangwang2.jpg";
        DataInputStream in = null;
        FileOutputStream out = null;
        try {
            File file = new File(filename);
            int length = (int)file.length();
            in = new DataInputStream(new FileInputStream(file));
            byte[] fileContent = new byte[length];
            in.readFully(fileContent);
            String imageStr = Base64.encode(fileContent);
//            System.out.println(imageStr);

            byte[] imageBytes = Base64.decode(imageStr);
            out = new FileOutputStream(new File(targetFilename));
            out.write(imageBytes);
            out.flush();



        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            if(null != in){
                try {
                    in.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            if(null != out){
                try {
                    out.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

        }
    }
}
