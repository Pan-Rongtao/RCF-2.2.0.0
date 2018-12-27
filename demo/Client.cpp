
#include <algorithm>
#include <iostream>
#include <iterator>
#include <string>
#include <vector>

#include "MyService.hpp"

#include <RCF/RCF.hpp>

int main(int argc, char **argv)
{
    RCF::RcfInitDeinit rcfInit;

    try
    {
        // Setup a vector of strings.
        std::vector<std::string> v;
        v.push_back("one");
        v.push_back("two");
        v.push_back("three");

        // Print them out.
        std::cout << "Before:\n";
        std::copy(
            v.begin(), 
            v.end(), 
            std::ostream_iterator<std::string>(std::cout, "\n"));

        // Make the call.
		std::string ip = "127.0.0.1";
		if (argc == 2)
			ip = argv[1];
        RcfClient<MyService>( RCF::TcpEndpoint(ip, 50001) ).reverse(v);

        // Print them out again. This time they are in reverse order.
        std::cout << "\nAfter:\n";
        std::copy(
            v.begin(), 
            v.end(), 
            std::ostream_iterator<std::string>(std::cout, "\n"));
    }
    catch(const RCF::Exception & e)
    {
        std::cout << "Caught exception:\n";
        std::cout << e.getError().getErrorString() << std::endl;
        return 1;
    }

    return 0;
}
