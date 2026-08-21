# New descent-prose material vs the exact-12 arm encoding (2026-08-20)

Question asked: before running another CEGAR wave, does the new material in
`docs/erdos-97-descent-prose-proof-atomic.md` supply constraints we could add
to the exact-12 Rigid221 next-row arm encoding?

Answer, in one line: it supplies several, every directly-encodable one is
already satisfied by the current survivor, and the same new material states
twice that an incidence-only SAT certificate cannot close this leaf.

Status: EMPIRICAL for every "does it bite" verdict — each is a test against
three authenticated survivor cubes (v24, v25, v26), not a theorem about the
formula.  Source: the uncommitted working copy of the descent prose proof at
the time of the audit (1,042 inserted lines), sections `16.5.A5` (lines
1809-2465) and `16.5.38` CD0-CD13 (lines 3475-3737).

## The lane is exactly the object A5 analyses

This was verified, not assumed, and it is what makes the rest of the audit
meaningful.

| A5 object | Encoding fact | Where |
|---|---|---|
| theorem cap profile `(5,4,6)` | job `candidate_profile` is `[5,6,4]`, and "Python profile (5,6,4) represents theorem profile (5,4,6)" | `census/card_head/source_faithful_candidate_surface.py:26` |
| named points | `O=1, U=6, C=7, XV=8, XU=9, Q=10, W=11` | `census/card_head/exact12_next_row_valuation.py:50-57` |
| `t`, `v` | `joint_deletion=0`, `v=3` (placement 1) | live `arm_suffix.json` cell record |
| the six arms of A5.8 | `ARM_SPEC` has exactly `u_q, u_w, xv_q, xv_w, xu_q, xu_w`; the live cell is `u_q` | `exact12_next_row_valuation.py:59-66` |

So `C = {u,xu,t,v,xv} = {6,9,0,3,8}` and `BO = {0,3,6,8}`.  Two A5 identities
then hold exactly, in all three waves:

- **A5.1** `BO = supp(O)`: `supp(1) = {0,3,6,8}` — an exact match.
- **A5.3** `Kxv ∩ C = {u,xv}`: `supp(7) ∩ C = {6,8}` — an exact match.

The live cell is therefore one of the six A5.8 arms, and A5.17's twenty-four
cells are those six arms crossed with the four surviving role families.

This also explains part of the frozen anchor star recorded in
`docs/exact12-v26-survivor-structural-analysis-2026-08-20.md`: `supp(O=1)` is
`BO`, which the theorem pins.  That row is not a free solver choice.

## Candidate constraints, and whether each bites

Every row below was tested against the v24, v25 and v26 survivor cubes.

| # | Source | Claim | Status in prose | Encodable? | Bites? |
|---|---|---|---|---|---|
| 1 | A5.5 | `\|Kc ∩ {u,xu,xv}\| ≤ 1` | [PROVED IN THE SOURCE] | yes — cardinality bound on one row | **no** |
| 2 | A5.9 | `d ≠ xv` | [DERIVED AND PROVED IN PROSE] | yes — unit clause | **no** |
| 3 | A5.12 | `Bxu` family impossible: not (`u ∈ Kc` and `d = xu`) | [DERIVED AND PROVED IN PROSE] | yes — 2-literal clause | **no** |
| 4 | A5.7a | row-avoiding source `\|Z\| ≥ 1`, `≥ 2` if `Kc` meets `{u,xv}` | [NEW DERIVED LEMMA; PROVED IN PROSE] | yes — counting | **no** |
| 5 | A5.16 | three-row union `\|B\| ≤ 10 < 12`; proper-subset row escape | [DERIVED AND PROVED IN PROSE] | partly | **no** |
| 6 | CD6/CD7 | forbid the 8-incidence saturation; 7-way missing-incidence disjunction | [PROVED] / [DERIVED AND PROVED IN PROSE] | yes — needs no blocker map | **no** |
| 7 | A5.2/A5.4 | forced cap order `u < c < xv < xu` | [PROVED IN THE SOURCE] | order-level, not row-level | untested |
| 8 | A5.6 | four-source fan `\|T2\| = 4`, blocker map non-constant on it | [PROVED, EXACT CARDINALITY] | needs the blocker map | not in vocabulary |

Detail on the ones that matter.

