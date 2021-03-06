/****************************************************************************
*****************************************************************************
UDO DEFINITIONS IN tables/query:
*****************************************************************************
TbMem      : ipos TbMem ival, ift [, indxstrt [, indxend]]
TbPeak     : iPeak TbPeak ift [, indxstrt [, indxend]]
*****************************************************************************
****************************************************************************/

/****************************************************************************
ipos TbMem ival, ift [, indxstrt [, indxend]]
Looks whether a number is in a function table

Looks whether a number is a member of a function table, in a range between indxstart (included) and indxend (excluded). Returns the position of the element if found, or -1 otherwise.

ival - element (number) to be looked for
ift - function table
indxstart - starting index in ift to look for ival (default=0)
indxend - position after the last index which is tested (default = -1 = length of the table). if a number is given for indxend which exceeds the length of the function table, an error occurs
ipos - if ival has been found in ift, the position of the first occurence is returned, or -1, if ival has not been found
****************************************************************************/
/****************************************************************************
iPeak TbPeak ift [, indxstrt [, indxend]]
Returns the peak (highest absolute number) value of a function table.

Returns the peak value of a function table, or a part of it, in a range between indxstart (included, defaults to zero) and indxend (excluded, defaults to table length). The return value is always positive.

ift - function table
indxstart - starting index in ift to look for ival (default=0)
indxend - position after the last index which is tested (default = -1 = length of the table). if a number is given for indxend which exceeds the length of the function table, it will stop at table end
iPeak - peak value as absolute number
****************************************************************************/

  opcode TbMem, i, iioj
ival, ift, indxstrt, indxend xin
indxend   =         (indxend == -1 ? ftlen(ift) : indxend)
ipos      =         -1
loop:
iftel     tab_i     indxstrt, ift
  if iftel == ival then
ipos      =         indxstrt
          igoto     end  
  endif
          loop_lt   indxstrt, 1, indxend, loop
end:      xout      ipos
  endop

  opcode TbPeak, i, ioj
ift, indxstrt, indxend xin
indxend   =         (indxend == -1 ? ftlen(ift) : indxend)
iPeak     =         0
while indxstrt < indxend do
  iVal = abs(table:i(indxstrt, ift))
  iPeak = iVal > iPeak ? iVal : iPeak
  indxstrt += 1
od
     xout      iPeak
  endop


