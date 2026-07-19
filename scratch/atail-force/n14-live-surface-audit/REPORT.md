# N=14 live cap-surface audit for the whole-carrier bi-apex encoder

Date: 2026-07-17

Status: **SOURCE-VERIFIED INTERFACE AUDIT.  THE CORRECT PHYSICAL-APEX GAP
FOR THE MINIMAL `(5,6,6)` PROFILE IS FOUR BOUNDARY EDGES (THE REVERSE GAP IS
TEN), SO `--second-apex 4` IS THE CORRECT NORMALIZED ORBIT AND
`--second-apex 5` IS NOT.  THE CURRENT GENERIC WHOLE-CARRIER ENCODER IS A
SOUND OVERAPPROXIMATION OF THE CAP-STRENGTHENED LIVE ROBUST BRANCH, NOT A
FAITHFUL/EXACT ENCODING OF IT: BOTH NEW `L` FIELDS AND ALL CAP-BLOCK/LOCAL
CAP-ROW CONSEQUENCES ARE ABSENT.  NO SOLVER RUN WAS STARTED OR MODIFIED, NO
LEAN OR LAKE COMMAND WAS RUN, AND NO PRODUCTION OR PLAN FILE WAS EDITED.**

## Scope and non-interference

This audit answers only whether the existing generic whole-carrier
bi-apex/Kalmanson encoder matches the corrected live endpoint

```lean
L : FrontierLargeOppositeCapsBiApexRobustResidual B
```

at its least possible carrier cardinality.  The four main-thread runs writing
`/tmp/p97_n14_a*_s*_full_linear.json` were left untouched.  In particular,
this lane did not inspect a partial output, stop a process, change a bank, or
launch a competing run.

## Required theorem-bank preflight

