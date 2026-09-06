# Math Skeptic Audit: exactfive sharp mutual third-anchor note

**Target**: `docs/audits/2026-09-06-exactfive-sharp-mutual-third-anchor.md`, plan section `docs/plans/2026-09-05-exactfive-physical-uniform-closure-plan.md:349-371`, with finite-control cross-check against `scripts/verify_exactfive_three_anchor_mutual_control.py` and `certificates/exactfive_three_anchor_mutual_control_20260906.json`
**Date**: 2026-09-06
**Verdict**: CERTIFIED
**Claims audited**: 11

## Summary

The note correctly presents a conditional I₃/mutual-case argument, preserves the
source guards, and keeps the 24-point model finite and separate from full
physical closure. The §3 trace logic is scoped under total H, actual full rows,
mutual incidences, and I₃; it does not assert an ordinary global conclusion.
The referenced center-uniqueness theorem is explicitly described as needing an
adapter and is not presented as current Lean evidence.

The note explicitly uses two endpoint conventions. In §2 it relabels the
blocked endpoint e as q, so b is attached to q=(-1,0); in §4 the finite model
uses e=w and the reflected b-coordinate, with the endpoint swap stated in the
note. Under those separate conventions the sharp inequalities, conditional
trace guards, finite-control boundary, and plan 3d handoff are aligned.

## Findings

### F1: The conditional scope is stated accurately

- **Location**: note `:5-26,106-150`
- **Quote**: “These are **PROVEN, pen-and-paper conditional claims** under the authenticated geometric inputs below.”
- **Stated label**: PROVEN, pen-and-paper conditional claims
- **Evidence present**: The hypotheses explicitly include the mutual actual rows, I₃={u,q,w}, total H, strict cap membership, and robust apices. The note states that the argument does not close the three trace consumers or the unconditional physical residual.
- **Actual label**: Conditional pen-and-paper argument under the stated endpoint convention.
- **Verdict**: OK
- **Reason**: The conditional boundary is explicit: it assumes I₃, mutual actual rows, total H, and the listed geometric inputs. The finite control is separately labeled empirical evidence.

### F2: The normalized and finite-model b-coordinates use different endpoint conventions

- **Location**: note `:61-78`; checker `:66-69,138-139`; note `:166-170`
- **Quote**: “b = ((sk−1)/2,(k−s)/2),   r² = 1+h²,   ρ² = 1+k².”
- **Stated label**: PROVEN normalized coordinate derivation
- **Evidence present**: In §2, e is relabeled q, so b is attached to q=(-1,0). Direct expansion gives `d²(b,q)=d²(b,c)=1+k²` for the displayed coordinate. In §4, the finite control uses e=w and `Kb={w,c,B1,B2}`; its reflected coordinate is `((1−sk)/2,(k−s)/2)`. The note states that reflection swaps endpoints and the sign of b's x-coordinate.
- **Actual label**: PROVEN normalized sharp-bound derivation under the e=q convention; EMPIRICALLY VERIFIED finite model under the e=w reflected convention.
- **Verdict**: OK
- **Reason**: The two signs describe the two endpoint conventions, not a contradiction. The §2 case inequalities use the e=q placement, while the checker uses its mirror. No single coordinate formula is being used for both models.

### F3: The sharp inequalities follow from the normalized convexity bounds

- **Location**: note `:63-104`
- **Quote**: “Hence dist(O,c)² = (h+k)² < 1+h² = r².”
- **Stated label**: PROVEN, pen-and-paper
- **Evidence present**: The displayed bounds derive `h>1`, `k<1/s`, `h+(sh+1)k<s`, `k<2−s`, then `(2+s)ρ²<L²`, `ρ<(s−1)r`, and `2hk+k²<1`. The algebra after the b-placement step is consistent with those inequalities, and the final distance/angle consequences follow by positive quantities and polarization.
- **Actual label**: PROVEN pen-and-paper under the e=q normalized placement.
- **Verdict**: OK
- **Reason**: With b_x=(sk−1)/2, the two case placements and triangle-width inequalities yield k<1/s, h+(sh+1)k<s, k<2−s, and the three claimed sharp bounds. The 24-point model is only the reflected finite witness.

### F4: The H(u) source trace has the stated conditional guards

- **Location**: note `:106-150`
- **Quote**: “The inclusion u ∈ Kd₀ and exclusion of simultaneous q,w now give the exhaustive three traces {u}, {u,q}, {u,w}.”
- **Stated label**: PROVEN, pen-and-paper under I₃/mutual/total-H hypotheses
- **Evidence present**: Totality supplies d₀=H(u) and a full critical row containing u. Robustness separates d₀ from O,V; Kc∩E={q,w} separates it from c; the bisector localization and b outside the closed first cap give Kb∩I={e} and d₀≠b; three-point circle uniqueness excludes Kd₀ containing q,w.
- **Actual label**: Conditional pen-and-paper trace argument under the stated endpoint convention.
- **Verdict**: OK
- **Reason**: The note keeps total-H and mutual-row assumptions visible and gives the required distinct-center exclusions. It does not turn the trace into a global assertion.

### F5: Pair-trace localization and c omission are correctly bounded

- **Location**: note `:138-150`
- **Quote**: “`selectedFourClass_inter_capByIndex_card_le_two` gives Kd₀ ∩ C1 = {u,f}.”
- **Stated label**: PROVEN, pen-and-paper from existing raw geometric inputs
- **Evidence present**: The note applies the generic bisector/localization primitive only in a pair trace, records the row center inside C1, applies the cap-cardinality bound, and uses §2's c∈C1° and c∉E to exclude c from the pair row. It explicitly leaves the singleton trace and pair contradictions open.
- **Actual label**: Conditional pen-and-paper consequence under the stated endpoint convention.
- **Verdict**: OK
- **Reason**: The argument does not use V joint-deletion survival as a guard and does not claim a contradiction that it has not derived.

