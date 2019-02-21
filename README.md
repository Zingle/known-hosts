### known_hosts

SSH host keys for distribution.  Should contain only private zone hosts, such
as those ending in `.zingle.local` or `.zingle`.  Do not add public DNS names
like `.zingle.me` or bare host names like `dashboard01`.

Fetch host key with: `ssh-keyscan -t ecdsa <host> 2>/dev/null`

### Importing

```sh
# import public host keys for the current user only (this is probably what you want)
wget -qO- https://raw.githubusercontent.com/Zingle/known-hosts/master/import | bash
```

You can pass additional arguments to the `import` by appending `-s -- <arg> ...`
to `bash`.

```
Usage:
  import [-g]
  import [-g] {--public|--domain|<domain>}
  import --help

Import host keys into local system.

OPTIONS
  --help    Show this help.
  -g        Import host keys for all users (global).
  --public  Import public hosts (default unless -g specified).
  --domain  Import hosts for local domain (default if -g specified).
  <domain>  Import specified domain (e.g., 'zingle.local').
```

### IP Address Pinning

The `import` command will not add the host IP address to the known hosts.  This
is because the IP addresses are generally considered transient.  To avoid any
incidental key conflicts due to IP address recycling, you can add the following
to your `~/.ssh/config`:

```
Host *.zingle.me
    CheckHostIP no
```

This will be suitable for most use cases.  The one case where it is necessary
to have IP address pinning is when needing to connect over SSH to an IP address.
This happens with DNS pools, which do not always resolve to the same host.  To
pin IP addresses for all imported host keys, run the following:

```sh
# for current user host keys
wget -qO- https://raw.githubusercontent.com/Zingle/known-hosts/master/ippin | bash

# for global host keys
wget -qO- https://raw.githubusercontent.com/Zingle/known-hosts/master/ippin | sudo bash -s -- -g
```
