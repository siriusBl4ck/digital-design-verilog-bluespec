module example_and_gate(input1, input2, and_result);
    input input1;
    input input2;
    output and_result;

    wire and_temp;

    assign and_temp = input1 & input2;

    assign and_result = and_temp;
endmodule