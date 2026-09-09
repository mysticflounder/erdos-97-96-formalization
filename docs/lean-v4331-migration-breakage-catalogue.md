# Lean v4.27.0 -> v4.33.1 migration: confirmed breakage catalogue

This repo migrated Lean/mathlib from v4.27.0 to v4.33.1. Roughly 240 elaboration
regressions have already been repaired across ~50 files in eight rounds. The two
ROOT CAUSES below explain the large majority of them, and both are verified
against the v4.33.1 toolchain source. Read these first; they will usually tell
you the fix without further investigation.

## ROOT CAUSE A — `simpa ... using h` now closes at REDUCIBLE transparency

Verified verbatim in
`/Users/adam/.elan/toolchains/leanprover--lean4---v4.33.1/src/lean/Lean/Elab/Tactic/Simpa.lean`:

    Core implementation of the `simpa` tactic, parameterized by whether the final
    unification of the simplified `using` term against the simplified goal should
    be performed at reducible transparency (`useReducible := true`, used by
    `simpa using h`) or at the ambient default/semireducible transparency
    (`useReducible := false`, used by `simpa using! h`).

SIGNATURE: an error reading "Type mismatch: After simplification, term ... has
type X but is expected to have type Y" where X and Y PRINT IDENTICALLY or differ
only by an unfolded definition. They are defeq, just not at reducible transparency.

FIX: replace `simpa [...] using h` with `exact h`. `exact` is default transparency.
Do NOT use `simpa using! h` — that idiom appears nowhere in this repo and
introducing it across many files was rejected as a deliberate call.

## ROOT CAUSE B — full `simp` makes `Fin` matchers unreducible

Full `simp` rewrites a `fin_cases`/`rcases`-introduced scrutinee `⟨0, hlt⟩` into
the `Fin` NUMERAL `0` (via `Fin.zero_eta` / `Fin.mk_one`), and v4.33 will not
iota-reduce a `match` through an `OfNat` numeral. So the matcher goes stuck.

SIGNATURE: residual goals or hypotheses containing a literal
`match 0 with | ⟨0, isLt⟩ => ... | ⟨1, isLt⟩ => ... | x => ...`
or `match ↑1 with | 0 => ... | 1 => ... | x => ...`.
Index 2 usually still reduces, because it lands in the matcher's WILDCARD branch —
so only the 0 and 1 sites fail and the breakage looks sporadic.

FIXES, in order of preference:
1. `simp [...]` -> `simp only [...]`, and `simpa [...] using h` -> `simpa only [...] using h`.
   Keeping the scrutinee in `Fin.mk` constructor form lets the matcher reduce.
   NOTE: erasing the individual lemmas (`-Fin.zero_eta`, `-Fin.mk_one`) does NOT
   work; only dropping to `only` works.
2. If the discriminant is `i.val` rather than the `Fin` itself (i.e. you see
   `match ↑0`), add `Fin.val_zero, Fin.val_one, Fin.val_two` to the `simp only` set.
   Add only the ones actually needed or the unusedSimpArgs linter will fire.
3. Append `<;> rfl`, or `<;> (first | rfl | decide)`, to the failing tactic.
4. `exact h` in place of `simpa ... using h` (see ROOT CAUSE A).
5. A local bridge `have` GENERALIZED OVER THE `isLt` PROOF:
       have h0 : ∀ h : 0 < 3, f ⟨0, h⟩ = C1 := fun _ => rfl
   The non-generalized form does NOT match what `fin_cases` emits. Then `simp only [h0, ...]`.
6. Restate a hypothesis at the already-reduced form by plain definitional
   assignment: `have hL0 : q ∉ S.leftAdjacentInteriorByIndex 0 := hnot1`.
   This typechecks only if the defeq genuinely holds, so it is safe.

## Other confirmed classes

