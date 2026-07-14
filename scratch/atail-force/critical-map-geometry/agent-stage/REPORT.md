# Fixed-shadow staged SMT audit

Date: 2026-07-14

Scope: bounded diagnostic runs against
`../fixed_shadow_query.py`; no claim below is a Lean proof or a verdict on the
full 662-atom system.

## Selector validation

`--check` passes after the `--families` change. The selector reports both
`enabled_families` and `enabled_atom_count`; the unfiltered inventory remains
662 atoms with the expected 11-family split.

## Public family-level ladder (10 seconds per engine)

| Enabled families | Atoms | Z3 | cvc5 |
|---|---:|---|---|
| `gauge` | 4 | SAT | SAT |
| `gauge,total-critical-map` | 64 | UNKNOWN (`canceled`) | TIMEOUT |
| `gauge,total-critical-map,distinctness` | 130 | UNKNOWN (`canceled`) | TIMEOUT |
| `gauge,total-critical-map,total-critical-map-exact` | 400 | UNKNOWN (`canceled`) | TIMEOUT |

Z3 also returned UNKNOWN at 10 seconds for
`gauge,total-critical-map,distinctness,strict-convex-order` (250 atoms).
The geometry-only complement of the two critical-map families (266 atoms) was
also UNKNOWN at 10 seconds. No later stage produced an UNSAT shortcut, but
UNKNOWN/TIMEOUT is not evidence in either direction.

The first public selector transition is therefore `gauge` SAT to
`gauge,total-critical-map` unresolved. No UNSAT result, and hence no core, was
obtained.

## Row-prefix localization

To separate solver bookkeeping from the polynomial system, I selected prefixes
of the twelve saved exact four-point rows through the existing geometry API and
ran Z3 without tracked assertions.

- At 2 seconds per prefix, rows 0 through 4 (five rows, 29 atoms including the
  gauge) were SAT; adding row 5 (six rows, 34 atoms) was UNKNOWN. All larger
  prefixes were also UNKNOWN.
- At 10 seconds, the first-six-row prefix remained UNKNOWN.
- Adding all 66 pairwise-distinctness atoms did not invalidate the five-row
  prefix: gauge + rows 0--4 + distinctness (95 atoms) was SAT in about 2.5
  seconds. Adding row 5 (100 atoms) was UNKNOWN at 10 seconds.
- cvc5 was SAT for gauge + rows 0--2 at 10 seconds, and timed out after adding
  row 3. At two seconds it was SAT through two rows and timed out at three.

These are computational budget transitions, not minimal inconsistent subsets.
Tracked assertions materially worsen Z3 behavior: at two seconds the tracked
ladder became UNKNOWN after two rows while the untracked ladder stayed SAT
through five.

## Exact SAT clue

Z3 produced an exact algebraic model for the nondegenerate five-row prefix
(gauge + rows 0--4 + all distinctness). The enabled radii were

```
r0^2 = 13/16, r1^2 = 377/256, r2^2 = 1/4,
r3^2 = 5/16, r4^2 = 121/256.
```

Representative pinned/rational coordinates were

```
p4=(0,0), p0=(1,0), p1=(0,11/16), p2=(1/2,0),
p3=(1/4,-1/2), p5=(1/2,-1/2), p8=(-1,0), p9=(3/16,-sqrt(39)/16).
```

The remaining coordinates were exact quadratic algebraic `root-obj` values.
Because all distinctness atoms were enabled, this is a genuine witness for the
stated five-row relaxation, not the earlier coincident-point relaxation. It is
not a witness for row 5, the full critical map, convexity, MEC, caps, or target
negation.

## Structural clue

After gauge-fixing, a prefix with `k` rows has `20 + k` relevant real degrees of
freedom (24 coordinates plus `k` radii minus four gauge equations) and `4k` row
equalities. The rough count is underdetermined through six rows, becomes
overdetermined at seven, and the full twelve-row core has 32 relevant variables
against 48 row equalities. This does not prove independence or inconsistency,
but it explains why blind QF_NRA search is a poor next instrument. The most
informative next query is an exact pure-equality row-core/ideal computation,
with real feasibility checked separately if the ideal does not eliminate the
shadow.
