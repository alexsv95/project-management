package ru.sosnov.projectmanagement.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import ru.sosnov.projectmanagement.model.User;
import ru.sosnov.projectmanagement.model.enums.RoleType;
import ru.sosnov.projectmanagement.repository.UserRepository;
import ru.sosnov.projectmanagement.util.SecurityContextUtil;

import java.nio.charset.Charset;
import java.util.Random;

@Controller
@RequiredArgsConstructor
public class LoginController {

    private final UserRepository userRepository;

    @RequestMapping(value = "/login", method = {RequestMethod.GET, RequestMethod.HEAD})
    public String login(
            @RequestParam(value = "error", required = false) String error,
            ModelMap map) {
        if(error != null) {
            map.addAttribute("error", "Invalid username or password!");
        }
        User user = SecurityContextUtil.getAuthUser();
        if(user != null)
            return "redirect:/";
        else
            return "login";
    }

    @PostMapping("/register")
    public String register(@RequestParam String email, @RequestParam String password) {
        User user = new User();
        String salt = generateSalt(7);
        user.setEmail(email);
        user.setPassword(md5(password, salt));
        user.setRole(RoleType.USER);
        user.setSalt(salt);
        userRepository.save(user);
        return "redirect:/login";
    }

    private static String generateSalt(int lenght) {
        char[] chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890".toCharArray();
        StringBuilder stringBuilder = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < lenght; i++) {
            char c = chars[random.nextInt(chars.length)];
            stringBuilder.append(c);
        }
        return stringBuilder.toString();
    }

    public static String md5(String line, String salt) {
        String password = mergePassSalt(line, salt);
        try {
            java.security.MessageDigest md = java.security.MessageDigest.getInstance("MD5");
            byte[] array = md.digest(password.getBytes(Charset.forName("UTF-8")));
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < array.length; ++i) {
                sb.append(Integer.toHexString((array[i] & 0xFF) | 0x100), 1, 3);
            }
            return sb.toString();
        } catch (java.security.NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return null;
    }

    private static String mergePassSalt(String password, String salt) {
        return password + salt;
    }
}
