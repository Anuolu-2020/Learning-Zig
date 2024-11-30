const std = @import("std");

pub fn main() void {
    var a = [_]i32{ 1, 2, 3, 4, 5 };
    var end: usize = 3;
    end += 1; // tricking the compiler to making b true slice
    const b = a[1..end];
    b = b[1..];

    // an array of 3 booleans with false as the sentinel value
    const a2 = [3:false]bool{ false, true, false };

    std.debug.print("{any}\n", .{std.mem.asBytes(&a2).*});
}
