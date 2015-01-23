## Copyright (C) 2014  James Logan Mayfield
##
##  This program is free software: you can redistribute it and/or modify
##  it under the terms of the GNU General Public License as published by
##  the Free Software Foundation, either version 3 of the License, or
##  (at your option) any later version.
##
##  This program is distributed in the hope that it will be useful,
##  but WITHOUT ANY WARRANTY; without even the implied warranty of
##  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
##  GNU General Public License for more details.
##
##  You should have received a copy of the GNU General Public License
##  along with this program.  If not, see <http://www.gnu.org/licenses/>.

## Usage: C = subsref(this,idx)
##
## QIR circuit  sub-circuit selector


## Author: Logan Mayfield <lmayfield@monmouthcollege.edu>
## Keywords: QIR

function C = subsref(this,idx)
  ## do some error checking first or let the seq methods
  ##  catch it on the fly?

  ## select out the sub-sequence and construct with current
  ## number of bits
  C = @QIRcircuit(subsref(get(this,"seq"),idx),get(this,"bits"));

endfunction

%!test
%! assert(false);