#!/usr/bin/env python3
"""Merge and summarize one seven-orbit exact-six CEGAR checkpoint."""

from __future__ import annotations

import argparse
import collections
import hashlib
import json
from pathlib import Path


ORBITS = (
    "continuationOrder",
    "reverseContinuationOrder",
    "sharesFirstAtSource",
    "sharesFirstAtTarget",
    "sharesSecondAtSource",
    "sharesSecondAtTarget",
    "fourDistinct",
)


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def load_jsonl(path: Path) -> list[dict[str, object]]:
    return [
        json.loads(line)
        for line in path.read_text(encoding="utf-8").splitlines()
        if line
    ]


def semantic_key(cut: dict[str, object]) -> str:
    return json.dumps(
        {key: value for key, value in cut.items() if key != "id"},
        sort_keys=True,
        separators=(",", ":"),
    )


def constraint_kind(name: str) -> str:
    return name.split("_", 1)[0]


def shape(cut: dict[str, object]) -> str:
    memberships = cut["required_memberships"]
    degrees: collections.Counter[int] = collections.Counter()
    labels: set[int] = set()
    for center, point in memberships:  # type: ignore[misc]
        degrees[int(center)] += 1
        labels.add(int(center))
        labels.add(int(point))
    return json.dumps(
        {
            "conditioned_shell": cut.get("conditioned_shell") is not None,
            "center_degrees": sorted(degrees.values()),
            "label_count": len(labels),
        },
        sort_keys=True,
        separators=(",", ":"),
    )


