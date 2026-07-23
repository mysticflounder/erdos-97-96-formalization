# n=12 exact-four occurrence metric audit

Date: 2026-07-22

Scope: scratch-only full-linear replay of four completed `n = 12` p4/p5
incidence tables from `unique4-occurrence-feasibility`: the original two
tables and the two corrected tables carrying the exact strict-pair
bisector-localization overlay.  This lane changes no production Lean and no
shared closure document.

## Conclusion

All four stored tables are exactly UNSAT under the tracked full-linear
Kalmanson/triangle checker.

The original p4/p5 tables fail even earlier: each violates the source field
`OriginalUniqueFourResidual.bisector_center_mem_interior`.  They are retained
as pre-localization history, not source-faithful regressions.

The corrected p4/p5 tables pass the encoded localization overlay but still
contain a nonalternating shared pair.  Each reduces to one strict Kalmanson
inequality plus two radius equalities.  Both are already covered by production
Lean:

```lean
Problem97.false_of_two_centers_equidistant_pair_after
Problem97.false_of_two_centers_equidistant_pair_split
```

Both declarations close under exactly:

```text
propext, Classical.choice, Quot.sound
```

No new generic consumer should be formalized.

This audit does not close the exact-four source theorem.  It does prove that
none of these four tables is a surviving full-linear or source-faithful
regression, and it identifies the exact existing terminal for each corrected
table.

## Original tables: source-localization rejection

The original exact first-apex row chooses two strict first-opposite-cap
points.  In each table, the row at center `11` contains both, although `11`
is outside the strict first-opposite cap:

| profile | exact strict pair | row at center `11` | strict cap | result |
|---|---|---|---|---|
| p4 | `{5,6}` | `{5,6,9,10}` | `{5,6}` | center `11` is outside |
| p5 | `{6,7}` | `{6,7,9,10}` | `{5,6,7}` | center `11` is outside |

For an actual selected row, the two support memberships make its center
equidistant from the pair.  Since center `11` is a carrier point distinct
from first apex `0`, the source field

```lean
R.bisector_center_mem_interior
```

would force center `11` into the strict first cap, a contradiction.

Thus the original SAT results were exact countermodels only to the stated
incidence projection.  They cannot be cited against a source theorem using
the localization field.

Their full-linear cores independently match the split-order production
terminal:

| profile | centers | shared pair | order |
|---|---|---|---|
| p4 | `{0,11}` | `{5,6}` | `0 < 5 < 6 < 11` |
| p5 | `{0,11}` | `{6,7}` | `0 < 6 < 7 < 11` |

The source-localization failure is logically earlier and should be reported
first.

## Corrected localization-aware tables

The corrected encoder blocks every outside-center row containing the exact
strict pair.  The two regenerated tables pass that check:

| profile | exact strict pair | outside pair-hit centers |
|---|---|---|
| p4-bisector | `{5,6}` | none |
| p5-bisector | `{5,6}` | none |

They are nevertheless full-linear UNSAT for different shared pairs.

### Corrected p4

Rows at centers `10` and `11` both contain `{6,9}`:

```text
row 10 = {3,6,8,9}
row 11 = {4,6,9,10}
```

The four relevant boundary roles have order:

```text
6 < 9 < 10 < 11.
```

The direct minimized row-instance core is:

```text
6,9 ∈ row 10
6,9 ∈ row 11
kal2_6_9_10_11.
```

This is exactly the point-point-center-center arrangement consumed by:

```lean
Problem97.false_of_two_centers_equidistant_pair_after
```

with:

```text
i1 ↦ 6, i2 ↦ 9, j1 ↦ 10, j2 ↦ 11.
```

The tracked deletion minimizer happened to return a telescoped three-inequality
version:

```text
kal2_6_7_10_11
kal2_7_8_10_11
kal2_8_9_10_11
```

together with anchor-relative row equalities.  That raw core is valid but is
not globally smallest.  The single local inequality
`kal2_6_9_10_11` and the same two row equalities are a strict subproblem and
give the existing four-role consumer directly.

### Corrected p5

Rows at centers `0` and `10` both contain `{1,5}`:

```text
row 0  = {1,5,6,10}
row 10 = {1,5,7,9}
```

The relevant order is:

```text
0 < 1 < 5 < 10.
```

The direct minimized row-instance core is:

```text
1,5 ∈ row 0
1,5 ∈ row 10
kal1_0_1_5_10.
```

This is exactly the center-point-point-center arrangement consumed by:

```lean
Problem97.false_of_two_centers_equidistant_pair_split
```

with:

```text
j2 ↦ 0, i1 ↦ 1, i2 ↦ 5, j1 ↦ 10.
```

The tracked deletion minimizer returned an equivalent telescoping core through
labels `2,3,4,11`.  Again, the direct local quadruple gives a smaller exact
core already covered by production.

The corrected p5 shared pair `{1,5}` is not the exact strict pair `{5,6}`.
Therefore this rejection is genuinely distinct from the bisector-localization
overlay.

## Exact compressed core

Both corrected local cores normalize to the same three linear constraints.
For the appropriate cyclic arrangement, write the four terms as
`ab, ac, bd, cd`.  The normalized constraints are:

```text
ac + bd ≥ ab + cd + 1
ab = ac
bd = cd.
```

They are UNSAT.  The audit separately checks deletion minimality over the
positive-distance background:

```text
ab, ac, bd, cd ≥ 1.
```

Deleting any one of the three displayed constraints yields an exact rational
model, stored in `audit.json`.  At the row-instance layer, the two equalities
are produced by exactly four support memberships: both shared points in each
of the two selected rows.

The extra fifth and later labels in the tracked raw cores are artifacts of
the row-anchor encoding and the deletion minimizer's initial UNSAT core; they
are not required by the mathematical consumer.

## Required theorem-bank preflight

The registries required by `AGENTS.md` were checked before classifying the
cores:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries covered:

- two selected endpoint-centered rows sharing both middle points;
- `false_of_two_centers_equidistant_pair_after`;
- `false_of_two_centers_equidistant_pair_split`; and
- cyclic separation for two centers equidistant from one pair.

The indexed corpus returned both production theorems directly.  The broader
search also returned the neighboring shared-pair Kalmanson and
cyclic-separation families.  The cores are therefore classified as
**existing checked consumers**, not new generic theorem candidates.

## Consequence for the search

The current arbitrary-card incidence encoder is missing more than the
six-role-triangle cut:

1. the original version omitted the sharp exact-pair bisector localization;
2. after that overlay was added, it still admitted other nonalternating
   shared pairs already forbidden by production Kalmanson terminals.

The next finite outer should pre-seed all cyclic transports of the four-role
`TwoCenterBisectorParity` family before generating another SAT table.  That
is a sound finite-search correction because each cut has an existing
kernel-checked consumer.

What this audit does **not** prove:

- it does not prove that every exact-four residual produces one of these
  shared pairs;
- it does not prove the global six-role occurrence;
- it does not close the exact-four branch or either live `sorry`; and
- it does not turn fixed-cardinality exhaustion into an arbitrary-cardinality
  theorem.

It does remove four false search frontiers and supplies the exact checked
consumer family that should be installed as a seed bank.

## Hash-bound artifacts

[`audit.json`](audit.json) binds:

- all four input model hashes and original CNF hashes;
- all four tracked full-linear replay hashes;
- the tracked replay/checker source hashes;
- all required theorem-bank registry hashes;
- the production consumer source hash;
- the raw and globally minimized cores;
- rational deletion witnesses;
- the two stale source-localization violations; and
- the corrected consumer role maps.

[`ConsumerCheck.lean`](ConsumerCheck.lean) imports both production theorems
and prints their exact types and axiom closures without duplicating them.

## Validation

The original and corrected model artifacts have exact `--check` gates in
`audit_global_triangle_occurrence.py`.  The aggregate metric audit replays all
four tables and checks its stored output:

```bash
UV_CACHE_DIR=/tmp/uv-cache uv run --offline python \
  scratch/atail-force/unique4-occurrence-metric-audit/audit_n12_metric_core.py \
  --output scratch/atail-force/unique4-occurrence-metric-audit/audit.json \
  --check
```

The consumer import and axiom gate is:

```bash
cd lean
lake env lean -DwarningAsError=true \
  ../scratch/atail-force/unique4-occurrence-metric-audit/ConsumerCheck.lean
```

Both checks pass.  The direct scratch-file Lean invocation emits the expected
environment notice but exits successfully with warnings-as-errors.
