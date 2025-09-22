module d_latch (input D, en,output reg Q);

    always @(*) begin
        if (en)
            Q <= D;
    end
endmodule
