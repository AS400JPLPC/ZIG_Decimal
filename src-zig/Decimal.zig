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
vente.htx.multTo(vente.base,vente.nbrItem) catch | err | {dcml.dsperr.errorDcml(err); return;};
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
var t = dcml.DCMLFX.def(12,2) catch unreachable;     // set 0 init default
var x = dcml.DCMLFX.def(12,0) catch unreachable;
var z = dcml.DCMLFX.def(5,2) catch unreachable;
dcml.forceAssign(t, "2.46") catch unreachable;
dcml.forceAssign(x, "2") catch unreachable;


r.floor(t) catch unreachable;

std.debug.print("\r\n {s} floor  {s}\r\n",.{t.string(),r.string()});

r.ceil(t) catch unreachable;
std.debug.print("\r\n {s} ceil  {s}\r\n",.{t.string(),r.string()});



r.rem(t,x) catch unreachable;

std.debug.print("\r\n  rem  {s}\r\n",.{r.string()});

t.setZeros();






dcml.forceAssign(r, "12.650") catch unreachable;
var repcmp = dcml.cmp(r,t) catch | err | {dcml.dsperr.errorDcml(err); return;};

if(repcmp == dcml.CMP.GT) std.debug.print("\r\nrepcom =  r > t \r\n",.{});


dcml.forceAssign(r, "12.6504") catch unreachable;
r.round();
std.debug.print("\r\n  12.6504 round  {s}\r\n",.{r.string()});

dcml.forceAssign(r, "12.6506") catch unreachable;
r.round();
std.debug.print("\r\n  12.6506 round  {s}\r\n",.{r.string()});



dcml.forceAssign(r, "1.7855" ) catch unreachable;
r.trunc();
std.debug.print("\r\n  trunc  {s}\r\n",.{r.string()});


t.assign("50.00") catch unreachable;
r.assign("2.00") catch unreachable;

z.multTo(t,r) catch | err | {dcml.dsperr.errorDcml(err); return;};
std.debug.print("\r\n t{s} mult r{s} =  {s}\r\n",.{ t.string(),r.string(),z.string()});

t.div(r) catch | err | {dcml.dsperr.errorDcml(err); return;};
std.debug.print("\r\n  t.div(r) ?  {s}\r\n",.{r.string()});
t.debugPrint("127  t.div(r):");

r.setZeros();
t.div(r) catch | err |  {
    std.debug.print("\r\n {}\r\n",.{ err});

};

}