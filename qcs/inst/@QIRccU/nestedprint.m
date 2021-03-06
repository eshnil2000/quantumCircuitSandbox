## Copyright (C) 2015  James Logan Mayfield
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
## @deftypefn {Function File} {} nestedprint (@var{g},@var{d})
##
## Display the CC-U gate @var{g} with indentation ndepth @var{d}
##
## @end deftypefn

## Author: Logan Mayfield <lmayfield@monmouthcollege.edu>
## Keywords: QIR

function nestedprint(sGate,dep,clip=16)
  pad = blanks(dep*3);
  if( length(sGate.op) == 1)
    switch(sGate.op{1})
      case "X"
      fprintf ("%s{\"Toffoli",pad);
      otherwise
      fprintf ("%s{\"CC-%s",pad,sGate.op{1});
    endswitch
  else
    fprintf ("%s{\"CC-%s(",pad,sGate.op{1});
    fprintf("%.3f,",sGate.op{2}(1:end-1));
    fprintf("%.3f)",sGate.op{2}( end ));
  endif
  fprintf("\",%d,[%d,%d]}\n",sGate.tar,sGate.ctrls(1),sGate.ctrls(2) );
  
endfunction
