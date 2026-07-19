# Parent-return gate audit

Date: 2026-07-17

Status: **THE DISPLAYED RETURN TARGET DOES NOT FOLLOW FROM THE RETAINED
PAIR MARGINAL PLUS LOCAL CAP/MEC GEOMETRY. AN EXACT RATIONAL RELAXED MODEL
REALIZES THE PERIOD-THREE CORE, ONE COMPLETE REVERSE ROW, BOTH LIVE
OPPOSITE-CAP LOWER BOUNDS, AND A DISTINCT RETAINED FIRST-APEX PAIR WHICH IS
NOT THAT REVERSE PAIR. THIS IS NOT A MODEL OF GLOBAL K4, THE TOTAL CRITICAL
SYSTEM, MINIMALITY, OR ALL THREE COMPLETE REVERSE ROWS. NO PRODUCTION
`sorry` IS CLOSED.**

This lane owns only
`scratch/atail-force/all-reverse-parent-return-gate/`.  It did not edit or
build production Lean, shared plans, proof-blueprint state, protected files,
or git state.

## Required preflight

Before testing the target, the audit searched every registry required by
`AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

The indexed Lean corpus was searched with `nthdegree docs search --lean` for
the retained critical pair, reverse outside pairs, co-radial pairs at
`oppApex1`, and parent-return/cross-incidence consumers.  The nearest hits are
the already-known `oppCap2_escape_gen`, endpoint/full-distance-class results,
`CriticalPairFrontier`, `ThirdCenterCommonPair`, and the source-unit/U5
consumers.  None derives the proposed return occurrence from the live parent.

## Target under audit

The parent audit proposed proving that, on the all-reverse exact-five leaf,
some reverse outside pair is the retained original frontier pair
`{F0.pair.q,F0.pair.w}`.  The weaker sufficient form is that some reverse
outside pair is co-radial from `S.oppApex1`.

The source audit confirms that this is a genuinely new coupling statement:

- `E.exactFive.cycle` supplies the physical-apex exact-five omission cycle;
- the reverse-row reductions supply per-row exact `2 + 2` supports;
- `F0.pair` supplies a named pair co-radial from `S.oppApex1`; but
- no field identifies either frontier source with any reverse outside target.

Moreover, `E.frontier` is reconstructed independently from the original
`F0` retained by `L`; there is no definitional identification to exploit.

## Exact relaxed countermodel

`verify_exact_relaxed_parent_return_countermodel.py` checks, with
`fractions.Fraction`, a 16-point rational carrier in the boundary order

```text
o, cap0, x, y, cap1, left, q0, frontier_a,
c0, c2, q1, c1, q2, right, surplus0, surplus1.
```

Use the support-triangle identification

```text
oppApex2 = o
surplusApex = left
oppApex1 = right.
```

The exact replay proves all of the following for this relaxed carrier:

1. every named point is a distinct strict convex-hull vertex;
2. every point lies in the exact circumdisk of `(o,left,right)`, and that
   support triangle is nonobtuse;
3. the cap sizes are `9`, `6`, and `4`, so in particular both live opposite
   caps have cardinality at least six;
4. the physical-apex class centered at `o` is exactly
   `{left,q0,q1,q2,right}`;
5. `c0,c1,c2` form the exact directed period-three cap-straddling blocker
   core on source pairs `{q0,q1}`, `{q1,q2}`, `{q2,q0}`;
6. the complete `c0` row is exactly `{q0,q1,x,y}`;
7. the retained candidate frontier pair `{x,frontier_a}` has distinct
   endpoints, is off the surplus cap, and is exactly co-radial from `right`;
8. deleting either member of that pair preserves the five-point physical
   class at `o`, and their distances from `o` are different; and
9. `{x,frontier_a} != {x,y}`.  Thus even allowing a one-point overlap does
   not force equality with the complete reverse pair.

The replay output is:

```text
PASS: exact relaxed parent-return countermodel
frontier_pair={x,frontier_a}
complete_reverse_pair_row0={x,y}
first_apex_class={x,frontier_a} (not K4)
physical_cap_card=9
opposite_cap1_card=6
surplus_cap_card=4
```

Run it with:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run \
  scratch/atail-force/all-reverse-parent-return-gate/verify_exact_relaxed_parent_return_countermodel.py
```

The finite discovery scans are recorded in `search_rational_pair.py` and
`search_cap_padding.py`.  They tested 57,456 disjoint-pair candidates without
a hit, then found the exact one-point-overlap witness after 75 pair candidates
and the cap-cardinality padding after 3,889 exact candidates.  These are
bounded discovery facts, not infeasibility results for the disjoint case.

## What the model deliberately does not satisfy

The model is a regression gate against overstrong *local* parent-return
statements, not a counterexample to the live theorem.  Its first-apex radius
class is exactly `{x,frontier_a}`, not a K4 class.  It therefore omits:

- `R.frontierRadius_class_card_ge_four` and
  `R.common.firstApexDouble`;
- a total `CriticalShellSystem` tying the retained pair and every reverse
  source/target to one global blocker map;
- first- and second-apex robustness for every deletion (only the two retained
  pair deletions at `o` are checked);
- the two other complete reverse rows;
- global `D.K4`, `D.Minimal`, and `R.noM44`; and
- the source-faithful period-four and period-five leaves.

Consequently it does **not** refute the all-reverse parent theorem or the
proposed return target under all live hypotheses.

## Exact load-bearing conclusion

The cap lower bounds, strict convex/MEC geometry, the physical exact-five
core, one complete reverse row, and the retained pair marginal are
insufficient.  Any viable parent-return proof must visibly consume at least
one of the hypotheses absent from the exact model, and the strongest concrete
entry points are:

1. **First-apex K4/double deletion:** couple
   `R.frontierRadius_class_card_ge_four` or
   `R.common.firstApexDouble` to the reverse-row outside targets.  This is the
   narrowest missing parent datum exposed by the replay.
2. **Total critical-map/robustness coupling:** use the one shared `H` plus
   bi-apex deletion robustness to force a source-indexed intersection between
   the original pair fiber and a reverse row.  Anonymous blocker-fiber
   pigeonhole alone is not enough.
3. **All-row/global closure:** use all three complete rows (and separately
   periods four/five) together with global K4/minimality/no-`IsM44`.  The
   present witness intentionally has only the `c0` complete row.

Therefore the proposed equality should not be registered as a consequence
of local ordered-cap geometry.  If retained as the next theorem target, its
statement or proof contract should require one of the first two explicit
parent couplings above; otherwise it is overstrong relative to the checked
local surface.

## Epistemic ledger

- **EXACT EXTERNAL CHECK:** the rational relaxed model and every property
  listed in its replay.
- **BOUNDED UNKNOWN:** no disjoint retained-pair extension was found in
  57,456 exact rational candidates; this is not UNSAT.
- **SOURCE-AUDITED:** the listed live parent fields and implication
  directions.
- **NOT CLAIMED:** a model of global K4/minimality/CSS, all three complete
  reverse rows, or the full all-reverse leaf.
- **NOT RUN:** Lean/Lake, proof-blueprint, production build, or git.
