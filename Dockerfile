FROM quay.io/keycloak/keycloak:latest AS builder

# Enable health and metrics
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

# Temporary database config for build stage
ENV KC_DB=postgres
ENV KC_DB_URL=jdbc:postgresql://temp-db:5432/keycloak
ENV KC_DB_USERNAME=postgres
ENV KC_DB_PASSWORD=postgres

WORKDIR /opt/keycloak
# Generate temporary TLS certificate
RUN keytool -genkeypair -storepass password -storetype PKCS12 -keyalg RSA -keysize 2048 -dname "CN=server" -alias server -ext "SAN:c=DNS:localhost,IP:127.0.0.1" -keystore conf/server.keystore
RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:latest

# Copy built artifacts
COPY --from=builder /opt/keycloak/ /opt/keycloak/

# Aiven PostgreSQL configuration
ENV KC_DB=postgres
ENV KC_DB_URL=postgres://avnadmin:AVNS_KDMQeZDAKw2I13Rr776@development-datacode.j.aivencloud.com:15555/defaultdb?sslmode=require
ENV KC_DB_USERNAME=avnadmin
ENV KC_DB_PASSWORD=AVNS_KDMQeZDAKw2I13Rr776

# Host configuration
ENV KC_HOSTNAME=localhost
ENV KC_HOSTNAME_STRICT=false
ENV KC_HOSTNAME_STRICT_HTTPS=false

# Connection pool settings
ENV KC_DB_POOL_INITIAL_SIZE=5
ENV KC_DB_POOL_MIN_SIZE=5
ENV KC_DB_POOL_MAX_SIZE=20

# Health checks
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

EXPOSE 8080
EXPOSE 8443

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start", "--optimized"]

