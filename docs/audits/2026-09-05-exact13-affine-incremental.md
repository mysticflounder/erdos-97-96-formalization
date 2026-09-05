# Exact-13 affine incremental-rejection experiment

Date: 2026-09-05. EMPIRICALLY VERIFIED on seven fixed retained direct-cell
tables. No new solver run, Lean build, or source-level proof was performed.

## Outcome

The full equality-closed rhombus bank yields checked collision certificates
on five tables. All seven tables already fail existing one- or two-form
Kalmanson tests. There are zero baseline survivors in this cohort: incremental
benefit is **unmeasured**, not evidence that affine cuts have no value.

| Retained event | Baseline rejection | Rhombus relations | Affine collision |
| --- | --- | ---: | --- |
| post-threeform-repaired, run-0002 | one-form | 18 | p0 = p2 |
| post-threeform, run-0001 | one-form | 16 | p0 = p1 |
| conic-resume | one-form | 8 | p0 = p2 |
| three-form-resume | one-form | 6 | p0 = p2 |
| two-form-resume | two-form (70 opposite-vector pairs) | 1 | none found |
| coarse-cell-resume, resume-3000 | one-form | 7 | p0 = p10 |
| coarse-cell-classifier, run-0002 | one-form | 3 | none found |

The companion JSON retains exact event paths/hashes, the decoded table from
each event, baseline witnesses/counts, and compact integer affine certificates.
These are a bounded regression cohort, not an exhaustive model census.

## Implementation and trust boundary

`scripts/mine_exact13_affine_relations.py` closes undirected edge equalities
within each row, enumerates all four-label equal-radius rhombus relations,
then searches their rational span for support-two or support-three vectors.
Multiple rows at the same center are retained independently. Shared support
points alone do not merge row radii. Supporting row atoms are conservative
full-table witnesses, not minimized cuts.

`verify` reconstructs the complete relation list and checks counts, row atoms,
cross-edges and exact integer certificate arithmetic. `verify_certificate`
alone is arithmetic-only; use `verify` to check geometric relation provenance.
Missing certificates are labeled `no_certificate_found`, not a proof that no
affine obstruction exists. A support-three relation is a collinearity
obstruction when distinct convex-independent points are assumed; the five
positive results here already have support-two collision certificates.

Independent review caught a first-version verifier omission: deleting the
relations or tampering with their counts could pass. The retained version
recomputes the complete canonical list and rejects those mutations. Five
focused tests pass, including mutation checks and the independent-radius
negative case. The input audit separately confirmed every baseline rejection
without a solver. No theorem promotion or complete verifier soundness proof
is claimed.

## Replay

For a newly retained event:

```bash
uv run --no-cache python -B scripts/mine_exact13_affine_relations.py EVENT.json
```

The optional `--output PATH` retains the full certificate; register any new
artifact path under its owning lane before writing it. The CLI does not run
the baseline Kalmanson classifier or identify current survivors automatically.

To replay the entire saved cohort from its embedded tables:

```bash
uv run --no-cache python -B - <<'PY'
import json, sys
from pathlib import Path
sys.path.insert(0, "scripts")
import mine_exact13_affine_relations as affine
import cardge13_exact13_global_source_cell_csp_piqd as base
report = json.loads(Path("docs/audits/2026-09-05-exact13-affine-incremental.json").read_text())
for record in report["records"]:
    cell = record["cell"]
    rows = base.cell_rows(cell)
    zero = base.zero_form_for_rows(rows, base.DIRECT_ORDER)
    assert (list(zero) if zero else None) == record["baseline"]["zero_form"]
    vectors = {tuple(f["vector"]) for f in base.projected_kalmanson_forms(cell, base.DIRECT_ORDER)}
    pairs = sum(tuple((e, -v) for e, v in f) in vectors for f in vectors if f) // 2
    assert pairs == record["baseline"]["opposite_pairs"]
    result = affine.mine(cell)
    assert affine.verify(result)
    assert result["affine_relation_count"] == record["affine"]["relations"]
    assert result["equality_components"] == record["affine"]["components"]
    for name in ("collision", "collinearity"):
        cert = result[name]
        compact = None if cert is None else {k: cert[k] for k in ("kind", "support", "coefficients", "result")}
        assert compact == record["affine"][name]
print("seven cohort tables replayed; zero baseline survivors")
PY
uv run --no-cache python -B -m pytest -q -p no:cacheprovider scripts/test_mine_exact13_affine_relations.py
```

## Remaining experiment

A fresh table surviving current one/two-form checks has been requested from
the active direct-cell coverage lane (ProofRelay97; nthdegree #15797).
That lane retains solver ownership. Until such an input is supplied, this
experiment cannot establish genuinely incremental rejection. A later table
passing one/two-form checks must still be compared with the rest of the
active cut bank before claiming new geometric information.
