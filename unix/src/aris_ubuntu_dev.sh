#/bin/bash
# root

cd /tmp

# Eclipse
wget http://mirror.csclub.uwaterloo.ca/eclipse/technology/epp/downloads/release/2019-09/R/eclipse-java-2019-09-R-linux-gtk-x86_64.tar.gz
tar xvzf eclipse-java-2019-09-R-linux-gtk-x86_64.tar.gz -C /opt
rm -f eclipse-java-2019-09-R-linux-gtk-x86_64.tar.gz
ln -s /opt/eclipse/eclipse /usr/bin/eclipse
echo '[Desktop Entry]
Version=1.0
Type=Application
Name=Eclipse
Icon=/opt/eclipse/icon.xpm
Exec="/opt/eclipse/eclipse" %f
Comment=Eclipse IDE
Categories=Development;IDE;
Terminal=false
StartupWMClass=eclipse' > /usr/share/applications/eclipse.desktop

# CLion
snap install clion --classic

# VS Code
snap install code --classic

# Atom
snap install atom --classic

# LaTex
apt -y install texlive-full texlive-xetex texstudio

# R & RStudio
apt -y install r-base r-base-dev
wget https://download1.rstudio.org/desktop/bionic/amd64/rstudio-1.2.5019-amd64.deb
apt -y install ./rstudio-1.2.5019-amd64.deb
rm -f rstudio-1.2.5019-amd64.deb

# MatLab
# wget https://esd.mathworks.com/R2019b/R2019b/installers/web/matlab_R2019b_glnxa64.zip?__gda__=1573658419_832551dc37662b320672e70e3aa8f0bf&dl_id=LHRK7wxv&ext=.zip -O matlab_R2019b_glnxa64.zip
# unzip -q matlab_R2019b_glnxa64.zip -d matlab
# ./matlab/install
# rm -fr matlab matlab_R2019b_glnxa64.zip
# apt -y install matlab-support

# VirtalBox & Vagrant
wget https://download.virtualbox.org/virtualbox/6.0.14/virtualbox-6.0_6.0.14-133895~Ubuntu~bionic_amd64.deb -O virtualbox-6.0_6.0.14-133895_Ubuntu_bionic_amd64.deb
wget https://releases.hashicorp.com/vagrant/2.2.6/vagrant_2.2.6_x86_64.deb
apt -y install ./virtualbox-6.0_6.0.14-133895_Ubuntu_bionic_amd64.deb ./vagrant_2.2.6_x86_64.deb
rm -f virtualbox-6.0_6.0.14-133895_Ubuntu_bionic_amd64.deb vagrant_2.2.6_x86_64.deb

su -c 'cd ~
cp /mnt/wind/Aris/iCloudDrive/Desktop/COMPSCI\ 230/Vagrantfile .
chmod 644 Vagrantfile
vagrant up
vagrant halt' aris

echo ARIS UBUNTU DEV COMPLETE
