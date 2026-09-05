# B1 source-consumer consult — working checkpoint

Consult: `01M1M60EKC8XC6X5NYBJM4MFEA`

Target: `Problem97.ATailFrontierLiveClosure.false_of_b1PhysicalClassFiveSixNormalForm`

Source boundary: current descendants of `88acd2354`, with reducer commit `7cdcaef62` and endpoint-order negative control `0f564afde`.

## Current exact reduction

The source-clean reducer is

```lean
false_of_b1PhysicalClassFiveSixNormalForm_of_escapeSource_and_goodCanonicalEndpoint
```

It reduces the live normal-form leaf to two external consumers:

```text
∀ P : B1EscapeSourceContext C, False
∀ P : B1GoodCanonicalDeletionEndpointResidual C, False
```

The top-level `false_of_b1PhysicalClassFiveSixNormalForm` remains sorry-backed. The two downstream four-center leaves are excluded from this consult, and importing `Rigid221Closure` backward is cyclic/invalid.

## Negative result already established

The current endpoint-order packet is insufficient. Commit `0f564afde` gives a kernel-checked finite negative control in which all three produced separation/blocker-between relations hold while both live-slice same-arc bits fail. Therefore no theorem of the form

```text
current endpoint residual -> B1WinningLiveSliceSameBoundaryArc
```

is justified without an additional genuinely global cap/order/deletion antecedent.

The current source also has no producer for the proposed `B1GoodCanonicalEndpointCardArc`; a dirty source addition defines the explicit card-arc contract and a conditional False consumer only.

## Strongest retained-deletion reduction under audit

For an escape packet

```lean
P : B1EscapeSourceContext C
```

the current source has the neutral adapter

```lean
exists_exactFourMutualOmissionSourceContext_of_b1EscapeSourceContext
```

to an `ExactFourMutualOmissionSourceContext C.R C.rho C.u C.v`. Since the normal form gives physical-class cardinality five or six, the source-clean constructor

```lean
nonempty_exactFourMutualOmissionJointDeletion
```

can then produce

```lean
J : ExactFourMutualOmissionJointDeletion C.R C.rho C.u C.v.
```

The no-third-deletion component `hnormal.1` forces

```lean
J.deleted = C.first.deleted ∨ J.deleted = C.second.deleted.
```

The Lean-shaped producer being checked is:

```lean
theorem b1_escapeSourceContext_canonicalJointDeletion
    (C : B1GlobalTransportContext ...)
    (hnormal : B1PhysicalClassFiveSixNormalForm C)
    (P : B1EscapeSourceContext C) :
    ∃ Q : ExactFourMutualOmissionSourceContext C.R C.rho C.u C.v,
      ∃ J : ExactFourMutualOmissionJointDeletion C.R C.rho C.u C.v,
        J.deleted = C.first.deleted ∨
          J.deleted = C.second.deleted := by
  obtain ⟨Q⟩ :=
    exists_exactFourMutualOmissionSourceContext_of_b1EscapeSourceContext
      C hnormal P
  have hfive :
      5 ≤ (SelectedClass D.A S.oppApex2 C.rho).card := by
    rcases hnormal.2.1 with h5 | h6 <;> omega
  obtain ⟨J⟩ :=
    nonempty_exactFourMutualOmissionJointDeletion
      /* current R/surface/rho/u/v projections */
      hfive Q.blockers_ne
  have hcanonical :
      J.deleted = C.first.deleted ∨
        J.deleted = C.second.deleted := by
    by_cases hfirst : J.deleted = C.first.deleted
    · exact Or.inl hfirst
    by_cases hsecond : J.deleted = C.second.deleted
    · exact Or.inr hsecond
    exact False.elim (hnormal.1 ⟨J, hfirst, hsecond⟩)
  exact ⟨Q, J, hcanonical⟩
```

Exact binder/projection syntax is being kernel-checked independently.

## Why this is not yet a contradiction

A canonical value of `J.deleted` is not the same as a good canonical **source**. The escape source is noncanonical, and the packet does not show that the canonical deleted carrier has:

- membership in `outsideFirstApexFiber C.R`;
- retained q/w-deletion survival at its own blocker;
- the omitted-peer/live-slice provenance required by `B1GoodCanonicalDeletionResidual`;
- a source-faithful same-arc boundary placement.

Therefore the escape packet cannot currently be repackaged as `B1GoodCanonicalDeletionEndpointResidual` merely from `J.deleted` being canonical.

## Smallest honest escape residual

The strongest non-wrapper residual presently justified is:

```lean
structure B1EscapeCanonicalJointDeletionResidual (C : B1GlobalTransportContext ...) where
  escape : B1EscapeSourceContext C
  sourceContext :
    ExactFourMutualOmissionSourceContext C.R C.rho C.u C.v
  jointDeletion :
    ExactFourMutualOmissionJointDeletion C.R C.rho C.u C.v
  deleted_is_canonical :
    jointDeletion.deleted = C.first.deleted ∨
      jointDeletion.deleted = C.second.deleted
```

The corresponding genuine mathematical target is

```lean
theorem false_of_b1EscapeCanonicalJointDeletionResidual
    (C : B1GlobalTransportContext ...)
    (hnormal : B1PhysicalClassFiveSixNormalForm C)
    (P : B1EscapeCanonicalJointDeletionResidual C) : False
```

The first missing bridge is a cross-system fact tying the canonical joint deletion to the retained escape-source packet: either canonical-source outside/survival/omitted-peer provenance, or a global cap/order statement producing `B1WinningLiveSliceSameBoundaryArc C`. Current cardinality, cap localization, and endpoint-order facts supply neither.

## Import placement

The producer should be placed in `TwoDeletionCollision.lean` immediately after the current escape-context adapter, or in a new sibling module imported there. It may import the lower B1 order/source modules and `JointDeletion/Constructors`; it must not import `Rigid221Closure`. The existing reducer is its nearest acyclic consumer.

This checkpoint is not a closure claim. The exact producer proof, current fresh-pair role compatibility, and the newly factored card-arc contract are still being source-audited.
