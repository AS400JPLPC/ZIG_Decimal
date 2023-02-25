# zig_Decimal

processing decimal numbers with mpdecimal as a backdrop

***I wrote this lib to free myself from arithmetic problems on large decimals***

[https://speleotrove.com/decimal/](https://speleotrove.com/decimal/)

This part explains why we need it.

Another source that inspired me and that joins what I think

[https://github.com/dnotq/decNumber](https://github.com/dnotq/decNumber)

---

**os linux** `<br/>`
**I don't have Windows or Macintosh but it should work **

&nbsp;&nbsp;[https://www.bytereef.org/mpdecimal/index.html](https://www.bytereef.org/mpdecimal/index.html)

const c = @cImport( { @cInclude("mpdecimal.h"); } );

installation with your package manager or download

validated: by https://speleotrove.com/decimal/

official site thank you for making this standardization available

---

&nbsp;&nbsp;&nbsp; CTX_ADDR Communication structure for default common control decimal128 -> MPD_ROUND_05UP
&nbsp;&nbsp;&nbsp; openContex()v
&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp; DCMLFX includes 3 values
&nbsp;&nbsp;&nbsp;       number: mpdecimal structure [*c]
&nbsp;&nbsp;&nbsp;       integer: number of integers in front of the point
&nbsp;&nbsp;&nbsp;       scale: number of integers behind the point

&nbsp;&nbsp;&nbsp;   associated function:

&nbsp;&nbsp;&nbsp;   def: checks the relevance of bounding with mpdecimal and determines the fixed decimal
&nbsp;&nbsp;&nbsp;         Test if the context is active otherwise it calls openContext()
&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;   free: frees the associated memory storage ".number" (not the definition)

&nbsp;&nbsp;&nbsp;   debugPrint: small followed by ".number"

&nbsp;&nbsp;&nbsp;   isNumber: check value is compliant '0-9 + - .' compliant SQL postgres DB2...

&nbsp;&nbsp;&nbsp;   isValide: uses isNumber, and checks if the external value  complies with the boundary

&nbsp;&nbsp;&nbsp;   isOverflow: check if the internal value is out of bounds

&nbsp;&nbsp;&nbsp;   assign: give a value (text format) to ".number"

&nbsp;&nbsp;&nbsp;   setZeros: forces the value 0 to ".number"

&nbsp;&nbsp;&nbsp;   isZeros: checks if the value 0

&nbsp;&nbsp;&nbsp;   round: two-function round and truncate (0.5 = +1) see finance...

&nbsp;&nbsp;&nbsp;   trunc: to a function, truncate without rounding

&nbsp;&nbsp;&nbsp;   string: if the scale part is larger than its definition,
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;it rounds then adds zeros if necessary
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(respects the SQL display alignment standard on the left ex: 1.00)

&nbsp;&nbsp;&nbsp;   add: a = a + b

&nbsp;&nbsp;&nbsp;   sub: a = a - b

&nbsp;&nbsp;&nbsp;   mul: a = a x b

&nbsp;&nbsp;&nbsp;   div: a = a / b      if b = zeros raises an error

&nbsp;&nbsp;&nbsp;   addTo: r = a + b

&nbsp;&nbsp;&nbsp;   subTo: r = a - b

&nbsp;&nbsp;&nbsp;   mulTo: r = a x b

&nbsp;&nbsp;&nbsp;   divto: r = a / b      if b = zeros raises an error

&nbsp;&nbsp;&nbsp;   rate: raises a value with the percentage ex ( n = (val x nbr) , val = (n x %1.25)

&nbsp;&nbsp;&nbsp;

&nbsp;&nbsp;&nbsp; function off DCMLF

&nbsp;&nbsp;&nbsp; mdrate module: returns ex: ttc , htx (base val, article nrb, rate = 25 ) practice in 5 operations

&nbsp;&nbsp;&nbsp; forceAssign: forces the value

&nbsp;&nbsp;&nbsp; dsperr: practical @panic product in test

&nbsp;&nbsp;&nbsp; debugContext: print context
