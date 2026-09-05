# Lean handoff: reverse-blocker + shared-blocker overlay packet

## Status and honesty boundary

The computational recovery supports only the following claims:

- one displayed, fully labelled `C3` overlay was previously found direction-infeasible;
- its producer-independent replay was not recovered;
- no complete `C3..C18` census is currently authenticated;
- the minimal source-audited reverse/shared packet has an exact rational strict chord-direction survivor.

Therefore this lane must **not** prove a packet-only `False`, must not assume a numeric ordered-cap ordinal, and must not silently assign cap sides or boundary positions to unnamed support points.

## Current source roles

Use the current source declarations and names rather than inventing a new geometric interpretation.

From the retained endpoint packet:

- `C = O.kept = E.fiber.source1`;
- `D = O.deleted = W.second`;
- `K = W.next = E.fiber.source2`, the fresh point;
- `Q : EndpointFreshFirstApexRowSource E`;
- `Q.row` is a `SelectedFourClass`, centered at the first apex `O`;
- `C,J ∈ Q.row.support`;
- in the shared-blocker branch, `K ∉ Q.row.support`.

From the shared-blocker packet:

- the common selected shell is centered at the shared blocker `A`;
- its support is exactly `{C,J,K,L}` for a unique fourth point `L`;
- `Q.row.support ∩ commonShell.support = {C,J}`;
- hence `K,L ∉ Q.row.support`;
- all these roles lie in the carrier;
- the two unnamed `Q.row` support points are distinct from its center, from `C,J`, and in the shared branch from `K,L`.

Do **not** assume source currently proves that unnamed `Q.row` points are distinct from the shared blocker `A`, reverse blocker `b`, or deleted point `D`; aliases not explicitly excluded must remain possible.

From the reverse-hit context:

- the reverse blocker `b` is strict interior to the relevant ordered cap;
- its selected row is exact-card-four;
- the row contains strict-interior cap hits `C,D` with `C < b < D` (or the proved reflected form);
- the reverse row omits `K`;
- its two remaining support points have no extra placement unless current source explicitly supplies it.

## Primary formalization target

Create a low/source-neutral packet, or an equivalent namespace-local structure, that records only the proved data needed downstream. A possible shape is:

```lean
structure ReverseSharedOverlayPacket ... where
  C D J K L O A b : ...
  qRow : SelectedFourClass ... O
  reverseRow : SelectedFourClass ... b
  commonShell : CriticalFourShell ... A

  C_mem_qRow : C ∈ qRow.support
  J_mem_qRow : J ∈ qRow.support
  K_not_mem_qRow : K ∉ qRow.support

  commonShell_support_eq : commonShell.support = {C, J, K, L}
  qRow_inter_commonShell : qRow.support ∩ commonShell.support = {C, J}

  C_mem_reverseRow : C ∈ reverseRow.support
  D_mem_reverseRow : D ∈ reverseRow.support
  K_not_mem_reverseRow : K ∉ reverseRow.support

  -- only the cap/order fields actually supplied by the reverse context
  b_mem_capInterior : ...
  C_lt_b : ...
  b_lt_D : ...
```

Adapt names/types to the existing source. Keep geometric/cyclic indexing fields separate from the pure finite-support core if that avoids an import cycle.

### Constructor goal

If imports are acyclic, add a constructor from the existing objects:

- `EndpointFreshFirstApexRowSource`;
- the `sharedBlocker` outcome/support theorem;
- `ReverseHitFreshEndpointContext` (or its current equivalent).

The constructor should expose exactly the source-proved memberships, omissions, support equality/intersection, carrier membership, and cap-order data. Do not add a theorem claiming contradiction.

## Pure Finset theorem worth landing even if the constructor is blocked

Package the exact private-point decomposition of two card-four supports meeting in one named pair.

Suggested source-neutral result:

```lean
structure ExactTwoPrivateSupportDecomposition
    (S T : Finset α) (c j : α) where
  S_private : Finset α
  T_private : Finset α
  card_S_private : S_private.card = 2
  card_T_private : T_private.card = 2
  S_eq : S = {c, j} ∪ S_private
  T_eq : T = {c, j} ∪ T_private
  S_private_disjoint_pair : Disjoint S_private {c, j}
  T_private_disjoint_pair : Disjoint T_private {c, j}
  private_disjoint : Disjoint S_private T_private
```

Producer theorem assumptions:

```lean
[DecidableEq α]
S.card = 4
T.card = 4
c ≠ j
c ∈ S; j ∈ S
c ∈ T; j ∈ T
S ∩ T = {c,j}
```

Canonical choices may be

```lean
S_private := S \ {c,j}
T_private := T \ {c,j}.
```

Useful corollaries:

- each private part has cardinality two;
- every private member is outside `{c,j}`;
- the private parts are disjoint;
- `S ∪ T` has cardinality six;
- existence of two pairwise-distinct named private members on each side;
- specialized application to `Q.row.support` and the common shell.

This theorem is honest, reusable, source-neutral, and directly supports later finite role extraction.

## Governance and acceptance

Before editing:

1. create a governed lane checkpoint and declare exact owned paths;
2. inspect current declarations/import direction and avoid foreign staged edits;
3. prefer a new low-level Finset module or the lowest existing neutral module that does not invert ATail dependencies.

Acceptance:

- no `sorry`, `admit`, native-decide trust shortcut, or untracked external certificate;
- direct Lean build of every touched module;
- `#print axioms` for new public theorems, expected closure no stronger than the project baseline `[propext, Classical.choice, Quot.sound]`;
- aggregate build or the strongest governed scoped build available;
- commit and push only owned verified changes;
- report exact FQNs, files, commit, tests/builds, and any constructor blocked by import direction.

If the source constructor is not acyclic or facts differ from this audit, land only the pure Finset decomposition and post a literal field/signature audit rather than strengthening hypotheses silently.
