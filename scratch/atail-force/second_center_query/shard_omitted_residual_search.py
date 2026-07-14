#!/usr/bin/env python3
"""Search a minimized shard core for a small omitted-equation residual.

For each equality ``f_i = 0``, retain the other equalities, introduce
``u = f_i``, and eliminate every coordinate variable.  A univariate relation
with nonzero constant term gives a factored proof route: prove the residual
from the other equations, then close it with ``f_i = 0``.  Results are trusted
CAS discovery data until the two steps are replayed in Lean.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import subprocess
import sys
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path
from typing import Any, Mapping

import sympy as sp


HERE = Path(__file__).resolve().parent
ORACLE_DIR = HERE.parent / "second_center_metric_oracle"
if str(ORACLE_DIR) not in sys.path:
    sys.path.insert(0, str(ORACLE_DIR))

import oracle  # noqa: E402


SCHEMA = "p97-atail-shard-omitted-residual-search-v1"


def normalized_system(
    checkpoint: Mapping[str, Any],
    shard_index: int,
    anchor_left: int,
    anchor_right: int,
) -> tuple[list[Mapping[str, Any]], tuple[str, ...], tuple[str, ...], dict[int, int]]:
    case = next(
        case
        for case in checkpoint["cases"]
        if int(case["shard_index"]) == shard_index
    )
    records = case["minimization"]["retained_equalities"]
    active_points = sorted(
        {
            int(record[key])
            for record in records
            for key in ("center", "left", "right")
        }
    )
    if anchor_left == anchor_right:
        raise ValueError("normalization anchors must be distinct")
    if anchor_left not in active_points or anchor_right not in active_points:
        raise ValueError("normalization anchors must occur in the equality core")
    relabeling = {anchor_left: 0, anchor_right: 1}
    relabeling.update(
        {
            point: index
            for index, point in enumerate(
                (
                    point
                    for point in active_points
                    if point not in {anchor_left, anchor_right}
                ),
                start=2,
            )
        }
    )
    n = len(active_points)
    rows = tuple(
        oracle.MetricRow(
            relabeling[int(record["center"])],
            (
                relabeling[int(record["left"])],
                relabeling[int(record["right"])],
            ),
            exact=False,
        )
        for record in records
    )
    variables = tuple(str(variable) for variable in oracle.variable_symbols(n))
    polynomials = tuple(
        oracle.serialize_poly(oracle.row_polynomials(n, row)[0])
        for row in rows
    )
    return records, variables, polynomials, relabeling


def probe(
    omitted: int,
    variables: tuple[str, ...],
    polynomials: tuple[str, ...],
    timeout: float,
) -> dict[str, Any]:
    retained = [
        polynomial
        for index, polynomial in enumerate(polynomials)
        if index != omitted
    ]
    retained.append(f"u-({polynomials[omitted]})")
    variable_text = ",".join((*variables, "u"))
    eliminated_product = "*".join(variables)
    script = "\n".join(
        (
            f"ring r=0,({variable_text}),lp;",
            f"ideal I={','.join(retained)};",
            f"ideal E=eliminate(I,{eliminated_product});",
            'print("P97_ELIM_BEGIN");',
            "print(E);",
            'print("P97_ELIM_END");',
            "exit;",
        )
    )
    try:
        completed = subprocess.run(
            ("Singular", "-q"),
            input=script + "\n",
            capture_output=True,
            text=True,
            timeout=timeout,
            check=False,
        )
    except subprocess.TimeoutExpired:
        return {"omitted": omitted, "status": "TIMEOUT"}
    if completed.returncode != 0:
        return {
            "omitted": omitted,
            "status": "ERROR",
            "detail": (completed.stderr or completed.stdout)[-2000:],
        }
    try:
        body = completed.stdout.split("P97_ELIM_BEGIN\n", 1)[1].split(
            "\nP97_ELIM_END", 1
        )[0]
    except IndexError:
        return {
            "omitted": omitted,
            "status": "ERROR",
            "detail": "missing elimination markers",
        }
    raw = [] if body in {"", "0"} else body.split(",\n")
    parsed = [sp.Poly(poly.replace("^", "**"), sp.Symbol("u"), domain=sp.QQ)
              for poly in raw]
    primitive = None
    for polynomial in parsed:
        primitive = polynomial if primitive is None else sp.gcd(primitive, polynomial)
    if primitive is None:
        return {"omitted": omitted, "status": "NO_CONSEQUENCE"}
    primitive = sp.Poly(primitive.monic(), sp.Symbol("u"), domain=sp.QQ)
    factored = str(sp.factor(primitive.as_expr()))
    return {
        "omitted": omitted,
        "status": "CONSEQUENCE",
        "degree": primitive.degree(),
        "constant": str(primitive.eval(0)),
        "constant_nonzero": primitive.eval(0) != 0,
        "primitive_consequence": factored,
        "serialized_char_count": len(factored),
        "elimination_generators": raw,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("checkpoint", type=Path)
    parser.add_argument("--shard-index", type=int, required=True)
    parser.add_argument("--anchor-left", type=int, required=True)
    parser.add_argument("--anchor-right", type=int, required=True)
    parser.add_argument("--workers", type=int, default=11)
    parser.add_argument("--timeout-seconds", type=float, default=180.0)
    parser.add_argument("--output", type=Path)
    args = parser.parse_args()
    if not 1 <= args.workers <= 23:
        parser.error("--workers must be between 1 and 23")
    if args.timeout_seconds <= 0:
        parser.error("--timeout-seconds must be positive")

    raw = args.checkpoint.read_bytes()
    checkpoint = json.loads(raw)
    try:
        records, variables, polynomials, relabeling = normalized_system(
            checkpoint,
            args.shard_index,
            args.anchor_left,
            args.anchor_right,
        )
    except ValueError as error:
        parser.error(str(error))

    results = []
    with ThreadPoolExecutor(max_workers=min(args.workers, len(polynomials))) as executor:
        futures = {
            executor.submit(
                probe, omitted, variables, polynomials, args.timeout_seconds
            ): omitted
            for omitted in range(len(polynomials))
        }
        for future in as_completed(futures):
            result = future.result()
            results.append(result)
            print(
                f"omitted {result['omitted']}: {result['status']}"
                f" degree={result.get('degree', '?')}"
                f" nonzero={result.get('constant_nonzero', False)}",
                file=sys.stderr,
                flush=True,
            )
    results.sort(
        key=lambda result: (
            not bool(result.get("constant_nonzero")),
            int(result.get("degree", 10**9)),
            int(result.get("serialized_char_count", 10**9)),
            int(result["omitted"]),
        )
    )
    document = {
        "schema": SCHEMA,
        "scope": {
            "trusted_singular_elimination": True,
            "certificate_replayed": False,
            "lean_theorem_proved": False,
            "target_faithful": False,
            "fixed_placement_only": True,
        },
        "source_checkpoint": str(args.checkpoint),
        "source_checkpoint_sha256": hashlib.sha256(raw).hexdigest(),
        "shard_index": args.shard_index,
        "normalization_anchors": [args.anchor_left, args.anchor_right],
        "relabeling": {str(key): value for key, value in relabeling.items()},
        "equalities": records,
        "variables": list(variables),
        "polynomials_sha256": hashlib.sha256(
            json.dumps(polynomials, separators=(",", ":")).encode()
        ).hexdigest(),
        "results": results,
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
