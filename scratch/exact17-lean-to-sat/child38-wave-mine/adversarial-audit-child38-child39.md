# Child38 / proposed Child39 adversarial audit

Date: 2026-08-13. Scope was read-only custody and encoding/authentication review;
no PIQD contact, launch, solver, Lean build, or implementation edit was made.

## Verdict

- **Child38 terminal custody: PASS**, for the authenticated SAT result and the
  bounded independent replay below.
- **Child39 publication/ingress/runner chain: BLOCKED / NOT AUDITABLE.** The
  current worktree contains no Child39 generator, exporter, ingress validator,
  runner, tests, manifest, receipt, CNF, or authenticated terminal artifacts.
  Therefore no Child39 encoding or authentication claim can be accepted.

## Child38 evidence

Terminal final record:
`scratch/exact17-lean-to-sat/piqd-child38-core1-custody-final.json`

- job `aeaefb24-0f57-4b1f-9c62-644208e65977`; result `SAT`; epoch `1`;
  recovery `null`; one attested solver process.
- project `erdos-97-96-exact17-child38`; identity
  `8ff3e1da7572ea08eacdb063ac1136efe29aaaf261428905cfa49bc7e229fc4b`.
- CNF SHA
  `07b139089f2f9e11c03c8edfcdba58609a6f4c5be439e701888d975c182fe8d7`,
  291,621,758 bytes, 308 variables, 5,847,276 clauses.
- manifest SHA
  `6b74b75871940761fa346469b04c0ad17064a36b56766c5413c2ff6e048ad815`.
- terminal log SHA
  `1e886505c599c3e4bdae00ca4095b8e86940cc7f53f303f0ffeb946dbbfa0673`;
  independently matched the custody log.
- model-check evidence is bound to this job/project/completion timestamp,
  reports `SATISFIED`, has exact counts 308/308/5,847,276, and its model digest
  is `d629eae99bd636e0386b3b00bcdde0069f9285dea5e90a3dc1ad984874e05cbe`.
  The digest independently matches the 308-entry model assignment. SAT proof
  fields are null as required.

Independent strict DIMACS/model replay (not the runner) reported:

```json
{"assignment":308,"bytes":291621758,"clauses_checked":5847276,
 "first_bad":null,"header":[308,5847276],
 "sha256":"07b139089f2f9e11c03c8edfcdba58609a6f4c5be439e701888d975c182fe8d7"}
```

The embedded manifest decoded to the same manifest SHA and its Lean root,
Lean export, and daemon receipt hashes matched the files on disk. The Child38
export receipt pins the authenticated Child37 parent CNF
`98f58d8cf71feb1201f30956e762f3a5b22acfe09f350070dfa7f83bed8640b3`,
5,847,268 parent clauses, and exactly eight ordered suffix clauses; the
Child38 CNF has the resulting 5,847,276 clauses. The source/export validators
and ingress enforce those pins, no-overwrite publication, ledger-last receipt
publication, and fail-closed unprovisioned state.

The independent wave mine at
`scratch/exact17-lean-to-sat/child38-wave-mine/child38-analysis.json` is
internally consistent (`PASS`, same job/CNF, all clauses replayed, no diagonal
hits, named order `[1]`, next center `[15]`). It is only a bounded named-order
SAT model mine, not universal mathematical closure.

Focused validation passed without edits:

```text
uv run pytest -q scripts/test_child38_publication.py   # 8 passed
uv run ruff check scripts/export_exact17_thirty_eighth_root.py \
  scripts/validate_exact17_thirty_seventh_model_refinements_export.py \
  scripts/validate_exact17_thirty_seventh_model_refinements_ingress.py \
  scripts/run_piqd_exact17_thirty_eighth_root.py \
  scripts/test_child38_publication.py                  # All checks passed
```

Residual scope limit: this PASS authenticates Child38 custody/replay only. It
does not establish an UNSAT proof, universal orbit coverage, or any Child39
promotion; Child39 remains blocked until its complete chain and authenticated
artifacts are present and independently audited.
