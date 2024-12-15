const std = @import("std");

const method = "GET";

// std.mem.eql does a byte-by-byte comparison
// for a string it'll be case sensitive
// if (std.mem.eql(u8, method, "GET") or std.mem.eql(u8, method, "HEAD")){
// 	// handle a GET request
// std.debug.print("It's a %s request",.{method});
// } else if (std.mem.eql(u8, method, "POST")) {
// 	// handle a POST request
// std.debug.print("It's a %s request",.{method});
// } else {
// 	// ...
// std.debug.print("Request not allowed");
// }

const power = 3000;

const super = if (power > 9000) true else false;

fn anniversaryName(years_married: u16) []const u8 {
    switch (years_married) {
        1 => return "paper",
        2 => return "cotton",
        3 => return "leather",
        4 => return "flower",
        5 => return "wood",
        6 => return "sugar",
        else => return "no more gifts for you",
    }
}

fn arrivalTimeDesc(minutes: u16, is_late: bool) []const u8 {
    switch (minutes) {
        0 => return "arrived",
        1, 2 => return "soon",
        3...5 => return "no more than 5 minutes",
        else => {
            if (!is_late) {
                return "sorry, it'll be a while";
            }
            // todo, something is very wrong
            return "never";
        },
    }
}

fn contains(haystack: []const u32, needle: u32) bool {
    for (haystack) |value| {
        if (needle == value) {
            return true;
        }
    }
    return false;
}

pub fn eql(comptime T: type, a: []const T, b: []const T) bool {
    // if they arent' the same length, the can't be equal
    if (a.len != b.len) return false;

    for (a, b) |a_elem, b_elem| {
        if (a_elem != b_elem) return false;
    }

    return true;
}

// for (0..10)  |i|  {
// 	std.debug.print("{d}\n", .{i});
// }

fn indexOf(haystack: []const u32, needle: u32) ?usize {
    for (haystack, 0..) |value, i| {
        if (needle == value) {
            return i;
        }
    }
    return null;
}

pub fn main() void {
    // While loops
    const src: []u8 = "Hello";
    var escape_count: usize = 0;
    {
        var i: usize = 0;
        while (i < src.len) {
            // backslash is used as an escape character, thus we need to escape it...
            // with a backslash.
            if (src[i] == '\\') {
                i += 2;
                escape_count += 1;
            } else {
                i += 1;
            }
        }
    }

    // Label loop
    outer: for (1..10) |i| {
        for (i..10) |j| {
            if (i * j > (i + i + j + j)) continue :outer;
            std.debug.print("{d} + {d} >= {d} * {d}\n", .{ i + i, j + j, i, j });
        }
    }
}
