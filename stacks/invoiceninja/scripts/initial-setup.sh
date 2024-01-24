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
INFF=$(tput setaf 3)
ENDMARKER=`tput sgr0`

show_info() {
    echo -e "${INFO}$1 ${ENDMARKER}"
}

show_info "Creating docker volumes..."
for volume in "${NINJA_VOLUMES[@]}"; do
	volume_name="${volume/container/$STACK_NAME}"
	if docker volume inspect "$volume_name" > /dev/null 2>&1; then
		show_info "Volume '${INFF}$volume_name${INFF}' already exists."
	else
		show_info "Volume '${INFF}$volume_name${INFF}' does not exist. Creating..."
		docker volume create "$volume_name"
	fi
	show_info "Changing ownership of docker volumes..."
	mount_point=$(docker volume inspect --format '{{ .Mountpoint }}' "$volume_name")
	# credit: https://www.reddit.com/r/selfhosted/comments/11l6wkq/how_to_set_up_invoice_ninja_under_docker_using/
	chown 1500:1500 $mount_point
done

show_info "Creating shell links..."

if [ -L "$LINK_CONFIG" ] && [ "$(readlink -- "$LINK_CONFIG")" = "$LINK_TARGET" ]; then
    show_info "Link '${INFF}$LINK_CONFIG${INFF}' already exists and points to '${INFF}$LINK_TARGET${INFF}'."
else
    show_info "Creating symbolic link '${INFF}$LINK_CONFIG${INFF}' that points to '${INFF}$LINK_TARGET${INFF}'..."
	ln -s "$LINK_CONFIG" "$LINK_TARGET"
fi

show_info "Jobs Done!"
