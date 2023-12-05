#! /bin/bash
sudo yum update -y
sudo yum install -y git
sudo amazon-linux-extras install -y nginx1
sudo systemctl start nginx
cd ~
touch ~/.bashrc
/usr/bin/curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
sleep 10
source ~/.bashrc
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
nvm install 16
/usr/bin/git clone https://github.com/sugia/React-Landing-Page-Template.git
sleep 10
cd React-Landing-Page-Template
npm install
sleep 60
npm run build
sleep 60
sudo rm -rf /usr/share/nginx/html/*
sudo cp -r ./build/* /usr/share/nginx/html