# TS2068-extended-color

A quick and dirty example of the TS2068's 'extended color' mode.

![Screenshot](extended-color.gif)

Written to accompany my article on the [TS2068](http://21twice.com/posts/2024/01/15/timex-sinclair-ts2068.html).

Uses the sprites from the [BIFROST\*2 engine](https://spectrumcomputing.co.uk/entry/30003/ZX-Spectrum/BIFROST*2_ENGINE) demo. These have been converted by `rearrange_clite.py` in the `tools` folder so that each row of pixel data is now followed by the corresponding attribute bytes. The new `.bin` is include; the original `.clite` can be found at the link above.

Assemble with Pasmo using `pasmo -1 --tapbas main.asm ts2068.tap > debug.txt` (or similar).