C. `omega` failures are almost always DOWNSTREAM of A or B: omega sees a stuck
   `match 0 with ...` term as an opaque atom distinct from the reduced form on the
   other side. Fix the reduction and omega closes unchanged. Do NOT add arithmetic
   lemmas before ruling this out.
D. `simp` no longer unfolds plain (non-reducible) `def` projections. Name the real
   def in the simp set, or use `exact` (still default transparency).
E. A simp set containing BOTH a def-unfold AND a rewrite keyed on that same def now
   fails: simp unfolds first, after which the rewrite can never match. Use `exact`.
F. `simp` rewrites a `Finset.filter` predicate but leaves the `DecidablePred`
   instance argument stale; `Finset.filter_congr_decidable` is no longer `@[simp]`.
   Fix: `show`/`change` the goal at the intended form, then `exact`.
G. `dist a b` no longer bridges to `‖a - b‖`. Add `dist_eq_norm` to the `rw` chain.
H. `grind`/`grobner` silently DROPS coordinate equations: `C 0` elaborates to
   `C.ofLp 0` with un-beta-reduced type `(fun _ => ℝ) 0`, and v4.33's ring module no
   longer beta-reduces before comparing instances (it reports
   `[issue] ring term with unexpected instance`). Fix: `beta_reduce at *` immediately
   before the call.
I. `ring_nf` and `dsimp` now ERROR on no-progress instead of silently passing. Often
   the call is simply redundant now (e.g. `congrArg (fun r => r ^ 2) h` arrives
   already beta-reduced in v4.33) and should be deleted — but first read the proof
   and confirm the following tactics still see the goal shape they expect.
J. A conditional simp rewrite from a `∀ ... -> (a && b) = false` hypothesis no longer
   fires: simp rewrites the enclosing `!(a && b) = true` to `a = false ∨ b = false`
   first, so the rule's LHS no longer occurs. Fix term-mode with `Bool.and_eq_false_iff`.
K. `simp` no longer normalizes between `2 ≤ m` and `1 < m` on `Nat`. They are the same
   term at default transparency, so term-mode `exact` works.
L. `HasDerivAt.add`/`.sub` are stated at `Pi` level, so `convert ... using 1` descends
   into instance arguments. Use `HasDerivAt.congr_deriv (by ring)`.
M. Field notation no longer resolves the deprecated `HasSubset.Subset.trans`. Name
   `List.Subset.trans` explicitly.
N. `List.getElem?_inj` is now an `Iff`. Add `.mp`.
O. `Std.Sat.CNF` is now a structure wrapping `Array (CNF.Clause α)`, not a `List`
   alias, with no `.ofList`/`.toList`. Produce with `⟨L.toArray⟩`; consume via
   `f.clauses`. `rw [Std.Sat.CNF.eval, List.all_eq_true]` becomes
   `rw [Std.Sat.CNF.eval, Array.all_eq_true_iff_forall_mem]`, and a following
   `simp only [<cnfDef>, List.mem_map]` must gain `List.mem_toArray`.

## HARD RULES — violating any of these fails the task

- NO `sorry`, `axiom`, `native_decide`, `decide +kernel`, `unsafe`. Plain `decide` IS allowed.
- NO file-level `set_option maxRecDepth` / `maxHeartbeats`. Per-declaration is
  acceptable ONLY if you explicitly report it.
- NO changes to any theorem/def STATEMENT, hypothesis, binder, or name. Proof BODIES,
  imports, and renamed-lemma references ONLY.
- Do NOT run `lake build` or `lake-build`. Validate ONLY with:
      cd /Users/adam/projects/math-projects/erdos-97-96-formalization/lean && \
        lake env lean -M16384 -s2097152 <your file>
- Ignore ALL warnings (deprecations, `linter.*`) unless they are errors.
- Do NOT commit. Do NOT touch any file other than your assigned one.
- `git status` shows ~50 other modified Lean files; they belong to the parent session
  and to sibling agents. Leave them alone.
- Delete every scratch file you create.

