# Rigid221 Exact-A2 math-skeptic audit

**Verdict: CERTIFIED (bounded Exact-A2 terminal).**

This certification is explicitly bounded to the Exact-17/second-cap-9
terminal rooted at the named exact-cardinality coordinator. It does not certify
the broader Rigid221 cluster, the unbounded A3 continuation, or the global
Problem 97 theorem. I found no mathematical counterexample to the narrow
terminal.

## Scope and artifacts

Audited against base `a301d85e2a432b2804cfc98fd9f3e620dc1f0ec5`:

- `lean/Erdos9796Proof/P97/ATail/ExactA2CapMetric.lean`;
- the two Exact-A2 declarations and their adapter in
  `lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/Rigid221SourceHeavy.lean`;
- the F0 prose in `docs/erdos-97-descent-prose-proof-atomic.md`;
- checkpoint 01 (SHA256 `55f13fad9a4876228c05ca5e04cb770bbc522cc11e0a5651ec2f119b376aed1b`);
- checkpoint 02 (SHA256 `95a771b301b399bb897c73b4ea6e3c1c16bbbb7df3f96c2fd1b795294d642630`);
- `/tmp/ExactA2CapMetric.draft-v2.lean` (SHA256
  `3ee501ed1d4b22a8bcd896f6737b3fffd19c1607b87000e33f9d828146a30efc`).

The draft is an external proposal input, not a claimed durable artifact. It
explicitly says “NOT COMPILED” at `/tmp/ExactA2CapMetric.draft-v2.lean:4` and is
not byte-identical to the landed source. In particular its coordinate norm
proof uses `EuclideanSpace.real_norm_sq_eq` at lines 33--36, while the landed
source uses `EuclideanSpace.norm_sq_eq` and additional normalization at
`lean/Erdos9796Proof/P97/ATail/ExactA2CapMetric.lean:35-38`. I therefore audited
the draft's mathematical implications, but use only the landed source and its
build below as Lean evidence.

## Mathematical reconstruction

The landed metric module has the expected dependency chain. The fan
constructor derives four positive parameters from convex separation, equal
radius, perpendicular-bisector equations, and the signed-side condition
(`ExactA2CapMetric.lean:51-134`). The positivity lemmas and row rigidity are
explicit (`:139-269`). The determinant/Lagrange identity and opposite-side
strict inequality are coordinate proofs (`:271-345`), and the scalar clearance
calculation is reduced to `4(2-m) < (m-1)^2` with a positive radius scale
(`:347-376`). The nested row-2 calculation establishes the required scalar
identities and clearance (`:406-588`). The four row alternatives then eliminate
rows 0, 2, and 3 by positive inner products, and row 1 supplies the chord
clearance and the final opposite-side contradiction (`:609-680`). The public
wrapper passes all these hypotheses without adding an unstated assumption
(`:688-721`).

The strict-side step is sound: opposite signs give `Ld^2 < (Ld-Lq)^2`, and
the displayed two-coordinate Lagrange identity bounds the latter by the
squared chord times `dist d q ^ 2` (`:319-345`). The final landing theorem
substitutes the row equality `dist d q = dist d v` and contradicts clearance
(`:592-601`). I found no sign/order error in these identities.

The source adapter supplies the abstract hypotheses as follows. It chooses a
two-point outside slice of `Kv` and extracts `q` (`Rigid221SourceHeavy.lean:11598-11615`),
proves `q` is not in the cap and obtains its boundary position
(`:11617-11626`), and uses exact-cover membership of the opposite apex to
obtain the four row alternatives (`:11627-11645`). Each alternative is
converted to the exact center-distance equation required by the metric theorem
(`:11646-11682`). Forward and reverse cyclic orders produce the `c`-side and
`q`-side sign products (`:11683-11799`). Five common-radius facts, distinctness
from the apex, and the four bisector equalities are passed to the landing call
(`:11800-11828`). On inspection these inputs faithfully arise from the current
producer; the unused next-row physical-hit argument is explicitly named with
an underscore at `:11122-11130` and is not silently needed by the metric proof.

