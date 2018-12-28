# RCF-2.2.0.0
RCF2.2

#尽可能不修改源码和编译方式

修改点：
1、demo/cmake下的CMakeLists.txt，SET(BOOST_ROOT C:/boost_1_49_0)修改为SET(BOOST_ROOT C:/local/boost_1_66_0)，此处根据自己机器上的boost安装目录修改即可
2、如果demo/Server.cpp添加#include <iterator>，否则vs下可能无法编译通过
3、demo/cmake下的CMakeLists.txt，添加修复QNX相关，特别注意add_definitions(-DRCF_FEATURE_IPV6=0)，否则在QNX下有runtime错误，找不到ip，估计无支出IPV6
4、demo/cmake下的CMakeLists.txt，删除-DBOOST_ALL_NO_LIB，否则vs可能无法编译
5、include\RCF\util\Platform\OS\BsdSockets.hpp文件，include\RCF\util\Platform\OS\Unix\BsdSockets.hpp文件，src\RCF\ByteOrdering.cpp添加defined(__QNX__)判断以支持QNX环境编译
6、include\RCF\ClientStub.hpp第491行，添加public关键字，否则mac osx下无法编译通过，把enrol修改为public


#编译（boost需自行想办法安装或者编译）
1、如何编译vs
mkdir build
cd build
cmake ../demo/cmake
打开sln后编译结果在demo/cmake/bin下

2、如何编译x11
mkdir build
cd build
cmake ../demo/cmake
make
编译结果在demo/cmake/bin下

3、如何编译linux-arm
. env_setup.sh --platform=g6s

4、如何编译qnx700
. <qnxroot>/qnxsdp-env.sh
mkdir build
cd build
cmake -DCMAKE_TOOLCHAIN_FILE=../demo/cmake/qnx_7.0.0_linux_x86_64.cmake ../demo/cmake/
make
编译结果在demo/cmake/bin下

#测试
windows, x11, qnx_x86_64, mac osx 之间的通信均已通过测试
linux-arm，qnx_aarch64未测试