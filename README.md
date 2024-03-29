# Ansible Role: PHP-XDebug
Mainly a copy of [ansible-role-php-xdebug](https://github.com/geerlingguy/ansible-role-php-xdebug) but with fluxus php5 dependency


Installs PHP [XDebug](http://xdebug.org/) on Linux servers.

## Requirements

None.

## Role Variables

Available variables are listed below, along with default values (see `defaults/main.yml`):

    workspace: /root

Where Xdebug setup files will be downloaded and built.

    php_xdebug_version: 2.2.4

The version of Xdebug to be installed (see [Xdebug docs](http://xdebug.org/docs/install) for a current listing).

    php_xdebug_default_enable: 1
    php_xdebug_coverage_enable: 1

Whether to enable XDebug coverage and default exception handling or not. Disable these for slightly improved PHP performance, enable these to use XDebug to the fullest extent.

    php_xdebug_cli_enable: 1

Whether xdebug is enabled for the CLI.

    php_xdebug_module_path: /usr/lib64/php/modules

The path where `xdebug.so` will be installed.

    php_xdebug_remote_enable: "false"

Whether remote debugging is enabled.

    php_xdebug_remote_connect_back: "false"

If this is set to true, Xdebug will respond to any request from any IP address; use only for local development on non-public installations!

    php_xdebug_remote_host: localhost
    php_xdebug_remote_port: "9000"

The host and port on which Xdebug will listen.

    php_xdebug_remote_log: /tmp/xdebug.log

The location of the xdebug log (useful if you're having trouble connecting).

    php_xdebug_idekey: sublime.xdebug

The IDE key to use in the URL when making Xdebug requests (e.g. `http://example.local/?XDEBUG_SESSION_START=sublime.xdebug`).

    php_xdebug_max_nesting_level: 100

The maximimum function nesting level before Xdebug bails and throws a fatal exception.

## Dependencies

  - geerlingguy.php

## Example Playbook

    - hosts: webservers
      roles:
        - { role: geerlingguy.php-xdebug }

## License

MIT / BSD

## Author Information

This role was created in 2014 by [Jeff Geerling](http://jeffgeerling.com/), author of [Ansible for DevOps](http://ansiblefordevops.com/).
