# Exact-four whole-carrier source audit and bounded CEGAR

Date: 2026-07-22

Status: **SOURCE-FAITHFUL FIXED-`n=11` FINITE PROJECTION IMPLEMENTED AND
INDEPENDENTLY REPLAYED; 20-ROUND BASE CEGAR AND TWO 2-ROUND MINIMALITY
OVERLAY AUDITS COMPLETED; BOTH CAP PROFILES REMAIN UNRESOLVED.  NO LEAN
`sorry` IS CLOSED BY THIS AUDIT.**

## Scope and conclusion

The earlier generic bi-apex outer was not a valid projection of
`OriginalUniqueFourResidual`: it omitted complete radius classes and imposed
global blocker-image conditions unavailable on the unique arm.  That outer is
not used here.

`exact_four_outer.py` is a new leaf-specific finite projection for the two
card-11 cap profiles `(5,4,5)` and `(5,5,4)`, selected by `--opp1-card 4` and
`--opp1-card 5`.  It retains the actual two physical apices, the cap partition,
the exact first-apex class, the fixed late critical system, the retained
frontier pair, the separate strict-cap pair, and the second-apex surviving
class.  Every SAT payload includes all true and false radius-equivalence atoms.

The fixed-`n=11` search has not reached either verified profile UNSAT or a
selected-row LRA-feasible terminal survivor.  The 20-round base run exhausted
its configured round budget while still producing new exact Kalmanson cores.
The two stronger minimality overlays also produced refinements in their
bounded two-round audits.  This is convergence evidence for theorem discovery,
not a uniform exact-four closure theorem.

## Encoded source projection

For every carrier center, the outer encodes a complete partition of the other
ten labels into positive-radius classes.  Boolean atoms record both

```text
dist(center,u) = dist(center,v)
dist(center,u) != dist(center,v).
```

Equivalence transitivity is enforced directly.  The selected row at a center
is an exactly-four subset of one complete class.  The remaining base clauses
encode:

- global K4 through one selected four-row at every center;
- complete-class two-circle intersection and target-pair center bounds;
- the convex cyclic-alternation consequence for shared chords;
- strong connectivity of every represented selected-row digraph;
- one fixed-point-free blocker for every source;
- the complete exact-four blocker class through the source;
- `no_qfree`: after deleting the source, every blocker-center class has at
  most three remaining points;
- selected-row completion at every blocker center;
- the late first-apex fiber equal to the distinguished exact four-class;
- uniqueness of the first-apex K4 class;
- endpoint one-hit constraints against the surplus and second opposite caps;
- separate strict-cap and retained frontier pairs, with overlap and coincidence
  between the two unordered pairs allowed;
- a separate second-apex class-row surviving deletion of the retained pair;
- full-partition bisector localization for the strict pair;
- the kernel-checked planar bank, the signed source-proved U5 bank, and the
  Kalmanson order-schema bank.

The model does **not** encode planar coordinates, nonlinear Euclidean
realizability of every equality/disequality atom, MEC membership, nonobtuse
support geometry, the alternative-triangle content of `noM44`, or literal
quantification over every smaller carrier required by `D.Minimal`.  A SAT
payload is therefore a model of the documented finite projection only.

## Independent replay

`verify_exact_four_outer.py` reconstructs and checks, independently of the CNF
builder:

- the cap partition and both role pairs;
- exhaustiveness and consistency of all true/false equality atoms;
- every complete radius partition;
- every selected row and every full-class geometric constraint;
- strong connectivity;
- the unique first-apex class and endpoint one-hit bounds;
- the fixed blocker map, exact critical supports, `no_qfree`, row completion,
  and the late fiber;
- the separate second-apex deletion row;
- every transported planar, Kalmanson, and signed-U5 schema cut; and
- when enabled, the exact minimal blocking-deletion overlay witness.

The verifier checks the CNF and bank digests before semantic replay.  Every SAT
cell used by the CEGAR driver had status `VERIFIED_SAT_PROJECTION` before it was
passed to a matcher or metric oracle.

## Kalmanson bank status

The current `kalmanson_schema_bank.json` contains 36 normalized,
reflection-deduplicated order schemas:

- 10 `KERNEL_CHECKED` endpoint-compressed schemas with named Lean consumers,
  imported from
  `unique4-kalmanson-core-port/kalmanson_schema_bank.proposed.json`;
- 26 `EXACT_FARKAS_VERIFIED_PENDING_PORT` schemas not subsumed by those ten.

Every pending entry names a fixed-row full-LRA core and an independent exact
rational Farkas verification.  The bank loader transports only
order-preserving embeddings and their reflections.  A pending schema is not
called kernel-checked until it has a Lean consumer.

## Signed-U5 bank status

The current `u5_signed_schema_bank.json` contains seven catalog schemas with
indices

```text
2, 6, 12, 31, 42, 44, 50.
```

They come from the 93-schema source-proved/reachable selected-row catalog.
Positive and negative membership atoms are transported literally over all
injective role maps; negative row membership is never upgraded to a false
complete-filter atom.

