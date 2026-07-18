# Period-three exact seed lift into the fixed 25-role cell

Date: 2026-07-17

Status: **EXACT RATIONAL NINE-ROLE PARTIAL SEED.  THE AVAILABLE EXACT
ONE-COMPLETE-ROW WITNESS CANNOT BE MAPPED INTO THE FULLY DISJOINT FIXED
25-WORD BECAUSE ITS TWO OUTSIDE TARGETS OCCUR ON THE WRONG SIDE OF `nI`.
REFLECTION AND CYCLIC RELABELING DO NOT REPAIR THIS.  NO FULL 25-ROLE
EUCLIDEAN, MEC, CSS, OR PARENT REALIZATION IS CLAIMED.**

This lane owns only
`scratch/atail-force/period-three-exact-seed-lift/`.  It did not edit
production Lean, shared documents, blueprint or git state, `ShellCurvature`,
`SurplusM44`, or protected lanes.  No Lean, Lake, or LSP command was run.

## Inputs and correction

The exact complete-row input is
`scratch/atail-force/cycle-one-target-kalmanson/verify_two_target_exact.py`,
not the predecessor one-target checker.  It gives the eleven-point strict
convex order

```text
o, x, y, left, q0, old_c0, old_c2, q1, old_c1, q2, right
```

with exact physical class

```text
{left,q0,q1,q2,right}
```

at `o`, and exact complete row

```text
{q0,q1,x,y}
```

at `old_c0`.  The similarly named
`one-row-extension-countermodel/` has only `x`; its own report explicitly
states that the second target is absent.  The independent
`DirectedCycleCountermodel.lean` kernel-checks a different rational
nine-point realization of the same cycle core, but it does not contain
outside targets.

The required theorem-bank preflight was already recorded by each input lane
against the four registries required by `AGENTS.md` and indexed Lean.  This
lift derives no new finite-pattern theorem.

## Source-faithful fixed-cell map

The physical exact-five row in the fixed cell must be

```text
{nI,c0,c1,c2,nS}
```

at `second`.  Therefore the only source-faithful use of the exact physical
class is

| fixed role | exact source label |
|---|---|
| `second` | `o` |
| `nI` | `left` |
| `c0,c1,c2` | `q0,q1,q2` |
| `b0,b1,b2` | `old_c0,old_c1,old_c2` |
| `nS` | `right` |

Starting at `second`, these nine roles occur in the exact cyclic order

```text
second, nI, c0, b0, b2, c1, b1, c2, nS.
```

That is the restriction of the fixed 25-word in
`probe_fully_disjoint.py`.  `SEED.json` records every coordinate as a reduced
rational and every fixed boundary position.

This map exactly satisfies:

- the five physical equalities at `second`;
- the three reverse cap-pair equalities
  `{c0,c1}` at `b0`, `{c1,c2}` at `b1`, and `{c2,c0}` at `b2`;
- strict convexity of the mapped nine-point carrier;
- strict physical-cap side placement and blocker/source straddling; and
- named exclusion of each blocker from the physical radius.

## Why the exact complete row does not map

With the source-faithful physical map, the complete-row witness has the local
order

```text
second, x, y, nI, ...
```

but the fully disjoint fixed word has

```text
second, ..., nI, x0, y0, x1, y1, x2, y2, surplus, ...
```

Every fixed reverse-target slot is after `nI`; both exact targets are before
it.  Three possible repairs were checked:

1. **Reflection:** the exact local order becomes
   `nS, y, x, second`.  The target pair is still on the other complementary
   component from the fixed post-`nI` target block.
2. **Cyclic relabeling of the omission cycle:** this changes which `b_i` row
   is complete but cannot move `x,y` across a physical endpoint.
3. **Using `left,right` as support apices:** this places `x,y` more
   conveniently, but makes the two support apices members of the physical
   radius and leaves `nI,nS` missing.  It is not the fixed exact-five cell.

Thus no reflection or cycle-index rotation embeds the complete exact row in
the fully disjoint fixed word.  A different quotient cell could reuse these
coordinates only if its reverse targets are identified with pre-`nI` T0/T1
roles, or if it uses a different boundary word.  Neither is the numerical
cell currently being tested.

