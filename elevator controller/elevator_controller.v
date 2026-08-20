module elevator_controller (
    input  wire       clk,
    input  wire       rst,
    input  wire [1:0] floor_request,

    output reg  [1:0] current_floor,
    output reg        door_open,
    output reg        moving_up,
    output reg        moving_down
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            current_floor <= 2'b00;  // Start at Ground Floor
        end
        else begin

            if (floor_request > current_floor) begin
                current_floor <= current_floor + 1'b1;
            end

            else if (floor_request < current_floor) begin
                current_floor <= current_floor - 1'b1;
            end

        end
    end

    always @(*) begin

        door_open  = 1'b0;
        moving_up  = 1'b0;
        moving_down = 1'b0;

        if (floor_request == current_floor) begin
            door_open = 1'b1;
        end

        else if (floor_request > current_floor) begin
            moving_up = 1'b1;
        end

        else if (floor_request < current_floor) begin
            moving_down = 1'b1;
        end

    end

endmodule