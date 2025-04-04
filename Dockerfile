FROM quay.io/keycloak/keycloak:21.1.1

ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

ENV KC_DB=postgres
ENV KC_DB_URL=jdbc:postgresql://dpg-cum6s0lumphs738dpv2g-a.oregon-postgres.render.com:5432/datacode
ENV KC_DB_USERNAME=datacode_user
ENV KC_DB_PASSWORD=c3T0A86q6H8iAFDgdvEma49XVFx4CwVL

# Render sets PORT environment variable automatically
ENV KC_HTTP_PORT=${PORT}

# Expose that port (not strictly needed for Render, but good for local dev)
EXPOSE 10000

# Use the new Keycloak start script
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start-dev"]


