const std = @import("std");

pub fn main() void {
    const num1: i32 = 5;
    const num2: i32 = 2;
    const answer = add(num1, num2);
    const answer2 = minus(num1, num2);
    std.debug.print("Addition of {d} and {d} is {d}\n", .{ num1, num2, answer });
    std.debug.print("Subtraction of {d} and {d} is {d}\n", .{ num1, num2, answer2 });
    std.debug.print("Hello {s}!\n", .{"world"});
}

pub fn add(num1: i32, num2: i32) i32 {
    return num1 + num2;
}

fn minus(num1: i32, num2: i32) i32 {
    return num1 - num2;
}
