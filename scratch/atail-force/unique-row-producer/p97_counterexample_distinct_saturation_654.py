#!/usr/bin/env python3
"""Exact-CAS saturation probe for distinct realizations of the 654 rows.

Starting from the hash-bound 37 equality polynomials, iteratively saturate by
each squared distance.  The final ideal is the equality ideal saturated by
the product of all pairwise squared distances.  If it is the unit ideal, then
every complex equality realization has an isotropic pair and, in particular,
every real realization has a coincident pair.  That rules out a Problem 97
counterexample for this fixed row system.

This is a bounded trusted Singular computation, not a Lean certificate.  A
timeout or a surviving ideal is not a real-feasibility verdict.
"""

from __future__ import annotations

import argparse
import importlib.util
import json
from pathlib import Path
import subprocess
import sys
from typing import Any


HERE = Path(__file__).resolve().parent
EXACT_PROBE = HERE / "p97_counterexample_realizability_654.py"


def load_exact_probe() -> Any:
    spec = importlib.util.spec_from_file_location("p97_654_exact_probe_sat", EXACT_PROBE)
    if spec is None or spec.loader is None:
        raise AssertionError("exact probe import failed")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def pair_polynomials(probe: Any, oracle: Any) -> list[tuple[tuple[int, int], str]]:
    points = oracle.coordinate_symbols(probe.N)
    variables = oracle.variable_symbols(probe.N)
    result = []
    for left in range(probe.N):
        for right in range(left + 1, probe.N):
            poly = oracle.sp.Poly(
                oracle.squared_distance(points, left, right),
                *variables,
                domain=oracle.sp.QQ,
            )
            serialized = oracle.serialize_poly(poly)
            if serialized == "1":
                continue
            result.append(((left, right), serialized))
    return result


def singular_script(
    variables: tuple[str, ...],
    equalities: tuple[str, ...],
    pairs: list[tuple[tuple[int, int], str]],
    method: str,
) -> str:
    lines = [
        'LIB "elim.lib";',
        f"ring R=0,({','.join(variables)}),dp;",
        f"ideal G={','.join(equalities)};",
        "G=std(G);",
        'print("BASE_STD_COMPLETE");',
        "ideal J;",
    ]
    for index, ((left, right), polynomial) in enumerate(pairs, start=1):
        update = (
            "G=sat(G,J);"
            if method == "saturation"
            else "G=std(quotient(G,J));"
        )
        lines.extend((
            f"J={polynomial};",
            update,
            f'print("STEP_{index}_PAIR_{left}_{right}_BEGIN");',
            "print(size(G));",
            f'print("STEP_{index}_PAIR_{left}_{right}_END");',
            (
                'if (size(G)==1 and G[1]==1) '
                f'{{ print("UNIT_AT_STEP_{index}_PAIR_{left}_{right}"); quit; }}'
            ),
        ))
    lines.extend(('print("FINAL_NONUNIT");', "quit;", ""))
    return "\n".join(lines)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--timeout-seconds", type=float, default=60.0)
    parser.add_argument("--max-pairs", type=int, default=65)
    parser.add_argument("--pair-start", type=int, default=0)
    parser.add_argument(
        "--method", choices=("saturation", "quotient-once"), default="saturation"
    )
    args = parser.parse_args()
    if not 1 <= args.timeout_seconds <= 180:
        raise AssertionError("timeout must be in 1..180 seconds")
    if not 1 <= args.max_pairs <= 65:
        raise AssertionError("max-pairs must be in 1..65")
    if not 0 <= args.pair_start < 65:
        raise AssertionError("pair-start must be in 0..64")
    if args.pair_start + args.max_pairs > 65:
        raise AssertionError("requested pair slice exceeds the 65 nonconstant pairs")

    probe = load_exact_probe()
    oracle = probe.load_metric_oracle()
    digest = probe.equality_digest(oracle)
    if digest != probe.EXPECTED_EQUALITY_SHA256:
        raise AssertionError("equality-system hash drift")
    ordered_rows = (probe.ROWS[1],) + probe.ROWS[:1] + probe.ROWS[2:]
    rows = tuple(
        oracle.MetricRow(center, support, exact=False)
        for center, support in ordered_rows
    )
    equalities = tuple(oracle.serialized_system(probe.N, rows))
    variables = tuple(str(variable) for variable in oracle.variable_symbols(probe.N))
    all_pairs = pair_polynomials(probe, oracle)
    pairs = all_pairs[args.pair_start : args.pair_start + args.max_pairs]
    script = singular_script(variables, equalities, pairs, args.method)
    try:
        completed = subprocess.run(
            ["Singular", "-q"],
            input=script,
            text=True,
            capture_output=True,
            timeout=args.timeout_seconds,
            check=False,
        )
        stdout = completed.stdout
        stderr = completed.stderr
        returncode = completed.returncode
        timed_out = False
    except subprocess.TimeoutExpired as error:
        stdout = error.stdout or ""
        stderr = error.stderr or ""
        if isinstance(stdout, bytes):
            stdout = stdout.decode(errors="replace")
        if isinstance(stderr, bytes):
            stderr = stderr.decode(errors="replace")
        returncode = None
        timed_out = True

    unit_marker = next(
        (line.strip() for line in stdout.splitlines() if line.startswith("UNIT_AT_STEP_")),
        None,
    )
    completed_steps = sum(
        1 for line in stdout.splitlines() if line.startswith("STEP_") and line.endswith("_END")
    )
    if unit_marker is not None:
        classification = "UNIT_NO_REAL_PAIRWISE_DISTINCT_EQUALITY_REALIZATION"
    elif timed_out:
        classification = "TIMEOUT_NO_VERDICT"
    elif "FINAL_NONUNIT" in stdout and args.max_pairs == 65:
        classification = (
            "SATURATED_IDEAL_NONUNIT_REAL_FEASIBILITY_UNKNOWN"
            if args.method == "saturation"
            else "FULL_SINGLE_QUOTIENT_NONUNIT_NO_VERDICT"
        )
    elif "FINAL_NONUNIT" in stdout:
        classification = "PREFIX_SATURATION_NONUNIT_NO_VERDICT"
    else:
        classification = "ERROR_NO_VERDICT"
    print(json.dumps({
        "schema": "p97-654-distinct-saturation-v1",
        "equality_sha256": digest,
        "engine": "Singular 4.4.1 characteristic-zero dp ideal arithmetic",
        "method": args.method,
        "timeout_seconds": args.timeout_seconds,
        "pair_start": args.pair_start,
        "requested_pair_count": len(pairs),
        "completed_pair_count": completed_steps,
        "unit_marker": unit_marker,
        "classification": classification,
        "returncode": returncode,
        "stdout": stdout,
        "stderr": stderr,
        "trust_boundary": (
            "trusted exact-CAS computation, not independently replayed and not a Lean proof; "
            "only UNIT is an exclusion verdict; quotient-once NONUNIT does not compute full saturation"
        ),
    }, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
