# Exactness-correct producer-bank CEGAR and MARCO audit

Date: 2026-07-15

Status: **101 CORRECTED STRUCTURAL SHADOWS; 524 SOUND ROW-MINIMAL CUTS;
FIRST 100 BANK-MATCHED; TERMINAL SHADOW BANK-CLEAN AND EXACT-CAS UNIT.**

This is a fixed-domain continuation of the corrected fourteen-role robust
surface.  It is not another ambient-cardinality census and does not edit any
production or shared closure file.

## The result

The cumulative checkpoint contains:

```text
verified corrected structural shadows      101
producer-bank-matched shadows               100
producer-bank-clean shadows                   1
MARCO row-core cuts                          524
single-row minimality deletions replayed    1799
survivors satisfying sharpened target         0
survivors avoiding sharpened target          101
terminal status  SAT_PRODUCER_BANK_CLEAN_CORRECTED_SHADOW
```

Every candidate was first checked by the finite structural verifier with the
ambient first-apex five-class participating in cyclic compatibility and
pair-center bounds.  The first 100 accepted map candidates hit at least one
currently formalized producer-bank consumer and were cut.  The 101st passes
both the selected-row and blocker-exact bank scans with zero matches.

The terminal status is not map UNSAT and does not prove an exhaustive theorem.
It is stronger and more useful than another budget stop: the current
formalized producer bank is now known to leave a verified corrected structural
escape.  The DFS effort grew from 10 nodes to 3,475 at the terminal witness.
That witness becomes a new metric-certification target; adding more copies of
the same bank cuts cannot remove it.

## Exactness semantics

The search uses three distinct notions and never conflates them:

1. `firstApexClass = {A,C,D,E,J}` is an ambient-exact five-point radius class
   at `O`;
2. an arbitrary global K4 is only a selected equal-distance four-class; and
3. a selected global row becomes exact only when its center is in the image
   of the decoded blocker map.

The selected-row scan runs with every anonymous K4 marked `exact=false` and
the ambient `O` class marked exact.  It supplies all unconditional cuts.  A
second scan applies actual blocker-image exactness and records any additional
exactness-dependent matches.  Across the 101 shadows there are 40 such
additional match records.  Every one of the 100 bank-matched shadows already
has an unconditional selected-row match, while the terminal bank-clean shadow
has neither kind.  No overstrong exactness-dependent cut was used.

In particular, the fixed double-survivor row at `A` is not exact by default.
It is exact in a decoded witness only if the chosen blocker map actually uses
`A` as a blocker center.

## MARCO cuts

For each bank-matched survivor, MARCO treats the thirteen non-`O` selected
rows as a monotone atom universe; the ambient `O` five-class is fixed.  The
oracle returns obstruction exactly when
`producer_bank.scan_all_formalized_cores` returns a record with a named Lean
consumer.  Each discovered core is rescanned, and deleting each of its rows
must remove every bank match before the cut is accepted.

The row-core size histogram is:

| rows in minimal core | cuts |
|---:|---:|
| 2 | 47 |
| 3 | 265 |
| 4 | 157 |
| 5 | 48 |
| 6 | 7 |

No full-assignment fallback cut was needed.  All 524 cuts came from a
row-minimal MARCO core with an independently replayed formalized-consumer
match.

The strongest recurrence is the forward/reverse
`FourPointTwoCircleBisectorOrderCore` family.  It occurs in 89 of the 101 full
shadows and accounts for many of the smallest two-row cuts.  It is not forced.
The orientation-specific disjunction suggested by the first 50 shadows fails
on later bank-matched examples.  Even the broadened family-level disjunction

```text
FourPointTwoCircleBisectorOrderCore (either orientation)
or ConvexFivePointCore (either orientation)
```

covers the first 100 shadows but fails on the terminal bank-clean shadow.
Therefore no observed family disjunction should be promoted as a theorem from
this census.

## Sharpened one-row target

The live roles are fixed throughout:

```text
q = E,
w = D,
J is fresh and J != w,
M = firstApexClass \ surplusCap = {C,D,E,J},
strictSurplus = {t1,I,F}.
```

For every corrected survivor the audit asks whether

```text
exists z in (globalRow(D) intersect strictSurplus),
  E in globalRow(z) and
  2 <= card (globalRow(z) intersect M).
```

Because the fixed `D` row is `{A,E,I,F}`, the eligible centers are exactly
`I,F`.  All 101 stored shadows have `holds=false`: they **avoid the desired
existential producer**.  This statement is about selected-row membership and
uses no ambient-exactness assumption.

The old seed had `z=I` and fresh point `J`, but it is not one of these
survivors: the corrected ambient `O` class immediately puts it in an existing
two-circle bank core.

## What happened to the CAS/MUS proposal

The initial 16-equality `O,D,E,I,F` subsystem is exact-CAS UNIT, and an
equality-level MARCO pass found one 11-equality basis-minimal core.  That is
not the load-bearing result.  The theorem-bank preflight shows that the same
old completion already contains forward and reverse formalized
`FourPointTwoCircleBisectorOrderCore` matches.  Mining a new large algebraic
consumer would therefore duplicate a smaller existing Lean consumer.

After 524 certified bank cuts, the corrected map produces a bank-clean row
assignment with row hash
`f4c8e9e69d7ca3bec381d27178710fc7aa4ab7f4308e70973b675a38b8eacc66`.
Replacing the selected four-subset at `O` by its known ambient five-class and
retaining the other thirteen rows gives 43 nonduplicate squared-distance
equalities.  The first exact replay returns `UNIT` in Singular over `QQ` and
in msolve under forward and reverse variable orders.  Hence this row system
has no simultaneous complex, and therefore no real, Euclidean realization.

This is the first nonredundant equality-certificate target exposed by the
corrected search.  Its encoding is being independently reconstructed and its
UNIT system minimized before a kernel-facing Lean consumer is accepted.  The
current result therefore says:

- multiple small formalized row cores do recur and are banked efficiently;
- no recurring bank family is forced by the 101-shadow sequence;
- one bank-clean structural shadow exists;
- exact algebra rejects its simultaneous metric realization; and
- a new minimized metric certificate, not another raw bank scan, is the next
  required artifact.

## Required theorem-bank preflight

Before accepting a cut, this lane checked the registries required by
`AGENTS.md` and used the current `producer_bank.scan_all_formalized_cores`
surface.  Every stored cut records its exact stage, orientation, role map, and
Lean consumer.  The strongest replay gate reconstructs all 524 row patterns,
rescans them, checks all 1,799 single-row deletions, reconstructs all 101
structural shadows, reruns both selected-row and blocker-exact scans, and
recomputes every sharpened-target audit.

## Epistemic boundary

The checkpoint is exhaustive only for each individual MARCO row-core
minimality replay.  The outer structural search is budget-bounded.  It omits:

- exhaustive coverage of the corrected fixed fourteen-role map;
- every other cap profile, cyclic order, and ambient cardinality;
- a Lean-kernel certificate for the terminal shadow's failed simultaneous
  Euclidean coordinate realizability;
- point-distinctness, convexity inequalities, and MEC inequalities in a CAS
  system; and
- a Lean proof that every live robust packet produces one of the observed
  bank families.

Accordingly, this is exact finite theorem-discovery evidence plus existing
Lean-consumer metadata, not closure of K-A-PAIR by itself.

## Validation

From the repository root:

```bash
UV_CACHE_DIR=/tmp/uv-cache-atail uv run python \
  scratch/atail-force/robust-all-center-marco/bank_cegar.py --check
```

Result:

```text
PASS: reconstructed bank cuts, MARCO deletions, structural survivors, and target audits: {"checked_bank_cuts": 524, "checked_single_row_deletions": 1799, "checked_structural_survivors": 101, "survivors_avoiding_sharpened_target": 101, "survivors_satisfying_sharpened_target": 0}
```
