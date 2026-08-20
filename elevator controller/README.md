# 4-Floor Elevator Controller using Verilog

## Introduction

This project implements a simple 4-floor Elevator Controller using
Verilog HDL.

The elevator receives a floor request and moves one floor at a time
until it reaches the requested floor.

When the elevator reaches the requested floor, the door opens.

## Floor Representation

| Binary | Floor |
|--------|-------|
| 00 | Ground Floor |
| 01 | 1st Floor |
| 10 | 2nd Floor |
| 11 | 3rd Floor |

## Inputs

| Signal | Width | Description |
|--------|-------|-------------|
| clk | 1-bit | Clock signal |
| rst | 1-bit | Reset signal |
| floor_request | 2-bit | Requested floor |

## Outputs

| Signal | Width | Description |
|--------|-------|-------------|
| current_floor | 2-bit | Current elevator floor |
| door_open | 1-bit | Door open indicator |
| moving_up | 1-bit | Elevator moving upward |
| moving_down | 1-bit | Elevator moving downward |

## Working Principle

The elevator compares the requested floor with the current floor.

### If Request > Current Floor

The elevator moves upward one floor at every clock cycle.

```text
moving_up = 1