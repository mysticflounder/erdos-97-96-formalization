# Ingress contract and source map

## Scope

The input is exactly
`../generated/post_rich_cut_v3_assignment.json`: one validated exact-17,
direct-crossed, aligned incidence assignment. The parent `unified_metric.py`
reconstructs all 1,070 clauses through the `blocker_exactness` stage. This
subdirectory neither proves coverage of all assignments nor lifts exact 17 to
general cardinality.

## Required source facts

1. Global K4 supplies a four-point positive-radius class at each carrier
   center. `SelectedFourClass.support_eq_radius` gives the three common-radius
   equalities emitted per center.
2. A selected shell at a source is the shell of its actual blocker. The frozen
   row identity is checked for all 17 sources:
   `selected_rows[s] = point_k4_rows[blockers[s]]`.
3. At a blocker center, the selected support is its unique four-class. Hence
   every carrier point outside that support has distance different from the
   selected radius; this licenses `blocker_exact_*` only at blocker-image
   centers.

The relevant current Lean APIs are:

- `CriticalShellSystem.selectedFourClass_support_eq_shell` in
  `P97/U1CarrierInjection.lean`: any global selected four-class at a chosen
  blocker center equals the critical shell support.
- `selectedSupports_eq_of_actualBlockers_eq` and
  `actualBlockerFiber_image_eq_selectedSupport_of_card_eq_four` in
  `P97/ATail/SurvivalCover.lean`: actual-blocker equality transports selected
  supports and a maximal blocker fiber exhausts the support.
- `uniqueFourClass_eq`, `isUniqueFourCenter_centerAt`, and
  `uniqueFourClass_centerAt_eq_selectedAt_support` in
  `P97/ATail/MinimalUniqueFourCover.lean`: blocker centers have the canonical
  unique four-class used by blocker exactness.

`nthdegree-source-map.txt` records the agentic Lean search used to locate the
APIs, and `nthdegree-source-handles.txt` records the selected theorem handles.

## Trust and replay boundary

- External Z3 extracts the global named UNSAT seed from the complete canonical
  clause universe.
- External Z3 and cvc5 replay the canonical query, final core, every exact
  substituted drop-one, and all controls.
- Exact Z3 substitution validates each drop-one witness against the original
  nonlinear formulas. Rational witnesses additionally use Python `Fraction`.
- `verify.py` independently reconstructs the clauses, identity audit, distance
  chain, one-check artifacts, solver statuses, and SHA-256 manifest.

These are computational certificates and diagnostics, not kernel-checked Lean
proofs.

## Promotion classification

The nine clauses describe a genuine uniform metric lemma: the displayed cycle
of K4-radius equalities is incompatible with the unique-four off-support
inequality. However, only the occurrence of that lemma in this one frozen
assignment has been established.

Accordingly the result is classified as a **preflight cut**. Promotion to a
universal FreshThird theorem would require a source-level producer proving
that every live residual contains this incidence motif (or a finite coverage
theorem plus a general-cardinality lift), followed by a kernel-checked Lean
proof of the metric lemma and wiring to the live consumer.
