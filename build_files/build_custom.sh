#This will be where additional customizations will be added copy of ublue build.sh with additional packages installed and setup
#cachyos kernel, various gnome-centric customizations to make it more WinLike for new users WITH the alternative of COSMIC desktop. 
#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 install -y tmux 
dnf5 install -y 'cosmic-ext-*'
dnf5 install -y rust-just scdoc seatd
dnf5 install -y @cosmic-desktop-environment
dnf5 install -y kernel-cachyos kernel-cachyos-devel-matched akmods dwarves
dnf5 install -y gnome-shell-extension-dash-to-panel gnome-shell-extension-system-monitor-applet gnome-shell-extension-apps-menu gnome-shell-extension-pop-shell gnome-shell-extension-just-perfection gnome-shell-extension-user-theme gnome-shell-extension-blur-my-shell

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging
dnf5 -y copr enable bieszczaders/kernel-cachyos
dnf5 -y copr enable ligenix/cosmic-ext
dnf5 -y copr enable ryanabx/cosmic-epoch 



#### Example for enabling a System Unit File

systemctl enable podman.socket
