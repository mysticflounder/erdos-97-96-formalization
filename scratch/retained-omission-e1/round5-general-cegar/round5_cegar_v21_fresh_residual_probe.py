#!/usr/bin/env python3
"""Bounded FreshThird residual probe built on the authenticated v8 encoding.

This is an external Z3 experiment, not a Lean certificate.  It adds explicit
selectors for two cap-source rows and a fresh equal-blocker pair.  The three
commands (``equal-center``, ``same-blocker``, and ``omission``) isolate the
three normalized residual shapes instead of silently conjoining them.
"""

from __future__ import annotations

import argparse
import gzip
import hashlib
import importlib.util
import json
import sys
import time
from datetime import datetime, timezone
from pathlib import Path


HERE = Path(__file__).resolve().parent
BASE_PATH = HERE / "round5_cegar_v8.py"
SPEC = importlib.util.spec_from_file_location("cegar_v8_base", BASE_PATH)
if SPEC is None or SPEC.loader is None:
    raise RuntimeError(f"cannot import {BASE_PATH}")
BASE = importlib.util.module_from_spec(SPEC)
sys.modules[SPEC.name] = BASE
SPEC.loader.exec_module(BASE)

import z3  # noqa: E402  (loaded by the local uv environment)


SCHEMA_VERSION = 21
SCRIPT_SHA256 = hashlib.sha256(Path(__file__).read_bytes()).hexdigest()
BASE_SHA256 = hashlib.sha256(BASE_PATH.read_bytes()).hexdigest()
MODES = ("equal-center", "same-blocker", "omission")


def stamp() -> str:
    return datetime.now(timezone.utc).strftime("%Y%m%dT%H%M%S.%fZ")


def write_json(path: Path, value: object) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n")


class FreshResidualEncoding(BASE.Encoding):
    """v8 plus one explicitly selected FreshThird residual branch."""

    def __init__(self, case: BASE.Case, mode: str, timeout_ms: int, seed: int) -> None:
        if mode not in MODES:
            raise ValueError(f"unknown residual mode: {mode}")
        self.mode = mode
        super().__init__(case, timeout_ms=timeout_ms, seed=seed)

    def _build(self) -> None:
        super()._build()
        self._build_fresh_residual_probe()

    @staticmethod
    def _one_hot(name: str, labels: tuple[int, ...]) -> dict[int, z3.BoolRef]:
        bits = {label: z3.Bool(f"{name}_{label}") for label in labels}
        return bits

    @staticmethod
    def _selected(bits: dict[int, z3.BoolRef], value: int) -> z3.BoolRef:
        return bits[value]

    def _row_for_selector(
        self, selectors: dict[int, z3.BoolRef], point: int
    ) -> z3.BoolRef:
        return BASE.z3_or(
            z3.And(selectors[source], self.dynamic_row_member(source, point))
            for source in selectors
        )

    def _block_for_selector(
        self, selectors: dict[int, z3.BoolRef], center: int
    ) -> z3.BoolRef:
        return BASE.z3_or(
            z3.And(selectors[source], self.block[source, center])
            for source in selectors
        )

    def _build_fresh_residual_probe(self) -> None:
        # The source selectors range over the four strict first-cap interior
        # labels.  Q is selected from the remaining non-apex labels, so the
        # four-point exact-row arm has four distinct named points.
        source_labels = tuple(BASE.INTERIORS[0])
        q_labels = tuple(
            x for x in BASE.NONAPICES if x not in set(source_labels)
        )
        source1 = self._one_hot("fresh_probe_source1", source_labels)
        source2 = self._one_hot("fresh_probe_source2", source_labels)
        q1 = self._one_hot("fresh_probe_q1", q_labels)
        q2 = self._one_hot("fresh_probe_q2", q_labels)
        self.probe_selectors = (source1, source2, q1, q2)

        self.add(
            "fresh_probe_selectors",
            BASE.exactly(list(source1.values()), 1),
            BASE.exactly(list(source2.values()), 1),
            BASE.exactly(list(q1.values()), 1),
            BASE.exactly(list(q2.values()), 1),
            BASE.at_most(
                [z3.And(source1[x], source2[x]) for x in source_labels], 0
            ),
            BASE.at_most([z3.And(q1[x], q2[x]) for x in q_labels], 0),
        )
        for source in source_labels:
            for q in q_labels:
                self.add(
                    "fresh_probe_selectors",
                    z3.Not(z3.And(source1[source], q1[q])),
                    z3.Not(z3.And(source1[source], q2[q])),
                    z3.Not(z3.And(source2[source], q1[q])),
                    z3.Not(z3.And(source2[source], q2[q])),
                )

        source_row1 = [self._row_for_selector(source1, x) for x in BASE.POINTS]
        source_row2 = [self._row_for_selector(source2, x) for x in BASE.POINTS]
        q_row1 = [self._row_for_selector(q1, x) for x in BASE.POINTS]
        q_row2 = [self._row_for_selector(q2, x) for x in BASE.POINTS]
        source_block1 = [
            self._block_for_selector(source1, c) for c in BASE.CENTER_CANDIDATES
        ]
        source_block2 = [
            self._block_for_selector(source2, c) for c in BASE.CENTER_CANDIDATES
        ]
        q_block1 = [self._block_for_selector(q1, c) for c in BASE.CENTER_CANDIDATES]
        q_block2 = [self._block_for_selector(q2, c) for c in BASE.CENTER_CANDIDATES]

        # Both Q sources are a genuine equal-blocker fiber and mutually occur
        # in each other's selected exact-four row.
        self.add(
            "fresh_probe_q_fiber",
            *(q_block1[c] == q_block2[c] for c in range(len(BASE.CENTER_CANDIDATES))),
            BASE.z3_or(
                z3.And(q1[u], q2[v], self.dynamic_row_member(u, v))
                for u in q_labels
                for v in q_labels
                if u != v
            ),
            BASE.z3_or(
                z3.And(q1[u], q2[v], self.dynamic_row_member(v, u))
                for u in q_labels
                for v in q_labels
                if u != v
            ),
            BASE.exactly(q_row1, 4),
            BASE.exactly(q_row2, 4),
        )

        self.add(
            "fresh_probe_source_rows",
            BASE.exactly(source_row1, 4),
            BASE.exactly(source_row2, 4),
        )

        if self.mode == "equal-center":
            expected = [
                BASE.z3_or(
                    (source1.get(x, z3.BoolVal(False)),
                     source2.get(x, z3.BoolVal(False)),
                     q1.get(x, z3.BoolVal(False)),
                     q2.get(x, z3.BoolVal(False)))
                )
                for x in BASE.POINTS
            ]
            # The residual theorem's equal-center arm: both cap-source rows
            # are exactly the same four-point set {s1,s2,q1,q2}.
            self.add(
                "fresh_probe_equal_center",
                *(source_row1[x] == expected[x] for x in BASE.POINTS),
                *(source_row2[x] == expected[x] for x in BASE.POINTS),
                *(source_block1[c] == source_block2[c]
                  for c in range(len(BASE.CENTER_CANDIDATES))),
            )
        elif self.mode == "same-blocker":
            self.add(
                "fresh_probe_same_blocker",
                *(source_row1[x] == q_row1[x] for x in BASE.POINTS),
                *(source_block1[c] == q_block1[c]
                  for c in range(len(BASE.CENTER_CANDIDATES))),
            )
        else:
            omitted = self._one_hot("fresh_probe_omitted", q_labels)
            self.add(
                "fresh_probe_omission",
                BASE.exactly(list(omitted.values()), 1),
                BASE.z3_or(
                    z3.And(omitted[q], z3.Not(source_row1[q])) for q in q_labels
                ),
            )

        self.probe_metadata = {
            "mode": self.mode,
            "source_labels": source_labels,
            "q_labels": q_labels,
            "scope": "exact-n15 (6,6,6) v8 relaxation plus explicit FreshThird residual selectors",
        }


