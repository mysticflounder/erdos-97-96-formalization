#!/usr/bin/env python3
"""Assemble the non-piqd computation validation ledger from the tier outputs.

This script is the only writer of both ledger files.  Neither is ever
hand-edited, so no conclusion can be written in and then cited back as
support.  The precedent failure it guards against is recorded in
``docs/computational-closure-plan-2026-07-28.md``, where an audit wrote its own
conclusions into a plan and then cited the plan.

Status uses only the vocabulary of
``docs/closure-evidence-status-ledger-2026-08-05.md``.  Three invariants are
hard errors, not warnings -- a violation aborts the build rather than shipping
a ledger that overstates its evidence:

1. A Tier 0 pass alone can never exceed DIAGNOSTIC-ONLY.  A row with no Tier 2
   result and a status above that ceiling fails the build.
2. Only a Tier 2 independent re-derivation of a Lean-consumed artifact may
   reach PROVEN-PRODUCER, and CLOSED-TO-RESIDUAL requires a named residual.
3. No row may be KERNEL-CLOSED.  This campaign closes no leaf.

A Tier 2 failure is recorded as DIAGNOSTIC-ONLY with a ``reexecution_failure``
residual.  Nothing is quarantined and nothing is deleted.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import stat
import sys
from pathlib import Path
from typing import Any

SCHEMA = "p97-nonpiqd-validation-ledger/v1"

KERNEL_CLOSED = "KERNEL-CLOSED"
CLOSED_TO_RESIDUAL = "CLOSED-TO-RESIDUAL"
PROVEN_PRODUCER = "PROVEN-PRODUCER"
PROSE_EXCLUDED = "PROSE-EXCLUDED"
RETIRED_AS_WORKSTREAM = "RETIRED-AS-WORKSTREAM"
DIAGNOSTIC_ONLY = "DIAGNOSTIC-ONLY"
PARKED_SPEC = "PARKED-SPEC"

VOCABULARY = (
    KERNEL_CLOSED,
    CLOSED_TO_RESIDUAL,
    PROVEN_PRODUCER,
    PROSE_EXCLUDED,
    RETIRED_AS_WORKSTREAM,
    DIAGNOSTIC_ONLY,
    PARKED_SPEC,
)

# The ceiling a Tier 0 pass may reach, and the status no row may ever carry.
TIER0_CEILING = DIAGNOSTIC_ONLY
FORBIDDEN = KERNEL_CLOSED

CERT001 = "CERT001_TERMINAL_LOCAL"
CONTROL_LOCAL = "VERIFICATION_CONTROL_INTENTIONAL_LOCAL"
CONTROL_WRITER = "census/p97_search/controls3.py"

PASS, FAIL, BLOCKED = "PASS", "FAIL", "BLOCKED"

PROOF_SUFFIXES = (".drat", ".lrat")

# The tracked files a terminal cell workdir retains; the CNFs and proofs
# beside them are untracked and named by hash.
ARM_CELL_TRACKED = ("summary.json", "receipt.json", "source-manifest.json")

# comparator/check-conformance.sh prints these three on a clean run.
CONFORMANCE_MARKERS = (
    "OK [core]:",
    "OK [native]:",
    "OK: all comparator theorems build and respect their tier's axiom budget.",
)

# The inventory report does not carry per-certificate Lean consumers; the Tier
# 2a algebraic run recorded them, and the reverse-link scan is their source.
LEAN_CONSUMED_INVENTORY: dict[str, list[str]] = {
    "certificates/multi_center/reports/l2_class_inventory_certificate.json": [
        "lean/Erdos9796Proof/P97/MultiCenter/Certificate/ClassInventory.lean",
        "lean/Erdos9796Proof/P97/MultiCenter/Certificate/TypedClassBank.lean",
    ],
    "certificates/multi_center/reports/l2_profile_class_incidence_certificate.json": [
        "lean/Erdos9796Proof/P97/MultiCenter/Certificate/ProfileClassIncidence.lean",
    ],
}

# Named once, so the residual text cannot drift between rows.
NATIVE_DECIDE_RESIDUAL = (
    "the identity is confirmed as written; that it is the correct obligation "
    "for its Lean consumer is not established, and Lean admits it by "
    "native_decide under the approved Lean.trustCompiler axiom, not the kernel"
)
NO_CONSUMER_RESIDUAL = "re-derived independently, but no Lean module names it"
TIER0_RESIDUAL = "Tier 0 custody only; this artifact was not re-executed"

MAX_JSON_BYTES = 256 * 1024 * 1024
READ_CHUNK = 1024 * 1024


class LedgerInvariantError(RuntimeError):
    """A row claimed more than its evidence supports."""


# --------------------------------------------------------------------------
# bounded IO
# --------------------------------------------------------------------------


def open_regular(path: Path):
    descriptor = os.open(
        path, os.O_RDONLY | os.O_NOFOLLOW | getattr(os, "O_CLOEXEC", 0)
    )
    try:
        if not stat.S_ISREG(os.fstat(descriptor).st_mode):
            raise OSError(f"{path}: not a regular file")
    except BaseException:
        os.close(descriptor)
        raise
    return os.fdopen(descriptor, "rb")


def _reject_duplicate_keys(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    seen: dict[str, Any] = {}
    for key, value in pairs:
        if key in seen:
            raise ValueError(f"duplicate JSON key {key!r}")
        seen[key] = value
    return seen


def load_json(path: Path) -> Any:
    with open_regular(path) as handle:
        raw = handle.read(MAX_JSON_BYTES + 1)
    if len(raw) > MAX_JSON_BYTES:
        raise ValueError(f"{path}: exceeds {MAX_JSON_BYTES} bytes")
    return json.loads(raw.decode("utf-8"), object_pairs_hook=_reject_duplicate_keys)


def load_jsonl(path: Path) -> list[Any]:
    records = []
    with open_regular(path) as handle:
        for line in handle:
            if line.strip():
                records.append(json.loads(line.decode("utf-8")))
    return records


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with open_regular(path) as handle:
        while True:
            chunk = handle.read(READ_CHUNK)
            if not chunk:
                break
            digest.update(chunk)
    return digest.hexdigest()


# --------------------------------------------------------------------------
# Tier 2 evidence, indexed by the artifact it speaks about
# --------------------------------------------------------------------------


def algebraic_evidence(records: list[Any]) -> dict[str, dict[str, Any]]:
    """Tier 2a: the exact rational recheck of the Lean-named certificates."""

    evidence = {}
    for record in records:
        independent = record.get("independent", {}).get("verdict")
        producer = record.get("producer", {}).get("verdict")
        holds = independent == "HOLDS" and producer == "HOLDS"
        control = record.get("mutation_control", {})
        evidence[record["path"]] = {
            "tier": "2a",
            "check": "exact rational identity recheck",
            "outcome": PASS if holds and record.get("legs_agree") else FAIL,
            "independent_leg": independent,
            "producer_leg": producer,
            "mutants": control.get("n_mutants", 0),
            "mutants_rejected": control.get("n_rejected", 0),
            "lean_consumers": sorted(record.get("lean_consumers") or []),
            "declared_python_exact_polynomial": record.get(
                "declared_python_exact_polynomial"
            ),
        }
    return evidence


def inventory_evidence(report: dict[str, Any]) -> dict[str, dict[str, Any]]:
    """Tier 2a: the two multi-centre inventory certificates."""

    # The report aggregates over both certificates rather than nesting per
    # file, so the relation and control counts are the run's, not each row's.
    evidence = {}
    relations = report.get("relations") or {}
    failures = report.get("relation_failures") or []
    replay = report.get("producer_replay") or {}
    reproduced = set(replay.get("byte_identical") or [])
    control = report.get("mutation_control_rejects") or {}
    for path in report.get("certificates", []):
        evidence[path] = {
            "tier": "2a",
            "check": "digest and set-relation recheck, plus producer replay",
            "outcome": PASS
            if not failures
            and path in reproduced
            and report.get("mutation_control_valid")
            else FAIL,
            "relations_checked": relations.get("total"),
            "relations_holding": relations.get("holding"),
            "producer_replay_byte_identical": path in reproduced,
            "mutants": control.get("n_mutants", 0),
            "mutants_rejected": control.get("n_rejected", 0),
            "lean_consumers": sorted(LEAN_CONSUMED_INVENTORY.get(path, [])),
        }
    return evidence


def transcription_evidence(report: dict[str, Any]) -> dict[str, dict[str, Any]]:
    """Tier 2b, reported against the Lean directory rather than one JSON file."""

    evidence = {}
    for family in report.get("families", []):
        diff = family.get("diff") or {}
        replay = family.get("row_replay") or {}
        # The key is blocked_term_sharded (verify_lean_transcription.py:388).
        # Reading a bare "blocked" gave None on every report, so an aborted emit
        # was labelled FAIL instead of BLOCKED and the ledger's own caveat said
        # "0 surplus Lean modules ... blocked" while 34 in fact were.
        blocked = replay.get("blocked_term_sharded")
        if family.get("all_steps_succeeded") and diff.get("byte_identical"):
            outcome = PASS
        elif blocked:
            outcome = BLOCKED
        else:
            outcome = FAIL
        evidence[family["committed_lean_dir"]] = {
            "tier": "2b",
            "check": "re-emit the Lean bank from the committed JSON and diff",
            "outcome": outcome,
            "family": family["family"],
            "json_dir": family.get("json_dir"),
            "byte_identical": diff.get("byte_identical"),
            "row_replay_identical": replay.get("byte_identical"),
            "row_replay_blocked": blocked,
        }
    return evidence


def solver_evidence(records: list[Any]) -> dict[str, dict[str, Any]]:
    """Tier 2c, keyed by the cell workdir or by the stored proof."""

    # The CNFs and proofs themselves are untracked, so keying on them would
    # attach the evidence to almost nothing.  It is filed instead against the
    # tracked records that declare them, and against each cell's tracked
    # artifacts, which is where a reader looks for it.
    evidence = {}
    for record in records:
        if record.get("route") == "arm-cell":
            comparison = record.get("comparison") or {}
            entry = {
                "tier": "2c",
                "check": "rerun the RUP preparer and byte-compare every artifact",
                "outcome": PASS if record.get("verdict") == "AGREES" else FAIL,
                "cell": record["cell"],
                "identical_artifacts": comparison.get("identical"),
                "differing": comparison.get("differing"),
            }
            evidence[record["cell"]] = entry
            for name in ARM_CELL_TRACKED:
                evidence[f"{record['cell']}/{name}"] = entry
            continue
        control = record.get("mutation_control") or {}
        entry = {
            "tier": "2c",
            "check": "recheck the stored proof and re-solve the CNF afresh",
            "outcome": PASS if record.get("verdict") == "AGREES" else FAIL,
            "declared_class": record.get("declared_class"),
            "stored_proof": record.get("stored_proof", {}).get("verdict"),
            "fresh_proof": (record.get("fresh_proof") or {}).get("verdict"),
            "mutants": control.get("n_mutants", 0),
            "mutants_rejected": control.get("n_rejected", 0),
            "cnf": record.get("cnf"),
            "proof": record.get("proof"),
        }
        evidence[record["proof"]] = entry
        for declaring in record.get("records") or []:
            evidence[declaring] = entry
    return evidence


def bank_evidence(report: dict[str, Any]) -> dict[str, dict[str, Any]]:
    """Tier 2d and 2e, keyed by the bank module."""

    evidence = {}
    dependency = {
        row["module"]: row
        for row in report.get("dependency_set", [])
        if "module" in row
    }
    built = set(report.get("runtime_coverage", {}).get("built_at_runtime", []))
    for row in report.get("pin_comparison", {}).get("rows", []):
        module = row["module"]
        dependency_row = dependency.get(module, {})
        evidence[f"census/card_head/{module}.py"] = {
            "tier": "2d",
            "check": "rebuild under the frozen pins and diff the observed sha",
            "outcome": PASS
            if row.get("verdict") == "MATCH"
            and dependency_row.get("verdict") == "MATCH"
            else FAIL,
            "pin_verdict": row.get("verdict"),
            "pinned_by": row.get("pinned_by"),
            "dependency_set": dependency_row.get("unchanged_line"),
            "built_at_runtime": module in built,
        }
    for row in report.get("clause_chain", {}).get("rows", []):
        key = f"census/card_head/{row['module']}.py"
        entry = evidence.get(key)
        if entry is None:
            entry = evidence[key] = {
                "tier": "2e",
                "check": "clause-chain contiguity and a runtime build",
                "outcome": PASS if row["module"] in built else FAIL,
                "built_at_runtime": row["module"] in built,
            }
        entry["clause_chain_verdict"] = row.get("verdict")
        entry["parent_clauses"] = row.get("parent_clauses")
        entry["final_clauses"] = row.get("final_clauses")
    return evidence


# --------------------------------------------------------------------------
# rows
# --------------------------------------------------------------------------


def local_boundary(record: dict[str, Any], writer: str | None) -> str | None:
    """Governed local boundaries, which the gap census excludes by construction."""

    if writer and writer.endswith(CONTROL_WRITER.rsplit("/", maxsplit=1)[-1]):
        return CONTROL_LOCAL
    for reference in record.get("referenced_inputs") or []:
        path = (reference or {}).get("path") or ""
        if path.endswith(PROOF_SUFFIXES):
            return CERT001
    if str(record.get("path", "")).endswith(PROOF_SUFFIXES):
        return CERT001
    return None


def assign_status(
    tier2: dict[str, Any] | None, lean_consumers: list[str]
) -> tuple[str, str]:
    """The only place a status is decided.  Returns (status, residual)."""

    if not tier2:
        return DIAGNOSTIC_ONLY, TIER0_RESIDUAL
    outcome = tier2.get("outcome")
    if outcome == FAIL:
        return DIAGNOSTIC_ONLY, f"reexecution_failure: {tier2.get('check')}"
    if outcome == BLOCKED:
        blocked = tier2.get("row_replay_blocked")
        return DIAGNOSTIC_ONLY, (
            f"reexecution_blocked: {blocked} outputs could not be regenerated; "
            "not shown wrong, not shown right"
        )
    if lean_consumers:
        return PROVEN_PRODUCER, NATIVE_DECIDE_RESIDUAL
    return DIAGNOSTIC_ONLY, NO_CONSUMER_RESIDUAL


def check_invariants(row: dict[str, Any]) -> None:
    """Hard errors.  A ledger that overstates its evidence must not be written."""

    status = row["status"]
    if status not in VOCABULARY:
        raise LedgerInvariantError(
            f"{row['artifact_path']}: status {status!r} is not in the vocabulary"
        )
    if status == FORBIDDEN:
        raise LedgerInvariantError(
            f"{row['artifact_path']}: {FORBIDDEN} is forbidden; this campaign closes no leaf"
        )
    if not row.get("tier2_result") and status != TIER0_CEILING:
        raise LedgerInvariantError(
            f"{row['artifact_path']}: no Tier 2 result, so {status} exceeds the "
            f"{TIER0_CEILING} ceiling"
        )
    if status == PROVEN_PRODUCER:
        tier2 = row.get("tier2_result") or {}
        if tier2.get("outcome") != PASS:
            raise LedgerInvariantError(
                f"{row['artifact_path']}: {PROVEN_PRODUCER} needs a passing Tier 2 re-derivation"
            )
        if not row.get("lean_consumers"):
            raise LedgerInvariantError(
                f"{row['artifact_path']}: {PROVEN_PRODUCER} needs a named Lean consumer"
            )
    if status == CLOSED_TO_RESIDUAL and not row.get("residual"):
        raise LedgerInvariantError(
            f"{row['artifact_path']}: {CLOSED_TO_RESIDUAL} needs a named residual"
        )


def build_rows(
    custody: list[Any],
    provenance: dict[str, Any],
    tier2_index: dict[str, dict[str, Any]],
) -> list[dict[str, Any]]:
    rows = []
    for record in custody:
        path = record["path"]
        writer_block = record.get("writer") or {}
        writer = writer_block.get("module")
        tier2 = tier2_index.get(path)
        # A Lean-directory result speaks for the JSON directory that feeds it.
        if tier2 is None:
            for value in tier2_index.values():
                if value.get("tier") == "2b" and path.startswith(
                    str(value.get("json_dir") or "\0")
                ):
                    tier2 = value
                    break
        consumers = sorted((tier2 or {}).get("lean_consumers") or [])
        status, residual = assign_status(tier2, consumers)
        writer_fields = provenance.get(writer or "", {})
        row = {
            "artifact_path": path,
            "sha256": record.get("sha256"),
            "class": record.get("route_class"),
            "record_schema": record.get("record_schema"),
            "writer_module": writer,
            "writer_evidence": writer_block.get("evidence"),
            "tier0_custody": {
                "bytes": record.get("bytes"),
                "defects": record.get("defects") or [],
                "references": len(record.get("referenced_inputs") or []),
                "self_hash": record.get("self_hash"),
            },
            "tier1_field_provenance": writer_fields.get("aggregate") or {},
            "tier2_result": tier2 or {},
            "lean_consumers": consumers,
            "claims_vector_id": writer_fields.get("claims_vector_id"),
            "claims_vector_fields": writer_fields.get("claims_vector_fields") or [],
            "seal_intact": writer_fields.get("seal_intact"),
            "local_boundary": local_boundary(record, writer),
            "status": status,
            "residual": residual,
        }
        check_invariants(row)
        rows.append(row)
    return rows


def provenance_index(records: list[Any]) -> dict[str, dict[str, Any]]:
    """Per-writer field-provenance summary, keyed by module path."""

    index = {}
    for record in records:
        classes: dict[str, int] = {}
        # `fields` is keyed by field name, `claims_vectors` by vector id.
        for detail in (record.get("fields") or {}).values():
            aggregate = (detail or {}).get("aggregate")
            if aggregate:
                classes[aggregate] = classes.get(aggregate, 0) + 1
        # A claims vector maps a module constant to the claim field names it
        # governs.  Tier 1 records which vector a module declares, not whether
        # the seal holds, so `seal_intact` stays null rather than being
        # invented here: an all-False vector is the anti-overclaim seal and a
        # computed vector is not, and only the writing module tells them apart.
        vectors = record.get("claims_vectors") or {}
        first = next(iter(sorted(vectors)), None)
        index[record["module"]] = {
            "aggregate": dict(sorted(classes.items())),
            "claims_vector_id": first,
            "claims_vector_fields": sorted(vectors.get(first) or []) if first else [],
            "seal_intact": None,
        }
    return index


# --------------------------------------------------------------------------
# rendering
# --------------------------------------------------------------------------


def tally(rows: list[dict[str, Any]], key: str) -> dict[str, int]:
    counts: dict[str, int] = {}
    for row in rows:
        value = row.get(key)
        name = value if isinstance(value, str) else str(value)
        counts[name] = counts.get(name, 0) + 1
    return dict(sorted(counts.items()))


def render_markdown(document: dict[str, Any]) -> str:
    rows = document["rows"]
    summary = document["summary"]
    reexecuted = [r for r in rows if r["tier2_result"]]
    boundary = [r for r in rows if r["local_boundary"]]

    lines = [
        "# Non-piqd computation validation ledger",
        "",
        (
            f"Schema `{document['schema']}`. Generated by "
            f"`{document['generator']}` from the tier outputs named below. "
            "Neither ledger file is hand-edited."
        ),
        "",
        (
            "This ledger records computation validation. It closes no proof "
            "obligation, promotes no leaf, and moves no spine anchor. No row is "
            f"`{KERNEL_CLOSED}`, and the assembler treats that status as a hard "
            "error."
        ),
        "",
        "## Coverage",
        "",
        f"- Artifacts: **{summary['n_rows']}**",
        f"- Re-executed under Tier 2: **{len(reexecuted)}**",
        (
            "- Governed local boundaries, excluded from the gap census: "
            f"**{len(boundary)}**"
        ),
        "",
        "## Status",
        "",
        "| Status | Rows |",
        "| --- | ---: |",
    ]
    for status, count in summary["by_status"].items():
        lines.append(f"| `{status}` | {count} |")

    lines += ["", "## Route class", "", "| Class | Rows |", "| --- | ---: |"]
    for name, count in summary["by_class"].items():
        lines.append(f"| `{name}` | {count} |")

    lines += [
        "",
        "## Re-executed artifacts",
        "",
        (
            "Every row with a Tier 2 result. A passing re-derivation of a "
            "Lean-consumed artifact reaches `PROVEN-PRODUCER` and no further; "
            "the residual is the same in each case and is stated in the JSON."
        ),
        "",
        "| Artifact | Tier | Outcome | Status | Lean consumers |",
        "| --- | --- | --- | --- | ---: |",
    ]
    for row in sorted(
        reexecuted, key=lambda r: (r["tier2_result"]["tier"], r["artifact_path"])
    )[:400]:
        tier2 = row["tier2_result"]
        lines.append(
            f"| `{row['artifact_path']}` | {tier2['tier']} | {tier2['outcome']} "
            f"| `{row['status']}` | {len(row['lean_consumers'])} |"
        )
    if len(reexecuted) > 400:
        lines.append(
            f"| … {len(reexecuted) - 400} further rows, all in the JSON ledger "
            "| | | | |"
        )

    lines += ["", "## Not re-executed", ""]
    for item in document["not_reexecuted"]:
        lines.append(f"- {item}")

    lines += ["", "## Tier 2f — Lean side", ""]
    for key, value in document["tier2f"].items():
        lines.append(f"- **{key}**: {value}")

    lines += ["", "## Inputs", ""]
    for name, digest in document["inputs"].items():
        lines.append(f"- `{name}` — `{digest[:16]}`")
    lines.append("")
    return "\n".join(lines)


# --------------------------------------------------------------------------
# CLI
# --------------------------------------------------------------------------


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--repo-root", type=Path, default=Path(__file__).resolve().parents[1]
    )
    parser.add_argument("--custody", type=Path, required=True)
    parser.add_argument("--provenance", type=Path, required=True)
    parser.add_argument("--algebraic", type=Path, required=True)
    parser.add_argument("--inventory", type=Path, required=True)
    parser.add_argument("--transcription", type=Path, required=True)
    parser.add_argument("--solver-verdicts", type=Path, required=True)
    parser.add_argument("--bank-chain", type=Path, required=True)
    parser.add_argument("--lean-build", type=Path, required=True)
    parser.add_argument("--conformance", type=Path, required=True)
    parser.add_argument("--out-json", type=Path, required=True)
    parser.add_argument("--out-md", type=Path, required=True)
    args = parser.parse_args(argv)

    custody = load_jsonl(args.custody)
    provenance = provenance_index(load_jsonl(args.provenance))

    tier2_index: dict[str, dict[str, Any]] = {}
    tier2_index.update(algebraic_evidence(load_jsonl(args.algebraic)))
    tier2_index.update(inventory_evidence(load_json(args.inventory)))
    tier2_index.update(transcription_evidence(load_json(args.transcription)))
    tier2_index.update(solver_evidence(load_jsonl(args.solver_verdicts)))
    tier2_index.update(bank_evidence(load_json(args.bank_chain)))

    rows = build_rows(custody, provenance, tier2_index)

    build_log = args.lean_build.read_text(encoding="utf-8", errors="replace")
    conformance_log = args.conformance.read_text(encoding="utf-8", errors="replace")
    transcription = load_json(args.transcription)
    blocked = 0
    for family in transcription.get("families", []):
        blocked += (family.get("row_replay") or {}).get("blocked_term_sharded") or 0

    document = {
        "schema": SCHEMA,
        "generator": "scripts/build_computation_validation_ledger.py",
        "scope": (
            "computation validation of durable non-piqd output; no proof "
            "obligation is closed, no leaf promoted, no spine anchor moved"
        ),
        "status_vocabulary": list(VOCABULARY),
        "invariants": [
            f"a row with no Tier 2 result may not exceed {TIER0_CEILING}",
            f"{PROVEN_PRODUCER} requires a passing Tier 2 re-derivation and a named Lean consumer",
            f"{CLOSED_TO_RESIDUAL} requires a named residual",
            f"no row may be {FORBIDDEN}",
        ],
        "inputs": {
            path.as_posix(): sha256_file(path)
            for path in (
                args.custody,
                args.provenance,
                args.algebraic,
                args.inventory,
                args.transcription,
                args.solver_verdicts,
                args.bank_chain,
            )
        },
        "tier2f": {
            "lake_build": "Build completed successfully"
            if "Build completed successfully" in build_log
            else "FAILED",
            # Matched against the script's own success lines rather than by
            # scanning for the word "fail", which appears in Lean's own output.
            "conformance": "clean"
            if all(marker in conformance_log for marker in CONFORMANCE_MARKERS)
            else "see the conformance log",
            "axiom_budget_lines": [
                line.strip()
                for line in conformance_log.splitlines()
                if line.startswith("OK [")
            ],
            "sorryAx_in_build_log": "sorryAx" in build_log,
        },
        # The surplus line is emitted only while something is actually blocked.
        # Printing it with a zero count read as a standing caveat after the
        # term-sharded emitter was repaired and the count went to nothing.
        "not_reexecuted": (
            [
                (
                    f"{blocked} surplus Lean modules whose transcription is "
                    "blocked while the term-sharded emitter is broken; their "
                    "identities were rechecked exactly at the JSON layer, so "
                    "what is open is the JSON-to-Lean step alone"
                )
            ]
            if blocked
            else []
        )
        + [
            (
                "the 68 arm cells of the two 20260811 waves that retain only "
                "summary.json; their CNFs and proofs were not kept, so they are "
                "outside re-execution"
            ),
            "the full 2.8 M-clause CEGAR wave rebuilds, spot-checked only",
        ],
        "summary": {
            "n_rows": len(rows),
            "n_reexecuted": sum(1 for row in rows if row["tier2_result"]),
            "by_status": tally(rows, "status"),
            "by_class": tally(rows, "class"),
            "by_local_boundary": tally(
                [row for row in rows if row["local_boundary"]], "local_boundary"
            ),
        },
        "rows": rows,
    }

    args.out_json.parent.mkdir(parents=True, exist_ok=True)
    args.out_json.write_text(
        json.dumps(document, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    args.out_md.parent.mkdir(parents=True, exist_ok=True)
    args.out_md.write_text(render_markdown(document), encoding="utf-8")

    print(json.dumps(document["summary"], indent=2, sort_keys=True))
    print(json.dumps(document["tier2f"], indent=2, sort_keys=True), file=sys.stderr)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
