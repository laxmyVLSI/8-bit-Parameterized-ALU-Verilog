`timescale 1ns/1ps

module alu_tb;

parameter WIDTH = 8;

// Inputs
reg  [WIDTH-1:0] A;
reg  [WIDTH-1:0] B;
reg  [3:0] opcode;

// Outputs
wire [WIDTH-1:0] result;
wire carry;
wire zero;
wire negative;
wire overflow;

integer errors = 0;
integer test_no = 0;

// DUT Instantiation
bit_alu #(WIDTH) DUT (
    .A(A),
    .B(B),
    .opcode(opcode),
    .result(result),
    .carry(carry),
    .zero(zero),
    .negative(negative),
    .overflow(overflow)
);

//=====================================================
// Test Task
//=====================================================
task run_test;

input [WIDTH-1:0] inA;
input [WIDTH-1:0] inB;
input [3:0] op;
input [WIDTH-1:0] expected;
input [200:1] operation;

begin

    test_no = test_no + 1;

    A = inA;
    B = inB;
    opcode = op;

    #20;      // Wait for output

    if(result == expected)
    begin
        $display("TEST %0d PASS : %s  Result = %0d",
                 test_no, operation, result);
    end
    else
    begin
        $display("TEST %0d FAIL : %s Expected=%0d Got=%0d",
                 test_no, operation, expected, result);

        errors = errors + 1;
    end

end

endtask

//=====================================================
// Test Sequence
//=====================================================

initial
begin

    $display("-------------------------------------------");
    $display("      PARAMETERIZED ALU VERIFICATION");
    $display("-------------------------------------------");

    run_test(10,5,4'b0000,15,"Addition");

    run_test(10,5,4'b0001,5,"Subtraction");

    run_test(10,5,4'b0010,50,"Multiplication");

    run_test(20,5,4'b0011,4,"Division");

    run_test(21,5,4'b0100,1,"Modulus");

    run_test(10,5,4'b0101,0,"AND");

    run_test(10,5,4'b0110,15,"OR");

    run_test(10,5,4'b0111,15,"XOR");

    run_test(8'h0F,0,4'b1000,8'hF0,"NOT");

    run_test(10,0,4'b1001,20,"Left Shift");

    run_test(10,0,4'b1010,5,"Right Shift");

    run_test(10,10,4'b1011,1,"Equal");

    run_test(10,5,4'b1100,1,"Greater Than");

    run_test(5,10,4'b1101,1,"Less Than");

    run_test(10,0,4'b1110,11,"Increment");

    run_test(10,0,4'b1111,9,"Decrement");

    $display("-------------------------------------------");

    if(errors==0)
        $display("ALL %0d TEST CASES PASSED",test_no);
    else
        $display("%0d TEST CASES FAILED",errors);

    $display("-------------------------------------------");

    #20;

    $finish;

end

endmodule
