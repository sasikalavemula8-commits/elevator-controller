`timescale 1ns/1ps

module elevator_controller_tb;

    reg clk;
    reg rst;
    reg [1:0] floor_request;

    wire [1:0] current_floor;
    wire door_open;
    wire moving_up;
    wire moving_down;

    elevator_controller uut (
        .clk(clk),
        .rst(rst),
        .floor_request(floor_request),
        .current_floor(current_floor),
        .door_open(door_open),
        .moving_up(moving_up),
        .moving_down(moving_down)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        $monitor(
            "Time=%0t | Request=%b | Current Floor=%b | Door=%b | Up=%b | Down=%b",
            $time,
            floor_request,
            current_floor,
            door_open,
            moving_up,
            moving_down
        );

        clk = 0;
        rst = 1;
        floor_request = 2'b00;

        // Reset
        #10;
        rst = 0;

        // Request 3rd floor
        floor_request = 2'b11;

        #40;

        // Request Ground floor
        floor_request = 2'b00;

        #40;

        // Request 2nd floor
        floor_request = 2'b10;

        #30;

        // Request 1st floor
        floor_request = 2'b01;

        #20;

        $finish;

    end

endmodule