# Exact-seven successor terminal audit

## Status

**SOURCE-CLEAN NORMAL FORM CHECKED; CAP-LOCAL DIRECT `False` REFUTED BY AN
EXACT RATIONAL EUCLIDEAN/MEC MODEL; FULL-PARENT TERMINAL STILL OPEN.**

This lane owns only `scratch/atail-force/exact7-successor-terminal/`.  It
does not change production Lean, the closure documents, proof-blueprint
state, `ShellCurvature`, `SurplusM44`, or git state.

## Required theorem-bank preflight

Before adding a theorem, this audit checked the registries required by
`AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- the indexed Lean corpora with `nthdegree docs search --lean`.

The closest production consumers are:

- `false_of_transitionReverseOutsidePair_coRadial_firstApex`;
- `false_of_fullParentExactFiveAllReverseData_of_firstApexOccurrence`;
- `CapCrossingKalmansonBridge.false_of_five_ccw_three_shell_equalities`;
- `CapCrossingKalmansonBridge.false_of_two_selected_rows_shared_late_pair`;
- `Census554.FivePointCircleIsoscelesOrderCore.false_of_core_of_neg`.

The exact-seven occurrence does not supply the cross-row incidences required
by the last three consumers.  Its cap-local three-row pattern is

```text
q0 < c0 < q1 < c1 < q2,

center c0 : q0,q1
center q1 : q0,q2
center c1 : q1,q2.
```

This is not the five-point Kalmanson terminal's incidence pattern.

## Checked normalization

`ExactSevenSuccessorTerminal.lean` assumes the already-proved occurrence

```lean
H.centerAt q = transition.successor q
```

on the complete `FullParentExactFiveAllReverseData` packet.  Global reverse
membership makes the transition injective and hence surjective on the finite
physical source type.  Therefore `q` has a predecessor `p`.  The theorem

```lean
exists_predecessor_outsidePair_normalForm_of_center_eq_successor
```

then proves, without another conditional structure:

1. `transition.successor p = q`;
2. the row at `q` is centered at `transition.successor q`;
3. its physical-cap intersection is exactly `{p,q}`;
4. its outside residual is exactly `{a,b}`, with `a != b` and both points in
   the ambient complement of the physical cap;
5. deleting `q` destroys every K4 radius at `transition.successor q`;
6. deleting `transition.successor q` preserves K4 at that same center; and
7. the single equality

   ```lean
   dist S.oppApex1 a = dist S.oppApex1 b
   ```

   gives `False` immediately through the existing ordered-cap terminal.

Thus the occurrence has been normalized to exactly one already-consumed
antecedent.  The deletion asymmetry is coherent: the selected row contains
`q` but, as every critical shell does, excludes its center.

## Exact cap-local regression

`verify_cap_local_model.py` gives an exact rational realization of every
cap-local geometric fact above that does not mention the two outside row
members.  With the rational unit-circle chart

```text
U(t) = ((1-t^2)/(1+t^2), 2t/(1+t^2)),
```

take

```text
o     = (0,0)
left  = U(0)
q0    = U(1/10)
q1    = U(15/49)
q2    = U(62/115)
right = U(2/3)
c0    = (101/200) (q0+q1)
c1    = (101/200) (q1+q2).
```

The increments `q0 -> q1` and `q1 -> q2` are the same rational rotation,
so `q1` is exactly equidistant from `q0,q2`.  The verifier checks with
`fractions.Fraction` only:

- strict convexity in the order
  `o,left,q0,c0,q1,c1,q2,right`;
- a closed physical cap of cardinality seven;
- the exact five-point physical-apex class
  `{left,q0,q1,q2,right}`;
- exact cap intersections `{q0,q1}`, `{q0,q2}`, `{q1,q2}` for the three
  displayed blocker rows;
- strict opposite chord sides for `o` and the cap interior;
- containment in the exact circumdisk of `(o,left,right)`;
- a nonobtuse support triangle; and
- all named distinctness and radius-class exclusions.

This is an externally exact Euclidean/MEC cap-local model, not a global
`CriticalShellSystem`, K4, minimality, `noM44`, or full-parent model.  It
decisively prevents the occurrence equality, cap order, MEC containment, and
the three cap-local row equalities from being promoted to `False` by
themselves.  Any full-parent closure must produce the normalized first-apex
co-radial outside pair or use genuinely global all-center/critical-map force.

## Validation

From `lean/`, the focused warnings-as-errors check completed successfully:

```bash
lake env lean -M 16384 -DwarningAsError=true -R .. \
  ../scratch/atail-force/exact7-successor-terminal/ExactSevenSuccessorTerminal.lean
```

The theorem's reported axiom closure is exactly:

```text
propext
Classical.choice
Quot.sound
```

The exact regression is independently replayed by:

```bash
UV_CACHE_DIR=/tmp/p97-exact7-successor-uv \
uv run python \
  scratch/atail-force/exact7-successor-terminal/verify_cap_local_model.py
```

Its verdict-bearing output is:

```text
PASS: exact rational source-as-successor-blocker cap-local model
status=EXACT_EUCLIDEAN_MEC_CAP_LOCAL_NOT_GLOBAL_CRITICAL_SYSTEM
boundary=o,left,q0,c0,q1,c1,q2,right
closed_cap_card=7
physical_class=left,q0,q1,q2,right
collision=centerAt(q0)=q1=successor(q0)
min_strict_hull_margin=1/260
min_cap_side_margin=21824/221897
min_mec_disk_margin=5456/51207
min_pairwise_dist_sq=7744/221897
min_named_row_exclusion=1166/10985
```

Neither file contains a `sorry`, `admit`, new `axiom`, `native_decide`, or
`unsafe` declaration.
