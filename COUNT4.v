

module COUNT4 (
    input wire CLK
  , input wire RESET
  , output reg [3:0] COUNT
);
    parameter SEC1_MAX = 50000000; //50 MHz
    reg [25:0] tmp_count;  // 1秒のカウンタ
    wire ENABLE;

    always @(posedge CLK or negedge RESET)
    begin
        if (RESET == 1'b0) // RESETボタンは負論理
            tmp_count <= 26'h0;
        else if (ENABLE == 1'b1)
            tmp_count <= 26'h0;
        else
            tmp_count <= tmp_count + 26'h1;
    end

    assign ENABLE = (tmp_count == (SEC1_MAX - 1))? 1'b1 : 1'b0;

    always @(posedge CLK or negedge RESET)
    begin
        if (RESET == 1'b0) // RESETボタンは負論理
            COUNT <= 4'h0;
        else if (ENABLE == 1'b1) begin
            COUNT <= COUNT + 4'h1;
        end
    end
endmodule
