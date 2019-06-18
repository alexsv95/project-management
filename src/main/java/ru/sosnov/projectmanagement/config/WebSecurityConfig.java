package ru.sosnov.projectmanagement.config;

import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import ru.sosnov.projectmanagement.config.security.AuthProvider;

@EnableWebSecurity
@RequiredArgsConstructor
@Configuration
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {


    private final AuthProvider authProvider;

    @Override
    public void configure(WebSecurity web) throws Exception {
        web
                .ignoring()
                .antMatchers("/resources/**", "/static/**", "/public/**");
    }


    @Override
    protected void configure(HttpSecurity http) throws Exception{
        http.cors().and().csrf().disable();

        http.authorizeRequests()
                .antMatchers("/resources/**", "/static/**", "/public/**").permitAll()
                .antMatchers("/project/new").hasRole("ADMIN")
                .antMatchers("/project/add").hasRole("ADMIN")
                .antMatchers("/project/**").authenticated()
                .antMatchers("/users/**").authenticated()
                .antMatchers("/user/**").authenticated()
                .antMatchers("/dashboard/**").authenticated()
                .anyRequest().permitAll();
//                .antMatchers("/**").authenticated();

        http
                .formLogin()
                .failureUrl("/login?error=true")
                .loginPage("/login")
                .permitAll()
                .defaultSuccessUrl("/project/manage")
                .and()
                .logout().logoutUrl("/logout")
                .permitAll();

        http.authenticationProvider(authProvider);
    }
}
