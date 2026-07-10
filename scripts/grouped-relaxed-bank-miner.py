#!/usr/bin/env python3
# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Mine the non-ingested grouped relaxed-split certificate bank.

The large coefficient payloads need not be parsed: the generator's certificate
census files already record the checked status, exact pids, split path, source
path, and digest for every emitted payload.
"""

from __future__ import annotations

import argparse
import json
from collections import Counter
from pathlib import Path


REPORT_PATHS = (
    "certificates/surplus/reports/pinned_surplus_relaxed_split_certificate_census.json",
    "certificates/surplus/reports/pinned_surplus_relaxed_split_long_retry_census.json",
    "certificates/surplus/reports/"
    "pinned_surplus_relaxed_split_singleton_replacement_census.json",
)
ERASED_PIN_CENSUS = "certificates/surplus/erased_pin_producer_census.json"


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser()
    parser.add_argument("--repo", type=Path, default=Path.cwd())
    parser.add_argument(
        "--json-out",
        type=Path,
        default=Path("certificates/grouped_relaxed_general_n_mining.json"),
    )
    parser.add_argument(
        "--markdown-out",
        type=Path,
        default=Path("certificates/grouped_relaxed_general_n_mining.md"),
    )
    return parser.parse_args()


def load_json(path: Path) -> dict[str, object]:
    with path.open(encoding="utf-8") as handle:
        return json.load(handle)


def output_path(repo: Path, path: Path) -> Path:
    return path if path.is_absolute() else repo / path


def size_bucket(size: int) -> str:
    mib = size / (1024 * 1024)
    if mib < 1:
        return "under-1-MiB"
    if mib < 50:
        return "1-to-50-MiB"
    return "at-least-50-MiB"


def emitted_certificates(repo: Path) -> list[dict[str, object]]:
    certificates: list[dict[str, object]] = []
    for relative_report in REPORT_PATHS:
        report = load_json(repo / relative_report)
        for row in report["certificates"]:
            if row["status"] != "ok":
                continue
            path = repo / row["path"]
            if not path.is_file():
                raise FileNotFoundError(path)
            exact_pids = list(row["exact_pids"])
            certificates.append(
                {
                    "certificate_id": row["certificate_id"],
                    "case_id": row["case_id"],
                    "leaf_id": row["leaf_id"],
                    "exact_pids": exact_pids,
                    "exact_pid_count": len(exact_pids),
                    "split_path": row["split_path"],
                    "path": row["path"],
                    "bytes": path.stat().st_size,
                    "size_bucket": size_bucket(path.stat().st_size),
                    "sha256": row["sha256"],
                    "source_report": relative_report,
                    "grouped_general_ambient_candidate": len(exact_pids) > 1,
                }
            )

    ids = [row["certificate_id"] for row in certificates]
    paths = [row["path"] for row in certificates]
    if len(ids) != len(set(ids)):
        raise ValueError("duplicate emitted certificate id")
    if len(paths) != len(set(paths)):
        raise ValueError("duplicate emitted certificate path")

    on_disk = sorted(
        str(path.relative_to(repo))
        for path in (repo / "certificates/surplus/relaxed_split").glob("*.json")
    )
    if sorted(paths) != on_disk:
        raise ValueError("certificate reports do not exactly cover relaxed_split/*.json")
    return sorted(certificates, key=lambda row: row["certificate_id"])


def mask_value(label_order: list[str], members: list[str]) -> int:
    positions = {label: index for index, label in enumerate(label_order)}
    return sum(1 << positions[label] for label in members)


def canonical_erased_pin_seed_crosscheck(repo: Path) -> dict[str, object]:
    census = load_json(repo / ERASED_PIN_CENSUS)
    labels = list(census["labels"])
    target_values: dict[tuple[str, str], int] = {}
    for sstar in ("s1", "s2", "s3"):
        target_values[("Pw", sstar)] = mask_value(labels, ["u", "w", sstar, "Pu"])
        target_values[("Pu", sstar)] = mask_value(labels, ["u", "w", sstar, "Pw"])

    occurrences: list[dict[str, object]] = []
    for row in census["rows"]:
        for mask in row["masks"]:
            key = (mask["center"], mask["sstar"])
            if key not in target_values or mask["mask_value"] != target_values[key]:
                continue
            occurrences.append(
                {
                    "row_id": row["id"],
                    "center": mask["center"],
                    "sstar": mask["sstar"],
                    "mask": mask["mask"],
                    "mask_value": mask["mask_value"],
                    "pinned_bank_completion_count": mask[
                        "pinned_bank_completion_count"
                    ],
                    "pinned_bank_completion_pids": mask[
                        "pinned_bank_completion_pids"
                    ],
                    "seeded_dfs_completion_count": mask[
                        "seeded_dfs_completion_count"
                    ],
                }
            )

    distinct_keys = sorted({(row["center"], row["sstar"]) for row in occurrences})
    return {
        "source": ERASED_PIN_CENSUS,
        "distinct_seed_count": len(distinct_keys),
        "occurrence_count": len(occurrences),
        "all_have_zero_pinned_bank_completions": all(
            row["pinned_bank_completion_count"] == 0 for row in occurrences
        ),
        "all_have_zero_seeded_dfs_completions": all(
            row["seeded_dfs_completion_count"] == 0 for row in occurrences
        ),
        "occurrences": occurrences,
    }


def make_payload(repo: Path) -> dict[str, object]:
    certificates = emitted_certificates(repo)
    grouped = [row for row in certificates if row["grouped_general_ambient_candidate"]]
    singleton = [row for row in certificates if not row["grouped_general_ambient_candidate"]]
    return {
        "schema": "grouped_relaxed_general_n_mining.v1",
        "scope": {
            "bank": "certificates/surplus/relaxed_split/*.json",
            "note": (
                "Metadata audit. A candidate still needs Lean emission and a geometric "
                "producer for its common-mask equations."
            ),
        },
        "summary": {
            "valid_certificates": len(certificates),
            "multi_pid_grouped_candidates": len(grouped),
            "single_pid_certificates": len(singleton),
            "exact_pid_count_distribution": dict(
                sorted(Counter(row["exact_pid_count"] for row in certificates).items())
            ),
            "grouped_size_bucket_distribution": dict(
                sorted(Counter(row["size_bucket"] for row in grouped).items())
            ),
            "grouped_bytes": sum(row["bytes"] for row in grouped),
        },
        "canonical_erased_pin_seed_crosscheck": canonical_erased_pin_seed_crosscheck(
            repo
        ),
        "grouped_candidates": grouped,
        "single_pid_certificates": singleton,
    }


def write_markdown(path: Path, payload: dict[str, object]) -> None:
    summary = payload["summary"]
    crosscheck = payload["canonical_erased_pin_seed_crosscheck"]
    lines = [
        "<!--",
        "Copyright (c) 2026 Adam McKenna. All rights reserved.",
        "Released under Apache 2.0 license as described in the file LICENSE.",
        "Author: Adam McKenna <adam@mysticflounder.ai>",
        "-->",
        "",
        "# Grouped Relaxed-Bank General-Ambient Mining",
        "",
        "This report inventories the valid coefficient certificates retained in",
        "`certificates/surplus/relaxed_split/` but not emitted into the live Lean",
        "singleton bank. A certificate covering multiple exact pids is a candidate",
        "for a stronger ambient-cardinality-independent local theorem: exact `.v/.w`",
        "equations, its common erased-center submask equations, and its separator",
        "equation imply `False`. The split path identifies the grouped leaf; it is",
        "not an additional polynomial equation.",
        "",
        "This is a metadata result, not a new kernel theorem. Lean emission and the",
        "geometric producer for those hypotheses remain separate obligations.",
        "",
        "## Summary",
        "",
        f"- Valid retained certificates: {summary['valid_certificates']}",
        "- Multi-pid grouped theorem candidates: "
        f"{summary['multi_pid_grouped_candidates']}",
        f"- Single-pid retained certificates: {summary['single_pid_certificates']}",
        "- Exact-pid count distribution: "
        f"`{summary['exact_pid_count_distribution']}`",
        "- Grouped candidate size distribution: "
        f"`{summary['grouped_size_bucket_distribution']}`",
        "",
        "## Erased-Pin Cross-Check",
        "",
        "The P2 goals use the six own-kind private masks",
        "`[u,w,sstar,Pu]` at `Pw` and `[u,w,sstar,Pw]` at `Pu`.",
        f"They occur {crosscheck['occurrence_count']} times across the two oriented",
        f"terminal rows ({crosscheck['distinct_seed_count']} distinct seeds). Every",
        "occurrence has zero pinned-bank completions. Therefore no theorem mined from",
        "this grouped pinned bank can directly discharge those six P2 seed cases via",
        "the existing pinned-completion bridge. The fixed-seed DFS remains the relevant",
        "finite contradiction once the geometric candidate remainder is produced.",
        "",
        "## Multi-Pid Candidates",
        "",
        "| Certificate | Exact pids | MiB | Split depth | Source |",
        "|---|---:|---:|---:|---|",
    ]
    for row in payload["grouped_candidates"]:
        lines.append(
            f"| `{row['certificate_id']}` | {row['exact_pid_count']} | "
            f"{row['bytes'] / (1024 * 1024):.1f} | {len(row['split_path'])} | "
            f"`{row['path']}` |"
        )
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text("\n".join(lines) + "\n", encoding="utf-8")


def main() -> None:
    args = parse_args()
    repo = args.repo.resolve()
    json_out = output_path(repo, args.json_out)
    markdown_out = output_path(repo, args.markdown_out)
    payload = make_payload(repo)
    json_out.parent.mkdir(parents=True, exist_ok=True)
    json_out.write_text(
        json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    write_markdown(markdown_out, payload)
    print(json.dumps(payload["summary"], sort_keys=True))


if __name__ == "__main__":
    main()
