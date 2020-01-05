[Unit]
Description=monstache sync service

[Service]
Type=notify
ExecStart=/home/ubuntu/build/linux-amd64/monstache -f /home/ubuntu/config.toml -worker d &  monstache -f /home/ubuntu/config.toml -worker s

[Install]
WantedBy=multi-user.target


sudo nano /lib/systemd/system/monstache.service
sudo systemctl daemon-reload
sudo systemctl start monstache.service

