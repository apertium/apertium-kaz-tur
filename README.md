Kazakh and Turkish (`apertium-kaz-tur`)
===============================================================================

This is an Apertium language pair for translating between Kazakh and
Turkish. What you can use this language package for:

* Translating between Kazakh and Turkish
* Morphological analysis of Kazakh and Turkish
* Part-of-speech tagging of Kazakh and Turkish

For information on the latter two points, see subheading "For more
information" below

Requirements
===============================================================================

You will need the following software installed:

* lttoolbox (>= 3.3.0)
* apertium (>= 3.3.0)
* vislcg3 (>= 0.9.9.10297)
* hfst (>= 3.8.2)
* apertium-kaz
* apertium-tur

If this does not make any sense, we recommend you look at: www.apertium.org

Compiling
===============================================================================

Given the requirements being installed, you should be able to just run:
```
$ ./configure
$ make
```

You can use `./autogen.sh` instead of `./configure` you're compiling from
Git. If you installed any prerequisite language packages using a `--prefix`
to `./configure`, make sure to give the same `--prefix` to `./configure` here.

Testing
===============================================================================

If you are in the source directory after running make, the following
commands should work:
```
$  echo "TODO test sentence 1" | apertium -d . kaz-tur
TODO test translated sentence 1
```

```
$ echo "TODO test sentence 2" | apertium -d . tur-kaz
TODO test translated sentence 2
```

After installing somewhere in `$PATH`, you should be able to do e.g.
```
$  echo "TODO test sentence 1" | apertium kaz-tur
TODO test translated sentence 1
```
Files and data
===============================================================================

* `apertium-kaz-tur.kaz-tur.dix`  - Bilingual dictionary
* `apertium-kaz-tur.kaz-tur.t1x`  - Chunking rules for translating into Turkish
* `apertium-kaz-tur.tur-kaz.t1x`  - Chunking rules for translating into Kazakh
* `apertium-kaz-tur.kaz-tur.t2x`  - Interchunk rules for translating into Turkish
* `apertium-kaz-tur.tur-kaz.t2x`  - Interchunk rules for translating into Kazakh
* `apertium-kaz-tur.kaz-tur.t3x`  - Postchunk rules for translating into Turkish
* `apertium-kaz-tur.tur-kaz.t3x`  - Postchunk rules for translating into Kazakh
* `apertium-kaz-tur.kaz-tur.lrx`  - Lexical selection rules for translating into Turkish
* `apertium-kaz-tur.tur-kaz.lrx`  - Lexical selection rules for translating into Kazakh
* `modes.xml`                     - Translation modes

For more information
===============================================================================

* http://wiki.apertium.org/wiki/Installation
* http://wiki.apertium.org/wiki/apertium-kaz-tur
* http://wiki.apertium.org/wiki/Using_an_lttoolbox_dictionary

Help and support
===============================================================================

If you need help using this language pair or data, you can contact:

* Mailing list: apertium-stuff@lists.sourceforge.net
* IRC: `#apertium` on `irc.freenode.net`

See also the file AUTHORS included in this distribution.
