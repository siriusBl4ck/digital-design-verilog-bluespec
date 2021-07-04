#include <nBitCLA.h>
#include <sstream>
#include <math.h>

class nBitCLA{
    int size = 0;
    nBitCLA(int _size){
        size = _size;
    }

    std::string genVerilog(){
        std::stringstream code;

        code << "module star(\n";
        code << "input [1:0] a,\n";
        code << "input [1:0] b,\n";
        code << "output [1:0] c\n";
        code << ");\n";

        code << "assign c[0] = (b[0] & a[0]) | b[1];\n";
        code << "assign c[1] = (b[0] & a[1]) | b[1];\n";

        code << "endmodule\n";

        code << "module fa(\n";
        code << "input a,\n";
        code << "input b,\n";
        code << "output s\n";
        code << ");\n";

        code << "assign s = a ^ b ^ cin;\n";

        code << "endmodule\n";

        code << "module cla(\n";
        code << "input [7:0] a,\n";
        code << "input [7:0] b,\n";
        code << "output [7:0] s,\n";
        code << "output cout\n";
        code << ");\n";

        code << "wire [" << 2*(size) + 1 << ":0] s1, ";


        for (int i = 2; i <= 2 + std::log2(size); i++){
            code << "s" << i;
            if (2 + std::log2(size) - i < 1){
                code << ";\n";
            }
            else{
                code << ", ";
            }
        }

        code << "assign s1[1:0] = 2'b00;\n";
        
        for (int i = 0; i < )
        for (int i = 0; i < size; i++){
            code << "assign s";
        }
    }
};