#!/usr/bin/env bash
# https://docs.firefly-iii.org/how-to/firefly-iii/installation/docker/#start-the-container_1
head /dev/urandom | LC_ALL=C tr -dc 'A-Za-z0-9' | head -c 32 && echo