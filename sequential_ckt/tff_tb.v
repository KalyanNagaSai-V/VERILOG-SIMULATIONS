module tff_tb;
    reg t, clk;
    wire q;

    tff uut (
        .t(t),
        .clk(clk),
        .q(q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        t = 0;
        #10 t = 1;
        #20 t = 0;
        #20 t = 1;
        #30 t = 0;
        #20 t = 1;
        #40 $stop;
    end
endmodule
