# 빌드 스테이지
FROM gradle:8.8.0-jdk17 AS builder

## 작업 디렉토리 설정
WORKDIR /app

## gradle 캐시를 최적화하기 위해 build.gradle 및 settings.gradle 파일 복사
COPY build.gradle settings.gradle ./

## 종속성 다운로드를 최적화하기 위해 프로젝트 초기화 수행
RUN gradle --no-daemon init

## 소스 코드 및 리소스 복사
COPY src ./src

## 애플리케이션 빌드
### `--no-daemon`: gradle 데몬을 사용하지 않고 빌드를 진행 (docker 환경에서 일반적)
### `-x test`: 테스트 테스크 제외
RUN gradle --no-daemon build -x test

# 실행 스테이지
FROM openjdk:17-jdk-slim AS runtime

## 작업 디렉토리 설정
WORKDIR /app

## 빌드된 JAR 파일 복사
COPY --from=builder /app/build/libs/*.jar ./app.jar

## 포트 노출
EXPOSE 8080

## 애플리케이션 실행
CMD ["java", "-jar", "app.jar"]