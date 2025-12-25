package util;

import jakarta.persistence.AttributeConverter;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import java.util.Base64;

public class DataConverter implements AttributeConverter<String, String> {
    private static final String ALGORITHM = "AES";
    private static final String KEY = "";
    @Override
    public String convertToDatabaseColumn(String s) {
       try{
           if(s == null){
               return null;
           }
           Cipher cipher = Cipher.getInstance(ALGORITHM);
           SecretKeySpec certificate = new SecretKeySpec(KEY.getBytes(), ALGORITHM);
           cipher.init(Cipher.ENCRYPT_MODE, certificate);

           return Base64.getEncoder().encodeToString(cipher.doFinal(s.getBytes()));
       }
       catch (Exception e){
           e.printStackTrace();
           throw new RuntimeException();
       }
    }

    @Override
    public String convertToEntityAttribute(String s) {
       try{
           if(s == null)
               return null;
           Cipher cipher = Cipher.getInstance(ALGORITHM);
           SecretKeySpec certificate = new SecretKeySpec(KEY.getBytes(), ALGORITHM);
           cipher.init(Cipher.DECRYPT_MODE, certificate);

           return new String(cipher.doFinal(Base64.getDecoder().decode(s)));
       }
       catch (Exception e){
           e.printStackTrace();
           throw new RuntimeException();
       }
    }
}
