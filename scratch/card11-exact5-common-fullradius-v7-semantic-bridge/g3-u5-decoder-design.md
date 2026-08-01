# Exact G3 U5 occurrence decoder and completeness design

Status: implementation design only.  This audit made no production edits and
ran no Lake build.

## Recommendation

Implement one executable, generator-ordered decoder for each compact U5
family, indexed by `Fin 117900` and `Fin 39300`.  Decode the semantic labels
from the occurrence ordinal, and compute the concrete q-deleted/local-four/
global-equality row indices by executable lookup in the existing encoder row
lists.  Prove the two whole finite tables well formed with one
`native_decide` theorem apiece.  Do **not** use the existing noncomputable
`globalEqIndex`, and do not materialize 157,200 theorem declarations.

Keep emitted-clause authentication separate from semantic completeness:

1. the typed decoder proves what every ordinal means;
2. the renderer proves the clause at that ordinal is semantically true; and
3. an extracted, exact signed-clause payload proves the two rendered lists are
   byte-for-byte the two actual G3 input slices.

For retained-core ingress, store only the original source position.  The
position decodes directly to a U5 family ordinal and the typed renderer
reconstructs the clause; no duplicate U5 witness ledger is needed.

## Audited emission order

The source-choice list is not DIMACS-variable order.  Python appends choices
with `source` outermost, then the source's ordered `(center,row)` domain
(`scratch/card11-exact5-common-source-indexed/probe.py:105-120,130-143`).
The live Lean definitions already reproduce that domain: sources `6,7` use
only center `8`; other sources scan centers `0..10`, then candidate rows in
increasing order, filtered by the source bit
(`FullSourceChoiceSemantics.lean:35-55`).

Define the missing global occurrence list as

```lean
def allSourceChoiceOccurrences : List SourceChoiceOccurrence :=
  (List.finRange 11).flatMap fun source =>
    (List.finRange (sourceChoiceCount source)).map fun choice =>
      ⟨source, choice⟩
```

The per-source counts already in Lean are

```text
count = [689,760,766,686,686,686,84,84,707,701,701]
start = [0,689,1449,2215,2901,3587,4273,4357,4441,5148,5849]
```

so the global choice ordinal `j : Fin 6550` selects source `s` from the
half-open interval `[start[s], start[s] + count[s])`, and its dependent
`SourceChoiceIndex s` is `j - start[s]`.  The live count table and domain
length proof are at `FullSourceChoiceSemantics.lean:57-78`; the dependent
occurrence, `sourceChoiceAt`, and exact choice variable are already at
`:88-114,116-149`.

For the decoded occurrence `C[j] = (q, choice)`, let

```text
(p,row) = sourceChoiceAt q choice
mask    = candMasks[p][row]
B       = increasing labels whose mask bit is true
T       = increasing labels in B other than q       -- length 3
Z       = increasing labels not in B and not p      -- length 6
```

Using `List.finRange 11` plus `filter` gives exactly Python's `sorted(set ...)`
order.  `sourceChoiceAt_facts` already proves the row bound and the `q` bit
(`FullSourceChoiceSemantics.lean:415-425`).

### Family A

Python loops choice, then `member in T`, then `off_circle in Z`, and emits

```text
[-choiceVar,
 -qpair(q, member, p, off_circle),
 -qpair(q, off_circle, p, member)]
```

(`scratch/card11-exact5-common-fullradius-v6/probe.py:576-603`).  Therefore,
for zero-based `k : Fin 117900`,

```text
j       = k / 18
tIndex  = (k % 18) / 6
xIndex  = k % 6
t       = T[tIndex]
x       = Z[xIndex]
```

The two exact q-deleted rows are

```text
QT = (deleted=q, center=t, first=min(p,x), second=max(p,x))
QX = (deleted=q, center=x, first=min(p,t), second=max(p,t)).
```

The q-deleted helper order is `deleted`, then `center` excluding deleted,
then lexicographic two-combinations of the remaining labels; Python also
canonicalizes the final pair with `min/max`
(`scratch/card11-exact5-common-fullradius-v6/probe.py:528-548`).
Lean's `encoderQDeletedPairRows` is the same order
(`FullRadiusAtoms.lean:98-115`).

The count is exactly `6550 * 3 * 6 = 117900`; the generator asserts this
formula at `scratch/card11-exact5-common-fullradius-v6/probe.py:99-104`.

### Family B

Python loops choice, then `off_circle in Z`, and emits

```text
[-choiceVar,
 -eq(x,p,T[0]), -eq(x,p,T[1]), -eq(x,p,T[2])]
```

(`scratch/card11-exact5-common-fullradius-v6/probe.py:615-646`).  Thus, for
`k : Fin 39300`,

```text
j  = k / 6
x  = Z[k % 6]
t1 = T[0]; t2 = T[1]; t3 = T[2].
```

The semantic local-four witness is the encoder row with center `x` and sorted
support `{p,t1,t2,t3}`.  The three literal rows are the canonical global rows
for the stars `(x,p,t1)`, `(x,p,t2)`, `(x,p,t3)`.  Lean's local-four order is
center then lexicographic four-combination
(`FullRadiusAtoms.lean:84-96`), and the global rows are the ordered
two-combinations of the 55 ordered encoder edges
(`Atoms.lean:49-71`).

