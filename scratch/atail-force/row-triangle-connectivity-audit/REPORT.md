# Row-triangle / selected-connectivity audit

Date: 2026-07-17

Status: **KERNEL-CHECKED CONNECTIVITY LIFT AND EXACT FINITE REGRESSION. STRONG
CONNECTIVITY DOES NOT FORCE THE PINNED `O,A,X` TRIANGLE. A GENERAL ORDINAL
CYCLE LIFT REMAINS A NEW THEOREM, NOT A CURRENT CONSEQUENCE. NO PRODUCTION
`sorry` IS CLOSED.**

## Bank and indexed-corpus preflight

Before proving anything, this lane checked the registries required by
`AGENTS.md`:

- `docs/general-n-certificate-bank-mining-2026-07-09.md`, especially the
  sibling `p97-rvol` section;
- `certificates/p97_rvol_general_n_mining.{md,json}`;
- `certificates/erdos97_legacy_general_n_mining.{md,json}`; and
- `certificates/erdos_general_theorem_p97_mining.{md,json}`.

It also searched the indexed Lean corpora for selected-witness strong
connectivity, blocker fibers, the `O,A,X,J,C,K` support pattern, ordinal
Kalmanson cycles, and minimal-carrier row closure. The relevant existing
results are:

- `FaithfulCarrierPattern.eq_carrier_of_nonempty_closed`;
- `FaithfulCarrierPattern.exists_row_escape_of_proper_subset`;
- `ATailOrdinalKalmansonCycle.false_of_transGen_cycle`; and
- `CapCrossingKalmansonBridge.false_of_selected_rows_in_five_ccw_order`.

No bank theorem converts a path in the selected-witness digraph into either
the pinned six-role support triangle or a transitive cycle of
`SelectedRowOrdinalComparison`s.

## Exact source-faithful result

`RowTriangleConnectivityAudit.lean` proves

```lean
selectedWitnessEdge_reflTransGen
```

directly from `CounterexampleData.Minimal` and the production carrier-closure
theorem. Thus every selected-row graph is strongly connected: for any two
carrier vertices there is a reflexive-transitive path whose individual edge
records one support membership.

It also proves

```lean
exists_two_prescribed_rows_with_global_connectivity
```

which uses the production two-row constructor to retain any two prescribed
selected classes and then supplies strong connectivity for the resulting
global pattern. In the live application the prescribed rows can be:

1. the robust first-apex selected row; and
2. the exact row at the common blocker containing the two collision sources.

This is the strongest direct use of minimality currently available. Its path
edge has type

```text
target in selectedRow(center).
```

The required `O,A,X` terminal instead needs the paired incidence

```text
J in selectedRow(X) and K in selectedRow(X)
```

at one ordinary center, in addition to the boundary order

```text
O < A < X < J < C < K.
```

A path from `J` to `K` does not supply that pair: it may use arbitrarily many
centers and contributes only one support member at each step.

## Exact finite regression

The `FiniteBoundary` namespace gives a twelve-label incidence model. It is
not a Euclidean counterexample. It retains exactly the finite fields relevant
to the proposed connectivity inference:

- one four-point row at every center;
- no center in its own row;
- a total source-indexed blocker map with every source in its exact blocker
  row;
- omission of the robust center from the blocker image;
- a five-member deletion-robustness class at the omitted center;
- exactly one nontrivial blocker fiber, at `A = commonBlocker`, consisting of
  the two sources `C = collisionSource₁` and `K = collisionSource₂`;
- every nonempty row-closed subset is the whole carrier; and hence
- reflexive-transitive selected-row reachability between every ordered pair
  of labels.

The checked theorem

```lean
no_ordered_row_triangle_incidence_checked
```

nevertheless proves that no distinct `X,J` complete the support pattern

```text
O-row: J,C
A-row: C,K
X-row: J,K.
```

It rules out the incidence pattern before any cyclic-order requirement is
imposed. Therefore the structural implication

```text
strong connectivity + robust omission + full exact blocker collision
  -> pinned O/A/X row triangle
```

is false at the incidence abstraction actually delivered by minimality.

## Longer ordinal-cycle verdict

This regression does **not** claim that a Euclidean live configuration can
avoid every ordinal cycle. The abstract rows deliberately carry no metric or
convex-boundary realization, and their full equality quotient need not be
ordinally consistent. Conversely, the existing fixed fourteen-role search
showing an ordinal cycle uses several explicit pair memberships from several
rows; those memberships are not consequences of graph reachability alone.

Accordingly, there are now two honest choices:

1. Produce the narrow paired row and its order:

   ```text
   exists X,J with J,K in row(X), plus O<A<X<J<C<K
   ```

   up to cyclic relabeling. This feeds the already checked six-role terminal.

2. Prove a genuinely new global **paired-path/order lift**. Such a theorem
   must map a strongly connected source-indexed selected-row system to a
   `Relation.TransGen SelectedRowOrdinalComparison t t` cycle. At every path
   step it must supply a second support member and the cyclic placement that
   orients the strict comparison, and it must show that consecutive distance
   terms agree after quotienting by shell equalities.

The second option is much stronger than selected-row connectivity and is not
currently banked. Treating connectivity itself as the missing producer would
skip exactly these pair-membership, order, and term-gluing obligations.

## Route recommendation

Do not add strong connectivity as another parent field: it is already a
theorem from minimality and does not narrow the live surface to the terminal.
The next producer should target either:

- the single ordinary row through both `J` and `K` with the required order;
  or
- an explicit paired-path/order-cycle theorem stated directly in terms of
  `SelectedRowOrdinalComparison`.

The first target is the smaller and more falsifiable interface. A producer
that returns only a reachability path is nonterminal.

## Validation and scope

Focused scratch elaboration succeeded with a 64 MiB Lean thread stack and a
16 GiB memory cap. All printed declarations close over only:

```text
propext
Classical.choice
Quot.sound
```

The decidable no-triangle check closes over only `propext` and `Quot.sound`.
No `sorry`, `admit`, custom axiom, `native_decide`, or unsafe code appears in
the owned artifacts. No production file, plan doc, generated blueprint,
protected unique-row artifact, `SurplusM44`, or shell-curvature file was
modified.
