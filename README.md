# ieee-customization
Docbook stylesheet customization to create PDF in IEEE conference proceedings style

Date:    09 May 2011, revised 23 November 2020
Version: 1.2

This is a customization of the DocBook XSL Stylesheets
that takes a DocBook article and converts it to a PDF
file in IEEE conference proceedings style. It is released
under the GNU General Public License (see LICENSE below).

### How to use:

fo.xsl is a simple customization using the DocBook XSL
stylesheets.  If you use Linux, there's a reasonable
chance that the fop.mk file will work with minor updates
(e.g., the resolver directory for the catalogs).

The transform has been used with xep and fop.  If you
use xep, you will need to uncomment the xep.extensions
parameter defined in fo.xsl or set that value to 1 from
the command line.

Changes in 1.1:

- Updated for DocBook 1.70.1 stylesheets

Changes in 1.2:

- Tested with DocBook 1.76.1 stylesheets
- PDF made with XEP (I don't have fop installed on my system,
  so I couldn't test it this time around)
- The stylesheet customizations are unchanged from 1.1

To Do/Known Problems:

The stylesheets are mostly complete, but not widely tested.
Here are some known deficiencies:

- Stylesheet did not work correctly with DocBook 1.72.0
  transforms, but it did work with 1.69.1 or 1.70.x, and
  also appears to work correctly with 1.76.1.
- Author processing needs to handle multiple authors
  better.  Right now, it just lines them up vertically.
- The margins need some tweaking to be exactly correct.
- Footnotes could be handled better in fop; I'm not
  sure if that's a deficiency in fop or a problem in
  my customization. However, they work well with XEP
- Should be two lines between Abstract and next paragraph.
  This works with XEP, but may not be correct with fop.

If you discover problems, feel free to let me know.
Or, if you fix a problem, please send me the fix and
I'll fold it back in. I can't guarantee that I can fix
any problems, but I'll do my best.

Richard Hamilton
dick@rlhamilton.net
9 May 2011

LICENSE:
    Copyright (C) 2007 Richard L. Hamilton

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