Report: the diff (summarize repeated identical patterns rather than pasting all of
them), the validation exit code, and a count of sites per class letter above.

## Addenda confirmed in round 9

P. Class E has TWO surface symptoms depending on list size: a
   `linter.unusedSimpArgs` note for a small list, or
   `Tactic simp failed with a nested error: (deterministic) timeout at whnf`
   when the unfolded list is large (e.g. a `labelPairs.all` nested inside a
   `labelPairs.all` builds a 2025-conjunct goal). Same cause, same fix: drop the
   def-unfolds and close term-mode with `exact`.
Q. `simp` no longer computes `Finset.erase` on an insert-literal unless the erased
   element is the HEAD. `capS.erase 1` reduces; `capO2.erase 1` and `capS.erase 2`
   do not. Fix: name the erase identity with `by decide` (plain `decide` is allowed),
   `rw` it into the hypothesis, then `exact`.
R. NESTED selectors need fixes B.1 and B.2 applied OUTWARD-IN, not one or the other.
   Dropping to `simp only` fixes the outer matcher and can then EXPOSE a second stuck
   matcher one level down (e.g. `oppositeVertexByIndex` matches on `i.val` while
   `oppIndex2` returns `Fin 3` numerals). Add `Fin.val_*` for the inner one.
S. PREFER converging on an idiom that already compiles in the same file or a sibling
   file over inventing a repair. Several round-9 fixes were simply the shape the
   neighbouring `fin_cases` bullets already used.

## Addenda confirmed in rounds 12-14

T. A printed term/goal mismatch is NOT by itself evidence of root cause A — it can be a
   downstream artifact of B. In PhysicalSecondApexSwap the term side read
   `(S.triangleNonObtuse.toMoserTriangle.toStructural ⋯).v2` against the goal's
   `S.triangle.v2`, which looked like A, but dropping to `simp only` closed all six sites
   with no `exact` needed: once the `Fin` matcher reduces, `simpa`'s reducible-transparency
   unification handles that projection gap fine. Always try B.1 before reaching for A.
U. Class J (Bool `!(a && b) = true` normalized before a conditional hypothesis can fire) has
   now appeared in TWO unrelated files. The tell is a `linter.unusedSimpArgs` note naming the
   hypothesis you expected to do the work.
V. A single theorem's `interval_cases` branches can belong to DIFFERENT classes — in
   PinnedSurplusProducer branches 0/1 were class B nested selectors while branch 2 was pure
   class A. Restructuring to `refine ⟨?_, ?_, ?_⟩ <;> simp only [...]` with bullet `exact`s
   covers both at once.
W. MASKED sorryAx: a failing proof does not always surface as an error in dependent files —
   v4.33 error recovery injects `sorryAx` into declarations that consume it. Found so far in
   CheckpointedRupSemanticBoundary, ExactFourAdjacentGridKalmanson, SurvivalCover,
   card_five_interior_survivor_pair, and card_five_cross_blocker_localization — the last two
   hitting PUBLIC consumer theorems. All cleared once the underlying site was repaired.
   A second tell: several reported error positions in one file collapse to a single real
   failure, the rest being recovery fallout, so an error COUNT overstates the site count.
   HOW TO RULE IT OUT rather than merely notice it. A module's own `#print axioms` commands
   cover only the declarations the author chose to print, so a file that elaborates clean and
   prints clean can still carry a masked `sorryAx` on an unprinted declaration
   (UniqueFourLateChoiceTerminal prints 11 of its 25). Appending `#print axioms` for every
   NAMED declaration to a scratchpad copy is better, but still misses internal and auxiliary
   constants. The definitive form: append to the scratchpad copy a `#eval` that walks
   `env.constants.map₂` — exactly the constants this module adds — and runs
   `Lean.collectAxioms` on each, flagging anything outside
   {propext, Classical.choice, Quot.sound}. That covers auxiliary declarations no hand-written
   list would name; it reported checked=140 offenders=[] for ExactFourRobustCapExpansion.
   Keep the copy in the scratchpad, never under lean/, and delete it afterwards.
   CRITICAL: `lake env lean` exits 0 on a file containing `sorry` — it is a WARNING, not an
   error. This was confirmed with an oracle file that carried a deliberate `sorry`, swept
   dirty, and still exited rc=0. So an exit code says nothing about class W; only the sweep
   does. Never report a file as free of masked `sorryAx` on the strength of a clean compile.
   This is also a per-file check only. A green single-file elaboration is never evidence that
   a CONSUMER in another module is clean, which is why the Gate D comparison stays
   load-bearing.
   MIRROR TWINS: to justify carrying a repair from one file to its mirror, normalise both
   compiler dumps (strip filename and line:col) and diff them. In IndexedSource/{Direct,
   Mirror}CapFamilies the goal text was byte-identical apart from the _direct/_mirror name
   suffixes. Do that rather than assuming the twins match.
   A green build is therefore NOT sufficient; the Gate D axiom comparison against the
   v4.27.0 baseline is load-bearing.
