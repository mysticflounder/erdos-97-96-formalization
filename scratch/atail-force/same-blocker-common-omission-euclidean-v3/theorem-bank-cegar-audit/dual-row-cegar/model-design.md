# Dual exact-row CEGAR atom map

This lane models only the deletion/deletion branch of the open live leaf
`false_of_capSource_firstFiber_collisionFiveCenterDeletion`.  It does not
replace either crossed-membership constructor of
`FirstFiberOutsidePairFiveCenterExactRowsOrCrossedResidual` by a five-row
packet.

## Shared finite carrier atoms

The imported `incidence_cegar.Audit(17, (6,8,6), True, False, True)` supplies:

- `eq[c,x,y]`: equality of the two distances from carrier center `c` to
  carrier points `x,y`;
- `b[s,c]`: `c = H.centerAt s` (exactly one actual blocker per source);
- `m[c,p]`: one exact four-point co-radial selected class at carrier center
  `c`;
- the three collision source pairs `(p1,p2)`, `(r1,r2)`, the two cap sources
  `(q1,q2)`, and fixed apex centers `a1,a2,a3`;
- an injective cyclic-position permutation in the closed-cap block order.

The cap-source row is the canonical shell at the blocker of `q1=q2` in
blocker value.  The first and opposite collision rows are the canonical
shells at the blockers of `p1=p2` and `r1=r2`, respectively.

## Collision-deletion packet

`deletion_arm_selected` is the exact four-way Lean disjunction.  Its deleted
point is one of `p1,r1,p2,r2`.  Its five row objects are:

| row atom | Lean center | support encoding |
|---|---|---|
| `collision.common` | `H.centerAt source` | canonical `m` at the blocker of `q1` |
| `collision.apex1` | `S.oppApex1` | `m[a1,*]`, existentially chosen as this packet's boundary row |
| `collision.opposite` | blocker of `Pρ.source1` or `P.source1`, according to the selected arm | canonical `m` at that blocker |
| `collision.apex2` | `S.oppApex2` | `m[a2,*]` |
| `collision.apex3` | `S.surplusApex` | `m[a3,*]` |

The selected arm forces all five supports to omit its deleted endpoint and
forces that endpoint's actual blocker to differ from all five row centers, as
required by `FiveSurvivorExactRowsBoundary`.

## Outside-pair-deletion packet

Exactly one `outside_choice[u,v,deleted]` is selected.  It means:

- `u = Q.source.1`, `v = Q.otherOutsidePoint`;
- `u,v` are the two off-cap points in the first collision shell;
- `u` has the same actual blocker as `p1`, as required by
  `FreshOutsideFirstBlockerFiber.blockers_eq`;
- `deleted` is either `u` or `v`, selecting one of the two positive
  five-row constructors.

The layer has its own support variable `outside[row,p]` for every named row:

| row atom | Lean center | normalization |
|---|---|---|
| `outside.common` | `H.centerAt source` | equated pointwise to the canonical shell at blocker(`q1`) |
| `outside.opposite` | `H.centerAt Pρ.source1` | equated pointwise to the canonical shell at blocker(`r1`) |
| `outside.apex1` | `S.oppApex1` | independent exact four-point co-radial support |
| `outside.apex2` | `S.oppApex2` | independent exact four-point co-radial support |
| `outside.apex3` | `S.surplusApex` | independent exact four-point co-radial support |

Only the two blocker rows are normalized.  This is exactly the scope of
`qDeletedK4Class_support_eq_selectedShell`; matching apex center names do not
identify the collision and outside apex rows.  There is one conditional
qualification: if a rich apex aliases the actual blocker of any carrier
source, the same theorem does apply, and the executable model then equates
that apex witness to the canonical row.  In the absence of such an alias the
two packets' apex rows remain independent.

Every outside support has cardinality four, excludes its center, is one
radius class under `eq`, omits the selected outside point, and has the
deleted point's actual blocker distinct from its center.

## Cross-layer Euclidean cuts

All ten row objects participate.  Candidate violations receive guarded cuts
for:

- distinct-center circle overlap: two co-radial rows cannot share three
  carrier points;
- perpendicular-bisector multiplicity: three distinct carrier centers cannot
  share one unordered point pair;
- cyclic shared-pair separation for two selected four-classes;
- the exact positive-membership patterns of the proved cyclic-shift theorems
  `false_of_five_ccw_two_selected_rows_cyclicShift`,
  `false_of_five_ccw_second_two_selected_rows_cyclicShift`, and
  `false_of_five_ccw_reversed_second_two_selected_rows_cyclicShift`.

Every cut retains its row-center guards.  The cyclic families generate only
direction-preserving rotations; no reflection, reversal adapter, or row-role
swap is inferred beyond the corresponding theorem statement.

## Fail-closed scope and trust boundary

This executable tranche says nothing about the two crossed outside-pair
constructors.  It also omits coordinates, QF_NRA realization, MEC/nonobtuse
geometry, a full `CounterexampleData` construction, arbitrary `n`, Lean
kernel closure, and the open leaf's `sorry`.  `SAT` is only a finite surviving
abstract-incidence candidate; `UNSAT` is uncertified unless separately
replayed by a proof-producing pipeline; timeout or solver `unknown` remains
`UNKNOWN`.
