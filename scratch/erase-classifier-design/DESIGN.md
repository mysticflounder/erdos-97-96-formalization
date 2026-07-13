# K-B-ERASE card-{10,11} finite-closure classifier — design (2026-07-12)

Implementation is complete and pushed in commit `652fdfcb`. The
card-10 label-complete producer, all twenty P2 consumers described in §4.2,
and both P4 consumers described in §4.3 are implemented, wired, and
kernel-built.  At card 11, M1 and M2 are complete and the P4-U arm is fully
certified, soundness-transported, wired, and kernel-built.  P4-S and P2 are
also target-built through their native fleets, semantic dispatchers, closure
theorems, residual consumers, and downstream `Continuation` target.  The
exact-pin ERASE subtree is kernel-complete at 0/1376 open nodes.
A final cached `scripts/build-p2-certificates.sh` rerun passed all 16 bounded
P2 batches and the 8410-job aggregate target.
This is the "third
classifier instance" both ERASE scoping
audits converge on
(`docs/audits/2026-07-11-erase-p2-remainder-blocker-audit.md`,
`docs/audits/2026-07-12-erase-p4-route-scoping.md`), mapped from the committed
K-B-END-GENERAL endpoint chain
(`lean/Erdos9796Proof/P97/EndpointCertificate/`) and the K-B-PIN chain
(`lean/Erdos9796Proof/P97/Census554/CapSelectedNativeClosureSound.lean`).

The ERASE-P2 redraft and its closure implementation have landed. Its exact statements are validated
against `RemovableVertexAxiom/ErasedPinRowResiduals.lean`; historical
line references below describe the pre-closure design baseline and are not
current source locations.

## 0. Historical hole surface designed against

At the design checkpoint, leaf
`Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded`
had P4 holes at `Continuation.lean:183/:211` and P2 holes at `:312/:337`.
All four are now closed. The historical intermediate statement was
`IsM44NonSurplusContainmentErasedPinTripleRoutedSeedFiniteResidualRowsFactsStatement`
(HEAD `Base.lean:9168-9192`): ambient
`A hne hconv hK4 (hgt : 9 < A.card) hMin S hM44` plus the five-input scaffold

- `hend1 : S.EndpointEscapeLeftAt S.oppIndex1 … → False`
- `hend2 : S.EndpointEscapeRightAt S.oppIndex2 … → False`
- `hpin1 : S.PinnedRightSurplusResidualAt … → False`
- `hpin2 : S.PinnedLeftSurplusResidualAt … → False`
- `hcontain : S.NonSurplusMoserCapContainment`

(verified at HEAD `Base.lean:9174-9188`).

Post-redraft surface (VALIDATED from the landed source):

- 20 per-row refutation theorems in the new
  `RemovableVertexAxiom/ErasedPinRowResiduals.lean` — goal `False`;
  hypotheses = ambient + five-input scaffold + `hK4` + `hMin` + the row's
  `(m,s,l,r)` exact-4 counts at a non-surplus center `p` through the erased
  pin `x`.  The landed list is nine count rows plus one terminal payload per
  side.  The larger 26-row bank vocabulary remains useful because it contains
  every landed row seed.
- 2 P4 holes (HEAD `Continuation.lean:183/:211`, stated byte-identical after
  the redraft per the coordination note): direct `ErasedPinTriple A x p` at
  `p = S.oppositeVertexByIndex S.surplusIdx` (surplus-opposite apex) and at
  `p ∈ S.capInteriorByIndex S.surplusIdx` (surplus interior), with
  `U5DangerousTriple` + selected candidate + exact radius class + two
  off-circle auxiliaries already derived in scope
  (`Continuation.lean:150-211`). Route A's sole missing input is
  `RowwiseConfinedQDeletedClasses` (`U3ToU5Terminal.lean:296`), (Q)-flavor.

Validated fixed points the design can rely on:

- `ErasedPinTriple A x p` ⇔ exact four-point selected class through `x` at
  `p` (`WitnessPacketInterface.lean:198` abbrev;
  `erasedPinTriple_of_exact_erased_pin` `:205`; converse machinery `:250`).
- Count vocabulary `moserCount / sameCapCount / leftAdjCount / rightAdjCount`
  (`SurplusM44Packet.lean:990-1010`); adjacency convention left = cap i+1,
  right = cap i−1 mod 3 (`SurplusM44Packet.lean:293-320`), cross-checked
  against the census encoding in `scratch/erased-pin-row-truth/STATE.md`
  ("Semantics cross-check PASSED").

## 1. Finite domain, and why the cards are forced to {10, 11}

### 1.1 Card forcing (PROVEN, committed, verified from source)

1. `hgt : 9 < A.card` (HEAD `Base.lean:9171`) ⇒ `A.card ≥ 10`.
2. `SurplusCapPacket.IsM44.surplus_card_eq`
   (`Cap/PartitionFromMEC.lean:448`): `S.surplusCap.card + 5 = A.card`.
