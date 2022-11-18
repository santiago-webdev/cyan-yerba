# TODO Rename the repo
# TODO REMOVE THIS FILE

## Guide to install OpenSUSE MicroOS, KDE Plasma Variant

### While installing
## Encryption and dvorak
I use dvorak, so I would like to keep typing the same keystrokes as if I were using a dvorak layout although while decrypting the drive it's going to be in english(US) since that's how opensuse microos is shipped by default.
A workaround would be to do this: type the password with the qwerty english(US) layout as if you were typing it in dvorak, write it on a paper or remember it
and change the layout to dvorak in the installer, in the last screen when you are changing the settings click on "Partition", "Guided partinioning"
will let you encrypt the drive, when asked for a password type with the dvorak layout the password that you remembered, this way each time you want to decrypt your computer you'll have to type the password with the exact same physical key sequence  as if you were to type it in the dvorak layout, I do this because it's the easiest way, because I remember the password from muscle memory.

## Autologin and kde wayland session
Enable it in the installer when setting your user, after rebooting into your system go to /etc/sysconfig/displaymanager and change DISPLAYMANAGER_XSERVER="Xorg" to "Wayland", and reboot, if that doesn't help you'll also need to configure sddm, go to /etc/sddm.conf.d/autologin.conf and add

[Autologin]
User=st
Session=plasmawayland

## Change the default shell to zsh
sudo transactional-update # First update and reboot to be sure
sudo transactional-update pkg install zsh # Install zsh
chsh -s /bin/zsh # And then
systemctl reboot
