const std = @import("std");

const dcml = @import("decimal");


pub const prix = struct {
  base      : dcml.DCMLFX  ,
  tax      : dcml.DCMLFX  ,
  htx       : dcml.DCMLFX  ,
  ttc       : dcml.DCMLFX  ,
  nbritem   : dcml.DCMLFX  ,
  

  // defined structure and set "0"
    pub fn initRecord() prix {
      
        return prix {
            .base = dcml.DCMLFX.init(13,2) ,      
            .tax = dcml.DCMLFX.init(3,2) ,
            .htx  = dcml.DCMLFX.init(25,2) ,
            .ttc  = dcml.DCMLFX.init(25,2) ,
            .nbritem  = dcml.DCMLFX.init(15,0) ,
        };     
    }

    pub fn deinitRecord( r :prix) void {
        r.base.deinit(); 
        r.tax.deinit();
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



dcml.debugContext();

const vente  = prix.initRecord();

vente.base.debugPrint("base");
vente.tax.debugPrint("base");
vente.htx.debugPrint("base");
vente.ttc.debugPrint("base");
vente.nbritem.debugPrint("base");

pause("setp-1");

// prix moyenne voiture
vente.base.setDcml("150.85") catch | err | {dcml.dsperr(err); return;};
vente.base.debugPrint("base");
// taxe 20%
vente.tax.setDcml("1.25") catch | err | dcml.dsperr(err);

// number of cars sold by the group worldwide
vente.nbritem.setDcml("100") catch | err | dcml.dsperr(err);

pause("setp-2");


// Total Price excluding tax
vente.htx.multTo(vente.base,vente.nbritem) catch | err | dcml.dsperr(err);
// Prices all taxes included
vente.ttc.rate(vente.base,vente.nbritem,vente.tax) catch | err | dcml.dsperr(err);
    var xx : []const u8  ="";

    xx =  vente.base.string();
    xx =  vente.tax.string();
    xx =  vente.htx.string();
	xx =  vente.ttc.string();
	xx =  vente.nbritem.string();

vente.base.debugPrint("base");
vente.tax.debugPrint("taxe");
vente.htx.debugPrint("htx");
vente.ttc.debugPrint("ttc");
vente.nbritem.debugPrint("nbritem");

std.debug.print("\r\n  Prices base fabrication    : {s}\r\n",.{vente.base.string()});
std.debug.print("\r\n  Tax                        : {s}\r\n",.{vente.tax.string()});
std.debug.print("\r\n  nombre de voitures vendue  : {s}\r\n",.{vente.nbritem.string()});
std.debug.print("\r\n  Total Price excluding tax  : {s}\r\n",.{vente.htx.string()});
std.debug.print("\r\n  Total Price included  tax  : {s}\r\n",.{vente.ttc.string()});

pause("setp-3");

	


var  i : usize = 0;
while(i < 1000) :( i += 1) {
    // xx =  vente.base.string();
    vente.base.setDcml("45578.85") catch unreachable;
    // vente.base.debugPrint("base");
}

 pause("setp-4");

    
    prix.deinitRecord(vente);
 pause("setp-5");

    
 vente.base.debugPrint("base");
    if ( vente.base.isActif()) { 
        std.debug.print("\r\n  prix de vente inactif {s}  \r\n",.{vente.base.string()});
    }

    dcml.deinitDcml();

pause("stop");


}

fn pause(text : [] const u8) void {
    std.debug.print("{s}\n",.{text});
   	var buf : [3]u8  =	[_]u8{0} ** 3;
	_= stdin.readUntilDelimiterOrEof(buf[0..], '\n') catch unreachable;

}
