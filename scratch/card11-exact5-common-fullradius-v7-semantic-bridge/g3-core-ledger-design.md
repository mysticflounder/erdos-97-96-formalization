# G3 retained-core ledger design

Date: 2026-07-30

Status: design and live-source audit only. No production Lean files were
changed, and no build was started while the shared build lock was active.

## Goal

Authenticate every one of the 273,017 clauses parsed from G3 checkpoint
`C0000` against a semantic family witness, without:

- testing each core clause for membership in a large source list;
- constructing the full 1,370,778-clause source formula in every proof;
- exporting a theorem containing 273,017 expanded clauses or proof terms; or
- trusting the 302 MB mining JSON as a proof object.

The intended consumer is
`false_of_g3Checkpoint0_evalClauseD_sat`. The replay already proves
unsatisfiability of the exact parsed compact formula. The missing bridge is a
kernel-auditable proof that the live geometric valuation satisfies every
parsed start clause.

## Audited facts

The exact files inspected were:

- `Generated/ExactFiveCommonShellV7G3Replay/.../Checkpoint/C0000.lean`;
- `Certificate/CheckpointedRupCompactBoundary.lean`;
- `Certificate/CheckpointedRupSemanticBoundary.lean`;
- `Support/ExactFiveCommonShellV7/G3CertificateSemantics.lean`;
- the existing prefix, source-choice, selector, full-radius, and local-four
  semantic modules; and
- `scratch/.../g3-retained-semantics.json` plus its miner.

The current artifacts have these sizes:

| Artifact | Bytes |
|---|---:|
| semantic mining JSON | 302,507,169 |
| retained `core.cnf` | 4,983,482 |
| compact C0000 CPF85 text | 2,662,654 |

The retained ledger has 273,017 entries. Entry zero is selector totality. For
each later entry, pack

```text
key = 4 * original_position + route
route(common, s2_o9, s3_o0, s3_o9) = (0, 1, 2, 3).
```

Across the actual retained-core order, the 273,016 non-selector keys are
strictly increasing, with no repeats. Their measured encodings are:

| Encoding | Raw bytes | Plain base85 bytes |
|---|---:|---:|
| fixed 3-byte key | 819,048 | 1,023,810 |
| unsigned delta-varint key | 276,035 | 345,044 |

For comparison, zlib plus base85 would be 79,832 bytes, but adding a trusted
and proved Deflate decoder is not justified. The 345 KB plain base85
delta-varint stream is already small.

The retained routes are:

| Route | Count |
|---|---:|
| common | 272,902 |
| s2_o9 | 36 |
| s3_o0 | 37 |
| s3_o9 | 41 |
| selector totality | 1 |

Only 114 clauses are guarded. They occur in the inherited source tail and the
two first-apex exact-five seed families. The first common prefix is large:
108,704 retained Census554 base clauses and 45,581 retained separation
clauses.

## Required separation of responsibilities

There are three different claims and they should remain three named theorems.

1. **Ledger decoding:** the included ledger text decodes successfully to
   exactly 273,017 typed witnesses.
2. **Syntactic authentication:** rendering those witnesses, in ledger order,
   gives exactly the signed clauses parsed from the included C0000 text.
3. **Semantic soundness:** each typed witness renders a clause satisfied by
   the live valuation, using the already-banked family theorem for its
   constructor.

Only claim 2 ties the independently included ledger asset to the exact compact
checkpoint. Claim 3 must be a general Lean proof by cases on one witness; it
must not be 273,017 generated proofs.

## Recommended architecture

Use option 2, a compressed witness-code `include_str`, with a small part of
option 3 only as its serialization format:

- serialize the strictly increasing source-position/route keys;
- decode each key into a **typed family witness** by range arithmetic;
- render directly from that typed family witness; and
- never build or linearly search the full source formula.

Thus source position is a compact key, not the semantic interface.

### Data types

The exact constructor payloads should follow the encoder enumerators. A
schematic shape is:

```lean
inductive G3LedgerRoute
  | common
  | guarded (route : G3Case)

inductive G3ClauseWitness
  | selectorTotality
  | censusBase (i : Fin baseDimacs.length)
  | separationIndicator (i : Fin encoderIndicatorOccurrences.length)
  | separationSelectorTotality
  | separationGuarded (i : Fin encoderGuardedOccurrences.length)
  | inheritedSourceTail (route : G3LedgerRoute) (i : Fin sourceTailCount)
  | localEqualityTransitivity (i : Fin localTransitivityCount)
  | selectedLocalSeed (i : Fin selectedLocalSeedCount)
  | sourceCenterIff (i : Fin sourceCenterIffCount)
  | usedCenterIff (i : Fin usedCenterIffCount)
  | exactBlocker (i : Fin exactBlockerCount)
  | noQFree (i : Fin noQFreeCount)
  | firstApexLocal (route : G3LedgerRoute) (i : Fin firstApexLocalCount)
  | globalEqualityTransitivity (i : Fin globalTransitivityCount)
  | selectedGlobalSeed (i : Fin selectedGlobalSeedCount)
  | firstApexGlobal (route : G3LedgerRoute) (i : Fin firstApexGlobalCount)
  | duplicateCenter (i : Fin duplicateCenterCount)
  | perpendicularBisector (i : Fin perpendicularBisectorCount)
  | convexFiveForward (i : Fin convexFiveForwardCount)
  | localFourIff (i : Fin localFourIffCount)
  | qDeletedPairIff (i : Fin qDeletedPairIffCount)
  | u5Nontriple (i : Fin u5NontripleCount)
  | u5CommonBisector (i : Fin u5CommonBisectorCount)
  | parity (i : Fin parityCount)
```

The final implementation can split multi-clause families into more precise
constructors if that makes `renderWitness_sat` simpler. In particular, a
transitivity ordinal should decode by quotient/remainder into a triple and
one of its three clauses, rather than searching a list for that ordinal.

Use `Array` for large source enumerations. Do not call `List.get` at a large
source position for every retained clause.

### Compact boundary

Keep the decoded array behind a named definition:

```lean
def g3RetainedLedgerText : String :=
  include_str "...sha256....g3w85"

def decodeG3RetainedLedger (text : String) :
    Option (Array G3ClauseWitness) := ...

def g3RetainedLedger : Array G3ClauseWitness :=
  (decodeG3RetainedLedger g3RetainedLedgerText).getD #[]

def renderG3Witness : G3ClauseWitness → List Int := ...
```

The decoder must be ordinary safe Lean code: no `unsafe`, `extern`,
`implemented_by`, or runtime file reads. `include_str` makes the exact asset
part of the source boundary.

### Authentication theorems

The main computational theorem should compare ordered arrays/lists once:

```lean
set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
theorem g3RetainedLedger_decodes :
    (decodeG3RetainedLedger g3RetainedLedgerText).isSome = true := by
  native_decide

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
theorem g3RetainedLedger_size :
    g3RetainedLedger.size = 273017 := by
  native_decide

set_option maxHeartbeats 0 in
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
theorem g3RetainedLedger_render_eq_checkpoint0 :
    g3RetainedLedger.toList.map renderG3Witness =
      signedClausesOfFormula
        (formulaOfCompact
          (n := ExactFiveCommonShellV7G3Replay.n)
          ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text) := by
  native_decide
```

The ordered equality authenticates clause contents, multiplicity, and order.
It also prevents a silent empty fallback from authenticating the real ledger;
the explicit decode and size theorems make that fact easy to audit.

Do not produce one equality theorem per clause. Do not expose the decoded
273,017-element array in a theorem statement as a literal.

### Semantic theorem

Collect the already-proved family contracts into one non-data-heavy record or
conjunction:

