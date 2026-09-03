# B1 normal-form arbitrary-cardinality order wave

Date: 2026-08-31

## Objective

Classify the four exact physical-trace branches forced by
`B1PhysicalClassFiveSixNormalForm` using only arbitrary-cardinality boundary
roles and source-derived cap/order constraints.  The query is whether every
forced two-point live slice can remain alternating with respect to the
physical apex and its live-row blocker.

An alternating survivor shows that the current order interface cannot produce
`FreshThirdSharedPairNonalternationPacket`.  An unsatisfiable result must be
minimized to source-proved order atoms before it can support the missing
producer.  Fixed-cardinality universes, exact-12 order tables, model-derived
row facts, and any downstream B1 terminal are excluded.

## Source boundary

Finite counting gives four trace shapes:

```text
card 5: slice sizes (1,2), (2,1), or (2,2) with one shared mate
card 6: slice sizes (2,2), disjoint
```

At least one live row therefore shares two distinct points with the physical
radius class.  The existing cardinality-free consumer is
`false_of_freshThirdSharedPairNonalternationPacket`.  All of its data except
the final same-arc order condition is routine from the current B1 sources.

## Wave 1

Complete.  The probe enumerated arbitrary relative cyclic orders of all named
roles, with all roles injective except the forced shared-point alias in the
card-five overlap branch.  Both orientations of the physical-apex anchor were
checked.

| branch | relative orders | alternating assignments, each orientation | verdict |
| --- | ---: | ---: | --- |
| card 5, slice sizes `(1,2)` | 362,880 | 69,120 | SAT / SAT |
| card 5, slice sizes `(2,1)` | 362,880 | 69,120 | SAT / SAT |
| card 5, slice sizes `(2,2)`, one shared mate | 362,880 | 20,744 | SAT / SAT |
| card 6, slice sizes `(2,2)`, disjoint | 3,628,800 | 183,744 | SAT / SAT |

All eight emitted witnesses replay.  Unnamed boundary-point insertions preserve
the named-role ranks, and adding the target same-arc condition to the first
alternating shared pair leaves zero assignments in every branch and
orientation.  This last check is a semantic sanity test, not a proof of metric
realizability.

The result is therefore negative for the current interface: finite counting,
cap blocks, and the source-proved alternating row behavior do not force the
same-arc field.  The next producer must retain an additional upstream
extremal/boundary-order choice; another fixed-label clause wave cannot supply
it.

Wave 1 did not include the deleted pair's common blocker.  The source proves
that `d1,d2` form a third shared pair, with carrier bisector fiber
`{physical apex, common blocker}`.  Wave 2 below adds that omitted pair and
the exact named Euclidean geometry.  Its SAT witness preserves the Wave 1
conclusion under the stronger constraint set.

The authenticated result is
`scratch/runs/b1-normalform-order-20260831/wave-1/artifacts/b1-normalform-order-wave1-result.json`
with SHA-256
`76ec642635bbb63e247433bcbbfeb635314cb40882d6ec229ee1c78e334f7e3b`.
The executed probe SHA-256 is
`252c5bfa4ef7bff7bab9c2d1a52cdaa47daaa166ca2025a55198e7285343c872`;
after refreshing the expanded ingress digest, the run-manifest self hash is
`aa46d6124e3df6ec73bf31ead4c8e01c4446bc1fd35e8d0bc001d26c10e823ad`
and its raw file SHA-256 is
`eb824209d50ab81d39a292f2fba53d2d71a5b158e58bec9979c420f7fba1df6a`.
The artifact checksum ledger replays and the lane hygiene report has zero
lane issues.

## Lean ingress landed

`b1_live_slice_card_eq_two_of_physicalClassFiveSixNormalForm` now proves
inside `EqualBlockerContinuation.lean` that one live physical slice has
cardinality exactly two.  The same module now proves that the common row has
exactly two unlabeled supports outside the physical class and that the chosen
live row has exactly two such supports.  On the card-six branch it further
proves that both live slices have cardinality two, are disjoint, and both live
rows have two-point complements.  `B1RowCompletionPair` now turns each such
complement into two distinct ambient carrier labels: the common row is always
packaged, one live row is packaged in every normal form, and both are packaged
on the six-point branch.  No cross-row distinctness or metric relation is
asserted.  These statements retain arbitrary ambient cardinality.  Focused
and downstream builds pass.  Temporary kernel axiom prints for the original
counting theorem, the generic completion-pair constructor, and all three B1
completion-pair ingress theorems reported only `propext`, `Classical.choice`,
and `Quot.sound`; the print command was then removed.  The expanded ingress
source SHA-256 is
`ca5e374309f761ebc39569e796b7eb20345eb7d62f814df377e1929d95b03d21`.

