package com.nttdata.api_gateway;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * Clase principal del microservicio API Gateway.
 * <p>
 * Implementa el patrón de puerta de enlace con Spring Cloud Gateway:
 * centraliza el punto de entrada de las peticiones del banco y enruta las
 * rutas públicas (por ejemplo, {@code /customers/**}) hacia el
 * microservicio de clientes registrado en Eureka.
 *
 * @author NTT Data
 */
@SpringBootApplication
public class ApiGatewayApplication {

	/**
	 * Punto de entrada de la aplicación Spring Boot.
	 *
	 * @param args argumentos de línea de comandos proporcionados al arrancar
	 */
	public static void main(String[] args) {
		SpringApplication.run(ApiGatewayApplication.class, args);
	}

}
