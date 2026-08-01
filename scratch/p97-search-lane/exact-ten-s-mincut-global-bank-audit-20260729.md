# Exact-ten `S-MINCUT` global theorem-bank audit — 2026-07-29

## Scope and status vocabulary

This is a read-only audit of the completed exact-`n = 10` banking round in
`lean/Erdos9796Proof/P97/ExactTenSelectedShellMincut.lean`.  No Lean source,
generator source, certificate, or production import was changed.

- **PROVEN** means checked directly from a Lean theorem/source definition or
  exhaustively from one of the named finite registry inventories.
- **CONJECTURED** means plausible but not established by a theorem found in the
  searched material.

The indexed Lean corpora were searched first, before consulting the three
named theorem-bank registries.  Queries covered selected-four-class escape and
entry, nonempty proper closed subsets, outgoing/incoming cuts, min-cut, and
strong connectivity.  Exact declaration-name follow-ups were then run for the
only relevant current-project hit.

## New exact-ten bank

### `Problem97.exists_selectedFourClass_escape_of_card_eq_ten`

**PROVEN.**  Source:
`lean/Erdos9796Proof/P97/ExactTenSelectedShellMincut.lean:33`.

```lean
theorem exists_selectedFourClass_escape_of_card_eq_ten
    {A : Finset ℝ²}
    (hconv : ConvexIndep A)
    (hcard : A.card = 10)
    (rowAt : (center : ↑A) → SelectedFourClass A center.1)
    {B : Finset ℝ²}
    (hBne : B.Nonempty)
    (hBA : B ⊆ A)
    (hBproper : B ≠ A) :
    ∃ center : ↑A, center.1 ∈ B ∧
      ∃ x : ℝ², x ∈ (rowAt center).support ∧ x ∉ B
```

Its proof is a direct exact-ten cardinality argument using
`counterexample_card_ge_ten`; it does not assume minimality or a gauge package.

### `Problem97.exists_selectedFourClass_entry_of_card_eq_ten`

**PROVEN.**  Source:
`lean/Erdos9796Proof/P97/ExactTenSelectedShellMincut.lean:69`.

```lean
theorem exists_selectedFourClass_entry_of_card_eq_ten
    {A : Finset ℝ²}
    (hconv : ConvexIndep A)
    (hcard : A.card = 10)
    (rowAt : (center : ↑A) → SelectedFourClass A center.1)
    {X : Finset ℝ²}
    (hXne : X.Nonempty)
    (hXA : X ⊆ A)
    (hXproper : X ≠ A) :
    ∃ center : ↑A, center.1 ∉ X ∧
      ∃ x : ℝ², x ∈ (rowAt center).support ∧ x ∈ X
```

This is the direct `S-MINCUT` orientation and is proved from the escape theorem
by applying it to `A \ X`.

Import reachability is currently deliberately bank-only: no Lean module imports
`ExactTenSelectedShellMincut`, the escape theorem's only consumer is the entry
theorem in the same file, and the entry theorem has no Lean consumer.  The
completed-round report
`scratch/p97-search-lane/exact-ten-selected-shell-mincut-banking-20260729.md`
records direct Lean checking and transitive axioms
`[propext, Classical.choice, Quot.sound]`.

## Existing stronger/general candidates

The only relevant indexed declaration family is current-project code, not a
previously mined sibling/archive bank.

### `Problem97.FaithfulCarrierPattern.eq_carrier_of_nonempty_closed`

**PROVEN.**  Source:
`lean/Erdos9796Proof/P97/U1CarrierInjection.lean:1422`.

```lean
theorem eq_carrier_of_nonempty_closed
    {D : CounterexampleData} (hmin : D.Minimal)
    (P : FaithfulCarrierPattern D.A) {B : Finset ℝ²}
    (hBne : B.Nonempty) (hBA : B ⊆ D.A)
    (hclosed : ∀ center : ℝ², ∀ hcenter : center ∈ B,
      (P.classAt center (hBA hcenter)).support ⊆ B) :
    B = D.A
```

### `Problem97.FaithfulCarrierPattern.exists_row_escape_of_proper_subset`

**PROVEN.**  Source:
`lean/Erdos9796Proof/P97/U1CarrierInjection.lean:1447`.

```lean
theorem exists_row_escape_of_proper_subset
    {D : CounterexampleData} (hmin : D.Minimal)
    (P : FaithfulCarrierPattern D.A) {B : Finset ℝ²}
    (hBne : B.Nonempty) (hBA : B ⊆ D.A) (hBproper : B ≠ D.A) :
    ∃ center : ℝ², ∃ hcenter : center ∈ B, ∃ z : ℝ²,
      z ∈ (P.classAt center (hBA hcenter)).support ∧ z ∉ B
```

