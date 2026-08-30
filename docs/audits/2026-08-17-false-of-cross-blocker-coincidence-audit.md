# Audit: `false_of_crossBlockerCoincidence`

Date: 2026-08-17

Scope: current checkout of `TwoSourceCanonicalSurface.lean` (around line 104), with a clean build attempt for that module.

## Findings

1. **Gemini has replaced the theorem with a full 4-branch proof body.**
   - `theorem false_of_crossBlockerCoincidence` is now a `by` proof with cases
     `hP₁ | hP₂ | hPρ₁ | hPρ₂`.
   - There are no `sorry` tokens in the theorem body anymore.

2. **The theorem still does not have confirmed kernel closure in this checkout.**
   - `lake-build Erdos9796Proof.P97.ATail.FrontierLiveClosure.TwoSourceCanonicalSurface`
     reports deterministic heartbeats/timeouts in this theorem:
     - line ~160 (`whnf`), line ~161 (`tactic execution`), line ~162 (`isDefEq`).
   - This is a termination/performance failure in checking, not an explicit `sorry`.

3. **Potential hygiene issue remains.**
   - `hresidual : GeometricMultiplicityResidual P Pρ` appears only in the theorem
     signature, not used in the proof body.

4. **Tracking impact.**
   - `docs/live-blueprint.md` still reflects this as open/sorry status in its current
     checkout, so its status is out-of-sync with the local proof text.

## Recommended follow-up

- Keep the branch split structure, but rewrite the timeout-prone steps (around
  lines 160–162 in this file) with explicit simplification lemmas or use a bounded
  `simp` path to avoid heartbeat blowups.
- Either use `hresidual` explicitly in the proof or remove/adjust the argument if
  it is unnecessary.
- Re-run `lake-build ...TwoSourceCanonicalSurface` after proof hardening, then
  refresh blueprint status.
