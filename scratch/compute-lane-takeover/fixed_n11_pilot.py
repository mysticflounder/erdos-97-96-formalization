#!/usr/bin/env python3
"""Bounded exact-realization pilot for one frozen census-554 cube.

The decisive outcome is an independently replayed Nullstellensatz identity.
All incomplete outcomes are explicitly UNKNOWN.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
from pathlib import Path
import sys
import time


HERE = Path(__file__).resolve().parent
REPO = HERE.parents[1]
CENSUS = REPO / "scratch" / "census-554"
CANDIDATE = (
    CENSUS
    / "separation_probe_runs"
    / "run-20260713T054559Z-oracle13-from-iter813"
    / "combined_frontier.json"
)
RESULTS = HERE / "results"
PID = "fixed_n11_oracle13_iter813"

sys.path.insert(0, str(CENSUS))

import miner  # noqa: E402
import verify_certs  # noqa: E402


KNOWN_DEAD = {
    0: frozenset({6, 7}),
    6: frozenset({0, 7, 8}),
    8: frozenset({0, 6, 7}),
}
KNOWN_SAT = {6: frozenset({0, 2})}


def atomic_json(path: Path, payload: object) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    temporary = path.with_suffix(path.suffix + ".tmp")
    with temporary.open("w", encoding="utf-8") as handle:
        json.dump(payload, handle, indent=2, sort_keys=True)
        handle.write("\n")
    os.replace(temporary, path)


def load_candidate() -> tuple[dict[int, frozenset[int]], dict[str, object]]:
    raw_bytes = CANDIDATE.read_bytes()
    source = json.loads(raw_bytes)
    cube = {int(center): frozenset(members) for center, members in source["cube"].items()}

    assert source["schema"] == "census554_frozen_separation_probe.v1"
    assert source["status"] == "combined-frontier"
    assert source["independent_cube_ok"] is True
    assert set(cube) == set(range(11))
    assert all(len(members) == 4 for members in cube.values())
    assert all(center not in members for center, members in cube.items())
    assert all(all(0 <= member < 11 for member in members) for members in cube.values())

    provenance = {
        "path": str(CANDIDATE.relative_to(REPO)),
        "sha256": hashlib.sha256(raw_bytes).hexdigest(),
        "source_schema": source["schema"],
        "source_status": source["status"],
        "source_iteration": source["iteration"],
        "source_seed": source["seed"],
    }
    return cube, provenance


def timed_fast_screen(pattern: dict[int, frozenset[int]], timeout: float) -> dict[str, object]:
    started = time.monotonic()
    signal = miner.pattern_dead_fast(pattern, timeout=timeout)
    return {
        "deadness_signal": signal,
        "elapsed_seconds": round(time.monotonic() - started, 6),
        "timeout_seconds": timeout,
        "trust": "screen only; False conflates nonempty, timeout, and solver failure",
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--screen-timeout", type=float, default=30.0)
    parser.add_argument("--certificate-budget", type=float, default=240.0)
    args = parser.parse_args()

    cube, provenance = load_candidate()
    controls = {
        "known_dead": timed_fast_screen(KNOWN_DEAD, args.screen_timeout),
        "known_satisfiable": timed_fast_screen(KNOWN_SAT, args.screen_timeout),
    }
    if controls["known_dead"]["deadness_signal"] is not True:
        raise RuntimeError("known-dead control did not report dead")
    if controls["known_satisfiable"]["deadness_signal"] is not False:
        raise RuntimeError("known-satisfiable control was falsely reported dead")

    result: dict[str, object] = {
        "schema": "p97_fixed_n11_realization_pilot.v1",
        "candidate": provenance,
        "controls": controls,
        "model": {
            "points": 11,
            "selected_equidistance_equalities": sum(len(row) - 1 for row in cube.values()),
            "included": ["selected equidistance equalities", "pairwise distinctness"],
            "omitted": [
                "convexity",
                "cyclic hull order",
                "distance-class exactness",
                "all non-selected distance inequalities",
            ],
        },
    }

    screen = timed_fast_screen(cube, args.screen_timeout)
    result["candidate_screen"] = screen
    if screen["deadness_signal"] is not True:
        result["status"] = "UNKNOWN_SCREEN_NO_DEADNESS_SIGNAL"
        atomic_json(RESULTS / "result.json", result)
        print(result["status"])
        return 2

    certificate, stats = miner.certify_pattern_with_stats(
        cube,
        timeout=args.certificate_budget,
    )
    result["certificate_stats"] = stats
    if certificate is None:
        result["status"] = "UNKNOWN_CERTIFICATE_NOT_OBTAINED"
        atomic_json(RESULTS / "result.json", result)
        print(result["status"])
        return 2

    certificate["pid"] = PID
    pattern_json = {str(center): sorted(cube[center]) for center in sorted(cube)}
    bank_record = {
        "pid": PID,
        "pattern": pattern_json,
        "n_orbit": len(miner.orbit(cube)),
    }
    generator_count = verify_certs.verify_cert(bank_record, certificate)

    certificate_path = RESULTS / "certificate.json"
    atomic_json(certificate_path, certificate)
    result.update(
        {
            "status": "CERTIFIED_EMPTY_EQUALITY_DISTINCTNESS",
            "certificate": {
                "path": str(certificate_path.relative_to(REPO)),
                "sha256": hashlib.sha256(certificate_path.read_bytes()).hexdigest(),
                "bytes": certificate_path.stat().st_size,
                "kill": certificate["kill"],
                "generators": generator_count,
                "python_exact_identity": certificate["python_exact_identity"],
                "independent_verifier": "scratch/census-554/verify_certs.py:verify_cert",
            },
            "logical_scope": (
                "No pairwise-distinct complex realization satisfies all selected "
                "equidistance equalities; therefore this frozen cube has no real "
                "convex realization."
            ),
        }
    )
    atomic_json(RESULTS / "result.json", result)
    print(result["status"])
    print(f"certificate={result['certificate']['path']}")
    print(f"bytes={result['certificate']['bytes']} generators={generator_count}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
