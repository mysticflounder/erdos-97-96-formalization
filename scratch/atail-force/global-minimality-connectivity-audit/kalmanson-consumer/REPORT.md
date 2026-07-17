# Strict-Kalmanson consumer audit and constrained continuation

Date: 2026-07-16

## Verdict

The deep-thinker proposal's strict-distance consumer is effective on the
current corrected robust surface.

1. **Stored-prefix replay:** ordinal strict-distance closure contradicts all
   101 stored structural witnesses.  This includes the 101st and only
   old-bank-clean witness.  No full linear inequality is needed.
2. **Terminal certificate:** survivor 101 has a two-inequality, three-row
   strict cycle.  The corresponding normalized integer Farkas certificate is
   `(1,1)` and sums to `0 >= 2`.
3. **Constrained continuation:** after enabling the strict closure as a
   prefix-monotone DFS gate, the fixed 14-role `(8,4,5)` structural surface is
   exhaustive-UNSAT before branching.  The fixed prefix is itself consistent,
   but the `X`, `I`, and `F` singleton row domains have zero survivors.

This is the first positive consumer found for item 5.  It is not yet a
proof-spine closure or a general-cardinality theorem.  The finite continuation
fixes one 14-label cyclic order, one cap profile, and the current candidate
domains.  The strict crossing bridge and direct five-point selected-row
consumer have since been promoted to production Lean; the fixed-surface
coverage and live parent extraction remain unformalized.

## Epistemic status

- **PROVEN IN PRODUCTION LEAN:** the strict crossing/Kalmanson inequalities
  and one direct five-point selected-row terminal in
  `Erdos9796Proof.P97.ATail.CapCrossingKalmanson`.
- **EXACT WITHIN THE STORED 101-WITNESS PREFIX:** all 101 ordinal
  contradictions and their integer certificates.
- **EXACT WITHIN THE FIXED 14-ROLE FINITE SURFACE:** the constrained DFS UNSAT
  and the zero singleton domains, conditional on the soundness of the strict
  Kalmanson consumer.
- **THEOREM-DISCOVERY ONLY:** the Python finite encodings and search output.
- **NOT ESTABLISHED:** a Lean theorem extracting this finite surface from the
  live parent uniformly in cardinality, a Lean strict-cycle checker, or closure
  of a proof-spine `sorry`.

The base checkpoint is a prefix, not prior coverage exhaustion.  Its status is
`SAT_PRODUCER_BANK_CLEAN_CORRECTED_SHADOW`, at iteration 26 of a budget of 50;
the prior round was budget-failed.  Therefore killing the saved 101 witnesses
alone would have been a strong next cut, not closure.  The separate constrained
continuation is what establishes exhaustive UNSAT for this one fixed surface.

## Required theorem-bank preflight

Before constructing the audit I checked the registries required by
`AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, including the
  sibling `p97-rvol` section;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Focused `nthdegree docs search --lean` searches covered cyclic convex
quadrilateral crossing, selected-shell equality to strict comparison, and the
six-point alternating equality pattern.  The searches found the existing
strict-order kernels, `SixPointCircleChainOrderCore`,
`SixPointTwoCircleOrderCore`, the arc-overtake family, and the legacy
four-point Radon/diagonal-intersection reserve.  None had the terminal
three-row statement shape below, and the current producer-bank matcher indeed
reports zero matches on survivor 101.

The legacy Radon reserve may help formalize the geometric bridge, but it does
not replace the live cap-order producer or the strict-cycle consumer.

## Exact input and order validation

The audited input is exactly

```text
scratch/atail-force/robust-all-center-marco/bank_cegar_checkpoint.json
SHA-256 b307fed8cf6c30508a615553f5a1caf8a836859f3d70f1907eb3f34b9196c8b9
```

It stores 101 witnesses and 524 formalized-consumer cuts.  Witnesses 1--100
have an old producer-bank match; witness 101 has neither a selected-row nor a
blocker-exact match.

The audit verifies every generator source hash stored by that checkpoint
before reading the order.  The producer bank has intentionally advanced since
the prefix was written; its checkpoint and current hashes are both recorded,
and the current bank is not used by the ordinal replay.  In particular:

```text
robust-all-center-cegar/search.py  54edd2c3ed92ef6d0d55f5f5196d9ec84d2d04cabc40a3ecc04cabbcb4a16d02
robust-all-center-marco/bank_cegar.py 35b911ccde42691fee1f9d425634f626154cc0621ff8802b8f7f1d2547a8ea16
census/atail_force/producer_bank.py (checkpoint)
  b6cf53f6950231e39d9f2fa8ea855587d17445b6630a7ed8d825b4caaf70f2a0
census/atail_force/producer_bank.py (current direct Kalmanson bank)
  484510cafb79a1256a0dcd030958e57145229654cabd245aa29030543b1cf8cb
