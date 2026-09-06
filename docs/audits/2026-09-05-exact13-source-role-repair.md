# Exact-13 source-role repair — 2026-09-05

## Status

**UNVERIFIED SOURCE REPAIR — NOT PROMOTED.** The narrow proof repairs below
have independent read-only review, but no completed Lean elaboration or
transitive axiom audit. Cell-zero coverage remains open.

Lane: `exact13-source-role-repair-20260905`.
Base: `955ef2c465c8822b856b204eafeba7f3278c4e55`.
Source: `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/CardGeThirteenExact13SourceRoleIngress.lean`.
Reviewed source SHA-256:
`229f208a05049add0777717e72613059e21777c7ad1c578b90f5dbc7816c952a`.

The previous draft was committed and the ownership registry reported it
unowned. This lane claimed only the repair source, this report, and its own
checkpoint; it preserved the existing record and mathematical statement.

## Repairs

1. Open the four namespaces supplying the existing statement's frontier,
   robust-surface, residual, and late-first-apex-system names. Imports do not
   propagate those files' local namespace openings.
2. Correct deletion-label image composition from `hd'.symm.trans hd` to
   `hd'.trans hd.symm` before applying label-map injectivity.
3. Transport the second deletion witness's `d' = z` or `d' ∈ K` conclusion
   through the proved equality `d' = d` before filling the retained field.
4. Derive `T.C0raw = V.sourceRow₁.rawSupport` and the corresponding C1
   equality with `raw_eq_of_image_eq`. Use them before converting blocker
   membership into the positional source row's support. These are separate
   structure fields, not interchangeable by definitional reduction.

Independent review in conversation record 15881 checked these repairs and
their source/deletion/blocker consistency. The source scan contains no
`sorry`, `admit`, `native_decide`, or custom `axiom` declaration. These are
source-review results, not a kernel trust audit.

## Validation incident and gate

The shared governed build held `lean/.lake/lake-build.lock` under PID 85119.
A direct imported `.olean` existed, so a single-file
`lean_diagnostic_messages` check was attempted. Contrary to the expectation
that this would only inspect the source, it spawned
`lake setup-file <SourceRoleIngress.lean> -` without `--no-build` and began
dependency compilation. The result was partial, still elaborating, with a
dependency-build information message; it was not a completed file check.

Only the self-started setup-file process, PID 68586, was terminated after
checking its exact source path and parent. A subsequent process check found
that setup process gone. The existing governed build and its lock were not
terminated or modified. No further ordinary LSP opening or concurrent raw
Lean check was launched. A direct `.olean` existence check does not establish
that opening a file in this LSP configuration is build-free.

Fresh validation requires either the governed gate to become available or
explicit user authorization for a bounded no-build check against the existing
compiled dependencies. A source-level review cannot discharge that gate.

## Remaining coverage obligation

The active parent plan's exact-thirteen section
(`docs/plans/2026-08-29-b1-global-continuation.md`, lines 1072–1085 and
1148–1162) retains source coverage as unproved and requires actual activation
and source-row hypotheses before terminal use.

The coverage audit found no exact-thirteen typed Boolean-root predicate or
checked root serializer in Lean. The current root is Python-generated SMT
strings in `cardge13_exact13_global_source_cell_csp_piqd.py`; the typed
provider-cancellation checkers validate local contradictions, not satisfaction
of that root formula. The repaired source-role module has no downstream
consumer yet. No import-only wiring or new off-spine obligation was added.

The next source-to-formula obligation is a semantic assignment predicate for
the exact-thirteen root and a constructor from the actual dispatch packet,
source-role witnesses, selected global rows with blocker guards, and an
explicit direct-cell-zero signature. That signature fixes direct orientation,
raw `z = 8`, and the raw K slice `{9,10}`; it must not be asserted for every
source packet. Root realization must precede any use of an UNSAT certificate
against the live source. It does not turn arbitrary Boolean SAT assignments
into geometric configurations.

Even after root realization, exhaustive contradiction coverage is missing.
The three-form terminal still needs the actual second blocker to equal 12;
the coarse signature does not provide that premise. The one-form terminals
also require their specific provider incidences. The previous 21-model SAT
wave and its 8,527 local certificates do not establish this coverage.
