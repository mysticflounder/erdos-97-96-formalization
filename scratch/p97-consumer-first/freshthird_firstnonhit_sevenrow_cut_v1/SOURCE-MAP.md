# Source gate and ingress map

Gate verdict: **PASS for a discovery-only, unbounded named-role quotient**.
The solver must not start unless `wave.py --prepare` reproduces
`SOURCE-GATE.json` with `status = PASS` from the pinned files below.

## Why every new incidence is an actual critical-shell membership

For every active named source `s`, the quotient has two integer-valued names:
`v_s`, representing the carrier vertex `s`, and `blk_s`, representing
`H.blockerVertex s`, whose value is `H.centerAt s.1 s.2`.

The only new row predicate is

```text
mem(blk_s, v)  :=  v lies in
  (H.selectedAt s.1 s.2).toCriticalFourShell.support.
```

Every first argument of `mem` is therefore the actual blocker center of an
active theorem-emitted `CriticalShellSystem.CarrierVertex`.  Every second
argument is either another active carrier source or an actual blocker vertex;
both are in the ambient carrier.  No arbitrary integer is queried as a row or
point.  `CriticalShellSystem.selectedAt` supplies the exact critical shell,
`blockerVertex` supplies its actual center, and
`selectedSupports_eq_of_actualBlockers_eq` proves that equal blocker centers
have equal supports.  Encoding `mem` as one uninterpreted function of the
actual center and point is consequently extensional in exactly the
source-licensed way.

The finite syntactic term set does **not** bound the carrier.  It consists only
of theorem-emitted sources and their actual blocker vertices.  Integers are
opaque equality-class names, not values in `[0, MAXN)`.  Unnamed carrier points
and rows remain unenumerated.

## Active named sources

All cases contain the four Q-support carrier sources and the two named
FirstNonHit sources.  The retained case additionally materializes its
theorem-emitted mutual-deletion pair.  The `common_sameblocker` case additionally
materializes the four theorem-emitted off-Q sources.  Inactive legacy scalar
fields are preserved byte-for-byte from the predecessor but are not projected
to `mem` and cannot participate in motif detection.

## Preserved ingress

The predecessor SMT body is copied verbatim up to its original `check-sat`,
except that the declared logic is lifted from `QF_LIA` to `QF_UFLIA`.  The
successor only adds source-definition bridges from existing overlap fields to
named `mem` atoms and the seven-row CEGAR no-goods.  It retains the predecessor's
three cases and its deletion-fan, blocker-fiber, repeated-cap, retained, and
common-helper clauses.  The predecessor source map remains the declaration-level
map for those inherited clauses.

## Exact source declarations

- `CriticalShellSystem`, `centerAt`, `selectedAt`,
  `source_mem_selectedFourClass`, `selectedFourClass_support_eq_shell`,
  `CarrierVertex`, `blockerVertex`, and `blockerVertex_ne`:
  `lean/Erdos9796Proof/P97/U1CarrierInjection.lean`.
- `selectedSupports_eq_of_actualBlockers_eq`:
  `lean/Erdos9796Proof/P97/ATail/SurvivalCover.lean`.
- The named-role producers and all inherited clauses are pinned through
  `freshthird_firstnonhit_global_blocker_quotient_v1/SOURCE-MAP.md` and its
  source hashes.
- The normalized algebraic core for the new motif is
  `lean/scratch/firstnonhit-sevenrow-lean/SevenRowObstruction.lean`.

## Omitted facts

There is no support-exhaustion axiom, exact support-cardinality encoding,
ambient carrier enumeration, cyclic order, boundary order, or metric matrix.
The source supports are exact in Lean, but this quotient records only the
memberships needed by inherited fields and motif readback.  This is an
over-approximation and cannot support a universal or Euclidean closure claim.
