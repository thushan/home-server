#!/usr/bin/env bash
# Invoice Ninja Tear-down Script

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

show_info "Removing docker volumes..."
for volume in "${NINJA_VOLUMES[@]}"; do
    docker volume rm $volume
done
show_info "Jobs Done /human-peasant"