```lean
def CanonicalPacket.G3AllFamilySat
    (P : CanonicalPacket L) (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) : Prop :=
  P.ShellCasePrefixFamilySat ∧
  FullSourceChoiceFamilySat P shadow ∧
  -- remaining local/global/full-radius family contracts
  ...
```

Then prove one generic dispatcher:

```lean
theorem CanonicalPacket.renderG3Witness_sat
    (P : CanonicalPacket L)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case)
    (hfamilies : P.G3AllFamilySat shadow selected)
    (w : G3ClauseWitness) :
    evalClauseD (P.fullRadiusValuation shadow selected)
      (renderG3Witness w) = true := by
  cases w with
  | selectorTotality =>
      exact P.g3SelectorTotalityClause_sat selected
  | censusBase i =>
      -- transfer to the inherited/base valuation, then use
      -- hfamilies.base on Array.get_mem/List.get_mem
      ...
  | firstApexGlobal route i =>
      apply P.g3GuardedClause_sat
      intro hroute
      subst route
      exact hfamilies.firstApexGlobal ...
  | ... => ...
```

For guarded witnesses, use `g3GuardedClause_sat`: an unselected route closes
from its negative selector; only the selected route invokes payload
semantics. For common source-tail clauses, case-split on `selected` and use the
corresponding shell-family contract. Any equality between case-specific
renderers should be proved once by the source decoder, not by searching the
retained core.

Finally transfer through the authenticated map:

```lean
theorem CanonicalPacket.g3Checkpoint0_allClauses_sat
    (...)
    (hfamilies : P.G3AllFamilySat shadow selected) :
    ∀ clause ∈
      (formulaOfCompact
        (n := ExactFiveCommonShellV7G3Replay.n)
        ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text).toList,
      evalClauseD (P.fullRadiusValuation shadow selected)
        (signedClauseOfDefault clause) = true := by
  intro clause hclause
  have hsigned :
      signedClauseOfDefault clause ∈
        signedClausesOfFormula
          (formulaOfCompact
            (n := ExactFiveCommonShellV7G3Replay.n)
            ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text) :=
    List.mem_map.mpr ⟨clause, hclause, rfl⟩
  rw [← g3RetainedLedger_render_eq_checkpoint0] at hsigned
  obtain ⟨w, hw, rfl⟩ := List.mem_map.mp hsigned
  exact P.renderG3Witness_sat shadow selected hfamilies w
```

This proof uses ordinary list membership only on the result of `map`, where
`List.mem_map` immediately produces the witness. It does not scan any source
family.

## Comparison of the three options

### 1. Direct raw-clause classifier plus `native_decide`

Shape:

```lean
def classifyClause : List Int → Option G3ClauseWitness := ...

theorem classifyClause_sound
    (h : classifyClause clause = some w) :
    renderG3Witness w = clause := ...

theorem checkpoint0_all_classified :
    (signedClausesOfFormula checkpoint0).all
      (fun c => (classifyClause c).isSome) = true := by
  native_decide
```

Advantages:

- no second data asset;
- one linear scan is possible if classification is true bounded decoding.

Problems:

- 42 observed literal shapes are not themselves semantic proofs;
- repeated or ambiguous raw clauses make inverse classification delicate;
- inherited base clauses require a proof of membership in `baseDimacs`;
- a classifier implemented as `baseDimacs.contains clause` for each retained
  base clause would perform roughly
  `108704 * 207969 > 22 billion` candidate comparisons;
- a precomputed hash table would itself need an authenticated semantic ledger;
  and
- the generic `classifyClause_sound` theorem is substantially harder than the
  family renderer theorem because it must invert all encodings from raw
  integers.

Expected cost: acceptable only if every branch is bounded arithmetic decoding.
Any list-membership fallback is prohibitive. The proof-development risk is the
highest of the three options.

Verdict: do not start here.

### 2. Compressed typed witness-code `include_str` plus renderer equality

Advantages:

- only 345,044 bytes for the measured uncompressed base85 delta stream;
- one linear decoder and one linear renderer/equality check;
- semantic proof is by 22 family cases, not 273,017 clause cases;
- exact ordering, duplicate clauses, and omissions are authenticated against
  C0000;
- no large generated Lean syntax;
- family constructors point directly to existing aggregate semantic theorems.

Expected cost: parse the 2.66 MB C0000 text, decode 345 KB of witness text,
render 273,017 short clauses, and compare them once. This should remain linear
and should be in the same broad class as existing large `native_decide`
boundary checks: plausibly tens of seconds to a few minutes and hundreds of
MB, but it needs an isolated measured build before promotion. The estimate is
not yet a benchmark.

Verdict: recommended.

### 3. Source-position decoder

A pure source-position design stores retained positions and reconstructs the
source formula at those positions.

Advantages:

- essentially the same 345 KB retained-position stream;
- source position is easy to audit against the Python miner.

Problems:

- building the whole source formula handles 1,370,778 clauses even though only
  273,017 survive;
- calling `List.get` independently at each retained position is quadratic;
- exact source order includes Python filtering and deduplication, especially
  the convex-five family;
- the four case formulas differ at some positions, so common-route decoding
  must authenticate cross-case equality; and
- mirroring the entire Python source-position generator in Lean is a larger
  trusted theorem surface than rendering typed local witnesses.

An O(1) arithmetic source decoder avoids those costs, but once it splits the
position into family and local ordinal it has become the recommended typed
witness architecture.

Verdict: use source position only in the compact serialization and audit
report, not as the semantic API.

## Complexity guardrails

The implementation should reject designs containing any of these patterns:

- `∀ coreClause, coreClause ∈ sourceFamily`;
- `sourceFamily.find?` or `.contains` inside the 273,017-entry traversal;
- `List.get` at source positions inside that traversal;
- construction of the full four 1.37-million-clause case formulas merely to
  select retained clauses;
- a generated Lean list literal with hundreds of thousands of witnesses;
- one declaration or proof per retained clause; or
- a decompressor relying on unsafe/native-only code.

Use:

- a single delta-varint/base85 decode;
- `Array` for any large indexed enumeration;
- quotient/remainder decoding for repeated clause schemas;
- one opaque `native_decide` renderer equality; and
- one ordinary theorem by cases on `G3ClauseWitness`.

## Recommended first implementation slice

Implement selector totality plus the first retained Census554 base block:
108,705 consecutive core clauses in total.

Use:

```lean
inductive G3PrefixWitness
  | selectorTotality
  | censusBase (i : Fin baseDimacs.length)
```

The ledger slice stores the selector implicitly and the 108,704 retained base
source positions as delta-varints. Convert `baseDimacs` to one shared `Array`
before indexed rendering.

Prove:

```lean
theorem g3BaseSlice_size :
    g3BaseSlice.size = 108705 := by native_decide

theorem g3BaseSlice_render_eq :
    g3BaseSlice.toList.map renderG3PrefixWitness =
      (signedClausesOfFormula checkpoint0).take 108705 := by
  native_decide

theorem CanonicalPacket.renderG3PrefixWitness_sat ... :
    evalClauseD valuation (renderG3PrefixWitness w) = true := by
  cases w with
  | selectorTotality => exact P.g3SelectorTotalityClause_sat selected
  | censusBase i =>
      exact -- valuation transfer plus BaseSeparationFamilySat/baseDimacs_sat
```

This slice is large enough to expose parsing, allocation, and accidental
quadratic behavior, while its semantic side is already banked. Record elapsed
time and peak RSS for the isolated module.

If it is healthy, extend the same prefix to the 45,581 retained separation
clauses, giving 154,286 authenticated clauses. Then add the 114 guarded
clauses as the first route-dispatch test. Only after those two tests should the
remaining local/full-radius families be added.

## Conclusion

