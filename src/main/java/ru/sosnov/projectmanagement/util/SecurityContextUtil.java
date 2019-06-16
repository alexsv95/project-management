package ru.sosnov.projectmanagement.util;

import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import ru.sosnov.projectmanagement.model.User;

public class SecurityContextUtil {
    public static User getAuthUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication instanceof UsernamePasswordAuthenticationToken)
            return (User) authentication.getPrincipal();
        else
            return null;

    }

}
