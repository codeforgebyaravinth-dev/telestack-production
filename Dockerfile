FROM quay.io/keycloak/keycloak:latest as builder
WORKDIR /opt/keycloak
RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:latest
COPY --from=builder /opt/keycloak/ /opt/keycloak/

# Database configuration
ENV KC_DB=postgres
ENV KC_DB_URL=jdbc:postgresql://turntable.proxy.rlwy.net:41405/railway
ENV KC_DB_USERNAME=postgres
ENV KC_DB_PASSWORD=ECWXKppLoTZvsszBnoOHusEMBGqabgXE

# Keycloak configuration
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=your-secure-admin-password-here
ENV KC_HOSTNAME_STRICT=false
ENV KC_HOSTNAME_STRICT_HTTPS=false
ENV KC_PROXY=edge
ENV KC_HTTP_ENABLED=true

# Start Keycloak
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start"]
