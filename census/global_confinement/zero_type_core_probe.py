#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Extract one-center domain-wipeout cores for stable zero-extension types."""
from __future__ import annotations

import argparse
import hashlib
import json
from collections import Counter
from datetime import datetime, timezone
from itertools import combinations
from pathlib import Path
from typing import Iterable, Sequence

from census.global_confinement.probe import _fixed_rows, packet_labels
from census.global_confinement.shadow import (
    ClassRow,
    cross_separation_ok,
    hull_order,
    rows_compatible,
)
from census.multi_center import multi_center_census as mc


DEFAULT_TYPES = ("(0, 0, 2, 2)", "(0, 2, 0, 2)")


def point_role(frame: mc.Frame, point: int) -> str:
    if point in mc.MOSER_SET:
        return f"Moser-{point}"
    for region in ("S", "O1", "O2"):
        points = frame.ints[region]
        if point in points:
            return f"{region}[{points.index(point)}]"
    raise ValueError(f"point {point} is outside the frame")


def _incompatibility_reason(
    frame: mc.Frame, left: ClassRow, right: ClassRow
) -> str | None:
    if rows_compatible(frame, left, right):
        return None
    if left.center == right.center:
        return f"same-center-exact:{right.name}"
    common = left.support & right.support
    if len(common) > 2:
        return f"overlap>2:{right.name}"
    if left.center in mc.MOSER_SET and right.center in mc.MOSER_SET:
        if not mc.q3.joint_ok(
            left.center,
            left.support,
            right.center,
            right.support,
            frame.caps_int,
        ):
            return f"Q3:{right.name}"
    if not cross_separation_ok(hull_order(frame), left, right):
        return f"cross-separation:{right.name}"
    return f"unclassified:{right.name}"


def _fixed_pair_centers(fixed_rows: Iterable[ClassRow]):
    pair_centers: dict[tuple[int, int], set[int]] = {}
    for row in fixed_rows:
        for pair in combinations(sorted(row.support), 2):
            pair_centers.setdefault(pair, set()).add(row.center)
    return pair_centers


def _candidate_reasons(
    frame: mc.Frame,
    fixed_rows: tuple[ClassRow, ...],
    pair_centers: dict[tuple[int, int], set[int]],
    row: ClassRow,
) -> tuple[str, ...]:
    reasons = {
        reason
        for fixed in fixed_rows
        if (reason := _incompatibility_reason(frame, row, fixed)) is not None
    }
    for pair in combinations(sorted(row.support), 2):
        centers = pair_centers.get(pair, set())
        if row.center not in centers and len(centers) >= 2:
            reasons.add("point-pair>2-centers")
    return tuple(sorted(reasons))


def analyze_row(placement: dict, row: dict) -> dict:
    labels = packet_labels(
        placement["n"],
        pin_source_index=placement["pin_source_index"],
        deleted_index=placement["deleted_index"],
    )
    frame, candidates = mc.cached_candidate_lists(
        labels.profile, set(mc.PROVEN_ROWS)
    )
    assert candidates is not None
    fixed_rows = _fixed_rows(
        labels, row["blocker"], frozenset(row["dangerous"])
    )
    if not rows_compatible(frame, fixed_rows[0], fixed_rows[1]):
        reason = _incompatibility_reason(frame, fixed_rows[0], fixed_rows[1])
        return {
            "n": placement["n"],
            "pin_source_index": placement["pin_source_index"],
            "deleted_index": placement["deleted_index"],
            "pin_source": labels.pin_source,
            "deleted": labels.deleted,
            "blocker": row["blocker"],
            "blocker_role": point_role(frame, row["blocker"]),
            "dangerous": row["dangerous"],
            "type": row["type"],
            "core_kind": "fixed-pair",
            "fixed_pair_reason": reason,
            "empty_centers": [],
        }
    pair_centers = _fixed_pair_centers(fixed_rows)

    empty_centers = []
    for center in range(frame.n):
        if center in {fixed.center for fixed in fixed_rows}:
            continue
        reason_counts = Counter()
        viable = 0
        for support in candidates[center]:
            candidate = ClassRow(f"global:{center}", center, support)
            reasons = _candidate_reasons(
                frame, fixed_rows, pair_centers, candidate
            )
            if reasons:
                reason_counts[" + ".join(reasons)] += 1
            else:
                viable += 1
        if viable == 0:
            empty_centers.append({
                "center": center,
                "role": point_role(frame, center),
                "candidate_count": len(candidates[center]),
                "reason_counts": dict(sorted(reason_counts.items())),
            })

    if not empty_centers:
        raise AssertionError("node-zero UNSAT row has no empty fixed-filter domain")
    return {
        "n": placement["n"],
        "pin_source_index": placement["pin_source_index"],
        "deleted_index": placement["deleted_index"],
        "pin_source": labels.pin_source,
        "deleted": labels.deleted,
        "blocker": row["blocker"],
        "blocker_role": point_role(frame, row["blocker"]),
        "dangerous": row["dangerous"],
        "type": row["type"],
        "core_kind": "one-center-domain",
        "fixed_pair_reason": None,
        "empty_centers": empty_centers,
    }


