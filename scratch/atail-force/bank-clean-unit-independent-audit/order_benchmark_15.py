#!/usr/bin/env python3
"""Benchmark exact Singular slimgb orders before requesting transformations."""

from __future__ import annotations

import json
import re
from concurrent.futures import ThreadPoolExecutor, as_completed
from pathlib import Path
from typing import Any

import audit
import minimize_core as core


HERE = Path(__file__).resolve().parent
SOURCE = HERE / "unit_certificate_15.sing"


def variants() -> dict[str, list[str]]:
    full = [f"x{index}{axis}" for index in range(2, 14) for axis in ("x", "y")]
    source = SOURCE.read_text()
    active_set = set(re.findall(r"x\d+[xy]", source.split("ideal One=1;", 1)[0]))
    active = [variable for variable in full if variable in active_set]
    points = sorted({int(variable[1:-1]) for variable in active})
    return {
        "full_padded_numeric": full,
        "active_numeric": active,
        "active_reverse": list(reversed(active)),
        "active_points_reverse": [
            f"x{index}{axis}" for index in reversed(points) for axis in ("x", "y")
        ],
        "active_axes_blocked": [
            f"x{index}{axis}" for axis in ("x", "y") for index in points
        ],
    }


def make_source(name: str, variables: list[str]) -> Path:
    text = SOURCE.read_text()
    _ring, rest = text.split("\n", 1)
    ideal_prefix = rest.split("ideal One=1;", 1)[0]
    script = "\n".join(
        [
            f"ring R=0,({','.join(variables)}),dp;",
            ideal_prefix.rstrip(),
            "ideal G=slimgb(I);",
            "poly remainder=reduce(1,G);",
            'if (remainder==0) { print("STATUS_UNIT"); }',
            'else { print("STATUS_NONUNIT"); }',
            "quit;",
            "",
        ]
    )
    path = HERE / f"order_{name}.sing"
    path.write_text(script)
    return path


def run_one(name: str, variables: list[str]) -> dict[str, Any]:
    path = make_source(name, variables)
    result = audit.run(["Singular", "-q", str(path)], timeout=90)
    result["verdict"] = audit.singular_verdict(str(result.get("stdout", "")))
    return {"name": name, "variables": variables, "source": str(path), "run": result}


def main() -> None:
    all_variants = variants()
    results: list[dict[str, Any]] = []
    with ThreadPoolExecutor(max_workers=len(all_variants)) as pool:
        futures = {
            pool.submit(run_one, name, variables): name
            for name, variables in all_variants.items()
        }
        for future in as_completed(futures):
            result = future.result()
            results.append(result)
            print(
                result["name"],
                result["run"]["verdict"],
                result["run"]["seconds"],
                flush=True,
            )
    results.sort(key=lambda item: item["name"])
    report = {
        "schema": "p97-bank-clean-15-equality-singular-order-benchmark-v1",
        "results": results,
    }
    (HERE / "order_benchmark_15.json").write_text(
        json.dumps(report, indent=2, sort_keys=True) + "\n"
    )
    print(
        json.dumps(
            sorted(
                [
                    {
                        "name": result["name"],
                        "verdict": result["run"]["verdict"],
                        "seconds": result["run"]["seconds"],
                    }
                    for result in results
                ],
                key=lambda item: item["seconds"],
            )
        ),
        flush=True,
    )


if __name__ == "__main__":
    main()
