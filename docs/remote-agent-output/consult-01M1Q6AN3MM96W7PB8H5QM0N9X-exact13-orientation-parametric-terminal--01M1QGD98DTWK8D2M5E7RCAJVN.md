# Consult 01M1Q6AN3MM96W7PB8H5QM0N9X

## Question

Can the source-proved exact-card-13 packet be normalized, using only order-preserving/dihedral symmetry, to

```lean
CardGeThirteenCenter9K4RowDomain.FixedFiveRows P.φ
```

so that

```lean
ExactThirteenBranchIngress.false_of_center9_globalK4_of_ingress
```

closes the branch, or must the finite terminal be parameterized by the actual variable rows?

## Verdict

**There is no source-faithful derivation of `FixedFiveRows P.φ` from the current packet. Construct an orientation-parametric, variable-row finite terminal.**

The current direct/mirror `LabelMap` split is already the maximal source-proved cyclic normalization. It transports labels, supports, cardinalities, and row equalities through an order-preserving or order-reversing boundary map. It does not determine which positional labels are the five row centers or which four-element sets are their supports.

The obstruction is missing occurrence data, not missing dihedral algebra.

## What is source-determined

The exact-card-13 branch now retains or source-proves the following data, modulo the outstanding build/integration work in `CardGeThirteenExact13RawIngress.lean`:

1. the strict profile is `.secondOpposite`;
2. the orientation is direct or mirror;
3. the five-label second-opposite interval `I2` is known positionally;
4. two named second-apex supports partition `I2`, with intersection sizes `2+3` up to swapping the rows;
5. three raw four-supports are pairwise disjoint and cover `Fin 13` minus one omitted label `zraw`;
6. source, blocker, deletion, and omitted-point raw labels are retained;
7. each actual selected row can be transported to a positional four-support row;
8. global K4 gives an existential four-support row at every raw center.

These facts determine a finite family of variable row cells. They do not determine one particular cell.

## What `FixedFiveRows` additionally asserts

The existing center-9 terminal uses five particular positional row equalities. In the checked fixed module they have the following centers and supports:

```text
raw11       center 4   support {10,0,7,9}
raw10       center 3   support {6,11,2,5}
raw0First   center 10  support {8,12,1,4}
raw0Second  center 10  support {7,2,3,5}
raw1        center 6   support {0,11,12,3}
```

The exact-card-13 packet provides five actual rows with variable centers and supports. Nothing in the profile, the `2+3` interval partition, the three-row tight cover, or global K4 identifies them with the five tuples above.

In particular:

- dihedral maps act simultaneously on every center and support;
- one cannot map a chosen challenge center to raw `9` while independently freezing all five base rows;
- global K4 gives `∃ support`, not the support required by the fixed cell;
- arbitrary permutations are invalid because they need not preserve cyclic order or the strict Kalmanson inequalities.

Thus the proposition

```lean
∃ δ : Dihedral 13, FixedFiveRows (P.φ ∘ δ)
```

is itself an additional finite occurrence theorem. It is not a consequence of the present source packet.

## Smallest exact transport lemmas

### 1. Single-row positional transport

The core reusable theorem is:

```lean
theorem positionalRow_of_rawRow
    (P : ExactThirteenBranchIngress S)
    {rawCenter : Fin 13} {rawSupport : Finset (Fin 13)}
    (hrow : RowDistancesEqual P.pt rawCenter rawSupport) :
    RowDistancesEqual P.φ (P.idx rawCenter) (rawSupport.image P.idx)
```

with companion facts:

```lean
(rawSupport.image P.idx).card = rawSupport.card
P.idx rawCenter ∉ rawSupport.image P.idx
```

when the raw support has the corresponding cardinality and center omission. The proof uses

```lean
P.boundaryEnumeration.pt_eq
P.boundaryEnumeration.idx_injective
```

and is valid in both direct and mirror branches. The current `PositionalFourSupportRow` construction is essentially this theorem packaged with card four and center omission.

### 2. Five variable positional rows

The next honest packet is the current intended

```lean
ExactThirteenFivePositionalRows
```

produced by

```lean
nonempty_exactThirteenFivePositionalRows
```

It should retain, for each of the five actual rows:

- raw center;
- raw support;
- positional center `P.idx rawCenter`;
- positional support `rawSupport.image P.idx`;
- card four;
- center omission;
- `RowDistancesEqual`;
- semantic provenance identifying the original selected row/blocker.

This is the right source boundary. It must not be collapsed to the five fixed tuples without a separate classification theorem.

### 3. Conditional adapter to the old terminal

A small theorem is mechanically provable:

```lean
theorem fixedFiveRows_of_exactOccurrence
    (Rows : ExactThirteenFivePositionalRows P ...)
    (hcenters : -- the five positional centers equal 4,3,10,10,6)
    (hsupports : -- the five positional supports equal the fixed tuples) :
    CardGeThirteenCenter9K4RowDomain.FixedFiveRows P.φ
```

This theorem is useful only as the final adapter after a finite classifier proves `hcenters` and `hsupports`. It does not reduce the mathematical gap by itself.

## Recommended new terminal interface

Refactor the fixed center-9 checker into a data-driven row-domain terminal.

```lean
structure ExactThirteenFiveRowCell where
  orientation : ExactThirteenOrientation
  zraw : Fin 13
  baseRows : Fin 5 → PositionalFourSupportRow
  secondOppositeProfile : ...
  twoThreePartition : ...
  tightThreeRowCover : ...
  sourceLabels : ...
  blockerLabels : ...
  deletionLabels : ...
  overlapBounds : ...
```

A per-cell certificate should choose its own challenged center:

```lean
structure EmptyFourSupportDomainCertificate
    (Cell : ExactThirteenFiveRowCell) where
  challengeCenter : Fin 13
  eliminate :
    ∀ U : Finset (Fin 13),
      U.card = 4 →
      challengeCenter ∉ U →
      Nonempty (KalmansonCancellationCertificate Cell challengeCenter U)
```

Then prove one generic consumer:

```lean
theorem false_of_globalK4_at_emptyDomain
    (P : ExactThirteenBranchIngress S)
    (Rows : ExactThirteenFivePositionalRows P ...)
    (Cell : ExactThirteenFiveRowCell)
    (hrealizes : Rows.Realizes Cell)
    (Cert : EmptyFourSupportDomainCertificate Cell)
    (K4row : PositionalFourSupportRow P Cert.challengeCenter) :
    False
```

The finite cancellation payload can be checked through the generic weighted-Kalmanson interface, preferably

```lean
SelectedFourClassWeightedKalmansonIngress.
  false_of_selectedFourClass_weightedKalmansonCancellationData_of_check
```

or a transparent specialization of the current row-domain kernel. The certificate checker, rather than the theorem statement, should contain the per-cell finite data.

Finally global K4 supplies `K4row` at the cell-specific `challengeCenter`.

This strictly generalizes the current center-9 module:

```text
FixedFiveRows + challenge center 9 + its existing 495-support bank
```

is one instance of the generic terminal.

## Required completeness theorem

The main finite ingress should be:

```lean
theorem exactThirteenFiveRows_cell_cases
    (P : ExactThirteenBranchIngress S)
    (Rows : ExactThirteenFivePositionalRows P ...)
    (Raw : ExactThirteenRawTwoThreePartition P ...)
    (Tight : CardGeThirteenExact13RawTightSupport P ...) :
    ∃ Cell ∈ admissibleExactThirteenFiveRowCells,
      Rows.Realizes Cell
```

Only direct/mirror maps may be used in `Rows.Realizes`. If a rotation is used, the theorem must transport every named semantic role, center, support, cap interval, and source/deletion identity simultaneously. There is no license to quotient by arbitrary `Equiv.Perm (Fin 13)`.

The final contradiction is then:

```text
source packet
→ one admissible finite cell
→ that cell's empty-domain certificate
→ global K4 row at its certified center
→ False.
```

If a cell has no empty four-support domain under the current equality/Kalmanson theory, it must remain as an explicit survivor and be refined by another source-valid row, a planar terminal, or a stronger geometric certificate. Completeness must not be inferred from the absence of a survivor in a partial search.

## Finite split suitable for PIQD and certificate generation

Use a staged split rather than one monolithic formula.

### Stage A — source-forced coarse cells

