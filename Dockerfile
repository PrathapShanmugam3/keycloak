FROM quay.io/keycloak/keycloak:21.1.1

# Add Aiven CA certificate
ADD https://downloads.aiven.io/ca/ca.pem /etc/ssl/certs/aiven-ca.pem
RUN chmod 644 /etc/ssl/certs/aiven-ca.pem

# Admin credentials
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Database configuration
ENV KC_DB=postgres
ENV KC_DB_URL=jdbc:postgresql://development-datacode.j.aivencloud.com:15555/defaultdb?sslmode=verify-full&sslrootcert=/etc/ssl/certs/aiven-ca.pem
ENV KC_DB_USERNAME=avnadmin
ENV KC_DB_PASSWORD=AVNS_KDMQeZDAKw2I13Rr776

# Connection pool settings
ENV KC_DB_POOL_INITIAL_SIZE=3
ENV KC_DB_POOL_MIN_SIZE=3
ENV KC_DB_POOL_MAX_SIZE=10

# Health checks
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

# Host settings
ENV KC_HOSTNAME_STRICT=false
ENV KC_HOSTNAME_STRICT_HTTPS=false

EXPOSE 8080
EXPOSE 8443

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start-dev", "--verbose", "--http-enabled=true"]

