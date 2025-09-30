# ----- 1) 빌드 스테이지 -----
FROM gradle:8.4-jdk17 AS builder
WORKDIR /workspace

# 컨텍스트가 레포 root라면 board 소스만 복사
COPY board/ ./

# Gradle 캐시 활용 + 테스트 생략
RUN --mount=type=cache,target=/home/gradle/.gradle \
    ./gradlew clean bootJar -x test

# ----- 2) 런타임 스테이지 -----
FROM eclipse-temurin:17-jre
WORKDIR /app

# 빌드 산출물 복사 (파일명은 프로젝트에 맞게 조정해도 됨)
COPY --from=builder /workspace/build/libs/*.jar /app/app.jar

EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/app.jar"]
