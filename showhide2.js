/* ===================================================================
$Id: showhide.js,v 1.1 2007/03/20 18:54:55 psy Exp $

Copyright (C) 2005 Tristan Miller <psychonaut@nothingisreal.com>

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or (at
your option) any later version.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,
USA.

=================================================================== */

var getComputedValue = (function(v) {
  if (v && v.getComputedStyle) {
    return function(e, p, pE) {
      return v.getComputedStyle(e, pE || null)[p];
    };
  } else {
    v = null;
    return function(e, p) {
      if (e && e.currentStyle)
	return e.currentStyle[p];
    };
  }
}
			)(document.defaultView);

function toggleAll(itemname) {
   tmp = document.getElementsByTagName('div');
   for (i = 0; i < tmp.length; i++) {
      if (tmp[i].className == itemname) {
        if (getComputedValue(tmp[i], 'display') == 'none')
           tmp[i].style.display = 'block';
        else
           tmp[i].style.display = 'none';
      }
   }
}
