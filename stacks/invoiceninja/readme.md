# InvoiceNinja

<table>
  <tr>
    <th>Home</th>
    <td><a href="https://www.invoiceninja.com">invoiceninja.com</a></td>
  </tr>
  <tr>
    <th>Stack</th>
    <td><a href="https://github.com/invoiceninja/dockerfiles">@invoiceninja/dockerfiles</a> |  <a href="https://hub.docker.com/r/invoiceninja/invoiceninja/">invoiceninja/invoicenina</a></td>
  </tr>
  <tr>
    <th>Commit</th>
    <td><a href="https://github.com/invoiceninja/dockerfiles/commit/d766e8284c8529a726fce57bb09d31066d9cf8bf"><code>d766e8284c8529a726fce57bb09d31066d9cf8bf</code></a> 18/01/2024</td>
  </tr>
</table>

## Setup

**CONTEXT** These instructions are for [Dockge](https://github.com/louislam/dockge) but should work for all.

* Create the stack with `compose.yml` but don't run it
* Create a link to the `config` folder in the container's stack folder.
* Start the InvoiceNinja up.

```bash
$ ln -s /opt/home-server/stack/invoiceninja/config /opt/stacks/invoiceninja/config
```

Then set the permissions on the Docker Volumes that are used to be the InvoiceNinja user (1500).

```bash
chown 1500:1500 /var/lib/docker/volumes/invoiceninja_ninja-public/_data/
chown 1500:1500 /var/lib/docker/volumes/invoiceninja_ninja-storage/_data/
```

## References

* [reddit:Guide to setup InvoiceNinja](https://www.reddit.com/r/selfhosted/comments/11l6wkq/how_to_set_up_invoice_ninja_under_docker_using/) - by @UntouchedWagons
* [MariaDB Docker Environment Variables](https://mariadb.com/kb/en/mariadb-server-docker-official-image-environment-variables/)