Before considering any finite strengthening, I searched:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.md`;
- `certificates/erdos97_legacy_general_n_mining.md`;
- `certificates/erdos_general_theorem_p97_mining.md`; and
- the indexed Lean corpora with
  `nthdegree docs search --lean "whole carrier Kalmanson two apex robust deletion large opposite caps critical fiber"`.

The useful hits are the already-promoted whole-carrier ingredients and
`BiApexBlockerMultiplicity`; no banked theorem supplies the missing cap-block
encoding.  The sibling `u1TwoLargeCapObstruction` remains a named metric
consumer, not an adapter from the current anonymous whole-carrier rows.

No new finite theorem is proposed in this report.

## Exact minimal profile and cyclic gap

The cap-sum identity is

```text
|surplusCap| + |oppCap1| + |oppCap2| = |A| + 3.
```

At `|A| = 14`, the surplus condition and the two fields of `L` give

```text
5 <= |surplusCap|,
6 <= |oppCap1|,
6 <= |oppCap2|,
sum = 17.
```

Hence all inequalities are equalities: the profile is exactly `(5,6,6)`.
Writing `I_i` for the strict interior of cap `C_i`, the corresponding core
sizes are `(3,4,4)`.

Take `surplusIdx = 0` without loss of cyclic relabelling.  Then

```text
surplusCap = C1,
oppApex1   = v2,
oppApex2   = v3,
surplusApex = v1.
```

The boundary order is

```text
v1, I3, v2, I1, v3, I2.
```

Normalize `oppApex1 = v2` to boundary index `0` and orient through the
surplus cap.  Since `|I1| = 3`, the complete normalized order is

```text
index:       0   1 2 3   4   5 6 7 8   9   10 11 12 13
role:       v2    I1     v3      I2     v1       I3
```

Thus the distinguished data are

```text
oppApex1 = 0,
oppApex2 = 4,
surplusApex = 9,
surplusCap = {0,1,2,3,4},
oppCap1   = {4,5,6,7,8,9},
oppCap2   = {9,10,11,12,13,0}.
```

Reversing the cyclic orientation fixes index `0` and sends the second apex to
`14 - 4 = 10`.  Therefore the unordered dihedral gap orbit is represented by
`--second-apex 4`.

`--second-apex 5` is not another orientation of `(5,6,6)`.  Its shorter
closed boundary arc between the physical apices contains six points rather
than five.  It is a different positional profile.  A result from that run may
be useful as a generic gap experiment, but it cannot be labelled the minimal
cap-strengthened live profile.

## What the existing encoder does encode

The Python outer in
`generic-biapex-kalmanson-search/cegar.py` and its direct-CNF equivalent
encode exactly the generic surface extracted in
`WholeCarrierBiApexKalmansonSurface.lean`:

| Live consequence | Encoder representation | Status |
|---|---|---|
| Complete carrier cardinality | `n = 14` | Encoded exactly for this run |
| Cyclic boundary order | labels `0,...,13` and order-sensitive alternation/Kalmanson constraints | Encoded as an abstract cyclic metric order |
| One selected K4 row at every carrier center | exactly four non-self `m_center_point` memberships | Encoded |
| Two selected rows meet in at most two points | `row_intersection_at_most_2` | Encoded |
| A point pair occurs at at most two centers | `pair_center_count_at_most_2` | Encoded |
| A pair shared by two centers alternates with those centers | `cyclic_alternation` | Encoded |
| Minimality consequence for the chosen witness graph | every proper nonempty set has an outgoing selected edge | Encoded; this is strong connectivity, not full minimality |
| One actual critical blocker per source | one-hot `b_source_center` | Encoded |
| A source lies in its blocker row | `blocker -> member` | Encoded |
| Neither physical apex is a blocker value | blockers cannot equal `0` or `second_apex` | Encoded; this is the consequence of the two robustness facts actually retained by the generic extraction |
| Convex-quadrilateral metric consequences | positivity, all triangle inequalities, both strict Kalmanson inequalities, and all selected-row equalities | Encoded by the full-linear check |

Production/scratch already kernel-checks the extraction of these generic facts
from a `FrontierBiApexRobustResidual`.  Consequently, after the physical apex
gap is normalized correctly, every actual `L` instance maps into the generic
solver surface.  The generic solver is therefore a **sound overapproximation**:

- a verified full-linear SAT result is only an abstract survivor and says
  nothing against the live theorem;
- a genuinely certified UNSAT result would also exclude the stronger live
  profile, because it would exclude a superset of it; but
- a bounded CEGAR exhaustion or an unchecked bank/solver status is not such a
  certificate and does not close Lean.

The preloaded 454-schema JSON is itself labelled
`BOUNDED_DISCOVERY_BANK_REQUIRES_CORE_PROVENANCE`.  Existing lane reports say
the source cuts are exact and their ambient-gap redundancy is sound, but this
interface audit did not independently replay all 454 provenance chains.
Accordingly, an n=14 run using that bank remains theorem-discovery evidence
until its cuts and terminal certificate are checked by the established gates.

## What is missing from `L`

The corrected wrapper has two fields:

```lean
firstOppCap_card_ge_six  : 6 <= S.oppCap1.card
secondOppCap_card_ge_six : 6 <= S.oppCap2.card
```

Neither field is represented by a Boolean or metric constraint in the current
encoder.

Passing `n = 14` does not encode them.  Passing `second_apex = 4` only chooses
which two vertices are omitted from the blocker image.  The encoder has no
`S`, no `surplusApex`, no third distinguished index, and no cap membership
sets.  It therefore cannot infer that index `9` is the third Moser vertex or
that the three contiguous closed blocks have sizes `5,6,6`.

At this exact profile the first cap-aware strengthening should designate

```text
v2 = 0, v3 = 4, v1 = 9
C1 = {0,1,2,3,4}
C2 = {4,5,6,7,8,9}
C3 = {9,10,11,12,13,0}.
```

It should then add the already-proved cap-local selected-row bounds.  For
every represented selected row `K_c` and every cap `C` containing its center,

```text
|K_c intersect C| <= 2.
```

At a cap endpoint the production ordered-cap lemmas sharpen this to at most
one support point in that cap.  These are genuine MEC/cap-order consequences;
they are not the existing row-vs-row intersection bound and are not implied
merely by naming the apex gap.

## Other inherited live data erased by the generic surface

Although they are not fields of `L` itself, the indexed `F`, `R`, and `B`
carry additional facts that the current encoder also forgets:

- the named frontier sources `q,w`, their common positive first-apex radius,
  their off-surplus placement, and the retained frontier splits;
- the exact first- and second-apex common-deletion rows surviving deletion of
  `q,w`;
- the full deletion-survival witnesses at both physical apices.  The encoder
  retains only their consequence that the two apices are absent from the
  critical blocker image;
- `R.noM44`, which excludes every alternative same-carrier `(m,4,4)` surplus
  packet, not merely the displayed packet;
- exact full radius filters, Euclidean rank/PSD realizability, MEC disk
  containment, and shell-curvature information.

This explains the right interpretation of the active n=14 jobs: the a4 jobs
test the correct apex-gap orbit but still mine the older anonymous
whole-carrier relaxation.  They do **not** yet test the cap-strengthened live
decision object.

## Recommendation

Do not add a small cosmetic `--profile` flag to the existing generic encoder
and call the result faithful.  A real cap-aware successor needs, at minimum,
the third apex, the three exact contiguous cap blocks, and the local cap-row
bounds above.  If the intended consumer also uses the frontier/common-
deletion data, those named rows and sources must be added in the same decision
object rather than inferred from cardinalities.

## Main-thread run checkpoint

After this interface audit fixed the live orbit, the main thread stopped the
irrelevant `--second-apex 5` job and retained the three gap-four jobs long
enough to diagnose their startup cost.  All four payloads ended at about 303
seconds with

```text
status                         UNKNOWN
reason                         timeout
attempt_count                  0
full_linear_check_count        0
preloaded_schema_count       454
preloaded_embedding_cut_count 1,679,938
```

The jobs therefore never queried one structural outer model and never ran the
linear oracle.  Three processes were explicitly interrupted during cleanup;
all serialized payloads use the driver's fail-closed `UNKNOWN / timeout`
label.  This checkpoint contains **no SAT, UNSAT, coverage, or theorem
evidence**.  Its only operational conclusion is that eagerly expanding the
454-schema card-11 bank at card 14 is the wrong startup architecture for the
corrected live probe.

Any successor should first implement the cap-aware surface above and use a
lazy/canonical cut mechanism.  Repeating the same 1.68-million-cut preload
with more seeds would duplicate work before the random seed can influence a
solver decision.

No patch was made here because an unused local constraint layer would not
change the four active runs and could create a false impression that they
already cover `L` exactly.