## Independent Lean/trust checks

I did not run `lake-build` in this audit, as required. The supplied final
lock-governed build log is independently present and records:

```text
Build completed successfully (10874 jobs).
indexed 5486 files: 0 new, 1 changed, 5485 unchanged, 0 removed
mining call graph: 1 changed module(s) (176 symbols)
sync complete — index and kernel call graph match the current build.
```

These lines are from `/tmp/rigid221-exact-a2-lake-build-docstring.log:7249-7267`.
The same log identifies the command as the final source build. It emitted
warnings for unrelated declarations that use `sorry`, but no error identifying
either Exact-A2 declaration as sorry-based.

The fresh exact-target spine is `/tmp/rigid221-exact-a2-spine.txt:1-4,46-50,75-77`:
it is rooted at the exact-cardinality coordinator, reports `approved axioms:
core`, `open: 0/247 node(s)`, marks the root green, and says every branch
closes under the approved set. Its lines 77 onward separately list 29 open
frontier declarations off this root. This is the required separation between
the bounded terminal and the broader open cluster.

The direct axiom walks were:

```text
proof-blueprint axioms Problem97.ExactA2CapMetric.false_of_exactA2_boundary_data
  propext, Classical.choice, Quot.sound
proof-blueprint axioms Problem97.ATailFrontierLiveClosure.false_of_exactSeventeen_secondCapNine_exactCover
  propext, Classical.choice, Quot.sound
proof-blueprint axioms Problem97.ATailFrontierLiveClosure.false_of_exactFour...card_eq_seventeen_secondCapNine
  propext, Classical.choice, Lean.ofReduceBool, Lean.trustCompiler, Quot.sound
```

Thus the metric wrapper and inner exact-cover theorem have no `sorryAx` in
their transitive axiom closures. The outer coordinator also has no `sorryAx`,
but carries the declared native-reduction trust pair
`Lean.ofReduceBool`/`Lean.trustCompiler`, isolated to the pre-existing
unused-outside certificate branch. This is consistent with the repository's
`[CERTIFIED]` trust convention at `docs/erdos-97-descent-prose-proof-atomic.md:52-57`.
The unrelated warnings and broader open frontier do not enter these target
closures.

## Prose and scope findings

The new F0 paragraph accurately scopes the result as a terminal only: it says
the exact-17/cap-9 branch is closed at
`docs/erdos-97-descent-prose-proof-atomic.md:2020-2036`, then says the F0
cluster remains open and has no `|A| >= 18` transfer at `:2038-2040`.
The global document also continues to state that the publication target
reaches `sorryAx` and that 28 leaves remain at `:18` and `:95`.

The reconciled status ledger now describes both exact-cardinality arms as
proved (`docs/erdos-97-descent-prose-proof-atomic.md:4673-4687`), records the
implemented route and its source dependencies (`:4691-4716`), and marks the
bounded result `[LEAN-CLOSED]` while leaving unbounded A3 open (`:4719-4728`).
The F0 summary independently scopes the terminal and retains the open-cluster
and no-`|A|≥18` qualification (`:2020-2040`).

## Remaining scope (not a blocker to this certification)

The spine report explicitly lists 29 open declarations off the audited root
(`/tmp/rigid221-exact-a2-spine.txt:77-291`). The prose also states that the
F0 cluster remains open and that no unbounded `|A|≥18` transfer exists
(`docs/erdos-97-descent-prose-proof-atomic.md:2038-2040`; A3 at `:4730-4740`).
Those are separate obligations and must not be presented as consequences of
this Exact-A2 closure. The external draft's uncompiled status is likewise not
a blocker because the landed source is the authoritative artifact and is
covered by the successful build above.

On the stated bounded scope, the mathematical reconstruction, source-faithful
hypothesis extraction, successful lock-governed build, fresh `open: 0/247`
spine, and direct sorry/trust walks jointly justify **CERTIFIED**.
