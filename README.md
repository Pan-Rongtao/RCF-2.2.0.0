# RCF-2.2.0.0
RCF2.2

#尽可能不修改源码和编译方式

修改点：
1、demo/cmake下的CMakeLists.txt，SET(BOOST_ROOT C:/boost_1_49_0)修改为SET(BOOST_ROOT C:/local/boost_1_66_0)，此处根据自己机器上的boost安装目录修改即可
2、如果demo/Server.cpp添加#include <iterator>，否则vs下可能无法编译通过

#编译
1、如何编译vs
mkdir build
cd build
cmake ../demo/cmake
打开sln后编译结果在demo/cmake/bin下

2、如何编译x11
与编译vs步骤一致

3、如何编译linux-arm