X. PRIVATE PROJECTION, unnameable from the consuming module. A sub-case of root cause A where
   naming more lemmas can never work: the def sits behind a `private` constructor and prints
   with a dagger, e.g. `toCriticalPairFrontier✝`. `simp` cannot unfold what you cannot name,
   so no simp set repairs the site. `exact h` unfolds it at default transparency. Seen at
   ExactFiveCommonAdaptiveReselection:113, where
   `ExactFiveInteriorCriticalPairFrontier.frontier` routes through a private
   `FirstApexExactFiveInteriorFrontier.Witness.toCriticalPairFrontier`. The defining file
   already relies on the same defeq term-mode, so `exact` is the established idiom (class S).
Y. `Equiv.swap a b c` with `c ∉ {a, b}` no longer reduces under `simp`. The
   `swap_apply_left` / `swap_apply_right` cases still fire, so within one theorem some swap
   sites break and others do not — the same sporadic look as class B. FIX: add
   `Equiv.swap_apply_def` to the simp set. Seven sites in ExactFiveCommonShellAdapter, in a
   file that already used `Equiv.swap_apply_def` ten times further down (class S again).
Z. WHEN A LOCAL BRIDGE BEATS A PER-BRANCH REPAIR. Where a class-B/R site sits under
   `interval_cases` with three near-identical bullets, hoisting one
   `have hbridge : ∀ i : Fin 3, S.fooByIndex i = fooAt S.partition i := by intro i; fin_cases i <;> rfl`
   above the case split, then `rw [hbridge ...]; exact h`, replaces all three bullets at once
   and removes the case split entirely. In ExactFiveCommonShellAdapter this turned 95 deleted
   lines into 70 inserted ones. Prefer it whenever the same selector is destructured more than
   once in a single proof.

## Addenda confirmed in rounds 20-23

