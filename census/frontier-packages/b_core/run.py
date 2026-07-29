"""Run the B-family named-local production matrix."""

from __future__ import annotations

import argparse
import json
import time
from pathlib import Path
from typing import Any

import encoding as enc

OUT_DIR = Path(__file__).resolve().parent / "out"


def run_one(
    encoder: enc.BEncoder,
    name: str,
    layers: tuple[str, ...],
    extra: list[tuple[int, ...]],
    timeout_seconds: int,
    classification: str,
) -> dict[str, Any]:
    clauses = encoder.clauses(*layers)
    instance = enc.RunInstance(encoder, clauses)
    cnf_path = OUT_DIR / f"{name}.cnf"
    proof_path = OUT_DIR / f"{name}.drat"
    start = time.monotonic()
    result = enc.solve_cadical(
        instance,
        cnf_path,
        extra_clauses=extra,
        timeout_seconds=timeout_seconds,
        proof_path=proof_path,
    )
    elapsed = time.monotonic() - start
    record: dict[str, Any] = {
        "run": name,
        "classification": classification,
        "layers": list(layers),
        "verdict": result.verdict,
        "n_variables": encoder.cnf.n_variables,
        "n_clauses": len(clauses) + len(extra),
        "extra_clause_tags": [f"RUN-pin:{name}"] * len(extra),
        "wall_seconds": round(elapsed, 3),
        "cnf_file": str(cnf_path.relative_to(OUT_DIR.parent)),
        "proof_verified": result.proof_verified,
    }
    if result.verdict == "SAT" and result.cube is not None:
        model_path = OUT_DIR / f"{name}.model.json"
        model_path.write_text(json.dumps(result.cube, sort_keys=True, indent=2) + "\n")
        record["model_file"] = str(model_path.relative_to(OUT_DIR.parent))
        record["true_atoms"] = sorted(k for k, value in result.cube.items() if value)
    return record


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--timeout-seconds", type=int, default=60)
    args = parser.parse_args()
    OUT_DIR.mkdir(parents=True, exist_ok=True)
    encoder = enc.BEncoder()

    matrix: list[tuple[str, tuple[str, ...], list[tuple[int, ...]], str]] = [
        ("base", ("base",), [], "diagnostic baseline"),
        (
            "B1-direct-shadow",
            ("base", "B1-direct-shadow"),
            [],
            "prerequisite ingress missing; NOT an official B1 verdict",
        ),
        ("B2", ("base", "B2"), [], "B2 named-local package verdict"),
        (
            "B2-collision-u",
            ("base", "B2"),
            encoder.unit_clause("B2.collision.u"),
            "B2 arm isolation",
        ),
        (
            "B2-collision-v",
            ("base", "B2"),
            encoder.unit_clause("B2.collision.v"),
            "B2 arm isolation",
        ),
        (
            "B2-collision-b2",
            ("base", "B2"),
            encoder.unit_clause("B2.collision.b2"),
            "B2 arm isolation",
        ),
        ("B3", ("base", "B3"), [], "B3 named-local package verdict"),
    ]
    for arm in ("a2", "bu", "bv", "b2"):
        matrix.append(
            (
                f"B3-square-{arm}",
                ("base", "B3"),
                encoder.unit_clause(f"B3.square.{arm}"),
                "B3 arm isolation",
            )
        )

    records = [
        run_one(encoder, name, layers, extra, args.timeout_seconds, classification)
        for name, layers, extra, classification in matrix
    ]
    manifest = {
        "schema": "p97-b-core-named-local.v1",
        "b1_official_verdict": "OMITTED_PREREQUISITE_INGRESS_MISSING",
        "scope": (
            "EMPIRICALLY VERIFIED only for the named-local CNF projection; "
            "SAT is not a geometric model and UNSAT would require a Lean ingress/replay bridge"
        ),
        "tag_counts": encoder.tag_counts(),
        "layer_clause_tags": encoder.layer_tags,
        "runs": records,
    }
    manifest_path = OUT_DIR / "manifest.json"
    manifest_path.write_text(json.dumps(manifest, sort_keys=True, indent=2) + "\n")
    for record in records:
        print(
            f"{record['run']:22s} {record['verdict']:7s} "
            f"vars={record['n_variables']:3d} clauses={record['n_clauses']:3d} "
            f"wall={record['wall_seconds']:.3f}s"
        )
    print("B1 official verdict: OMITTED_PREREQUISITE_INGRESS_MISSING")
    print(f"manifest -> {manifest_path}")
    return 0 if all(r["verdict"] in {"SAT", "UNSAT"} for r in records) else 1


if __name__ == "__main__":
    raise SystemExit(main())
