FROM quay.io/keycloak/keycloak:latest

# Switch to root to install curl for health checks
USER root
RUN apt-get update && apt-get install -y curl && apt-get clean

# Switch back to keycloak user
USER keycloak

# Build Keycloak with CORRECT features
RUN /opt/keycloak/bin/kc.sh build --db=postgres --features=scripts,authorization,account-api,recovery-codes

EXPOSE 8080

# Start Keycloak
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--optimized"]
