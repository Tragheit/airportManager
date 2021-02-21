package com.tragheit.airportManager.config;

import javax.sql.DataSource;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableJpaRepositories(basePackages = "com.tragheit.airportManager.repository")
@EnableTransactionManagement
class MySqlDataBaseConnection {

	@Bean 
	@ConfigurationProperties(prefix = "spring.datasource")
	public DataSource getDataSource() { 
	    return DataSourceBuilder.create().build(); 
	}
}