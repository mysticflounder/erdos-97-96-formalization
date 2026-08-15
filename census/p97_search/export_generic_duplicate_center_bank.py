#!/usr/bin/env python3
"""Export authenticated duplicate-center journal records to generic Lean data.

The exporter deliberately proves only record validity.  Its generated bank
does not claim that the journal covers every source-faithful row pattern; that
is a separate Lean coverage obligation.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import re
import sys
from pathlib import Path
from typing import Any

_REPOSITORY_ROOT = Path(__file__).resolve().parents[2]
if str(_REPOSITORY_ROOT) not in sys.path:
    sys.path.insert(0, str(_REPOSITORY_ROOT))

from census.global_confinement import cap_selected_nogood_certificate_probe as certs

STAGE = "equality-duplicate-center"
FIELDS = ("ap_aq", "ap_ar", "bp_bq", "bp_br")


def _lean_nat(value: Any) -> str:
    number = int(value)
    if not 0 <= number < 12:
        raise ValueError(f"label outside Fin 12: {number}")
    return str(number)


def _lean_finset(values: list[int]) -> str:
    return "{" + ", ".join(_lean_nat(value) for value in values) + "}"


def _lean_steps(steps: list[dict[str, Any]]) -> str:
    rendered: list[str] = []
    for step in steps:
        kind = step.get("kind")
        if kind == "row":
            rendered.append(
                ".row "
                + " ".join(
                    _lean_nat(step[key]) for key in ("center", "first", "second")
                )
            )
        elif kind == "flip":
            rendered.append(
                f".flip {_lean_nat(step['first'])} {_lean_nat(step['second'])}"
            )
        else:
            raise ValueError(f"unsupported closure step: {step!r}")
    return "[" + ", ".join(rendered) + "]"


def _lean_path(path: dict[str, Any]) -> str:
    first = path["first"]
    last = path["last"]
    return (
        "{ first := ("
        + _lean_nat(first[0])
        + ", "
        + _lean_nat(first[1])
        + "), steps := "
        + _lean_steps(path["steps"])
        + ", last := ("
        + _lean_nat(last[0])
        + ", "
        + _lean_nat(last[1])
        + ") }"
    )


def _membership_rows(certificate: dict[str, Any]) -> list[dict[str, Any]]:
    """Return the canonical positive memberships traversed by closure paths."""

    required: dict[int, set[int]] = {}
    for path in certificate["closure_paths"]:
        for step in path["steps"]:
            kind = step.get("kind")
            if kind == "flip":
                continue
            if kind != "row":
                raise ValueError(f"unsupported closure step: {step!r}")
            center = int(step["center"])
            required.setdefault(center, set()).update(
                (int(step["first"]), int(step["second"]))
            )
    if not required:
        raise ValueError("closure certificate uses no positive row memberships")
    source_rows = {
        int(row["center"]): {int(point) for point in row["support"]}
        for row in certificate["rows"]
    }
    result = [
        {"center": center, "support": sorted(points)}
        for center, points in sorted(required.items())
    ]
    for row in result:
        center = row["center"]
        if center not in source_rows or not set(row["support"]) <= source_rows[center]:
            raise ValueError("closure membership is absent from its selected row")
    return result


def _membership_key(
    certificate: dict[str, Any],
) -> tuple[tuple[int, tuple[int, ...]], ...]:
    return tuple(
        (row["center"], tuple(row["support"]))
        for row in _membership_rows(certificate)
    )


def _record_lean(
    index: int, record: dict[str, Any], *, membership_core: bool
) -> str:
    certificate = record["certificate"]
    if not certs._validate_certificate(certificate, n=12):
        raise ValueError(f"record {index}: certificate replay failed")
    if certificate.get("stage") != STAGE:
        raise ValueError(f"record {index}: wrong stage")
    if certificate.get("side_conditions") != [{"kind": "injective-realization"}]:
        raise ValueError(f"record {index}: unsupported side conditions")

    source_rows = certificate["rows"]
    if any(len(row["support"]) != 4 for row in source_rows):
        raise ValueError(f"record {index}: expected four positive incidences per row")
    learned_clause = record.get("learned_clause")
    if not isinstance(learned_clause, list) or len(learned_clause) != len(source_rows):
        raise ValueError(f"record {index}: learned clause/row arity mismatch")
    rows = _membership_rows(certificate) if membership_core else source_rows

    paths = {path["field"]: path for path in certificate["closure_paths"]}
    if len(paths) != len(FIELDS) or set(paths) != set(FIELDS):
        raise ValueError(f"record {index}: unexpected closure fields {tuple(paths)}")
    core = certificate["core"]
    a, b = core["centers"]
    p, q, r = core["triple"]

    row_terms = [
        "{ center := "
        + _lean_nat(row["center"])
        + ", support := "
        + _lean_finset(row["support"])
        + " }"
        for row in rows
    ]
    data_fields = {
        "p": _lean_nat(p),
        "q": _lean_nat(q),
        "r": _lean_nat(r),
        "a": _lean_nat(a),
        "b": _lean_nat(b),
        **{field: _lean_path(paths[field]) for field in FIELDS},
    }
    data = "\n".join(
        f"      {field} := {value}" for field, value in data_fields.items()
    )
    return (
        f"/-- Journal iteration {record.get('iteration')}; "
        f"certificate {certificate['proof_sha256']}. -/\n"
        f"def record{index} : DuplicateCenterNogood Label :=\n"
        "  { choices := [\n      "
        + ",\n      ".join(row_terms)
        + "\n    ]\n"
        + "    data := {\n"
        + data
        + " } }\n"
    )


def _read_records(
    path: Path, limit: int | None, *, membership_core: bool
) -> list[dict[str, Any]]:
    selected: list[dict[str, Any]] = []
    seen_memberships: set[tuple[tuple[int, tuple[int, ...]], ...]] = set()
    with path.open(encoding="utf-8") as stream:
        for line_number, line in enumerate(stream, start=1):
            try:
                record = json.loads(line)
            except json.JSONDecodeError as error:
                raise ValueError(f"{path}:{line_number}: invalid JSON") from error
            if record.get("stage") != STAGE:
                continue
            if membership_core:
                key = _membership_key(record["certificate"])
                if key in seen_memberships:
                    continue
                seen_memberships.add(key)
            selected.append(record)
            if limit is not None and len(selected) >= limit:
                break
    if not selected:
        raise ValueError("journal contains no duplicate-center records")
    return selected


def _render(
    journal: Path,
    records: list[dict[str, Any]],
    namespace: str,
    chunk_size: int,
    *,
    membership_core: bool,
    journal_digest: str | None = None,
) -> str:
    if not re.fullmatch(r"[A-Za-z_][A-Za-z0-9_.]*", namespace):
        raise ValueError(f"invalid Lean namespace: {namespace}")
    digest = journal_digest or _journal_sha256(journal)
    chunks = [
        list(range(start, min(start + chunk_size, len(records))))
        for start in range(0, len(records), chunk_size)
    ]
    declarations = "\n".join(
        _record_lean(index, record, membership_core=membership_core)
        for index, record in enumerate(records)
    )
    chunk_defs = "\n".join(
        f"def bankChunk{chunk_index} : List (DuplicateCenterNogood Label) :=\n"
        "  ["
        + ", ".join(f"record{index}" for index in indices)
        + "]\n"
        for chunk_index, indices in enumerate(chunks)
    )
    bank_expression = " ++ ".join(
        f"bankChunk{chunk_index}" for chunk_index in range(len(chunks))
    )
    support_kind = "distinct membership cores" if membership_core else "records"
    four_supported = "" if membership_core else """
