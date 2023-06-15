
CREATE DATABASE IF NOT EXISTS fluxa;

CREATE USER IF NOT EXISTS fluxa_admin@'%' IDENTIFIED BY 'SU@8ytWqNM4Nv2kJ';
SET PASSWORD FOR fluxa_admin@'%' = PASSWORD('SU@8ytWqNM4Nv2kJ');
REVOKE ALL PRIVILEGES ON *.* FROM 'fluxa_admin'@'%'; 
GRANT ALL PRIVILEGES ON *.* TO 'fluxa_admin'@'%' REQUIRE NONE WITH GRANT OPTION MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0; 