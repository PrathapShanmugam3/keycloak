FROM quay.io/keycloak/keycloak:21.1.1

# Set environment variables for database connection
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin
ENV KC_DB=postgres
ENV KC_DB_URL=jdbc:postgresql://dpg-cum6s0lumphs738dpv2g-a.oregon-postgres.render.com:5432/datacode
ENV KC_DB_USERNAME=datacode_user
ENV KC_DB_PASSWORD=c3T0A86q6H8iAFDgdvEma49XVFx4CwVL

# Expose port (Render provides $PORT dynamically)
EXPOSE 8080

# Start Keycloak in dev mode with Render’s assigned port
ENTRYPOINT [ "keycloak", "start-dev", "--http-port=${PORT:-8080}" ]

