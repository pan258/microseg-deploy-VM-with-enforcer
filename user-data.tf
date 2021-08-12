locals {
    
    user_data = <<EOF
#!/usr/bin/bash
sudo apt-get update && \
sudo apt-get -y upgrade && \
sudo apt-get install -y apache2  && \
sudo systemctl stop ufw && sudo systemctl disable ufw && \
sudo systemctl enable apache2 && \
sudo systemctl restart apache2 && \
curl -o /tmp/apoctl https://download.aporeto.com/prismacloud/app/apoctl/linux/apoctl && \
sudo chmod +x /tmp/apoctl && \
sudo /tmp/apoctl enforcer install linux --confirm --api ${var.cns_api} --namespace ${var.cns_namespace} && \
rm -f /tmp/apoctl
sudo echo "done"
EOF

}