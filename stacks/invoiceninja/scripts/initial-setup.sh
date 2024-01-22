#!/usr/bin/env bash
# Invoice Ninja Initial Setup Script
STACK_NAME="invoiceninja"
LINK_CONFIG="/opt/home-server/stacks/invoiceninja/config"
LINK_TARGET="/opt/stacks/$STACK_NAME/config"
NINJA_VOLUMES=(
    container_mariadb-data
    container_ninja-public
    container_ninja-storage
)

INFO=$(tput setaf 4)
ENDMARKER=`tput sgr0`

show_info() {
    echo -e "${INFO}$1 ${ENDMARKER}"
}

show_info "Creating docker volumes..."
for volume in "${NINJA_VOLUMES[@]}"; do
	volume_name="${volume/container/$STACK_NAME}"
	if docker volume inspect "$volume_name" > /dev/null 2>&1; then
		show_info "Volume '$volume_name' already exists."
	else
		show_info "Volume '$volume_name' does not exist. Creating..."
		docker volume create "$volume_name"
	fi
	show_info "Changing ownership of docker volumes..."
	# credit: https://www.reddit.com/r/selfhosted/comments/11l6wkq/how_to_set_up_invoice_ninja_under_docker_using/
	mount_point=$(docker volume inspect --format '{{ .Mountpoint }}' "$volume_name")
	chown 1500:1500 $mount_point
done

show_info "Creating shell links..."

if [ -L "$LINK_CONFIG" ] && [ "$(readlink -- "$LINK_CONFIG")" = "$LINK_TARGET" ]; then
    echo "Link '$LINK_CONFIG' already exists and points to '$LINK_TARGET'."
else
    echo "Creating symbolic link '$LINK_CONFIG' that points to '$LINK_TARGET'..."
	ln -s "$LINK_CONFIG" "$LINK_TARGET"
fi

show_info "Jobs Done /human-peasant"