1. **Orientation:** direct or mirror — `2` cases.
2. **Omitted interval label:** `zraw ∈ I2` — `5` cases.
3. **The `2+3` interval partition:** among the four remaining `I2` labels, choose the named row's intersection of size two or three:

```text
C(4,2) + C(4,3) = 6 + 4 = 10
```

cases for each `zraw` and orientation.

This gives

```text
2 × 5 × 10 = 100
```

coarse source cells.

Keep the row-swap information explicit unless a checked theorem swaps the two named radii, row provenance, and every downstream field.

### Stage B — exact support occurrence cells

Within each coarse cell, enumerate only assignments satisfying:

- the three labeled card-four supports are pairwise disjoint;
- their union is `univ.erase zraw`;
- own centers are omitted;
- source/blocker/deletion memberships and omissions;
- the first-apex row contains its two source-proved interior labels;
- the carried overlap bounds;
- every center and support is transported through the selected direct/mirror `idx`.

For comparison, a raw labeled partition of twelve labels into three ordered four-sets has

```text
12! / (4!)^3 = 34,650
```

possibilities for fixed `zraw`, before source restrictions. Do not enumerate all of these blindly; constrain by the `I2` split and source labels first.

### Stage C — optional secondary splits

Only for survivors:

- split the ordered pair of distinct blocker centers: at most `12×11 = 132` assignments if the apex-excluded raw domain has twelve candidates;
- split

```text
a = |C0 ∩ L|,
b = |C1 ∩ L|,
```

with `a,b ∈ {0,1,2}` and `a+b ≤ 3`, at most `8` cardinality cells;
- add global-K4 rows incrementally, selecting the next challenged center by smallest current support domain.

### Stage D — certificate extraction

For each complete support cell and candidate challenge center:

1. enumerate all `C(12,4)=495` center-omitting supports;
2. search one-form, two-form, then weighted multi-form Kalmanson cancellations;
3. retain a canonical exact coefficient vector and the row-equality quotient used;
4. independently replay every certificate;
5. declare the center empty only when all 495 supports are covered;
6. otherwise retain the first uncovered support and refine the cell.

Generate direct and mirror banks independently at first. A later reflection-equivariance theorem may halve the bank, but it is not needed for soundness.

## Why a fixed-center normalization is unsafe

A tempting argument is:

```text
choose any center whose K4 domain is empty;
rename it to raw center 9;
apply the current center-9 terminal.
```

This is invalid. The same relabeling also moves all five base rows, the second-opposite interval, the omitted label, blockers, and source/deletion labels. The current center-9 certificate is valid only with its particular base row table. A relabeling theorem would have to prove that the entire variable cell maps to that table. That is exactly the missing occurrence theorem.

## Current implementation qualification

The new raw-ingress declarations have recently undergone Fin-13 interval and `surface`-parameter repairs. At the observed worktree state, some declarations were still untracked or awaiting a fresh aggregate build/import. Before treating the variable-row packet as a spine theorem, complete:

1. direct module elaboration against current dependencies;
2. aggregate import/reachability;
3. `#print axioms` for the producer chain;
4. source-hash and worktree-hygiene recording.

This is an engineering gate. It does not change the mathematical conclusion that the fixed occurrence is absent.

## Exact claim boundary for computation

A PIQD result in one fixed direct cell establishes only the stated finite formula for that cell. It does not establish:

- the source packet realizes that cell;
- mirror coverage;
- arbitrary-center relabeling;
- planar realizability unless encoded and replayed;
- exact selected-class off-support exclusions unless encoded;
- or Lean closure without a checked source-to-cell theorem and certificate ingress.

The coarse 100-cell split is source-faithful, but it is not yet the complete five-row support classification. The support/center occurrence enumeration and its completeness theorem remain necessary.

## Final recommendation

```text
Do not try to derive FixedFiveRows by arbitrary normalization.

Finish and retain ExactThirteenFivePositionalRows.
Define a direct/mirror ExactThirteenFiveRowCell.
Prove source packet -> finite admissible cell.
Use a generic cell-specific empty-K4-domain certificate.
Invoke global K4 at the certificate's challenged center.
Preserve any cell with an uncovered support as an explicit residual.
```

The current `FixedFiveRows` terminal remains valuable as one regression/certificate instance. It is not a universal normal form of the source-proved exact-card-13 packet.
