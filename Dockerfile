FROM quay.io/keycloak/keycloak:latest 
 
USER root 
 
USER keycloak 
RUN /opt/keycloak/bin/kc.sh build --db=postgres --features=scripts,authorization,account2,account-api 
 
EXPOSE 8080 
 
ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start", "--optimized"] 
