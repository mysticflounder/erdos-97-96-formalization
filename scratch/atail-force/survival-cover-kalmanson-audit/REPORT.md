# Survival-cover / Kalmanson source audit

Date: 2026-07-16

Status: **NO DIRECT KALMANSON SINK; EXACT FINITE NEGATIVE BOUNDARY; CARD-AT-LEAST-14
COUNTING DOES PRODUCE A GENERIC TWO-CENTER DELETION PACKET, BUT NOT THE ALIGNED
R-PACKET.**

## Question

Can the source-indexed deletion-survival cover now checked in
`anchored-double-deletion-producer/`, `survival-cover-bank-match/`, and
`survival-cover-geometry/` instantiate either:

1. the production consumer in `ATail/CapCrossingKalmanson.lean`; or
2. one of the five strict-cycle schemas extracted from the corrected
   fourteen-role survivor bank?

This audit also checks the sharper card-at-least-14 observation that blocker
fibers have cardinality at most four.

## Required preflight

The registries required by `AGENTS.md` were checked before introducing the
finite audit:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` queries were run for strict Kalmanson
cycles, same-cap critical sources, common deletion, blocker fibers, and the
aligned second-apex packet.  The useful existing consumers are:

- `CapCrossingKalmansonBridge.false_of_selected_rows_in_five_ccw_order`;
- the equality-quotient strict-cycle checker represented by the five saved
  schemas; and
- `nonempty_commonDeletionTwoCenterPacket`.

The legacy same-cap interface is not a match.  The existing audit
`docs/audits/2026-07-13-atail-legacy-samecap-blocker-audit.md` records that
`SameCapIncompatibleEdge` already assumes the endpoint-radius equality and
has no source producer.  Same-cap blocker placement alone cannot instantiate
it.

## Exact source-valid output

The checked survival-cover development supplies the following facts without
inferring a selected-row incidence:

1. Outside the known `q`-blocker fiber, deletion of `q` or deletion of `w`
   preserves a four-point witness at the source's actual blocker.
2. At cardinality at least eleven, a six-box pigeonhole argument produces two
   distinct sources of one survival color whose actual blockers lie in one
   closed cap.
3. If the blockers coincide, their common exact critical shell contains both
   sources and omits the common-color frontier point.
4. If the blockers are distinct, both receive honest ranks in one ordered cap
   and both source-indexed rows omit the common-color frontier point.

The conclusion does **not** contain any of the following:

- a support membership between a source and the other source's row;
- placement of either source in the blocker cap;
- an equality between a blocker and `p` or `S.oppApex2`;
- a five-role boundary-order embedding; or
- the endpoint-radius equality assumed by the legacy lap interface.

Deletion survival is used only through the checked equivalence with support
omission.  The audit never turns omission into positive membership.

## Corrected 101-shadow replay

`audit.py` reads the pinned corrected checkpoint

```text
scratch/atail-force/robust-all-center-marco/bank_cegar_checkpoint.json
sha256 b307fed8cf6c30508a615553f5a1caf8a836859f3d70f1907eb3f34b9196c8b9
```

and reconstructs, for every stored shadow:

- the total source-to-blocker map;
- the source-indexed selected row at each actual blocker;
- the known `q`-blocker fiber;
- `q`/`w` deletion survival as direct support omission;
- the three closed caps and fixed cyclic order; and
- the full five-point ambient first-apex radius class
  `{A,C,D,E,J}`.

It enumerates every pair satisfying exactly the fields of the geometric
survival pair.  For each pair it separately tests:

1. a strict Kalmanson cycle from the two actual rows alone;
2. a strict Kalmanson cycle after adding the full ambient first-apex class;
3. the exact direct-support antecedent of the production five-point consumer;
   and
4. the two-blocker footprints among the five saved X-domain schemas.

The replay is **EXACT WITHIN THE CORRECTED 101 STRUCTURAL SHADOWS**.  It is not
a Euclidean realization theorem and not a proof that the outer CEGAR domain is
exhausted.

### Results

```text
stored corrected shadows                              101
shadows violating the source-indexed cover              0
shadows without a same-cap/same-color pair               0
shadows with at least one noncyclic valid pair          101
shadows with no cyclic valid pair at all                  1
shadows without a production five-point matching pair   73
shadows with at least one production-nonmatching pair   101
```

The unique total cycle failure is survivor ordinal 36.  It has 59 valid
same-cap/same-color pairs.  None of those 59 pairs yields a strict cycle even
after adding the full ambient first-apex five-class.  Its first witness pair
has sources `O,t1`, distinct blockers `A,C`, both deletion colors available,
and no production five-point match.

This is the decisive negative boundary.  A theorem whose hypotheses consist
only of the currently retained survival-pair fields and the encoded
cap/order/radius-class data cannot force a strict cycle: survivor 36 satisfies
all of those finite consequences while avoiding the conclusion.

The production five-point consumer is even farther away.  Only 28 of the 101
shadows have any valid survival pair whose two blocker rows together with the
selected row at `O` realize its six direct memberships.  Every shadow has at
least one valid survival pair that does not realize them, so the present
existential pair theorem cannot select a production match even on those 28.

### Five-schema comparison

The five saved schemas have four named-row footprints; one footprint occurs
with two different shortest-cycle lengths:

```text
ambientO + A + X
ambientO + A + D + X       (two cycle-length schemas)
ambientO + D + X
ambientO + t1 + X.
```

A survival pair can supply at most two distinct blocker rows.  It therefore
cannot supply `A,D,X` without an independent third-row producer.  In the
corrected bank, a valid pair with a cyclic `A,X` blocker footprint occurs in
92 of 101 shadows.  The `D,X` and `t1,X` pair footprints occur in zero.  These
counts show recurrence, not coverage, and survivor 36 avoids every pair-based
strict-cycle footprint.

## The sharper card-at-least-14 counting route

There is one genuine source-valid gain independent of Kalmanson.

The current checked ingredients are:

```text
ten_le_sources_outside_qBlockerFiber
CriticalShellSystem.centerFiber_card_le_four
deletionSurvival_cover_of_mem_outside_qBlockerFiber
nonempty_commonDeletionTwoCenterPacket.
```

Ten outside-fiber sources force at least five sources of one deletion color.
One actual blocker fiber contains at most four sources, so two of those five
sources have distinct actual blockers.  The common survival fact then builds

```text
CommonDeletionTwoCenterPacket D H deleted center1 center2
```

at two arbitrary distinct actual blockers.  The 101-shadow replay confirms
that this conclusion is compatible with every saved shadow: no shadow lacks
a same-color distinct-blocker pair.

The adjacent bank-match lane now packages this composition as the
kernel-checked theorem
`exists_sourceFaithful_commonDeletionTwoCenterPacket_of_card_ge_fourteen`.
Its conclusion retains both sources, their outside-fiber facts, the chosen
frontier deletion, survival at both blockers, and the resulting generic
packet.  This closes the source-faithful generic producer; the consumer and
physical-role alignment remain open.

### Why this is not the aligned R entry

The mature F2/postmix handlers require the exact centers

```text
p, S.oppApex2.
```

The counting argument gives arbitrary `center1, center2`.  It proves neither
center is `p` and does not prove that `S.oppApex2` is in the critical map's
blocker image.  The retained dangerous system makes blocker equality with `p`
equivalent to the source lying in the four-point dangerous base, but the
monochromatic five-source class has no field forcing one selected source into
that base.  No analogous field forces the other blocker to the physical
second apex.

Consequently the packet cannot instantiate the aligned handlers.  As an
anonymous `CommonDeletionTwoCenterPacket`, it re-enters the already-known
generic common-deletion expansion exposed by the current normal form.  That
arm is nonterminal and can cycle unless the new cap/color/source provenance is
retained and consumed.  Merely constructing the generic packet again is not
proof closure.

## Verdict and next producer

The survival-cover theorem yields **no direct Kalmanson sink** and no complete
instance of the five strict-cycle schemas.  The exact finite boundary is
stronger than a missing-proof report: survivor 36 rules out every pair-only
strict-cycle consumer in the corrected abstraction.

The smaller remaining producer is one of:

1. an alignment theorem forcing a monochromatic distinct-blocker pair with
   centers exactly `p` and `S.oppApex2`; or
2. a genuinely geometric theorem adding a positive cross-support incidence
   or a boundary placement that selects a strict-cycle-bearing pair.

The second option must use information absent from the corrected finite
shadow, such as stronger MEC/cap geometry or an actual full-filter relation.
Further mining of support omission, source color, blocker cap, and selected
rows alone is mining the wrong object.

## Validation

The deterministic replay command is:

```bash
UV_CACHE_DIR=/tmp/uv-cache-atail uv run python \
  scratch/atail-force/survival-cover-kalmanson-audit/audit.py \
  --check --summary
```

`--check` pins the checkpoint hash, survivor count, cover facts, generic
distinct-blocker count, survivor-36 boundary, production-match count, and the
three possible two-blocker schema-footprint counts.  The script writes the
complete per-survivor evidence to `audit_results.json`.

No production Lean, closure document, proof-blueprint state, protected scratch
lane, or user-owned census artifact was changed.  No full build was run.
