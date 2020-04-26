FROM openjdk:8



COPY /build/libs/serving-web-content-0.0.1.jar /serving-web-content-0.0.1.jar



CMD ["java", "-jar", "/serving-web-content-0.0.1.jar"]



EXPOSE 8888
