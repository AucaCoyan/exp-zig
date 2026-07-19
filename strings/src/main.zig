const std = @import("std");
const Io = std.Io;

pub fn main(init: std.process.Init) !void {
    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.Io.File.stdout().writer(init.io, &stdout_buffer);
    const stdout = &stdout_writer.interface;
    const string_object = "This is an example of string literal in Zig";
    try stdout.print("{d}\n", .{string_object.len});
    try stdout.flush();

    // there are two types of strings
    // null terminated (sentinel-terminated) like C
    // and slices (const arrays)

    // Sentinel terminated
    _ = "A literal value";
    try stdout.print("{any}\n", .{@TypeOf("A literal value")});
    try stdout.flush();
    // *const [15:0] u8
    // means a 15 length u8 bytes null-terminated string

    // Slice
    const str: []const u8 = "A string value";
    try stdout.print("{any}\n", .{@TypeOf(str)});
    try stdout.flush();
    // []const u8
    //
    // you also have `[]u8` if the str is variable instead of const
}
