FROM quay.io/keycloak/keycloak:21.1.1

ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Database configuration
ENV KC_DB=postgres
ENV KC_DB_URL=jdbc:postgresql://development-datacode.j.aivencloud.com:15555/defaultdb
ENV KC_DB_USERNAME=avnadmin
ENV KC_DB_PASSWORD=AVNS_KDMQeZDAKw2I13Rr776

# Connection pool settings
ENV KC_DB_POOL_INITIAL_SIZE=5
ENV KC_DB_POOL_MIN_SIZE=5
ENV KC_DB_POOL_MAX_SIZE=20
ENV KC_DB_POOL_MAX_WAIT=30000

# Enable transaction recovery
ENV QUARKUS_TRANSACTION_MANAGER_ENABLE_RECOVERY=true

# Health checks
ENV KC_HEALTH_ENABLED=true

EXPOSE 8080

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start-dev", "--verbose"]  # Added --verbose for more detailed logs

