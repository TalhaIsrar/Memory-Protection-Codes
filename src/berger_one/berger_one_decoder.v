module berger_one_decoder(
    input  [11:0] in_code,
    output [7:0] out_data,
    output error_detected
);

    wire [3:0] ones_count;
    wire [3:0] ones_complement_count;

    // in_code[11:4] = original data (8 bits)
    // in_code[3:0]  = Berger checksum (complement of number of 1s in data)

    assign ones_count = in_code[4] + in_code[5] + in_code[6]  + in_code[7] +
                        in_code[8] + in_code[9] + in_code[10] + in_code[11];

    assign ones_complement_count = ~ones_count;
    
    assign error_detected = ones_complement_count != in_code[3:0];
    assign out_data = in_code[11:4];

endmodule
