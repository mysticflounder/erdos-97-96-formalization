#!/usr/bin/env python3
"""Dual-oracle radical-membership crosscheck for one forced-zero pair.

Admission-grade certification that a squared point distance vanishes on
every complex realization of a fixed row-assignment equality shadow:

1. replay the canonical row signature of the witness (fail-closed);
2. Singular direct reduction: ``reduce(dist2(L,R), std(I)) == 0`` gives
   strict ideal membership;
3. Rabinowitsch crosscheck: ``I + (1 - t*dist2(L,R))`` is UNIT iff
   ``dist2(L,R)`` lies in the radical of ``I`` — checked in Singular and
   in msolve under forward and reversed variable orders.

Strict membership implies radical membership, so 2 and 3 must agree; the
combined verdict is only emitted when all four oracle calls concur.  A
forced-zero squared distance for two distinct carrier labels certifies
that the shadow has no realization with distinct points, hence no real
Euclidean witness.

``--radical-only`` skips step 2 (the direct reduction needs ``std(I)``,
which some witnesses defeat at any practical budget) and certifies from
step 3 alone: Rabinowitsch UNIT in Singular AND msolve under forward
AND reversed variable orders.  Radical membership is exactly the
property the forced-zero conclusion consumes — ``f`` vanishes on every
point of ``V(I)`` — so the grade is still dual-oracle; the emitted
status string records the weaker-but-sufficient check.
"""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[3]
METRIC_ORACLE_PATH = (
    ROOT / "scratch/atail-force/second_center_metric_oracle/oracle.py"
)
FIRST_APEX = 1


def require(condition: bool, message: str) -> None:
    if not condition:
        raise AssertionError(message)


def load_metric_oracle():
    spec = importlib.util.spec_from_file_location(
        "membership_crosscheck_metric_oracle", METRIC_ORACLE_PATH
    )
    require(spec is not None and spec.loader is not None,
            "metric oracle import failed")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


