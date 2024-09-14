const std = @import("std");
/// A structure for storing a timestamp, with nanosecond presision
const Timestamp = struct {
    /// The number of seconds sice the epoch
    seconds: i64,
    /// The number of nanoseconds past the second
    nanos: i32,

    pub fn unixEpoch() Timestamp {
        return Timestamp{
            .seconds = 0,
            .nanos = 0,
        };
    }
};

pub fn main() !void {
    std.debug.print("hola!", .{});
}
