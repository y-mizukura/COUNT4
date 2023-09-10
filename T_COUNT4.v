`timescale 1 ns / 100 ps
module T_COUNT4;

    reg CLK = 1'b0, RESET;
    wire [3:0] COUNT;

    parameter SIM_SEC1_MAX=4; // シミュレーション時4クロックに1回ENABLEを生成
    parameter CYCLE = 20;

    COUNT4 #(
        .SEC1_MAX(SIM_SEC1_MAX)
    )
    i0(
        .CLK(CLK)
    , .RESET(RESET)
    , .COUNT(COUNT)
    );

    always #(CYCLE/2)
        CLK = ~CLK;

    initial
    begin

        fork
            begin
                RESET = 1'b0; // RESETボタンは負論理
                #CYCLE RESET = 1'b1;
                #(CYCLE*SIM_SEC1_MAX*20) $stop;
            end
        join

    end
endmodule