def run(args: argparse.Namespace) -> int:
    case = BASE.Case(
        arm="fresh",
        profiles=args.profiles,
        kept=args.kept,
        deleted=args.deleted,
        fresh=args.fresh,
    )
    case.validate()
    started = time.monotonic()
    out_root = args.artifacts / stamp()
    out_root.mkdir(parents=True, exist_ok=False)
    encoding = FreshResidualEncoding(case, args.mode, args.timeout_ms, args.seed)
    solver, smt2 = encoding.make_solver()
    smt_hash = hashlib.sha256(smt2.encode()).hexdigest()
    with gzip.open(out_root / "encoding.smt2.gz", "wt", encoding="utf-8") as handle:
        handle.write(smt2)
    outcome = solver.check()
    if outcome == z3.sat:
        status = "sat"
    elif outcome == z3.unsat:
        status = "unsat"
    else:
        status = "unknown"
    result: dict[str, object] = {
        "schema_version": SCHEMA_VERSION,
        "script_sha256": SCRIPT_SHA256,
        "base_script_sha256": BASE_SHA256,
        "case": case.case_id,
        "mode": args.mode,
        "status": status,
        "elapsed_seconds": time.monotonic() - started,
        "timeout_ms": args.timeout_ms,
        "seed": args.seed,
        "constraint_counts": encoding.constraint_counts(),
        "constraint_total": sum(encoding.constraint_counts().values()),
        "encoding_sha256": smt_hash,
        "probe": encoding.probe_metadata,
        "trust": "external-z3-only; no Lean theorem or finite coverage claim",
    }
    if status == "unsat":
        result["unsat_core_families"] = sorted(
            str(item).removeprefix("track_") for item in solver.unsat_core()
        )
    elif status == "sat":
        validation = encoding.validate_model(solver.model())
        result["model_validation"] = validation
        if validation["failures"]:
            result["status"] = "error"
            result["error"] = "base assertion replay failed"
        else:
            write_json(out_root / "witness.json", encoding.serialize_model(solver.model()))
            result["witness_file"] = "witness.json"
    else:
        result["reason_unknown"] = solver.reason_unknown()
    write_json(out_root / "result.json", result)
    print(json.dumps({"artifact": str(out_root), **result}, sort_keys=True))
    return 0 if result["status"] in {"sat", "unsat", "unknown"} else 1


def parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--mode", choices=MODES, required=True)
    parser.add_argument("--profiles", default="DDD")
    parser.add_argument("--kept", type=int, default=0)
    parser.add_argument("--deleted", type=int, default=2)
    parser.add_argument("--fresh", type=int, default=1)
    parser.add_argument("--timeout-ms", type=int, default=60_000)
    parser.add_argument("--seed", type=int, default=97)
    parser.add_argument("--artifacts", type=Path, default=HERE / "artifacts-v21-probe")
    return parser


if __name__ == "__main__":
    raise SystemExit(run(parser().parse_args()))