AA. THE GROUND EVALUATOR — deterministic whnf timeout on a generated list.  v4.33 `simp`
    carries a ground evaluator (`Simp.Config.ground`, driven from
    `Lean/Meta/Tactic/Simp/Rewrite.lean:435-465` and `Types.lean:822`).  It delta-unfolds a
    `def` whose body is a closed ground term BY ITSELF and whnf-evaluates it.  Consequence:
    the timeout fires even when NO def-unfold appears in the simp set, so splitting or
    shrinking the simp set does NOT fix it.  The site must leave `simp` entirely.
    SIGNATURE: `(deterministic) timeout at whnf` on a `simp only` closing a
    `<generated list>.length = <literal>` or `.all p = true` goal.
    FIX, the shape now used in five modules: prove the append/map step over ABSTRACT lists in
    a local `have`, then close with a term-mode `exact` chain over the per-chunk lemmas.

      theorem bridgeEntries_length : bridgeEntries.length = 3218 := by
        have hlen : ∀ (l₁ l₂ : List BridgeEntry) (a b : Nat),
            l₁.length = a → l₂.length = b → (l₁ ++ l₂).length = a + b := by
          intro l₁ l₂ a b h₁ h₂
          rw [List.length_append, h₁, h₂]
        exact (hlen _ _ _ _ (hlen _ _ _ _ ... chunk01_length chunk02_length) ...)

    `exact` delta-unfolds at default transparency with no ground evaluation, and the Nat
    literal sum tree closes by defeq.  Where the goal is a `map` over the append chain, add a
    second abstract `have hmap : ∀ l a, l.length = a → (l.map f).length = a`.
    Applied in BridgeChunkAll, two BridgeAll modules, P4DirectOuterArcFiniteData, and
    OccurrenceBridge/BridgeMain.  For the `.all` variant the abstract step is
    `rw [List.all_append, h₁, h₂]` followed by `rfl`.
    GENERATOR NOTE: three of those files are emitted by a `generate.py`.  Patch the generator
    too, or the next regeneration reintroduces the timeout.  Both
    `scratch/atail-force/unique4-p4-{radius-partition,mirror-outer}-occurrence-bridge/generate.py`
    were patched and re-verified to emit the repaired shape byte-for-byte.

AB. DIFF THE REPAIRED SIBLING BEFORE DERIVING ANYTHING (class S, generalised).  By round 20
    most remaining failures were the SAME four idioms recurring in mirror/variant files, and
    the fastest correct repair was `git diff` on the already-green twin rather than a fresh
    analysis.  Established pairs: P4RightCapSourceBridge <-> P4MirrorCapSourceBridge <->
    AllLargeCapCanonicalInterfaces:352-371; IndexedSource/{Direct,Mirror}CapFamilies;
    ExactFiveCommonShellV7/{PrefixSemanticCore,LivePacket}.  Normalise both dumps (strip
    filename and line:col) and diff them before carrying a repair across, per class W.

AC. THE FOUR REPEATED SHAPES that make up nearly all of the remaining tail:
    1. `· simpa [Packet.X, hi] using S.triangle.vN_mem` -> `simpa only [...]`, and only the
       index-0 and index-1 bullets need it.
    2. `interval_cases i <;> simp [...]` -> `simp only [...] <;> rfl`.  The `<;> rfl` is a
       DEFAULT, not a rule: drop it wherever the linter reports it unreachable — the
       `surplusIdx` variant usually needs none.
    3. `interval_cases i <;> simpa [capByIndex, surplusCap, hi] using hnot` ->
       `simpa only [...]`.
    4. Any non-reducible or private `def` projection chain (including
       `.toSelectedFourClass.support` against `.support`): `simpa ... using h` -> `exact h`;
       as a structure field or anonymous-constructor argument it collapses to the bare `h`.

AD. DO NOT SWEEP THE REPO MECHANICALLY.  The shape-1 idiom above occurs 103 times across 34
    files, but 30 of those files already build green: the idiom breaks only where the
    surrounding proof leaves the `Fin` matcher in numeral form.  Rewriting the working 30
    would churn source and force downstream rebuilds for no gain.  Repair only what the
    compiler actually reports.

AE. CLASS F, `dite` VARIANT — a stale `Decidable` instance from ONE combined `simp only`.
    `simp only [decodeVar, encodeVar]` unfolds `decodeVar` FIRST, instantiating its `dite`
    chain at the un-normalised argument, and only then rewrites `encodeVar …` inside the
    PROPOSITIONS, leaving the `Decidable` instance keyed on the old term.  The goal is then
    not type-correct at implicit transparency, so a following `rw [dif_pos …]` reports
    "Did not find an occurrence of the pattern" even though a `dite` is plainly present, and
    every postponed `by omega` fails afterwards against an unassigned goal (class C fallout).
    SIGNATURE: `Application type mismatch: The argument instDecidableAnd has type
    Decidable (… encodeVar x …) but is expected to have type Decidable (… 1 + ↑x …)`.
    FIX: SPLIT the call — `simp only [encodeVar]` on one line, `simp only [decodeVar]` on the
    next, so the argument normalises before the equation lemma is instantiated and the
    instance is built from the final proposition.  Seven instances in
    ExactFiveCommonShellV7/FullRadiusAtoms, where 7 real sites accounted for all 13 errors.

