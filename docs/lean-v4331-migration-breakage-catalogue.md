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

## AL — no `Decidable` instance for a bounded `∀` over an `Array`

`Init/Data/List/Basic.lean:886` still declares `List.decidableBAll`, but v4.33.1 has no
`Array` analogue.  A statement of the shape `∀ index ∈ (arr : Array α), p index`, where the
proof is `native_decide` or `decide`, therefore fails at ELABORATION of the goal with
`failed to synthesize Decidable (∀ index ∈ …, …)` — before the decision procedure runs.
The tell is the `failed to synthesize` line naming a bounded `∀`, followed by a `sorryAx`
in the `#print axioms` of that very theorem.

FIX — do not restate the theorem.  Move the decision onto the `Array.all` Boolean, which is
decidable by computation, and transport it back with
`Array.all_eq_true_iff_forall_mem` (`Init/Data/Array/Lemmas.lean:689`):

    have hall : (arr).all (fun index => decide (p index)) = true := by
      native_decide
    intro index hindex
    exact of_decide_eq_true (Array.all_eq_true_iff_forall_mem.mp hall index hindex)

The `native_decide` is the file's pre-existing one, relocated inside the `have`; nothing new
is trusted.  Applied in ExactFiveCommonShellV7/S2O0RetainedCoreComputedFacts
`s2O0RetainedConvexFiveOccurrences_valid`.  This is the same upstream `List`-to-`Array` move
that turned `Std.Sat.CNF` into an `Array` wrapper, so `rw [… , Array.all_eq_true_iff_forall_mem]`
already appears in Census554/BaseSat and CoverIndexBridge — copy the idiom from there.

## AM — `simpa only … using` will not unfold a `private def` from another module

In ExactFiveCommonShellV7/G3Checkpoint0ClauseBank, twenty-nine `simpa only [xs, sat] using …`
calls broke with a "Type mismatch: After simplification" whose two sides differed only by
`List.take (retainedBaseCount✝ + 1)` against `List.take 108705`.  `retainedBaseCount` is a
`private def` in G3BaseSliceLedger, so it cannot be named in the simp set from the consuming
module, and `simpa`'s reducible-transparency unification will not unfold it on its own.
The dagger in `retainedBaseCount✝` is the tell that the blocking constant is inaccessible.

FIX — delete the tactic.  Every one of those sites was closed by a bare `exact`: the `let`s
`xs` and `sat`, `List.drop 0`, and the private numeral all reduce at DEFAULT transparency,
which is exactly what `exact` uses and what `simpa` no longer does.  Do not reach for a
`show` with the private name; it is not in scope.

## AN — the standard repair for a root-cause-A `simpa`, and when each variant fails

By build 45 the tail was almost entirely root cause A, and three repairs cover it.  Try them
in this order; each is strictly weaker than the one before in what it assumes.

1. `exact T`.  Correct when the erased simp set held only `let` names and structure
   projections, which `exact` unfolds at default transparency anyway.  If a `simp only` is
   left in front of it, v4.33.1 now ERRORS with `simp made no progress` — delete it.
2. `simp only [<same set>]` then `exact T`.  Correct when the simp set does real rewriting on
   the GOAL.  This is the default choice; it keeps every rewrite the original had and moves
   only the final unification back to default transparency.
3. `simp only [<same set>] at h ⊢` then `exact h`.  Needed when the term is a HYPOTHESIS the
   original `simpa` was also simplifying.  Variant 2 silently compares a simplified goal
   against an unsimplified hypothesis and fails with a mismatch that looks identical to the
   original one — the tell that you need `at h ⊢`.

A fourth case resists all three: the site sits in ARGUMENT position, `f (by simpa using h)`,
and the gap is a single projection.  Deleting the `by simpa` is wrong there, because the raw
hypothesis has not had the default simp set applied to its other side.  Add the projection's
def to the ORIGINAL `simpa` instead — for example
`simpa [CriticalShellSystem.blockerVertex] using hsurplus`.  Before unfolding anything by
hand, check whether the two sides are related by a THEOREM rather than by definition:
`S.surplusApex` and `S.oppositeVertexByIndex S.surplusIdx` are not defeq, and every copy of
the bridging lemma in this repository is `private` to some other module.

scratchpad/repair_simpa.py performs variant 2 for the single-line form, driven by the build
log so it only touches lines the build actually reported.  The multi-line form and the
argument-position form still need a hand edit.

