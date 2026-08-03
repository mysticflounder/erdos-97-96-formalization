# Other-at-common v9 post-wave universal-candidate audit

Date: 2026-08-01

## Verdict

The completed other-at-common v9 wave produces **no credible new
general-cardinality theorem**.  Its exact fresh output consists of 18,418
encoded theorem-cut keys from 19 already registered local families and 346
structural keys, all `raw_btw_sep`.  Two additional registered families matched
642 times but were correctly suppressed by exact subsumption.  No family was
newly activated relative to the source-at-common v9 input, and the global
14-role family matched zero times in both arms.

This is fixed-witness recurrence and matcher/deduplication evidence.  It is not
a finite-cover theorem and does not supply the missing arbitrary-packet
producer into an existing theorem-bank consumer.

## Scope, terminal status, and trust

Compared artifacts:

- source input: `source-at-common-full-metric-bank-v9-global-kalmanson-resume-v9-1800s/result.json`;
- other wave: `other-at-common-full-metric-bank-v9-global-kalmanson-import-source-v9-1800s/result.json`;
- prior audit: `V9_WAVE_UNIVERSAL_CANDIDATES.md`.

The other artifact terminates `UNKNOWN_FAIL_CLOSED` after 1,800,028 ms.  It is
an `n = 17`, closed-cap-profile `(6,8,6)`, other-at-common Boolean
incidence/order run: 871 SAT cut-producing candidates, followed by a canceled
`unknown` check at iteration 871.  It supplies no checked UNSAT certificate,
semantically replayed SAT witness, Euclidean/QF_NRA realizability,
MEC/nonobtuse inequalities, full `CounterexampleData`/`noM44` geometry,
universal-`n` claim, or new Lean kernel/axiom verification.  This audit ran no
Lean/Lake command, CEGAR process, solver, or kernel gate.

## Exact normalization and fresh counts

The source artifact contains 228,898 theorem keys and 9,082 structural keys.
Universal-cut import normalizes that theorem set to 222,703 by suppressing
6,195 stronger selected-row keys already subsumed by raw-equality keys:

| suppressed on import | count |
|---|---:|
| `six_sparse_two_selected_rows` | 3,973 |
| `five_kalmanson_three_selected_rows` | 2,222 |

The other wave then matched 19,060 theorem instances.  Exact current
canonicalization suppressed another 642 selected-row matches (488 six-point,
154 five-point) and encoded 18,418 fresh theorem keys.  It also encoded 346
fresh structural keys.  Therefore the final sets are exactly:

- theorem: `228,898 - 6,195 + 18,418 = 241,121`;
- structural: `9,082 + 346 = 9,428`.

Thus the apparent final theorem-count increase over the source file is 12,223,
not the fresh-key count: the 6,195-key difference is import-time normalization,
not evidence that the other wave rediscovered or retired those cuts.
`retired_subsumed_theorem_cut_count` is accordingly zero.

## Fresh family clusters

| symmetry/consumer cluster | fresh encoded keys | classification |
|---|---:|---|
| cyclic five-point `first` + `reversed_second` | 2,933 + 2,933 | one existing cyclic schema under rotation |
| cyclic five-point `second` | 2,753 | existing bank instances |
| `convex_five_point_core` | 2,010 | existing bank instances |
| four Kalmanson orderings | 3,362 | existing bank instances |
| five-point row/shell/circle families | 2,089 | existing bank instances |
| six-point raw row/triangle/interleaving families | 2,177 | existing bank instances |
| four-point endpoint/middle-center families | 161 | existing bank instances |
| selected-row matches | 642 matched, 0 encoded | exactly subsumed by existing raw families |
| `global_kalmanson_14role_16eq` | 0 | existing ambient-`n` theorem, inactive here |
| `raw_btw_sep` structural family | 346 | existing proved structural family |

The table's encoded theorem rows sum to 18,418.  The four Kalmanson counts are
1,270, 947, 758, and 387.  The five-point counts are 607, 578, 582, and 322.
The six-point counts are 740, 703, 612, 80, and 42.  The four-point counts are
86 and 75.

No family activation changed: source and other waves each have nonzero matches
for the same 21 matcher families.  In the other wave, 19 contribute encoded
keys, the two selected-row families contribute only suppressed matches, and
the registered global family remains at zero.

## Exact rotated-first redundancy

For points `(a,b,c,d,e)`, the encoder's `reversed_second` antecedent is exactly
the `first` antecedent on the one-step rotation `(e,a,b,c,d)`; the cyclic guard
is rotation-invariant.  Serialized-set comparison confirms this for every key:

- all final keys: 41,640 `first`, 41,640 `reversed_second`, with 41,640/41,640
  mapped by that rotation;
- fresh keys: 2,933 and 2,933, with 2,933/2,933 mapped and zero missing in either
  direction;
- the fresh ordered-key intersection is only 77, while the unordered-support
  sets coincide on all 2,223 supports.

Consequently the 5,866 family-labelled fresh keys contain at most 2,933
distinct formulas modulo this proved rotation.  This is a cross-family
canonicalization opportunity, not a new consumer.

## Universal-candidate classification

There is no genuinely plausible new statement to promote:

1. **New general-cardinality theorem:** none.  The run fixes all 17 roles and
   one cap profile and never establishes coverage of arbitrary live packets.
2. **Existing-family/bank instances:** all 18,418 encoded theorem keys and all
   346 structural keys.  The first/reversed-second portion is additionally
   redundant under a proved cyclic rotation.
3. **Fixed-witness evidence:** the recurring mixture of those local families
   across 871 candidates.  Recurrence does not prove an existential local-cover
   theorem or connect the Boolean models to the live Euclidean packet.

One required global agentic corpus query tested the strongest remaining
interpretation -- that an arbitrary other-at-common `(6,8,6)` crossed-arm
packet must contain a registered five- or six-point obstruction -- and surfaced
no result.  One miss was treated as sufficient; no narrower candidate warranted
a separate query.

## Required theorem-bank registry audit

- `docs/general-n-certificate-bank-mining-2026-07-09.md` confirms reusable U5
  and U1 consumers but no theorem classifying an arbitrary live packet into
  those families; the producer boundary remains open.
- `certificates/p97_rvol_general_n_mining.{md,json}` records 2,148 candidates
  and 500 novel contradiction consumers.  A targeted signature review found
  33 order/selected-class-related candidates but zero concluding `False`, and
  no matching multi-row cyclic obstruction, global 14-role replacement, or
  live-packet classifier.
- `certificates/erdos97_legacy_general_n_mining.{md,json}` has 285 bounded-local
  candidates, 39 contradictions, and zero ambient-`n` candidates; the target
  signature has zero hits.
- `certificates/erdos_general_theorem_p97_mining.{md,json}` has 297
  bounded-local candidates, 38 contradictions, and zero ambient-`n`
  candidates; the target signature again has zero hits.

The genuine global 14-role theorem already exists in
`KalmansonSixteenEqualitySchema.lean` and covers both dihedral orientations,
but it had zero total matches here.  The relevant five-point cyclic consumers
already exist in `FivePointEuclideanObstruction.lean`; in particular,
`reversed_second` does not define a distinct mathematical obstruction from a
rotated `first` instance.

## Recommendation

Do not promote a new Lean obligation or universal theorem from this wave.
Retain the existing bank consumers and live producer frontier.  If encoder
maintenance is in scope later, canonicalize `reversed_second` against rotated
`first` so identical formulas are not retained under two family labels; keep
the current exact selected-row/raw-equality subsumption unchanged.