3. `SurplusCapPacket.IsM44.surplus_card_ge_five`
   (`Cap/PartitionFromMEC.lean:457`): `m ≥ 5`.
4. `SurplusCapPacket.surplus_card_le_six_of_convexIndep_K4`
   (`CapSelectedRowCounting.lean:765`, inputs `hconv hK4 hM44`): `m ≤ 6`.

Hence `m ∈ {5, 6}` and `A.card ∈ {10, 11}`; closed-cap profiles
`(5,4,4)`/`(6,4,4)`, exactly the `PROFILES` frame of
`scratch/erase-p3-map/ep3map.py:64`. All four lemmas are in committed,
non-frozen files; the chain is available inside every hole (all hypotheses
ambient). The `m = 6` corollary `card_eq_eleven_of_surplus_card_gt_five`
(`CapSelectedRowCounting.lean:813`) is the same split the endpoint lane used.

### 1.2 What gets enumerated — card 11 branch

**Placement structures in the committed `Fin 11` vocabulary, not the 25
canonical census classes.** The `inventory.json` class codes
(`class_key(canon_joint(...))`, orientation quotient) are Python-side
diagnostic canonicalization with no Lean semantics attached; nothing in
`lean/` interprets a census class code. What the Lean instrument can consume
is the `Census554.CapSelectedFiniteCode` vocabulary (`Label := Fin 11`,
`PatternCode`, `row`, `IncidenceOK` — `CapSelectedFiniteCode.lean:33-215`)
plus the committed native search
(`CapSelectedNativeClassifier.lean`: `localCandidateOK :108`,
`candidateRows :116`, `placementCheck :310`), for which soundness transports
already exist. The role of ERASE-P3-MAP is different and already discharged:
it fixed the seed-signature alphabet per site, validated the frame encoding
(roundtrip `IDENTITY` over 186 structural signatures,
`scratch/erase-p3-map/roundtrip_results.json`), and mapped all 28 stored
row-truth witnesses onto alive classes with `hard_fail 0`
(`witness_validation.json`).

Enumerated object = **seed placement** `(c₀, support, deleted)`:

- `c₀` — the hole's center label: P2 rows `c₀ ∈ {7,8}` (`intO1`) or
  `{9,10}` (`intO2`); P4-U `c₀ = 0` (`L.pointOf 0 =
  S.oppositeVertexByIndex S.surplusIdx`, `point_zero_eq_opposite`,
  `Census554/CapSelectedGeometry.lean:157`); P4-S `c₀ ∈ intS = {3,4,5,6}`.
- `support` — an 11-bit mask passing `localCandidateOK c₀ deleted support`
  and realizing the hole's bucket signature, with a surplus-interior member
  (the pin `x`).
- `deleted` — an `intS` label with `deleted ∈ row P 0` (same pivot the
  pinned/endpoint lanes use, produced by `exists_row_zero_mem_intS_ne`,
  `EndpointCertificate/BridgeStaging.lean:178`). For P4-U one can choose
  `deleted := labelOf x` since there `x ∈ row P 0 ∩ intS` directly.

Each seed placement drives the committed DFS (`allKilled`-family) over the 10
remaining centers' `candidateRows`.

Computed domain sizes (script `domain_count.py` in this directory, an exact
replica of `localCandidateOK`; EMPIRICALLY VERIFIED, re-runnable):

| family | centers | pin-compatible candidate supports | total |
|---|---|---|---|
| P2 rows | 7, 8, 9, 10 | 191 per center | 764 |
| P4-U | 0 | 47 after Moser-pair containment | 47 |
| P4-S | 3, 4, 5, 6 | 90 per center | 360 |

Grand total 1171 containment-compatible seed supports.  The M1 domain has
**4543 searches**: 3056 P2, 1440 P4-S, and 47 P4-U.  The P4-U DFS is
independent of which support member is named `deleted`, so M1 folds that
choice to one representative; the proof certificate quantifies over every
eligible deleted label. Per-row dispatch can still shrink the P2 share: a
single `(side, center, sig)` cell contains only the supports realizing that
row's signature (from 1 support for `(0,0,0,4)` up to 36 for `(1,0,1,2)`,
times 2 centers × 4 deleted).

### 1.3 What gets enumerated — card 10 branch

The `Fin 11` machinery is unusable at card 10: `CanonicalLabeling` extends
`Card11Labeling` (`CapSelectedGeometry.lean:143`), `capS/intS` hard-code
`(6,4,4)` (`CapSelectedFiniteCode.lean:54-57`), and `incidenceOK_patternCode`
requires `hsurplusCard : S.surplusCap.card = 6`
(`CapSelectedCarrierBridge.lean:1100`). A phantom-label embedding of card 10
into `Fin 11` was considered and rejected: `IncidenceOK` quantifies over all
labels (`LocalRowsOK`, `CapSelectedCountsOK` over all of `capS`), so a
phantom center would need a fake row satisfying real constraints — no sound
transport exists.