The count is exactly `6550 * 6 = 39300`
(`scratch/card11-exact5-common-fullradius-v6/probe.py:99-104`).

## Concrete Lean layer

Put the implementation in a new support file imported after
`G3U5Semantics.lean`, for example `G3U5OccurrenceDecoder.lean`.

Use compact typed records:

```lean
structure U5AOccurrence where
  sourceChoice : SourceChoiceOccurrence
  p t x : Label
  qT qX : Fin 3960
deriving DecidableEq

structure U5BOccurrence where
  sourceChoice : SourceChoiceOccurrence
  p x t1 t2 t3 : Label
  localFour : Fin 2310
  eq1 eq2 eq3 : Fin 1485
deriving DecidableEq

def decodeU5A : Fin 117900 → U5AOccurrence := ...
def decodeU5B : Fin 39300 → U5BOccurrence := ...
```

Use an executable row lookup (`List.idxOf` plus a bounded default, or a
total `findIdx?` decoder whose failure maps to index zero).  The batch
well-formedness theorem below rejects every default/failure by checking the
exact decoded row identity.  This is preferable to
`OccurrenceCore.globalEqIndex`, which is a `Classical.choose`-based
noncomputable definition (`OccurrenceCore.lean:136-168`) and therefore
cannot drive the native renderer.

The predicates should be computational `Bool`s (with ordinary projection
lemmas into propositions):

```lean
def U5AOccurrence.WF (o : U5AOccurrence) : Bool :=
  -- o.sourceChoice is exactly allSourceChoiceOccurrences[k/18]
  -- p is its center; T/Z selection is the ordinal formula above
  -- row mask bits: q=true, t=true, x=false
  -- qDeletedPairRow o.qT = QT and qDeletedPairRow o.qX = QX
  ...

def U5BOccurrence.WF (o : U5BOccurrence) : Bool :=
  -- exact choice and T/Z ordinal selection
  -- q,t1,t2,t3 bits=true; x bit=false
  -- t1,t2,t3 pairwise distinct
  -- localFourRow o.localFour has center x and exactly {p,t1,t2,t3}
  -- globalEqRow o.eqi is exactly the corresponding canonical star row
  ...
```

Required finite certificates:

```lean
theorem allSourceChoiceOccurrences_length :
    allSourceChoiceOccurrences.length = 6550 := by native_decide

theorem decodeU5A_all_wf :
    ∀ k : Fin 117900, (decodeU5A k).WF = true := by native_decide

theorem decodeU5B_all_wf :
    ∀ k : Fin 39300, (decodeU5B k).WF = true := by native_decide
```

The `WF` projection API should expose exactly what the existing semantic
kernels consume:

```lean
theorem decodeU5A_facts (k : Fin 117900) :
  let o := decodeU5A k
  (sourceChoiceAt o.sourceChoice.source o.sourceChoice.choice).1 = o.p ∧
  maskBit o o.t = true ∧ maskBit o o.x = false ∧
  qDeletedPairRow o.qT =
    { deleted := o.sourceChoice.source, center := o.t,
      first := min o.p o.x, second := max o.p o.x } ∧
  qDeletedPairRow o.qX =
    { deleted := o.sourceChoice.source, center := o.x,
      first := min o.p o.t, second := max o.p o.t } := ...

theorem decodeU5B_facts (k : Fin 39300) :
  let o := decodeU5B k
  -- center identity and four true/one false mask facts
  -- t1≠t2, t1≠t3, t2≠t3
  -- exact localFour row center/support, including membership and exhaust
  -- exact identities for globalEqRow o.eq1/o.eq2/o.eq3
  ... := ...
```

The Family B local-four index is semantic witness data, not a clause literal;
keeping it in the typed occurrence avoids a second existential lookup during
the semantic proof.

## Exact clause renderers and semantic coverage

```lean
def u5AClause (k : Fin 117900) : List Int :=
  let o := decodeU5A k
  [-Int.ofNat (sourceChoiceVariable
      o.sourceChoice.source o.sourceChoice.choice),
   -Int.ofNat (encodeG3Var (.qDeletedPair o.qT)),
   -Int.ofNat (encodeG3Var (.qDeletedPair o.qX))]

def u5BClause (k : Fin 39300) : List Int :=
  let o := decodeU5B k
  [-Int.ofNat (sourceChoiceVariable
      o.sourceChoice.source o.sourceChoice.choice),
   -Int.ofNat (encodeG3Var (.globalEquality o.eq1)),
   -Int.ofNat (encodeG3Var (.globalEquality o.eq2)),
   -Int.ofNat (encodeG3Var (.globalEquality o.eq3))]
```

`sourceChoiceVariable` is already decoded exactly and its truth value is
already connected to `sourceChoiceHolds`
(`FullSourceChoiceSemantics.lean:244-307,374-385`).  The full G3 valuation
already delegates positive variables below `41005` to that valuation and
interprets global/q-deleted indices by their typed rows
(`FullRadiusSemantics.lean:292-324,370-411`).

