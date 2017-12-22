Redmine Impersonate
===================

Redmine plugin allowing administrators to securely login as any user with
a single click.


Installation
------------

Follow standard Redmine plugin installation procedure.

  * Move `redmine_impersonate/` to `$REDMINE/plugins/`.


Configuration
-------------

This plugin has no settings. When installed, administrators will be able to
temporarily login as other user by clicking "Impersonate" button in his
profile and edit page. To stop impersonating, click "Cancel" next to
impersonating message at the top.


Requirements
------------

Since this program depend on another software, it was written with compatibility
in mind to keep it functional across many version of software it uses.

  * Redmine (3.0+)
  * Redmine (2.0+, use [redmine-2.x branch](https://github.com/rgtk/redmine_impersonate/tree/redmine-2.x))
