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
Another source that inspired me and that joins what I think 1990 <br>
<br>
[https://github.com/dnotq/decNumber](https://github.com/dnotq/decNumber)<br>
<br>
---
<br>
<br>
&nbsp;&nbsp;[https://www.bytereef.org/mpdecimal/index.html](https://www.bytereef.org/mpdecimal/index.html)<br>
<br>
Include("mpdecimal.h) view build;<br>
<br> you need to mount the mpdecimal package in your system<br>
<br>
installation with your package manager or download<br>
<br>
validated: by https://speleotrove.com/decimal/<br>
<br>
official site thank you for making this standardization available<br>
<br>
---
<br>

&rarr; 2023-03-27 test decimal 256 - 70 digit and  512 - 142 digit  work bank international <br>
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


<br>
&nbsp;&nbsp;&nbsp;   string: if the scale part is larger than its definition,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;it rounds then adds zeros if necessary<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(respects the SQL display alignment standard on the left ex: 1.00)<br>
<br>
&nbsp;&nbsp;&nbsp;   rate: raises a value with the percentage ex ( n = (val x nbr) , val = (n x %1.25)<br>
<br>



|Function      | Description                                          | Pub |
|--------------|------------------------------------------------------|-----|
|openContex    | Creates icontext internal lib mpdecimal              |     |
|init          | Creates Decimal  (E,tier ,  Scal)                    |  x  |
|deinit        | De-allocates the Decimal                             |  x  |
|              |                                                      |     |
|isActif       | check the area is still active                       |  x  |
|isNumber      | check value is compliant '0-9 + - .'                 |     |
|isValide      | control number and validity normalize                |  x  |
|isOverflow    | check if the internal value is out of bounds         |  x  |
[setDcml       | give a value (text format) to ".number"              |  x  |
|setZero       | forces the value 0 to ".number"                      |  x  |
|isZeros       | checks if the value 0                                |  x  [
|round         | two-function round and truncate see finance...       |  x  |
|trunc         | to a function, truncate without rounding             |  x  |
|string        | format area if the scale part is larger,it rounds    |  x  |
|              |                                                      |     |
|add           | a = a + b  a.add(b)                                  |  x  |
|sub           | a = a - b                                            |  x  |
|mult          | a = a * b                                            |  x  |
|div           | a = a / b  if b = zeros raises an error              |  x  |
|addTo         | r = a + b  r.addto(a,b)                              |  x  |
|subTo         | r = a - b                                            |  x  |
|multTo        | r = a * b                                            |  x  |
|divTo         | r = a / b  if b = zeros raises an error              |  x  |
|floor         | r = a                                                |  x  |
|ceil          | r = a                                                |  x  |
|rem           | r = a / b  if b = zeros raises an error              |  x  |
|rate          | total.rate(prix,nbritem,tax)                         |  x  |
|cmp           | compare a , b returns EQ LT GT                       |  x  |
|              |                                                      |     |
|dsperr        | practical @panic product in test                     |  x  |
[debugContext  | displlay  context value internal mpdecimal           |  x  [
|debugPrint    | small followed by ".number"                          |  x  |
|              |                                                      |  x  |
|Dcmliterator  | Struct Iterator                                      |  x  |
|next          | next iterator Char(UTF8)                             |  x  |
|preview       | preview iterator Char(UTF8)                          |  x  |
|iterator      | Returns a StringIterator over the String             |  x  |
|isUTF8Byte    | Checks if byte is part of UTF-8 character            |  .  |
|getIndex      | Returns the real index of a unicode                  |  .  |
|getUTF8Size   | Returns the UTF-8 character's size                   |  .  |
 



<br>

 sp;&nbsp;&larr; 2024-12-17  **I have completed the checks and memory leak tests, the functions are reviewed and corrected with the consideration.**
<br>
<br>
→ 2024-12-23 03:13<BR/>
Big is working on memory leaks.<BR/>
Now I think it's fixed.
<br>
<br>
<br>
&rarr; 2024-12-19 The build in the library as well as in src-zig is compliant and without redundancy.
