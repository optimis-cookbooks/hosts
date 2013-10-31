Chef Hosts Cookbook
===================

Use **hostsfile** LWRP to update /etc/hosts entries based on attributes.

## Example

1. localhost
  "localhost" is for configure localhost name and aliases for 127.0.0.1. It is suggested to set this attribute in each node.

      "localhost": {
        "ip": "127.0.0.1",
        "name": "funny.hostname",
        "comment": "Woooooo", //optional
        "priority": 20,       //optional
        "aliases": [          //optional
          "localhost",
          "localhost.localdomain"
        ]
      }

2. hosts
  "hosts" is an array of hostname configuration. The following is an example of node attributes for the default localhost /etc/host entry.

      "hosts": [
        {
          "ip": "127.0.0.127",
          "name": "internal.hostname",
          "comment": "...", //optional
          "priority": 11,   //optional
          "aliases": [      //optional
            "host1",
            "host2"
          ]
        }
      ]
