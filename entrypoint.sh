#!/bin/bash
sleep 2

cd /home/container

# Download FiveM Server Files
# wget https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/431-d055d83842b6391e88381fb13c421ee5f1811185/fx.tar.xz
wget https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/446-8a058b67e5f11677c380a330f677e768e2b2a705/fx.tar.xz
tar xf fx.tar.xz
rm fx.tar.xz

# Clone server data
git clone https://github.com/citizenfx/cfx-server-data.git server-data

MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo "${MODIFIED_STARTUP}"

export USER_ID=$(id -u)
export GROUP_ID=$(id -g)

# Run the Server
${MODIFIED_STARTUP}
