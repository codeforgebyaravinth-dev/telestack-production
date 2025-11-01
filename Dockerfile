FROM quay.io/keycloak/keycloak:latest

# Use your SUPABASE database
ENV KC_DB=postgres
ENV KC_DB_URL=jdbc:postgresql://db.byyfvcfxyomwojpfiazw.supabase.co:5432/postgres
ENV KC_DB_USERNAME=postgres
ENV KC_DB_PASSWORD=Qwerty098*#@@#*

# Admin login
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin123

# Network settings
ENV KC_HOSTNAME_STRICT=false
ENV KC_PROXY=edge

# Build and start
RUN /opt/keycloak/bin/kc.sh build
CMD ["/opt/keycloak/bin/kc.sh", "start"]
