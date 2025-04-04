FROM quay.io/keycloak/keycloak:21.1.1

ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Expose that port (not strictly needed for Render, but good for local dev)
EXPOSE 10000

# Use the new Keycloak start script
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start-dev"]


