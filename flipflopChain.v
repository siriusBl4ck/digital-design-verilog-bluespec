reg test1 = '1b1';
reg test2 = '1b0';
reg test3 = '1b0';
reg test4 = '1b0';

always @ (posedge i_clock)
    begin
        test2 <= test1;
        test3 <= test2;
        test4 <= test3;
    end
