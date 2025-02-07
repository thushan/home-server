# Squid HTTP Proxy

This stack sets up a really quick Squid Proxy locked to a known IP or IPs.

Modify the `squid.conf` with an IP or a hostname (for resolving a dynamic IP)

```
http_port 3128

acl myislandhome src my.islandhome.com
http_access allow myislandhome
```

In this example `myislandhome` is the key, and the hostname is `my.islandhome.com`.

You can add many:

```
http_port 3128

acl myislandhome src my.islandhome.com
http_access allow myislandhome

acl work src my.company.com
http_access allow work
```

etc.