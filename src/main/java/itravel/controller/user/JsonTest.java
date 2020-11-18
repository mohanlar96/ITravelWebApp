package itravel.controller.user;
import itravel.model.MD5;
//import jdk.vm.ci.meta.Local;
import org.json.JSONObject;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Period;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Scanner;
import java.util.concurrent.TimeUnit;

public class JsonTest {


    public static void main(String[] args) {
//        String jsonStr = "{\"email\":\"test@example.com\",\"firstName\":\"Abcas\",\"lastName\":\"Unitel\",\"password\":\"Abc123\",\"gender\":\"M\",\"dateOfBirth\":\"12/08/1990\",\"city\":\"Ub\",\"state\":\"IA\",\"zipcode\":\"52257\",\"street\":\"1000N\"}";
//        JSONObject obj = new JSONObject(jsonStr);
//        System.out.println("full Name:"+obj.getString("firstName")+" "+obj.getString("lastName"));
//
//        String password = "abc123";
//
//        if(password.matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{6,}$")) {
//            System.out.println("good password");
//        } else {
//            System.out.println("bad password");
//        }
//
//        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM/dd/yyyy");
//        LocalDate date = LocalDate.parse(obj.getString("dateOfBirth"), formatter);
//        System.out.println("birthdate:"+date);
//        LocalDate dateNow = LocalDate.now();
//
//
//        System.out.println(Period.between(date,dateNow).getYears());
//        String password = "123";
//        MD5 md5 = new MD5();
//        String hashedPassword = md5.getMd5(password);
//        System.out.println(hashedPassword.toUpperCase());
        try {
            LocalDateTime currTime = LocalDateTime.now();
            ZoneId zoneId = ZoneId.systemDefault();
            long epoch = currTime.atZone(zoneId).toEpochSecond();
            System.out.println(epoch);

            Scanner myObj = new Scanner(System.in);  // Create a Scanner object
            System.out.println("Enter username");
            String userName = myObj.nextLine();  // Read user input

            currTime = LocalDateTime.now();
            epoch = currTime.atZone(zoneId).toEpochSecond();
            System.out.println(epoch);
        }
        catch (Exception exc) {

        }


    }
}
