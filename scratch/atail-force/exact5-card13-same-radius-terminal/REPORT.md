# Exact-five card-13 same-radius asymmetric terminal

Date: 2026-07-21

Status: **THE TWO FINITE ORDINAL CNFS ARE DRAT-VERIFIED UNSAT. THE
SOURCE-TO-CNF MAP IS NOT YET KERNEL-CHECKED, AND NO LEAN `sorry` IS CLOSED.**

## Result

The exact-card-13, exact-five, first-apex same-radius asymmetric surface has a
finite ordinal contradiction.  It no longer requires literal CEGAR over
real-valued distance assignments.

After normalizing the `(5,6,5)` cap profile to the thirteen cyclic labels

```text
third vertex       = 0
first apex         = 4
second apex        = 8
surplus cap        = {4,5,6,7,8}
first opposite cap = {8,9,10,11,12,0}
second opposite cap= {0,1,2,3,4}, strict part {1,2,3},
```

both reflected asymmetric source-role orbits are inconsistent with the
row-generated distance quotient and one-term strict-Kalmanson cancellation.

The two certified cells are:

| Artifact name | Normalized source orbit | Variables | Clauses | Core clauses | Result |
| --- | --- | ---: | ---: | ---: | --- |
| `direct` | `asymmetricSourceLeft` | 53,279 | 383,487 | 31,792 | DRAT verified |
| `mirror` | `asymmetricSourceRight` | 53,279 | 383,465 | 26,490 | DRAT verified |

The names `direct` and `mirror` refer to the two reflected normalized source
orbits.  They are not, by themselves, a proof that the two raw branches of
`exists_ccw_boundary_order_at_surplus_apex_with_opposite_indices` map to these
two CNFs.  That source transport remains an explicit Lean obligation below.

## Exact encoded surface

`asymmetric_ordinal_rank.py` contains the finite source formula.  It retains:

- one four-point selected row at every center for the fixed critical system;
- the fixed blocker map and source membership in its blocker row;
- two independent carrier-wide global-cover row tables;
- complete-row synchronization at every center in the blocker image;
- the complete exact-five second-apex radius class and its selected-row
  containment;
- the off-surplus frontier pair and both double-deletion selected rows;
- the asymmetric two-hit source/hub/third-point normal form;
- the same-radius exact-six first-apex union and saturation of all four strict
  first-opposite-cap points;
- same-radius synchronization for the two first-apex cover rows; and
- all within-family and cross-family two-circle, boundary alternation,
  cap-hit, outside-pair, and at-most-two-bisector-center restrictions from the
  audited `BaseOuter`.

The source-role extension is written explicitly as eleven assertions rather
than extracted by a textual variable-name filter.  One assertion—that at
least one frontier source belongs to the first-apex selected row—is redundant
with the base surface but is retained to match the exported role packet.

The following are deliberately omitted:

- the retained q-deleted parent rows `R.common.packet.B₁/B₂` and all 2,819
  clauses that mention them;
- selected-row strong connectivity;
- real-valued triangle inequalities;
- nonlinear planar Euclidean realization;
- MEC and `noM44` data; and
- terminal-negation literals.

These omissions weaken the formula.  Therefore they cannot explain an UNSAT
verdict.  The retained-parent-row ablation was checked before export:
`base + eleven role assertions + ordinal theory` is UNSAT, while the 2,819
parent-row assertions are unnecessary.

### Source-map audit boundary

The base clause blocks were inherited from the corrected, independently
decoded B0 surface in
`scratch/atail-force/exact5-global-cover-parent-gate/`.  Their intended source
map is:

| Clause block | Intended source fact | Current status |
| --- | --- | --- |
| `(5,6,5)` cap blocks | `cap_cards_eq_five_six_five` at `D.A.card = 13` | kernel-checked predecessor theorem |
| exact-five second-apex shell | `LargeCapUniqueFiveSecondApexRadius`, including the `3+1+1` class shape | source theorem family exists; encoder map not one Lean theorem |
| blocker map and row locking | fixed `CriticalShellSystem`; a blocker-image center has one complete exact-four K4 class | source theorem family exists; encoder map not one Lean theorem |
| two independent cover tables | the two edges of `ExactFiveGlobalCoverStarOutcome` | source constructors exist; finite labeling map not kernel-checked |
| asymmetric row | `SourceTwoHitNormalForm` for either spoke-two-hit constructor | source constructors exist; orbit normalization not kernel-checked |
| same-radius six-class | `firstApex_class_card_eq_six_of_sameRadius` and `firstApex_class_inter_capInterior_eq_capInterior_of_sameRadius` | kernel-checked scratch theorems |
| first-apex uniqueness/synchronization | `firstApex_K4_radius_eq_frontier_of_sameRadius` and complete-class equality | kernel-checked scratch theorem plus a direct metric consequence |
| circle intersection/alternation/cap bounds | convex-position two-circle and cap-order geometry | theorem families exist; complete clause-by-clause map not one Lean theorem |

