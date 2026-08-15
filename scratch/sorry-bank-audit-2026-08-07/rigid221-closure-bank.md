# Rigid221 closure theorem-bank audit (2026-08-07)

Scope is source-only: no build or `#print axioms` run.  I checked the six
`sorry` leaves in `FrontierLiveClosure/Rigid221Closure.lean`, the scoped
`erdos-97-96-formalization-lean` corpus, the four canonical mining registries,
and the relevant imported source.  A mined report is not treated as closure.
The corpus index is newer than the checkout (`2026-08-08`, source
`f33e2b40`), so current-source statements below take precedence.

## Bank status

* **Exact-15 BlockerV:** `BlockerVExactFifteenFourRowCoverage` is source-clean
  and its public consumer `false_of_positionEmbedding_membershipRows` consumes
  convex boundary realization, a `Fin 15` position embedding, four rows of
  cardinality four, fixed hits, long-cap bound, and shell equalities.  Its
  private `Rigid221SourceHeavy` adapter supplies those facts only for the
  `ExactFourRigid221PhysicalApexSourceEqUContext` plus
  `ExactFourRigid221SourceEqUBlockerVRowOtherSourceHeavyPacket` residual.
  This is a genuine exact-cardinality-15 closer for that other residual, not
  any of the six leaves.
* **Exact-16 BlockerV:** likewise source-clean.  The public consumer
  `false_of_positionEmbedding_membershipRows` requires the analogous `Fin 16`
  embedding and four realized rows; the private SourceHeavy adapter has the
  same EqU/row-packet preconditions.  No target leaf supplies them.
* **Exact-17 selected-row Kalmanson C--G:**
  `KalmansonFourEqualitySchemas` proves orientation-neutral consumers
  `false_of_four_selected_rows_in_{seven,six}_ccw_order_{C,D,E,F,G}` (and
  metric forms), with no source `sorry` in that module.  They are consumers,
  not finite coverage producers.  The current SourceHeavy exact-17
  cap-nine leaf remains `sorry` (line 10106), as does its `card >= 18`
  continuation (line 10142).  Thus C--G do not close the exact-17 producer
  obligation or any of the six leaves.
* **Exact-12 ordered cuts/Kalmanson:** `ExactTwelveRigid221OrderedCoverageCuts`
  and `ExactTwelveRigid221KalmansonConsumer` are source-clean fixed-cut and
  generic contradiction consumers.  Their module comments explicitly say
  finite coverage of all retained row patterns is separate.  The ordered
  three-row files similarly promote individual learned cuts only.  These
  modules are not imported by `Rigid221Closure` (which imports only
  `Rigid221SourceHeavy`); no source bridge from a six-leaf context to
  `FrozenBoundaryOrder`/`RowPattern` was found.
* The canonical general-n report records exact-15/16 as reusable finite
  consumers and says the next child starts at 17; it contains no exact closer
  for these six declarations.  The three other canonical registry files had
  no direct exact-15/16/17, ordered-cut, Kalmanson, or Rigid221 candidate.

## Six leaves

1. `false_of_exactFourMutualOmissionRigid221_physicalApex_sourceNeU`
   (`Rigid221Closure.lean:52`, body `:101`).  The target has a mutual-omission
   source context, `globalDeletion.center = oppApex2`, and a source blocker
   localized to deletion/`u`/the `v` row.  The 15/16 adapters instead require
   the EqU context, a source-heavy packet, explicit `Fin 15`/`Fin 16`
   boundary labels, support-cover inclusions, and four-row position
   embedding.  None is a consequence of this target's hypotheses.  First
   missing antecedent: a source-faithful producer of that EqU packet and
   finite embedding (or a new direct geometric contradiction).  Existing
   scratch C-package facts derive local class/collision plumbing but record
   the final residual as conjectural; they are not imported closure.

2. `false_of_exactFourMutualOmissionRigid221_nonphysicalCollision`
   (`:224`, body `:267`).  The extra hypothesis is only a two-point collision
   at a nonphysical center.  It still lacks the SourceHeavy EqU packet,
   four-row coverage, and cyclic position embedding required by exact-15/16;
   collision does not supply them.  First missing antecedent is the same
   source-row/embedding producer, followed by a proof that the collision fits
   one bank motif.  No exact closer or non-circular bank consumer applies.

3. `false_of_exactFourPostCardElevenTwoRadiusBranch`
   (`:713`, body `:729`).  Its data are two disjoint exact rows at distinct
   radii and the no-five condition.  No candidate bank accepts just this
   normal form: exact-15/16 need four labeled rows plus boundary embedding;
   exact-12 cuts need a concrete frozen order and named row pattern.  First
   missing antecedent is the finite row/order/coverage producer.  The D-package
   scratch bank proves antecedent plumbing around this leaf, not `False`.

4. `false_of_exactFourPhysicalConsumerSwappedUniqueFourOutcome`
   (`:778`, body `:788`).  The target retains an original exact-four residual,
   physical common-deletion ingress, and a swapped frontier.  This is not the
   EqU BlockerV packet consumed by exact-15/16, and supplies no fixed selected
   row pattern for exact-12 or C--G.  First missing antecedent is a global
   contradiction/producer coupling the original and swapped packets.  The
   D-package protected-pair/ingress results are useful producers but leave
   this terminal open.

5. `false_of_exactFiveDistinct_biApexRobust_postCardEleven`
   (`:968`, body `:985`).  The target is an exact-five first-apex residual
   with two distinct obstruction centers and a robust second apex.  Exact-
   15/16 are exact-four, second-cap BlockerV consumers; C--G and the ordinal
   Kalmanson cycle require explicit ordered boundary indices and selected-row
   equalities, none present here.  First missing antecedent is a producer
   extracting a concrete ordered row obstruction (or another robust global
   terminal) from this two-center packet.

6. `false_of_firstApexUniqueRadiusExactFiveCommonObstructionCenterResidual`
   (`:1143`, body `:1149`).  This leaf has only the common-center residual
   package.  No searched bank consumes that package directly.  The first
   missing antecedent is any source-faithful finite row/order pattern or a
   generic lift into `OrdinalKalmansonCycle` (which requires an explicit
   `TransGen` cycle of selected-row comparisons).  It is load-bearing in the
   dispatcher and remains wholly open.

## Conclusion

No exact closer was found for any of the six declarations.  Exact-15/16 and
exact-17 C--G are real, source-clean consumers for the distinct SourceHeavy
BlockerV strata, but their required EqU/row-coverage/order producers do not
follow from these six target interfaces.  Exact-12 ordered/Kalmanson material
is likewise consumer-only, partly unreachable from this import root, and
explicitly lacks universal finite coverage.  Source scans also show existing
`sorry` provenance in `Rigid221SourceHeavy`/`Rigid221Placement`; therefore no
transitive SourceHeavy theorem is to be promoted as kernel closure here.
