`include "oldmac.v"
module testbench1;

reg clk, start, reset;
reg [7:0] a, b;

wire [15:0] ab;

wire [15:0] acc;
wire busy;
oldmac ds(acc, ab, busy, a, b, clk, start, reset);

initial begin

clk = 0;
reset = 1;
#20 reset = 0;
$display("first example: a = 3 b = 17");
a = 3; b = 17; start = 1; #50 start = 0;
#90 $display("first example done");
$display("second example: a = 7 b = 7");
a = 7; b = 7; start = 1; #50 start = 0;
#90 $display("second example done");
$display("third: a = 8 b = 9");
a = 8; b = 9; start = 1; #50 start = 0;
#90 $display("3rd example done");
$display("fourth: a = -8 b = 5");
a = -8; b = 5; start = 1; #50 start = 0;
#90 $display("4th example done");

$finish;
end

always #5 clk = !clk;

always @(posedge clk) $strobe("ab: %d busy: %d and sum is %d at time=%t", ab, busy, acc, $stime);

endmodule