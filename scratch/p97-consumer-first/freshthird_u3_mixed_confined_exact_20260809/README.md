# FreshThird U3 mixed confined exact wave (2026-08-09)

One bounded, source-audited census of the no-shift six-center packet.  Scope is
this directory only; production Lean/docs/git were not edited.

## Contents

* `INGRESS-CONTRACT.md` — theorem-by-theorem ingress audit and the missing
  universal producer contract.
* `RESULTS.md` — finite verdict, malformed controls, and exact commands.
* `enumerate_u3_packet.py` — exhaustive support enumeration plus Z3/cvc5
  cross-checks.
* `readback.py` — independent JSON/model checker.
* `malformed_controls.py` — bounded negative controls for dropped guards.
* `results.json`, `malformed-controls.json` — machine-readable outputs.
* `lean-check.log`, `lean-build.log` — source-check/build-attempt logs.

## Reproduction

```
uv run python enumerate_u3_packet.py
uv run python readback.py results.json
uv run python malformed_controls.py
cd <repo-root>/lean && lake env lean ../scratch/U3EscapeShiftScratch.lean
```

The final Lean command is shown relative to the repository root in
`RESULTS.md`; use `cd lean && lake env lean ../scratch/U3EscapeShiftScratch.lean`
exactly from the repo root layout.  A fresh `lake-build` was attempted but the
repository's serialized build lock was held by another process; the existing
Lake olean accepted the source check.

## Source hashes (SHA-256)

```
d7710c44f61c2ae2de8e8cef938bdea9ed4d50d4ad5020d40973245f17d850cf  lean/Erdos9796Proof/P97/U3ToU5Terminal.lean
5e020505827935c99552c13ee10c89ab499804ed226c68700f4f65415995aca4  lean/Erdos9796Proof/P97/U5GlobalIncidenceBasic.lean
b70abb2f7972307370212ddf167873f70fb8ef4eb9c27297a79ce7d71f8699d9  lean/Erdos9796Proof/P97/U1CarrierInjection.lean
96833f7b7f40de1232baf6f2ba6d0f74560e3713f597958f1a4e4443bad0e8a4  scratch/U3EscapeShiftScratch.lean
30392ce5811290306dcb95496c697d36467cd5c943cd6a6e1370a052bcf72a79  enumerate_u3_packet.py
a5ad7a8f6f744e05b6cf66c376b0cda903c66d975d68cb35b8d01f0887f03629  malformed_controls.py
f5ce7c720e9d2825e2449dcbb7b5a7ad01731a73610120b72cfe6a1fff2febad  readback.py
0a63752bebfb6967e8c9f09d818387c5ab5806eb2ce18445160be6d5f8060478  results.json
81bf3c15c64ea6cbd4f519f153e0097eabe4d389cd5f2a87e305ce5ba569dc06  malformed-controls.json
```

The JSON output is reproducible under the recorded commands.  Solver binaries
are `/Users/adam/bin/z3` and `/Users/adam/bin/cvc5`; the verdict is conditional
on the audited structural encoding, not on nonlinear geometry.
