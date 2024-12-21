	///-----------------------
	/// build (library)
	/// zig 0.12.0 dev
	///-----------------------

const std = @import("std");


pub fn build(b: *std.Build) void {


	const decimal_mod = b.addModule("decimal", .{
		.root_source_file = b.path( "./decimal/decimal.zig" ),
	});



	decimal_mod.addSystemIncludePath(.{ .cwd_relative ="/usr/include/mpdecimal.h"});
	decimal_mod.link_libc = true;
	decimal_mod.addObjectFile(.{.cwd_relative = "/usr/lib/libmpdec.so"});




	
	const library_mod = b.addModule("library", .{
		.root_source_file = b.path( "library.zig" ),
		.imports = &.{
		.{ .name = "decimal",	.module = decimal_mod },
		},
	});






	
	_ = library_mod;


}
