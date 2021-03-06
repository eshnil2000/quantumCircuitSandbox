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
## @deftypefn {Function File} {@var{D} =} puretodensity (@var{p})
##
## Compute the density matrix @var{D} for quantum pure state @var{p} where @var{p} is in state vector form.
##
## @end deftypefn


## usage D = puretodensity(p)
##
## Compute the density matrix for pure state p
##

## Author: Logan Mayfield <lmayfield@monmouthcollege.edu>
## Keywords: States

function D = puretodensity(p)
  D = p * (p');
endfunction
