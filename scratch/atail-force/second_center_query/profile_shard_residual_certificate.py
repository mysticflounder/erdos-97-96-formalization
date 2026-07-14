#!/usr/bin/env python3
"""Measure a factored residual's exact Singular ideal-membership lift."""

from __future__ import annotations

import argparse
import hashlib
import json
import re
import subprocess
import sys
import time
from pathlib import Path


HERE = Path(__file__).resolve().parent
if str(HERE) not in sys.path:
    sys.path.insert(0, str(HERE))

from shard_omitted_residual_search import normalized_system  # noqa: E402


SCHEMA = "p97-atail-shard-residual-certificate-profile-v1"


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("residual_checkpoint", type=Path)
    parser.add_argument("--omitted", type=int)
    parser.add_argument("--timeout-seconds", type=float, default=300.0)
    parser.add_argument("--summary-only", action="store_true")
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    if args.timeout_seconds <= 0:
        parser.error("--timeout-seconds must be positive")

    residual_raw = args.residual_checkpoint.read_bytes()
    residual = json.loads(residual_raw)
    candidates = [
        result
        for result in residual["results"]
        if result.get("status") == "CONSEQUENCE"
        and result.get("constant_nonzero") is True
        and (args.omitted is None or int(result["omitted"]) == args.omitted)
    ]
    if not candidates:
        parser.error("no matching nonzero-constant residual")
    selected = min(
        candidates,
        key=lambda result: (
            int(result["degree"]),
            int(result["serialized_char_count"]),
            int(result["omitted"]),
        ),
    )
    source_path = Path(residual["source_checkpoint"])
    checkpoint = json.loads(source_path.read_text(encoding="utf-8"))
    anchors = residual["normalization_anchors"]
    _records, variables, polynomials, relabeling = normalized_system(
        checkpoint,
        int(residual["shard_index"]),
        int(anchors[0]),
        int(anchors[1]),
    )
    omitted = int(selected["omitted"])
    retained = [
        polynomial
        for index, polynomial in enumerate(polynomials)
        if index != omitted
    ]
    residual_u = str(selected["elimination_generators"][0])
    target = re.sub(r"\bu\b", f"({polynomials[omitted]})", residual_u)
    commands = [
        f"ring r=0,({','.join(variables)}),dp;",
        f"ideal I={','.join(retained)};",
        f"ideal T={target};",
        "option(redSB);",
        "ideal G=std(I);",
        "ideal R=reduce(T,G);",
        'print("P97_REMAINDER_BEGIN");',
        "print(R);",
        'print("P97_REMAINDER_END");',
        "matrix L=lift(I,T);",
        'print("P97_LIFT_BEGIN");',
        *(
            f'print("L[{index},1]="+string(L[{index},1]));'
            for index in range(1, len(retained) + 1)
        ),
        'print("P97_LIFT_END");',
        "exit;",
    ]
    started = time.monotonic()
    try:
        completed = subprocess.run(
            ("Singular", "-q"),
            input="\n".join(commands) + "\n",
            capture_output=True,
            text=True,
            timeout=args.timeout_seconds,
            check=False,
        )
    except subprocess.TimeoutExpired as error:
        result = {
            "status": "TIMEOUT",
            "elapsed_seconds": time.monotonic() - started,
            "partial_stdout_char_count": len(error.stdout or b""),
            "partial_stderr_char_count": len(error.stderr or b""),
        }
    else:
        stdout = completed.stdout
        try:
            remainder = stdout.split("P97_REMAINDER_BEGIN\n", 1)[1].split(
                "\nP97_REMAINDER_END", 1
            )[0]
            lift = stdout.split("P97_LIFT_BEGIN\n", 1)[1].split(
                "\nP97_LIFT_END", 1
            )[0]
        except IndexError:
            parser.error("Singular output omitted certificate markers")
        coefficients = lift.splitlines()
        result = {
            "status": "COMPLETED",
            "returncode": completed.returncode,
            "elapsed_seconds": time.monotonic() - started,
            "stderr": completed.stderr,
            "stdout_sha256": hashlib.sha256(stdout.encode()).hexdigest(),
            "remainder": remainder,
            "remainder_is_zero": remainder.strip() == "0",
            "lift_total_char_count": len(lift),
            "lift_max_coefficient_char_count": max(map(len, coefficients), default=0),
            "lift_nonzero_coefficient_count": sum(
                not coefficient.endswith("=0") for coefficient in coefficients
            ),
        }
        if not args.summary_only:
            result["lift_coefficients"] = coefficients

    document = {
        "schema": SCHEMA,
        "scope": {
            "trusted_singular_computation": True,
            "certificate_replayed": False,
            "lean_theorem_proved": False,
            "target_faithful": False,
            "fixed_placement_only": True,
        },
        "source_residual_checkpoint": str(args.residual_checkpoint),
        "source_residual_checkpoint_sha256": hashlib.sha256(residual_raw).hexdigest(),
        "source_equality_checkpoint": str(source_path),
        "shard_index": residual["shard_index"],
        "normalization_anchors": anchors,
        "relabeling": {str(key): value for key, value in relabeling.items()},
        "omitted": omitted,
        "omitted_polynomial": polynomials[omitted],
        "residual_in_u": residual_u,
        "residual_degree": selected["degree"],
        "residual_constant": selected["constant"],
        "target_sha256": hashlib.sha256(target.encode()).hexdigest(),
        "singular": result,
    }
    rendered = json.dumps(document, indent=2, sort_keys=True)
    if args.output is None:
        print(rendered)
    else:
        temporary = args.output.with_suffix(args.output.suffix + ".tmp")
        temporary.write_text(rendered + "\n")
        temporary.replace(args.output)
        print(f"wrote {args.output}", file=sys.stderr)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
