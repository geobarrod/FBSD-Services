# FreeBSD services

## Purpose
Improvements to the original `service(8)` command to allow **multiple services management** in a single invocation.
Supported actions include:
`configtest`, `disable`, `enable`, `extracommands`, `forceconfigtest`, `forceextracommands`, `forcegracefulstop`,
`forcepoll`. `forcercvar`, `forcereload`, `forcerestart`, `forcestart`, `forcestatus`, `forcestop`, `forceupgrade`,
`gracefulstop`, `oneconfigtest`, `oneextracommands`, `onegracefulstop`, `onepoll`. `onercvar`, `onereload`, `onerestart`,
`onestart`, `onestatus`, `onestop`, `oneupgrade`, `poll`. `rcvar`, `reload`, `restart`, `start`, `status`, `stop`, `upgrade`.

---

## Usage

# Classic syntax (compatible with service(8))
```sh
services <service> <action>
```

# New syntax (multiple services at once)
```sh
services <action> <service1> [service2 ...]
```

---

## Options
- `-d` Enable debugging of rc.d scripts
- `-j <jail>` Perform actions within the named jail
- `-E n=val` Set variable `n` to `val` before executing the rc.d script
- `-e` Show services that are enabled
- `-R` Stop and start enabled local startup services
- `-l` List all scripts in `/etc/rc.d` and `$local_startup`
- `-r` Show the results of boot-time rcorder
- `-q` Quiet mode
- `-v` Verbose mode
- `-h` Show usage help

---

## Features
- Full compatibility with the original `service(8)` syntax.
- New syntax to manage multiple services in a single command.
- Support for enabling/disabling services directly via `sysrc`.
- Jail-aware execution (`-j` option).
- Verbose and quiet modes for flexible output.
- Safe: does not replace the original `service(8)` shell script, installed as `services`.

---

## Requirements
- FreeBSD 7.3 or newer.
- `sysrc(8)` available in base system.
- Root privileges for installation and service management.

---

## Examples

# Classic usage
```sh
services nginx enable
services nginx start
```

# Multiple services at once
```sh
services start nginx php_fpm postfix
services restart sshd unbound
```

# Enable/disable multiple services
```sh
services enable nginx php_fpm postfix
services disable sshd unbound
```

---

## Installation
Clone the repository and run the installer:
```sh
git clone https://github.com/geobarrod/FBSD-Services.git
cd FBSD-Services
sudo make install
```

---

## Uninstallation
To remove `services`:
```sh
cd FBSD-Services
sudo make uninstall
```

---

## Changelog

### v0.1 — 2026-01-05
- Initial release of **services**.
- Features:
  - Multiple service management in one command.
  - Support for `enable` and `disable` actions via `sysrc`.
  - Maintains compatibility with classic `service(8)` syntax.
  - Jail-aware execution.
  - Verbose and quiet modes.
