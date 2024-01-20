#!/usr/bin/env bash
# credit: https://www.reddit.com/r/selfhosted/comments/11l6wkq/how_to_set_up_invoice_ninja_under_docker_using/
# 
chown 1500:1500 /var/lib/docker/volumes/invoiceninja_ninja-public/_data/
chown 1500:1500 /var/lib/docker/volumes/invoiceninja_ninja-storage/_data/