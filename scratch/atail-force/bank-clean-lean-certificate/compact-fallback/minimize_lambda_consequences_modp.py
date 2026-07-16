#!/usr/bin/env python3
"""Fast support discovery for lambda consequences over several prime fields.

The output is only a search aid.  Every retained subsystem must subsequently be
checked over QQ before it can support a Lean certificate.
"""

from __future__ import annotations

import json
import subprocess
from pathlib import Path

from minimize_lambda_consequences import GENERATORS, TARGETS, VARIABLES


HERE = Path(__file__).resolve().parent
OUTPUT = HERE / "lambda_consequence_minimization_modp.json"
PRIMES = (32003, 30011, 27449)


def consequence(rows: list[tuple[str, str]], target: str, prime: int) -> bool:
    script = "\n".join(
        [
            f"ring r={prime},({','.join(VARIABLES)}),dp;",
            f"ideal I={','.join(poly for _, poly in rows)};",
            "ideal G=slimgb(I);",
            f"poly rem=reduce({target},G);",
            'if(rem==0){print("YES");}else{print("NO");}',
            "quit;",
        ]
    )
    process = subprocess.run(
        ["Singular", "-q"],
        input=script + "\n",
        capture_output=True,
        text=True,
        timeout=30,
        check=False,
    )
    if process.returncode != 0:
        raise RuntimeError(process.stderr or process.stdout)
    return process.stdout.strip() == "YES"


def all_primes(rows: list[tuple[str, str]], target: str) -> bool:
    return all(consequence(rows, target, prime) for prime in PRIMES)


def minimize(target: str) -> list[tuple[str, str]]:
    rows = list(GENERATORS)
    if not all_primes(rows, target):
        raise RuntimeError(f"full modular system does not imply {target}")
    changed = True
    while changed:
        changed = False
        for index, (name, _) in enumerate(tuple(rows)):
            trial = rows[:index] + rows[index + 1 :]
            if all_primes(trial, target):
                print(target, "delete", name, flush=True)
                rows = trial
                changed = True
                break
    return rows


def main() -> None:
    results = []
    for name, target in TARGETS:
        rows = minimize(target)
        results.append(
            {
                "name": name,
                "target": target,
                "retained_names": [row_name for row_name, _ in rows],
                "modular_primes": PRIMES,
                "epistemic_status": "support-discovery-only; QQ recheck required",
            }
        )
    OUTPUT.write_text(json.dumps({"results": results}, indent=2) + "\n")
    print(OUTPUT)


if __name__ == "__main__":
    main()
