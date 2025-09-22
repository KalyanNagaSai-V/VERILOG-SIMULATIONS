module jk_fftb();
    reg J, K, clk;
    wire Q;

    jk_ff uut (
        .J(J),
        .K(K),
        .clk(clk),
        .Q(Q)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        J = 0; K = 0;
        #10 J = 0; K = 1;
        #10 J = 1; K = 0;
        #10 J = 1; K = 1;
        #10 J = 0; K = 0;
        #10 J = 1; K = 1;
        #10 J = 1; K = 0;
        #10 J = 0; K = 1;
        #20 $stop;
    end
endmodule