This discharges the finite-selection and unlabeled exact-four-completion parts
of the arbitrary-cardinality ingress.  For the shared-pair consumer alone, the
remaining field is same-arc provenance for the selected two-point slice.
Wave 2 shows that field cannot come from the named metric layer and moves the
live frontier to the geometry and provenance of the completion supports.

The card-five ingress is now complete as well.  The separately audited
`B1CardFiveLocalRolePacket.lean` proves the exact trace split `(1,2)`, `(2,1)`,
or `(2,2)` with a one-point slice intersection.  A singleton live slice leaves
three, not two, outside-class row supports; the new
`B1RowCompletionTriple` names all three by pairwise-distinct carrier labels.
Each of the three branches now packages the physical five-point row, the
common exact-four row, and both complete live exact-four rows, and exports a
canonical realized row pattern with positive row choices.  This remains
arbitrary-cardinality and asserts no cross-row role injectivity.  It supersedes
the earlier conservative card-five alias projection that omitted the
singleton row's three completion points.

## Wave 2: exact-rational named metric projection

Wave 2 strengthens the order abstraction to an exact rational Euclidean
configuration for the disjoint card-six branch.  Its boundary order is

```text
A, U, d1, Bc, d2, u0, Bu, u1, v0, Bv, v1, V.
```

The replay checks:

- all 220 increasing boundary triples have positive signed area;
- the `A,U,V` anchor triangle is non-obtuse, its circumcircle contains every
  named role, and all three anchors lie on that circle;
- exactly the six named physical roles have squared distance one from `A`;
- all six physical roles and all three blockers lie strictly in the cap
  opposite `A`;
- the common row meets the named physical class exactly in `{d1,d2}`, and
  the two live rows meet it exactly in `{u0,u1}` and `{v0,v1}`;
- each named pair-bisector fiber is exactly `{A, blocker}`;
- the two live mutual omissions hold; and
- all three shared pairs alternate across `A` and their blocker, so the
  same-arc count is zero.

The verdict is
`SAT_EXACT_RATIONAL_NAMED_METRIC_PROJECTION`.  This rules out a same-arc
producer using only the named cap, circle, bisector, omission, and convex-order
atoms.  It does **not** construct a full B1 context: it deliberately omits the
two additional support points needed to complete each exact four-point row,
the actual late-system provenance, deletion-survival packets, and all ambient
unnamed vertices.

The authenticated result is
`scratch/runs/b1-normalform-order-20260831/wave-2/artifacts/b1-normalform-metric-projection-result.json`
with SHA-256
`97bb103dc9528fedb72beedfd976d54b2f3493bafda12d35184b1a3aa6a6996d`.
The executed replay SHA-256 is
`622afc5909667d2d89603d8b4fea846c3b7f2c96652c9d82797cbb08e329edd3`;
after refreshing the expanded ingress digest, the run-manifest self hash is
`b484f078d1367d8677e0b124cece13aaf8bc361afec0457b397473fa26baaf95`
and its raw file SHA-256 is
`b1d8f41057c85988c46af4b42c19f774c2bc8a91d6abc10e345daaa53e37fc8a`.
Ruff, checksum replay, and lane hygiene all pass.

## Wave 3: exact-four completion boundary

Wave 3 separates the completed-row geometry from the full named B1 metric
packet.  Its authenticated verdict is
`PURE_ROW_SAT__FULL_B1_NAMED_COMPLETION_UNKNOWN`.

Two exact positive controls pass independently in Z3 4.16.0 and cvc5 1.3.3:

- a six-point one-row model has 20 of 20 positive ordered triples, row radius
  squared `17/137`, exact row `{L,x,y,R}`, exact `A`-unit class `{x,y}`, and
  exact finite pair-bisector fiber `{A,B}`; and
