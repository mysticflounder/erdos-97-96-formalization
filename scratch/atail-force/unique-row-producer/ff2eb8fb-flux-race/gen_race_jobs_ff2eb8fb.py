"""Generate the flux Singular race jobs for witness ff2eb8fb.

12 strategy variants: {std, slimgb, groebner} x {forward, reversed,
seeded permutations}. slimgb+forward is excluded (TIMEOUT x3 locally at
45s/900s/3600s). Every job tests the SAME ideal — variable permutation
is a ring isomorphism, so UNIT/NONUNIT transfers; reduce(1,G) reads the
verdict off any Groebner basis. Markers match equality_ideal_probe.py.
"""
import json
import random
from pathlib import Path

SP = Path("/private/tmp/claude-1000/-Users-adam-projects-math-projects-erdos-97-96-formalization/37d29399-4937-4abd-92cd-4eebe85bf9f5/scratchpad")
OUT = SP / "flux_race_ff2eb8fb"
OUT.mkdir(exist_ok=True)

system = json.loads((SP / "ff2eb8fb_rabinowitsch_system.json").read_text())
variables = system["variables"]
polynomials = system["polynomials"]

VERDICT_BEGIN = "SINGULAR_VERDICT_BEGIN"
VERDICT_END = "SINGULAR_VERDICT_END"


def script(order, algo):
    generators = ",\n  ".join(polynomials)
    return "\n".join((
        f"ring r = 0, ({','.join(order)}), dp;",
        f"ideal I = {generators};",
        f"ideal G = {algo}(I);",
        f'print("{VERDICT_BEGIN}");',
        "reduce(1, G);",
        f'print("{VERDICT_END}");',
        "quit;",
        "",
    ))


orders = {
    "fwd": list(variables),
    "rev": list(reversed(variables)),
}
for seed in (1, 2, 3, 4):
    rng = random.Random(seed)
    perm = list(variables)
    rng.shuffle(perm)
    orders[f"perm{seed}"] = perm

jobs = []
for algo in ("std", "slimgb", "groebner"):
    for name, order in orders.items():
        if algo == "slimgb" and name == "fwd":
            continue  # known TIMEOUT at 3600s locally
        if len(jobs) >= 12:
            break
        job = f"{algo}_{name}"
        (OUT / f"{job}.sing").write_text(script(order, algo))
        jobs.append({"job": job, "algo": algo, "order": name,
                     "first_vars": order[:4]})

# smoke gates (encoding validation before the race)
def smoke(generators, algo):
    return "\n".join((
        "ring r = 0, (z), dp;",
        f"ideal I = {generators};",
        f"ideal G = {algo}(I);",
        f'print("{VERDICT_BEGIN}");',
        "reduce(1, G);",
        f'print("{VERDICT_END}");',
        "quit;",
        "",
    ))

for algo in ("std", "slimgb", "groebner"):
    (OUT / f"smoke_unit_{algo}.sing").write_text(smoke("z,z-1", algo))
    (OUT / f"smoke_nonunit_{algo}.sing").write_text(smoke("z2-1", algo))

manifest = {
    "witness_row_signature_sha256": system["row_signature_sha256"],
    "base_equality_sha256": system["base_equality_sha256"],
    "extended_sha256": system["extended_sha256"],
    "pair": system["pair"],
    "variable_count": system["variable_count"],
    "polynomial_count": system["polynomial_count"],
    "jobs": jobs,
}
(OUT / "manifest.json").write_text(json.dumps(manifest, indent=2))
print(json.dumps(manifest["jobs"], indent=2))
print(f"{len(jobs)} jobs written to {OUT}")
