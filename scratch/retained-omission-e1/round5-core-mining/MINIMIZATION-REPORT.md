# `fresh_SSS_k1_d3_f2` schema-v3 core minimization

## Verdict

The 284-clause core is not a small mathematical core.  Its load-bearing
content is the exact three-S6 support pattern, the existence of global K4
rows, and cyclic-order geometry.  The schema-v3 squared-distance families,
the retained-omission data, the no-all-apex-shell condition, and circle-overlap
clauses are not needed for this UNSAT route.

The clearest proof candidate is a 31-clause **pure finite set-system
obstruction**.  It says that three six-element circle supports containing the
three consecutive four-point interiors cannot coexist with four-element rows
at centers 7 and 8, once the banked two-center cyclic-alternation rule is
imposed.  It is stronger than the target case: `kept=1`, `deleted=3`, and
`fresh=2` disappear.

This is discovery evidence, not closure.  No Lean/Lake command was run, no
DRAT-style certificate exists for the Z3 calls, and no transitive axiom audit
was performed.  The 31-clause obstruction was independently exhaustively
enumerated in ordinary Python, but the encoding-to-live-Lean bridge still has
to be proved.

## Input and literal minimization

The input has 12,078 source constraints and a 284-clause Z3 core.  Rebuilding
the case from the live `round5_cegar.py` gave zero expression mismatches for
all 284 indexed entries.

Input family counts:

| Family | Clauses |
|---|---:|
| `strict_kalmanson` | 148 |
| `exact_rich_profiles` | 60 |
| `global_K4` | 32 |
| `cyclic_alternation_cut` | 11 |
| `same_shell_squared_superadditivity` | 11 |
| `squared_distance_equality_transport` | 11 |
| `positive_squared_distances` | 8 |
| `no_all_apex_shell` | 2 |
| `distinct_circle_overlap` | 1 |

Deleting one whole family from the 284 clauses at a time leaves UNSAT for
every family except these three:

- `exact_rich_profiles` (deletion is SAT);
- `global_K4` (deletion is SAT);
- `strict_kalmanson` (deletion is SAT).

Thus all six other families are individually dispensable.  In particular,
none of the schema-v3 squared-distance material is indispensable.

Two ordered greedy clause-deletion passes, each with no `unknown`, give:

| Route | Remaining clauses | Families |
|---|---:|---|
| remove precompiled cuts first | 172 | 59 `exact_rich_profiles`, 32 `global_K4`, 81 `strict_kalmanson` |
| preserve cuts, remove metric clauses first | 82 | 9 `cyclic_alternation_cut`, 30 `exact_rich_profiles`, 18 `global_K4`, 25 `strict_kalmanson` |

Each result is single-clause irreducible relative to its resulting subset.
The large difference is diagnostic: Z3's original clause core contains two
ways of expressing the same bisector-parity geometry.  Which one survives is
mostly deletion order, not mathematical substance.

Artifacts:

- `v3-family-deletions.json`
- `v3-greedy-core.json`
- `v3-greedy-cuts-core.json`
- `minimize_v3_core.py`

## The 31-clause set-system core

The full precompiled alternation bank was then queried using only
`exact_rich_profiles`, `global_K4`, and `cyclic_alternation_cut`.  This
2,487-clause relaxation is UNSAT.  Its initial Z3 core had 47 clauses and
greedy deletion left 31, all Boolean:

- `exact_rich_profiles` indices
  `12, 16, 17, 18, 19, 20, 48, 51, 52, 53, 54, 55, 84, 86, 87, 88, 89, 90`;
- `global_K4` indices `231, 247, 264, 278`;
- `cyclic_alternation_cut` indices
  `1332, 1334, 1335, 1381, 1383, 1384, 1569, 1570, 1613`.

This is **not literally a subset of the supplied 284 clauses**: it uses the
same schema's K4 rows at centers 7 and 8 and several alternation clauses that
the original Z3 core did not select.  It is therefore a nearby stronger proof
candidate exposed by minimizing the complete bank, not a claim that the input
core itself shrank to 31.

The exact machine artifact is `v3-combinatorial-core.json`.

### Variable map

Let the cyclic universe be

`(13,0,1,2,3,14,4,5,6,7,12,8,9,10,11)`.

Write

- `R0 = {x | rich_0_0_x}`, the six-point row centered at apex 12;
- `R1 = {x | rich_1_0_x}`, centered at apex 13;
- `R2 = {x | rich_2_0_x}`, centered at apex 14;
- `K7 = {x | k4_7_x}` and `K8 = {x | k4_8_x}`.

The 18 profile clauses say

- `|R0|=6`, `{0,1,2,3} ⊆ R0`, and `12 ∉ R0`;
- `|R1|=6`, `{4,5,6,7} ⊆ R1`, and `13 ∉ R1`;
- `|R2|=6`, `{8,9,10,11} ⊆ R2`, and `14 ∉ R2`.