def bankFourSupportedCheck : Bool :=
  bank.all fun nogood => nogood.fourSupportedCheck

theorem bankFourSupportedCheck_true : bankFourSupportedCheck = true := by
  native_decide

theorem bank_fourSupported : ∀ nogood ∈ bank, nogood.FourSupported := by
  intro nogood hnogood
  apply nogood.fourSupported_of_check
  have hall : bank.all (fun item => item.fourSupportedCheck) = true := by
    simpa [bankFourSupportedCheck] using bankFourSupportedCheck_true
  exact List.all_eq_true.mp hall nogood hnogood
"""
    return f"""/-
Generated from {journal.as_posix()}
Journal SHA-256: {digest}
Duplicate-center {support_kind}: {len(records)}

This file checks record validity only.  It is not a coverage or UNSAT proof.
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.GenericRowNogoodCertificate

namespace {namespace}

open Problem97.Census554.EqualityCore
open Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate
open scoped EuclideanGeometry

abbrev Label := Fin 12

{declarations}
{chunk_defs}
def bank : List (DuplicateCenterNogood Label) :=
  {bank_expression}

def bankCheck : Bool := bank.all fun nogood => nogood.check

theorem bankCheck_true : bankCheck = true := by
  native_decide

theorem bank_valid : ∀ nogood ∈ bank, nogood.check = true := by
  apply List.all_eq_true.mp
  simpa [bankCheck] using bankCheck_true

{four_supported}