At card 10 the enumerated objects are the **ten-label bank seeds** already
committed: `ErasedPinFixedSeedDFS.lean` (`erasedPinFixedSeeds`, 1320 listed /
330 deduplicated `OneSidedSeed`s over `sstar × privateCenter × privateMask`,
26 per-row exclusion theorems), consumed through the generic bridge
`false_of_erasedPinFixedSeedRelaxedShape_pointClasses`
(`SurplusCOMPGBankGeometry.lean:10761`). Verified tally: every bank seed has
`privateCenter ∈ {.Pw, .Pu}` (660 + 660) — i.e. the bank covers the P2
opp-cap rows (left side via the mirror consumers), **not** the P4 centers
`u`/`s_i`. Consequences in §4.3.

At card 10 the frame is label-complete (`A` = the ten roles, `intS` has 3
members), so the bank bridge's confinement side conditions (`hcard`: card-4
ten-label mask at every non-v/w center; `hself`) become provable — the exact
mechanism `GeometryProducer.lean` uses for the endpoint bank at `m = 5`
(module header, `EndpointCertificate/GeometryProducer.lean:12-25`). This is
the "ten-label sibling of `GeometryProducer.lean`" named by the P4 audit.

## 2. Decidable predicate and the native gate

### 2.1 The evaluated predicate

New module-level definitions (mirroring `EndpointNativeClassifier.lean`,
never modifying `Census554/`):

```
variableCentersAt (c₀ : Nat) : List Nat        -- the 10 centers ≠ c₀
exactSeedOffCircleCoreAt (c₀ : Nat) …          -- center-literal fork
hasPrefixCoreAt (c₀ : Nat) (rows : List Row)   -- keys find? (·.center == c₀)
allKilledAt (c₀ : Nat) : Nat → List Row → List Domain → Bool
erasedPlacementCheckAt (c₀ support deleted : Nat) : Bool
```

`erasedPlacementCheckAt` = the committed `placementCheck` shape
(`CapSelectedNativeClassifier.lean:310`) with fixed row `⟨c₀, support⟩`:
gate `localCandidateOK c₀ deleted support`, build restricted domains over
`variableCentersAt c₀`, then `allKilledAt`. The detector suite is reused
verbatim (`duplicateCenterCore`, `perpendicularBisectorCore`,
`convexFivePointCore`) plus the parametric exact off-circle detector. The
committed code hard-codes center literal `1`
(`CapSelectedNativeClassifier.lean:215, :260`) and the endpoint fork
hard-codes `2` (`EndpointNativeClassifier.lean:56-73`); ERASE needs seed
centers `{0, 3, 4, 5, 6, 7, 8, 9, 10}`, so fork **once, parametrically in
`c₀`**, rather than 9 more copies. The transport map located the literal in
~5 places (`docs/audits/2026-07-11-endpoint-classifier-transport-map.md`,
headline 3); the same 5 places parametrize.

Implemented evaluation and proof batching:

- M1's compiled `erase_m1_gate` executable evaluates one task per cell.  Its
  complete 2026-07-12 run passed all 4543 cells in 845205 ms: P4-U 47/47,
  P4-S 1440/1440, P2 3056/3056.
- P4-U uses one closed `native_decide` theorem over all 47 supports and all
  eligible surplus-interior deleted labels.  Semantic support-list and
  deleted-list completeness are proved in `P4UPlacements.lean`.
- P4-S is split into 128 independent `(center, deleted, chunk)` native leaves;
  their aggregators, semantic dispatcher, closure final, and standalone
  target all build.  The terminal and semantic dispatcher have approved axiom
  closure (core + `Lean.ofReduceBool` + `Lean.trustCompiler`, no `sorryAx`).
- P2 uses the same 128-leaf shape.  Its original numeric support partition had
  between 0 and 65 active searches per leaf; the balanced support key now has
  between 21 and 25.  Each leaf also constructs its support-independent
  candidate domains once instead of once per support.  The equality back to
  `erasedPlacementCheckAt` is proved in Lean.  A 23-search representative leaf
  built in 715 seconds; `compiler.small 100` produced 714 seconds and was
  rejected as noise.  `scripts/build-p2-certificates.sh` now drives resumable
  batches containing at most eight explicit leaf targets, because Lake's jobs
  setting is advisory rather than a hard process cap.  Its first complete
  eight-leaf group took 549–1064 seconds per chunk (736 seconds average), so
  the queue is ordered by chunk index to group like-cost tails instead of
  making every batch wait on the slowest chunk.  `domain_count.py`
  asserts both old/new shard ranges and the exact 1171-support/4543-search M1
  totals.

### 2.2 decide vs native_decide

The per-seed search explores up to 10 domains of 15-203 candidate rows
(`domain_count.py`: center-0 79, centers 1-2 15, centers 3-6 96, centers
7-10 203) with equality-closure recomputation at every node. The committed
lanes already required `native_decide` for a *single* such search; kernel
`decide` is not feasible at this scale. Policy compliance (bv_decide
standard): the evaluated closure is the committed
`CapSelectedNativeClassifier` code — ordinary verified Lean, no `unsafe`, no
`@[implemented_by]`, no `@[extern]` (already carried through the K-B-PIN and
K-B-END-GENERAL audits) — plus the parametric fork, which must preserve that
property.  The 2026-07-13 evaluated-closure source scan passes.  A
  P2 dispatcher and all right/left aggregate terminals report `propext`,
  `Classical.choice`, `Lean.ofReduceBool`, approved `Lean.trustCompiler`, and
  `Quot.sound`, with no `sorryAx`.

