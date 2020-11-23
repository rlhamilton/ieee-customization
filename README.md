# ieee-customization
Docbook stylesheet customization to create PDF in IEEE conference proceedings style

Date:    09 May 2011, revised 23 November 2020
Version: 1.2

This is a customization of the DocBook XSL Stylesheets
that takes a DocBook article and converts it to a PDF
file in IEEE conference proceedings style. It is released
under the GNU General Public License (see LICENSE file).

## CAVEAT

This customization was originally written in 2007, revised in 2011,
and further revised in 2020. However, even with revisions, it no
longer conforms to current IEEE proceedings style. However, it
may be useful as a starting place for subsequent customizations or
for other publications that use a two-column format.

### How to use:

fo.xsl is a simple customization using the DocBook XSL
stylesheets. You will need to edit the xsl:import line
in this file to point to wherever you have placed the standard DocBook XSL stylesheets.

This has been tested with DocBook stylesheets up to 1.79.2 and snapshots
through 20200603.

The Makefile uses xsltproc for XSL processing and has targets
for FOP and XEP (RenderX). You will need to edit the top of this
file to point to the xslt command and whichever of the xep and fop
commands you want to use.

The transform has been tested with xep and fop, but works best
with xep. The fop rendering does not handle footnotes cleanly.

The file authguide.xml contains a DocBook XML version of the author's guide used to create this stylesheet.
You can build it by typing: make guidefop or make guidexep, depending on which formatter you choose to use.

### To Do/Known Problems:

The stylesheets are mostly complete, but not widely tested.
Here are some known deficiencies:

- This customization no longer (if it ever did) conforms with
  IEEE's conference format. It isn't too far off, but if you
  use it to submit a paper to IEEE, the paper will almost surely be rejected.
- Stylesheet did not work correctly with DocBook 1.72.0
  transforms, but it did work with 1.69.1 or 1.70.x, and
  also appears to work correctly with releases after 1.76.1.
  up until at least 1.79.2.
- Author processing needs to handle multiple authors
  better.  Right now, it just lines them up vertically.
- The margins need some tweaking to be exactly correct.
- Footnotes could be handled better in fop; I'm not
  sure if that's a deficiency in fop or a problem in
  my customization. However, they work well with XEP
- Should be two lines between Abstract and next paragraph.
  This works with XEP, but not with fop.

If you discover problems, feel free to let me know.
Or, if you fix a problem, please send me the fix and
I'll fold it back in. I can't guarantee that I can fix
any problems, but I'll do my best.

Richard Hamilton, 23 November 2020
