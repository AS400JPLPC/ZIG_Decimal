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

}