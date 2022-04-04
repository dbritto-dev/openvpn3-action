# OpenVPN 3 Action

This action starts a VPN session using OpenVPN 3 and give you the option to run
any bash script during the session. We recommend you to store your config files
in GitHub using [encrypted secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets).

> **Note:** this action only support linux (`ubuntu`).
> Please use one of the [virtual environments](https://github.com/actions/virtual-environments#available-environments)
> for linux (`ubuntu`) supported by GitHub Actions.

**Reference Links:**

- [OpenVPN 3 for Linux](https://openvpn.net/cloud-docs/openvpn-3-client-for-linux/)
- [OpenVPN 3 and auth-user-pass](https://openvpn.net/blog/openvpn-3-linux-and-auth-user-pass/)
- [GitHub Encrypted Secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets)

# Usage

```yaml
- uses: dbritto-dev/openvpn3-action@main
  with:
    # Description: OpenVPN 3 profile file (.ovpn/.conf).
    # Encoded: Base64
    # Required: true
    vpn-client-config: ""
    # Description: OpenVPN 3 Autoload config file (.autoload). If this input is provided we use
    # `openvpn3-autoload` instead of `openvpn3` to start the VPN session.
    # OpenVPN 3 does support `auth-user-pass` through `openvpn3-autoload` utility.
    # To read more about OpenVPN 3 and `auth-user-pass` go to https://openvpn.net/blog/openvpn-3-linux-and-auth-user-pass/
    # Encoded: Base64
    # Required: false
    # Default: ''
    vpn-autoload-config: ""
    # Description: Bash script to run after the session was started and before the session was closed.
    # Required: true
    script: |
      echo "Hello Developer!"
```

# Scenarios

- [Basic usage using OpenVPN 3 profile](#basic-usage-using-openvpn-3-profile)
- [Using OpenVPN 3 profile wih auth-user-pass](#using-openvpn-3-profile-wih-auth-user-pass)

## Using OpenVPN 3 profile

```yaml
on: [push]

jobs:
  testing:
    runs-on: ubuntu-latest
    steps:
      - uses: dbritto-dev/openvpn3-action@main
        with:
          vpn-client-config: ${{ secrets.VPN_CLIENT_CONFIG }}
          script: |
            sudo openvpn3 sessions-list
```

## Using OpenVPN 3 profile wih auth-user-pass

```yaml
on: [push]

jobs:
  testing:
    runs-on: ubuntu-latest
    steps:
      - uses: dbritto-dev/openvpn3-action@main
        with:
          vpn-client-config: ${{ secrets.VPN_CLIENT_CONFIG }}
          vpn-autoload-config: ${{ secrets.VPN_AUTOLOAD_CONFIG }}
          script: |
            sudo openvpn3 sessions-list
```

# License

The scripts and documentation in this project are released under the [MIT License](/LICENSE)