The smallest auditable production boundary is not the 302 MB decoded JSON and
not a raw-clause membership classifier. It is:

1. a 345 KB included delta-varint witness stream;
2. a safe decoder to typed family witnesses;
3. one `native_decide` equality against the exact parsed C0000 clauses; and
4. one generic family-dispatch theorem proving the renderer semantically
   sound.

That design authenticates the exact retained core while keeping both
computation and proof size linear.

## Implementation appendix: exact first-slice payload

This appendix fixes the concrete payload and renderer for the first promotion
slice.  It is a design for a new ledger module; it does not require changes to
`G3ClauseFamilySemantics.lean`.

### Exact boundary

The retained-semantics ledger gives the following exact C0000/core order:

| C0000 core positions (one-based) | count | source |
| --- | ---: | --- |
| `1` | 1 | `g3SelectorTotalityClause` |
| `2 .. 108705` | 108,704 | common-route retained clauses from `baseDimacs` |
| `108706` | 1 | first retained separation clause |

For the base portion:

- every entry has route `common`;
- `g3_input_clause_id = original_position + 1`;
- the 108,704 source positions are strictly increasing;
- their minimum is 1 and maximum is 207,114; and
- the next retained entry has original position 207,970 and family
  `inherited-separation`.

Thus `take 108705` is an exact family boundary in C0000, even though the
retained base source positions themselves are sparse.  Against the current
`baseDimacs = onehotClauses ++ c2Clauses ++ c4Clauses` order, the retained
counts are:

| base constructor | source-position interval | retained count |
| --- | ---: | ---: |
| `onehotClauses` | `1 .. 5836` | 5,105 |
| `c2Clauses` | `5837 .. 149719` | 84,559 |
| `c4Clauses` | `149720 .. 207969` | 19,040 |

These counts sum to 108,704.  The last ten retained source positions are
`207084, 207095, 207099, 207101, 207105, 207108, 207109, 207110, 207111,
207114`.

### Typed semantic payload

Use the existing aggregate `baseDimacs` constructor as the semantic index
space.  Do not copy raw clauses into the witness:

```lean
abbrev CensusBaseIndex := Fin baseDimacs.length

inductive G3BaseSliceWitness
  | selectorTotality
  | censusBase (sourceIndex : CensusBaseIndex)
```

The `Fin` value is the zero-based index into `baseDimacs`.  The serialized
ledger position is one-based, so decoding source position `p` constructs
`censusBase ⟨p - 1, ...⟩` after checking
`0 < p ∧ p ≤ baseDimacs.length`.

This single base constructor is preferable to three payload constructors for
the first slice:

- it matches the already-proved semantic theorem
  `CanonicalPacket.baseDimacs_sat`;
- it avoids duplicating the append-boundary arithmetic in the trusted
  renderer; and
- the onehot/C2/C4 counts above remain an external audit decomposition rather
  than proof-critical metadata.

### Wire payload

Store the selector witness implicitly as the first entry.  Store the 108,704
one-based base source positions as strictly increasing delta-varints.  For
this slice the direct-position stream is:

- 108,716 decoded bytes;
- 135,895 Python-base85 characters;
- SHA-256 of decoded bytes
  `5281327aca49a9afaa52517f6fd9be0eade5b9f1684eb278c5883bb317219176`;
- first positions `1, 2, 3, 4, 5, 6, 7, 8, 9, 10`; and
- maximum source-position delta 1,363.

The decoder must reject zero deltas, trailing/incomplete varints, a decoded
length other than 108,704, a position exceeding `baseDimacs.length`, or a
non-strict position sequence.  The selector is not encoded as a fake source
position.

If the production module instead reuses the proposed full-ledger packed key
`(original_position << 2) | route`, every key in this slice has route bits
zero.  That stream is 108,951 decoded bytes.  Either representation is sound;
direct positions are smaller for this isolated slice, while packed keys avoid
a later wire-format migration.  The typed result must be the same
`Array G3BaseSliceWitness`.

