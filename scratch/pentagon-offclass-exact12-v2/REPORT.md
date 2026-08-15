# Pentagon off-class exact-12 feasibility probe v2

## Result

**SAT** for the bounded incidence abstraction described below.  This is a
finite feasibility witness, not a Euclidean realization, not a proof of the
anchored theorem, and not a closure claim.

CaDiCaL 3.0.0 found the persisted model with 39,733 variables and 315,923
clauses.  `verify_model.py` independently checked the total assignment against
every clause and reimplemented the semantic checks.  Z3 4.17.0 independently
reported the same DIMACS instance SAT.

## Source mapping

The target is
`Problem97.ATailFrontierLiveClosure.false_of_exactFourRigid221_sourceHeavy_secondOppositeLarge_pentagonOffClassBlocker`
in `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221SourceHeavy.lean`.
The scratch producers used read-only are:

- `pentagonOffClass_card_twelve_exact_cap_profile_probe`;
- `pentagonOffClass_exact_physical_cycle_traces_probe`; and
- `pentagonOffClass_physical_cycle_actualBlockers_injective_probe`

from `scratch/PentagonOffClassProducerProbe.lean`.

The theorem profile `(surplus, opp1, opp2) = (5,4,6)` is represented in the
frozen `card_head` order as `(surplus, theorem-opp2, theorem-opp1) = (5,6,4)`.
Thus the theorem's strict `opp2` interior is frozen block 1, labeled
`{6,7,8,9} = {u,c,xv,xu}`, and its opposite/physical apex is label 1.  This is
only a role permutation; no frozen schema or source file was changed.

## Encoded consequences

- Exactly 12 labeled carrier points and the exact cap profile/interiors above.
- Exact physical radius class `{u,xu,d,v,xv}`, with `c` off that class.
- One global selected four-class at every center, using the read-only
  `census/card_head` C1, full-one-hit, post-SUB2, C2, and C4 surface.
- The full physical five-class participates in C2/C4: every other selected row
  meets it in at most two points, and each physical pair has at most one other
  selected center.
- One actual critical blocker for every source.  Its selected global row
  contains that source, reflecting
  `CriticalShellSystem.selectedFourClass_support_eq_shell`.
- The physical apex is not a blocker: deleting one source leaves at least four
  points in its exact five-point radius class.
- `centerAt(u)=xv`, `centerAt(xv)=c`, all five exact cycle traces, and five
  distinct blocker centers.

No theorem-bank exclusion patterns were imported: the general-n census does
not supply a producer mapping this live packet into those patterns.

## Witness

The probe intentionally stops at the first SAT ordered outside-interior
placement.  It found `d=0,v=2` immediately:

| role | label |
|---|---:|
| physical apex | 1 |
| `d,v,u,c,xv,xu` | `0,2,6,7,8,9` |

The five physical rows are:

| source | blocker | selected row | physical trace |
|---|---:|---|---|
| `u=6` | 8 | `{3,6,9,10}` | `{u,xu}` |
| `xu=9` | 6 | `{0,3,5,9}` | `{xu,d}` |
| `d=0` | 4 | `{0,2,7,10}` | `{d,v}` |
| `v=2` | 11 | `{2,4,5,8}` | `{v,xv}` |
| `xv=8` | 7 | `{1,3,6,8}` | `{xv,u}` |

Their blocker labels `{8,6,4,11,7}` are distinct.  `model.json` contains the
complete selected cube and blocker map; `assignment.txt` is the total CaDiCaL
assignment for `instance.cnf`.

This witness must not be read as a complete placement census.  The separate
diagnostic `audit_all_placements.py` tested all 42 ordered placements in the
same base abstraction: all 42 were SAT, and only the two endpoint permutations
put both `d` and `v` on the second-cap endpoints.  In particular, the overlap
between the second-cap deletion fan and the physical-class deletion fan seen
in this first witness is not forced by the encoded source consequences.
`all-placement-audit.json` records the complete diagnostic table; it has no
proof artifacts and is not promotable.

## Omitted semantic hypotheses

The SAT result is only a relaxation because the following source semantics are
not encoded:

- Euclidean coordinates, actual distance equalities/inequalities, and global
  consistency among all radii;
- strict convex cyclic order, Kalmanson inequalities, and metric circle
  realizability of the selected incidence rows;
- minimum-enclosing-circle and cap geometry beyond the exact labeled cap
  incidence and the frozen proven admissibility cuts;
- the raw `D.Minimal` quantification over every smaller nonempty convex subset;
- the full all-radii `CriticalShellSystem.no_qfree` semantics and off-row
  distance exclusions (only its selected-row equality/coverage consequences
  and the physical-apex exclusion are represented);
- first-apex unique-radius/exact-four data, `noM44`, first-cap
  interior/bisector localization, source-heavy scalar data, and deletion-fan
  metric consequences not listed in the encoded interface; and
- finite completeness connecting every Euclidean realization of the Lean
  hypotheses to this abstraction.

Accordingly, SAT means only that these encoded necessary incidence
consequences do not contradict one another.

## Replay

From the repository root:

```bash
uv run python scratch/pentagon-offclass-exact12-v2/self_test.py
uv run python scratch/pentagon-offclass-exact12-v2/probe.py
uv run python scratch/pentagon-offclass-exact12-v2/audit_all_placements.py
uv run python scratch/pentagon-offclass-exact12-v2/verify_model.py
uv run python scratch/pentagon-offclass-exact12-v2/z3_check.py
```

Expected short outputs end in `PASS`, with the probe reporting
`SAT placements_tested=1 variables=39733 clauses=315923`.
