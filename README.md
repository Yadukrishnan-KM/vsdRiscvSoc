<img width="1166" height="218" alt="image" src="https://github.com/user-attachments/assets/681d38a3-441d-45d3-892a-31e297cff72f" /># vsdRiscvSoc
Contains projects, assignments, etc... related to Workshop on India's RISC-V program, Cohort 2. Aim is to design and tape out a  RISC-V reference chip using the SCL180 (Semi-Conductor Laboratory 180nm) CMOS process.

# Task1 - RISC-V Toolchain Setup Tasks & Uniqueness Test

Task 1 task is to setup the RISC-V tool chain and successfully compile and run a test program.
Here explaining all the steps to follow, errors faced, debug steps and final results.
This project sets up a RISC-V development environment using the following tools:

- **Ubuntu** (Native installation or via VirtualBox on Windows)
- **Spike** (RISC-V ISA Simulator)
- **Proxy Kernel (pk)** (Boot loader used with Spike)
- **Icarus Verilog** (Verilog simulation tool)

My system specifications: Ubuntu 22.04 LTS, available disk space: >400GB

The installation steps are mainly taken from the Task1 pdf file which shared and some places modified because of incompactability and version issues. The one which i successfully done is given below. 

### Step 1: Install Dependencies

Install the required packages for building the toolchain, Spike, and PK: Open terminal from the Home location.

```bash
sudo apt-get update
sudo apt-get install -y autoconf automake autotools-dev curl python3 python3-pip libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev ninja-build git cmake libglib2.0-dev libboost-dev
```
![Dependencies installed] (images/installedDependencies.png)

### Step 2: Create Installation Directory
Set up a directory for the toolchain components and change directory to the newly generated folder:

```bash
mkdir -p ~/riscv_toolchain
cd ~/riscv_toolchain
```
![Installatio directory created] (images/installationDirectoryCreated.png)

### Step 3: Install RISC-V GNU Toolchain

Note: The step given in the pdf is old, so I changed to new updated version one.
Clone and build the RISC-V GNU toolchain:

```bash
wget https://github.com/xpack-dev-tools/riscv-none-elf-gcc-xpack/releases/download/v13.2.0-2/xpack-riscv-none-elf-gcc-13.2.0-2-linux-x64.tar.gz
tar -xvf xpack-riscv-none-elf-gcc-13.2.0-2-linux-x64.tar.gz
mv xpack-riscv-none-elf-gcc-13.2.0-2 riscv64-unknown-elf-gcc
```
![Cloned and build RISC-V tool chain] (images/clonedRISCvToolChain.png)

Add to PATH:

```bash
export PATH=$HOME/riscv_toolchain/riscv64-unknown-elf-gcc/bin:$PATH
echo "export PATH=$HOME/riscv_toolchain/riscv64-unknown-elf-gcc/bin:\$PATH" >> ~/.bashrc
source ~/.bashrc
```
![Path added for RISC-V toolchain] (images/pathRiscVtoolChain.png)

Verify:

```bash
which riscv-none-elf-gcc
riscv-none-elf-gcc --version
```
![Verified RISC-V toolchain] (images/verifiedRiscVtoolChain.png)

### Step 4: Install Spike Simulator

Clone and build the Spike RISC-V ISA simulator:

```bash
cd ~/riscv_toolchain
git clone https://github.com/riscv/riscv-isa-sim
cd riscv-isa-sim
mkdir build
cd build
../configure --prefix=$HOME/riscv_toolchain/spike --host=riscv-none-elf --with-isa=rv64ima_zicsr_zifencei
make
make install
```
![Cloned and build spike simulator] (images/clonedSpike.png)

Add to PATH:

```bash
export PATH=$HOME/riscv_toolchain/spike/bin:$PATH
echo "export PATH=$HOME/riscv_toolchain/spike/bin:\$PATH" >> ~/.bashrc
source ~/.bashrc
```
![Path added for spike simulator] (images/pathSpike.png)

Verify:

```bash
which spike
spike -h
```
![Verified spike simulator] (images/verifiedSpike.png)