## 3. Soundness transport (analogue of transport-map items 4-7)

Shell record, one per family (P2-right, P2-left, P4-U, P4-S), mirroring
`PinnedShellOK` (`CapSelectedFiniteCode.lean:218`) and
`EndpointLeft/RightShellOK` (`GeneralMCardEleven.lean:407/:424`):

```
ErasedRowShellOK P blocker (c₀ pin deleted : Label) (sig) :=
  c₀ ∈ intO1 (resp. intO2 / = 0 / ∈ intS) ∧
  pin ∈ intS ∧ pin ∈ row P c₀ ∧ pin ≠ c₀ ∧
  (row P c₀ ∩ moser).card = sig.m ∧ … (four bucket-count conjuncts) ∧
  deleted ∈ intS ∧ deleted ∈ row P 0 ∧
  (∀ q, blocker q ≠ q ∧ q ∈ row P (blocker q)) ∧
  (∀ q ∈ row P c₀, blocker q = c₀)
```

The earlier draft copied `blocker deleted ≠ c₀` from `PinnedShellOK`.
The committed classifier and closure soundness destructure that conjunct only
as an unused `_hdeletedBlocker`; neither local-candidate soundness nor
closure-core extraction consumes it.  The ERASE shell record therefore omits
it.  This matters because the full pin-compatible domain does not ensure that
the chosen `row 0 ∩ intS` label lies outside the prescribed ERASE row.

Item-by-item analogue of transport-map items 4-7:

- **Item 4 (seed-mask identities).** The endpoint needed `native_decide
  +revert` identities `maskOfFinset {7,8,e,f} = fixedRow.support`
  (`EndpointClassifierSound.lean:47/:57`). Here seeds are enumerated as raw
  masks, so the analogue is a single generic roundtrip
  `maskOfFinset (labelsOfMask s) = s` for `s < 2048` (one `decide`), plus a
  per-cell fixed-row lemma `rowOfPattern P c₀ = ⟨c₀, s⟩` derived from
  `row P c₀ = labelsOfMask s`. Simpler than the endpoint case.
- **Item 5 (ClassifierSound additions).**
  `localCandidateSpec_of_incidenceOK_erasedRowShellOK` — mechanical
  restatement of `localCandidateSpec_of_incidenceOK_pinnedShellOK`
  (`Census554/CapSelectedNativeClassifierSound.lean:57`); the only consumed
  shell conjunct is `deleted ∈ row P 0` (endpoint precedent:
  `EndpointClassifierSound.lean:98-155`), then
  `rowOfPattern_mem_candidateRows_erased` verbatim from the endpoint shape.
- **Item 6 (Coverage restatements).** Parametric-`c₀` forms of the
  right-family fork the endpoint already built once:
  `allKilledAt_eq_false_of_semanticTrace` (cf.
  `EndpointClosureSound.lean:161`), `variableCentersAt_nodup/lt_eleven/ne_c₀`
  (cf. `:305-318`), and the two placement-check coverage lemmas
  (cf. `:47/:133/:322/:408`).
- **Item 7 (ClosureSound assembly).** Blocker-source witness at `c₀`: take
  `source := pin` (conjuncts `pin ∈ row P c₀` and
  `∀ q ∈ row P c₀, blocker q = c₀` give `blocker pin = c₀`; endpoint
  precedent `exists_blockerSource_endpointLeft/Right`,
  `EndpointClosureSound.lean:436/:450`). Then
  `exactSeedOffCircleCoreAt_sound` (parametric port of
  `exactEndpointOffCircleCoreAt2_sound`, `:466`),
  `row_eq_rowOfPattern_c₀_of_find?_eq_some` (parametric port of `:499`),
  per-cell dispatchers, and finals
  `closureCoreAlternative_of_incidenceOK_erasedRowShellOK` per family — all
  targeting the **unchanged** `ClosureCoreAlternative P blocker`
  (`CapSelectedFiniteCode.lean:472`), which is seed-independent (transport
  map, headline 1).

### 3.1 Real-geometry facts each enumerated placement transports to

Consumer-side chain per hole, at card 11 (all cited producers committed):

1. `CanonicalLabeling L` —
   `exists_boundaryBlocks_of_isM44_surplus_card_eq_six`
   (`CapSelectedGeometry.lean:531`) + `nonempty_canonicalLabeling`. Inputs:
   `hne hconv hK4 hM44 hcard6` only. **The five-input scaffold is not
   load-bearing on the card-11 path** (it is on the card-10 path, §4.2).