def replay_row_signature(report: dict) -> str:
    payload = sorted(
        [
            [FIRST_APEX, sorted(report["card_five_support"])],
            *[
                [int(center), sorted(support)]
                for center, support in report["rows"].items()
            ],
        ],
        key=lambda row: row[0],
    )
    return hashlib.sha256(
        json.dumps(payload, separators=(",", ":")).encode("utf-8")
    ).hexdigest()


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--witness", required=True,
                        help="path to a --metric search report JSON")
    parser.add_argument("--pair", nargs=2, type=int,
                        metavar=("L", "R"))
    parser.add_argument("--scan", action="store_true",
                        help="reduce every squared pair distance against one "
                        "std(I) and print the forced-zero pairs (Singular "
                        "only; certify a chosen pair with --pair afterwards)")
    parser.add_argument("--expect-signature", required=True,
                        help="expected canonical row signature (fail-closed)")
    parser.add_argument("--radical-only", action="store_true",
                        help="--pair only: skip the std(I) direct reduction "
                        "and certify from the Rabinowitsch UNIT crosscheck "
                        "alone (Singular + msolve forward/reverse)")
    parser.add_argument("--timeout", type=float, default=120.0)
    args = parser.parse_args()
    require(args.scan != (args.pair is not None),
            "pass exactly one of --pair or --scan")

    document = json.loads(Path(args.witness).read_text(encoding="utf-8"))
    report = document["reports"][0]
    require(
        report["status"] == "SAT_TARGET_NEGATING_FINITE_SHADOW_ONLY",
        "witness report is not a SAT finite-shadow witness",
    )
    signature = replay_row_signature(report)
    require(signature == args.expect_signature,
            f"row signature mismatch: replayed {signature}")

    oracle = load_metric_oracle()
    n = len(report["rows"]) + 1
    rows = [
        oracle.MetricRow(
            FIRST_APEX, tuple(sorted(report["card_five_support"])), exact=True
        ),
        *(
            oracle.MetricRow(int(center), tuple(sorted(support)), exact=False)
            for center, support in sorted(
                report["rows"].items(), key=lambda item: int(item[0])
            )
        ),
    ]
    variables = [str(v) for v in oracle.variable_symbols(n)]
    polynomials = list(oracle.serialized_system(n, tuple(rows)))
    points = oracle.coordinate_symbols(n)
    sympy_variables = oracle.variable_symbols(n)

    if args.scan:
        import itertools
        pair_polys = {}
        for scan_left, scan_right in itertools.combinations(range(n), 2):
            pair_polys[(scan_left, scan_right)] = oracle.serialize_poly(
                oracle.sp.Poly(
                    oracle.squared_distance(points, scan_left, scan_right),
                    *sympy_variables,
                    domain=oracle.sp.QQ,
                )
            )
        lines = [
            f"ring R=0,({','.join(variables)}),dp;",
            f"ideal I={','.join(polynomials)};",
            "ideal G=std(I);",
            f"ideal P={','.join(pair_polys.values())};",
            "ideal Z=reduce(P,G);",
        ]
        for index, (scan_left, scan_right) in enumerate(pair_polys, start=1):
            lines.append(
                f'if (Z[{index}]==0) '
                f'{{ print("FORCED_ZERO_{scan_left}_{scan_right}"); }}'
            )
        lines.append('print("SCAN_DONE");')
        lines.append("quit;")
        process = subprocess.run(
            ["Singular", "-q"],
            input="\n".join(lines) + "\n",
            capture_output=True,
            text=True,
            timeout=args.timeout,
            check=False,
        )
        require(process.returncode == 0,
                f"Singular scan failed: {process.stderr.strip()}")
        require("SCAN_DONE" in process.stdout.splitlines(),
                "Singular scan did not complete")
        forced = [
            [int(chunk.split("_")[2]), int(chunk.split("_")[3])]
            for chunk in process.stdout.splitlines()
            if chunk.startswith("FORCED_ZERO_")
        ]
        print(json.dumps({
            "schema": "p97-atail-forced-zero-pair-scan-v1",
            "row_signature_sha256": signature,
            "equality_sha256": oracle.canonical_sha256(polynomials),
            "forced_zero_squared_distance_pairs": forced,
            "verdict_scope": (
                "Singular-only scan; certify a chosen pair with --pair "
                "for the dual-oracle admission grade"
            ),
        }, indent=2, sort_keys=True))
        return

    left, right = args.pair
    require(left != right, "the forced-zero pair must be two distinct labels")
    pair_expr = oracle.squared_distance(points, left, right)
    pair_poly = oracle.serialize_poly(
        oracle.sp.Poly(pair_expr, *sympy_variables, domain=oracle.sp.QQ)
    )

    if args.radical_only:
        direct_reduction = "SKIPPED_RADICAL_ONLY"
    else:
        script = "\n".join([
            f"ring R=0,({','.join(variables)}),dp;",
            f"ideal I={','.join(polynomials)};",
            "ideal G=std(I);",
            f"poly f={pair_poly};",
            'print("RED_BEGIN");',
            "print(reduce(f,G));",
            'print("RED_END");',
            "quit;",
        ]) + "\n"
        process = subprocess.run(
            ["Singular", "-q"],
            input=script,
            capture_output=True,
            text=True,
            timeout=args.timeout,
            check=False,
        )
        require(process.returncode == 0,
                f"Singular reduction failed: {process.stderr.strip()}")
        output = process.stdout.splitlines()
        begin = output.index("RED_BEGIN")
        end = output.index("RED_END")
        require(end == begin + 2, "malformed Singular reduction output")
        direct_reduction = output[begin + 1].strip()

    t_symbol = oracle.sp.Symbol("t")
    rabinowitsch_poly = oracle.serialize_poly(
        oracle.sp.Poly(
            oracle.sp.expand(1 - t_symbol * pair_expr),
            *sympy_variables,
            t_symbol,
            domain=oracle.sp.QQ,
        )
    )
    extended_variables = variables + ["t"]
    extended_polynomials = polynomials + [rabinowitsch_poly]
    singular_unit = oracle.run_singular(
        extended_variables, extended_polynomials, timeout_s=args.timeout
    )
    msolve_forward = oracle.run_msolve(
        extended_variables, extended_polynomials, timeout_s=args.timeout
    )
    msolve_reverse = oracle.run_msolve(
        list(reversed(extended_variables)),
        extended_polynomials,
        timeout_s=args.timeout,
    )

    verdicts = {
        "singular_direct_reduction": direct_reduction,
        "rabinowitsch_singular": oracle.result_dict(singular_unit),
        "rabinowitsch_msolve_forward": oracle.result_dict(msolve_forward),
        "rabinowitsch_msolve_reverse": oracle.result_dict(msolve_reverse),
    }
    rabinowitsch_unit = (
        singular_unit.verdict == "UNIT"
        and msolve_forward.verdict == "UNIT"
        and msolve_reverse.verdict == "UNIT"
    )
    if args.radical_only:
        status = (
            "CROSSCHECKED_REAL_INFEASIBLE_RADICAL_MEMBERSHIP"
            if rabinowitsch_unit else "NOT_CROSSCHECKED"
        )
    else:
        status = (
            "CROSSCHECKED_REAL_INFEASIBLE_MEMBERSHIP"
            if direct_reduction == "0" and rabinowitsch_unit
            else "NOT_CROSSCHECKED"
        )
    print(json.dumps({
        "schema": "p97-atail-forced-zero-pair-membership-crosscheck-v1",
        "row_signature_sha256": signature,
        "equality_sha256": oracle.canonical_sha256(polynomials),
        "pair": [left, right],
        "status": status,
        "oracles": verdicts,
        "verdict_scope": (
            "dist2(pair) vanishes on every complex realization of this "
            "fixed equality shadow; distinct-label realizations are "
            "impossible, hence no real Euclidean witness"
        ),
    }, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
