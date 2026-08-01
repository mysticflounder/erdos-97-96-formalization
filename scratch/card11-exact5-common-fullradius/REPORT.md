# Full-radius common-center report

Run date: 2026-07-30.

## Terminal result

All four fixed card-11 exact-five common-center shells are **UNSAT** in the
full local distance-class encoding.  Each exact persisted CNF has an
independently accepted CaDiCaL DRAT proof.

| shell `(s,o)` | variables | clauses | CaDiCaL wall seconds | DRAT bytes | CNF SHA-256 |
|---|---:|---:|---:|---:|---|
| `(2,0)` | 41,510 | 512,308 | 0.094 | 10,177 | `4c2fa2c5c11dbc06eb3154ebd27e68485a95372168d03bea47472534ca75fdf7` |
| `(2,9)` | 41,510 | 512,308 | 0.093 | 10,792 | `a0cde8b3634d3d94a487098e914df6803fe51c9409b4710b84cb79c689d5f75f` |
| `(3,0)` | 41,510 | 512,308 | 0.098 | 9,487 | `068c6d043b27829864548114fed2e9940edf0d77496a1dfd9f5072a295e19b71` |
| `(3,9)` | 41,510 | 512,308 | 0.096 | 10,075 | `e89da4184eca6add21a27e1629e87d310fdb5434919039020cd6cd7d55a40cfe` |

`verify_artifact.py` ran `drat-trim` separately on every exact CNF/proof pair.
All four checks returned exit code zero and the exact line `s VERIFIED`.
Machine-readable results, commands, hashes, manifests, transcripts, CNFs, and
proofs are under `runs/`; `summary.json` is the aggregate record.

The jobs ran serially with `-t 900`.  At most one single-threaded CaDiCaL
process was active, below the two-core limit.

## Encoded finite semantics

The inherited 41,004-variable, 414,047-clause source-indexed shell CNF retains:

- the card-11 Census-554 one-row-per-center surface;
- C2 row-intersection/triple capacity at most one;
- C4 pair-center capacity at most two;
- the direct-or-reflected boundary-order constraints;
- the named center-1 and center-8 rows containing `{6,7}`, which saturate that
  pair at exactly those two centers; and
- a total, functional source-to-selected-row map, with sources `6` and `7`
  mapped to blocker `8`.

The full-radius extension adds 506 variables and 98,261 clauses:

| clause block | clauses |
|---|---:|
| local equality transitivity | 3,960 |
| every selected row is an entire exact-four positive-radius class | 58,470 |
| blocker-center-used iff some source maps there | 6,561 |
| faithful chosen-blocker `no_qfree` after source deletion | 29,235 |
| named first-apex exact-five shell is an entire class | 35 |

At every center the equality universe is the ten incident edges to the other
carrier labels.  Reflexivity is implicit; one canonical variable for each
unordered comparison supplies symmetry; exhaustive triple clauses supply
transitivity.  The center is excluded structurally.  Since carrier labels
represent distinct points, all represented center-to-label distances are
positive.

For every positive Census row selector, the row's six internal comparisons
are equal and all 24 support/outside comparisons are unequal.  Thus the
selected four labels are the whole local radius class, not a subset.  The
first-apex five labels receive the analogous exact-class constraints.

For a used blocker center, the selected exact-four class contains its mapped
source.  Deleting that source leaves three members.  Every four-subset of the
six outside labels is forbidden from being one equality class.  Equivalence
and exact support make this precisely the finite assertion that no distance
class among the remaining carrier points has size at least four.

## Why the target shells are inconsistent

The terminal conflict already occurs at the first apex `V=1`:

1. the inherited shell clause selects a four-row `K_V` contained in the named
   five-shell `U5` and containing `{6,7}`;
2. whole-row semantics says `K_V` is an entire radius class, so the fifth
   label in `U5 \ K_V` has distance different from label `6`; while
3. whole-five-shell semantics says every label in `U5` has the same distance
   from `V`.

The last two statements contradict one another.  Consequently the
source-map and `no_qfree` blocks are faithfully present and independently
mutation-tested, but they are not needed by this particular UNSAT core.  This
is useful diagnostic information: the earlier SAT models survived only
because selected rows and the named five-shell were treated as subsets rather
than complete radius classes.

## Independent gates and mutations

The shell-free full-radius domain is SAT.  Its model was checked without
importing the encoder: all DIMACS clauses, 11 local equivalence partitions,
Census C1/one-hit/C2/C4, pair/triple capacities, selected boundary orders, the
total source map, exact selected-row support, and all 11 deletion `no_qfree`
conditions pass.

Four targeted mutations are independently DRAT-verified UNSAT:

- non-transitive local equality;
- a selected exact-four row with an outside member at the same radius;
- a chosen blocker retaining a four-class after source deletion; and
- an outside member added to a named exact-five shell.

For the third mutation, deleting only the `no_qfree` clause block makes the
same forced four-class SAT and clause-valid.  This checks that rejection comes
from the intended deletion condition rather than an incidental inherited
constraint.  Artifacts are under `self-test-artifacts/summary.json`.

## Trust boundary

The DRAT proofs establish UNSAT of the four exact finite CNFs and remove trust
in the CaDiCaL verdicts.  They do **not** close the source-to-valuation gap.
A theorem-backed adapter is still required to map an arbitrary geometric
`CriticalShellSystem` into:

- this fixed 11-label Census-554 carrier and its chosen rows;
- the four displayed common-center symmetry shells;
- the source-to-blocker valuation variables; and
- the finite equality variables with the documented exact distance meaning.

In particular, a DRAT certificate cannot prove that the labelled valuation was
obtained from the Lean geometric data.  The live source does provide the
mathematical ingredients
`CriticalShellSystem.shellAt`, `source_mem_selectedFourClass`,
`selectedFourClass_support_eq_shell`, and `CriticalShellSystem.no_qfree`;
the missing work is their explicit finite valuation/quotient ingress.  These
artifacts therefore close the four encoded shells conditionally on that
adapter, not the publish theorem by themselves.
