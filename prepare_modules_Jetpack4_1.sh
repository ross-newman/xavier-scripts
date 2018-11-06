cd /usr/src/
sudo wget -O public_sources_31.0.2.tbz2 'https://developer.nvidia.com/embedded/dlc/l4t-sources-31-0-2'
sudo tar --no-same-owner -xf public_sources_31.0.2.tbz2 public_sources/kernel_src.tbz2
sudo tar --no-same-owner -xf public_sources/kernel_src.tbz2
zcat /proc/config.gz | sudo tee kernel/kernel-4.9/.config >/dev/null
sudo sed -i '/^EXTRAVERSION/ c EXTRAVERSION = -tegra' kernel/kernel-4.9/Makefile
sudo cp linux-headers-4.9.108-tegra/{modules.builtin,modules.order,Module.symvers,System.map} kernel/kernel-4.9/
sudo ln -snf /usr/src/kernel/kernel-4.9 /lib/modules/4.9.108-tegra/build
sudo make -C /lib/modules/"$(uname -r)"/build modules_prepare
cd -
echo "Module system ready you can now build your driver..."
echo 
