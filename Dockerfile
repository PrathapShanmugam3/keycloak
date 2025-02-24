FROM quay.io/keycloak/keycloak:21.1.1

# Set Keycloak Admin credentials
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Set JVM memory limits
ENV JAVA_OPTS="-Xmx512m -Xms256m"

# Expose Keycloak on port 10000
EXPOSE 10000

# Start Keycloak with development mode and custom port
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev", "--http-port=10000"]
