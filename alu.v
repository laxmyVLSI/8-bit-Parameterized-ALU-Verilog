`timescale 1ns/1ps

module bit_alu #(parameter WIDTH = 8)
(
    input  [WIDTH-1:0] A,
    input  [WIDTH-1:0] B,
    input  [3:0] opcode,

    output reg [WIDTH-1:0] result,
    output reg carry,
    output reg zero,
    output reg negative,
    output reg overflow
);

reg [WIDTH:0] temp;

always @(*) begin

    result = 0;
    carry = 0;
    overflow = 0;

    case(opcode)

    //================ Arithmetic ==================

    // Addition
    4'b0000:
    begin
        temp = A + B;
        result = temp[WIDTH-1:0];
        carry = temp[WIDTH];

        overflow = (~(A[WIDTH-1]^B[WIDTH-1])) &
                   (A[WIDTH-1]^result[WIDTH-1]);
    end

    // Subtraction
    4'b0001:
    begin
        temp = A - B;
        result = temp[WIDTH-1:0];
        carry = temp[WIDTH];

        overflow = (A[WIDTH-1]^B[WIDTH-1]) &
                   (A[WIDTH-1]^result[WIDTH-1]);
    end

    // Multiplication
    4'b0010:
        result = A * B;

    // Division
    4'b0011:
        result = (B==0) ? 0 : (A/B);

    // Modulus
    4'b0100:
        result = (B==0) ? 0 : (A%B);

    //================ Logical ==================

    // AND
    4'b0101:
        result = A & B;

    // OR
    4'b0110:
        result = A | B;

    // XOR
    4'b0111:
        result = A ^ B;

    // NOT
    4'b1000:
        result = ~A;

    //================ Shift ==================

    // Left Shift
    4'b1001:
        result = A << 1;

    // Right Shift
    4'b1010:
        result = A >> 1;

    //================ Comparator ==================

    // Equal
    4'b1011:
        result = (A==B);

    // Greater Than
    4'b1100:
        result = (A>B);

    // Less Than
    4'b1101:
        result = (A<B);

    //================ Increment / Decrement ==================

    // Increment
    4'b1110:
    begin
        temp = A + 1;
        result = temp[WIDTH-1:0];
        carry = temp[WIDTH];
    end

    // Decrement
    4'b1111:
    begin
        temp = A - 1;
        result = temp[WIDTH-1:0];
        carry = temp[WIDTH];
    end

    default:
        result = 0;

    endcase

    //================ Flags ==================

    zero = (result == 0);

    negative = result[WIDTH-1];

end

endmodule    