- a 15-point rational parabola model has six fresh pairwise-distinct
  completion supports, three disjoint exact four-point rows, 455 of 455
  positive ordered triples, 12 exact row equalities, 30 strict named off-row
  residuals plus three center exclusions, and cross-row overlap zero.

The second control is a strict scope boundary: three completed rows are
compatible with strict convexity, so no pure completed-row, global-turn, or
row-overlap obstruction can close B1.  It deliberately omits the common
`A`-centered physical circle, the `A,U,V` cap and circumdisk packet, exact
pair-bisector fibers for all three pairs, live omissions, and late-system or
deletion-survival provenance.

For the full 18-role nested named interface, Z3 returned `unknown` after 300
seconds and cvc5 reached its 300-second timeout.  A moving symmetric-anchor
numerical search found no positive-margin point in the six laminar seeds or
the 36 same-slot patterns; the best margins were approximately `-0.660` and
`-0.640`.  These are numerical non-witnesses, not UNSAT results, and cover
only the radial subclass in which each row restricts to `x,B,y,R,L`.
The named order does not force that subclass; other completion radial gaps
remain source-permitted.

The authenticated result is
`scratch/runs/b1-normalform-order-20260831/wave-3/artifacts/b1-exact-four-completion-wave3-result.json`
with SHA-256
`4bf4209208a933762779d7b750f3c858f9d3842c0e7f3784a2b14ca44b1184cd`.
The executed replay SHA-256 is
`b9a1bc5359632a57075b883f31f79cefae4d9938a19bf5281a19b7311ec49c9f`;
the exact SMT smoke SHA-256 is
`2318ff9eb0737a1deca9d13e7da87295fb5d30d8a71c82a8101a0e5803cb3c1b`;
the run-manifest self hash is
`53adf56f6515052117a3dfa51809fea4d45b9e5fefd7727a465c203d05dce69b`
and its raw file SHA-256 is
`32405473c29a54c022b77071e79e5cfad7daa025b5684eebd7170b3c4957ccc2`.
The checksum ledger SHA-256 is
`9066dfd6916bf025fb26efd9427e22a6c66b1f1df55f4333193bdfdb57bd1079`.
Exact replay, both solver controls, malformed-input rejection, Ruff, all 15
checksum entries, no-overwrite protection, and lane hygiene pass.

## Wave 4: first missing common-circle coupling

Wave 4 leaves the restricted radial subclass.  Its corrected local census has
20 labeled cyclic types for one row relative to `A,x,B,y`: eight put both
completion supports in one gap and twelve use distinct gaps.  Support exchange
has ten orbits.  Every one of the `20^3 = 8,000` local triples occurs in at
least one of the 3,603,600 base-preserving global merges, but the metric search
does not exhaust those merges.

The authenticated verdict is
`THREE_ROW_STAGE_A_UNKNOWN__TWO_ROW_STAGE_B_EXACT_SAT`.  An exact rational
two-row witness has 165 of 165 positive ordered triples, distinct roles, the
four physical roles exactly on the `A`-unit circle, exact four-point common and
live rows with every finite off-row residual strict, pair-bisector fibers
exactly `{A,Bi}`, and the required mutual omissions.  Its local types
`AxRLBy` and `AxBRLy` lie outside the earlier restricted subclass.  Z3 4.16.0
and cvc5 1.3.3 both accept the ground QF_NRA replay, and the SAT, UNSAT, and
malformed controls return their expected outcomes.

The fresh-distinct three-row Stage A remains unknown.  A robust-floor
order-free search and targeted parabola, nested, alternating, and extension
families found only numerical non-witnesses approaching collapsed supports.
None is an UNSAT result.  Stages B through D were intentionally not added to
the full three-row search because Stage A has no survivor or exhaustive
refutation.  The smallest unclassified family is therefore the third exact
row under the common physical circle and strict convexity, before row
negatives, cap/MEC, deletion survival, or late-system provenance.

