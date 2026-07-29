#!/usr/bin/env python3
"""Numerical candidate generator for the frozen v16 positive-row system.

The coordinates are generated from positive edge lengths and positive exterior
turns summing to 2*pi.  Exact edge closure therefore produces a strictly
counterclockwise locally-convex polygon; every returned candidate is also
checked against the original all-edge support inequalities.

This is candidate generation only.  A numerical fit is never reported as SAT
without a separate exact substitution replay.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import math
import time
from pathlib import Path
from typing import Any

import numpy as np
from scipy.optimize import least_squares


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def softmax(values: np.ndarray) -> np.ndarray:
    shifted = values - np.max(values)
    weights = np.exp(shifted)
    return weights / np.sum(weights)


class Problem:
    def __init__(self, equations: list[list[list[int]]], n: int = 19) -> None:
        self.n = n
        self.equations = equations
        self.support_triples = np.asarray(
            [
                (a, (a + 1) % n, c)
                for a in range(n)
                for c in range(n)
                if c not in (a, (a + 1) % n)
            ],
            dtype=int,
        )

    @property
    def variable_count(self) -> int:
        return 2 * (self.n - 1)

    def decode(self, vector: np.ndarray) -> tuple[np.ndarray, np.ndarray, np.ndarray]:
        log_lengths = np.concatenate(([0.0], vector[: self.n - 1]))
        lengths = np.exp(np.clip(log_lengths, -8.0, 8.0))
        turn_logits = np.concatenate((vector[self.n - 1 :], [0.0]))
        turns = 2.0 * math.pi * softmax(turn_logits)
        orientations = np.zeros(self.n)
        for i in range(1, self.n):
            orientations[i] = orientations[i - 1] + turns[i]
        edges = lengths[:, None] * np.column_stack(
            (np.cos(orientations), np.sin(orientations))
        )
        points = np.zeros((self.n, 2))
        points[1:] = np.cumsum(edges[:-1], axis=0)
        return points, edges, turns

    def equation_values(self, points: np.ndarray) -> np.ndarray:
        values: list[float] = []
        for (a, b), (c, d) in self.equations:
            ab = points[a] - points[b]
            cd = points[c] - points[d]
            values.append(float(ab @ ab - cd @ cd))
        return np.asarray(values)

    def supports(self, points: np.ndarray) -> np.ndarray:
        triples = self.support_triples
        ab = points[triples[:, 1]] - points[triples[:, 0]]
        ac = points[triples[:, 2]] - points[triples[:, 0]]
        return ab[:, 0] * ac[:, 1] - ab[:, 1] * ac[:, 0]

    def residual(self, vector: np.ndarray, support_weight: float) -> np.ndarray:
        points, edges, turns = self.decode(vector)
        equations = self.equation_values(points)
        closure = 10.0 * np.sum(edges, axis=0)
        supports = self.supports(points)
        support_hinge = support_weight * np.minimum(0.0, supports - 1e-6)
        turn_hinge = 10.0 * np.maximum(0.0, turns - (math.pi - 1e-4))
        return np.concatenate((equations, closure, support_hinge, turn_hinge))

    def metrics(self, vector: np.ndarray) -> dict[str, Any]:
        points, edges, turns = self.decode(vector)
        eq = self.equation_values(points)
        closure = np.sum(edges, axis=0)
        supports = self.supports(points)
        pair_distances = [
            float(np.linalg.norm(points[i] - points[j]))
            for i in range(self.n)
            for j in range(i + 1, self.n)
        ]
        return {
            "equation_max_abs": float(np.max(np.abs(eq))),
            "equation_rms": float(np.sqrt(np.mean(eq * eq))),
            "closure_norm": float(np.linalg.norm(closure)),
            "support_min": float(np.min(supports)),
            "nonpositive_support_count": int(np.sum(supports <= 0.0)),
            "minimum_pair_distance": float(min(pair_distances)),
            "maximum_turn": float(np.max(turns)),
            "minimum_turn": float(np.min(turns)),
            "maximum_coordinate": float(np.max(np.abs(points))),
        }


def initial_vector(n: int, rng: np.random.Generator, attempt: int) -> np.ndarray:
    log_lengths = rng.normal(0.0, 0.25 + 0.15 * (attempt % 3), size=n - 1)
    turn_logits = rng.normal(0.0, 0.25 + 0.20 * (attempt % 4), size=n - 1)
    return np.concatenate((log_lengths, turn_logits))


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument("--probe", type=Path, required=True)
    parser.add_argument("--source", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--starts", type=int, default=128)
    parser.add_argument("--max-nfev", type=int, default=20000)
    parser.add_argument("--timeout-seconds", type=float, default=480.0)
    parser.add_argument("--seed", type=int, default=160019)
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    started = time.monotonic()
    probe = json.loads(args.probe.read_text())
    source = json.loads(args.source.read_text())
    if probe.get("inputs", {}).get("result_sha256") != sha256(args.source):
        raise ValueError("probe result does not match source artifact bytes")
    if source.get("status") != "ALIVE" or probe.get("outer_replay", {}).get(
        "status"
    ) != "SAT":
        raise ValueError("source artifact or frozen outer replay is not valid")
    equations = probe["target"]["positive_quotient_equations"]
    classes = probe["target"]["alias_classes_in_order"]
    if len(classes) != 19 or len(equations) != 38:
        raise ValueError("unexpected frozen v16 quotient schema")

    problem = Problem(equations)
    rng = np.random.default_rng(args.seed)
    attempts: list[dict[str, Any]] = []
    best: tuple[tuple[float, float, float], np.ndarray, dict[str, Any]] | None = None
    weights = (1.0, 10.0, 100.0, 1000.0)
    for attempt in range(args.starts):
        if time.monotonic() - started >= args.timeout_seconds:
            break
        initial = initial_vector(problem.n, rng, attempt)
        candidate = initial
        last_result = None
        for weight in weights:
            remaining = args.timeout_seconds - (time.monotonic() - started)
            if remaining <= 0:
                break
            last_result = least_squares(
                lambda vector, w=weight: problem.residual(vector, w),
                candidate,
                bounds=(-8.0, 8.0),
                method="trf",
                x_scale="jac",
                loss="linear",
                max_nfev=args.max_nfev,
                ftol=1e-13,
                xtol=1e-13,
                gtol=1e-13,
            )
            candidate = np.asarray(last_result.x)
        metrics = problem.metrics(candidate)
        score = (
            max(0.0, -metrics["support_min"]),
            metrics["equation_max_abs"],
            metrics["closure_norm"],
        )
        if best is None or score < best[0]:
            best = (score, candidate.copy(), metrics)
        attempts.append(
            {
                "attempt": attempt,
                "metrics": metrics,
                "nfev": None if last_result is None else int(last_result.nfev),
                "success": None
                if last_result is None
                else bool(last_result.success),
            }
        )
        if (
            metrics["equation_max_abs"] <= 1e-9
            and metrics["closure_norm"] <= 1e-9
            and metrics["support_min"] >= 1e-8
            and metrics["minimum_pair_distance"] >= 1e-8
            and metrics["maximum_turn"] < math.pi
        ):
            break

    if best is None:
        raise RuntimeError("no numerical attempt completed")
    _, vector, metrics = best
    points, edges, turns = problem.decode(vector)
    plausible = bool(
        metrics["equation_max_abs"] <= 1e-9
        and metrics["closure_norm"] <= 1e-9
        and metrics["support_min"] >= 1e-8
        and metrics["minimum_pair_distance"] >= 1e-8
        and metrics["maximum_turn"] < math.pi
    )
    result = {
        "schema": "p97-v16-full-positive-euclidean-edge-turn-fit-v1",
        "terminal_status": (
            "NUMERICAL_CANDIDATE_REQUIRES_EXACT_REPLAY"
            if plausible
            else "UNKNOWN_NO_NUMERICAL_FIT"
        ),
        "epistemic_status": "HEURISTIC_CANDIDATE_GENERATION_ONLY",
        "inputs": {
            "source": str(args.source),
            "source_sha256": sha256(args.source),
            "probe": str(args.probe),
            "probe_sha256": sha256(args.probe),
            "cegar_implementation_sha256": source["implementation_sha256"],
        },
        "configuration": {
            "starts": args.starts,
            "completed_starts": len(attempts),
            "max_nfev": args.max_nfev,
            "timeout_seconds": args.timeout_seconds,
            "seed": args.seed,
        },
        "best": {
            "metrics": metrics,
            "points": points.tolist(),
            "edges": edges.tolist(),
            "turns": turns.tolist(),
            "vector": vector.tolist(),
        },
        "attempts": attempts,
        "elapsed_seconds": time.monotonic() - started,
        "trust_warning": (
            "Numerical optimization is candidate generation only. A candidate "
            "must be replayed by exact arithmetic before it counts as SAT."
        ),
    }
    args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    print(
        json.dumps(
            {
                "terminal_status": result["terminal_status"],
                "completed_starts": len(attempts),
                "elapsed_seconds": result["elapsed_seconds"],
                "best_metrics": metrics,
                "output": str(args.output),
            },
            indent=2,
            sort_keys=True,
        )
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
