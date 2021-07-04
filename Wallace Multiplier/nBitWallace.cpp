#include <iostream>
#include <string>
#include <fstream>

int main(int argc, char **argv){
    if (argc < 2){
        std::cout << "ERROR: Unspecified size of multiplier\n";
        return 0;
    }
    
    int size = 0;

    try{
        std::string s = argv[1];
        size = std::stoi(s);
    }
    catch(...){
        std::cout << "ERROR: The size specified is invalid!\n";
        return 0;
    }

    std::ofstream outfile("Wallace.v", std::ios::out);

    outfile << "module " << size << "BitWallace(\ninput [" << size - 1 << ":0] a,\ninput [" << size - 1 << ":0] b,\n output [";
}