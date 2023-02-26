const std = @import("std");
const dcml = @import("decimal").dcml;



//=================================

pub const prix = struct {
  base      : dcml.DCMLFX  ,
  taxe      : dcml.DCMLFX  ,
  htx       : dcml.DCMLFX  ,
  ttc       : dcml.DCMLFX  ,
  nbrItem   : dcml.DCMLFX  ,
  

  // defined structure and set "0"
  pub fn init() prix {
        return prix {
            .base = dcml.DCMLFX.def(13,2) catch unreachable ,      
            .taxe = dcml.DCMLFX.def(3,2) catch unreachable ,
            .htx  = dcml.DCMLFX.def(25,2) catch unreachable ,
            .ttc  = dcml.DCMLFX.def(25,2) catch unreachable ,
            .nbrItem  = dcml.DCMLFX.def(15,0) catch unreachable ,
        };
    }

};



pub fn main() !void {



dcml.debugContext();

const vente  = prix.init ();

// prix moyenne voiture
vente.base.assign("45578.85") catch | err | {dcml.dsperr.errorDcml(err); return;};

// taxe 20%
vente.taxe.assign("1.25") catch | err | {dcml.dsperr.errorDcml(err); return;};

// number of cars sold by the group worldwide
vente.nbrItem.assign("100000000000") catch | err | {dcml.dsperr.errorDcml(err); return;};

// Total Price excluding tax
vente.htx.mulTo(vente.base,vente.nbrItem) catch | err | {dcml.dsperr.errorDcml(err); return;};
std.debug.print("\r\n  Total Price excluding tax {s}\r\n",.{vente.htx.string()});

// Prices all taxes included
vente.ttc.rate(vente.base,vente.nbrItem,vente.taxe) catch | err | {dcml.dsperr.errorDcml(err); return;};
std.debug.print("\r\n  Prices all taxes included {s}\r\n",.{vente.ttc.string()});


// other calcul
vente.ttc.setZeros();


vente.taxe.assign("25") catch | err | {dcml.dsperr.errorDcml(err); return;};

//Calculation in one pass TTC and HTX
dcml.mdrate(vente.ttc ,vente.htx ,
          vente.base  ,vente.nbrItem  ,vente.taxe) catch | err | {dcml.dsperr.errorDcml(err); return;};


std.debug.print("\r\n  taxes  {s}\r\n",.{vente.taxe.string()});
std.debug.print("\r\n  Total Price excluding tax {s}\r\n",.{vente.htx.string()});
std.debug.print("\r\n  Prices all taxes included {s}\r\n",.{vente.ttc.string()});

std.debug.print("\r\n-----------------------------------\r\n",.{});



dcml.debugContext();
std.debug.print("\r\nzeros {}\r\n",.{vente.ttc.isZeros()});

var r = dcml.DCMLFX.def(7,3) catch unreachable;       // set 0 init default
var t = dcml.DCMLFX.def(12,22) catch unreachable;     // set 0 init default
dcml.forceAssign(r, "1.7856") catch unreachable;
r.round();
r.debugPrint();

var repcmp = dcml.cmp(r,t) catch | err | {dcml.dsperr.errorDcml(err); return;};

if(repcmp == dcml.CMP.GT) std.debug.print("\r\nrepcom =  r > t \r\n",.{});

dcml.forceAssign(r, "1.7856" ) catch unreachable;
r.trunc();
r.debugPrint();

t.mul(r) catch | err | {dcml.dsperr.errorDcml(err); return;};
t.debugPrint();


t.div(r) catch | err | {dcml.dsperr.errorDcml(err); return;};
t.debugPrint();

r.setZeros();
t.div(r) catch | err | {dcml.dsperr.errorDcml(err); return;};

}