end {namespace}
"""


def _journal_sha256(journal: Path) -> str:
    digest = hashlib.sha256()
    with journal.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest()


def _render_module_shards(
    journal: Path,
    records: list[dict[str, Any]],
    namespace: str,
    module_prefix: str,
    records_per_module: int,
    *,
    journal_digest: str | None = None,
) -> tuple[str, list[tuple[str, str, str]]]:
    """Render independent membership-bank modules and a thin coordinator.

    The returned shard tuples are ``(module_path, namespace, source)``.
    Each shard validates its own closed Boolean bank; the coordinator combines
    those already-checked banks without re-elaborating record declarations.
    """

    if not re.fullmatch(r"[A-Za-z_][A-Za-z0-9_.]*", module_prefix):
        raise ValueError(f"invalid Lean module prefix: {module_prefix}")
    digest = journal_digest or _journal_sha256(journal)
    groups = [
        list(enumerate(records[start : start + records_per_module], start=start))
        for start in range(0, len(records), records_per_module)
    ]
    width = max(3, len(str(len(groups))))
    shards: list[tuple[str, str, str]] = []
    for shard_number, group in enumerate(groups, start=1):
        stem = f"Part_{shard_number:0{width}d}"
        shard_module = f"{module_prefix}.{stem}"
        shard_namespace = f"{namespace}Shards.{stem}"
        declarations = "\n".join(
            _record_lean(index, record, membership_core=True)
            for index, record in group
        )
        record_names = ", ".join(f"record{index}" for index, _record in group)
        source = f"""/-
Generated membership-core shard from {journal.as_posix()}
Journal SHA-256: {digest}
Global record interval: {group[0][0]}..{group[-1][0]}

This file checks record validity only.  It is not a coverage or UNSAT proof.
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.GenericRowNogoodCertificate

namespace {shard_namespace}

open Problem97.Census554.EqualityCore
open Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate
open scoped EuclideanGeometry

abbrev Label := Fin 12

{declarations}
def bank : List (DuplicateCenterNogood Label) :=
  [{record_names}]

def bankCheck : Bool := bank.all fun nogood => nogood.check

theorem bankCheck_true : bankCheck = true := by
  native_decide

theorem bank_valid : ∀ nogood ∈ bank, nogood.check = true := by
  apply List.all_eq_true.mp
  simpa [bankCheck] using bankCheck_true

end {shard_namespace}
"""
        shards.append((shard_module, shard_namespace, source))

    imports = "\n".join(f"import {module}" for module, _ns, _src in shards)
    bank_expression = " ++ ".join(f"{shard_namespace}.bank" for _, shard_namespace, _ in shards)
    proof_lines: list[str] = []
    for index, (_module, shard_namespace, _source) in enumerate(shards):
        if index + 1 < len(shards):
            proof_lines.extend(
                [
                    "  rcases hmem with hmem | hmem",
                    f"  · exact {shard_namespace}.bank_valid nogood hmem",
                ]
            )
        else:
            proof_lines.append(
                f"  exact {shard_namespace}.bank_valid nogood hmem"
            )
    proof = "\n".join(proof_lines)
    coordinator = f"""/-
Generated membership-core bank coordinator from {journal.as_posix()}
Journal SHA-256: {digest}
Distinct duplicate-center membership cores: {len(records)}

This module proves record validity only.  Coverage remains a separate theorem.
-/

{imports}

namespace {namespace}

open Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate

abbrev Label := Fin 12

def bank : List (DuplicateCenterNogood Label) :=
  {bank_expression}

theorem bank_valid : ∀ nogood ∈ bank, nogood.check = true := by
  intro nogood hmem
  simp only [bank, List.mem_append] at hmem
{proof}

