const std = @import("std");
const fs = std.fs;
const print = std.debug.print;
const stdin = std.io.getStdIn().reader();
const stdout = std.io.getStdOut().writer();

pub fn main() !void {
    var user_input: [100]u8 = undefined;

    const bytes_read = try stdin.readUntilDelimiter(&user_input, '\n');

    const file_name = user_input[0..bytes_read.len];

    print("File name: {s}\n", .{file_name});

    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    const file = try fs.cwd().openFile(file_name, .{});
    defer file.close();

    var buf_reader = std.io.bufferedReader(file.reader());
    const reader = buf_reader.reader();

    var line = std.ArrayList(u8).init(allocator);
    defer line.deinit();

    const writer = line.writer();
    var line_no: usize = 0;

    while (reader.streamUntilDelimiter(writer, '\n', null)) {
        defer line.clearRetainingCapacity();
        line_no += 1;

        print("{d}--{s}\n", .{ line_no, line.items });
    } else |err| switch (err) {
        error.EndOfStream => {
            if (line.items.len > 0) {
                line_no += 1;
                print("{d}--{s}\n", .{ line_no, line.items });
            }
        },
        else => return err,
    }

    print("Total lines: {d}\n", .{line_no});
}
