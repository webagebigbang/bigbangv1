**#Essential settings**

Edit the system-wide limits in /etc/security/limits.conf or /etc/security/limits.d/ by adding or modifying lines like:

*       soft    nofile  65536

*       hard    nofile  65536


  You may also need to adjust the sysctl settings for fs.inotify.max_user_watches. Add or modify the following line in /etc/sysctl.conf:

fs.inotify.max_user_watches = 65536

Then, apply the changes with:

sudo sysctl -p

Needed for ECK to run correctly without OOM errors

echo 'vm.max_map_count=524288' | sudo tee -a /etc/sysctl.d/vm-max_map_count.conf

# Alternatively can use (not persistent after restart):

# sudo sysctl -w vm.max_map_count=524288


# Needed by Sonarqube

echo 'fs.file-max=131072' | sudo tee -a /etc/sysctl.d/fs-file-max.conf
# Alternatively can use (not persistent after restart):  

# sudo sysctl -w fs.file-max=131072

# Also Needed by Sonarqube

ulimit -n 131072

ulimit -u 8192


# Load updated configuration

sudo sysctl --load --system


# Preload kernel modules, required by istio-init running on SELinux enforcing instances

sudo modprobe xt_REDIRECT

sudo modprobe xt_owner

sudo modprobe xt_statistic

# Persist kernel modules settings after reboots

printf "xt_REDIRECT\nxt_owner\nxt_statistic\n" | sudo tee -a /etc/modules

# Kubernetes requires swap disabled

# Turn off all swap devices and files (won't last reboot)

sudo swapoff -a




**# bibgbangv1**

git clone https://github.com/webagebigbang/bigbangv1.git

cd bibgbangv1

**#running installprerequiste script**

chmod +x installprereq.sh

./installprereq.sh
