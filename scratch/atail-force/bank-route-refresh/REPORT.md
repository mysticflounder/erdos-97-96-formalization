# K-A-PAIR theorem-bank refresh

Date: 2026-07-14

Status: **NO DIRECT BANK CLOSURE; EXACT PRODUCER ANTECEDENT IDENTIFIED.**

## Live obligation

The current source obligation is
`Problem97.U1LargeCapRouteBTailMetricResidualTarget.DoubleApexOffSurplusSharedRadiusPair`
at `U1LargeCapRouteBTail.lean:2517`.  Its conclusion is the forbidden pair
consumed immediately by `U2NonSurplusSqueeze.oppCap2_escape_gen`.  The current
kernel spine still reaches `sorryAx` only through this declaration on the K-A
branch.

The current source imports `ATail.CriticalPairFrontier`.  Its strongest
unconditional output is `exists_criticalPairFrontier_of_K4`: after choosing the
leaf surplus packet and a critical-shell system it gives a distinct
off-surplus pair on one first-apex radius, with both single deletions preserving
K4 at the second apex, followed by independent first- and second-apex deletion
splits.  It does not give a common second-apex radius or a terminal bank core.
Indeed `SurvivorPairRelocationPacket.oppApex2_dist_ne` proves that the extracted
pair has different second-apex radii.

## Required registry and index preflight

The following current registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the sibling,
  legacy, general-theorem, and Census-554 sections;
- both the Markdown and exhaustive JSON inventories for `p97-rvol`;
- both the Markdown and exhaustive JSON inventories for legacy `erdos/97`; and
- both the Markdown and exhaustive JSON inventories for
  `erdos-general-theorem/97`.

The exhaustive JSON queries covered all source-proved candidates containing
the live cap, critical-shell, removable-vertex, opposite-apex, and
equidistance vocabulary; all U1 contradiction consumers; all candidates with
`hNoM44`; and all four ambient-set candidates in each legacy inventory.
Semantic Lean-index searches were also run for the exact residual, the
double-apex pair, the seven-equality five-point obstruction, row extension,
two-large-cap removability, and critical-shell blocker coupling.

No result proves the live theorem from its raw hypotheses.

## Candidate audit

### `u1TwoLargeCapObstruction`

This is a real kernel-clean metric sink, but it is not imported by the current
U1 tail.  It needs `a != c` and seven explicit equalities `h1` through `h7`.
The refreshed current-bank replay shows:

- 5 of 23 preferred assignments are missing only
  `h4 : dist d c = dist d f`;
- 11 of 23 are missing only
  `h5 : dist f a = dist f d`; and
- 7 of 23 are nominally missing `h5+h7`, but adding `h5` alone reaches an
  already formalized current EqualityCore in every one of those seven cases.

Thus the fresh split is `5 / 11 / 7`, not the stale `5 / 12 / 6` split in an
older analysis note.  Porting the five-point sink does not remove the missing
producer.

### Current Census-554 equality cores

`DuplicateCenterCore` and `ExactOffCircleCore` are already Lean-proved.  After
one preferred `h4` or `h5` row extension, all 23 refreshed fixed-card-12
survivors hit one of them: 21 duplicate-center and 2 exact-off-circle hits.
Likewise every genuinely new strict opposite-cap pair is consumed in the
pinned shadow: 44 of 44 first-apex additions and 46 of 46 second-apex additions.

These are consumers, not a live coverage theorem.  `U1LargeCapRouteBTail` does
not currently import the Census-554 EqualityCore bank, and the bank does not
classify an arbitrary K-A packet into the pinned 23 fixed-`(5,5,5)`, card-12
shadows.  Importing the consumers would therefore be mechanical but premature.

### Other apparent closes

The sibling declarations `exists_removableVertex_of_twoLargeCaps`,
`false_of_center_p_t2_t20`, and `u1_largeCap_routeB_tail_false` are not
independent bank closes.  Their source bodies are locally `sorry`-free only
because they call the same `DoubleApexOffSurplusSharedRadiusPair` residual
transitively.  Reusing them would be circular.

The ten-entry `K4WindowBank` is also only a checked semantic sink.  It still
needs a live four-label classification plus the matching generator equalities.
Neither legacy archive contains an ambient-cardinality theorem supplying those
facts; their only nearby generic geometry is already subsumed by current
three-point equidistant-center uniqueness.

## Hypothesis map and first missing antecedent

The live hypotheses split as follows:

| Live inputs | What they currently supply | What they do not supply |
|---|---|---|
| `MT`, `hCirc`, `hM`, `hqCap`, `hsurplus`, `hjne`, `hj5`, `hNoM44`, `hcard` | the leaf surplus packet and two-large-cap geometry | a finite bank code or an off-frontier row equality |
| `hfixed`, `hbase`, `H`, `hcenter`, `hsupport` | the distinct base labels and the exact dangerous `p`-row | preferred `h4`/`h5` or a new strict-apex pair |
| `hcritical` | a global exact deletion blocker for every source and the imported paired frontier | deletion failure at the *prescribed other role center* needed by `h4`/`h5` |
| `hlocalNoQFree` | deletion failure at the base center `p` after deleting `q` | either required cross-role deletion failure |

After a branch has been classified into the preferred bank roles, the exact
first missing antecedent is one of

```text
h4 branch: not HasNEquidistantPointsAt 4 (D.A.erase f) d
h5 branch: not HasNEquidistantPointsAt 4 (D.A.erase d) f
```

The kernel-checked choice-invariant adapter in
`global-k4-extension/BlockerAlignment.lean` turns these statements directly
into `h4` and `h5`: if deletion of the source destroys K4 at the prescribed
center, every selected four-class at that center contains the source.

At the raw live K-A interface an earlier gate also remains: a coverage theorem
must either classify every live cardinality/profile/placement into a banked
role assignment, or bypass finite classification by forcing one such
prescribed deletion-criticality/new strict-pair equality uniformly.  The
current 23-case replay is a fixed-card-12 theorem-discovery shadow and cannot
serve as that coverage theorem.

Equivalently, the alternate-apex descent route needs the single newness field
that one endpoint of the descent pair lies outside the initial exact apex row.
`exactShell_coRadialPair_new_of_left_not_mem` then exports a genuinely new
same-radius pair.  Robust double-deletion survival and apex alternation do not
prove this nonmembership; the checked shard-zero interface reproduces only old
row pairs.

## Replay status

All current drift-pinned checks passed on this refresh:

- `current-bank-u1-match/analyze.py --check`;
- `current-bank-u1-match/role_audit.py --check`;
- `current-marco-cores/row_extension_completion.py --check`;
- `apex-strict-pair-completion/analyze.py --check`; and
- `alternate-apex-descent/audit_second_apex.py --check`.

No scratch Lean proof of K-A is supplied because no theorem-bank declaration
produces the antecedent above.  Adding a conditional wrapper would only rename
the open obligation.