AF. `Finset.mem_filter` NO LONGER FIRES IN `simp` WHEN THE MEMBERSHIP GOES THROUGH `SetLike`.
    In a goal whose membership elaborates as
    `@SetLike.instMembership (Finset (Fin 11)) (Fin 11) Finset.instSetLike` rather than
    `Finset.instMembership`, the mathlib lemma head no longer matches at reducible
    transparency, so `simp only [Finset.mem_filter, Finset.mem_univ, true_and]` leaves the
    `Finset.filter` standing and any following `change` or `rw` pattern cannot match.
    TELL: `'change' tactic failed, pattern ...` together with `linter.unusedSimpArgs` notes
    naming `Finset.mem_filter` / `Finset.mem_univ` / `true_and` — one real failure showing up
    as four reported positions.  `Finset.mem_filter_univ` is dead in `simp` here too.
    FIX: drop to term mode, where unification runs at default transparency:
      ⟨fun h => (Finset.mem_filter.mp h).2, fun h => Finset.mem_filter.mpr ⟨Finset.mem_univ _, h⟩⟩
    Prefer that shape over `mem_filter_univ`: the repository already uses it 932 times and
    `mem_filter_univ` zero times (class S).  Seen at
    Unique4P4DirectValuation/RightCapDirectValuation:56-66.
    Diagnostic habit that settled it: print the goal with `pp.explicit` before rewriting.
    The instance path is invisible in the ordinary pretty-printed goal, so the site looks
    like root cause B until you see which `Membership` instance is actually in play.

AG. `omega` LOSES A `Fin` BOUND WHEN THE BOUND ITSELF CONTAINS A STUCK MATCHER.  Class C's
    deeper form.  `omega` harvests each `Fin` hypothesis from `Fin.isLt`
    (`.../v4.33.1/src/lean/Lean/Elab/Tactic/Omega/OmegaM.lean:179`).  If the bound reads
    `↑choice < sourceChoiceCount ((fun i => i) ⟨0, ⋯⟩)` — where `sourceChoiceCount` is a
    `match` on `source.val` that v4.33 will not reduce — omega takes the whole right-hand
    side as an OPAQUE ATOM and has no numeric bound at all.  As a `simp (disch := omega)`
    discharger it then silently fails to prove the `dif_pos` side condition, and the only
    visible trace is a `linter.unusedSimpArgs` note saying `dif_pos` was unused.
    FIX: hoist the bound and reduce it BEFORE the case split, so omega sees a literal:
      fin_cases source <;>
        have hchoice := choice.isLt <;>
        simp only [sourceChoiceCount] at hchoice <;>
        simp (disch := omega) only [...]
    Adding arithmetic lemmas never helps; only reducing the matcher inside the bound does.
    Seen at ExactFiveCommonShellV7/FullSourceChoiceSemantics:303, where 1 real failure
    accounted for all 13 reported positions — the other 12 were pre-existing warnings and
    `#print axioms` info lines.  The two sibling theorems at :313-336 already used this
    idiom, so it is class S again.