Prove one generic theorem per family:

```lean
theorem CanonicalPacket.u5AClause_sat
    (...) (k : Fin 117900) :
    evalClauseD (P.fullRadiusValuation shadow selected) (u5AClause k) = true

theorem CanonicalPacket.u5BClause_sat
    (...) (k : Fin 39300) :
    evalClauseD (P.fullRadiusValuation shadow selected) (u5BClause k) = true
```

After splitting the negative choice/helper literals, the all-true branch
calls the existing source-clean terminals:

- `u5NontripleChoice_incompatible`, whose exact inputs are center identity,
  one member bit, one outside bit, and the two q-deleted rows
  (`G3U5Semantics.lean:80-119`);
- `u5CommonBisectorChoice_incompatible`, whose exact inputs are three member
  bits, pairwise distinctness, the local-four support witness, and the three
  global star rows (`G3U5Semantics.lean:121-195`).

Then package list coverage without per-occurrence declarations:

```lean
def u5AClauses := (List.finRange 117900).map u5AClause
def u5BClauses := (List.finRange 39300).map u5BClause

theorem u5AClauses_length : u5AClauses.length = 117900 := by simp [...]
theorem u5BClauses_length : u5BClauses.length = 39300 := by simp [...]

theorem CanonicalPacket.u5AClauses_sat :
  ∀ clause ∈ u5AClauses,
    evalClauseD (P.fullRadiusValuation shadow selected) clause = true := ...

theorem CanonicalPacket.u5BClauses_sat :
  ∀ clause ∈ u5BClauses,
    evalClauseD (P.fullRadiusValuation shadow selected) clause = true := ...
```

## Authentication against the emitted G3 input

The source block positions are:

```text
Family A original IDs 1023499..1141398
Family B original IDs 1141399..1180698
```

All are common rows.  G3 writes one selector-totality clause, and each of the
46 earlier delta positions contributes two extra guarded rows, so throughout
the U5 blocks

```text
g3ClauseId = originalId + 1 + 2*46 = originalId + 93.

Family A G3 IDs 1023592..1141491
Family B G3 IDs 1141492..1180791
```

The construction constants and selector prefix are at
`scratch/card11-exact5-common-fullradius-v7-case-reuse-audit/build_g3.py:19-29,55-63`;
common rows are copied once and delta rows three times at `:64-82`.

A live byte check on 2026-07-30 established that G3 physical file lines
`1023593..1180792` equal source-run physical lines `1023500..1180699`
(the extra line is the DIMACS header).  The combined 157,200-row SHA-256 is

```text
77ac02c6ad785c1457d6820bbd1985766d3e50b21c924417a6af82e99504e0c0
```

with per-family hashes

```text
A 1825cafa7f348dc4209e31238e324067980817e36c352e178e7238f458ed0d7f
B aafd1ba8247d70d8de788a3d48aa4331b4f6667ed54d71c9f2ac1df83e4ecc55
```

For theorem-level authentication, add a small extractor that reads those
exact G3 clause IDs and writes a strict ASCII85 payload of fixed-width
unsigned literal magnitudes (all signs and arities are fixed).  The Lean
decoder must reject malformed length/trailing bytes and render `List Int`.
Required gates:

```lean
theorem u5EmittedPayload_length :
    u5EmittedClauses.length = 117900 + 39300 := by native_decide

theorem u5AClauses_eq_emitted :
    u5AClauses = u5EmittedClauses.take 117900 := by native_decide

theorem u5BClauses_eq_emitted :
    u5BClauses = u5EmittedClauses.drop 117900 := by native_decide
```

The payload should record the G3 input SHA-256, the two clause-ID ranges, and
the three slice hashes above in its generator provenance.  A hash-only Lean
theorem is not a substitute for the two exact list equalities.

## Retained-core decoder

The retained census contains 275 Family A and 36 Family B clauses
(`g3-retained-semantics-summary.md:41-42`).  Decode the existing one-based
`original_position` key:

```lean
def decodeU5OriginalPosition (p : Nat) :
    Option (Fin 117900 ⊕ Fin 39300) :=
  if hA : 1023499 ≤ p ∧ p ≤ 1141398 then
    some (.inl ⟨p - 1023499, by omega⟩)
  else if hB : 1141399 ≤ p ∧ p ≤ 1180698 then
    some (.inr ⟨p - 1141399, by omega⟩)
  else none
```

Add exact boundary/round-trip facts and a renderer:

```lean
def renderDecodedU5 : Fin 117900 ⊕ Fin 39300 → List Int
  | .inl k => u5AClause k
  | .inr k => u5BClause k

theorem decodeU5OriginalPosition_render_exact ... :
  renderDecodedU5 decoded = retainedCheckpointClause := by native_decide
```

This supplies both clause identity and the immediate semantic consumer for
each retained U5 entry.  Until `decodeU5A_all_wf`, `decodeU5B_all_wf`, both
full emitted-list equalities, both family satisfaction theorems, and the
retained renderer equality are present and transitively free of `sorryAx`,
the live U5 terminals remain reusable geometry rather than authenticated
coverage of these emitted G3 families.
