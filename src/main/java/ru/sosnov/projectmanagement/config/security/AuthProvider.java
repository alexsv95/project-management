package ru.sosnov.projectmanagement.config.security;

import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;
import ru.sosnov.projectmanagement.model.User;
import ru.sosnov.projectmanagement.service.UserService;

import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Component
@RequiredArgsConstructor
public class AuthProvider implements AuthenticationProvider {

    private final UserService userService;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        String name = authentication.getName();
        String password = authentication.getCredentials().toString();
        User user = userService.findByEmail(name);
        if(user == null)
            throw new UsernameNotFoundException("Incorrect login");
        if(Objects.equals(md5(password, user.getSalt()), user.getPassword())){
            System.out.println("Success");
            List<GrantedAuthority> grantedAuthorities = new ArrayList<>();
            grantedAuthorities.add(new SimpleGrantedAuthority("ROLE_"+user.getRole().name()));
            return new UsernamePasswordAuthenticationToken(user, null, grantedAuthorities);
        } else {
            throw new BadCredentialsException("Invalid password");
        }
    }

    @Override
    public boolean supports(Class<?> auth) {
        return auth.equals(UsernamePasswordAuthenticationToken.class);
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