2. Prescribed carrier `F` — `exists_faithfulCarrierPattern_with_class`
   (`EndpointCertificate/BridgeCarrier.lean:70`) with
   `K := SelectedFourClass.ofSelectedClass` built from the hole's exact
   class: `ErasedPinTriple` ⇒ card-4 selected class through `x` at `p`
   (`WitnessPacketInterface.lean:198/:205` and the converse used at HEAD
   `Continuation.lean:170-176` via `u5ExactRadiusClassCard_of_erasedPinTriple`).
3. `IncidenceOK (patternCode L F)` — `incidenceOK_patternCode`
   (`CapSelectedCarrierBridge.lean:1100`; needs `hcard6`).
4. Bucket-count conjuncts — transport the hole's
   `moserCount/sameCapCount/leftAdjCount/rightAdjCount` facts
   (`SurplusM44Packet.lean:990-1010`) through the labeling's cap identities
   (`CanonicalLabeling.surplusInterior_eq/oppInterior1_eq/oppInterior2_eq`,
   `CapSelectedGeometry.lean:145-151`) and the row decomposition pattern of
   `endpointLeft_row_one_eq` (`BridgeCarrier.lean:122`) /
   `labelsOf_insert_of_mem`. New but mechanical; the adjacency convention is
   already cross-checked (§0). NOTE: `capS = {1,2,3,4,5,6}` includes the
   Moser endpoints `v,w`, while the row sigs count all of `{u,v,w}` in the
   `m` bucket — the transport lemmas must bridge the two conventions
   explicitly (this is bookkeeping, but it is the single most
   error-prone step; pin it with `decide`-checked label-set identities).
5. Blocker system — **finite-map override, not a whole-class
   `CriticalShellSystem` override.** `ErasedPinTriple` proves that the
   prescribed row is an exact full four-point selected class, but it does not
   prove that deleting every member of that class destroys every possible
   four-class at `c₀`.  Therefore the endpoint lane's
   `overrideExactSelectedClass` premise is unavailable here.  The implemented
   M6 replacement (`ErasedCertificate/CardElevenBlocker.lean`) starts with the
   minimal critical-shell system and defines the finite blocker to be `c₀`
   on the prescribed row and the canonical critical-shell blocker elsewhere.
   It proves no fixed points, blocker-row membership, and row-`c₀` routing
   directly.  Exactness at `c₀` follows from the prescribed full
   `SelectedClass`; exactness elsewhere reuses `exactAt_endpointBlocker`.
   This supplies precisely the seed-independent final consumer
   `false_of_closureCoreAlternative_of_canonical` without asserting an
   unjustified geometric deletion theorem.
6. Final consumer — `false_of_closureCoreAlternative_of_canonical`
   (`BridgeAssembly.lean:326`): takes `(L, F, hconv, hexact, hcore)`,
   twelve-branch, seed-independent, **reusable as-is** (its inputs mention no
   endpoint data).
7. P4-U special case: the seed row IS row 0, so `deleted := pin` and
   `deleted ∈ row P 0` is immediate.  The stale deleted-blocker inequality is
   absent from every ERASE shell family: the committed soundness chain never
   consumes it, including at `c₀ = 0`.

## 4. Bridge + dispatch

### 4.1 Per-row consumer shape (the 20 former P2 holes)

For each redrafted row theorem `false_of_erasedRow_<side>_<sig>`:

```
intro (ambient) (scaffold) (row facts: p-membership, x-membership, counts)
have hm : S.surplusCap.card ≤ 6 := surplus_card_le_six_of_convexIndep_K4 …
-- m ∈ {5,6} via surplus_card_eq; interval_cases / rcases:
case m = 6 (A.card = 11):  §3.1 chain → ErasedRowShellOK → per-cell
  classifier final → ClosureCoreAlternative → false_of_closureCoreAlternative_of_canonical
case m = 5 (A.card = 10):  ten-label bank route (§4.2)
```

Row-to-cell selection: the hole's counts pick the `(side, center, sig)` cell;
the enumeration-completeness `decide` lemma (§2.1) places the transported
support in the cell's list; the cell's `native_decide` verdict feeds the
coverage lemmas. Rows realizable only at one card ((0,0,0,4)/(0,0,4,0) need
four surplus interiors, so only `m = 6`; their `m = 5` arm is a count
contradiction against `intS` size 3 — cheap, no search).

### 4.2 Card-10 arm (P2 rows)

**Implementation checkpoint (2026-07-12).**

- `ErasedCertificate/CardTenProducer.lean` now contains the source-clean
  label-complete producer
  `false_of_erasedPinFixedSeed_of_cardTen_selectedClasses_{ccwHull,
  reflectedCcwHull}`.  It assembles selected classes at all ten labels,
  derives the relaxed-shape count/no-three/separation interfaces, and invokes
  the committed 330-seed bank consumer.
- The right terminal row `(2,1,0,1)` and left terminal row `(2,1,1,0)` are
  instantiated end-to-end by
  `false_of_{right,left}OneSidedErasedPayload_of_cardFive`.  These theorems
  handle both ambient apex orientations and are wired into the public terminal
  residual theorems in `ErasedPinRowResiduals.lean`.
