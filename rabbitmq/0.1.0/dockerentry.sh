#!/bin/sh

cp /run.sh /opt/rancher/bin/

cat > /etc/rabbitmq/definitions.json <<EOF
{
  "policies": [
    {
      "vhost": "/",
      "name": "ha",
      "pattern": "",
      "definition": {
        "ha-mode": "all",
        "ha-sync-mode": "automatic",
        "ha-sync-batch-size": 5
      }
    }
  ]
}
EOF

exec /confd $@
