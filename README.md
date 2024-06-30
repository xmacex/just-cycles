# menstruation

A druid script about cyclicality, life, and keeping track of cycles for jf+crow.

This is also a script about the story that multiple menstrual cycles, perhaps of just friends, synchronize if they interact over time in close proximity such as in cohabitation. This is known as [*menstrual synchrony*](https://en.wikipedia.org/wiki/Menstrual_synchrony) (McClintock 1971). The scientific literature is controversial... but science is just science – you might have your own experiences about syncing your menstruation cycles. In any women communicating and coordinating among themselves is a powerful, dangerous and beautiful cultural idea, worth celebrating.

Impulse for writing this script came from the forum, when someone enquired for end-of-cycles pulses from jf. I hacked together a quick implementation, before this developed more conceptually. Thanks for that impulse. Earlier familiarity and some thoughts from Maths, which has end-of-cycle as well as end-of-rise outputs.

## requirements

crow, jf, i²c connection between crow and jf. interest in cyclicality.

## documentation

Crow outputs 1-4 give end-of-cycle pulses of jf outputs 1-4. Pulse width can be increased via positive voltage in crow input 1.

Additionally, jf 6 will trigger when at end-of-cycle of jf output 5. Jf outputs are not pulses like the crow outputs are, but usual jf shapes according to how curve, time, intone, advanced parameters via i2c etc.

Built primarily for jf *transient* and *sustain* modes. Start by patching triggers, gates or an LFO into jf trigger input 5 in *transient/shape* mode. Then patch crow outputs 1-4 to trigger things. Then mess with jf knobs, divide the jf with other trigger inputs, and use the jf output 6 as a related envelope for something.

crow polls jf at (currently at about 10 milliseconds). This gives constrains for how fast jf movements crow can detect. Stay below this pace for reliability. Exceed this pace if you feel like it.

## references

McClintock, Martha (1971). [Menstrual Synchrony and Suppression](https://doi.org/10.1038%2F229244a0). *Nature* 229, pp. 224-245.
