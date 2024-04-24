# profile_xfs_quota

![pdk-validate](https://github.com/ncsa/puppet-profile_monitoring/workflows/pdk-validate/badge.svg)
![yamllint](https://github.com/ncsa/puppet-profile_monitoring/workflows/yamllint/badge.svg)

## Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with profile_xfs_quota](#setup)
1. [Usage - Configuration options and additional functionality](#usage)

## Description

This puppet profile sets up an xfs quota script to check quota enabled xfs volumes, and automates it via telegraf. 


## Setup

Include profile_xfs_quota in a puppet profile
```
include ::profile_xfs_quota
```

## Usage

Define the path of your xfs volume with `profile_xfs_quota::quota_path`

- `profile_xfs_quota::quota_path: "/path/to/xfsmount"`

## Reference

See: [REFERENCE.md](REFERENCE.md)

## Limitations

The quota checks will only work on xfs volumes with quotas enabled.


## Development


This Common Puppet Profile is managed by NCSA for internal usage.