The retained result SHA-256 is
`14355d4cce447511cc5179a1ba1a5d7362cea8a3dcbc77b605ac21167227f709`;
the executed replay SHA-256 is
`a4bbb8c2c7105cc7ed63036ac9efa0ed4b9c78d8159a320015eb7b6fab2a3829`;
the exact SMT SHA-256 is
`190e9f963847ce7ae3b597c022d526059fa12bf8c4ad9b417ca9263ea26eb357`.
The run-manifest self hash is
`9e96032f83f05a8325fa4cf5c107b9eb8a2d6c0dc840b0e98f27a006ad629a17`,
its raw file SHA-256 is
`133136d133f2ad2b575c88cc05d2b00f85b1efbec8efb72c78b4efcf6fa2fe1f`,
and the checksum-ledger SHA-256 is
`29681fed5ecfc20d6f0d8c4801062f11c7dcedad9eb28b14b78f9e551f376076`.
Verify-only replay, Ruff, all fifteen checksum entries, controls, no-overwrite
protection, and lane hygiene pass.  After an adversarial replay found that the
first SMT emission used power syntax rejected by the Z3 command-line parser,
the emitter was corrected to expand squares as multiplication.  The retained
artifact has no power operators; direct Z3 and cvc5 runs both return exit zero,
one `sat` line, and empty stderr.  Its refreshed ledger contains fifteen
entries.

An independent source and combinatorial audit classifies the alias surface
that follows the fresh-distinct case.  For the six completion-support slots
`C0,C1,U0,U1,V0,V1`, the upstream source proves exactly the three within-pair
inequalities.  The resulting 87 labeled equality partitions have 16 orbits
under independent swaps inside the pairs, with union-support distribution
`1,4,7,3,1` for sizes two through six.  Also quotienting the source symmetry
`U ↔ V` leaves 12 orbits with distribution `1,3,5,2,1`.  Their canonical
restricted-growth representatives are
`010101, 010102, 010202, 010212, 010123, 010203, 010213, 010223, 012323,
010234, 012324, 012345`.  Fresh-distinct is `012345`; later metric stages
should descend by support size.  All twelve patterns preserve each exact
row's four-point cardinality because the physical slices remain disjoint.
This is only the completion-to-completion alias census.  Current ingress does
not exclude a completion from being `A` or another row's blocker, so these
twelve orbits do not form a complete role-alias dispatcher.  The full
card-six source audit has 16 roles and exactly 78 proved inequality edges.  It
leaves blocker/foreign-physical, completion/`A`, completion/foreign-blocker,
and cross-completion equalities open.  Independent restricted-growth
enumerations give 94,381 labeled partitions and 7,287 orbits under the three
completion-pair swaps and the `u ↔ v` source symmetry.  The inequality-edge
digest is
`ffbb60724da0519c59b31f975df405411e84d4e0ad69a7026618b3c93c5f9b57`;
the role/spec/count digest is
`6e0f147f9a049885688c6b05c332e47ef623d641506682c02f015adedd2723f9`.

### Corrected installed-kernel screen

The first screen of this full alias surface reported 204 orbits matching a
`SixPointFiveCircleCollisionCoreB`.  That result was rejected on manual
replay: the screen had treated all supports of a row as a clique and, in one
path, omitted the theorem center.  A second screen then overcorrected by
requiring all six kernel roles to be injective, although the installed Lean
structures require only `A ≠ E`.  The final field-exact unordered-edge screen
finds 1,216 labeled partitions in 76 orbits for the union of A/B/C.  Per core,
A and B each hit 1,216/76 and C hits 832/52.  All of these hits already belong
to the `DuplicateCenterCore` family below, so they remove no additional
survivors.  The former example RGS `0123456351070707` is not a B core under
the rejected map, but it is a genuine A core when `O = C` and `B = F`, both
coincidences permitted by the Lean structure.

The generic `DuplicateCenterCore` does have genuine coverage.  Its exact
predicate finds 11,776 labeled partitions in 829 conservative orbits.  Every
such orbit has a witness using the physical apex as one center; aliases let
the second center's three distance edges join the same closure component.
The proof-facing checker already exists in
`GenericRowNogoodCertificate.lean`, so no new certificate kernel is needed.
Removing these hits leaves 82,605 labeled partitions in 6,458 orbits, with
survivor digest
`c97af327af7f63dd7f9a1dfb0006a889193ee9eede56c79b290da8e5c77d93cf`.

