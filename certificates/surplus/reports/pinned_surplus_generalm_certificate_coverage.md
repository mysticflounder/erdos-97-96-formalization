<!--
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Author: Adam McKenna <adam@mysticflounder.ai>
-->

# Pinned surplus general-m certificate coverage

This is a finite-interface falsifier, not a geometric realizability
test. Nonfixed masks range over submasks of exact admissible masks;
the model enforces cyclic cross-separation and the global at-most-two
pair-count bound. A SAT result means that every singleton certificate
can be made to miss at least one nonzero erased-center generator fact.

## Results

| minimum nonfixed labeled card | SAT rows | UNSAT rows | unknown |
|---:|---:|---:|---:|
| 2 | 15 | 0 | 0 |
| 3 | 15 | 0 | 0 |
| 4 | 0 | 15 | 0 |

All 15 fixed v/w rows admit uncovered masks at floors 2 and 3.
All 15 are covered at floor 4, reproducing exact-bank completeness.
Therefore the current 135 certificates do not establish a
general-m submask bridge from the known finite constraints alone;
closure needs four-label confinement, stronger geometric selection,
or a genuinely broader certificate family.

Representative SAT assignments for every row are recorded in the
machine report.