```

The fixed cyclic order is parsed from the pinned generator and independently
reconstructed from the current `(8,4,5)` frame:

```text
O, t1, I, F, A, X, Y, Z, D, J, E, C, G, K
```

The reconstructed numeric hull order is

```text
0, 11, 12, 13, 1, 3, 4, 5, 6, 7, 8, 2, 9, 10.
```

The cap-role check also passes:

```text
surplus = {O,t1,I,F,A}
opp1    = {A,X,Y,Z,D,J,E,C}
opp2    = {C,G,K,O}.
```

For every witness the checker recomputes the stored row and blocker hashes,
verifies one center-omitting four-support at all 14 labels, and rebuilds the
unordered-edge equality quotient from scratch.

## Ordinal encoding

There is one distance variable for each unordered carrier pair.  All four
edges from a selected-row center to its support are unioned in an equality
quotient.

For each cyclic quadruple `a,b,c,d`, the checker installs both strict
Kalmanson inequalities:

```text
d(a,c) + d(b,d) > d(a,b) + d(c,d)
d(a,c) + d(b,d) > d(a,d) + d(b,c).
```

Whenever one left term and one right term are equal in a directly stored row,
they cancel and produce a strict comparison between the remaining terms.  The
checker transitively closes these comparisons and rejects a strict self-edge
or directed cycle.

The saved-prefix result is:

```text
stored witnesses                         101
ordinal contradictions                   101
ordinal survivors                          0
shortest cycle length 1                    89
shortest cycle length 2                    12
```

Each stored certificate cites the cyclic quadruple, the exact selected row
that justifies cancellation, the remaining strict comparison, and direct-row
paths connecting consecutive equality classes.  Summing a cycle's reduced
inequalities gives an integer Farkas certificate.

## Survivor 101: explicit certificate

The terminal record is iteration 26, row-assignment SHA-256

```text
f4c8e9e69d7ca3bec381d27178710fc7aa4ab7f4308e70973b675a38b8eacc66.
```

Only rows `A`, `I`, and `J` are needed.

The restricted cyclic orders `O,I,A,C` and `O,t1,I,J` give

```text
OA + IC > OI + AC,
OI + t1J > OJ + t1I.
```

The stored rows supply

```text
row A: OA = AC,
row J: t1J = OJ,
row I: IC = t1I.
```

Hence

```text
OI < IC = t1I < OI,
```

a two-step strict cycle.  In the normalized homogeneous linear system the two
inequalities have multiplier one and sum to `0 >= 2`.

Exact Z3 rational LRA independently reports UNSAT both for:

- positivity plus all 2,002 Kalmanson inequalities (2,051 constraints after
  the 49-class quotient); and
- the same system plus all triangle inequalities (3,143 constraints).

Both verdicts are accepted only with the independently replayed integer
certificate above.  Because ordinal closure leaves no saved survivors, a
broad full-LP pass adds no decision value.

## Universal prefix continuation

`prefix_filter.py` implements the monotone search gate needed by the current
DFS:

1. union the ambient exact first-apex class and every currently chosen row;
2. add every strict comparison obtained by cancellation in either Kalmanson
   inequality;
3. reject a comparison within one equality class or any directed cycle.

Adding rows can only merge equality classes and add strict comparisons, so a
rejected prefix cannot become admissible later.  The gate can therefore be
called safely from `dfs_candidate.prefix_compatible`.

`kalmanson_continuation.py` overlays that gate on the authoritative DFS and
the exact `b307...` checkpoint without editing the original search.  Its
result is:

```text
status                            UNSAT_EXHAUSTIVE_FINITE_DFS
DFS nodes                         0
prefix calls                    110
Kalmanson prefix rejections      82
fixed prefix contradictory       no
zero singleton row domains        X, I, F
```

The zero-node result is not a budget shortcut.  During the solver's exhaustive
variable-domain filtering, every candidate at one of those centers is already
dead with the fixed prefix, so no complete assignment can exist.

The independently replayed raw domain counts are:

| Center | Candidate rows | Kalmanson-dead | Survive |
|---|---:|---:|---:|
| X | 401 | 401 | 0 |
| I | 328 | 328 | 0 |
| F | 328 | 328 | 0 |

After applying the old fixed-row compatibility and pair-capacity gates first,
the load-bearing new counts are:

```text
X: 70 / 70 Kalmanson-dead
I: 69 / 69 Kalmanson-dead
F: 65 / 65 Kalmanson-dead.
```

The 524 old bank cuts do not drive this UNSAT: each zero singleton domain is
established before any full assignment or new bank scan, and the independent
domain replay uses no formal-bank cut.

## X-domain schema compression

The requested 401-row X audit separates redundant old-gate failures from the
new consumer.

Across the raw 401 candidates the first deterministic minimal-row subsets are:

```text
A + X                   140
D + X                   128
t1 + X                   63
ambientO + A + X         44
ambientO + A + D + X     16
ambientO + t1 + X         6
ambientO + D + X          4
```

The first three two-row groups are among the 331 candidates already removed
by existing fixed-row gates.  The 70 load-bearing candidates compress to four
named-row footprints and five `(footprint, shortest-cycle-length)` schemas:

| Named rows | Cycle length | Candidates |
|---|---:|---:|
| `ambientO,A,X` | 2 | 44 |
| `ambientO,A,D,X` | 2 | 4 |
| `ambientO,A,D,X` | 3 | 12 |
| `ambientO,D,X` | 2 | 4 |
| `ambientO,t1,X` | 2 | 6 |

Thus this is not one literal fixed certificate.  It is, however, already a
small finite family, and all five schemas are instances of one generic theorem:
equality quotient plus a checked strict Kalmanson cycle implies `False`.

The next compression checkpoint is recorded in
`x_domain_schema_results.json`: emit the actual step signatures for the 70
load-bearing candidates, quotient them under the cap-profile automorphisms,
and decide between four small geometric lemmas and one executable finite
strict-cycle certificate checker.  Do not resume unconstrained mining on the
old 101-prefix surface; the universal gate has exhausted it.

## What this does and does not advance

This changes item 5 from “valid producer, no consumer” to:

```text
fixed cyclic-order producer
  + selected-shell equalities
  + generic strict-cycle consumer
  -> exhaustive contradiction on the current 14-role (8,4,5) surface.