The 7,287 count uses the order-16 action generated by the three independent
completion-pair swaps and the full `u`/`v` row swap.  This full 16-role audit
is source-complete only when the physical class has cardinality six.  The
three card-five trace shapes remain a separate ingress and alias problem.
Wave 6 therefore retains and replays this card-six enumerator before applying
order, endpoint-shadow, and metric filters to the 6,458 surviving orbits.

## Wave 5: order-free third-row extension

Wave 5 implements the five-parameter extension `(s,t,k,ℓ,r)` with exposing
normals and a common strict-convexity margin.  Its authenticated verdict is
`UNKNOWN`.  With the exact Wave 4 two-row witness fixed, five stereographic
arc cells and two deterministic starts per cell reached at most 14 of the 16
required hull vertices; the best exposure margin was approximately
`-3.176·10⁻¹²`.  Releasing both existing rows in relative trust regions
`0.02`, `0.1`, and `0.5` again reached at most 14 vertices, with best margin
approximately `-1.954·10⁻¹⁴` and two failed roles.  Every near-survivor
lay on a recorded degeneracy: coincident physical endpoints, collapsed
supports, zero exposure, or `k → 1/2`.

This is bounded numerical evidence, not UNSAT.  Stage B and portable SMT
emission were omitted because no rational Stage-A survivor was available.
The exact controls replay the Wave 4 two-row witness and the common-circle-
disabled Wave 3 parabola witness; `k = 1/2` and `L = R` mutants fail as
required.  Thirty-two independent rational normal/hull tests checked all
2,688 positive determinants, with minimum exact exposing margin `200/137741`.
An adversarial artifact audit reproduced the searches, controls, hashes, and
the `UNKNOWN` scope.

The retained result SHA-256 is
`a121c3cccbe7d45a84aaf29c9eeda209a3ebc7b1cba2b0674f7742a592facae2`;
the executed source SHA-256 is
`f4a023e8ca5cecd0a353ae8908b2b8f54b5ce86ea491965083c04c49076399b7`.
The run-manifest self hash is
`caf52a6791739f5010f5b37246b7877defc0d8a8d72e764150857f5354627a71`,
its raw file SHA-256 is
`aefd68f9abdab5d17125e32ce87e5ada1a7068b8d26e453b8fd23af5b8452b9d`,
and the checksum-ledger SHA-256 is
`fc2325924f83ff9be2d80b9d731db324519fa235a7a93067d9249e7a047f6413`.
Verify-only, Ruff, checksums, no-overwrite protection, cache cleanup, and lane
hygiene pass.

The center-semicircle condition has now been checked exactly and independently
audited.  At a vertex of a finite set in strict convex position, equal-radius
directions do lie in one open semicircle, and their angular order matches the
restricted hull order up to the common orientation.  This lemma and the
unoriented common-chord bisector axes remove no corrected local type: both
enumerations retain all 20 one-row words, all 8,000 local triples, and all
3,603,600 global merges, with multiplicities from 1 through 29,826.  The
count-table SHA-256 is
`f2d16bc09dcb799df15f6bed48d63e784f83dc2e7ed73cd0611301a635ee98c5`.
Thus the Wave 5 collapse is metric rather than a missed cyclic-order cell.
A valid next metric seed is
`A,d1,cR,cL,Bc,d2,u0,Bu,uR,uL,u1,vL,vR,v0,Bv,v1`, with local types
`AxRLBy`, `AxBRLy`, and `ALRxBy`.  Alias metrics remain after the
fresh-distinct family.

An independently audited metric identity supplies the first genuine pruning
rule.  In the short-arc normalization
`P = c e - s f`, `Q = c e + s f`, `B = 2kc e`, strict convexity and the fact
that `B` is a carrier vertex force `k > 1/2`.  For a completion
`X = B + Rot_t(P-B)` on the exterior `P`-wing and a genuinely earlier physical
endpoint `W`,

```text
det(P-W, X-P) =
  -4r sin((x-δ)/2) sin(t/2) sin(φ+(t+x+δ)/2).
```

This is negative for `0 < t < 2 atan(d/s)`, contradicting the required
boundary turn.  Reflection supplies the other wing.  Inner-arc placements
survive, and the endpoint value is not zero, so this is a conditional pruning
lemma rather than a three-row terminal.  The exact Wave 4 witness passes the
audit and uses only placements outside the forbidden situation.