end {namespace}
"""
    return coordinator, shards


def _sha256_text(source: str) -> str:
    return hashlib.sha256(source.encode("utf-8")).hexdigest()


def _manifest_document(
    *,
    journal: Path,
    journal_digest: str,
    journal_size: int,
    out: Path,
    coordinator: str,
    records: list[dict[str, Any]],
    namespace: str,
    module_prefix: str,
    records_per_module: int,
    shards: list[tuple[str, str, str]],
) -> dict[str, Any]:
    """Describe the exact source and outputs of one sharded export.

    The manifest authenticates generated record-validity modules only.  It
    deliberately makes no coverage or UNSAT claim.
    """

    shard_directory = out.parent / f"{out.stem}Shards"
    shard_entries = []
    for shard_index, (module, shard_namespace, source) in enumerate(shards):
        start = shard_index * records_per_module
        count = min(records_per_module, len(records) - start)
        shard_entries.append(
            {
                "module": module,
                "namespace": shard_namespace,
                "path": (shard_directory / f"{module.rsplit('.', 1)[-1]}.lean").as_posix(),
                "record_start": start,
                "record_count": count,
                "sha256": _sha256_text(source),
            }
        )
    return {
        "schema": "p97_duplicate_center_membership_bank_export.v1",
        "scope": (
            "Authenticated generated Lean record-validity bank; not a coverage, "
            "UNSAT, or live-leaf closure certificate"
        ),
        "mode": "membership_core",
        "source": {
            "journal": journal.as_posix(),
            "byte_count": journal_size,
            "sha256": journal_digest,
        },
        "distinct_core_count": len(records),
        "records_per_module": records_per_module,
        "shard_module_prefix": module_prefix,
        "coordinator": {
            "path": out.as_posix(),
            "namespace": namespace,
            "sha256": _sha256_text(coordinator),
        },
        "shards": shard_entries,
    }


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--journal", required=True, type=Path)
    parser.add_argument("--out", required=True, type=Path)
    parser.add_argument("--limit", type=int)
    parser.add_argument("--chunk-size", type=int, default=100)
    parser.add_argument(
        "--namespace",
        default="Problem97.ATailFrontierLiveClosure.ExactTwelveGeneratedDuplicateCenterBank",
    )
    parser.add_argument(
        "--membership-core",
        action="store_true",
        help=(
            "emit and deduplicate only positive row memberships traversed by "
            "closure paths; generated data is cardinality-independent"
        ),
    )
    parser.add_argument(
        "--records-per-module",
        type=int,
        help="emit independent membership-bank modules of this many records",
    )
    parser.add_argument(
        "--shard-module-prefix",
        help="Lean module prefix for --records-per-module output",
    )
    parser.add_argument(
        "--manifest",
        type=Path,
        help="write an authenticated JSON manifest for sharded output",
    )
    args = parser.parse_args()
    if args.limit is not None and args.limit <= 0:
        parser.error("--limit must be positive")
    if args.chunk_size <= 0:
        parser.error("--chunk-size must be positive")
    if args.records_per_module is not None:
        if args.records_per_module <= 0:
            parser.error("--records-per-module must be positive")
        if not args.membership_core:
            parser.error("--records-per-module currently requires --membership-core")
        if not args.shard_module_prefix:
            parser.error("--records-per-module requires --shard-module-prefix")
    elif args.shard_module_prefix:
        parser.error("--shard-module-prefix requires --records-per-module")
    if args.manifest is not None and args.records_per_module is None:
        parser.error("--manifest currently requires --records-per-module")
    initial_stat = args.journal.stat()
    records = _read_records(
        args.journal, args.limit, membership_core=args.membership_core
    )
    journal_digest = _journal_sha256(args.journal)
    shards: list[tuple[str, str, str]] = []
    if args.records_per_module is None:
        rendered = _render(
            args.journal,
            records,
            args.namespace,
            args.chunk_size,
            membership_core=args.membership_core,
            journal_digest=journal_digest,
        )
    else:
        rendered, shards = _render_module_shards(
            args.journal,
            records,
            args.namespace,
            args.shard_module_prefix,
            args.records_per_module,
            journal_digest=journal_digest,
        )
    final_stat = args.journal.stat()
    if (initial_stat.st_size, initial_stat.st_mtime_ns) != (
        final_stat.st_size,
        final_stat.st_mtime_ns,
    ):
        raise RuntimeError("journal changed during export; retry from a stable snapshot")
    args.out.parent.mkdir(parents=True, exist_ok=True)
    if shards:
        shard_directory = args.out.parent / f"{args.out.stem}Shards"
        shard_directory.mkdir(parents=True, exist_ok=True)
        for module, _namespace, source in shards:
            shard_path = shard_directory / f"{module.rsplit('.', 1)[-1]}.lean"
            shard_path.write_text(source, encoding="utf-8")
    args.out.write_text(rendered, encoding="utf-8")
    if args.manifest is not None:
        manifest = _manifest_document(
            journal=args.journal,
            journal_digest=journal_digest,
            journal_size=final_stat.st_size,
            out=args.out,
            coordinator=rendered,
            records=records,
            namespace=args.namespace,
            module_prefix=args.shard_module_prefix,
            records_per_module=args.records_per_module,
            shards=shards,
        )
        args.manifest.parent.mkdir(parents=True, exist_ok=True)
        args.manifest.write_text(
            json.dumps(manifest, indent=2, sort_keys=True) + "\n",
            encoding="utf-8",
        )
    unit = "membership cores" if args.membership_core else "records"
    suffix = f" across {len(shards)} modules" if shards else ""
    print(
        f"wrote {args.out} with {len(records)} checked duplicate-center "
        f"{unit}{suffix}"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