## AO — `List.map_map` leaves a composition that no longer beta-reduces

`simpa only [… , List.map_map] using …` in FrontierLiveClosure/Balanced555FiniteFormula broke
with the two sides reading `fun atom ↦ encodeSelectedLiteral (atom, false)` and
`encodeSelectedLiteral ∘ fun atom ↦ (atom, false)`.  v4.27 beta-reduced the composition back;
v4.33.1 leaves it.  FIX — add `Function.comp_def` to the simp set.

## AP — `simp` that used to close a goal now leaves a disjunct permutation

In FrontierLiveClosure/TriApexEndpointRetainedOmission `hSupport`, `simp [named]` used to
finish and now stops at `x = C ∨ x = K ∨ x = L ∨ x = J ↔ x = C ∨ x = K ∨ x = J ∨ x = L`.
Nothing is wrong with the simp set; the goal is a pure reordering.  FIX — follow it with
`tauto`.  Do not add `or_comm`/`or_assoc` to the simp set, which loops.

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

## AQ — the green build is not the whole library: stale v4.27 oleans outside the root closure

`lean/lakefile.toml` declares `Erdos9796` and `Erdos9796Proof` with no `roots` and no `globs`,
so `lake build` compiles only what the two root modules transitively import.  Every other
module under `lean/Erdos9796Proof/` keeps whatever `.olean` it last had — at the v4.33.1 pin
that means a v4.27 artefact that no build regenerates and no build reports.  Build 53 was
green on 14049/14049 jobs with 1264 such oleans still present.

The tell is `comparator/check-conformance.sh` exiting 1 on

    FAIL [core]: audit reported an error: failed to read file …/<Module>.olean, incompatible header

FIX — delete them.  A v4.27 olean is not part of any verified build; it is an unreadable file
that only produces cascade failures, because a module importing it fails with
`incompatible header` before its own elaboration is ever attempted.  Deleting costs nothing:
the source is what is verified, and `lake build` regenerates the olean from that source in
dependency order.

    find lean/.lake/build/lib/lean/Erdos9796Proof lean/.lake/build/lib/lean/Erdos9796 \
      \( -name '*.olean' -o -name '*.ilean' \) ! -newermt '<pin date>' -delete

Do NOT try to enumerate the regressions first with a parallel `lake env lean` fan-out over the
stale modules.  `lake env lean` type-checks one module against its dependencies' oleans, so a
module whose imports are still stale reports `incompatible header`, not its own errors: on this
repository 149 of the first 153 sweep results were cascade noise.  Dependency order is what
forces the waves, and only a real build satisfies it.

### AQ.1 — how large the gap is, how to measure it, and what was done about it

Counted at the source level rather than from the olean tree:

    uv run python scripts/lean_build_closure_orphans.py --lake-root lean \
      --json docs/audits/2026-09-09-lean-build-closure-orphans.json

Against the two library roots alone that reported `orphans=1383`: 1383 of the
6534 modules under `lean/Erdos9796*/` were outside every declared target.  They
divided as 692 under `P97/ATail`, 385 under `P97/ErasedCertificate`, 206 under
`P97/Census554`, 17 under `P97/MultiCenter`, and the rest scattered.  The 1249
stale v4.27 oleans deleted on 2026-09-09 were all drawn from this set, which is
why deleting them changed no build job count.

Read this before reporting a green build: a green `lake build` of the declared
targets says nothing about the orphans, and neither does
`comparator/check-conformance.sh`, whose `Challenge`, `Solution`, and
`axiom-audit` targets all reach the library only through `Erdos9796Proof`.

WHICH ORPHANS MATTER — the deciding test is not "does the name look on-spine",
it is "does a bank source manifest name it".  A `census/card_head` bank pins a
frozen `LEAN_DEPENDENCY_MODULES` tuple and re-mining it needs those modules'
oleans, so they are supported surface whatever imports them.  Crossing the two
sets:

    37 of the 90 frozen bank dependency modules were orphans,
    and their own imports pulled in 11 more, for 48.

FIX — `lean/Erdos9796BankSupport.lean` imports exactly those 37 seeds and is
declared as a third `lean_lib` in `lean/lakefile.toml`, listed in
`defaultTargets`.  That is a deliberate scope decision, not a migration repair:
it turns every regression in those 48 modules into a build failure.  It cost
thirteen repairs, twelve of them the one-line class AV fix below.  Afterwards

    modules=6535 in_closure=5200 orphans=1335

