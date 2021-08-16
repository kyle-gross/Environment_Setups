#!/usr/bin/env bash
# WSL2 - Ubuntu-18.04 - Tensorflow 1.12
# Enables CUDA
# https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=WSL-Ubuntu&target_version=2.0&target_type=deb_local

pip3 install tensorflow-gpu==1.12

wget https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/cuda-wsl-ubuntu.pin
sudo mv cuda-wsl-ubuntu.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/11.4.1/local_installers/cuda-repo-wsl-ubuntu-11-4-local_11.4.1-1_amd64.deb
sudo dpkg -i cuda-repo-wsl-ubuntu-11-4-local_11.4.1-1_amd64.deb
sudo apt-key add /var/cuda-repo-wsl-ubuntu-11-4-local/7fa2af80.pub
sudo apt-get update
sudo apt-get -y install cuda

##################
# OTHER VERSION: #
##################
#!/usr/bin/env bash
# WSL2 - Ubuntu-18.04 - Tensorflow 1.12
# Enables CUDA
# https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=WSL-Ubuntu&target_version=2.0&target_type=deb_local

# Install tensorflow-gpu 1.12
pip install tensorflow-gpu==1.12

# Install Cuda
# MEDIUM ARTICLE https://medium.com/swlh/how-to-install-the-nvidia-cuda-toolkit-11-in-wsl2-88292cf4ab77
sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
sudo sh -c 'echo "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64 /" > /etc/apt/sources.list.d/cuda.list'
sudo apt-get update
sudo apt-get -y install cuda-toolkit-11-0 cuda-toolkit-10-2
sudo sh -c 'echo "deb http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64 /" > /etc/apt/sources.list.d/nvidia-machine-learning.list'
sudo apt-get install --yes --no-install-recommends cuda-10-2 libcudnn7=7.6.5.32-1+cuda10.2 libcudnn7-dev=7.6.5.32-1+cuda10.2
#
wget https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/cuda-wsl-ubuntu.pin
sudo mv cuda-wsl-ubuntu.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/11.4.1/local_installers/cuda-repo-wsl-ubuntu-11-4-local_11.4.1-1_amd64.deb
sudo apt-key add /var/cuda-repo-wsl-ubuntu-11-4-local/7fa2af80.pub
sudo dpkg -i cuda-repo-wsl-ubuntu-11-4-local_11.4.1-1_amd64.deb
sudo apt-get update
sudo apt-get -y install cuda

# BUILDING TENSORFLOW PACKAGE
# Install dependancies
pip install -U --user pip numpy wheel
pip install -U --user keras_preprocessing --no-deps
sudo apt-get -y install pkg-config zip g++ zlib1g-dev unzip python python3-dev

# Install Bazel
sudo apt -y install apt-transport-https curl gnupg
curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor > bazel.gpg
sudo mv bazel.gpg /etc/apt/trusted.gpg.d/
echo "deb [arch=amd64] https://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/ap
sudo apt update && sudo apt install bazel

# Clone Tensorflow Repository
echo "source /usr/local/lib/bazel/bin/bazel-complete.bash" >> ~/.bashrc
git clone https://github.com/tensorflow/tensorflow.git
cd tensorflow
git checkout r1.12
# Run ./configure
# cd ~
# rm -rf tensorflow


####################
# ANOTHER VERSION: #
####################
#!/usr/bin/env bash
# WSL2 - Ubuntu-18.04 - Tensorflow 1.12

# Medium article - 
# https://medium.com/swlh/how-to-install-the-nvidia-cuda-toolkit-11-in-wsl2-88292cf4ab77

# CUDA
# Get NVIDIA Public Key:
sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/7fa2af80.pub
# Add NVIDIA to Source List Directory:
sudo sh -c 'echo "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64 /" > /etc/apt/sources.list.d/cuda.list'
# Update the Source List and Source List Directory:
sudo apt-get update
# Install NVIDIA CUDA Toolkit 11:
sudo apt-get --yes install cuda-toolkit-11-0 cuda-toolkit-10-2
# Add NVIDIA to the Source List Directory:
sudo sh -c 'echo "deb http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64 /" > /etc/apt/sources.list.d/nvidia-machine-learning.list'
# Update the Source List and Source List Directory:
sudo apt-get update
# Install the CUDA and cuDNN Libraries:
sudo apt-get install --yes --no-install-recommends cuda-10-2 libcudnn7=7.6.5.32-1+cuda10.2 libcudnn7-dev=7.6.5.32-1+cuda10.2
# Install the TensorRT Library:
sudo apt-get install --yes --no-install-recommends libnvinfer6=6.0.1-1+cuda10.2 libnvinfer-dev=6.0.1-1+cuda10.2 libnvinfer-plugin6=6.0.1-1+cuda10.2
# Verify Install success
# cd /usr/local/cuda-11.0/samples/4_Finance/BlackScholes
# sudo make
# ./BlackScholes
