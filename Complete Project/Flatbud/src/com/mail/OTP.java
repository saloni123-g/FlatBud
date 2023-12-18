package com.mail;

import java.util.Random;

public class OTP {
    public String skKeyGenerate()
    {
        char[] chars = "1234567890".toCharArray();
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < 5; i++) {
            char c = chars[random.nextInt(chars.length)];
            sb.append(c);
        }
        String output = sb.toString();
        return output;
    }
    public static void main(String[] args) {
		OTP otp=new OTP();
		String otpe= otp.skKeyGenerate();
		System.out.println(otpe);
	}
}
