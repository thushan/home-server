#!/usr/bin/env bash
# Invoice Ninja Initial Setup Script

NINJA_VOLUMES=(
    invoiceninja_mariadb-data
    invoiceninja_ninja-public
    invoiceninja_ninja-storage
)

INFO=$(tput setaf 4)
ENDMARKER=`tput sgr0`

show_info() {
    echo -e "${INFO}$1 ${ENDMARKER}"
}

show_info "Creating docker volumes..."
for volume in "${NINJA_VOLUMES[@]}"; do
    docker volume create $volume
done

show_info "Changing ownership of docker volumes..."
# credit: https://www.reddit.com/r/selfhosted/comments/11l6wkq/how_to_set_up_invoice_ninja_under_docker_using/
chown 1500:1500 /var/lib/docker/volumes/invoiceninja_ninja-public/_data/
chown 1500:1500 /var/lib/docker/volumes/invoiceninja_ninja-storage/_data/

show_info "Creating shell links..."

ln -s /opt/home-server/stacks/invoiceninja/config /opt/stacks/invoiceninja/config

show_info "Jobs Done /human-peasant"