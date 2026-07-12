# Cap-selected row-nogood certificate mining

Date: 2026-07-11 PDT (generated 2026-07-12 UTC)

Claim scope: **EXACT WITHIN THE FINITE MODEL** with `n = 11`, cap profile
`(6,4,4)`, and all twelve ordered choices of distinct pinned/deleted strict
surplus-interior labels.

## Result

- Discovery completed exhaustively in all 12 placements.
- Static nogood replay returned UNSAT in all 12 placements and reproduced each
  original search node count.
- All 795,609 prefix kills had a direct certificate using only row equalities
  and edge reversal; no prefix kill was uncertified.
- The longest primitive closure path had length 17.
- Detector occurrences split as 157,104 duplicate-center, 73,819
  perpendicular-bisector, 38,980 forward five-point, 33,849 reverse
  five-point, 8,505 exact-off-circle, and 2,589 convex-rhombus cores.

The exact row-minimization pass produced 163,462 deduplicated nogoods.
Subsumption removed only 14,028, leaving 149,434 minimal certificates. Of
those, 111,474 use three or four concrete rows. The full JSON artifact was
647,221,809 bytes, with SHA-256
`91bf7f10944dec33b5d2588b6265ef0edd1109c6642963f0bd6fe75896dc8b47`.
Its normalized nogood bank had SHA-256
`bdcc42e69f03e3b39a17ab44f296240a11357c0f51a99a1e60b4b00643d58c79`.

## Formalization decision

Individual explicit paths are short and proof-facing, but the flat bank is not
a practical Lean payload. It would add roughly 617 MiB before elaboration and
would require expensive linear or indexed matching over 149,434 certificates.

The selected route is therefore a generic proof that the native union-find
closure is sound with respect to `EqualityCore.EdgeClosure`. Combined with the
already-proved semantic DFS trace and twelve native placement checks, that
removes the generated payload entirely. A structurally shared trie/DAG remains
a fallback if the generic union-find proof becomes intractable.

The compact machine-readable record beside this file preserves the exact
counts, source hash, full-artifact hash, bank hash, and route decision.