### F6: Center uniqueness is not falsely promoted to Lean evidence

- **Location**: note `:129-136`
- **Quote**: “An import or a local adapter is still needed at the current exact-five interface; no new compilation or transitive axiom audit is asserted here.”
- **Stated label**: Pen-and-paper conditional input; Lean helper identified but unimported
- **Evidence present**: The note gives the elementary three-point circle-center argument and names `eq_of_dist_eq_three_of_pairwise_ne` in `N4d/SmallSReductions.lean:371` only as a possible corresponding helper.
- **Actual label**: PROVEN pen-and-paper local step; not Lean-formalized at this interface.
- **Verdict**: OK
- **Reason**: The note explicitly separates the mathematical argument from unavailable import/compilation evidence.

### F7: The 24-point finite-control cross-check is accurate

- **Location**: note `:152-186`; certificate `exactfive_three_anchor_mutual_control_20260906.json`
- **Quote**: “The replay output is **EMPIRICALLY VERIFIED, finite exact-arithmetic evidence** for 24 points in Q(√3).”
- **Stated label**: EMPIRICALLY VERIFIED finite control
- **Evidence present**: Independent replay is byte-exact; the checker passes 528 supporting-edge tests, has MEC boundary O,V,W, cap sizes 6,7,8, exact E/I and V/b/c rows, actual singleton criticality at b,c, bad pair u,q, minimum admissible pair q,w, and global K4/total H false.
- **Actual label**: EMPIRICALLY VERIFIED on the named 24-point model.
- **Verdict**: OK
- **Reason**: The note does not treat the finite model as a full-source configuration or use it to infer physical freshness.

### F8: The no-freshness and no-full-source guards are explicit

- **Location**: note `:173-186`
- **Quote**: “It does not establish that c is fresh relative to the two endpoint blockers of an original physical packet.”
- **Stated label**: Explicit physical-source non-claim
- **Evidence present**: The note identifies c itself as the only actual blocker of q in the finite model, records absence of the ordinary/minimum-pair residual and global minimality, and says the third-anchor producer uses a source object the control lacks.
- **Actual label**: Correctly scope-bounded.
- **Verdict**: OK
- **Reason**: No strict c-freshness relative to an old H(q), complete physical packet, or dependent iteration is inferred.

### F9: Remaining trace consumers and physical closure remain open

- **Location**: note `:180-199`
- **Quote**: “Singleton-trace contradiction or forced further incidence | Open”.
- **Stated label**: Open obligations
- **Evidence present**: The completion matrix leaves singleton contradiction, pair-trace consumers, source-packet transport, terminating iteration, Lean promotion, and unconditional physical closure open.
- **Actual label**: Open, correctly stated.
- **Verdict**: OK
- **Reason**: The note does not convert sharp metric bounds into a descent or closure theorem.

### F10: Provenance and source custody are recorded

- **Location**: note `:28-54,152-159`
- **Quote**: “The response is external input; its metric argument received an independent paper audit.”
- **Stated label**: Provenance metadata and authenticated source inputs
- **Evidence present**: The note records the consult/message, source revision, response hash, the existing primitive names and source locations, the retained 24-point note hash, and the extracted checker/certificate links.
- **Actual label**: Correct provenance and finite-evidence custody.
- **Verdict**: OK
- **Reason**: The provenance does not substitute for proof and the note preserves the distinction between external input, checked source interfaces, and unimported Lean helpers.

### F11: Plan section 3d preserves the conditional producer boundary

- **Location**: `docs/plans/2026-09-05-exactfive-physical-uniform-closure-plan.md:349-371`
- **Quote**: “The trace split alone does not justify new admissions, a production helper without a consuming reduction, or elimination of the physical terminal.”
- **Stated label**: Conditional producer and open downstream consumers
- **Evidence present**: The plan cites the sharp inequalities, then assumes I₃ and mutual incidences before using total H at u. It records the three traces, pair localization, c omission, the 24-point control's lack of H(u)/total H/global K4, and the open singleton/pair consumers.
- **Actual label**: Correctly scoped conditional proof handoff.
- **Verdict**: OK
- **Reason**: The paragraph does not extend the producer to ordinary source cases and does not treat the finite model as a full-source counterexample or a termination argument.

## Weasel words

No automatic proof-context weasel words were found. The note uses “remaining”
and “open” for explicitly listed unresolved consumers rather than as proof
shortcuts.

## Scope conflation

The note consistently distinguishes the conditional I₃/mutual trace from an
ordinary global assertion, and the 24-point model from a full physical source.
The §2 and §4 endpoint conventions are distinct but explicitly reconciled; no
scope conflation remains.

## Lean sorry graph

No Lean promotion is claimed. The named center-uniqueness helper is explicitly
unimported and unaudited at this interface.

## Upgrade drift

The note labels the conditional metric/source claims as PROVEN pen-and-paper,
the 24-point model as EMPIRICALLY VERIFIED, and unresolved consumers as Open.
Plan 3d preserves the same conditional boundary. These labels match the
convention-separated evidence.

## Required before CERTIFIED

None for this conditional note audit. Preserve the current convention
distinction, conditional I₃/mutual/source guards, and explicit open status of
all three trace consumers.
