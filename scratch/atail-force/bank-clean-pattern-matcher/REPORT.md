# Bank-clean 15-equality matcher preflight

This scratch audit prepares the corrected CEGAR matcher for the exact
15-equality consumer under construction. It does not claim a Lean theorem or
add a producer-bank cut before that consumer kernel-checks.

`check.py` pins the canonical 101-survivor checkpoint and replays the
nine-role pattern

```text
O: A E
A: O G K
X: Z G F
Y: O X Z
Z: A Y G
G: X E K
K: O Y G
F: A Z K
```

with only `O != A`; every other role may alias, matching the proposed Lean
statement. A closure-index backtracking matcher checks all 101 corrected
survivors. An independent Z3 encoding over direct selected-row containment
smoke-checks the terminal positive instance and survivor 0 as a negative
instance.

Current result:

- seven of 101 survivors contain this pattern: indices
  `13, 18, 47, 61, 62, 98, 100`;
- terminal survivor 100 has the identity role map;
- the first six hits already have older bank matches;
- survivor 100 is the current bank-clean shadow, so the new consumer will
  provide a genuine progress cut once it is kernel checked.

Replay from the repository root:

```bash
UV_CACHE_DIR=/tmp/uv-cache-atail uv run python \
  scratch/atail-force/bank-clean-pattern-matcher/check.py
```

Epistemic status: exact within the pinned corrected finite shadow and matcher
encoding; `MATCHER_READY_LEAN_CONSUMER_PENDING`. The matcher is not proof and
must not enter the production bank until the named Lean consumer compiles and
its axiom closure is audited.

## Post-survey production-bank preflight

The 2026-07-15 scratch-lane survey surfaced the newly production-built
`Problem97.Census554.MECStraddlingRowCore`.  `check.py` now independently
tests both its positive `Geometry` and reflected `NegativeGeometry` shapes
against the same corrected stream, using the full ambient five-point row at
`O`, the other thirteen selected rows, all six permutations of the nonobtuse
MEC boundary triple `O,A,C`, equality closure, and the fixed cyclic order.

That consumer embeds in 36 of the 101 shadows, with 378 positive and 384
reflected embeddings.  Every hit is earlier than the terminal and already had
an older bank match.  Terminal shadow 100 has 220 raw equality-core
embeddings, but zero has the four agreeing strict signs required by either
geometry structure.  Its most frequent nondegenerate near-miss has signature
`(+,+,+,-)` (35 copies); the reflected `(-,-,-,+)` signature occurs 26 times.
Thus the production theorem is a valid future bank improvement but does not
replace the terminal 15-equality consumer.  The missing condition at the
terminal is exactly cyclic straddling orientation, not equality closure, MEC
disk containment, or nonobtuseness.
