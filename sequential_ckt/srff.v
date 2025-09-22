module srff(input s, r, clk,output reg q, qbar);
always @(posedge clk) begin
    if (s && ~r) begin
        q <= 1;
        qbar<= 0;
    end
    else if (~s && r) begin
        q<= 0;
        qbar <= 1;
    end
    else if (~s && ~r) begin
        q <= q;     
        qbar<= qbar;
    end
    else begin
        q <= 1'bx;
        qbar<= 1'bx;
    end
end
endmodule