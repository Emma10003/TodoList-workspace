package com.my.todo.common.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig {

    @Bean
    public WebMvcConfigurer corsConfigurer() {
        return new WebMvcConfigurer() {
            @Override
            public void addCorsMappings(CorsRegistry registry) {
                // REST API CORS 설정
                // edge, chrome 의 경우 개발자가 개발을 하기 위한 테스트 모드 -> 매번 포트 번호가 바뀐다.
                // 1. debug print 를 사용해서 개발자가 작성한 데이터나 기능 결과를 확인할 수 있음.
                // 2. 테스트가 종료되고 나면 웹사이트를 필요로 하지 않으나,
                // 3. 상황에 따라 테스트 모드 웹사이트를 배포용 웹사이트로 사용할 수 있음.
                // 4. 다시 시작할 때 마다 변경되는 포트 번호를 고정적으로 변경해서 사용할 수 있다.
                registry.addMapping("/api/**")
                        /*
                        .allowedOriginPatterns("*") + .allowCredentials(true)
                        -> ✅ 가능

                        .allowedOrigins("*") + .allowCredentials(true)
                        -> ❌ 사용 불가
                        -> 함께 사용하면 .allowedOrigins 주소문자열 내부에 * 사용 불가!

                        .allowedOrigins("*") + .allowCredentials(false)
                        -> ✅ 가능
                        .allowedOrigins("특정주소:특정포트", "특정주소:특정포트") + .allowCredentials(false)
                        -> ✅ *가 없으므로 가능.

                        .allowCredentials(true)
                        -> 프론트엔드와 백엔드 사이에서 다음 정보들이 오갈 수 있다.
                           쿠키(로그인 세션 ID), 인증 헤더 Bearer <토큰> 같은 헤더, 클라이언트 보안 인증서 등
                            -> 만약 false로 하면
                                -> 어라?? 보안 설정 때문에 쿠키 못 보내네^^ 유감ㅎ 매번 로그인 다시하삼
                                    -> 로그인이 풀리는 현상 발생.

                        .allowedOrigins("*") -> 내 친구인데 아무나 다 와^^ (무책임함 -> 브라우저가 차단)
                        .allowedOriginPatterns("*") -> 제가 허용한 접속해도 되는 리스트들이에용 -> 네 이쪽 사람들만 뜰어오세요.
                        * : 배포에서 치명적인 오류 사유가 될 수 있으므로, 반드시 개발 단계에서만 사용할 것!
                         */
                        .allowedOriginPatterns(
                                "http://localhost:*",   // 윈도우, 웹, ios 시뮬레이터 모든 포트 허용
                                "http://10.0.2.2:*"     // 안드로이드 에뮬레이터 모든 포트 허용
                        )
                        .allowCredentials(true)
                        .allowedMethods("GET","POST","PUT","DELETE","PATCH","OPTIONS")
                        .allowedHeaders("*");

                // WebSocket CORS 설정 추가
                // registry.addMapping("/ws/**")
                //         .allowedOrigins("http://localhost:57472",
                //                 "http://localhost:3000",
                //                 "http://localhost:54829",
                //                 "https://insta-front-orcin.vercel.app/")
                //         .allowCredentials(true)
                //         .allowedMethods("GET","POST","PUT","DELETE","PATCH","OPTIONS")
                //         .allowedHeaders("*");
            }
        };
    }

    // @Override
    // public void addResourceHandlers(ResourceHandlerRegistry registry) {
    //     registry.addResourceHandler("/profile_images/**")
    //             .addResourceLocations("file:" + fileUploadPath + "/");
    //
    //     registry.addResourceHandler("/story_images/**")
    //             .addResourceLocations("file:" + storyUploadPath + "/");
    //
    //     registry.addResourceHandler("/post_images/**")
    //             .addResourceLocations("file:" + postUploadPath + "/");
    // }
}