- The pure surplus-side rows `(0,0,0,4)` and `(0,0,4,0)` are discharged at
  card 10 by a direct cardinality contradiction: their four-point selected
  class is confined to the three-point strict surplus-cap interior.
- The other sixteen count rows are instantiated through normalized right/left
  label packages, row-specific private-mask extraction, and the existing
  candidate-to-fixed-bank coverage theorems.
- All twenty public residuals are source-clean card dispatchers. Their card-10
  and card-11 children are closed, and the kernel-mined spines confirm that
  neither branch reaches `sorryAx`.

Consumer: `false_of_erasedPinFixedSeedRelaxedShape_pointClasses`
(`SurplusCOMPGBankGeometry.lean:10761`). The new work is the label-complete
producer (ten-label sibling of `GeometryProducer.lean`) discharging its side
conditions from the hole hypotheses at `A.card = 10`:

- `hv/hwMask` (exact opposite-cap masks at `.v/.w`) — now PROVEN from
  `hK4`, `hcontain`, and the exact opposite-cap cardinalities supplied by
  `hM44`; the endpoint/pinned residual inputs are not needed on the completed
  terminal card-10 path.
- `hprivate` (seed private mask = the row's class) — PROVEN for all twenty
  rows using the existing erased-row seed/private-mask producers.
- `hcard/hself` (card-4 mask, self-exclusion at every non-v/w center) — from
  `hK4` + label-completeness (every selected class ⊆ A = the ten labels).
  This is exactly the (Q)-flavor confinement that is FREE at card 10 and
  unavailable at card 11.  PROVEN in the generic producer using
  `exists_labelCompleteSupportClasses` and the bank's certified private-mask
  cardinality/self facts.
- `hno3/hcounts/hsep/hsearchSep` — PROVEN generically from same-radius
  selected classes and the generated/reflected convex hull order.
- `hseed : seed ∈ erasedPinFixedSeeds` — PROVEN for all bank-driven rows by
  their existing `*_seeds_candidates_subset_fixed` theorems; the two pure
  surplus-side rows close by cardinality before invoking the bank.

### 4.3 The 2 former P4 holes — card-10 and card-11 closure

- **Card 11: COMPLETE in `652fdfcb`.** Seed centers `0` (apex,
  `point_zero_eq_opposite`) and `3..6` (`intS`) are ordinary `Fin 11` seed
  families (§1.2); the §3.1 chain is implemented. The
  classifier need
  **not** produce `RowwiseConfinedQDeletedClasses`
  (`U3ToU5Terminal.lean:296`) and does not need to: Route A's 8-point
  confinement is bypassed because `FaithfulCarrierPattern` confines every
  class to `A` = the 11 labels by construction, which is what the census
  vocabulary needs. The holes are discharged directly; the historical
  audit-frame derivations above the former holes were unused on this path.
  Both residual
  declarations call the corresponding card-eleven finals.  P4-S and P2 build
  through their standalone terminals and shared downstream parent; the
  exact-pin ERASE subtree is 0/1376 open.
- **Card 10: PROVEN and wired.** The bank extension enumerates all 504
  relaxed-shape seeds: 168 at `.u` and 112 at each of `.s1`, `.s2`, `.s3`.
  The independent eight-process Python DFS found zero survivors
  (EMPIRICAL generation gate).  Lean then partitions the complete bank into
  378 seeds contradicted immediately by one of the two fixed-cap
  cross-separation equations and a 126-seed compatible grid.  The grid has
  72 P4-U seeds and 18 seeds at each P4-S center; `native_decide` proves all
  seven grid shards empty (one P4-U shard and two nine-seed shards for each
  P4-S center).  The membership, partition, mask-extraction, and dispatcher
  theorems are ordinary Lean proofs around those native certificates.
- `false_of_surplusOppositeErasedPinTriple_of_cardFive` and
  `false_of_surplusInteriorErasedPinTriple_of_cardFive` construct the complete
  P4 seed from the geometric triple and invoke that bank.  `Continuation.lean`
  dispatches both parent arms by surplus-cap card: card five reaches these
  proved consumers; card six reaches explicitly named card-eleven residuals.

Thus both card-ten and both card-eleven P4 source arms are closed.  The
card-eleven targets and their downstream parent build with the completed P2
fleet.

## 5. Risk list

- **R1 — scale vs the template.** Endpoint had one forced configuration
  family (card 11 only, 64 placements); ERASE has 4543 M1 cells.  The compiled
  full-domain gate completed in about 14.1 minutes, so search feasibility is
  resolved empirically.  Both proof fleets are built.  P2 cold-build risk is
  resolved operationally by 128 independent native leaves, a balanced 21–25
  active-search range (formerly 0–65), hoisted candidate-domain setup, and a
  restart-safe wrapper capped at eight explicit leaves.  Late uncached batches
  took 13m04s–18m22s; the final cached 16-batch rerun passed.  Further cold-build
  acceleration is optional and would require an externally generated
  killed-tree/nogood witness with a small verified Lean checker, not another
  compiler-option tweak.
- **R2 — all card-11 searches kill: RESOLVED EMPIRICALLY.**  The complete M1
  run returned true on all 4543 cells for the exact committed detector suite
  (duplicate-center / exact-off-circle / perp-bisector / convex-five-point
  cores).  P4-U, P4-S, and P2 are kernel-connected through native certificates
  and soundness theorems.
  What ERASE-P3-MAP's PROVEN-tier SAT
  survivors mean, precisely: the census's count-level PROVEN cuts plus its
  global count-DFS do **not** refute these classes
  (`ep3map.py:36-44` — aliveness is decided by the census LOCAL cut
  vocabulary + `solve_global`). They do NOT mean the Lean classifier fails:
  the native detectors are equality-closure cores powered by `hK4`-derived
  facts the census engine does not model (the same relationship held in the
  pinned and endpoint lanes, whose trees all died). What they DO rule out is
  any count-only shortcut; every kill must come from the core suite, so
  deep trees are possible.  M1 has now discharged the STOP condition; P4-U
  P4-U, P4-S, and P2 are kernel-connected.
- **R3 — Route-B witnesses bound what any cut may use.** The exact-rational
  card-10 witnesses `SO_t2_PuQ1`, `SI_c-s1_Q2vPu`
  (`scratch/erased-pin-row-truth/STATE.md`, P4 audit Route B) satisfy the
  five ambient inputs + `ConvexIndep` + `IsM44` + minimality-at-card-10 and
  realize both pins. Any sound closure MUST consume `hK4`-everywhere — the
  classifier does (via `FaithfulCarrierPattern` at all 11 centers; via
  `hcard` at all ten labels in the bank lane). A design that only uses the
  hole's local five-input surface is provably impossible; this is a
  correctness constraint on every new producer lemma, not just a warning.
- **R4 — parametric detector fork.** RESOLVED for the implementation and P4-U
  consumer.  Nine seed-center literals force the parametric `c₀` fork
  (§2.1); its soundness proofs generalize the committed
  center-1 proofs over `c₀`. The endpoint fork (1 → 2) was audited as ~5
  literal sites; a missed site produces a detector firing at the wrong
  center whose verdict the transport cannot consume (this exact failure mode
  is documented in transport-map headline 3). Mitigate: never reuse the
  committed `hasPrefixCore` when `1 ∈ variableCentersAt c₀`.
- **R5 — landed hole statements. RESOLVED.** The 20-row list, exact hypothesis
  packaging, and terminal payload interfaces have been checked against the
  landed source. `CardElevenShellBridge.lean` implements the orientation-aware
  right/left count-convention bridge and both P4 shell bridges.
- **R6 — card-10 coverage.** RESOLVED for P2 and P4: the generic producer,
  exact-cap masks, every row-specific P2 bank instantiation, both pure-row
  cardinality closures, the complete 504-seed P4 bank, and both P4 consumers
  are proved and wired.  The card-eleven lane is now complete as well.
- **R7 — non-finiteness / undecidability: none.** The domain is masks over
  `Fin 11` / ten roles; predicates are the committed decidable code. The
  only failure mode is a `false` verdict — a mathematical outcome, not an
  encoding one.
- **R8 — build freeze. RESOLVED for ERASE.** Card 10, card-11 P4-U/P4-S, the
  complete P2 placement fleet, `P2Closure`, residual shard, and downstream
  `Continuation` target build.  Axiom and exact-pin spine gates pass.  Global
  publication remains separately gated by Front A and shared-tree state.

## 6. Work plan (ordered; entry gates; parallelism)

Historical entry gates G-A (ERASE-P2 redraft and lifted build freeze) and G-B
(approved classifier computation) both passed. The P3 diagnostic lane remains
optional and separately gated.

- **M1 — eval gate (COMPLETE 2026-07-12).** The compiled executable evaluated
  the exact 4543-cell domain with eight Lean runtime threads and returned
  P4-U 47/47, P4-S 1440/1440, P2 3056/3056 true in 845205 ms.
- **M2 — `ErasedNativeClassifier.lean` (COMPLETE):** parametric definitions,
  fixed P4-U rows, and all four shell records (§2.1, §3).
- **M3 — placement certificates (COMPLETE):**
  `P4UPlacements.lean` supplies the closed native theorem and complete semantic
  support/deleted dispatch.  `P4SPlacements.lean` and its 128 leaves are built.
  `P2Placements.lean` and its 128 balanced leaves are implemented and built.
- **M4 — classifier soundness (COMPLETE):**
  `ErasedClassifierSound.lean`, `ErasedClassifierCoverage.lean`, and
  `CardElevenShellBridge.lean` cover the generic transport and the fixed-row
  P4-U specialization.  P4-S and P2 semantic dispatchers build and are audited.
- **M5 — closure soundness (COMPLETE):**
  `ErasedClosureSound.lean`, `P4UClosure.lean`, `P4SClosure.lean`, and
  `P2Closure.lean` extract the closure-core alternative and consume all twelve
  geometric branches.  P2 and both P4 families are target-built.
- **M6 — bridge staging/carrier (COMPLETE 2026-07-12):**
  `CardElevenBridgeStaging.lean` implements exact-count-row →
  `ErasedPinTriple`, the prescribed faithful carrier, canonical center/pin
  label facts, and orientation-correct Moser/same/left/right bucket transport.
  `CardElevenBlocker.lean` implements the sound finite-map blocker replacement
  and exactness split described in §3.1 item 5, then packages complete
  right/left count-row geometry and both P4-U/P4-S geometry families.  Thus
  all twenty-two consumers have the proof-facing carrier package consumed by
  the finite classifier result. The serialized target build passed (8173
  jobs), proof-blueprint indexed both modules, and the principal staging and
  geometry-package theorems have exactly the core-only axiom surface
  (`propext`, `Classical.choice`, `Quot.sound`).  M6 remains independent of
  M3-M5.
- **M7 — per-row consumers (COMPLETE):**
  `surplusOppositeErasedPinTriple_cardEleven_residual_excluded` is wired and
  spine-closed.  The P4-S and twenty P2 residual declarations are wired,
  target-built, and absent from the refreshed open spine.
- **M8 — card-10 P2 lane (COMPLETE)**: generic label-complete producer,
  `hv/hw`, all eighteen bank-driven rows, and both pure surplus-side rows are
  PROVEN and wired (§4.2).  Independent of M2-M7.
- **M9 — card-10 P4 lane (COMPLETE)**: complete `u`/`s`-centered seed
  generation, empirical DFS gate, optimized Lean routing and native shards,
  producer proofs, and `Continuation` wiring (§4.3).
- **M10 — wiring + spine check (COMPLETE in `652fdfcb`):** all twenty
  P2 and both P4 parent arms dispatch to card-ten/card-eleven consumers.
  `Continuation` builds, aggregate/downstream axiom audits contain no
  `sorryAx`, and the exact-pin subtree is kernel-complete.

The accepted generated tree is preserved under CTRL-GIT at `652fdfcb`. The
next repository-wide step is the full-build/publication sequence after Front A
closes. A witness-checker redesign is optional follow-on performance
work; it is not required for ERASE logical closure.

## 7. Source index (verification trail)

The current implementation is committed at `652fdfcb`. The historical source
locations below record the design inputs; declaration names, not old line
numbers, are authoritative:

- Cards: `CapSelectedRowCounting.lean:765/:802/:813`;
  `Cap/PartitionFromMEC.lean:443/:448/:457`.
- Historical holes/scaffold: `Continuation.lean:107/:183/:211/:312/:337` and
  `Base.lean:9168-9192`; all cited ERASE holes are now closed.
- Template chain: `Census554/CapSelectedFiniteCode.lean:33-229/:472`;
  `Census554/CapSelectedNativeClassifier.lean:108/:116/:215/:260/:304-322`;
  `Census554/CapSelectedNativeClosureSound.lean:751/:765/:825/:839/:852`;
  `EndpointCertificate/EndpointNativeClassifier.lean`;
  `EndpointPlacementDispatch.lean`; `EndpointClassifierSound.lean`;
  `EndpointClosureSound.lean`; `BridgeStaging.lean:178`;
  `BridgeCarrier.lean:70/:122`; `BridgeAssembly.lean:119/:240/:326/:376/:467`;
  `Census554/CapSelectedCarrierBridge.lean:33/:1100`;
  `Census554/CapSelectedGeometry.lean:143/:157/:531`.
- ERASE finite side: `ErasedPinFixedSeedDFS.lean:22` (+ center tally);
  `SurplusCOMPGBankGeometry.lean:10761`;
  `ErasedCertificate/CardTenProducer.lean` (implemented card-10 producer and
  terminal consumers); `ErasedCertificate/CardTenP4SeedDefs.lean` and
  `CardTenP4Seed{P4U,P4S1,P4S2,P4S3,DFS}.lean` (complete P4 routing and native
  certificate bank); `scripts/erased-pin-card-ten-p4-bank.py` and
  `certificates/surplus/erased_pin_card_ten_p4_bank.json` plus
  `certificates/surplus/reports/erased_pin_card_ten_p4_bank.md`;
  `ErasedCertificate/ErasedNativeClassifier.lean`,
  `ErasedClassifier{Sound,Coverage}.lean`, `ErasedClosureSound.lean`,
  `CardElevenShellBridge.lean`, `P4UPlacements.lean`, and `P4UClosure.lean`
  (card-eleven P4-U certificate, transport, and final consumer);
  `WitnessPacketInterface.lean:198/:205`; `SurplusM44Packet.lean:990-1010`;
  `U3ToU5Terminal.lean:208/:296/:310`.
- Diagnostics: `scratch/erase-p3-map/{ep3map.py, inventory.json,
  roundtrip_results.json, witness_validation.json}`;
  `scratch/erased-pin-row-truth/STATE.md`; `domain_count.py` (this dir).
