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

## Usage: q = compile(this)
##
## returns approximate @QASMcircuit to @QIASMcircuit this. Non-QASM operators
## are approximated.  
##

## Author: Logan Mayfield <lmayfield@monmouthcollege.edu>
## Keywords: QIASM
 

function q = compile(this,eta)
  ## to achieve eta precision we must approximate each non-elementary 
  ## operator to precision eta/m, where m is the number of
  ## non-elementary operators in the circuit.


  ## load in global var UZERO
  ## This is a 2D cell array that contains precomputed 
  ## sequences used as initial approximations

  ## ** NEED Platform/install independent way to do this **
  pkgpath = "/usr/share/octave/packages"; #package folder
  ## name-version
  ocstr = sprintf("oct-circuits-%s",...
		  pkg("describe","oct-circuits"){1}.version);  
  ## path to data within package	    
  matpath = "@QIASMcircuit/private/uzero.mat";
  ## absolute path to file
  uzpath = sprintf("%s/%s/%s",pkgpath,ocstr,matpath);

  load(uzpath); # load 

  ## required accuracy per approximated operation
  opEta = eta/this.numtoapprox;


  q = @QASMcircuit(compile(this.seq,opEta),this.bits);
  
  ## clear global data table
  clear -g UZERO;

endfunction
