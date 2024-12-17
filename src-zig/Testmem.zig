const std = @import("std");

const dcml = @import("decimal").dcml;


pub const prix = struct {
  base      : dcml.DCMLFX  ,
  taxe      : dcml.DCMLFX  ,
  htx       : dcml.DCMLFX  ,
  ttc       : dcml.DCMLFX  ,
  nbritem   : dcml.DCMLFX  ,
  

  // defined structure and set "0"
    pub fn initRecord() prix {

        
        const rcd = prix {
            .base = dcml.DCMLFX.init(13,2) catch unreachable ,      
            .taxe = dcml.DCMLFX.init(3,2) catch unreachable ,
            .htx  = dcml.DCMLFX.init(25,2) catch unreachable ,
            .ttc  = dcml.DCMLFX.init(25,2) catch unreachable ,
            .nbritem  = dcml.DCMLFX.init(15,0) catch unreachable ,
        };
        rcd.base.setZeros();
        rcd.taxe.setZeros();
        rcd.htx.setZeros();
        rcd.ttc.setZeros();
        rcd.nbritem.setZeros();
        return rcd;      
    }

    pub fn deinitRecord( r :prix) void {
        r.base.deinit(); 
        r.taxe.deinit();
        r.htx.deinit();
        r.ttc.deinit();
        r.nbritem.deinit();
        
    }

};
const stdout = std.io.getStdOut().writer();
const stdin = std.io.getStdIn().reader();



pub fn main() !void {
stdout.writeAll("\x1b[2J") catch {};
stdout.writeAll("\x1b[3J") catch {};

var buf : [3]u8 = undefined;


dcml.debugContext();

const vente  = prix.initRecord();

vente.base.debugPrint("base");
vente.taxe.debugPrint("base");
vente.htx.debugPrint("base");
vente.ttc.debugPrint("base");
vente.nbritem.debugPrint("base");






    std.debug.print("stop 3/3 fin \r\n",.{});
	buf =	[_]u8{0} ** 3;
	_= try stdin.readUntilDelimiterOrEof(buf[0..], '\n');

// prix moyenne voiture
vente.base.setDcml("45578.85") catch | err | {dcml.dsperr.errorDcml(err); return;};
vente.base.debugPrint("base");

	std.debug.print("stop 3/3 fin \r\n",.{});
	buf =	[_]u8{0} ** 3;
	_= try stdin.readUntilDelimiterOrEof(buf[0..], '\n');

    var xx : []const u8  ="";

    xx =  vente.base.string();
    xx =  vente.taxe.string();
    xx =  vente.htx.string();
	xx =  vente.ttc.string();
	xx =  vente.nbritem.string();

vente.base.debugPrint("base");
vente.taxe.debugPrint("taxe");
vente.htx.debugPrint("htx");
vente.ttc.debugPrint("ttc");
vente.nbritem.debugPrint("nbritem");

    std.debug.print("stop 3/3 fin \r\n",.{});
	buf =	[_]u8{0} ** 3;
	_= try stdin.readUntilDelimiterOrEof(buf[0..], '\n');


	
std.debug.print("\r\n  prix de vente  {s}  \r\n",.{vente.base.string()});
std.debug.print("\r\n  prix de taxe   {s}\r\n",.{vente.taxe.string()});
std.debug.print("\r\n  prix de vente  {s}\r\n",.{vente.htx.string()});
std.debug.print("\r\n  prix de vente  {s}\r\n",.{vente.ttc.string()});
std.debug.print("\r\n  prix de vente  {s}\r\n",.{vente.nbritem.string()});
// std.debug.print("\r\n  prix de vente  {s}\r\n",.{vente.base.string()});
// std.debug.print("\r\n  prix de vente  {s}\r\n",.{vente.base.string()});
// std.debug.print("\r\n  prix de vente  {s}\r\n",.{vente.base.string()});
// std.debug.print("\r\n  prix de vente  {s}\r\n",.{vente.base.string()});
// std.debug.print("\r\n  prix de vente  {s}\r\n",.{vente.base.string()});
// std.debug.print("\r\n  prix de vente  {s}\r\n",.{vente.base.string()});
// std.debug.print("\r\n  prix de vente  {s}\r\n",.{vente.base.string()});
// std.debug.print("\r\n  prix de vente  {s}\r\n",.{vente.base.string()});
// std.debug.print("\r\n  prix de vente  {s}\r\n",.{vente.base.string()});
// std.debug.print("\r\n  prix de vente  {s}\r\n",.{vente.base.string()});
// std.debug.print("\r\n  prix de vente  {s}\r\n",.{vente.base.string()});
// std.debug.print("\r\n  prix de vente  {s}\r\n",.{vente.base.string()});
// std.debug.print("\r\n  prix de vente  {s}\r\n",.{vente.base.string()});

 	std.debug.print("stop 3/3 fin \r\n",.{});
	buf =	[_]u8{0} ** 3;
	_= try stdin.readUntilDelimiterOrEof(buf[0..], '\n');

var  i : usize = 0;
while(i < 1000) :( i += 1) {
    // xx =  vente.base.string();
    vente.base.setDcml("45578.85") catch unreachable;
    // vente.base.debugPrint("base");
}

 	std.debug.print("stop 3/3 fin \r\n",.{});
	buf =	[_]u8{0} ** 3;
	_= try stdin.readUntilDelimiterOrEof(buf[0..], '\n');


    if ( vente.base.isActif()) { 
        std.debug.print("\r\n  prix de vente actif  {s}  \r\n",.{vente.base.string()});
    }
    
    prix.deinitRecord(vente);

    
    vente.base.debugPrint("base");
    if ( vente.base.isActif()) { 
        std.debug.print("\r\n  prix de vente inactif {s}  \r\n",.{vente.base.string()});
    }

    dcml.deinitDcml();

    std.debug.print("stop 3/3 fin \r\n",.{});
	buf =	[_]u8{0} ** 3;
	_= try stdin.readUntilDelimiterOrEof(buf[0..], '\n');


}