**A5.5 does not bite.** `Kc` is the row at `d = β(c)`, and `d` is admissible
only when `c=7 ∈ supp(d)` and `xu=9 ∉ supp(d)`.  The admissible `d` are
`{10,5,9}` at v24, `{11,5,9}` at v25 and `{10,11,9}` at v26, and every one of
them already has `|supp(d) ∩ {6,8,9}| ≤ 1`.  The centers that would violate
the bound are `{1,7,8}` in all three waves, and none of them is ever an
admissible `d`.  Adding the clause removes nothing.

**A5.12 does not bite either**, for a structural reason worth recording: at
`d = xu = 9` the survivor has `u = 6 ∉ supp(9)`, so that branch is family `U`,
not `Bxu`.  The family A5.12 closes is one the survivor never occupies.

**A5.7a and A5.16 do not bite.**  The three-row union `B = BO ∪ Kxv ∪ Kc` has
7 to 9 members against the bound of 10, and `|Z|` is 2 to 4 against a required
1 or 2.  Separately, no proper nonempty subset of the 12 centers is
support-closed in any of the three waves, so the weakened row-escape form is
satisfied outright.

**CD7 does not bite, and the near-misses are informative.**  No assignment of
`(O,c1,c2,a)` in any of the three cubes realizes the full CD6.1 eight-incidence
pattern; the maximum attained is 7 of 8.  Of the 8 near-saturations at v26,
7 are evaded by genuinely satisfying a CD7 tag (T1, T5, T6) and only 1 by
falsifying CD7's own hypothesis `a ∈ row(O)`.  So CD7 is satisfied on its
merits, not dodged.  Two near-misses recur unchanged in all three waves:
`(O,c1,c2,a) = (0,3,9,7)` and `(1,0,2,3)` — both inside the frozen anchor star.

## What the new material says about this route

Two statements bear directly on whether another bank is the right next move.

> "An incidence-only SAT certificate is insufficient.  The replay object must
> retain the cap order, exact source-to-row provenance, and the metric
> equalities needed by the chosen core constructor."
> — A5.17, line 2442

> "The current repository supplies the faithful-pattern constructor and the
> conditional shell-metric consumer, but it does not yet supply the exhaustive
> twenty-four-cell coverage theorem.  The off-spine exact-twelve bank chain is
> evidence about local predicates, not a substitute for that coverage proof."
> — A5.18, line 2460

> "A generic positive-incidence theorem would be false without additional
> global hypotheses.  Exact rows and common-deletion packets can occur in
> realizable local configurations.  The remaining proof must consume cap order,
> exact cardinality, retained source provenance, or another global invariant."
> — CD8, line 3672

CD12 marks the canonical combinatorial layer closed and the residue geometric:
of A5's four surviving role families, `Boff` is an off-class bisector
localization problem and `Xt`/`Xv` are circle-isosceles chains — metric
targets.  Only `U` (an exact-eleven five-row normal form) reads combinatorial.

This is consistent with what the installed banks are.  All 22 encode positive
row-membership forcing a convex-five orientation or a three-triad collision;
none encodes any distance, bisector or circle predicate.  The base surface
excludes `probe_physical_apex_membership`, `probe_physical_circle_C2`,
`probe_physical_pair_at_most_one` and `probe_physical_blocker_injectivity` by
design, to stay source-faithful
(`census/card_head/source_faithful_candidate_surface.py:44-50`).

## Reading

The new prose is genuinely valuable, but not as a source of clauses.  What it
delivers is structure: it closes one of five role families outright (A5.12),
shows the five-incidence hypothesis the tetrahedron consumer carries is
redundant (A5.10), fixes the coverage obligation at twenty-four cells rather
than thirty (A5.17), and confirms the live arm is one of its six.  What it
does not deliver is a local row predicate the current survivor violates.  Every
such predicate tested is already satisfied — which is itself evidence that the
22-bank chain has pushed the model into the region where A5's local bounds
hold, and that the remaining obstruction is not local.

A 23rd bank of the same kind is therefore harder to justify after this audit
than before it, on two independent grounds: the label-set split says another
single-set five-point family targets vacated ground, and A5.17/A5.18/CD8 say
the whole incidence-only family cannot close the leaf regardless of shape.

Not established here: that no incidence constraint whatever could bite — only
that the eight tested do not.  A5.2/A5.4's forced cap order was not tested
against the 48-order deck and is the one untested candidate that could still
prune; it is an order-level constraint, so it would act on the deck rather than
on the rows.  {{NEEDS_RESEARCH}}

## Reproduction

Scripts used for the verdicts, all read-only over the three authenticated
`survivor.json` cubes, are in the session scratchpad and are not durable
artifacts; the numbers above are the whole result.  The label mapping and the
two A5 identities can be re-derived from the cited source lines alone.