The remaining 1335 are off-spine by decision: nothing imports them and no bank
manifest names them.  Bringing them in would need `globs = ["Erdos9796Proof.+"]`
and is a separate scope question.

## AR — `bv_decide` moved out of Mathlib and stopped unfolding reducible definitions

`import Mathlib.Tactic` no longer pulls in `bv_decide`; the tell is
`to use `bv_decide`, please include `import Std.Tactic.BVDecide``.  Adding the import then
exposes a second change: `bv_decide` abstracts a `private abbrev` applied to the goal variable
as an opaque term and reports

    The prover found a potentially spurious counterexample:
    - It abstracted the following unsupported expressions as opaque variables: [hasDuplicate bits]

FIX — add the import, then `simp only [<the abbrevs>]` before `bv_decide`.

## AS — `Set.Finite.isCompact_convexHull` takes the field explicitly

`hs.isCompact_convexHull` now needs the scalar field as an explicit argument.  The tell is
`failed to synthesize instance of type class Field 𝕜✝` reported at the DOT-NOTATION position,
not at the `have` whose statement mentions the set.  FIX — `(hs.isCompact_convexHull ℝ).isClosed`.
`Set.Finite.diff` is in the same area and is now a deprecated alias for `Set.Finite.sdiff`.

## AT — `Std.Sat.CNF` is a structure over `Array`, and there are two ways out

`CNF α` was a `List (Clause α)` alias; v4.33.1 declares
`structure CNF (α) where clauses : Array (CNF.Clause α)`, with `Clause α = List (Literal α)`,
an `Append (CNF α)` instance, and `eval a f = f.clauses.all fun c => c.eval a`.  Every list
idiom on a `CNF` therefore breaks at once: `.map`, `.length`, `.Nodup`, `[[]]`, `= []`,
`List.all_eq_true`, `List.mem_append`, `List.length_append`, `List.Nodup.append`.

Pick the route by where the module's centre of gravity is.

Route 1 — the module really is a CNF (it renders DIMACS, it is consumed as a formula).  Keep the
`CNF`-typed name, retype the clause-list building blocks as `List (Std.Sat.CNF.Clause α)`, and
wrap once: `def baseCnf : Std.Sat.CNF Atom := ⟨(a ++ b ++ … ++ z).toArray⟩`.  Then
`.map` → `.clauses.toList.map`, `.length` → `.clauses.size`, and
`rw [Std.Sat.CNF.eval, List.all_eq_true]` → `rw [Std.Sat.CNF.eval, Array.all_eq_true_iff_forall_mem]`
with `List.mem_toArray` added to the membership `simp only`.  The rest of the proof survives.

Route 2 — the module is really about the clause LIST (it proves `Nodup`, counts clauses,
compares against `[]` and `[[]]`).  Keep every definition list-typed and respell the eval
statements at list level: `Std.Sat.CNF.eval sigma (X)` → `(X).all (Std.Sat.CNF.Clause.eval sigma)`,
and `Std.Sat.CNF.eval_append` → `List.all_append`.  That is the same predicate `CNF.eval`
computes, and it leaves every `Nodup`, length, disjointness and `= [[]]` proof untouched.
On `Rigid221Card18DirectCardinality` route 2 was nine edited lines; route 1 would have been
most of a 413-line file.

## AU — the `simpa` automation, and the third pass it needs

`scratchpad/repair_simpa.py` rewrites failing `simpa [only] [...] using T` as
`simp only [...]; exact T`, then `--drop-noop` strips the prefix wherever v4.33.1 reports
`simp` made no progress.  Two things about it are easy to get wrong.

Its error regex must accept BOTH log shapes.  `lake build` prints
`error: <file>:<line>:<col>: Type mismatch`; raw `lake env lean` prints
`<file>:<line>:<col>: error: Type mismatch`.  A regex written for one silently matches nothing
on the other and the script reports `rewrote 0, skipped 0` on a module that is plainly broken.

`--drop-noop` decides on the GOAL, so it strips sets that the HYPOTHESIS still needed — catalogue
AN variant 3, left as a bare `exact h` that fails with a mismatch printing two identical types.
`scratchpad/repair_variant3.py` recovers the original set from the pre-repair copy and re-emits
`simp only [<set>] at h` / `exact h`.  Run it as a third pass, keyed on the same error lines.

## AV — a `let`-bound structure instance stops matching under `simpa`