## Wave 6: card-six alias and endpoint-shadow screen

Wave 6 completed the exact structural enumeration for the 16 named card-six
roles.  It enumerated 94,381 labeled equality partitions in 7,287 symmetry
orbits.  Installed edge-closure kernels, the hypothesis-tagged endpoint-shadow
screen, and exact local-order closure leave 1,609 partitions in 134 orbits.
The endpoint-shadow rejections isolate one concrete geometric producer:
`UNIT_BLOCKER_LIES_IN_OPEN_MINOR_ENDPOINT_ARC`.  Its proof-facing form needs an
adapter from the B1 role/alias packet to the global injective convex-order and
MEC hypotheses, including endpoint distinctness, common radius, directed
order, and sign data.

The five retained QF_NRA metric canaries all timed out or returned `unknown`.
They therefore add no SAT or UNSAT conclusion.  The retained structural result
SHA-256 is
`4b768d48addf94ebbbb994f30780e48c6239b55184b9f7cee9eac79aaf0304ac`;
the metric-canary-v2 result SHA-256 is
`7ef31007209e5f0ffa67bcbc9cfce61ecd920e269d225bafe9c520880005866e`.

The post-wave provenance audit found that the Wave 6 run manifest had omitted
two source inputs and one executed-source pin.  Before receipt creation it was
refrozen with `B1LocalRolePacket.lean`, `EqualBlockerContinuation.lean`, and the
v1 metric-canary executed source.  The corrected manifest self hash is
`5fc689a559dc1e21355d3826ec49e537ee02848c63a71243beec81d50283d685`;
its raw file SHA-256 is
`4126fdab30bd7d6635ee0f86a880dff2fea9b057cf8287dceee2fee644910a9e`.

## Wave 7: Stage-A near-survivor order cell

Wave 7 fixed the first near-survivor cyclic order exposed by Wave 5,

```text
A,d1,cR,cL,Bc,d2,u0,Bu,uR,uL,u1,vL,vR,v0,Bv,v1
```

and released the common and both live completed rows.  Four deterministic
600-generation searches (population multiplier 18; seeds `9705`, `9711`,
`9723`, and `9737`) found no positive fixed-order convex margin.  The bounded
verdict is `UNKNOWN`; the best minimum margin was
`-0.04620695120742889` (seed `9711`).  The best run repeats the Wave 5
boundary collapse: all six physical stereographic parameters approach zero
and all three blocker scales approach one-half.  Its first violated edges are
`cR -> cL | v1` at `-0.04621`, `v0 -> Bv | cR` at `-0.04389`, and
`cR -> cL | Bv` at `-0.04357`.

The checked existential global ingress is
`B1LiveSlicesSameBoundaryArc`: it supplies one global `BoundaryIndexing` and
conditional same-boundary-arc fields for whichever live slice has cardinality
two.  The theorem
`false_of_b1PhysicalClassFiveSixNormalForm_of_liveSlicesSameBoundaryArc`
checks that this ingress closes the normal-form leaf.  Wave 7 supplies no
producer for those fields.  The actual missing producer remains the
same-boundary-arc order, so the next refinement needs a new provenance/source
family or an upstream extremal selection, not another order-only fixed
numerical wave.

The subsequent cardinality-free sharpening is
`B1WinningLiveSliceIngress.lean`.  Its weakest consumer packet asks for one
card-two live slice together with that pair's same-arc bit.  Restoring
`ExactFourMutualOmissionSourceContext` as `B1SourceProvenance` identifies the
whole `u`-slice as `{source,u}` whenever `u ≠ source`; the source row and
finite-cardinality data are no longer missing.  The remaining Wave 8 input is
therefore the source-proved escape-row/deletion-survival star, while same-arc
stays the output target.  Axiom audit of the source-slice theorem, the packet
specialization, and the winning-row contradiction reports only `propext`,
`Classical.choice`, and `Quot.sound`.

