# Exact-four U5 theorem-bank ingress audit

Date: 2026-07-22

Status: **THE THREE NAMED ROWS DO NOT FORCE ANY OF THE 93 SIGNED U5
SCHEMAS.  THE UNIQUE THREE-CENTER BANK CONSUMER NEEDS FIVE ADDITIONAL
POSITIVE INCIDENCES.  WHOLE-CARRIER SAT TABLES DO EXPOSE U5 OCCURRENCES,
WHICH ARE VALID EXTENSION-STABLE CEGAR CUTS BUT NOT LIVE COVERAGE.**

## Scope

This lane starts from

```lean
R : OriginalUniqueFourResidual F
```

and inspects exactly the proposed local ingress:

- the complete exact-four row at `P := S.oppApex1`;
- the two distinct strict-cap points `q := R.interior_q` and
  `w := R.interior_w`; and
- arbitrary selected four-rows `Kq` and `Kw` supplied by global K4 at `q`
  and `w`.

No production Lean, closure document, or other scratch lane is edited here.
No fixed row table is presented as a model of `OriginalUniqueFourResidual`.

## Required bank preflight

The audit checked:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- the fail-closed source translation in
  `general-n-u5-schema-coverage/schema_catalog.json`; and
- focused `nthdegree docs search --lean` results for exact-four classes,
  strict-cap centers, q-deleted/q-critical rows, and the tetrahedron
  obstruction.

The catalog contains all 96 source-proved, source-reachable, novel
ambient-data U5 contradiction consumers, normalized to 93 signed selected-row
schemas.  A positive atom `(c,x)` means `x` belongs to the selected row at
`c`; a negative atom means exact selected-row nonmembership.  All role maps
are injective.

## What the three rows force

Write

```text
C = SelectedClass D.A P radius = {q,w,u,v}.
```

The exact row at `P` has support `C`.  Since `P`, `q`, and `w` are distinct,
the two-circle bound gives

```text
card (Kq.support inter C) <= 2,
card (Kw.support inter C) <= 2.
```

Because `q` and `w` are strict points of the same physical cap, cap-row
monotonicity also gives at most two same-cap support points in each of `Kq`
and `Kw`.  Consequently each arbitrary row has at least two points outside
`C` and at least two points outside that cap.  These are useful positive
escape facts, but they name no cross-row incidence.

The exact source fields force neither `P in Kq.support` nor
`P in Kw.support`, neither cross hit `w in Kq.support` nor
`q in Kw.support`, and no common auxiliary member of the two rows.

## Exhaustive 96/93 structural result

`audit_unique4_ingress.py` independently checks the catalog digest and all 93
normalized schemas.  The signed row-center histogram is:

| distinct row centers required | schemas |
| ---: | ---: |
| 3 | 1 |
| 4 | 29 |
| 5 | 40 |
| 6 | 18 |
| 7 | 5 |

Thus 92 schemas cannot be instantiated from only the three supplied rows.
The sole three-center schema is

```lean
Problem97.U5QDeletedK4Class
  .three_exact_classes_tetrahedron_incompatibility
```

whose selected-row metric form already exists as the source-clean,
extension-stable theorem

```lean
Problem97.ATailTetrahedronBankAdapterScratch
  .false_of_three_selected_classes_tetrahedron
```

in `scratch/atail-force/tetrahedron-bank-adapter/`.

The audit also checks a deliberately abstract three-row regression:

```text
P  -> {q,w,u,v}
q  -> {a0,a1,a2,a3}
w  -> {b0,b1,b2,b3},
```

with the two fresh supports disjoint from each other and from `C`.  It obeys
the exact row cardinalities, all pairwise row-intersection upper bounds, and
the two strict-center cap-intersection upper bounds, but embeds none of the 93
schemas.  This is **not** a Euclidean or minimal countermodel.  It proves only
that the listed local cardinality/upper-bound consequences do not entail a
bank occurrence.

## Closest extension-stable consumer

The tetrahedron consumer is uniquely closest at the three-row level.  Choose
`u in C \ {q,w}` and map its roles by

```text
x = q,  y = w,  a = u,  b = P.
```

The exact `P`-row supplies

```text
q,w,u in row(P).
```

The exact missing positive packet is

```text
w,u   in row(q),
q,u,P in row(w).
```

These are five directed incidences.  No negative incidence is needed by the
local selected-class adapter.  If this packet existed, the four points
`P,q,w,u` would be pairwise equidistant and the existing planar theorem would
give `False` immediately.