AH. SELF-DEFEATING SIMP SET UNDER `fin_cases` — leave `simp` for a two-branch term proof.
    A `fin_cases a <;> fin_cases b <;> simp [varDef, totalValDef, asLabel] at h ⊢` over a
    121-cell grid now dies as `(deterministic) timeout at transform`.  The timeout is a
    SYMPTOM, not a resource problem: raising heartbeats in a throwaway probe exposes the real
    error, `maximum recursion depth`, with `Possibly looping simp theorem: totalVal.eq_1 …
    Possibly caused by: asLabel, dvd_refl, Nat.mod_mod_of_dvd`.  The set carries the
    def-unfold `asLabel` while the same file has `@[simp] asLabel_val : asLabel point.val =
    point` keyed on `asLabel` (class E); the unfolded `⟨n % 11, _⟩` then feeds
    `Nat.mod_mod_of_dvd`/`dvd_refl` into a non-terminating rewrite.  Root cause B compounds
    it, because `fin_cases` plus full `simp` leaves the variable matcher in `Fin`-numeral
    form.  Per class AA the site must leave `simp` altogether rather than have its list
    trimmed.  FIX — the grid has exactly two branch shapes, and both close term-mode:
      fin_cases source <;> fin_cases center <;>
        first
          | exact (hsmall (by decide)).elim
          | exact Iff.rfl
    Cells that hit an explicit compact arm contradict `hsmall` by `decide` on a Nat literal;
    the rest take the default arm, where both sides are defeq at default transparency and the
    kernel re-checks every cell.  Only plain `decide` is used.  Applied in
    Unique4P4DirectValuation/DirectIndexedAgreement and its mirror twin
    Unique4P4MirrorValuation/MirrorIndexedAgreement.

## AI — class AF, refined: `Finset` membership is `SetLike` and `Finset.mem_filter` never matches

The class AF entry said `Finset.mem_filter` "no longer fires in `simp`".  Build 32 pinned the
mechanism, and it is stronger than that: in v4.33.1 mathlib there is NO `Finset.instMembership`
at all.  `Mathlib/Data/Finset/Defs.lean:101` declares `instance : SetLike (Finset α) α`, and
every `a ∈ (s : Finset α)` therefore elaborates through `@SetLike.instMembership`.  Under
`pp.explicit` the goal reads

    @Membership.mem Label (Finset (Fin 11))
      (@SetLike.instMembership (Finset (Fin 11)) (Fin 11) (@Finset.instSetLike (Fin 11)))
      {i | …} (reflFin point)

