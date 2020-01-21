#/bin
# root
# reboot

cd /tmp

wget http://cdn2.ime.sogou.com/dl/index/1571302197/sogoupinyin_2.3.1.0112_amd64.deb
apt -y install ./sogoupinyin_2.3.1.0112_amd64.deb
rm -f sogoupinyin_2.3.1.0112_amd64.deb
fcitx-config-gtk3

echo ARIS UBUNTU RESTART COMPLETE
