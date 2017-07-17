function openstack
  set -l os_auth_url https://identity-3.$KUBECTL_CONTEXT.cloud.sap:443/v3
  set -l os_password (security find-generic-password -a $USER -s openstack -w)

  set -l credentials -e OS_AUTH_URL=$os_auth_url \
                     -e OS_IDENTITY_API_VERSION=3 \
                     -e OS_PROJECT_NAME=$OS_PROJECT_NAME \
                     -e OS_PROJECT_DOMAIN_NAME=$OS_PROJECT_DOMAIN_NAME \
                     -e OS_USER_DOMAIN_NAME=$OS_PROJECT_DOMAIN_NAME \
                     -e OS_USERNAME=$USER \
                     -e OS_PASSWORD=$os_password \
                     -e OS_REGION_NAME=$KUBECTL_CONTEXT

  docker run -ti $credentials hub.global.cloud.sap/monsoon/cc-openstack-cli:latest -- bash
end
