cms-infrastructure
==================

Provides infrastructure configuration for the TES Drupal CMS Service.  Configuration is provided in the form of Ansible scripts.

Configuration is provided for five different environments:

- vagrant (local dev)
- development
- staging
- live
- test runner (Jenkins)

Each has a separate inventory file listing the members of the group, and can have a separate file in the group_vars directory which includes configuration variables specific to that group/environment.

TES-specific roles are included within this repository.  Otherwise, they're included as git submodules from remote sources.
