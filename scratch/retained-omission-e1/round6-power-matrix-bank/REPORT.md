# Power-matrix audit for the retained-omission all-large core

## Scope and verification boundary

This is a source-frozen audit of
`Problem97.ATailFrontierLiveClosure.false_of_retainedOmission_triApexAllLarge_core`
in `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean`. No Lean files,
certificate inputs, or solver inputs were changed, and no Lake build was run.
Consequently, the classifications below describe the current source and exact
hypothesis flow; they are not a fresh kernel/axiom audit of the repository.

## Required theorem-bank and corpus audit

I searched the three required P97 theorem-bank registries:

* `docs/general-n-certificate-bank-mining-2026-07-09.md` and
  `certificates/p97_rvol_general_n_mining.{md,json}`;
* `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
* `certificates/erdos_general_theorem_p97_mining.{md,json}`.

Their circle/incidence entries contain no previously banked circle--point
power-matrix rank or determinant consumer. The scoped Lean-corpus search
(`nthdegree docs search --lean --current-project "circle point power matrix
rank determinant affine row difference concyclic"`) did find an in-project,
source-level implementation:

`lean/Erdos9796Proof/P97/Census554/CirclePowerMatrix.lean`.

| Status | Declaration | Meaning |
|---|---|---|
| PROVEN, source-level | `Problem97.Census554.CirclePowerMatrix.powerMatrix_rank_le_four` (line 114) | A circle--point power matrix has rank at most four. |
| PROVEN, source-level | `powerMatrix_factorization` | Factors the matrix through four point/circle features. |
| PROVEN, source-level | `powerMatrix_det_fin_five` (line 124) | Every `Fin 5` power determinant vanishes. |
| PROVEN, source-level | `det_ne_zero_of_unique_possible_matching` | Implements the correct unique-possible-perfect-matching criterion. |
| PROVEN, source-level | `false_of_powerMatrix_unique_possible_matching` | Combines that determinant contradiction with rank at most four. |

`docs/dead-ends-audit-response.md` already records this module as
source-level infrastructure without a published-spine consumer, and warns that
a selected common-deletion fourset is not automatically a full shell. The
current `FrontierLiveClosure` does not import `CirclePowerMatrix`, and no other
P97 source consumer was found. Thus this theorem family is **AVAILABLE**, not
currently connected to the live core.

## What is legitimately a power row here

For a critical shell
`K_x := H.selectedAt x (H.mem_A x)`, its support is definitionally the full
carrier shell around its carrier center. Therefore:

* `z ∈ K_x.support` certifies `power (center x) (radius x)^2 z = 0`;
* `z ∉ K_x.support`, together with `z ∈ A`, certifies that power is nonzero;
* its own center has nonzero power because the selected radius is positive.

The equality `qDeletedK4Class_support_eq_selectedShell` in
`ATail/FiveCenterDeletionBoundary.lean` permits the second packet row only:
the packet's `B₂` is the selected critical shell of its carrier-source center.
The packet's `B₁` is merely a selected four-point subset at the apex and is
**not** a full shell. Its omissions cannot be used as power nonzeros.

This is the load-bearing distinction for this audit.

## Exact entry supply in the two normal-form constructors

Write `k` for `O.kept`, `d` for `O.deleted`, and `K_x` for the full critical
shell selected at source `x`. Here `0` means a certified power zero and `≠0`
means a certified power nonzero. Empty cells are unknown, not nonzero.

| Constructor / full row | certified zero entries | certified nonzero entries | Cross entries still unknown |
|---|---|---|---|
| both constructors: `K_k` | `k` | `d` from `O.deleted_not_mem_kept_shell`; center of `K_k` | all other named points and all rich-shell witness points |
| `pairedCommonDeletion`: `K_d` | `d` | `k` from `reverse_omission`; center of `K_d` | all remaining entries |
| `reverseHitFreshCommonDeletion`: `K_d` | `k`, `d` | `fresh` from `fresh_not_mem_reverseShell`; center of `K_d` | all remaining entries |
| `reverseHitFreshCommonDeletion`: `K_f` | `fresh` | center of `K_f` | entries at `k,d` and all other named points |

The three rich-apex alternatives in `TriApexAllLargeContext` supply existential
full circle classes of cardinality at least six, or two classes of cardinality
at least four. They do **not** select named witnesses whose membership or
nonmembership in the critical shells (or in one another) is stated by the
normal form. Their cardinality lower bounds therefore do not fill the missing
cells of a power-pattern table.

Consequently the paired arm exposes only two named full critical rows with
usable cross information, and the fresh arm exposes three. The remaining
named-common-deletion data cannot be promoted to extra full rows: doing so
would incorrectly turn omission from a chosen fourset into shell
nonmembership.

## Verdict on a 5x5 determinant certificate

**UNAVAILABLE FROM THE CURRENT CORE NORMAL FORM.** There is no concrete set
of five full named circle classes and five carrier columns for which this
target supplies an exact forced-zero/forced-nonzero/unknown classification.
In particular, the data does not determine the possible-support graph
(`not forced zero`) for any proposed 5x5 submatrix, so it cannot establish its
unique perfect matching. A unique matching among currently known nonzero
edges would be unsound: the unclassified entries remain possible determinant
terms.

This is not a proof that a power-rank contradiction is impossible for a
strengthening of the leaf; it is a precise failure of the present input to
instantiate the existing theorem.

## Smallest viable future certificate shape

The smallest viable producer would provide five **full** critical (or otherwise
full carrier) shells `K₀,…,K₄`, five named carrier points `p₀,…,p₄`, and, for
every one of the 25 entries, either:

* membership `pⱼ ∈ Kᵢ.support` (forced zero), or
* ambient nonmembership `pⱼ ∉ Kᵢ.support` (forced nonzero).

It must additionally prove that the graph of non-forced-zero entries has one
permutation only, and that its five edges are all from the nonmembership
class. A convenient seed is one exact four-shell support plus its center:
that row has four forced zeros and one certified nonzero. Four further *full*
rows must then supply enough exact support/omission data to make the remaining
4x4 possible graph unique. No such nested support table is currently produced
by either constructor of `RetainedOmissionAllLargeNormalForm`.

The appropriate next mathematical bridge is therefore a positive
cross-incidence or exact full-shell-support producer, not a new wrapper around
`CirclePowerMatrix`. Once such a producer exists, importing the existing
module and encoding its explicit 25-cell table is a short, auditable Lean
application.
