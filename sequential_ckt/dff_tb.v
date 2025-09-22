module dff_tb();
    reg d, clk;
    wire q, qb;

    dff uut (
        .d(d),
        .clk(clk),
        .q(q),
        .qb(qb)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        d = 0;
        #10 d = 1;
        #10 d = 0;
        #10 d = 1;
        #10 d = 0;
        #20 $stop;
    end
endmodule