def atomic_text(path: Path, payload: str) -> None:
    temporary = path.with_suffix(path.suffix + ".tmp")
    temporary.write_text(payload, encoding="utf-8")
    temporary.replace(path)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--root", required=True, type=Path)
    parser.add_argument("--output-prefix", required=True, type=Path)
    parser.add_argument("--expected-per-orbit", type=int, default=10)
    parser.add_argument("--compare-bank", type=Path)
    args = parser.parse_args()

    cuts: list[dict[str, object]] = []
    inputs: list[dict[str, object]] = []
    results: dict[str, object] = {}
    terminal_histogram: collections.Counter[str] = collections.Counter()
    for orbit in ORBITS:
        orbit_dir = args.root / orbit
        bank = orbit_dir / "derived-cuts.jsonl"
        replay = json.loads(
            (orbit_dir / "derived-cuts.replay.json").read_text(encoding="utf-8")
        )
        result = json.loads((orbit_dir / "result.json").read_text(encoding="utf-8"))
        orbit_cuts = load_jsonl(bank)
        terminal_verdict = str(result.get("terminal", {}).get("verdict"))
        terminal_histogram[terminal_verdict] += 1
        expected_count = (
            args.expected_per_orbit
            if args.expected_per_orbit > 0
            else int(result.get("new_cut_count", -1))
        )
        if len(orbit_cuts) != expected_count:
            raise SystemExit(
                f"{orbit}: expected {expected_count} cuts, got {len(orbit_cuts)}"
            )
        if replay.get("verdict") != "INDEPENDENT_EXACT_LOCAL_CUT_REPLAY_PASS":
            raise SystemExit(f"{orbit}: independent replay did not pass")
        if result.get("outer_oracle") != "piqd":
            raise SystemExit(f"{orbit}: checkpoint was not piqd-backed")
        if terminal_verdict not in {
            "GENERALIZATION_CHECKPOINT",
            "OUTER_UNKNOWN_FAIL_CLOSED",
        }:
            raise SystemExit(f"{orbit}: unexpected terminal verdict")
        cuts.extend(orbit_cuts)
        results[orbit] = result
        inputs.append(
            {
                "orbit": orbit,
                "path": str(bank),
                "sha256": sha256(bank),
                "cut_count": len(orbit_cuts),
            }
        )

    exact_lines = [json.dumps(cut, sort_keys=True) for cut in cuts]
    semantic_keys = [semantic_key(cut) for cut in cuts]
    semantic_ids: dict[str, list[str]] = collections.defaultdict(list)
    for cut, key in zip(cuts, semantic_keys, strict=True):
        semantic_ids[key].append(str(cut["id"]))
    semantic_duplicates = [
        ids for ids in semantic_ids.values() if len(ids) > 1
    ]
    kind_histogram: collections.Counter[str] = collections.Counter()
    membership_histogram: collections.Counter[int] = collections.Counter()
    constraint_histogram: collections.Counter[int] = collections.Counter()
    shape_histogram: collections.Counter[str] = collections.Counter()
    shell_count = 0
    compact: list[dict[str, object]] = []
    for cut in cuts:
        memberships = cut["required_memberships"]
        constraints = cut["constraints"]
        membership_histogram[len(memberships)] += 1  # type: ignore[arg-type]
        constraint_histogram[len(constraints)] += 1  # type: ignore[arg-type]
        shape_histogram[shape(cut)] += 1
        if cut.get("conditioned_shell") is not None:
            shell_count += 1
        for constraint in constraints:  # type: ignore[union-attr]
            kind_histogram[constraint_kind(str(constraint["name"]))] += 1
        if len(memberships) <= 8 and len(constraints) <= 20:  # type: ignore[arg-type]
            compact.append(
                {
                    "id": cut["id"],
                    "required_memberships": memberships,
                    "conditioned_shell": cut.get("conditioned_shell"),
                    "constraint_count": len(constraints),  # type: ignore[arg-type]
                    "constraints": constraints,
                }
            )

    comparison: dict[str, object] | None = None
    if args.compare_bank is not None:
        previous = load_jsonl(args.compare_bank)
        previous_keys = {semantic_key(cut) for cut in previous}
        current_keys = set(semantic_keys)
        comparison = {
            "path": str(args.compare_bank),
            "sha256": sha256(args.compare_bank),
            "previous_cut_count": len(previous),
            "semantic_overlap": len(current_keys & previous_keys),
            "semantic_new": len(current_keys - previous_keys),
        }

    merged_path = args.output_prefix.with_suffix(".jsonl")
    manifest_path = args.output_prefix.with_suffix(".manifest.json")
    summary_path = args.output_prefix.with_suffix(".summary.json")
    atomic_text(merged_path, "\n".join(exact_lines) + "\n")
    manifest = {
        "schema": "p97-exact6-piqd-seven-orbit-checkpoint-manifest-v1",
        "epistemic_status": "FINITE_EXACT_CEGAR_NOT_LIVE_LEAN_CLOSURE",
        "inputs": inputs,
        "cut_count": len(cuts),
        "exact_unique_count": len(set(exact_lines)),
        "semantic_unique_count": len(set(semantic_keys)),
        "merged_path": str(merged_path),
        "merged_sha256": sha256(merged_path),
    }
    summary = {
        **manifest,
        "shell_conditioned_count": shell_count,
        "terminal_verdict_histogram": dict(sorted(terminal_histogram.items())),
        "semantic_duplicate_id_groups": semantic_duplicates,
        "membership_size_histogram": dict(sorted(membership_histogram.items())),
        "constraint_size_histogram": dict(sorted(constraint_histogram.items())),
        "constraint_kind_histogram": dict(sorted(kind_histogram.items())),
        "shape_histogram": dict(
            sorted(shape_histogram.items(), key=lambda item: (-item[1], item[0]))
        ),
        "compact_candidates": compact,
        "comparison": comparison,
        "results": results,
    }
    atomic_text(manifest_path, json.dumps(manifest, indent=2, sort_keys=True) + "\n")
    atomic_text(summary_path, json.dumps(summary, indent=2, sort_keys=True) + "\n")
    print(json.dumps(summary, sort_keys=True))


if __name__ == "__main__":
    main()
