# zig_Decimal<br>
<br>
processing decimal numbers with mpdecimal as a backdrop<br>
<br>
***I wrote this lib to free myself from arithmetic problems on large decimals***<br>
<br>
[https://speleotrove.com/decimal/](https://speleotrove.com/decimal/)<br>
<br>
This part explains why we need it.<br>
<br>
Another source that inspired me and that joins what I think<br>
<br>
[https://github.com/dnotq/decNumber](https://github.com/dnotq/decNumber)<br>
<br>
---
<br>
**os linux** <br>
**I don't have Windows or Macintosh but it should work **<br>
<br>
&nbsp;&nbsp;[https://www.bytereef.org/mpdecimal/index.html](https://www.bytereef.org/mpdecimal/index.html)<br>
<br>
const c = @cImport( { @cInclude("mpdecimal.h"); } );<br>
<br>
installation with your package manager or download<br>
<br>
validated: by https://speleotrove.com/decimal/<br>
<br>
official site thank you for making this standardization available<br>
<br>
---
<br>
&rarr; 2023-02-27 add compare  a, b  =   enum CMP. LT EQ LT<br>
&rarr; 2023-03-02 add ceil     r = a<br>
&rarr; 2023-03-02 add rem      r = a / b<br>
&rarr; 2023-03-02 result alignment with AS400<br>
&rarr; 2023-03-02 update ebugPrint(cnbr: DCMLFX, txt : []const u8) <br>
<br>
&nbsp;&nbsp;&nbsp; CTX_ADDR Communication structure for default common control decimal128 -> MPD_ROUND_HALF_EVEN<br>
<br>
&nbsp;&nbsp;&nbsp; openContex() :<br>
&nbsp;&nbsp;&nbsp; it is possible, to have very very large numbers<br>
&nbsp;&nbsp;&nbsp; disable&nbsp;c.mpd_ieee_context but you go out of the norm<br>
<br>
&nbsp;&nbsp;&nbsp; DCMLFX &nbsp;includes 3 values<br>
&nbsp;&nbsp;&nbsp;       number: mpdecimal structure [*c]<br>
&nbsp;&nbsp;&nbsp;       integer: number of integers in front of the point<br>
&nbsp;&nbsp;&nbsp;       scale: number of integers behind the point<br>
<br>
&nbsp;&nbsp;&nbsp;   associated function:<br>
<br>
&nbsp;&nbsp;&nbsp;   def: checks the relevance of bounding with mpdecimal and determines the fixed decimal<br>
&nbsp;&nbsp;&nbsp;         Test if the context is active otherwise it calls openContext()<br>
&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;   free: frees the associated memory storage ".number" (not the definition)<br>
<br>
&nbsp;&nbsp;&nbsp;   debugPrint: small followed by ".number"<br>
<br>
&nbsp;&nbsp;&nbsp;   isNumber: check value is compliant '0-9 + - .' compliant SQL postgres DB2...<br>
<br>
&nbsp;&nbsp;&nbsp;   isValide: uses isNumber, and checks if the external value  complies with the boundary<br>
<br>
&nbsp;&nbsp;&nbsp;   isOverflow: check if the internal value is out of bounds<br>
<br>
&nbsp;&nbsp;&nbsp;   assign: give a value (text format) to ".number"<br>
<br>
&nbsp;&nbsp;&nbsp;   setZeros: forces the value 0 to ".number"<br>
<br>
&nbsp;&nbsp;&nbsp;   isZeros: checks if the value 0<br>
<br>
&nbsp;&nbsp;&nbsp;   round: two-function round and truncate (0.5 = +1) see finance...<br>
<br>
&nbsp;&nbsp;&nbsp;   trunc: to a function, truncate without rounding<br>
<br>
&nbsp;&nbsp;&nbsp;   string: if the scale part is larger than its definition,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;it rounds then adds zeros if necessary<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(respects the SQL display alignment standard on the left ex: 1.00)<br>
<br>
&nbsp;&nbsp;&nbsp;   add: a = a + b<br>
<br>
&nbsp;&nbsp;&nbsp;   sub: a = a - b<br>
<br>
&nbsp;&nbsp;&nbsp;   mul: a = a x b<br>
<br>
&nbsp;&nbsp;&nbsp;   div: a = a / b      if b = zeros raises an error<br>
<br>
&nbsp;&nbsp;&nbsp;   addTo: r = a + b<br>
<br>
&nbsp;&nbsp;&nbsp;   subTo: r = a - b<br>
<br>
&nbsp;&nbsp;&nbsp;   mulTo: r = a x b<br>
<br>
&nbsp;&nbsp;&nbsp;   divto: r = a / b      if b = zeros raises an error<br>
<br>
&nbsp;&nbsp;&nbsp;   floor: r = a<br>
<br>
&nbsp;&nbsp;&nbsp;   ceil : r = a<br>
<br>
&nbsp;&nbsp;&nbsp;   rem  : r = a / b      if b = zeros raises an error<br>
<br>
&nbsp;&nbsp;&nbsp;   rate: raises a value with the percentage ex ( n = (val x nbr) , val = (n x %1.25)<br>
<br>
&nbsp;&nbsp;&nbsp;<br>
<br>
&nbsp;&nbsp;&nbsp; function off DCMLF<br>
<br>
&nbsp;&nbsp;&nbsp; enum CMP LT EQ GT<br>
<br>
&nbsp;&nbsp;&nbsp; cmp compare  a ,b return CMP<br>
<br>
&nbsp;&nbsp;&nbsp; mdrate module: returns ex: ttc , htx (base val, article nrb, rate = 25 ) practice in 5 operations<br>
<br>
&nbsp;&nbsp;&nbsp; forceAssign: forces the value<br>
<br>
&nbsp;&nbsp;&nbsp; dsperr: practical @panic product in test<br>
<br>
&nbsp;&nbsp;&nbsp; debugContext: print context<br>
