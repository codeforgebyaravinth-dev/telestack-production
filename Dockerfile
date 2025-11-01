FROM quay.io/keycloak/keycloak:latest as builder
WORKDIR /opt/keycloak
RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:latest
COPY --from=builder /opt/keycloak/ /opt/keycloak/

# Database configuration
ENV KC_DB=postgres
ENV KC_DB_URL=${DATABASE_URL}
ENV KC_DB_USERNAME=${DATABASE_USERNAME}
ENV KC_DB_PASSWORD=${DATABASE_PASSWORD}

# Keycloak configuration
ENV KEYCLOAK_ADMIN=${KEYCLOAK_ADMIN}
ENV KEYCLOAK_ADMIN_PASSWORD=${KEYCLOAK_ADMIN_PASSWORD}
ENV KC_HOSTNAME_STRICT=false
ENV KC_HOSTNAME_STRICT_HTTPS=false
ENV KC_PROXY=edge

# Start Keycloak
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start"]
