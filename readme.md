# Home Server Configs

These are my generic home server configurations for various things.

Most of the work in this repo is written in docker compose stacks and is ideal for use with [dockge](https://github.com/louislam/dockge).

## Get it

```bash
$ git clone https://github.com/thushan/home-server.git
```

## Structure

* [~/stacks](./stacks/) - Docker Compose stacks.
  * `compose.yml` - Contains reusable dockerised templates with variables
  * `template.env` - Contains the template of the env file with variables you'll need to update.
* [~/home-assistant](./home-assistant/) - Home Assistant specific configurations
* [~/kubernetes](./kubernetes) - Kubernetes configurations
* [~/scripts](./scripts) - Scripts for helpers/tasks
* [~/services](./services) - Configurations for various services