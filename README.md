### known_hosts

SSH host keys for distribution.  Should contain only private zone hosts, such
as those ending in `.zingle.local` or `.zingle`.  Do not add public DNS names
like `.zingle.me` or bare host names like `dashboard01`.

Fetch host key with: `ssh-keyscan -t ecdsa <host> 2>/dev/null`
