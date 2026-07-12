# K-B-ERASE card-{10,11} finite-closure classifier — design (2026-07-12)

Design only; no Lean edits. Branch `four-point-subpacket-reduction`. This is
the "third classifier instance" both ERASE scoping audits converge on
(`docs/audits/2026-07-11-erase-p2-remainder-blocker-audit.md`,
`docs/audits/2026-07-12-erase-p4-route-scoping.md`), mapped from the committed
K-B-END-GENERAL endpoint chain
(`lean/Erdos9796Proof/P97/EndpointCertificate/`) and the K-B-PIN chain
(`lean/Erdos9796Proof/P97/Census554/CapSelectedNativeClosureSound.lean`).

Constraint honored throughout: `RemovableVertexAxiom/{Base, Continuation,
ErasedPinRowResiduals}.lean` are owned by the in-flight ERASE-P2 redraft; all
citations to them below are `git show HEAD:` reads.
`ErasedPinRowResiduals.lean` does not exist at HEAD (verified); every design
element that depends on the exact final per-row statements is marked
{{UNVALIDATED}}.

## 0. Hole surface designed against

Leaf: `Problem97.isM44NonSurplusContainmentErasedPinTripleResidualsExcluded`
(HEAD `Continuation.lean:107`), holes at HEAD `:183`, `:211` (P4), `:312`,
`:337` (P2). Intermediate statement
`IsM44NonSurplusContainmentErasedPinTripleRoutedSeedFiniteResidualRowsFactsStatement`
(HEAD `Base.lean:9168-9192`): ambient
`A hne hconv hK4 (hgt : 9 < A.card) hMin S hM44` plus the five-input scaffold

- `hend1 : S.EndpointEscapeLeftAt S.oppIndex1 … → False`
- `hend2 : S.EndpointEscapeRightAt S.oppIndex2 … → False`
- `hpin1 : S.PinnedRightSurplusResidualAt … → False`
- `hpin2 : S.PinnedLeftSurplusResidualAt … → False`
- `hcontain : S.NonSurplusMoserCapContainment`

(verified at HEAD `Base.lean:9174-9188`).

Post-redraft surface (PROVISIONAL, {{UNVALIDATED}} until the redraft lands):

- 20 per-row refutation theorems in the new
  `RemovableVertexAxiom/ErasedPinRowResiduals.lean` — goal `False`;
  hypotheses = ambient + five-input scaffold + `hK4` + `hMin` + the row's
  `(m,s,l,r)` exact-4 counts at a non-surplus center `p` through the erased
  pin `x`. The exact row list (why 20, not the 26 realizable rows of
  `scratch/erased-pin-row-truth/STATE.md`) is {{UNVALIDATED}}; this design is
  keyed by `(side, center-family, signature)` and covers the full
  26-realizable-row surface as a superset, so any landed subset is consumable.
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
| P4-U | 0 | 79 | 79 |
| P4-S | 3, 4, 5, 6 | 90 per center | 360 |

Grand total 1203 seed placements; × 4 `deleted` choices ⇒ **≤ 4812 searches**
worst case (versus 12 in K-B-PIN and 64 in K-B-END-GENERAL). Per-row
dispatch shrinks the P2 share: a single `(side, center, sig)` cell contains
only the supports realizing that row's signature (from 1 support for
`(0,0,0,4)` up to 36 for `(1,0,1,2)`, times 2 centers × 4 deleted).

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

Cell batching (per native_decide theorem), proposed:

- P2: one cell per `(side, center, sig, deleted)` or `.all`-folded per
  `(side, center, sig)` — 13 sigs × 4 centers = 52 cells, each a Boolean
  `List.all` over ≤ 36 supports × 4 deleted values.
- P4-U: cells chunked over the 79 supports (deleted folded), ~4-8 cells.
- P4-S: one cell per `(center, sig-chunk)`, ~16-24 cells.

