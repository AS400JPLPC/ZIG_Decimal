const std = @import("std");

pub fn build(b: *std.build) void {
    // Standard release options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    const target   = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
 
    // zig-src            source projet
    // zig-src/deps       curs/ form / outils ....
    // src_c              source c/c++



    // Definition of dependencies

    const decimal = b.createModule(.{
      .source_file = .{ .path = "./deps/decimal/decimal.zig"},
    });

    // Building the executable
    const Prog = b.addExecutable(.{
    .name = "Decimal",
    .root_source_file = .{ .path = "./Decimal.zig" },
    .target = target,
    .optimize = optimize,
    });

    Prog.addIncludePath(.{.cwd_relative = "usr/include/"});
    Prog.linkLibC();
    Prog.addObjectFile(.{.cwd_relative = "/usr/lib/libmpdec.so"});
    Prog.addModule("decimal"   , decimal);

    const install_exe = b.addInstallArtifact(Prog, .{});
    b.getInstallStep().dependOn(&install_exe.step); 




    //Build step to generate docs:  
    //const docs = b.addTest("./Exemple.zig"); BEUG 
    // Building the executable
    const docs = b.addTest(.{
    .name = "Decimal",
    .root_source_file = .{ .path = "./Decimal.zig" },
    });

    docs.addIncludePath(.{.cwd_relative = "usr/include/"});
    docs.linkLibC();
    docs.addObjectFile(.{.cwd_relative = "/usr/lib/libmpdec.so"});
    docs.addModule("decimal"   , decimal);


    const install_docs = b.addInstallDirectory(.{
        .source_dir = docs.getEmittedDocs(),
        .install_dir = .prefix,
        .install_subdir =  "Docs",
    });
    
    const docs_step = b.step("docs", "Generate docs");
    docs_step.dependOn(&install_docs.step);
    docs_step.dependOn(&docs.step);

}
