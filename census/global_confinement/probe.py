#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Probe the general-m pinned-surplus audit frame in a finite incidence shadow.

For every declared packet frame, this checks three logically separate layers:

* q-critical compatibility at each audit center;
* simultaneous q-deleted K4 survival at all six audit centers;
* simultaneous confinement of those six classes to the eight-point support.

Every search also selects a compatible four-class at every other center.  The
result is still only an incidence shadow: SAT does not assert Euclidean
realizability, and UNSAT is scoped to the encoded necessary constraints.
"""
from __future__ import annotations

import argparse
import json
import sys
import time
from collections import Counter, defaultdict
from concurrent.futures import ProcessPoolExecutor, as_completed
from dataclasses import dataclass
from datetime import datetime, timezone
from itertools import combinations
from pathlib import Path
from typing import Iterable, Sequence

from census.global_confinement.shadow import (
    ClassRow,
    VariableRow,
    full_center_extension_rows,
    solve_rows,
)
from census.multi_center import multi_center_census as mc


STATUS_KEYS = ("SAT", "UNSAT", "INDETERMINATE")
PIN_CENTER = 1


@dataclass(frozen=True)
class PacketLabels:
    n: int
    profile: tuple[int, int, int]
    pin_source: int
    deleted: int
    pin_class: frozenset[int]


def packet_labels(
    n: int,
    *,
    pin_source_index: int = 0,
    deleted_index: int = 1,
) -> PacketLabels:
    """Right-pinned labels for an ordered surplus source/deletion placement."""

    if n < 11:
        raise ValueError("the general-m pinned-surplus regime starts at n = 11")
    profile = (n - 5, 4, 4)
    frame = mc.build_frame(profile)
    surplus = frame.ints["S"]
    if len(surplus) < 4:
        raise AssertionError("general-m profile needs four surplus interiors")
    if not 0 <= pin_source_index < len(surplus):
        raise ValueError("pin_source_index is outside the surplus interior")
    if not 0 <= deleted_index < len(surplus):
        raise ValueError("deleted_index is outside the surplus interior")
    if pin_source_index == deleted_index:
        raise ValueError("the pinned source and deleted point must differ")
    pin_source = surplus[pin_source_index]
    deleted = surplus[deleted_index]
    pin_class = frozenset((0, *frame.ints["O1"], pin_source))
    return PacketLabels(n, profile, pin_source, deleted, pin_class)


def ordered_surplus_placements(n: int) -> tuple[PacketLabels, ...]:
    """Every ordered pair of distinct surplus-interior labels."""

    frame = mc.build_frame((n - 5, 4, 4))
    return tuple(
        packet_labels(n, pin_source_index=source, deleted_index=deleted)
        for source in range(len(frame.ints["S"]))
        for deleted in range(len(frame.ints["S"]))
        if source != deleted
    )


def _counts() -> dict[str, int]:
    return {status: 0 for status in STATUS_KEYS}


def _add_status(counts: dict[str, int], result: dict) -> None:
    counts[result["status"]] += 1


def _existential_status(counts: dict[str, int]) -> str:
    if counts["SAT"]:
        return "SAT"
    if counts["INDETERMINATE"]:
        return "INDETERMINATE"
    return "UNSAT"


def _universal_status(counts: dict[str, int]) -> str:
    if counts["UNSAT"]:
        return "UNSAT"
    if counts["INDETERMINATE"]:
        return "INDETERMINATE"
    return "SAT"


def _fixed_rows(labels: PacketLabels, blocker: int, dangerous: frozenset[int]):
    return (
        ClassRow("pinned", PIN_CENTER, labels.pin_class, exact=True),
        ClassRow("dangerous", blocker, dangerous, exact=True),
    )


def _run_scenario(
    frame: mc.Frame,
    base_candidates: dict[int, list[frozenset[int]]],
    fixed_rows: Sequence[ClassRow],
    audit_centers: Sequence[int],
    audit_candidates: dict[int, tuple[frozenset[int], ...]],
    *,
    max_nodes: int,
) -> dict:
    audit_rows = tuple(
        VariableRow(f"audit:{center}", center, audit_candidates[center])
        for center in audit_centers
    )
    local = solve_rows(
        frame,
        set(mc.PROVEN_ROWS),
        fixed_rows=fixed_rows,
        variable_rows=audit_rows,
        max_nodes=max_nodes,
    )
    if local["status"] == "UNSAT":
        return {
            "status": "UNSAT",
            "nodes": local["nodes"],
            "decided_at": "packet_rows",
        }

    occupied = {row.center for row in fixed_rows} | set(audit_centers)
    global_rows = full_center_extension_rows(frame, base_candidates, occupied)
    result = solve_rows(
        frame,
        set(mc.PROVEN_ROWS),
        fixed_rows=fixed_rows,
        variable_rows=(*audit_rows, *global_rows),
        max_nodes=max_nodes,
        want_assignment=True,
    )
    result["decided_at"] = "full_center_extension"
    result["local_status"] = local["status"]
    result["local_nodes"] = local["nodes"]
    return result


def _critical_center_probe(
    frame: mc.Frame,
    base_candidates: dict[int, list[frozenset[int]]],
    fixed_rows: Sequence[ClassRow],
    center: int,
    deleted: int,
    *,
    max_nodes: int,
) -> dict:
    critical = tuple(
        support for support in base_candidates[center] if deleted in support
    )
    if not critical:
        return {"status": "UNSAT", "nodes": 0}
    critical_row = VariableRow(
        f"critical:{center}", center, critical, exact=True
    )
    local = solve_rows(
        frame,
        set(mc.PROVEN_ROWS),
        fixed_rows=fixed_rows,
        variable_rows=(critical_row,),
        max_nodes=max_nodes,
    )
    if local["status"] == "UNSAT":
        return {
            "status": "UNSAT",
            "nodes": local["nodes"],
            "decided_at": "packet_rows",
        }

    occupied = {row.center for row in fixed_rows} | {center}
    global_rows = full_center_extension_rows(frame, base_candidates, occupied)
    result = solve_rows(
        frame,
        set(mc.PROVEN_ROWS),
        fixed_rows=fixed_rows,
        variable_rows=(critical_row, *global_rows),
        max_nodes=max_nodes,
        want_assignment=True,
    )
    result["decided_at"] = "full_center_extension"
    result["local_status"] = local["status"]
    result["local_nodes"] = local["nodes"]
    return result


def _dangerous_job(args: tuple) -> dict:
    n, blocker, dangerous_tuple, max_nodes = args
    labels = packet_labels(n)
    frame, base_candidates = mc.cached_candidate_lists(
        labels.profile, set(mc.PROVEN_ROWS)
    )
    assert base_candidates is not None
    dangerous = frozenset(dangerous_tuple)
    fixed_rows = _fixed_rows(labels, blocker, dangerous)

    occupied = {row.center for row in fixed_rows}
    base = solve_rows(
        frame,
        set(mc.PROVEN_ROWS),
        fixed_rows=fixed_rows,
        variable_rows=full_center_extension_rows(
            frame, base_candidates, occupied
        ),
        max_nodes=max_nodes,
    )

    available_aux = tuple(
        point
        for point in range(frame.n)
        if point != blocker and point not in dangerous
    )
    aux_sets = tuple(combinations(available_aux, 3))
    row = {
        "blocker": blocker,
        "dangerous": sorted(dangerous),
        "triple": sorted(dangerous - {labels.deleted}),
        "base": base,
        "frame_count": len(aux_sets),
        "critical_center_counts": _counts(),
        "critical_center_results": {},
        "survival_counts": _counts(),
        "confinement_counts": _counts(),
        "fixed_frame": None,
        "first_survival_witness": None,
        "first_confinement_witness": None,
    }
    if base["status"] != "SAT":
        # No full global extension means none of this dangerous row's frames
        # is admitted by the declared shadow.
        row["rejected_frame_count"] = len(aux_sets)
        return row

    possible_audit_centers = tuple(
        point for point in range(frame.n) if point not in {blocker, labels.deleted}
    )
    for center in possible_audit_centers:
        result = _critical_center_probe(
            frame,
            base_candidates,
            fixed_rows,
            center,
            labels.deleted,
            max_nodes=max_nodes,
        )
        _add_status(row["critical_center_counts"], result)
        row["critical_center_results"][str(center)] = {
            "status": result["status"],
            "nodes": result["nodes"],
        }
        if result["status"] == "SAT" and "first_critical_witness" not in row:
            row["first_critical_witness"] = {
                "center": center,
                "result": result,
            }

    for frame_index, aux in enumerate(aux_sets):
        triple = tuple(sorted(dangerous - {labels.deleted}))
        audit_centers = tuple(sorted((*triple, *aux)))
        support = frozenset((blocker, *dangerous, *aux))
        if len(audit_centers) != 6 or len(support) != 8:
            raise AssertionError("packet frame labels are not distinct")

        confined_candidates = {
            center: tuple(
                candidate
                for candidate in base_candidates[center]
                if labels.deleted not in candidate and candidate <= support
            )
            for center in audit_centers
        }
        confinement = _run_scenario(
            frame,
            base_candidates,
            fixed_rows,
            audit_centers,
            confined_candidates,
            max_nodes=max_nodes,
        )
        _add_status(row["confinement_counts"], confinement)
        if confinement["status"] == "SAT":
            survival = confinement
        else:
            surviving_candidates = {
                center: tuple(
                    candidate
                    for candidate in base_candidates[center]
                    if labels.deleted not in candidate
                )
                for center in audit_centers
            }
            survival = _run_scenario(
                frame,
                base_candidates,
                fixed_rows,
                audit_centers,
                surviving_candidates,
                max_nodes=max_nodes,
            )
        _add_status(row["survival_counts"], survival)

        frame_result = {
            "aux": list(aux),
            "audit_centers": list(audit_centers),
            "support": sorted(support),
            "survival": survival,
            "confinement": confinement,
        }
        if frame_index == 0:
            row["fixed_frame"] = frame_result
        if survival["status"] == "SAT" and row["first_survival_witness"] is None:
            row["first_survival_witness"] = frame_result
        if (
            confinement["status"] == "SAT"
            and row["first_confinement_witness"] is None
        ):
            row["first_confinement_witness"] = frame_result

    row["survival_existential"] = _existential_status(row["survival_counts"])
    row["survival_universal"] = _universal_status(row["survival_counts"])
    row["confinement_existential"] = _existential_status(
        row["confinement_counts"]
    )
    row["confinement_universal"] = _universal_status(
        row["confinement_counts"]
    )
    return row


def _sum_counts(rows: Iterable[dict], key: str) -> dict[str, int]:
    out = _counts()
    for row in rows:
        for status in STATUS_KEYS:
            out[status] += row[key][status]
    return out


def _compact_result(result: dict) -> dict:
    return {
        key: result[key]
        for key in (
            "status",
            "nodes",
            "decided_at",
            "local_status",
            "local_nodes",
        )
        if key in result
    }


def _compact_frame(frame: dict | None) -> dict | None:
    if frame is None:
        return None
    return {
        "aux": frame["aux"],
        "audit_centers": frame["audit_centers"],
        "support": frame["support"],
        "survival": _compact_result(frame["survival"]),
        "confinement": _compact_result(frame["confinement"]),
    }


def _compact_dangerous_row(row: dict) -> dict:
    out = {
        "blocker": row["blocker"],
        "dangerous": row["dangerous"],
        "triple": row["triple"],
        "base": _compact_result(row["base"]),
        "frame_count": row["frame_count"],
        "critical_center_counts": row["critical_center_counts"],
        "critical_center_results": row["critical_center_results"],
        "survival_counts": row["survival_counts"],
        "confinement_counts": row["confinement_counts"],
        "fixed_frame": _compact_frame(row["fixed_frame"]),
    }
    for key in (
        "rejected_frame_count",
        "survival_existential",
        "survival_universal",
        "confinement_existential",
        "confinement_universal",
    ):
        if key in row:
            out[key] = row[key]
    return out


def probe_n(n: int, *, max_nodes: int, workers: int) -> dict:
    labels = packet_labels(n)
    frame, base_candidates = mc.cached_candidate_lists(
        labels.profile, set(mc.PROVEN_ROWS)
    )
    assert base_candidates is not None

    jobs = []
    for blocker in range(frame.n):
        if blocker in {PIN_CENTER, labels.deleted}:
            continue
        for dangerous in base_candidates[blocker]:
            if labels.deleted in dangerous:
                jobs.append((n, blocker, tuple(sorted(dangerous)), max_nodes))

    started = time.perf_counter()
    rows: list[dict] = []
    if workers == 1:
        for index, job in enumerate(jobs, start=1):
            rows.append(_dangerous_job(job))
            if index % 25 == 0 or index == len(jobs):
                print(
                    f"[global-confinement] n={n} dangerous {index}/{len(jobs)}",
                    file=sys.stderr,
                    flush=True,
                )
    else:
        with ProcessPoolExecutor(max_workers=workers) as pool:
            futures = {pool.submit(_dangerous_job, job): job for job in jobs}
            for index, future in enumerate(as_completed(futures), start=1):
                rows.append(future.result())
                if index % 25 == 0 or index == len(jobs):
                    print(
                        f"[global-confinement] n={n} dangerous {index}/{len(jobs)}",
                        file=sys.stderr,
                        flush=True,
                    )
    rows.sort(key=lambda row: (row["blocker"], row["dangerous"]))

    base_counts = _counts()
    for row in rows:
        _add_status(base_counts, row["base"])
    compatible = [row for row in rows if row["base"]["status"] == "SAT"]
    frame_count = sum(row["frame_count"] for row in compatible)
    critical_counts = _sum_counts(compatible, "critical_center_counts")
    survival_counts = _sum_counts(compatible, "survival_counts")
    confinement_counts = _sum_counts(compatible, "confinement_counts")

    def first_witness(key: str):
        for row in compatible:
            if row.get(key) is not None:
                return {
                    "blocker": row["blocker"],
                    "dangerous": row["dangerous"],
                    "witness": row[key],
                }
        return None

    return {
        "n": n,
        "profile": list(labels.profile),
        "labels": {
            "pin_center": PIN_CENTER,
            "pin_source": labels.pin_source,
            "deleted": labels.deleted,
            "pin_class": sorted(labels.pin_class),
        },
        "dangerous_candidates": len(jobs),
        "base_counts": base_counts,
        "compatible_dangerous_rows": len(compatible),
        "packet_frames": frame_count,
        "critical_center_counts": critical_counts,
        "survival_counts": survival_counts,
        "confinement_counts": confinement_counts,
        "survival_existential": _existential_status(survival_counts),
        "survival_universal": _universal_status(survival_counts),
        "confinement_existential": _existential_status(confinement_counts),
        "confinement_universal": _universal_status(confinement_counts),
        "first_critical_witness": first_witness("first_critical_witness"),
        "first_survival_witness": first_witness("first_survival_witness"),
        "first_confinement_witness": first_witness(
            "first_confinement_witness"
        ),
        "elapsed_sec": time.perf_counter() - started,
        "dangerous_rows": [_compact_dangerous_row(row) for row in rows],
    }


def _markdown(artifact: dict) -> str:
    report_tables: dict[int, tuple[dict[int, dict], dict[str, dict]]] = {}
    lines = [
        "<!--",
        "Copyright (c) 2026 Adam McKenna. All rights reserved.",
        "Released under Apache 2.0 license as described in the file LICENSE.",
        "Author: Adam McKenna <adam@mysticflounder.ai>",
        "-->",
        "",
        "# Global confinement incidence probe",
        "",
        f"Generated `{artifact['generated_at']}`.",
        "",
        "## Scope",
        "",
        "This is an exhaustive finite search over the declared `(m,4,4)` ",
        "selected-class incidence shadow. Each scenario includes one compatible ",
        "four-class at every ambient center, the pinned exact class, the marked ",
        "dangerous exact class through `q`, the two-circle overlap bound, cyclic ",
        "cross-separation, Q3 joint cuts, and the L2/PROVEN local row kills.",
        "",
        "It does **not** encode coordinates, distance equations, or the full ",
        "`CriticalShellSystem`. `SAT` therefore means only that these incidence ",
        "constraints permit the pattern. `UNSAT` is conclusive only for this ",
        "shadow, and capped searches are reported as `INDETERMINATE`.",
        "",
        "The fixed pin is one orientation; the `(m,4,4)` profile has the reflected ",
        "orientation by exchanging the two short caps.",
        "Each checkpoint fixes the first two surplus-interior labels as the pinned ",
        "source and deleted point. A result is therefore exhaustive for that ",
        "canonical adjacent labeled placement, not for every cyclic placement of ",
        "the ordered pair.",
        "",
        "## Results",
        "",
        "| n | dangerous rows admitted | packet frames | q-critical row tests | all-row survival | rowwise confinement |",
        "|---:|---:|---:|---|---|---|",
    ]
    for result in artifact["results"]:
        critical = result["critical_center_counts"]
        survival = result["survival_counts"]
        confinement = result["confinement_counts"]
        lines.append(
            f"| {result['n']} | {result['compatible_dangerous_rows']}/"
            f"{result['dangerous_candidates']} | {result['packet_frames']} | "
            f"S {critical['SAT']} / U {critical['UNSAT']} / I {critical['INDETERMINATE']} | "
            f"S {survival['SAT']} / U {survival['UNSAT']} / I {survival['INDETERMINATE']} | "
            f"S {confinement['SAT']} / U {confinement['UNSAT']} / I {confinement['INDETERMINATE']} |"
        )
        by_blocker: dict[int, dict] = {}
        by_type: dict[str, dict] = defaultdict(
            lambda: {
                "candidates": 0,
                "admitted": 0,
                "survival": Counter(),
                "critical": Counter(),
            }
        )
        frame = mc.build_frame(tuple(result["profile"]))
        for row in result["dangerous_rows"]:
            blocker = row["blocker"]
            blocker_row = by_blocker.setdefault(
                blocker,
                {
                    "candidates": 0,
                    "admitted": 0,
                    "survival": Counter(),
                    "critical": Counter(),
                },
            )
            blocker_row["candidates"] += 1
            if blocker < 3:
                row_type = f"Moser-{blocker}"
            else:
                row_type = str(
                    mc.type_of_fast(
                        frame, blocker, frozenset(row["dangerous"])
                    )
                )
            type_row = by_type[row_type]
            type_row["candidates"] += 1
            if row["base"]["status"] != "SAT":
                continue
            blocker_row["admitted"] += 1
            blocker_row["survival"].update(row["survival_counts"])
            blocker_row["critical"].update(row["critical_center_counts"])
            type_row["admitted"] += 1
            type_row["survival"].update(row["survival_counts"])
            type_row["critical"].update(row["critical_center_counts"])
        report_tables[result["n"]] = (by_blocker, dict(by_type))
    lines.extend(
        [
            "",
            "`q-critical row tests` are individual-center compatibility checks; ",
            "they do not assert that all such exact rows occur simultaneously. ",
            "`all-row survival` and `rowwise confinement` do require simultaneous ",
            "classes at all six audit centers.",
            "",
            "## Verdicts",
            "",
        ]
    )
    for result in artifact["results"]:
        lines.append(
            f"- `n = {result['n']}`: existential survival "
            f"`{result['survival_existential']}`, universal survival "
            f"`{result['survival_universal']}`, existential confinement "
            f"`{result['confinement_existential']}`, universal confinement "
            f"`{result['confinement_universal']}`."
    )
    for result in artifact["results"]:
        frame = mc.build_frame(tuple(result["profile"]))
        lines.extend(
            [
                "",
                f"## n = {result['n']} imprints",
                "",
                "Labels: `u = 0`, `v = 1`, `w = 2`; "
                f"`intS = {frame.ints['S']}`, `intO1 = {frame.ints['O1']}`, "
                f"`intO2 = {frame.ints['O2']}`. The pinned source is "
                f"`{result['labels']['pin_source']}` and `q = "
                f"{result['labels']['deleted']}`.",
                "",
                "### By blocker",
                "",
                "| blocker | dangerous admitted | survival S/U/I | q-critical S/U/I |",
                "|---:|---:|---:|---:|",
            ]
        )
        by_blocker, by_type = report_tables[result["n"]]
        for blocker, row in sorted(by_blocker.items()):
            survival = row["survival"]
            critical = row["critical"]
            lines.append(
                f"| {blocker} | {row['admitted']}/{row['candidates']} | "
                f"{survival['SAT']}/{survival['UNSAT']}/"
                f"{survival['INDETERMINATE']} | "
                f"{critical['SAT']}/{critical['UNSAT']}/"
                f"{critical['INDETERMINATE']} |"
            )
        lines.extend(
            [
                "",
                "### By dangerous-row type",
                "",
                "| type | dangerous admitted | survival S/U/I |",
                "|---|---:|---:|",
            ]
        )
        zero_types = []
        for row_type, row in sorted(by_type.items()):
            survival = row["survival"]
            lines.append(
                f"| `{row_type}` | {row['admitted']}/{row['candidates']} | "
                f"{survival['SAT']}/{survival['UNSAT']}/"
                f"{survival['INDETERMINATE']} |"
            )
            if row["admitted"] == 0:
                zero_types.append(f"`{row_type}`")
        if zero_types:
            lines.extend(
                [
                    "",
                    "The dangerous-row types with no full-center extension are "
                    + ", ".join(zero_types)
                    + ". These are fixed-pin global elimination candidates, not "
                    "yet general-`n` theorems.",
                ]
            )
    lines.extend(
        [
            "",
            "A universal `SAT` verdict says every enumerated packet frame has a ",
            "witness in this shadow. It is not a proof that the corresponding ",
            "Lean producer holds. A universal `UNSAT` verdict identifies an ",
            "incidence-level obstruction that must be understood before pursuing ",
            "that producer.",
            "",
            "The q-critical compatibility witnesses show that the current incidence ",
            "cuts do not eliminate the first producer subobligation. Survival SAT ",
            "rows identify frames with no selected-class incidence obstruction, while ",
            "survival UNSAT rows identify genuine shadow obstructions. Neither kind ",
            "proves the theorem-facing q-deleted classes exist. Finally, an all-UNSAT ",
            "confinement column revalidates the bounded finite consumer; it is not ",
            "evidence that confinement can be produced. Any closure route must use ",
            "additional consequences of minimality or the critical-shell system, or ",
            "turn those inputs directly into a contradiction.",
        ]
    )
    return "\n".join(line.rstrip() for line in lines) + "\n"


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--n-min", type=int, default=11)
    parser.add_argument("--n-max", type=int, default=11)
    parser.add_argument("--max-nodes", type=int, default=200_000)
    parser.add_argument("--workers", type=int, default=1)
    parser.add_argument("--out", type=Path)
    parser.add_argument("--markdown", type=Path)
    args = parser.parse_args(argv)
    if args.n_min > args.n_max:
        parser.error("--n-min must not exceed --n-max")
    if not 1 <= args.workers <= 8:
        parser.error("--workers must be between 1 and 8")

    artifact = {
        "schema": "p97-global-confinement-shadow-v1",
        "generated_at": datetime.now(timezone.utc).isoformat(),
        "max_nodes_per_search": args.max_nodes,
        "workers": args.workers,
        "results": [
            probe_n(n, max_nodes=args.max_nodes, workers=args.workers)
            for n in range(args.n_min, args.n_max + 1)
        ],
    }
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