with `pp.notation false` confirming the collection really is `Finset.filter (fun i => …)
Finset.univ`.  Against that goal ALL of `rw [Finset.mem_filter]`, `simp only
[Finset.mem_filter]`, `rw [Finset.mem_filter_univ]` and `simp only [Finset.mem_filter_univ]`
fail — the first two with "Did not find an occurrence of the pattern `?a ∈ Finset.filter ?p
?s`", the last two silently, as an `unusedSimpArgs` note.  Do not spend probes rediscovering
this; go straight to the term-mode bridge.

Second-order symptom: a following `change` that used to align the two sides now fails with
"pattern is not definitionally equal to target", because `x ∈ Finset.filter p s` is only
PROPOSITIONALLY the conjunction, never definitionally.  The `change` is not the defect.

FIX — state the membership step as a `have` proved in term mode, where elaboration unifies at
default transparency and unfolds the intervening `def`s (`mirrorMembershipVal`,
`membershipVal`, `selectedRowSupport`) on its own:

    have hbridge : mirrorMembershipVal Q ⟨center, point⟩ ↔ <predicate side> :=
      ⟨fun h => (Finset.mem_filter.mp h).2,
        fun h => Finset.mem_filter.mpr ⟨Finset.mem_univ _, h⟩⟩
    simp only [hbridge, rowMem]
    rw [<the original congr chain>]

Applied in Unique4P4MirrorValuation/MirrorOuterFamilySatisfaction.

## AJ — `simp` no longer identifies two names for the same cyclic index

`classHit_mirror_five` fed `simpa [mirrorIndex, P.boundary_eq] using h` a term whose type
mentions boundary index `6` against a goal that, after `mirrorIndex` unfolds to `fun i => -i`,
mentions `-5`.  In v4.27 `simp` closed the gap; in v4.33.1 it reports a class-A style
"Type mismatch: After simplification" whose two sides differ only in the index spelling.
FIX — do not unfold `mirrorIndex`; give `simp` the normalized index equation instead, proved
by the kernel decision procedure on the finite index type:

    have hidx : mirrorIndex 5 = 6 := by decide
    simpa [hidx, P.boundary_eq] using …

Plain `decide` only; `native_decide` is not needed and is not permitted here.

## AK — a stuck `Fin` matcher reaches `omega` as an opaque atom

Recorded under root cause B, but worth its own tell because the reported error names `omega`
and not `simp`.  `omega could not prove the goal: a possible counterexample may satisfy … where
b := ↑(match 0 with | 0 => 689 | 1 => 760 | … | x => 701)` is class B, not arithmetic: the
`fin_cases` scrutinee became a `Fin` numeral, `Fin.val` of a numeral does not reduce, and the
`Nat` match over it never fires, so `omega` abstracts the whole branch table as one atom.
Adding arithmetic lemmas cannot help.

`simp` to `simp only` is necessary but NOT sufficient here.  In
ExactFiveCommonShellV7/G3V6U5NontripleSliceLedger `sourceChoiceVariable_lt` it took the
eleven reported failures down to three — the branch table `sourceChoiceStart` reduced, but
`sourceChoiceCount` did not, because that one appears in the TYPE of the bound variable
(`choice : Fin (sourceChoiceCount source)`) and `simp only ... at choice` will not rewrite a
`Fin` index there.  `omega` harvests its `Fin` bound from `Fin.isLt`
(`.../Lean/Elab/Tactic/Omega/OmegaM.lean:179`), so the bound arrived with a stuck matcher and
was dropped — this is class AG in its type-position form.

FIX — hoist the bound into an ordinary hypothesis BEFORE the case split, where `simp only`
can reach it:

    have hlt : choice.val < sourceChoiceCount source := choice.isLt
    fin_cases source <;>
      simp only [sourceChoiceVariable, sourceChoiceStart, sourceChoiceCount] at hlt ⊢ <;>
      omega

Isolate a case like this in a probe file that imports only the defining module — the enclosing
ledger module carries `native_decide` evidence and takes several minutes per check, while the
probe returns in seconds and reproduces the failure exactly.

## Running the class-W sweep cheaply

Do NOT re-derive the probe per file.  `scratchpad/sweep-probe.lean` holds the `run_cmd` that
walks `env.constants.map₂` and runs `Lean.collectAxioms` on each constant, and
`scratchpad/sweep.sh <module-path-relative-to-lean/>` appends it to a scratchpad copy, runs
`lake env lean`, prints `SWEEP_RC` and `CLASSW checked=… offenders=…`, and deletes the copy.
It was validated against the numbers a hand-written probe produced on the same modules.

The copy MUST be written into the source module's own directory, not into the scratchpad.
Modules such as ExactFiveCommonShellV7/G3UsedCenterSliceLedger and
ExactFiveCommonShellV7/G3V6U5NontripleSliceLedger read their evidence with
`include_str "data/…"`, which resolves relative to the file being compiled; a scratchpad copy
fails that read with `no such file or directory (error code: 4294967294)`, every downstream
`native_decide` then reports `uses 'sorry' and/or contains errors`, and the probe dutifully
reports `sorryAx` offenders that do not exist in the real module.  Treat `SWEEP_RC=1` together
with an `include_str` line in the module as a harness failure and re-run, not as a class-W
finding.  Name the copy something that is not a case variant of the original: this machine's
filesystem is case-insensitive, and `cat a.lean > A.lean` self-appends without bound.
Read the result as: `offenders` naming only `*._native.native_decide.ax_*` constants and the
theorems consuming them is the pre-existing native evidence, not a regression — confirm with
`git show HEAD:<path> | grep -c native_decide` against the worktree count.  Any `sorryAx` at
all is a real class-W finding.