This theorem is general in carrier cardinality and is production-reachable:
for example, it is consumed at
`lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure.lean:9339`.
However, it is **not hypothesis-wise stronger** than the new exact-ten theorem.
It requires a minimal `CounterexampleData` and a `FaithfulCarrierPattern`
(including a gauge center and gauge witness), whereas the new theorem accepts
an arbitrary family of selected four-classes on any convex ten-point carrier.
It therefore cannot cleanly replace the exact-ten theorem or strengthen its
generator-facing interface.  Conversely, the exact-ten result cannot replace
the minimal-source theorem away from cardinality ten.

No direct external consumer of either new theorem was found.  The general
closed-set theorem is an alternate producer route, not a consumer of the new
bank.

## Named registry results

**PROVEN within the named finite inventories:** no declaration matching a
general selected-row cut/closed-set theorem, an all-cuts entry theorem,
`S-MINCUT`, or selected-row strong connectivity occurs in:

- `certificates/p97_rvol_general_n_mining.json`;
- `certificates/erdos97_legacy_general_n_mining.json`; or
- `certificates/erdos_general_theorem_p97_mining.json`.

The corresponding concise markdown censuses and
`docs/general-n-certificate-bank-mining-2026-07-09.md` were checked for the
same families.  The sibling registry has gauge/selected-class infrastructure
and highly local `C5D3B` “escape” routers, but none states an all-nonempty-proper
subset cut theorem and none is a replacement or strengthening of the new
theorems.  The two archive registries have no exact
`FaithfulCarrierPattern`/row-escape declaration match.  This is an exhaustive
negative result only for the indexed corpora and named registry inventories,
not a claim of mathematical nonexistence elsewhere.

## Match to the 1,022 generator clauses

**PROVEN for the intended exact-four, exact-ten geometric interpretation.**
In `census/p97_search/sat_generate.py:347`, the generator enumerates

```python
for mask in range(1, (1 << n) - 1):
    inside = [x for x in labels if mask & (1 << x)]
    outside = [p for p in labels if not mask & (1 << p)]
    add_clause(s[p, x] for p in outside for x in inside)
```

At `n = 10` this gives `2^10 - 2 = 1022` clauses, one for each nonempty proper
label subset `X`.  Under a carrier-label bijection and the interpretation

```text
s[p,x]  iff  x lies in the support of rowAt(p),
```

`exists_selectedFourClass_entry_of_card_eq_ten` gives exactly one disjunct
with `p ∉ X`, `x ∈ X`, and `s[p,x]`.  The clause orientation is therefore
correct.  The absence of diagonal `s[p,p]` variables also agrees with
`SelectedFourClass.center_not_mem`.

There remains an explicit trust boundary: no Lean theorem currently connects
the Python mask loop, a `Fin 10 ≃ A` label bijection, and the emitted DIMACS
clauses.  The theorem is semantic justification for the generator clauses,
not kernel verification of the generator implementation.

### Missing fail-closed scope guard

**PROVEN source/API mismatch.**  The constructor guard at
`census/p97_search/sat_generate.py:170` checks only

```python
mincut_scope == "counterexample_card_ge_ten" and cell.n != 10
```

and does not check `cell.k`.  Direct construction confirms that both
`Cell(k=1,n=10,profile=None,exact=True)` and the intended
`Cell(k=4,n=10,profile=(4,4,5),exact=True)` are accepted with 1,022
`S-MINCUT` clauses.  The new Lean theorem requires each semantic row to be a
`SelectedFourClass`, so it directly backs the latter `k=4` mode, not arbitrary
accepted `k`.

The narrow fail-closed guard justified by the present theorem is
`cell.n == 10 ∧ cell.k == 4` for
`mincut_scope = "counterexample_card_ge_ten"`.  A broader guard such as
`4 ≤ cell.k` would require a proved and implemented four-subrow selection
bridge preserving the SAT-row interpretation.  **CONJECTURED, not proven:**
the same clauses might follow for other accepted `k` values from some
different theorem.  No such theorem was found in this audit.

## Import recommendation

It is logically appropriate to make this module reachable from an
**import-only, bank-only structural-constraint aggregator** that explicitly
claims neither Phase-3 coverage nor P97 closure.  There is no honest existing
aggregator:

- `Phase3DuplicateCenterCertificates` is explicitly a duplicate-center finite
  certificate bank;
- `Phase3SurvivorSingularCertificates` is an equality-only Singular ingress;
- `K4WindowBank` is a bounded window-certificate bank.

The narrowest honest target is therefore a new import-only module such as
`Erdos9796Proof.P97.Phase3StructuralConstraintBank`, initially importing only
`ExactTenSelectedShellMincut`.  It should remain off the production spine until
a live geometric-to-labelled-SAT bridge consumes the theorem.  Importing it
into `Phase3DuplicateCenterCertificates` would blur a global semantic
soundness theorem with finite duplicate-center certificate ingress and is not
recommended.
