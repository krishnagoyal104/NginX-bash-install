# Accessing the remote server  
sudo chmod 600 $1    
ssh-add $1  
ssh $2@$3    

# Install NginX:  
sudo apt-get update  
wget http://nginx.org/download/nginx-1.15.8.tar.gz    
tar -zxvf nginx-1.15.8.tar.gz  
cd nginx-1.15.8  
sudo apt-get install build-essential  
sudo apt-get install libpcre3 libpcre3-dev zlib1g zlib1g-dev libssl-dev 
./configure --sbin-path=/usr/bin/nginx --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --with-pcre --pid-path=/var/run/nginx.pid --with-http_ssl_module      
make      
sudo make install  
echo "$(cat nginx.conf)" > /etc/nginx/nginx.conf   

# Running NginX:  
nginx    

# Using Systemd:  
touch /lib/systemd/system/nginx.service      
echo "$(cat config.txt)" > /lib/systemd/system/nginx.service          
sudo systemctl daemon-reload  //to refresh changes to nginx.service  
sudo systemctl start nginx  
sudo systemctl status nginx  
sudo systemctl enable nginx  //to start nginx automatically on boot  

 