Thirteen generated `*MembershipFamilyCnf` modules close with

    let nogood := SourceOrderPositiveNogood.of<Variant> choices data hvalid
    apply nogood.refutes hreal order hforced hconv
    simpa [nogood] using hpositive

`hpositive` has type `PositiveRowsMatch row (entry.definitions.map …)`.  The goal
after `apply` is `PositiveRowsMatch row nogood.choices`.  `simpa [nogood]` does
zeta-reduce the `let`, but v4.33.1 then unifies at REDUCIBLE transparency, and
`SourceOrderPositiveNogood.of<Variant>` is a plain `def`, so the projection
`(SourceOrderPositiveNogood.of<Variant> …).choices` is left standing:

    Type mismatch: After simplification, term
      hpositive
     has type
      @PositiveRowsMatch Label row (List.map (fun definition => definition.requirement) entry.definitions)
    but is expected to have type
      @PositiveRowsMatch Label row
        (SourceOrderPositiveNogood.of<Variant>
            (List.map (fun definition => definition.requirement) entry.definitions) entry.data ⋯).choices

The constructor is a structure instance whose field is literally `choices :=
choices`, so the two types ARE definitionally the same.  FIX — drop the tactic
that lowered the transparency:

    exact hpositive

`exact` unifies at default transparency, unfolds the `def` and the projection,
and closes the goal.  This is class AN variant 1, and it is the cheapest repair
in the catalogue: one line, no simp set to reconstruct.

Recognising it is worth doing early.  Of the thirteen failures in the entire
bank-support set, twelve were this single shape, in twelve different generated
modules; the census cost one `lake env lean` sweep and the repair cost one
`perl -pi -e` over the matched line.

## AW — a one-line proof repair moves a bank pin, and the refreeze script does not reach far enough

`scripts/mine_bank_lean_dependencies.py` needs `--probe-run-root` pointing at a
REGISTERED `scratch/runs/<lane>/<run>/` directory, or it stops with

    governed Lean probe failed while mining the dependency set; the tree must be built first.
    probe_run_root is required and must be a registered run directory

The second line is the real one; the first is misleading, and the tree may be
perfectly built.  Register a lane checkpoint and a run manifest first (see
`.codex/worktree-checkpoints/lean-v4331-bank-refreeze-20260909.json`).

Mining then works and reports, for the first bank,

    # 783 root declarations reached 2834 declarations
    ADDED   []
    REMOVED [8 modules]

Nothing was added; the v4.33.1 kernel simply reaches eight fewer repo-local
modules than the v4.27 pin recorded.

`scratch/rigid221-sourceheavy-anchor/refreeze_narrowed_chain.py` then fails
before its walk even starts:

    census.card_head.exact12_surplus_apex_pair_membership_family_bank
      .Exact12SurplusApexPairMembershipFamilyBankError:
      instance is not the frozen post-ThreeTriad cell-1 parent

CAUSE — the script unsets the pin only for banks in its own `CHAIN`.  Nine
installers sit ABOVE that chain, and the chain-head bank is pinned by
`EXPECTED_PARENT_BANK_SHA256`.  Exactly one Lean file explains the move:

    lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/
      ExactTwelveRigid221BlockSpanningMembershipFamilyCnf.lean

one of the class AV one-line repairs.  Its bytes are pinned in the chain-head
bank's `source_manifest`, so the head sha moved

    d226ef40fa277516a245c7f9f03ccf3d9f52df715bc8082c16cd6871c4aa249f
 -> 724f3e18bc27b536d81d51c0b68e71747dbe27969290e1df788aa640a0099f30

while `schema`, `cut_id`, `n_variables = 44902` and `n_clauses = 635440` are all
unchanged.  The bank's mathematics did not move; only the source bytes it
authenticates did.  That is the refreeze trigger the repository policy names, not
a proof regression.

FIX — the refreeze has to walk the nine head installers as well as the `CHAIN`.
Each of the nine carries `EXPECTED_PARENT_BANK_SHA256` and no own pin, so the
walk sets each one's parent pin in memory to the sha its predecessor actually
produced, collects the observed value, and a second pass writes the literals.
Do NOT blank the pins: they are fail-closed direct comparisons.

## Gate E — the repeatable check

