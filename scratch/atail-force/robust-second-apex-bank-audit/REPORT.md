# Robust physical-second-apex bank audit

Date: 2026-07-16

Status: **NO ROBUST SURVIVOR IN THE CORRECTED CARD-FOUR PROFILE; THE
GENERAL ENDPOINT SPLITS SHARPLY AT CAP FIVE AND CAP SIX.**

## Exact finite result

The corrected 101-shadow checkpoint fixes the census profile `(8,4,5)`.
In live names the physical second apex is `A`, its opposite closed cap is

```text
oppCap2 = {C,G,K,O},
```

and its strict interior is `{G,K}`.

The only local restriction used in this audit is the proved Moser-endpoint
one-hit bound: an exact radius class centered at `A` meets each of the two
adjacent closed caps in at most one point.  Exhaustive enumeration gives:

```text
admissible selected four-supports at A          28
supports containing both strict points G,K      28
admissible exact five-supports                    0
disjoint admissible four-support pairs            0
corrected shadows extendable to full robustness   0 / 101
```

Thus both exact causes of `FullyDeletionRobustAt D S.oppApex2` are absent:

1. no radius class can have cardinality at least five; and
2. two distinct K4 radii cannot coexist, because selected four-subsets from
   them would be disjoint while every admissible four-support contains
   `{G,K}`.

This conclusion is **exhaustive and exact within the pinned finite cap
profile**.  It is not a Euclidean realization claim.  The corresponding
finite schema is independently executable in
`RobustSecondApexFiniteCertificate.lean`.  Its exhaustive tables use
`native_decide`: the resulting declarations have no `sorryAx`, but their
reported axiom closure includes `Lean.ofReduceBool` and
`Lean.trustCompiler`.  They are therefore a compiler-evaluated Lean replay,
not a kernel-only certificate.

## Sharp cardinality boundary

The same endpoint-one-hit enumeration was repeated for profiles
`(8,c,5)`, varying the physical second opposite cap cardinality `c`:

| `c` | admissible 5-supports | disjoint 4-support pairs | consequence |
|---:|---:|---:|---|
| 4 | 0 | 0 | full deletion robustness impossible |
| 5 | 28 | 0 | five-point-radius mode appears |
| 6 | 123 | 1,512 | distinct/disjoint-radius mode also appears |
| 7 | 336 | 10,080 | both modes remain |
| 8 | 731 | 39,320 | both modes remain |

The card-four result is therefore sharp in the abstraction.  The minimal
antecedent needed to lift this bank result is

```lean
S.oppCap2.card = 4.
```

Without it, a general proof must route the exact-five mode to the protected
swapped unique-five consumer and treat `6 ≤ S.oppCap2.card` as a genuinely
separate residual.  The corrected 101-shadow bank contains neither of those
higher-cap profiles, so it cannot certify them.

## Kalmanson replay

Against the current producer bank, all 101 stored **full all-center row
completions** have the direct five-point Kalmanson match and an ordinal
strict-distance cycle.  This is useful replay evidence, but it is not the
robust endpoint proof:

```text
full stored completions with a current bank match       101 / 101
full stored completions with direct Kalmanson match     101 / 101
full stored completions with an ordinal strict cycle    101 / 101
fixed parent-local O/A/D/t1 packets with such a cycle     0 / 101
```

The sampled full-row contradictions depend on additional all-center row
choices.  No checked theorem says every live robust packet produces one of
those stored choices or schemas.  In contrast, the cap-four endpoint audit
is local and has zero robust extensions before Kalmanson is consulted.

Accordingly, no full linear Kalmanson/Farkas run is needed for the card-four
endpoint: the exact finite domain is already empty.  Kalmanson remains a
possible consumer only for the higher-cap residuals, which are outside the
corrected 101-bank's fixed profile.

## Existing theorem-bank preflight

Before deriving the finite schema, the required registries were checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`;
- `certificates/erdos_general_theorem_p97_mining.{md,json}`; and
- focused `nthdegree docs search --lean` queries for deletion robustness,
  Moser-apex cap one-hit bounds, distinct K4 radii, and opposite-cap
  cardinality.

The reusable geometric ingredients are already present: the exact-radius
one-hit theorems in `U2NonSurplusOneHit` and the opposite-vertex cap-cardinality
bounds used by the concurrent robust-second-apex geometry lane.  No new local
metric or incidence theorem-bank consumer is needed for the card-four case.

## Epistemic boundary

- **COMPILER-EVALUATED LEAN REPLAY:** the fourteen-label endpoint-one-hit
  schema, no admissible five-support, and no disjoint admissible four-support
  pair.  The declarations have no `sorryAx`, but do depend on
  `Lean.ofReduceBool` and `Lean.trustCompiler` through `native_decide`.
- **EXACT WITHIN THE PINNED FINITE ABSTRACTION:** all 101 checkpoint replays,
  all 28 physical-second-apex candidates, and the cap-cardinality threshold
  table.
- **FORMALIZED-MATCHER REPLAY:** the current bank and ordinal Kalmanson counts
  on all 101 stored full-row completions.
- **NOT PROVEN HERE:** a live parent theorem forcing `oppCap2.card = 4`, a
  cap-five terminal, a cap-at-least-six contradiction, K-A-PAIR, or any
  production `sorry` closure.

## Replay

From the repository root:

```bash
UV_CACHE_DIR=/private/tmp/p97-uv-cache uv run python \
  scratch/atail-force/robust-second-apex-bank-audit/audit.py \
  --check --summary
```

The focused Lean certificate should be compiled as an isolated scratch file;
no full project build is needed.

```bash
cd lean
lake env lean -R .. -M 16384 \
  -o /private/tmp/p97-robust-second-apex-finite-certificate.olean \
  ../scratch/atail-force/robust-second-apex-bank-audit/\
RobustSecondApexFiniteCertificate.lean
```
