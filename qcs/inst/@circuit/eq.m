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

## -*- texinfo -*-
## @deftypefn {Function File} {} circ2mat {}
##
## THIS FUNCTION IS NOT INTENDED FOR DIRECT USE BY QCS USERS.
##
## @end deftypefn

## Author: Logan Mayfield <lmayfield@monmouthcollege.edu>
## Keywords: circuits


function b = eq(this,other)

  b = isa(other,"circuit") && ...
      this.bits == other.bits && ...
      this.maxndepth == other.maxndepth && ...
      isequal(this.stepsat,other.stepsat) && ...
      isequal(this.tars,other.tars) && ...
      eq(this.seq,other.seq);

endfunction


%!test
%! A = @circuit(@seq({@single("H",2)}),3,1,[1],[2]);
%! B = @circuit(@seq({@single("X",2)}),3,1,[1],[2]);
%! C = @circuit(@seq({@single("H",1)}),3,1,[1],[1]);
%! D = @circuit(@seq({@single("H",2)}),4,1,[1],[2]);
%! assert(!eq(A,B));
%! assert(!eq(A,C));
%! assert(!eq(A,D));
%!