The checked Wave 8 emitter is
`nonempty_b1EscapeRowProvenanceStar`.  It packages one ambient boundary
indexing, the escape witness and exact escape row, the winning card-two
disjunction, live-slice membership of the escape source, and the
cross-omitted original deletion.  It does not assert same-arc.  Its axiom
audit reports only `propext`, `Classical.choice`, and `Quot.sound`.  The
candidate reuse search against Lean source revision `042703d99` was verified
chunk by chunk: `b1_escapeRow_crossOmission`, the card-two theorem,
`b1_live_bisectorSet_eq_pair`, the target definition, and the conditional
two-circle contradiction do not supply the missing implication.  The reuse
verdict is therefore `NO_REUSE`, with cyclic placement as the first missing
antecedent.

The retained result SHA-256 is
`56b6259d02919a4551143e47b72dadd93b106aba6a291f72f79a147dbb8c1e41`;
the executed-source SHA-256 is
`6c009cd31080a25252b55be4e6b85f0230f16048b03af9c02ce2660284fb8ff4`.
The run-manifest self hash is
`3b2835c219531bd6817d3008236d58050850d720ffa262de8119e4b0730ec0d1`;
its raw file SHA-256 is
`70b9a4f4527fc8162ca9bc333886c15c85c030cd59dd77ab1b827a0f6aab275b`.
Checksum replay passes.  The current-wave theorem mine is
`NO_NEW_PATTERN`: the repeated collapse yields no robust survivor,
certificate, or changed source-level theorem key.  Its receipt SHA-256 is
`58dae5365ceb6171d4ed73fa0fd5a6db4775765dff4291b683f5a69f7881dcf4`.

## Post-wave theorem-mine compliance correction

Waves 1–6 originally lacked the mandatory current-wave-only theorem-mine
receipt.  The computation was retained, but these bespoke enumeration and SMT
runners were outside the PIQD-specific enforced gate.  Exact classifications
and later reuse searches did not satisfy the per-wave obligation.  The missing
records have now been backfilled as historical, non-authorizing receipts:

| Wave | Terminal verdict | Mine outcome | Candidate/search disposition | Receipt SHA-256 |
|---|---|---|---|---|
| 1 | `SAT` | `NO_NEW_PATTERN` | Known missing same-arc producer; no changed search key | `e1b526b804be35c25a832f3350008128d1329dcc8f00ab75d02ce0a9351a65e7` |
| 2 | `SAT` | `NO_NEW_PATTERN` | Exact rational witness confirms the Wave 1 key | `4aaa3c571a3fa3e9c491e5defe823efe4bbece43b83de51278f3e4fb1c6c739a` |
| 3 | `UNKNOWN` | `NO_NEW_PATTERN` | Local SAT/fixed-extension UNSAT/full-interface timeout did not isolate a source-entitled candidate | `b91b6ba26b0823c2d100f3df1e5b549b7d93bc15530daf89289de285dd64a590` |
| 4 | `UNKNOWN` | `CANDIDATES` | `third-exact-row-common-A-circle`; project and cross-project Lean searches found no direct theorem | `8421099aa18a40b3086327ced80485aeb97da09d9c540ddae6170b4977045a17` |
| 5 | `UNKNOWN` | `NO_NEW_PATTERN` | Re-tested the unchanged Wave 4 key without a robust survivor or certificate | `f550f04d2ea5c7325d39d761dab9975dd431ffeea1e06d8dd836f539d9037a3e` |
| 6 | `ENUMERATION_COMPLETE` | `CANDIDATES` | `unit-blocker-open-minor-endpoint-arc-adapter`; no directly consumable project or sibling theorem | `a9076d78a537453465c2567edb417b8541277277062b69c1a97e5ab1769acd63` |
| 7 | `UNKNOWN` | `NO_NEW_PATTERN` | Repeated the Wave 5 boundary collapse in a new fixed-order cell; no robust survivor or certificate | `58dae5365ceb6171d4ed73fa0fd5a6db4775765dff4291b683f5a69f7881dcf4` |

The campaign scan over `wave-1` through `wave-7` reports `PASS` with seven
`VALID_RECEIPT` rows.  Project searches use `proof-blueprint search` against
the pinned project index; cross-project searches use
`nthdegree docs search --lean`.  Waves 1–6 remain historical, non-authorizing
backfills; Wave 7 is the current-gate receipt.  These receipts do not
authorize another solver wave, prove either candidate, or close
`false_of_b1PhysicalClassFiveSixNormalForm`.
