FROM quay.io/keycloak/keycloak:21.1.1

ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin


ENV KC_DB=postgres
ENV KC_DB_URL=jdbc:postgresql://development-datacode.j.aivencloud.com:15555/defaultdb?sslmode=require
ENV KC_DB_USERNAME=avnadmin
ENV KC_DB_PASSWORD=AVNS_KDMQeZDAKw2I13Rr776

ENV QUARKUS_TRANSACTION_MANAGER_ENABLE_RECOVERY=true


# Expose that port (not strictly needed for Render, but good for local dev)
EXPOSE 8080

# Use the new Keycloak start script
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start-dev"]


