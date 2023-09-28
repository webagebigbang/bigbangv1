sudo apt install git -y
sudo apt update -y && sudo apt install apt-transport-https ca-certificates curl gnupg lsb-release -y && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null && sudo apt update -y && sudo apt install docker-ce docker-ce-cli containerd.io -y && sudo usermod --append --groups docker $USER
wget -q -O - https://github.com/k3d-io/k3d/releases/download/v5.4.1/k3d-linux-amd64 > k3d
echo 50f64747989dc1fcde5db5cb82f8ac132a174b607ca7dfdb13da2f0e509fda11 k3d | sha256sum -c | grep OK
if [ $? == 0 ]; then chmod +x k3d && sudo mv k3d /usr/local/bin/k3d; fi
wget -q -O - https://dl.k8s.io/release/v1.23.5/bin/linux/amd64/kubectl > kubectl
echo 715da05c56aa4f8df09cb1f9d96a2aa2c33a1232f6fd195e3ffce6e98a50a879 kubectl | sha256sum -c | grep OK
if [ $? == 0 ]; then chmod +x kubectl && sudo mv kubectl /usr/local/bin/kubectl; fi
sudo ln -s /usr/local/bin/kubectl /usr/local/bin/k
wget -q -O - https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv4.5.4/kustomize_v4.5.4_linux_amd64.tar.gz > kustomize.tar.gz
echo 1159c5c17c964257123b10e7d8864e9fe7f9a580d4124a388e746e4003added3 kustomize.tar.gz | sha256sum -c | grep OK
if [ $? == 0 ]; then tar -xvf kustomize.tar.gz && chmod +x kustomize && sudo mv kustomize /usr/local/bin/kustomize && rm kustomize.tar.gz ; fi  
wget -q -O - https://get.helm.sh/helm-v3.8.1-linux-amd64.tar.gz > helm.tar.gz
echo d643f48fe28eeb47ff68a1a7a26fc5142f348d02c8bc38d699674016716f61cd helm.tar.gz | sha256sum -c | grep OK
if [ $? == 0 ]; then tar -xvf helm.tar.gz && chmod +x linux-amd64/helm && sudo mv linux-amd64/helm /usr/local/bin/helm && rm -rf linux-amd64 && rm helm.tar.gz ; fi  