## Bounded CEGAR results

### Base projection

`cegar/manifest.json` records 20 rounds over both cap profiles in parallel.
The run ended

```text
ROUND_CAP_REACHED_UNRESOLVED.
```

Within those rounds:

- 17 rounds reached the exact selected-row LRA oracle;
- 33 new non-subsumed exact-Farkas Kalmanson cuts were installed;
- one additional LRA core was already subsumed;
- U5 catalog indices `42`, `31`, and `12` were discovered and installed; and
- no solver or replay returned `UNKNOWN` or failed a digest/semantic check.

The repeated new cores show that literal fixed-table CEGAR had not converged
within this budget.  The later ten-schema kernel merge replaced or subsumed a
substantial portion of the accumulated literal bank.

### Protected-set minimality overlay

The separately toggleable `--strict-cap-minimality-overlay` encodes only the
common prefix of the kernel-checked theorem

```lean
exists_strictCap_collision_or_singletonCore_or_packedCore
```

at a fresh center outside the exact class union the Moser triangle:

- a nonempty `V` is contained in that protected set;
- every radius class after deleting `V` has at most three survivors; and
- returning each `s ∈ V` restores a four-point radius class.

It does not guess the theorem's collision/singleton/packed classification.
`cegar-minimality/manifest.json` records two replay-valid rounds.  Both
profiles were SAT in the finite projection and LRA-UNSAT at the selected-row
metric layer in both rounds, producing four verified pending Kalmanson cuts.
The run was intentionally stopped for the sharper pair-only overlay.

### Strict-pair minimality overlay

The separately toggleable `--pair-minimality-overlay` is the direct
source-valid application of

```lean
ATailGlobalMinimalDeletion.exists_global_cardMinimal_blocking_subdeletion
```

to exactly `{R.interior_q, R.interior_w}`.  It uses `R.minimal`, carrier
membership and distinctness of the strict pair, and the existence of a
remaining carrier point.  It encodes:

- a fresh center outside the pair;
- a nonempty `V` contained in the pair, hence `|V| = 1` or `|V| = 2`;
- no K4 class after deleting `V`; and
- K4 restoration after returning every member of `V`.

`cegar-pair-minimality/manifest.json` records the bounded two-round audit:

1. both profiles were replay-valid SAT and exposed source-proved U5 catalog
   schema `2`, consumed by
   `qcritical_exact_selected_qcritical_mid_right_exact_left_incompatibility`;
2. after installing schema `2`, both profiles were again replay-valid SAT,
   then exact selected-row LRA-UNSAT, and supplied two new independently
   verified Farkas cuts.

The audit stops after installing those final two cuts.  Therefore the current
36-schema Kalmanson bank has **not** yet been rerun to a new terminal cell.

## Automation and failure policy

`run_exact_four_cegar.py` automates both profiles in parallel.  Per round it:

1. merges the proposed kernel bank and removes pending schemas subsumed by it;
2. builds and solves both exact-four CNFs;
3. independently replays every SAT model;
4. invokes the complete 93-schema U5 matcher fail-closed;
5. runs the exact rational selected-row Kalmanson LRA oracle if no new U5
   theorem matches;
6. independently replays every LRA refutation, verifies deletion minimality,
   and constructs an exact rational Farkas certificate;
7. normalizes/reflection-deduplicates each new order cut; and
8. hashes results before deleting superseded CNFs and solver logs.

The driver stops rather than upgrading `UNKNOWN`, an unproved SAT payload, an
unverified Farkas core, a repeated/subsumed oracle core, or an unproved CNF
UNSAT result.  A selected-row LRA-SAT result would also be labeled only as a
rational Kalmanson metric for the selected rows, not as a realization of the
full equality partition or the Lean residual.

## What would close the Lean leaf

The fixed-card search can continue to discover consumers, but a production
closure still needs a uniform source theorem.  The most useful current target
is an occurrence/coverage theorem from the strict-pair minimal blocking
subdeletion to one of:

- a kernel-checked signed-U5 schema (schema `2` is the first observed one);
- a kernel-checked endpoint-compressed Kalmanson schema;
- an existing outside-pair/same-cap terminal; or
- a complete alternative `IsM44` packet.

Such a theorem must quantify over the actual carrier and selected rows and
must retain the full source pair/minimality packet.  More literal rounds alone
do not supply that uniform occurrence statement.

## Epistemic status

- **KERNEL-CHECKED INPUT:** the ten ported Kalmanson consumers and the two
  minimal-deletion theorems named above.
- **SOURCE-PROVED/REACHABLE INPUT:** the seven installed signed-U5 consumers.
- **EXACT FINITE REPLAY:** every used SAT projection and every schema match.
- **EXACT RATIONAL VERIFICATION:** each banked pending LRA core and Farkas
  certificate.
- **EMPIRICAL, FIXED `n=11`:** the round outcomes for the two cap profiles.
- **NOT CLAIMED:** Euclidean/MEC realization, arbitrary-cardinality coverage,
  the exact-four residual theorem, or closure of a production `sorry`.
