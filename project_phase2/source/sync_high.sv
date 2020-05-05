module sync_high(
    input wire clk,
    input wire n_rst,
    input wire async_in,
    output reg sync_out
);

reg meta;

always_ff @(posedge clk,negedge n_rst) begin
    if (!n_rst) begin
        meta <= 1'b1;
        sync_out <= 1'b1;
    end
    else begin
        meta <= async_in;
        sync_out <= meta;
    end
end


endmodule

