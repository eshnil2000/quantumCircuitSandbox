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

## Usage: t = collectTars(this)
##
## get the set of qubit indices used by gates in the sequence. the set
## is returned sorted, not in order affected.


## Author: Logan Mayfield <lmayfield@monmouthcollege.edu>
## Keywords: QIASM

function t = collectTars(this)
  t = collectTars(this.seq);
endfunction

%!test
%! C = @QIASMseq({@QIASMsingle("H",2),@QIASMmeasure([1,4]),...
%!               @QIASMcNot(3,1),@QIASMsingle("X",4)});
%! assert(1:4,collectTars(C));
%! D = @QIASMseq({C,@QIASMsingle("Y",7)});
%! assert([1,2,3,4,7],collectTars(D));
