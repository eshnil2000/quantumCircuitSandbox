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

## usage: b = stdBasis(i,n)
##
## Compute the n qubit standard basis corresponding to
## the natural number i OR binary representation of i as a vector
## and return it as a 2^n column vector of type values
##
## 

## Author: Logan Mayfield <lmayfield@monmouthcollege.edu>
## Keywords: States

function b = stdBasis(i,n,t="double")
  validTypes = ["double";"complex";"single";"int";"logical"];	 
  tVal = strmatch(t,validTypes,"exact");

  ## convert to i to integer
  if( length(i) > 1 ) # its a vector
    if( length(i) > n )
      error("binary number too long");
    endif
    ## convert to integer
    pows = (2*ones(1,length(i))) .^ [0:length(i)-1];
    i = sum(pows .* i);    
  endif # i is now a postiver integer

  if( i < 0 || i > (2^n-1) )
    error("i must be in [0,%d). Given i=%d",2^n,i);    
  elseif( size(tVal) != [1,1] )
    error("type not supported");
  endif
  
  tVal = tVal(1);
  b = [0:(2^n -1 )]' == i;
  
  if( tVal  == 1 )
    b = double(b);
  elseif( tVal == 2 )
    b = complex(b);
  elseif( tVal == 3 )
    b = single(b);
  elseif( tVal == 4 )
    b = uint8(b);
  endif
  # else leave it as logical

end