Thus the CNF verdict is exact, but the mathematical theorem remains
conditional on a block-by-block Lean construction of the encoded assignment.

## Ordinal theory and its soundness

There are 78 unordered carrier-pair distance atoms.  A source configuration
assigns each atom the rank of its actual real distance among the at most 78
distinct values.  Seven bits suffice, and every rank is constrained below 78.

Every selected-row or complete-shell equality forces equality of the
corresponding ranks.  For each cyclic quadruple `a<b<c<d`, both strict
Kalmanson inequalities have two positive and two negative distance terms. If
one positive term equals one negative term, cancellation forces the remaining
positive distance to be strictly larger than the remaining negative distance;
the encoder adds exactly that rank implication.

This is a necessary condition, not an approximation in the strengthening
direction: an actual convex Euclidean configuration supplies a rank model.
The formula does not assert the converse that every rank model is Euclidean.
Reversing the cyclic order preserves which pairs are the crossing diagonals,
so the same cancellation schema applies to the reflected frame.

The existing production theorem
`false_of_five_ccw_three_shell_equalities` is a small instance of this
mechanism.  The certificate establishes aggregate coverage; it is not merely
one more use of that local consumer.

## Certificate and replay

`bitblast_ordinal_cnf.py` uses only the following Z3 tactic pipeline:

```text
simplify
propagate-values
elim-term-ite
solve-eqs
lia2card
card2bv
bit-blast
tseitin-cnf
```

Each export checks its DIMACS header, clause count, clause termination, and
literal range before writing the file.  This caught and prevented the known
Z3-context fresh-name hazard in the hand smoke test; the production exporter
performs one transform in one fresh process and both final DIMACS structure
checks pass.

`smoke_bitblast.py` checks the same pipeline on two hand-decided rank systems:

- `x<3`, `y<3`, `y>x` is SAT (witness `x=0,y=1`);
- `x<3`, `y<3`, `x=y`, `x>y` is UNSAT.

Z3 and CaDiCaL agree on both; the smoke UNSAT DRAT proof verifies.

For each main cell:

1. the original finite BitVec formula is independently Z3-UNSAT;
2. CaDiCaL returns exit code 20 and emits DRAT;
3. `drat-trim` prints `s VERIFIED` for the original CNF/DRAT pair; and
4. `drat-trim -c ... -L ...` emits the reduced core CNF and LRAT certificate
   while again verifying the source DRAT.

No standalone LRAT checker is installed on `PATH`, so the LRAT files have not
yet been independently replayed.  They are prepared for the Lean certificate
port.  All artifact sizes and SHA-256 hashes, plus exact replay commands, are
in `certificate-manifest.json`.

## What remains before Lean closure

The next theorem should not be another conditional terminal.  It should be a
single source-to-finite assignment bridge for this exact branch, with three
parts:

1. **Boundary transport.** From the zero-cut CCW boundary theorem, the
   `(5,6,5)` cap cards, and the global cap-index interval lemmas, construct a
   `Fin 13` frame.  The direct raw branch has apex positions `0/4/8`; the
   mirror raw branch has positions `0/9/5`, and reflection `i ↦ -i mod 13`
   gives the canonical cap blocks.
2. **Orbit exhaustiveness.** Show that the two asymmetric constructors of the
   global-cover outcome map, after the direct/mirror normalization, to
   `asymmetricSourceLeft` or `asymmetricSourceRight` with every encoded row and
   blocker field preserved.
3. **Checked finite contradiction.** Define the finite formula in Lean, prove
   that the source configuration gives a satisfying assignment, and replay
   the trimmed certificate (or use an accepted kernel-evaluation route).

Once those three parts are kernel-checked, this certificate closes the
**card-13, exact-five, same-radius, asymmetric** subcase.  It does not by
itself close the distinct-radius mode, the `allRowsOneHit` outcome, the
card-at-least-14 branch, the whole exact-five residual, or any production
`sorry`.

## Files

- `asymmetric_ordinal_rank.py`: explicit finite source/ordinal formula;
- `bitblast_ordinal_cnf.py`: checked DIMACS export;
- `run_cadical_drat.py`, `check_drat.py`, `trim_to_lrat.py`: solver and proof
  replay drivers;
- `smoke_bitblast.py`, `smoke.json`: hand-known pipeline smoke gate;
- `direct.*`, `mirror.*`: CNF, DRAT, core CNF, LRAT, logs, and manifests; and
- `certificate-manifest.json`: hash-anchored replay index.
