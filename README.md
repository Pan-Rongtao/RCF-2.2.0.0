# RCF-2.2.0.0
RCF2.2

#�����ܲ��޸�Դ��ͱ��뷽ʽ

�޸ĵ㣺
1��demo/cmake�µ�CMakeLists.txt��SET(BOOST_ROOT C:/boost_1_49_0)�޸�ΪSET(BOOST_ROOT C:/local/boost_1_66_0)���˴������Լ������ϵ�boost��װĿ¼�޸ļ���
2�����demo/Server.cpp���#include <iterator>������vs�¿����޷�����ͨ��
3��demo/cmake�µ�CMakeLists.txt������޸�QNX��أ��ر�ע��add_definitions(-DRCF_FEATURE_IPV6=0)��������QNX����runtime�����Ҳ���ip��������֧��IPV6
4��demo/cmake�µ�CMakeLists.txt��ɾ��-DBOOST_ALL_NO_LIB������vs�����޷�����
5��include\RCF\util\Platform\OS\BsdSockets.hpp�ļ���include\RCF\util\Platform\OS\Unix\BsdSockets.hpp�ļ���src\RCF\ByteOrdering.cpp���defined(__QNX__)�ж���֧��QNX��������
6��include\RCF\ClientStub.hpp��491�У����public�ؼ��֣�����mac osx���޷�����ͨ������enrol�޸�Ϊpublic


#���루boost��������취��װ���߱��룩
1����α���vs
mkdir build
cd build
cmake ../demo/cmake
��sln���������demo/cmake/bin��

2����α���x11
mkdir build
cd build
cmake ../demo/cmake
make
��������demo/cmake/bin��

3����α���linux-arm
. env_setup.sh --platform=g6s

4����α���qnx700
. <qnxroot>/qnxsdp-env.sh
mkdir build
cd build
cmake -DCMAKE_TOOLCHAIN_FILE=../demo/cmake/qnx_7.0.0_linux_x86_64.cmake ../demo/cmake/
make
��������demo/cmake/bin��

#����
windows, x11, qnx_x86_64, mac osx ֮���ͨ�ž���ͨ������
linux-arm��qnx_aarch64δ����