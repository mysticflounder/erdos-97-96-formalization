# Exact-11 `s2_o0` / G3 source-position reuse audit

Authenticated source-position overlap only; semantic reuse still requires the corresponding kernel-checked G3 family theorem.

| family | s2 retained | G3 common | G3 selected only | s2 only |
|---|---:|---:|---:|---:|
| `inherited-census554-base` | 29295 | 22967 | 0 | 6328 |
| `inherited-separation` | 17792 | 9804 | 0 | 7988 |
| `inherited-source-tail` | 169 | 168 | 1 | 0 |
| `local-equality-transitivity` | 73 | 13 | 0 | 60 |
| `selected-row-internal-radius-equalities` | 4642 | 3568 | 0 | 1074 |
| `source-center-iff-some-source-row-choice` | 164 | 163 | 0 | 1 |
| `used-center-iff-some-source-center-map` | 1 | 1 | 0 | 0 |
| `source-choice-implies-entire-blocker-radius-class` | 16 | 11 | 0 | 5 |
| `source-choice-no-qfree-after-that-source-deletion` | 101 | 73 | 0 | 28 |
| `first-apex-named-exact-five-entire-class` | 7 | 0 | 7 | 0 |
| `global-edge-equality-transitivity` | 1464 | 1010 | 0 | 454 |
| `selected-row-global-equality-seeds` | 8214 | 5903 | 0 | 2311 |
| `first-apex-exact-five-global-equality-seeds` | 10 | 0 | 10 | 0 |
| `duplicate-center-core-exclusions` | 188 | 72 | 0 | 116 |
| `perpendicular-bisector-core-exclusions` | 172 | 120 | 0 | 52 |
| `convex-five-point-core-forward-exclusions` | 395 | 207 | 0 | 188 |
| `v6-local-four-class-witness-iff` | 12 | 10 | 0 | 2 |
| `v6-qdeleted-pair-witness-iff` | 4 | 0 | 0 | 4 |
| `v6-u5-nontriple-equilateral-incompatibilities` | 10 | 5 | 0 | 5 |
| `v6-u5-common-bisector-triple-incompatibilities` | 2 | 0 | 0 | 2 |
| `v7-global-two-center-bisector-parity` | 18522 | 10843 | 0 | 7679 |
| **total** | **81253** | **54938** | **18** | **26297** |

The 18 `g3-selected-only` positions are the two first-apex families. They may reuse the unguarded occurrence semantics, but not the G3 guarded-clause checkpoint theorem verbatim.
