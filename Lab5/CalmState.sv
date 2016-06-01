module calm (clk, LEDR);
    input         clk;
    output  [2:0] LEDR;

    reg  ps;
    reg  ns;

    // Output patten
    parameter  [2:0] patten = 3'b101;

    // Next State logic
    always @(*)
        case (ps)
            *:        ns = ~ps;
            default:  ns = 1'b01;


    // output logic
    if (ps)
        assign LEDR = patten;
    else
        assign LEDR = ~patten;


    // DFFs
    always @(posedge clk)
        ps <= ns;

endmodule