## Exact margins

The selected nine-role seed has:

| check | exact margin |
|---|---:|
| strict hull half-plane minimum | `523615908/1942040940625` |
| `second` side of the physical endpoint chord | `62592/63433` |
| strict physical-cap side minimum | `96196080/3385863241` |
| blocker exclusion from physical squared radius | `15469341/3061562500` |
| strict auxiliary-disk margin on cycle/blockers | `12295/427016` |

The full eleven-point source witness has strict hull minimum

```text
1715231162403/1193369583218474185.
```

Its two target coordinates and exact `b0` radius are retained in `SEED.json`
as **unmapped** discovery data.  The auxiliary disk is the exact disk through
`second,nI,nS` inherited from the source construction.  It is not the live
MEC packet because `nI,nS` are adjacent-cap physical hits in the fixed cell,
not the two support apices.

Replay:

```bash
UV_CACHE_DIR=/tmp/p97-uv-cache uv run python \
  scratch/atail-force/period-three-exact-seed-lift/verify_seed.py
```

Recorded output:

```text
PASS: exact rational partial seed and complete-row order audit
mapped_roles=9
mapped_min_hull_margin=523615908/1942040940625
complete_row_min_hull_margin=1715231162403/1193369583218474185
complete_row_fixed_word_mapping=ORDER_INCOMPATIBLE
```

## Extension recipe for the numerical cell

Keep the nine exact roles fixed for the first warm start.  The unmapped roles
occupy three mapped-edge gaps:

```text
second -> nI:
  q,w,t0i,t1i0,t1i1,t1i2

nI -> c0:
  x0,y0,x1,y1,x2,y2,surplus

c2 -> nS:
  t1o,first,t0s
```

The live surplus cap also needs at least one additional unnamed interior
point beyond the 25 named roles.  Insert it in the `first -> second` cap
chain, without identifying it with `t0s` or `nS`.

For a convexity-preserving initial placement in any mapped edge `a -> b`,
place the required gap points at increasing rational parameters `t_j` using

```text
p_j = (1-t_j) a + t_j b
      + epsilon * t_j * (1-t_j) * (b_y-a_y, a_x-b_x).
```

For sufficiently small positive rational `epsilon`, this replaces the edge
by a strict outward convex arc.  A line search against the recorded exact
hull margin gives a mechanically safe warm start.

Then release coordinates in this order:

1. add `surplus`, `first`, `t0s`, and the mandatory unnamed surplus-cap
   point while preserving only hull order;
2. solve the unequal-radius T0/T1 equalities at `first` for
   `{q,w,t0i,t0s}` and `{t1i0,t1i1,t1i2,t1o}`;
3. solve all six reverse outside-target equalities, using the exact mapped
   cap-pair radii as the initial `b_i` radii;
4. enforce every exact-support exclusion; and only then
5. add the actual support-triangle MEC/nonobtuse block and total-parent
   constraints.

`nI` and `nS` do not need to be constructed: they are already the two exact
noncycle members of the mapped physical five-class.  Moving them initially
would discard the strongest exact part of the seed.

## Equalities still not supplied by construction

The edge-refinement recipe preserves convex order, not metric rows.  The
following remain genuine nonlinear solve obligations:

- every T0 and T1 equality at the new `first` point;
- both outside-target equalities for each of `b0,b1,b2` in the fixed word;
- all exact-support exclusions after inserting the sixteen named roles;
- the `second` distances to `q,w` and their required inequality;
- the actual support-triangle MEC and nonobtuse conditions;
- a selected row for the mandatory unnamed surplus-cap point;
- total `CriticalShellSystem`, K4/deletion criticality, minimality, and the
  retained parent fields.

Accordingly this lift is a tractability seed, not progress toward a source
`sorry` by itself.  Its useful conclusion is precise: the fixed numerical
cell can inherit the exact physical-five/cycle core, but it cannot inherit
the available exact complete reverse row without changing identity/order
cell.
