### known_hosts

SSH host keys for distribution.  Should contain only private zone hosts, such
as those ending in `.zingle.local` or `.zingle`.  Do not add public DNS names
like `.zingle.me` or bare host names like `dashboard01`.

Fetch host key with: `ssh-keyscan -t ecdsa <host> 2>/dev/null`

### Importing

```sh
# import public host keys for the current user only (this is probably what you want)
wget -qO- https://raw.githubusercontent.com/Zingle/known-hosts/master/import | bash
wget -qO- https://raw.githubusercontent.com/Zingle/known-hosts/master/import | bash -s -- --public

# import host keys for local domain for the current user only
wget -qO- https://raw.githubusercontent.com/Zingle/known-hosts/master/import | bash -s -- --domain

# import host keys for .zingle domain for the current user only
wget -qO- https://raw.githubusercontent.com/Zingle/known-hosts/master/import | bash -s zingle

# import host keys for local domain for all users
wget -qO- https://raw.githubusercontent.com/Zingle/known-hosts/master/import | sudo bash -s -- -g
wget -qO- https://raw.githubusercontent.com/Zingle/known-hosts/master/import | sudo bash -s -- -g --domain

# import public host keys for all users
wget -qO- https://raw.githubusercontent.com/Zingle/known-hosts/master/import | sudo bash -s -- -g --public

# import host keys for .zingle domain for all users
wget -qO- https://raw.githubusercontent.com/Zingle/known-hosts/master/import | sudo bash -s -- -g zingle
```
