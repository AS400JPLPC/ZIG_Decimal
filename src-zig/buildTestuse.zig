const std = @import("std");

pub fn build(b: *std.Build) void {
	// Standard release options allow the person running `zig build` to select
	// between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
	const target   = b.standardTargetOptions(.{});
	const optimize = b.standardOptimizeOption(.{});
 
    // zig-src            source projet
    // zig-src/deps       curs/ form / outils ....
    // src_c              source c/c++



    // Definition of dependencies
    const zenlib_dep = b.dependency("library", .{});

    
    // Building the executable
    const Prog = b.addExecutable(.{
    .name = "Testuse",
    .root_source_file =  b.path( "./Testuse.zig" ),
    .target = target,
    .optimize = optimize,
    });


    Prog.linkLibC();
    Prog.addObjectFile(.{.cwd_relative = "/usr/lib/libmpdec.so"});
    Prog.root_module.addImport("decimal", zenlib_dep.module("decimal"));
    b.installArtifact(Prog);




    //Build step to generate docs:  
    // Building the executable
    const docs = b.addTest(.{
    .name = "Testuse",
    .root_source_file =  b.path( "./Testuse.zig" ),
    });

    docs.addIncludePath(.{.cwd_relative = "usr/include/"});
    docs.linkLibC();
    docs.addObjectFile(.{.cwd_relative = "/usr/lib/libmpdec.so"});
    docs.root_module.addImport("decimal", zenlib_dep.module("decimal"));

    const install_docs = b.addInstallDirectory(.{
        .source_dir = docs.getEmittedDocs(),
        .install_dir = .prefix,
        .install_subdir =  "Docs_Decimal_Use",
    });
    
    const docs_step = b.step("docs", "Generate docs");
    docs_step.dependOn(&install_docs.step);
    docs_step.dependOn(&docs.step);

}
