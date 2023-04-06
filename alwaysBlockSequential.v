//Positive edge triggered flipflop
always @ (posedge i_clock)
    begin
        and_gate <= input1 & input2;
    end