Total ≈ 75-90 `native_decide` obligations over ≈ 4.8k DFS searches, sharded
like `EndpointNativePlacements/` (20 files, 64 theorems there; expect
~30-60 shard files here). Enumeration-completeness lemmas ("every 4-mask with
these bucket counts is in this cell's list") range over 2048 masks with
counting only — kernel-pure `decide` is feasible and preferred for those.

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
property. Axiom surface after wiring: core axioms + `Lean.ofReduceBool` +
`Lean.trustCompiler`, checked via `proof-blueprint axioms` at the leaf.

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
  (∀ q ∈ row P c₀, blocker q = c₀) ∧
  blocker deleted ≠ c₀        -- needed only when c₀ ≠ 0; see §3.1(7)
```

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
5. Blocker system — mirror of
   `exists_shellSystem_endpointBlocker_of_endpointEscapeLeft`
   (`EndpointCertificate/BridgeAssembly.lean:240`): the overridden
   `CriticalShellSystem` from `hMin`, overriding at `c₀` justified by the
   erased-pin class's exactness; exactness transport = the L11 pattern
   `exactAt_endpointBlocker` (`BridgeAssembly.lean:119`).
6. Final consumer — `false_of_closureCoreAlternative_of_canonical`
   (`BridgeAssembly.lean:326`): takes `(L, F, hconv, hexact, hcore)`,
   twelve-branch, seed-independent, **reusable as-is** (its inputs mention no
   endpoint data).
7. P4-U special case: the seed row IS row 0, so `deleted := pin` and the
   `blocker deleted ≠ c₀` conjunct pattern changes (at `c₀ = 0` the pinned
   lane's conjunct-8 analogue is vacuous/different). The shell record for the
   U family drops that conjunct; the coverage proof consumes
   `deleted ∈ row P 0` directly from `pin ∈ row P 0`. {{NEEDS_PROOF}} that
   no other chain step needs conjunct 8 at `c₀ = 0` (in the committed chain
   conjunct 8 is NOT consumed — transport map, conjunct table row 8).

## 4. Bridge + dispatch

### 4.1 Per-row consumer shape (the 20 P2 holes) {{UNVALIDATED}} statements

For each redrafted row hole `false_of_erasedRow_<side>_<sig>`:

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

Consumer: `false_of_erasedPinFixedSeedRelaxedShape_pointClasses`
(`SurplusCOMPGBankGeometry.lean:10761`). The new work is the label-complete
producer (ten-label sibling of `GeometryProducer.lean`) discharging its side
conditions from the hole hypotheses at `A.card = 10`:

- `hv/hwMask` (exact opposite-cap masks at `.v/.w`) — from the five-input
  scaffold (endpoint + pinned exclusions force the `v/w` classes onto the
  opposite caps). **Here the scaffold IS load-bearing.** {{NEEDS_PROOF}} —
  producer lemmas exist in the pinned `m = 5` lane to imitate, but the
  erased-pin variants are new.
- `hprivate` (seed private mask = the row's class) — from the row counts +
  label-completeness.
- `hcard/hself` (card-4 mask, self-exclusion at every non-v/w center) — from
  `hK4` + label-completeness (every selected class ⊆ A = the ten labels).
  This is exactly the (Q)-flavor confinement that is FREE at card 10 and
  unavailable at card 11.
- `hno3/hcounts/hsep/hsearchSep` — incidence facts with committed analogues
  in the pinned producer lane. {{NEEDS_PROOF}} per fact.
- `hseed : seed ∈ erasedPinFixedSeeds` — a bank-coverage lemma: every
  realizable `(row, privateMask)` at card 10 maps to a bank seed.
  {{NEEDS_PROOF}} (`decide` over the 330-seed list once the mask transport
  is fixed).

### 4.3 The 2 P4 holes — honest coverage assessment

- **Card 11: YES, same instrument.** Seed centers `0` (apex,
  `point_zero_eq_opposite`) and `3..6` (`intS`) are ordinary `Fin 11` seed
  families (§1.2); the §3.1 chain applies unchanged. The classifier does
  **not** produce `RowwiseConfinedQDeletedClasses`
  (`U3ToU5Terminal.lean:296`) and does not need to: Route A's 8-point
  confinement is bypassed because `FaithfulCarrierPattern` confines every
  class to `A` = the 11 labels by construction, which is what the census
  vocabulary needs. The holes are discharged directly; the audit-frame
  derivations currently sitting above the `sorry`s
  (`Continuation.lean:150-211`) become unused on this path (leave them; the
  frozen file is not ours to trim).
- **Card 10: NO, not as-is.** The committed bank has only
  `privateCenter ∈ {.Pw, .Pu}` (verified tally, §1.3) — no `u`- or
  `s_i`-centered seeds. Two options: (i) extend the bank pipeline
  (python seed generation + DFS exclusion runs + new bank shards) with
  `u`/`s`-centered seeds — same relaxed-shape machinery, and the
  label-complete producer of §4.2 covers the side conditions;
  {{NEEDS_PROOF}} that the DFS actually kills the new seed trees;
  (ii) a `Fin 10` fork of the native classifier + a card-10 carrier bridge —
  strictly more Lean surface (new vocabulary, new `incidenceOK` producer).
  Recommend (i); it stays inside one native-checked pipeline that already
  has its soundness bridge. So: the same *instrument family*, but a distinct
  card-10 sub-lane that is genuinely new work.

So the answer to "does the classifier cover the P4 holes": card-11 arm yes;
card-10 arm requires the bank extension — a real gap, sized in §6 (M9).

## 5. Risk list

- **R1 — scale vs the template.** Endpoint had ONE forced configuration
  family (card 11 only, 64 placements); ERASE has ~20 rows × 2 sides + 2 P4
  site families × 2 cards: ≈1203 card-11 seed placements / ≤4.8k searches
  (§1.2) plus a card-10 lane. Compile-budget risk at the native gate;
  mitigations: per-row cells, `.all`-folding, sharding (~30-60 files), and
  the fact that non-hole sigs never need cells.
- **R2 — the searches may not all kill (the load-bearing open question).**
  There is currently NO empirical evidence that the committed detector suite
  (duplicate-center / exact-off-circle / perp-bisector / convex-five-point
  cores) kills every ERASE-seeded tree. What ERASE-P3-MAP's PROVEN-tier SAT
  survivors mean, precisely: the census's count-level PROVEN cuts plus its
  global count-DFS do **not** refute these classes
  (`ep3map.py:36-44` — aliveness is decided by the census LOCAL cut
  vocabulary + `solve_global`). They do NOT mean the Lean classifier fails:
  the native detectors are equality-closure cores powered by `hK4`-derived
  facts the census engine does not model (the same relationship held in the
  pinned and endpoint lanes, whose trees all died). What they DO rule out is
  any count-only shortcut; every kill must come from the core suite, so
  expect deep trees. The eval gate (§6 M1) is a STOP-condition experiment,
  exactly like transport-map work item 1.
- **R3 — Route-B witnesses bound what any cut may use.** The exact-rational
  card-10 witnesses `SO_t2_PuQ1`, `SI_c-s1_Q2vPu`
  (`scratch/erased-pin-row-truth/STATE.md`, P4 audit Route B) satisfy the
  five ambient inputs + `ConvexIndep` + `IsM44` + minimality-at-card-10 and
  realize both pins. Any sound closure MUST consume `hK4`-everywhere — the
  classifier does (via `FaithfulCarrierPattern` at all 11 centers; via
  `hcard` at all ten labels in the bank lane). A design that only uses the
  hole's local five-input surface is provably impossible; this is a
  correctness constraint on every new producer lemma, not just a warning.
- **R4 — parametric detector fork.** 9 seed-center literals force the
  parametric `c₀` fork (§2.1); its soundness proofs generalize the committed
  center-1 proofs over `c₀`. The endpoint fork (1 → 2) was audited as ~5
  literal sites; a missed site produces a detector firing at the wrong
  center whose verdict the transport cannot consume (this exact failure mode
  is documented in transport-map headline 3). Mitigate: never reuse the
  committed `hasPrefixCore` when `1 ∈ variableCentersAt c₀`.
- **R5 — provisional hole statements.** The 20-row list, exact hypothesis
  packaging, and the `Core scaffold` interface are {{UNVALIDATED}} until the
  redraft lands; the count-convention bridge (§3.1 item 4) must be pinned
  against the landed statements, not this design's reconstruction.
- **R6 — card-10 producer gap.** §4.2's `hv/hw` exact-cap producers and the
  bank-coverage lemma are new geometry-adjacent obligations
  ({{NEEDS_PROOF}}); §4.3's card-10 P4 bank extension is new search compute
  (needs Adam's sign-off under the current compute constraint).
- **R7 — non-finiteness / undecidability: none.** The domain is masks over
  `Fin 11` / ten roles; predicates are the committed decidable code. The
  only failure mode is a `false` verdict — a mathematical outcome, not an
  encoding one.
- **R8 — build freeze.** No Lean eval can run until the P1b + P2-redraft
  states settle and the single full-library gate passes (coordination note);
  M1 below is gated on that.

## 6. Work plan (ordered; entry gates; parallelism)

Entry gate G-A for everything: ERASE-P2 redraft lands (holes exist as
statements) + build freeze lifts. G-B (compute): Adam approves the eval/sweep
compute (matrix marks the P3 lane OPTIONAL/{{NEEDS_ADAM_INPUT}}).

- **M1 — eval gate (STOP condition; riskiest first).** Implement the §2.1
  defs + `#eval` every cell (no theorems yet). Any `false` ⇒ STOP: the
  detector set does not close ERASE; route the failing sig to cut research
  (ERASE-P3-SWEEP vocabulary) before any transport work. Optional pre-stage
  under the freeze: a Python replica of the native DFS (EMPIRICAL only, no
  Lean claim) to get an early read. Scope: 1 module + eval driver.
- **M2 — `ErasedNativeClassifier.lean`**: parametric defs + shell records
  (§2.1, §3). Scope: 1 module, small. Gate: M1 all-true.
- **M3 — placement shards + per-cell dispatchers** (`ErasedNativePlacements/`
  + dispatch module; §2.1 batching). Largest native surface; parallelizable
  per family/center across agents once M2 lands.
- **M4 — classifier soundness** (items 4-5 analogues, §3): mask roundtrip,
  `localCandidateSpec`, `candidateRows` membership. Parallel with M3.
- **M5 — closure soundness** (items 6-7 analogues, §3): parametric coverage
  + assembly + per-family finals. After M3+M4.
- **M6 — bridge staging/carrier**: count transport (§3.1 item 4), blocker
  assembly mirror (§3.1 item 5), prescription helpers. Independent of M3-M5;
  can start at G-A in parallel with M2.
- **M7 — per-row consumers** (20 rows + 2 P4, card-11 arms; §4.1, §4.3).
  After M5+M6; embarrassingly parallel per row.
- **M8 — card-10 P2 lane**: label-complete producer sibling + bank coverage
  lemma + `hv/hw` producers (§4.2). Independent of M2-M7 (bank machinery is
  committed); can start at G-A.
- **M9 — card-10 P4 lane**: `u`/`s`-centered bank seed generation (python) +
  DFS exclusion runs + Lean bank shards + producer wiring (§4.3). Gate: G-B
  (new search compute) + M8's producer layer.
- **M10 — wiring + spine check**: fill the `ErasedPinRowResiduals.lean` and
  `Continuation.lean` holes (file ownership released by then), then
  `proof-blueprint spine` — the deliverable is the on-spine sorry reduction,
  not the lemma bank.

Parallel-dispatchable immediately after G-A: M1, M6, M8 scoping. M3/M4 fan
out after M2. M7 fans out after M5+M6.

## 7. Source index (verification trail)

All verified this session from committed state (working tree for non-frozen
files; `git show HEAD:` for frozen files):

- Cards: `CapSelectedRowCounting.lean:765/:802/:813`;
  `Cap/PartitionFromMEC.lean:443/:448/:457`.
- Holes/scaffold: HEAD `Continuation.lean:107/:183/:211/:312/:337`; HEAD
  `Base.lean:9168-9192`.
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
  `WitnessPacketInterface.lean:198/:205`; `SurplusM44Packet.lean:990-1010`;
  `U3ToU5Terminal.lean:208/:296/:310`.
- Diagnostics: `scratch/erase-p3-map/{ep3map.py, inventory.json,
  roundtrip_results.json, witness_validation.json}`;
  `scratch/erased-pin-row-truth/STATE.md`; `domain_count.py` (this dir).
