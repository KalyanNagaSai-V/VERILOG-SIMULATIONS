module jk_latchtb;
    reg J, K, en;
    wire Q;

    jk_latch uut (
        .J(J),
        .K(K),
        .en(en),
        .Q(Q)
    );

    initial begin
        en = 1;
        J = 0; K = 0;
        #10 J = 0; K = 1;
        #10 J = 1; K = 0;
        #10 J = 1; K = 1;
        #10 J = 0; K = 0;
        #10 J = 1; K = 1;
        #10 en = 0; J = 1; K = 0;
        #10 en = 1; J = 0; K = 1;
        #10 $stop;
    end
endmodule
