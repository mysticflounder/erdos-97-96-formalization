# FreshThird U3 CEGAR packet extraction and piqd replay — 2026-08-19

## Result

The current v10 U3 CNF and its matching `u3-v10-r2` CaDiCaL log produce a
validated finite CEGAR packet. The extractor independently replays every
728,527 DIMACS clauses before accepting the projection.

The packet is:

```text
arm            qDeleted
carrier        0..16
q,p            12, 16
t1,t2,t3      1, 2, 3
u,a0,a1        9, 10, 4
x              9
z              0
dangerous      {1, 2, 3, 12}
exact_radius   {1, 2, 3}
bounded        {1, 2, 3, 4, 9, 10, 12, 16}
row            {0, 1, 2, 4}
```

The selected obstruction center is `u`; its row has one outside point, `z=0`.
The packet SHA-256 is
`3b9123bf55ffb2565bccac50e3fc55e3bdd25203493c4e90bf587839fd50c7e7`.

## Independent custody and replay

The extractor binds the source files to the candidate manifest, checks the
CNF and map hashes, parses a complete SAT assignment, and checks every clause.
The input bindings are:

- CNF SHA-256:
  `1d98bbe99487a079b528dbde96fd91ba11ef74b19266e583ece9d686359b9e2e`;
- variable-map SHA-256:
  `f183e9d720bd1c820ac2958cf0e8355c3ad3b7c8d484f8c5a57577dfebceff12`;
- matching `u3-v10-r2` solver-log SHA-256:
  `e93c504756f8bf488dedec0b990b15915e1d168b848dce6f75c2b00593441ac9`.

The earlier `u3-v10-cadical.stdout` log is rejected: against the current CNF
it falsifies clause 728212. The files have different generation times, so the
extractor now requires replay rather than trusting a SAT label or a prose
model summary.

## piqd result

The corrected packet was serialized to LeanSatIr and submitted as job
`3ff71cfa-44a2-489f-bf2c-98815e30858d`. piqd prepared blob
`8213254da00365e6c200f69a15d03ee96ff1f340131ae7d4a42183aef184c896`, solved
it as `SAT`, and decoded 14 functions. The model-check receipt reports:

- `SATISFIED`;
- all 371,874 piqd clauses satisfied;
- 121,142 variables assigned;
- decoded model SHA-256:
  `2f6de6a58ddaafc024fff68994bce70659b9dc6a8e7afe7d675955ef6e8c73e9`.

The durable decoded-model replay compares every role and selector table with
the extracted packet and recomputes the packet SHA. The replay passes.

## Claim boundary

This is a validated finite CEGAR packet and a piqd model replay. The candidate
manifest records `source_total=false` and `source_total_claim=false`; the CNF
omits Euclidean realization and universal source coverage. Consequently this
does not close a Lean sorry or establish a universal FreshThird theorem. It
does provide the exact finite obstruction data needed for the next producer
search: the escaping row is centered at `u=9`, with support `{0,1,2,4}` and
bounded support `{1,2,3,4,9,10,12,16}`.

## Checks

```text
uv run --no-sync python -m pytest -q ...
8 passed
ruff check: clean
piqd model-check: SATISFIED
```
