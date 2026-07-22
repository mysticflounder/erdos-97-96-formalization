# Exact-five card-13 all-one source ingress

## Status

`AllOneSourceIngress.lean` now constructs a role-independent card-13 source
object for each of the three boundary hub positions used by the all-one CNFs.
The left, middle, and right cases remain separate.  No permutation identifying
boundary indices `1` and `3` is used.

The focused warnings-as-errors compile succeeds.  The printed axiom closures
of the public constructors and semantic bridges contain only:

- `propext`;
- `Classical.choice`;
- `Quot.sound`.

No certificate is applied in this module.

## Source object

`CanonicalAllOneCard13SourceIngress` retains the live exact-five parent `Q`
and contains:

1. `CanonicalCard13Frame`:
   - a bijective boundary enumeration of the 13 carrier points;
   - support vertices at indices `0`, `4`, and `8`;
   - exact closed-cap index blocks;
   - the physical exact-five points at indices `1`, `2`, and `3`;
   - both strict Kalmanson inequalities for every increasing quadruple.
2. `CanonicalAllOneSemanticRowTable`:
   - one main selected-four row at every center;
   - two independently selected global-cover row families;
   - the fixed critical-system blocker map in finite-index form;
   - the complete exact-five shell;
   - both frontier indices;
   - the first-apex double-deletion row;
   - the all-one fixed-critical-row condition.
3. `CanonicalAllOneSourceOrbitIngress`:
   - hub-left with edges `(1,2)` and `(1,3)`;
   - hub-middle with edges `(2,1)` and `(2,3)`;
   - hub-right with edges `(3,1)` and `(3,2)`.

Each orbit aligns the two boundary-edge cover families by permuting the two
independent source choices.  It never identifies them.

## Encoder assertion audit

The ingress now contains the semantic data needed to instantiate every source
assertion in `exact5-all-one-ordinal-rank/all_one_ordinal_rank.py`:

| Assertion family | Source witness |
|---|---|
| Main and cover row incidence/cardinality/radius facts | Three families of `SelectedFourClass` |
| Fixed blocker map and source membership | `blockerIndex`, `blocker_point`, `source_mem_fixed_blocker_main` |
| Blocker is not source or either robust apex | `blocker_index_constraints` |
| Cover synchronization on the blocker image | `blocker_image_supports_eq` and `CanonicalAlignedCoverFamilies.blocker_supports_eq_main` |
| All-one physical omissions | `fixed_blocker_main_one_hit` and `fixed_blocker_main_omits_other_physical` |
| Exact-five shell and physical members | `exactFiveShell_card`, `physical_index_mem_exactFiveShell` |
| All three row families at the second apex lie in the shell | `secondApex_rows_mem_exactFiveShell` |
| Frontier indices, off-surplus placement, and distinctness | `frontier_index_facts` |
| First-apex retained row and double-deletion row | `frontier_parent_row_facts` |
| Second-apex main row omits both frontier points | stored fields built from `F.secondApexDouble` |
| Two global deletion-cover edges | `CanonicalAlignedCoverFamilies.left_omits/right_omits` |
| Exact cap blocks and endpoint roles | `CanonicalCard13Frame` cap fields |
| Ordinal ranks and rank bound | `sourceRanks`, reusing `FiniteDistanceRank.lean` |
| Row/shell equal-rank guards | selected-row equal-radius fields and exact-five shell membership |
| Strict Kalmanson cancellation guards | `CanonicalCard13Frame.strictKalmanson` plus finite ordinal ranks |
| Bit layouts | `sourceRows`, `sourceBlockers`, `sourceShell`, `sourceFirstApexRow`, `sourceQ`, `sourceW` |

The audit caught and repaired one substantive issue: the index-8 main row was
initially an arbitrary ambient K4 row.  The encoder requires it to omit both
frontier points.  It is now selected from `F.secondApexDouble`, and those two
omissions are stored in the semantic table.

The per-assertion Boolean proof inventory is complete: 1,952 base assertions
and 5,304 rank/Kalmanson assertions, for 7,256/7,256 obligations. The middle
source composition is warning-as-error kernel-checked through all 114 chunks.
`false_of_middleAllOneSourceOrbit` closes under exactly `[propext,
Classical.choice, Lean.ofReduceBool, Lean.trustCompiler, Quot.sound]`, with no
`sorryAx`. The left and right compositions still need the same generic
7,253 adapters plus three orbit-specific cover omissions each. The semantic
ingress itself no longer lacks a source field used by the current formula.
The current formula does not add strong-connectivity cuts or a `q < w`
symmetry clause.

The approved generated-proof trust boundary is explicit: ten small
`native_decide` finite helpers in the semantic fact layer and `bv_decide`
normalization in the split packed-expression bridges. The persisted LRAT
endpoints themselves have no `sorryAx`.

The largest any-pair adapters initially repeated full semantic row-pack
normalization and exceeded a 12-minute engineering timeout. The source-faithful
`AllOneAnyPairPackedFacts.lean` proves the packed/semantic center bit equality
once. All 128 split base modules then pass warnings-as-errors, with formerly
timed-out representatives compiling in about five seconds. An independent
statement-hash audit found zero changes among all 158 regenerated base theorem
declarations.

## Validation

From `lean/`:

```text
LEAN_PATH=../scratch/atail-force/exact5-card13-cnf-ingress-audit \
  lake env lean -DwarningAsError=true -R .. \
  -o /tmp/exact5-card13-all-one-source-ingress/AllOneSourceIngress.olean \
  -i /tmp/exact5-card13-all-one-source-ingress/AllOneSourceIngress.ilean \
  ../scratch/atail-force/exact5-card13-all-one-source-ingress/AllOneSourceIngress.lean
```
