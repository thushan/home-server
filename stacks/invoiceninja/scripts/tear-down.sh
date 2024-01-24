#!/usr/bin/env bash
# Invoice Ninja Tear-down Script
STACK_NAME="invoiceninja"
NINJA_VOLUMES=(
    container_mariadb-data
    container_ninja-public
    container_ninja-storage
)

INFO=$(tput setaf 4)
INFF=$(tput setaf 3)
ENDMARKER=`tput sgr0`

show_info() {
    echo -e "${INFO}$1 ${ENDMARKER}"
}

show_info "Removing docker volumes..."
for volume in "${NINJA_VOLUMES[@]}"; do
	volume_name="${volume/container/$STACK_NAME}"
	if docker volume inspect "$volume_name" > /dev/null 2>&1; then
        show_info "Removing docker volume '${INFO}$volume_name${INFF}'..."
		docker volume rm $volume_name
	fi
done
show_info "Jobs Done /human-peasant"
