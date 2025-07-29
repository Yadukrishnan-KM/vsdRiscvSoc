
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

The installation steps are mainly taken from the Task1 pdf file which shared and some places modified because of incompactability and version issues. The one which I successfully done in my PC, it is given below. 

### Step 1: Install Dependencies
Added some missing libarries which not present in the pdf.

Install the required packages for building the toolchain, Spike, and PK: 

Open terminal from the Home location.

```bash
sudo apt-get update
sudo apt-get install -y autoconf automake autotools-dev curl python3 python3-pip libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev ninja-build git cmake libglib2.0-dev libboost-dev device-tree-compiler libc6-dev
```
![Dependencies installed] (images/installedDependencies.png)

### Step 2: Create Installation Directory
Set up a directory for the toolchain components and change terminal directory to the newly generated folder:

```bash
mkdir -p ~/riscv_toolchain
cd ~/riscv_toolchain
```
![Installatio directory created] (images/installationDirectoryCreated.png)

### Step 3: Install RISC-V GNU Toolchain

Note: The step given in the pdf is old, so I changed to new updated version one.
Clone and un-compress the RISC-V GNU toolchain and remove the compressed file:

```bash
wget https://github.com/xpack-dev-tools/riscv-none-elf-gcc-xpack/releases/download/v13.2.0-2/xpack-riscv-none-elf-gcc-13.2.0-2-linux-x64.tar.gz
tar -xvf xpack-riscv-none-elf-gcc-13.2.0-2-linux-x64.tar.gz
mv xpack-riscv-none-elf-gcc-13.2.0-2 riscv64-none-elf-gcc
rm xpack-riscv-none-elf-gcc-13.2.0-2-linux-x64.tar.gz
```
![Cloned and build RISC-V tool chain] (images/clonedRISCvToolChain.png)

Add to PATH:

```bash
export PATH=$HOME/riscv_toolchain/riscv64-none-elf-gcc/bin:$PATH
echo "export PATH=$HOME/riscv_toolchain/riscv64-none-elf-gcc/bin:\$PATH" >> ~/.bashrc
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
../configure --prefix=$HOME/riscv_toolchain/spike
make -j$(nproc)
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

### Step 5: Install RISC-V Proxy Kernel (PK)

Small modification in the configuration from the pdf.

Clone and build the RISC-V Proxy Kernel:

```bash
cd ~/riscv_toolchain
git clone https://github.com/riscv/riscv-pk
cd riscv-pk
mkdir build
cd build
../configure --prefix=$HOME/riscv_toolchain/pk --host=riscv-none-elf CC="riscv-none-elf-gcc -march=rv64ima_zicsr_zifencei -mabi=lp64 -DMEM_START=0x80000000" CXX="riscv-none-elf-g++ -march=rv64ima_zicsr_zifencei -mabi=lp64 -DMEM_START=0x80000000" LD="riscv-none-elf-ld"
make CFLAGS="-march=rv64ima_zicsr_zifencei -mabi=lp64 -O2 -std=gnu99 -Wall -D__NO_INLINE__ -mcmodel=medany -fno-delete-null-pointer-checks -fno-PIE -fno-stack-protector -U_FORTIFY_SOURCE -DMEM_START=0x80000000"
make install
```
![Cloned and build pk simulator] (images/pk.png)

Add to PATH:

```bash
export PATH=$HOME/riscv_toolchain/pk/riscv-none-elf/bin:$PATH
echo "export PATH=$HOME/riscv_toolchain/pk/riscv-none-elf/bin:\$PATH" >> ~/.bashrc
source ~/.bashrc
```
![Path added for pk simulator] (images/pathPk.png)

Verify:

```bash
which pk
file ~/riscv_toolchain/pk/riscv-none-elf/bin/pk
```
![Verified pksimulator] (images/verifiedPk.png)

### Step 6: Final Sanity Check

Final confirmation of all tools which we installed above

```bash
which riscv64-unknown-elf-gcc
riscv64-unknown-elf-gcc -v
which pk
which spike
spike -h
```
![Tools verification] (images/verifiedFinal.png)


### Step 7: Install Icarus Verilog

Clone and build the Icarus Verilog:

```bash
cd ~/riscv_toolchain
git clone https://github.com/steveicarus/iverilog.git
cd iverilog
git checkout --track -b v10-branch origin/v10-branch
git pull
chmod +x autoconf.sh
./autoconf.sh
./configure
make -j$(nproc)
sudo make install
```
![Cloned and build Icarus simulator] (images/icarus.png)
