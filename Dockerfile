FROM quay.io/keycloak/keycloak:21.1.1

# Set environment variables
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Expose port 10000
EXPOSE 10000


ENTRYPOINT [ "keycloak", "start-dev", "--http-port=${PORT:-8080}" ]
