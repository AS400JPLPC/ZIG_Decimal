const std = @import("std");
// version zig = 0.11.0 dev

pub fn build(b: *std.Build) void {
    // Standard release options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    const target   = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
 
    // zig-src            source projet
    // zig-src/deps       curs/ form / outils ....
    // src_c              source c/c++
    // zig-src/srcgo      source go-lang 
    // zig-src/srcgo/lib  lib.so source.h


    // Definition of module

    const decimal = b.createModule(.{
      .source_file = .{ .path = "./deps/decimal/decimal.zig" },
    });


    // Building the executable

    const Prog = b.addExecutable(.{
    .name = "decmap",
    .root_source_file = .{ .path = "./decmap.zig" },
    .target = target,
    .optimize = optimize,
    });

    Prog.addIncludePath("../../../../usr/include/");
    Prog.linkLibC();
    Prog.addObjectFile("../../../../usr/lib/libmpdec.so");

    Prog.addModule("decimal" , decimal);
    Prog.install(); 


}