The four K4 clauses say `|K7|=|K8|=4`, `7∉K7`, and `8∉K8`.

Each alternation clause says that the two named supports have at most one
common point in the listed domain:

| Index | Supports | Domain |
|---:|---|---|
| 1332 | `K7,R0` | `U \ {7,12}` |
| 1334 | `K7,R1` | `{0,1,2,3,4,5,6,14}` |
| 1335 | `K7,R2` | `{0,1,2,3,8,9,10,11,12,13}` |
| 1381 | `K8,R0` | `U \ {8,12}` |
| 1383 | `K8,R1` | `{0,1,2,3,4,5,6,7,12,14}` |
| 1384 | `K8,R2` | `{0,1,2,3,9,10,11,13}` |
| 1569 | `R0,R1` | `{0,1,2,3,4,5,6,7,14}` |
| 1570 | `R0,R2` | `{0,1,2,3,8,9,10,11,13}` |
| 1613 | `R1,R2` | `{4,5,6,7,8,9,10,11,12}` |

## Human-readable contradiction

Put `A={0,1,2,3}`, `B={4,5,6,7}`, and `C={8,9,10,11}`.  Since each `Ri`
has size six and contains its four-point block, write
`Ri = interior_i ∪ Xi`, where `|Xi|=2`.

First, the last three alternation clauses force the three apex-cover facts

`12 ∈ R1 ∪ R2`, `13 ∈ R0 ∪ R2`, and `14 ∈ R0 ∪ R1`.

Here is a compact counting proof for the first; the other two are cyclic
rotations.  Suppose `12∉R1∪R2`.  Across the six extra memberships in
`X0,X1,X2`, let `T` count memberships landing in one of the other two
four-point blocks.  Let `s` count the shared endpoint-apex pairs
`13∈X0∩X2` and `14∈X0∩X1`.  Adding cuts 1569, 1570, and 1613 gives
`T+s≤3`.  Every remaining extra membership is one of the two occurrences
available for apex 13 or the two available for apex 14, hence its count `E`
satisfies `E≤2+s`.  But all six extras are counted by `T+E`, so
`6=T+E≤5`, contradiction.

Now split on the forced membership of 12.

- If `12∈R2`, the three sets
  `R0∩D1332`, `R1∩D1334`, and `R2∩D1335` cover `U\{7}`.  The fixed
  interiors cover `A`, `B\{7}`, `C`, and 12; the two other apex-cover
  facts cover 13 and 14.  Cuts 1332, 1334, and 1335 say that `K7`
  meets each covering set at most once.  Therefore `|K7|≤3`, contradicting
  `|K7|=4`.
- Otherwise `12∈R1`.  The identical argument with domains 1381, 1383,
  and 1384 covers `U\{8}` and gives `|K8|≤3`, contradicting `|K8|=4`.

That is the small obstruction.  It is a five-support pigeonhole argument;
no distances, squared distances, retained/deleted/fresh points, or
no-all-apex-shell hypothesis appear.

## Independent enumeration and trust boundary

`verify_combinatorial_obstruction.py` enumerates all `45^3` raw rich-support
choices directly, without Z3.  It finds:

- 857 triples after the three rich-rich cuts;
- zero failures of any of the three apex-cover facts;
- 469 triples in each branch (`12∈R2` and `12∈R1`, overlapping when both);
- zero failures of the corresponding three-domain cover;
- zero full five-support witnesses.

The output is `v3-combinatorial-enumeration.json`.

The solver and enumeration establish only the finite Boolean lemma.  Promotion
still needs:

1. a Lean finite-set/cardinality proof of the 31-clause lemma;
2. a source-faithful construction of `R0,R1,R2,K7,K8` from the exact-15 SSS
   context;
3. nine applications of the appropriate source-clean terminals in
   `lean/Erdos9796Proof/P97/ATail/TwoCenterBisectorParity.lean` to derive the
   arc-at-most-one clauses; and
4. a transitive proof-blueprint/axiom audit of the resulting publish path.

The parity terminal file is source-clean by textual inspection, but its
transitive axiom status was not checked here.  The current indexed theorem-bank
search did not surface an existing theorem with this exact five-support
statement, so the finite set-system lemma appears to be the first missing
bridge rather than an already named bank theorem.

## Reproduction

All Z3 calls used version 4.16.0, `threads=1`, seed 97, and produced no
`unknown` result.  Relevant commands are embodied in the three scripts in this
directory.  Input SHA-256:
`5ba47307c09f9501c519f7d6faaa8846d71683dff9387483083b4a7efac4f818`.
Encoder SHA-256:
`451aae82966ddea02fa81da2d656415cf4e942e9ba7b2eefc96c915f7d62e857`.
