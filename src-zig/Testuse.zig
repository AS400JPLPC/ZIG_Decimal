const std = @import("std");

const dcml = @import("decimal");


//=================================

pub const prix = struct {
  base      : dcml.DCMLFX  ,
  tax       : dcml.DCMLFX  ,
  htx       : dcml.DCMLFX  ,
  ttc       : dcml.DCMLFX  ,
  nbritem   : dcml.DCMLFX  ,
  

  // defined structure and set "0"
    pub fn init() prix {
        return prix {
            .base = dcml.DCMLFX.init(13,2),      
            .tax  = dcml.DCMLFX.init(3,2),
            .htx  = dcml.DCMLFX.init(25,2),
            .ttc  = dcml.DCMLFX.init(25,2),
            .nbritem  = dcml.DCMLFX.init(15,0),
        };
    }

};


pub fn main() !void {



dcml.debugContext();

const vente  = prix.init ();

// prix moyenne voiture
vente.base.setDcml("45578.00") catch | err | dcml.dsperr(err);

// taxe 20%
vente.tax.setDcml("1.25") catch | err | dcml.dsperr(err);

// number of cars sold by the group worldwide
vente.nbritem.setDcml("100000000000") catch | err | dcml.dsperr(err);


// Prices all taxes included
vente.ttc.rate(vente.base,vente.nbritem,vente.tax) catch | err | dcml.dsperr(err);

std.debug.print("\r\n  Prices base fabrication    : {s}\r\n",.{vente.base.string()});
std.debug.print("\r\n  Tax                        : {s}\r\n",.{vente.tax.string()});
std.debug.print("\r\n  nombre de voitures vendue  : {s}\r\n",.{vente.nbritem.string()});

// Total Price excluding tax
vente.htx.multTo(vente.base,vente.nbritem) catch | err | dcml.dsperr(err);
std.debug.print("\r\n  Total Price excluding tax  : {s}\r\n",.{vente.htx.string()});

// Prices all taxes included
vente.ttc.rate(vente.base,vente.nbritem,vente.tax) catch | err | dcml.dsperr(err);
std.debug.print("\r\n  Total Price included  tax  : {s}\r\n",.{vente.ttc.string()});



// ----------------------
// test divers
// ----------------------


// other calcul
vente.htx.setZeros();
vente.ttc.setZeros();

vente.base.setDcml("1.52") catch | err | dcml.dsperr(err);
vente.tax.setDcml("1.25") catch | err | dcml.dsperr(err);
vente.nbritem.setDcml("10") catch | err | dcml.dsperr(err);
std.debug.print("\r\n  Prices base fabrication    : {s}\r\n",.{vente.base.string()});
std.debug.print("\r\n  Tax                        : {s}\r\n",.{vente.tax.string()});
std.debug.print("\r\n  nombre de steack           : {s}\r\n",.{vente.nbritem.string()});
std.debug.print("\r\n  Total Price excluding tax  : {s}\r\n",.{vente.htx.string()});
std.debug.print("\r\n  Total Price included  tax  : {s}\r\n",.{vente.ttc.string()});


vente.htx.multTo(vente.base,vente.nbritem) catch | err | dcml.dsperr(err);
vente.ttc.multTo(vente.htx,vente.tax) catch | err | dcml.dsperr(err);
std.debug.print("\r\n  Total Price included  tax  : {s}\r\n",.{vente.ttc.string()});


vente.htx.setZeros();
vente.ttc.setZeros();
vente.ttc.rate(vente.base,vente.nbritem,vente.tax) catch | err | dcml.dsperr(err);
std.debug.print("\r\n  Prices all taxes included {s}\r\n",.{vente.ttc.string()});

std.debug.print("\r\n-----------------------------------\r\n",.{});



dcml.debugContext();
std.debug.print("\r\nzeros {}\r\n",.{vente.ttc.isZeros()});

var r = dcml.DCMLFX.init(7,3) ;      // set 0 init default
var t = dcml.DCMLFX.init(12,2) ;
const x = dcml.DCMLFX.init(12,0) ;
var z = dcml.DCMLFX.init(5,2) ;
var y = dcml.DCMLFX.init(7,0) ;       // set 0 init default
t.setDcml("2.46") catch unreachable;
x.setDcml("2") catch unreachable;


r.floor(t) catch unreachable;

std.debug.print("\r\n {s} floor  {s}\r\n",.{t.string(),r.string()});

r.ceil(t) catch unreachable;
std.debug.print("\r\n {s} ceil  {s}\r\n",.{t.string(),r.string()});



r.rem(t,x) catch unreachable;

std.debug.print("\r\n  rem  {s}\r\n",.{r.string()});

t.setZeros();






r.setDcml("12.650") catch unreachable;
const repcmp = dcml.cmp(r,t) catch | err | { dcml.dsperr(err); return; } ;

if(repcmp == dcml.CMP.GT) std.debug.print("\r\n repcmp = dcml.cmp(r,t)  =  r > t \r\n",.{});


r.setDcml("12.6504") catch unreachable;
r.round();
std.debug.print("\r\n  12.6504 round 12.6504 (7.3) {s}\r\n",.{r.string()});

r.setDcml("12.6506") catch unreachable;
r.round();
std.debug.print("\r\n  12.6506 round 12.6506 (7.3)  {s}\r\n",.{r.string()});


y.setDcml("12.6504") catch unreachable;
std.debug.print("\r\n  12.6504 (7,0)  {s}\r\n",.{y.string()});

r.setDcml("1.7855" ) catch unreachable;
std.debug.print("\r\n  no trunc 1.7855  (7.3) {s}\r\n",.{r.string()});

r.setDcml("1.7855" ) catch unreachable;
r.trunc();
std.debug.print("\r\n  trunc 1.7855 (7.3) {s}\r\n",.{r.string()});


t.setDcml("50.00") catch unreachable;
r.setDcml("2.00") catch unreachable;

z.multTo(t,r) catch | err | dcml.dsperr(err);
 std.debug.print("\r\n t{s} mult r{s} =  {s}\r\n",.{ t.string(),r.string(),z.string()});

t.div(r) catch | err | dcml.dsperr(err); 

std.debug.print("\r\n  t.div(r) ?  {s}\r\n",.{t.string()});
t.debugPrint("t.div(r):");




r.setZeros();
t.div(r) catch | err |  {std.debug.print("\r\n {}\r\n",.{ err});};

std.debug.print("fin",.{});

}
