
#include <algorithm>
#include <iostream>
#include <string>
#include <vector>
#include <iterator>

#include <RCF/RCF.hpp>

#include "MyService.hpp"

class MyServiceImpl
{
public:
    // Reverses the order of strings in the vector.
    void reverse(std::vector<std::string> &v)
    {
        std::cout << "Reversing a vector of strings...\n";
        std::vector<std::string> w;
        std::copy(v.rbegin(), v.rend(), std::back_inserter(w));
        v.swap(w);
    }
};

int main(int argc, char **argv)
{
    RCF::RcfInitDeinit rcfInit;

    // Start a TCP server on port 50001, and expose MyServiceImpl.
	std::string ip = "127.0.0.1";
	if (argc == 2)
		ip = argv[1];
    MyServiceImpl myServiceImpl;
    RCF::RcfServer server( RCF::TcpEndpoint(ip, 50001) );
    server.bind<MyService>(myServiceImpl);
    server.start();

    std::cout << "Press Enter to exit..." << std::endl;
    std::cin.get();

    return 0;
}