### O(1) renderer

Materialize the existing list once:

```lean
private def baseClauseArray : Array (List Int) :=
  baseDimacs.toArray

def renderG3BaseSliceWitness : G3BaseSliceWitness → List Int
  | .selectorTotality => g3SelectorTotalityClause
  | .censusBase i =>
      baseClauseArray[i.val]'(by
        simpa [baseClauseArray] using i.isLt)
```

The renderer must index `baseClauseArray`; it must not call `List.get` once per
retained source position.  A small ordinary lemma should connect the array
lookup back to the source list:

```lean
theorem render_censusBase_mem (i : CensusBaseIndex) :
    renderG3BaseSliceWitness (.censusBase i) ∈ baseDimacs := by
  -- `baseClauseArray = baseDimacs.toArray`, then the standard get-element
  -- membership lemma for the originating list.
```

That lemma is the only semantic bridge needed from the fast renderer to
`baseDimacs_sat`.

### Exact authentication theorem

Let `g3BaseSlice` be

```lean
#[.selectorTotality] ++ decodedBaseIndices.map
  (fun i => .censusBase i)
```

and authenticate both its size and its exact clause order:

```lean
theorem g3BaseSlice_size :
    g3BaseSlice.size = 108705 := by
  native_decide

theorem g3BaseSlice_render_eq :
    g3BaseSlice.toList.map renderG3BaseSliceWitness =
      (signedClausesOfFormula
        (formulaOfCompact
          (n := ExactFiveCommonShellV7G3Replay.n)
          ExactFiveCommonShellV7G3Replay.Checkpoint.C0000.text)).take
        108705 := by
  native_decide
```

This equality authenticates the compact ledger against the parsed certificate
payload.  It does not rely on the Python family labels at theorem-use time.

### Generic semantic theorem under the final valuation

Target the actual downstream valuation, not the intermediate selector
valuation:

```lean
theorem CanonicalPacket.renderG3BaseSliceWitness_sat
    (P : CanonicalPacket L) (hP : CubeOk P.cube.cube)
    (shadow : SourceIndexedShadow H L P.cube)
    (selected : G3Case) (w : G3BaseSliceWitness) :
    evalClauseD (P.fullRadiusValuation shadow selected)
      (renderG3BaseSliceWitness w) = true := by
  cases w with
  | selectorTotality =>
      exact P.fullRadiusSelectorTotalityClause_sat shadow selected
  | censusBase i =>
      have hmem := render_censusBase_mem i
      -- Transfer every nonzero base literal through
      -- fullRadius -> fullSourceChoice -> separation -> base.
      -- Then apply `P.baseDimacs_sat hP _ hmem`.
```

The base transfer is already supported by current named theorems:

1. `baseDimacs_nonzero` supplies `0 < literal.natAbs`;
2. `baseDimacs_literal_lt_pairIndicatorStart` supplies
   `literal.natAbs < 27287`;
3. `CanonicalPacket.fullRadiusValuation_eq_fullSourceChoice_of_lt`;
4. `CanonicalPacket.fullSourceChoiceValuation_eq_separation_of_lt`;
5. `CanonicalPacket.separationValuation_eq_base_of_lt`; and
6. `CanonicalPacket.baseDimacs_sat`.

Apply `evalClauseD_congr` once and chain those three valuation equalities for
each literal.  This keeps the proof generic over all 108,704 retained base
instances and avoids introducing one theorem per clause.

### First-slice acceptance gate

Promotion is ready only when an isolated build records all of:

1. the decoder accepts exactly 108,704 base indices;
2. `g3BaseSlice_size` closes;
3. `g3BaseSlice_render_eq` closes against the exact C0000 parser result;
4. the generic semantic theorem closes without `sorry`;
5. the composed theorem supplies satisfaction of all C0000 clauses with
   indices `< 108705`; and
6. elapsed time and peak RSS show no quadratic lookup behavior.