This target is compatible with both local upper bounds: each strict-center
row uses exactly two points of `C`, and it can use at most two points of the
physical cap.  Therefore cap monotonicity and the two-circle theorem do not
produce the missing packet or refute it earlier.

## Can global K4/minimality produce the five hits?

Not by the direct deletion argument.  Global K4 supplies some row at `q` and
some row at `w`, but gives no control over their named members.  When any
member of `C` is deleted, `R.every_class_member_blocks` already supplies the
minimality failure at `P`; minimality does not force a second failure or a
special row at `q` or `w`.

Selected-row strong connectivity can force an eventual return edge after
rows are chosen at the whole carrier, but it does not force these five
particular hits.  A source-valid occurrence theorem would therefore have to
use a genuinely global extra lever: complete radius partitions, the fixed
critical-shell provenance, MEC/cap order plus `noM44`, or a checked
whole-carrier coverage theorem.  Stating the five-hit packet itself as a new
producer would simply move the open contradiction into an overstrong local
claim.

## Whole-carrier CEGAR consequence

The negative three-row result does not make the U5 bank irrelevant.  Once a
selected row is retained at every carrier center, source-faithful fixed
`n = 11` projections have exposed exact signed occurrences of catalog schemas
6, 44, and 50.  Each occurrence was replayed with its normalized injective
role map and exact positive and negative atoms; negative atoms were checked as
selected-row nonmembership, not as complete-class absence.  The outer owner
has installed all three as transported cuts in

```text
scratch/atail-force/unique-arm-whole-carrier-source-audit/
  u5_signed_schema_bank.json.
```

These cuts are extension-stable theorem consequences and legitimately kill
the matched row tables.  They do not prove that every exact-four residual
contains a bank schema, and they do not close the live Lean leaf.

`audit_sat_profiles.py` independently replays all 93 schemas against the
current authoritative SAT profiles, checks the stored semantic-replay hash,
and records exact raw theorem-role maps for every occurrence.  Its output is
`current_profile_audit.json`; because the outer is an active CEGAR loop, that
file is authoritative only for the result hashes stored inside it.

## Next theorem-facing target

There is no justified local U5 producer from the three named rows.  The valid
route is whole-carrier occurrence coverage:

```text
every source-faithful exact-four residual row system
contains an injective occurrence of one checked signed U5/Kalmanson/planar
schema, or yields a separately named MEC/noM44 residual.
```

A bounded SAT run is useful for discovering and validating the schemas in
that disjunction.  Live closure still requires a uniform Lean occurrence
theorem, or a proved cardinality reduction plus checked finite coverage for
every remaining cardinality.

## Reproduction

From the repository root:

```bash
UV_CACHE_DIR=/private/tmp/p97-uv-cache uv run --no-project python \
  scratch/atail-force/unique4-u5-bank-ingress/audit_unique4_ingress.py \
  --output \
  scratch/atail-force/unique4-u5-bank-ingress/audit_result.json

UV_CACHE_DIR=/private/tmp/p97-uv-cache uv run --no-project python \
  scratch/atail-force/unique4-u5-bank-ingress/audit_sat_profiles.py \
  --catalog \
  scratch/atail-force/general-n-u5-schema-coverage/schema_catalog.json \
  --profile \
  scratch/atail-force/unique-arm-whole-carrier-source-audit/n11_opp1_4.result.json \
  --replay \
  scratch/atail-force/unique-arm-whole-carrier-source-audit/n11_opp1_4.replay.json \
  --profile \
  scratch/atail-force/unique-arm-whole-carrier-source-audit/n11_opp1_5.result.json \
  --replay \
  scratch/atail-force/unique-arm-whole-carrier-source-audit/n11_opp1_5.replay.json \
  --output \
  scratch/atail-force/unique4-u5-bank-ingress/current_profile_audit.json
```

## Epistemic status

- **SOURCE-CATALOG VERIFIED:** 96 source-proved/reachable consumers and 93
  fail-closed normalized signed schemas.
- **EXHAUSTIVE FOR THE THREE-ROW INTERFACE:** no schema is forced by the exact
  row plus arbitrary row cardinalities and the stated intersection bounds.
- **EXACT FINITE REPLAY:** fixed-profile bank matches are tied to the stored
  result and replay hashes.
- **PROVEN / EXISTING KERNEL-CHECKED CONSUMER:** the selected-row tetrahedron
  contradiction.
- **OPEN:** any uniform whole-carrier occurrence theorem and the live
  `OriginalUniqueFourResidual -> False` leaf.
