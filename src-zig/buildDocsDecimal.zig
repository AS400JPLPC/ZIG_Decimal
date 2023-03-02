const std = @import("std");

// version zig 0.10.1


pub fn build(b: *std.build.Builder) void {
    // Standard release options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    const target = b.standardTargetOptions(.{});
    const mode = b.standardReleaseOptions();
 
    // zig-src            source projet
    // zig-src/deps       curs/ form / outils ....
    // src_c              source c/c++
    // zig-src/srcgo      source go-lang 
    // zig-src/srcgo/lib  lib.so source.h


    // Definition of dependencies
    const pkgs = struct {
        const decimal = std.build.Pkg{
            .name = "decimal",
            .source = .{ .path = "./deps/decimal/decimal.zig"},
            .dependencies = &[_]std.build.Pkg {},
        };
    };


    // Building the executable
    const Prog = b.addExecutable("decmap", "./decmap.zig");
    Prog.setTarget(target);

    Prog.addIncludePath("../../../../usr/include/");
    Prog.linkLibC();
    Prog.addObjectFile("../../../../usr/lib/libmpdec.so");

    Prog.addPackage(pkgs.decimal);
    Prog.setBuildMode(mode);
    Prog.install(); 
    
    //Build step to generate docs:  
    //const docs = b.addTest("./Exemple.zig"); BEUG 
    const docs = Prog;
    docs.setBuildMode(mode);
    docs.emit_docs = .emit;  

    const docs_step = b.step("docs", "Generate docs");
    docs_step.dependOn(&docs.step);

 
}