`scripts/check_migration_gates.sh` runs the six acceptance checks the plan asks
for, and is the thing to run after any toolchain or lakefile change:

    ./scripts/check_migration_gates.sh          # everything
    ./scripts/check_migration_gates.sh --fast   # skips the two full builds

    OK   [toolchain]    leanprover/lean4:v4.33.1
    OK   [dependencies] lakefile revs match lake-manifest.json
    OK   [docstrings]   no misplaced doc comments
    OK   [roots]        lake-build Erdos9796 Erdos9796Proof Erdos9796BankSupport
    OK   [comparator]   check-conformance.sh
    OK   [spine]        open: 0/1 node(s)
    GATE-E OK

The `roots` check reads the declared `lean_lib` names out of `lakefile.toml`
rather than `defaultTargets`, because class AQ is exactly the failure of building
less than the declared surface: a library with neither `roots` nor `globs`
compiles only its own import closure, so a declared-but-unbuilt root hides
regressions for as long as nobody looks.

The `docstrings` check is class AY below.  It runs before the builds because it
is a source scan that costs a second, and the defect it catches is a parse error
that stops the build outright.

`.github/workflows/lean-docstring-placement.yml` runs that one check on every
push and pull request.  It is the repository's first tracked workflow.  It needs
no Lean toolchain and no mathlib cache, which is what makes it viable: building
this repository in hosted CI is a separate and much larger question, and nothing
here decides it.

## AX — one bank pin is fail-open, and `CHAIN VERIFY COMPLETE` does not cover it

`census/card_head/exact12_core_pair_all_order_common_five_membership_family_bank.py`
takes its parent pin by import rather than as a literal:

    from ...exact12_center_exchange_all_order_common_five_membership_family_bank import (
        EXPECTED_BANK_SHA256 as EXPECTED_PARENT_BANK_SHA256,
    )

and guards on it at line 687, `or bank_sha256 != EXPECTED_PARENT_BANK_SHA256`.
That constant still reads `ef03d843e977c24f0fb82a38c356b03c166bc9378e8b82e7d2fd79630fd5d9b7`
while both the refreeze walk and the verify walk observe the parent producing
`ead04fcb82c71b8f9fc67e8fe0aa2da35a6dac901fe323fdc7cdcc1031e4e0b8`.

MEASURED, not inferred: replacing that constant with sixty-four zeroes and
re-running

    uv run python scratch/rigid221-sourceheavy-anchor/refreeze_narrowed_chain.py --verify

still prints `CHAIN VERIFY COMPLETE` and exits 0.  The pin is therefore fail-OPEN
under the verify walk, and `CHAIN VERIFY COMPLETE` is weaker than it reads for
this one link.  Every other pin in the chain is a literal that the walk does
compare.

This is not caused by the v4.33.1 migration; the migration only exposed it, by
being the first event in a long time to move a chain-head source manifest.  It is
recorded here rather than fixed because changing which pins a proof-carrying
chain enforces is a separate, reviewable decision, not a toolchain repair.  The
next agent should NOT read `CHAIN VERIFY COMPLETE` as covering the
center-exchange to core-pair edge until this is resolved.

## AY — a bulk docstring pass writes doc comments the parser rejects

Two passes (`10a09ed24`, `0c299d91b`, together 1387 files) added doc comments
without building, and broke the build with

    error: <Module>.lean:<line>:<col>: unexpected token '/--'; expected ...

Two shapes, neither of which has any legitimate form:

1. ADJACENT DOC COMMENTS.  The pass added a generic one-liner above a
   declaration that already carried a hand-written docstring.  Lean takes
   exactly one doc comment per declaration.  FIX — delete the generic one and
   keep the hand-written one.  Ten sites in `SurplusCOMPGBank`, and in
   `P4OccurrenceClosure/MutualTransport/{Core,Main}`.
2. DOC COMMENT AFTER AN ATTRIBUTE.  The pass inserted the doc comment between
   `@[simp]` and its declaration.  FIX — move it above the attribute.  Two
   sites, in `GeneralCarrierAbstractRowSystem` and
   `ExactFiveCommonShellV7/PrefixSeparationSemantics`.

The build finds these one module at a time, in dependency order, so fixing them
from build logs alone costs one full build per site.  `scripts/check_lean_docstring_placement.py`
finds every site in the tree in one second:

    uv run python scripts/check_lean_docstring_placement.py lean
    uv run python scripts/check_lean_docstring_placement.py --json

It tokenizes block comments and string literals rather than matching lines, so
a doc comment quoted inside an ordinary `/- ... -/` comment is not a finding.
Exit status is 1 when any site is found, so it is usable directly as a gate.

