const std = @import("std");

fn readline() !void {
    const stdin = std.io.getStdIn().reader();
    const stdout = std.io.getStdOut().writer();

    var buf: [10]u8 = undefined;

    try stdout.print("🥚", .{});

    if (try stdin.readUntilDelimiterOrEof(buf[0..], '\n')) |user_input| {
        std.debug.print("entered {s}\n", .{user_input});
        // return user_input;
    }
}

pub fn main() !void {
    while (true) {
        try readline();
    }
}

test "simple test" {
    var list = std.ArrayList(i32).init(std.testing.allocator);
    defer list.deinit(); // try commenting this out and see if zig detects the memory leak!
    try list.append(42);
    try std.testing.expectEqual(@as(i32, 42), list.pop());
}