def analyze_artifacts(
    artifacts: Sequence[dict],
    *,
    row_types: set[str],
    sources: Sequence[dict] | None = None,
) -> dict:
    cores = []
    for artifact in artifacts:
        for placement in artifact["placements"]:
            for row in placement["rows"]:
                if row["type"] not in row_types:
                    continue
                if row["status"] != "UNSAT" or row["nodes"] != 0:
                    raise AssertionError(
                        "selected zero-type row is not node-zero UNSAT"
                    )
                cores.append(analyze_row(placement, row))

    signatures = Counter()
    fixed_pair_reason_totals: dict[str, Counter] = {}
    candidate_rejection_totals: dict[str, Counter] = {}
    for core in cores:
        roles = tuple(center["role"] for center in core["empty_centers"])
        blocker_region = core["blocker_role"].split("[", maxsplit=1)[0]
        signature = (
            core["core_kind"],
            core["fixed_pair_reason"],
            blocker_region,
            roles,
        )
        signatures[(core["n"], core["type"], signature)] += 1
        if core["fixed_pair_reason"] is not None:
            fixed_pair_reason_totals.setdefault(
                core["type"], Counter()
            )[core["fixed_pair_reason"]] += 1
        for center in core["empty_centers"]:
            candidate_rejection_totals.setdefault(
                core["type"], Counter()
            ).update(center["reason_counts"])

    return {
        "schema": "p97-zero-extension-one-center-core-v1",
        "generated_at": datetime.now(timezone.utc).isoformat(),
        "scope": {
            "row_types": sorted(row_types),
            "input_artifact_count": len(artifacts),
            "inputs": list(sources) if sources is not None else None,
            "criterion": (
                "the fixed pin/dangerous pair is incompatible, or one global-"
                "center candidate domain is empty after fixed-row filtering"
            ),
        },
        "core_count": len(cores),
        "signature_counts": [
            {
                "n": n,
                "type": row_type,
                "core_kind": signature[0],
                "fixed_pair_reason": signature[1],
                "blocker_region": signature[2],
                "empty_center_roles": list(signature[3]),
                "count": count,
            }
            for (n, row_type, signature), count in sorted(signatures.items())
        ],
        "fixed_pair_reason_totals": {
            row_type: dict(sorted(counts.items()))
            for row_type, counts in sorted(fixed_pair_reason_totals.items())
        },
        "candidate_rejection_totals": {
            row_type: dict(sorted(counts.items()))
            for row_type, counts in sorted(candidate_rejection_totals.items())
        },
        "cores": cores,
    }


def _markdown(artifact: dict) -> str:
    lines = [
        "<!--",
        "Copyright (c) 2026 Adam McKenna. All rights reserved.",
        "Released under Apache 2.0 license as described in the file LICENSE.",
        "Author: Adam McKenna <adam@mysticflounder.ai>",
        "-->",
        "",
        "# Stable zero-extension one-center cores",
        "",
        f"Generated `{artifact['generated_at']}`.",
        "",
        "Each listed dangerous row is already UNSAT before DFS: either the ",
        "fixed pinned and dangerous exact rows are incompatible, or at least ",
        "one ambient center has no compatible locally admitted K4 support. ",
        "This is still an incidence ",
        "shadow; the rejection atoms must be matched to proved Lean lemmas ",
        "before the pattern can be formalized.",
        "",
        f"Cores: `{artifact['core_count']}`.",
        "",
        "## Signatures",
        "",
        "| n | dangerous type | blocker region | core kind | "
        "reason / empty-center roles | rows |",
        "|---:|---|---|---|---|---:|",
    ]
    for row in artifact["signature_counts"]:
        if row["fixed_pair_reason"] is not None:
            detail = f"`{row['fixed_pair_reason']}`"
        else:
            detail = ", ".join(
                f"`{role}`" for role in row["empty_center_roles"]
            )
        lines.append(
            f"| {row['n']} | `{row['type']}` | `{row['blocker_region']}` | "
            f"`{row['core_kind']}` | {detail} | {row['count']} |"
        )
    lines.extend(["", "## Fixed-pair reasons", ""])
    for row_type, counts in artifact["fixed_pair_reason_totals"].items():
        lines.append(f"### `{row_type}`")
        lines.append("")
        for reason, count in counts.items():
            lines.append(f"- `{reason}`: `{count}` rows")
        lines.append("")
    lines.extend(["## Empty-domain candidate rejections", ""])
    for row_type, counts in artifact["candidate_rejection_totals"].items():
        lines.append(f"### `{row_type}`")
        lines.append("")
        for reason, count in counts.items():
            lines.append(f"- `{reason}`: `{count}` candidates")
        lines.append("")
    return "\n".join(line.rstrip() for line in lines) + "\n"


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("inputs", nargs="+", type=Path)
    parser.add_argument(
        "--row-type",
        action="append",
        dest="row_types",
        default=None,
    )
    parser.add_argument("--out", type=Path)
    parser.add_argument("--markdown", type=Path)
    args = parser.parse_args(argv)
    row_types = set(args.row_types or DEFAULT_TYPES)
    raw_inputs = [path.read_bytes() for path in args.inputs]
    artifacts = [json.loads(raw) for raw in raw_inputs]
    sources = [
        {
            "path": str(path),
            "sha256": hashlib.sha256(raw).hexdigest(),
        }
        for path, raw in zip(args.inputs, raw_inputs)
    ]
    artifact = analyze_artifacts(
        artifacts,
        row_types=row_types,
        sources=sources,
    )
    encoded = json.dumps(artifact, indent=2, sort_keys=True) + "\n"
    if args.out:
        args.out.write_text(encoded)
    else:
        print(encoded, end="")
    if args.markdown:
        args.markdown.write_text(_markdown(artifact))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