```

That is genuine proof-route progress.  It does not by itself close K-A-PAIR,
because production still needs:

1. the source-indexed named cap placements and selected-row incidences absent
   from the current parent interface, or an alternative strict-cycle consumer
   already instantiated there;
2. a generic strict-cycle theorem or checked finite certificate interface;
3. a proof-facing extraction/coverage theorem connecting the live parent to
   this fixed candidate surface; and
4. a cardinal/profile disposition outside this one 14-role `(8,4,5)` model.

The generic four-point inequalities and terminal three-row smoke theorem are
now production-built.  The next theorem target is the live named-role/row
producer isolated by `kalmanson-parent-order-adapter/`, or an alternate
Kalmanson antecedent already carried by the frontier.  In parallel, the five
`X` schemas give a bounded fixed-profile certificate target.  No further exact
nonlinear mining is justified on this same unconstrained object.

The later clean direct-schema-only CEGAR provides an explicit guard against
overgeneralizing the smoke theorem: it cuts 51 corrected shadows and finds
`SAT_DIRECT_SCHEMA_AVOIDING_CORRECTED_SHADOW` at iteration 52.  Therefore the
production five-point terminal is one useful bank cut, while this report's
generic ordinal closure (or an equivalent finite schema family) is the
load-bearing fixed-profile consumer.

## Artifacts and hashes

```text
audit_results.json
  ef1900709d5dc79d6e0f0d410f059fb111b1ebbe0034234013708a6850d1ab39
continuation_checkpoint.json
  fedd033e8eabea54e0134a0ac73eaf75855e83f3d071d4e4179ab4961b8362de
x_domain_schema_results.json
  0e3b1cceabd555c24a50b94207b20f5f512af88785ccd18e22d2ea3ee148fb0e
verification_results.json
  770a160f68531a4d63c59ffc72834f36c50a3c8c79502de02c886a8e90e07503
```

`verify_artifacts.py` is intentionally independent of the audit, prefix
filter, and continuation modules.  It rebuilds all 101 equality quotients and
certificates, then reconstructs every current candidate domain directly from
the pinned census data.  Its status is `PASS`.

## Reproduction

From the repository root:

```bash
UV_CACHE_DIR=/tmp/uv-cache-atail uv run python \
  scratch/atail-force/global-minimality-connectivity-audit/kalmanson-consumer/kalmanson_audit.py \
  --check --lp-scope terminal \
  --output scratch/atail-force/global-minimality-connectivity-audit/kalmanson-consumer/audit_results.json \
  --summary

UV_CACHE_DIR=/tmp/uv-cache-atail uv run python \
  scratch/atail-force/global-minimality-connectivity-audit/kalmanson-consumer/prefix_filter.py

UV_CACHE_DIR=/tmp/uv-cache-atail uv run python \
  scratch/atail-force/global-minimality-connectivity-audit/kalmanson-consumer/kalmanson_continuation.py \
  --max-rounds 1 --max-nodes 100000 --wall-seconds 60 --summary

UV_CACHE_DIR=/tmp/uv-cache-atail uv run python \
  scratch/atail-force/global-minimality-connectivity-audit/kalmanson-consumer/x_domain_schema_audit.py \
  --check --summary

UV_CACHE_DIR=/tmp/uv-cache-atail uv run python \
  scratch/atail-force/global-minimality-connectivity-audit/kalmanson-consumer/verify_artifacts.py
```

All commands pass.  No Lean file was added or changed, and no Lake build was
run for this scratch-only audit.
