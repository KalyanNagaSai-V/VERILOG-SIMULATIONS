module d_latchtb;
    reg D, en;
    wire Q;

    d_latch uut (
        .D(D),
        .en(en),
        .Q(Q)
    );

    initial begin
        en = 0; D = 0;
        #10 en = 1; D = 1;
        #10 D = 0;
        #10 en = 0; D = 1;
        #10 en = 1; D = 0;
        #10 D = 1;
        #10 $stop;
    end
endmodule
