#!/usr/bin/env python3
"""Standalone long-budget UNIT recheck for one SAT finite-shadow witness.

The search's inline metric audit runs under short per-oracle budgets;
when one oracle times out there, the combined verdict degrades to
UNDECIDED_ORACLE_DISAGREEMENT_OR_TIMEOUT even when the other two
concur.  This tool replays the witness row signature (fail-closed),
rebuilds the identical pure equality system, and re-runs the
three-oracle crosscheck (Singular + msolve forward/reverse variable
orders) under a caller-chosen timeout.  On CROSSCHECKED_UNIT it runs
the same one-pass row-deletion strategy as the inline audit with a
caller-chosen per-attempt budget and crosschecks the retained core, so
the output is admission-grade for REAL_INFEASIBLE_ROW_CORES.
"""

from __future__ import annotations

import argparse
import importlib.util
import json
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent


def load_module(name: str, path: Path):
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise AssertionError(f"import failed for {path}")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


mc = load_module(
    "system_unit_recheck_membership", HERE / "membership_crosscheck.py"
)


def crosscheck(oracle, variables, polynomials, timeout_s):
    singular = oracle.run_singular(variables, polynomials, timeout_s=timeout_s)
    forward = oracle.run_msolve(variables, polynomials, timeout_s=timeout_s)
    reverse = oracle.run_msolve(
        list(reversed(variables)), polynomials, timeout_s=timeout_s
    )
    verdicts = (singular.verdict, forward.verdict, reverse.verdict)
    if len(set(verdicts)) == 1 and verdicts[0] in {"UNIT", "NONUNIT"}:
        status = f"CROSSCHECKED_{verdicts[0]}"
    else:
        status = "UNDECIDED_ORACLE_DISAGREEMENT_OR_TIMEOUT"
    return status, {
        "status": status,
        "singular_qq": oracle.result_dict(singular),
        "msolve_qq_forward_variables": oracle.result_dict(forward),
        "msolve_qq_reverse_variables": oracle.result_dict(reverse),
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--witness", required=True,
                        help="path to a --metric search report JSON")
    parser.add_argument("--expect-signature", required=True,
                        help="expected canonical row signature (fail-closed)")
    parser.add_argument("--timeout", type=float, default=600.0,
                        help="per-oracle timeout for system/core crosschecks")
    parser.add_argument("--deletion-timeout", type=float, default=60.0,
                        help="per-attempt Singular timeout in the deletion pass")
    parser.add_argument("--skip-deletion", action="store_true")
    args = parser.parse_args()

    document = json.loads(Path(args.witness).read_text(encoding="utf-8"))
    report = document["reports"][0]
    mc.require(
        report["status"] == "SAT_TARGET_NEGATING_FINITE_SHADOW_ONLY",
        "witness report is not a SAT finite-shadow witness",
    )
    signature = mc.replay_row_signature(report)
    mc.require(signature == args.expect_signature,
               f"row signature mismatch: replayed {signature}")

    oracle = mc.load_metric_oracle()
    n = len(report["rows"]) + 1
    rows = [
        oracle.MetricRow(
            mc.FIRST_APEX, tuple(sorted(report["card_five_support"])),
            exact=True,
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
    equality_sha256 = oracle.canonical_sha256(polynomials)
    reported_hash = report.get("metric_equality_audit", {}).get(
        "expanded_polynomial_sha256"
    )
    if reported_hash is not None:
        mc.require(
            equality_sha256 == reported_hash,
            f"equality system hash mismatch: rebuilt {equality_sha256}, "
            f"search reported {reported_hash}",
        )

    status, system_crosscheck = crosscheck(
        oracle, variables, polynomials, args.timeout
    )

    deletion = None
    if status == "CROSSCHECKED_UNIT" and not args.skip_deletion:
        active = list(enumerate(rows))
        attempts = []
        for original_index, _row in tuple(active):
            candidate = tuple(
                row for index, row in active if index != original_index
            )
            result = oracle.run_singular(
                variables,
                list(oracle.serialized_system(n, candidate)),
                timeout_s=args.deletion_timeout,
            )
            removed = result.verdict == "UNIT"
            attempts.append({
                "original_index": original_index,
                "verdict": result.verdict,
                "removed": removed,
            })
            if removed:
                active = [
                    item for item in active if item[0] != original_index
                ]
        retained = tuple(row for _, row in active)
        retained_polynomials = list(oracle.serialized_system(n, retained))
        _, core_crosscheck = crosscheck(
            oracle, variables, retained_polynomials, args.timeout
        )
        deletion = {
            "strategy": "one-pass-canonical-row-deletion",
            "initial_row_count": len(rows),
            "retained_row_count": len(retained),
            "retained_equality_count": len(retained_polynomials),
            "complete": all(
                attempt["verdict"] in {"UNIT", "NONUNIT"}
                for attempt in attempts
            ),
            "retained_rows": [oracle.row_dict(row) for row in retained],
            "attempts": attempts,
            "retained_core_crosscheck": core_crosscheck,
        }

    print(json.dumps({
        "schema": "p97-atail-system-unit-recheck-v1",
        "row_signature_sha256": signature,
        "equality_sha256": equality_sha256,
        "timeout_s": args.timeout,
        "deletion_timeout_s": args.deletion_timeout,
        "status": status,
        "oracles": system_crosscheck,
        "bounded_row_deletion": deletion,
    }, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
