"""Export an authenticated five-omission run or successor as a typed Lean bank.

Only detector stages with a source-uniform Lean constructor are accepted.
Every emitted cut retains the certificate's complete four-point row choices,
so its `learnedClause` is the exact clause replayed from the journal.  The
output proves semantic validity of the stored cuts; it does not prove terminal
UNSAT, shard coverage, a universal lift, or closure of a live theorem.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import re
from collections import Counter
from pathlib import Path
from typing import Any

from census.global_confinement import cap_selected_nogood_certificate_probe as certs
from census.p97_search import export_generic_duplicate_center_bank as duplicate

from .source_faithful_five_omission_cegar import (
    FiveOmissionCegarError,
    _new_instance,
    _write_regular_bytes,
    learned_clause_for_certificate,
)
from .source_faithful_five_omission_lean_export import (
    AuthenticatedFiveOmissionRun,
    load_authenticated_run,
)
from .source_faithful_five_omission_successor_bank import (
    AuthenticatedFiveOmissionSuccessorBank,
    load_successor_bank,
)

DUPLICATE_STAGE = duplicate.STAGE
BISECTOR_STAGE = "equality-equilateral-bisector-collision"
EQUAL_K4_STAGE = "equality-equal-k4"
SUPPORTED_STAGES = frozenset({DUPLICATE_STAGE, BISECTOR_STAGE, EQUAL_K4_STAGE})
BISECTOR_FIELDS = ("pa_pb", "pa_pc", "pa_ab", "pa_ax", "pa_bx", "cx_ca")
EQUAL_K4_FIELDS = ("hp1p2", "hp1p3", "hp112", "hp113", "hp123")


def _full_row_terms(certificate: dict[str, Any]) -> list[str]:
    rows = certificate.get("rows")
    if not isinstance(rows, list) or not rows:
        raise FiveOmissionCegarError("certificate has no source rows")
    terms: list[str] = []
    for row in rows:
        if (
            not isinstance(row, dict)
            or set(row) != {"center", "exact", "support"}
            or row["exact"] is not False
        ):
            raise FiveOmissionCegarError("certificate source-row shape changed")
        support = row["support"]
        if not isinstance(support, list) or len(support) != 4:
            raise FiveOmissionCegarError(
                "terminal cut requires complete four-point source rows"
            )
        terms.append(
            "{ center := "
            + duplicate._lean_nat(row["center"])
            + ", support := "
            + duplicate._lean_finset(support)
            + " }"
        )
    return terms


def _validate_exact_clause(instance: Any, record: dict[str, Any]) -> None:
    certificate = record.get("certificate")
    if not isinstance(certificate, dict):
        raise FiveOmissionCegarError("record certificate is malformed")
    try:
        expected = list(learned_clause_for_certificate(instance, certificate))
    except ValueError as exc:
        raise FiveOmissionCegarError(
            "record certificate does not define a bound-model clause"
        ) from exc
    if record.get("learned_clause") != expected:
        raise FiveOmissionCegarError(
            "record learned clause differs from its complete source rows"
        )


def _duplicate_cut_lean(index: int, record: dict[str, Any]) -> str:
    rendered_record = dict(record)
    rendered_record.setdefault("iteration", record.get("index"))
    try:
        raw = duplicate._record_lean(index, rendered_record, membership_core=False)
    except (KeyError, TypeError, ValueError) as exc:
        raise FiveOmissionCegarError(
            f"duplicate-center record {index} cannot be rendered"
        ) from exc
    marker = f"def record{index} : DuplicateCenterNogood Label :="
    replacement = f"def duplicateData{index} : DuplicateCenterNogood Label :="
    if raw.count(marker) != 1:
        raise FiveOmissionCegarError("duplicate-center renderer shape changed")
    raw = raw.replace(marker, replacement, 1)
    return raw + f"""
theorem duplicateCheck{index} : duplicateData{index}.check = true := by
  native_decide

def cut{index} : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofDuplicateCenter
    duplicateData{index} duplicateCheck{index}
"""


def _bisector_cut_lean(index: int, record: dict[str, Any]) -> str:
    certificate = record.get("certificate")
    if not isinstance(certificate, dict):
        raise FiveOmissionCegarError("bisector certificate is malformed")
    try:
        valid = certs._validate_certificate(certificate, n=12)
    except (KeyError, TypeError, ValueError) as exc:
        raise FiveOmissionCegarError(
            f"bisector record {index} failed certificate replay"
        ) from exc
    if not valid or certificate.get("stage") != BISECTOR_STAGE:
        raise FiveOmissionCegarError(
            f"bisector record {index} failed certificate replay"
        )
    if certificate.get("side_conditions") != [
        {"kind": "injective-realization"}
    ]:
        raise FiveOmissionCegarError(
            f"bisector record {index} has unsupported side conditions"
        )
    paths = {path.get("field"): path for path in certificate["closure_paths"]}
    if len(paths) != len(BISECTOR_FIELDS) or set(paths) != set(BISECTOR_FIELDS):
        raise FiveOmissionCegarError(
            f"bisector record {index} has an unsupported path schema"
        )
    rows = _full_row_terms(certificate)
    core = certificate["core"]
    data_fields = {
        key: duplicate._lean_nat(core[key]) for key in ("p", "a", "b", "c", "x")
    }
    data_fields.update(
        {field: duplicate._lean_path(paths[field]) for field in BISECTOR_FIELDS}
    )
    data = "\n".join(
        f"    {field} := {value}" for field, value in data_fields.items()
    )
    choices = ",\n    ".join(rows)
    return f"""/-- Journal iteration {record.get('index')}; certificate
    {certificate['proof_sha256']}. -/
def bisectorChoices{index} : List (RowChoice Label) := [
    {choices}
  ]

def bisectorData{index} : EquilateralBisectorCollisionData Label := {{
{data} }}

theorem bisectorCheck{index} :
    bisectorData{index}.check bisectorChoices{index} = true := by
  native_decide

def cut{index} : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofEquilateralBisectorCertificate
    bisectorChoices{index} bisectorData{index} bisectorCheck{index}
"""


def _equal_k4_cut_lean(index: int, record: dict[str, Any]) -> str:
    certificate = record.get("certificate")
    if not isinstance(certificate, dict):
        raise FiveOmissionCegarError("equal-K4 certificate is malformed")
    try:
        valid = certs._validate_certificate(certificate, n=12)
    except (KeyError, TypeError, ValueError) as exc:
        raise FiveOmissionCegarError(
            f"equal-K4 record {index} failed certificate replay"
        ) from exc
    if not valid or certificate.get("stage") != EQUAL_K4_STAGE:
        raise FiveOmissionCegarError(
            f"equal-K4 record {index} failed certificate replay"
        )
    if certificate.get("side_conditions") != [
        {"kind": "injective-realization"}
    ]:
        raise FiveOmissionCegarError(
            f"equal-K4 record {index} has unsupported side conditions"
        )
    paths = {path.get("field"): path for path in certificate["closure_paths"]}
    if len(paths) != len(EQUAL_K4_FIELDS) or set(paths) != set(EQUAL_K4_FIELDS):
        raise FiveOmissionCegarError(
            f"equal-K4 record {index} has an unsupported path schema"
        )
    points = certificate.get("core", {}).get("points")
    if not isinstance(points, list) or len(points) != 4:
        raise FiveOmissionCegarError(
            f"equal-K4 record {index} has an unsupported point schema"
        )
    rows = _full_row_terms(certificate)
    data_fields = {
        field: duplicate._lean_nat(point)
        for field, point in zip(("p", "t1", "t2", "t3"), points, strict=True)
    }
    data_fields.update(
        {field: duplicate._lean_path(paths[field]) for field in EQUAL_K4_FIELDS}
    )
    data = "\n".join(
        f"    {field} := {value}" for field, value in data_fields.items()
    )
    choices = ",\n    ".join(rows)
    return f"""/-- Journal iteration {record.get('index')}; certificate
    {certificate['proof_sha256']}. -/
def equalK4Choices{index} : List (RowChoice Label) := [
    {choices}
  ]

def equalK4Data{index} : EqualK4Data Label := {{
{data} }}

theorem equalK4Check{index} :
    equalK4Data{index}.check equalK4Choices{index} = true := by
  native_decide

def cut{index} : SourceOrderPositiveNogood :=
  SourceOrderPositiveNogood.ofEqualK4Certificate
    equalK4Choices{index} equalK4Data{index} equalK4Check{index}
"""


def _cut_obligations_lean(index: int, record: dict[str, Any]) -> str:
    learned_clause = record.get("learned_clause")
    if not isinstance(learned_clause, list) or not all(
        isinstance(literal, int) and not isinstance(literal, bool)
        for literal in learned_clause
    ):
        raise FiveOmissionCegarError("record learned clause is malformed")
    clause = "[" + ", ".join(str(literal) for literal in learned_clause) + "]"
    return f"""
/-- Kernel-checked agreement with this record's authenticated journal clause. -/
theorem cut{index}_learnedClause_eq :
    SafeCoverIndexBridge.learnedClause cut{index}.choices = {clause} := by
  native_decide

/-- Every concrete row choice in this cut occurs in the frozen candidate table. -/
theorem cut{index}_encodable :
    ∀ choice ∈ cut{index}.choices,
      FrozenSafeCandidateAt choice.center choice.support := by
  native_decide
"""


def _bank_encodability_lean(record_count: int) -> str:
    if record_count == 0:
        proof = "  simp [bank]"
    else:
        lines = [
            "  intro nogood hnogood",
            "  simp only [bank, List.mem_cons] at hnogood",
        ]
        for index in range(record_count - 1):
            lines.extend(
                [
                    "  rcases hnogood with rfl | hnogood",
                    f"  · exact cut{index}_encodable",
                ]
            )
        lines.extend(
            [
                "  rcases hnogood with rfl | hnogood",
                f"  · exact cut{record_count - 1}_encodable",
                "  · simp at hnogood",
            ]
        )
        proof = "\n".join(lines)
    return f"""set_option maxRecDepth 4096 in
/-- Consumer-ready encodability premise for the terminal bank theorem.
The scoped recursion budget is for this generated {record_count}-arm membership
proof only. -/
theorem bank_encodable :
    ∀ nogood ∈ bank, ∀ choice ∈ nogood.choices,
      FrozenSafeCandidateAt choice.center choice.support := by
{proof}
"""


def _select_supported_records(
    records: tuple[dict[str, Any], ...], limit: int | None
) -> tuple[dict[str, Any], ...]:
    if limit is not None and limit <= 0:
        raise ValueError("limit must be positive")
    selected = records if limit is None else records[:limit]
    unsupported = sorted(
        {record.get("detector_stage") for record in selected}
        - SUPPORTED_STAGES,
        key=str,
    )
    if unsupported:
        raise FiveOmissionCegarError(
            f"terminal bank contains unsupported detector stages: {unsupported}"
        )
    return selected


def records_for_terminal_bank(
    run: AuthenticatedFiveOmissionRun, limit: int | None = None
) -> tuple[dict[str, Any], ...]:
    return _select_supported_records(run.bootstrap_records + run.records, limit)


def records_for_successor_terminal_bank(
    bank: AuthenticatedFiveOmissionSuccessorBank,
    limit: int | None = None,
) -> tuple[dict[str, Any], ...]:
    """Select the separately authenticated bootstrap and local layers."""

    records = _select_supported_records(
        bank.bootstrap.records + bank.local_records, limit
    )
    if limit is None:
        projected_clauses = tuple(
            tuple(record["learned_clause"]) for record in records
        )
        if projected_clauses != bank.derived_clauses:
            raise FiveOmissionCegarError(
                "successor terminal records do not project to derived clauses"
            )
    return records


def _render_terminal_bank(
    deleted_label: int,
    records: tuple[dict[str, Any], ...],
    namespace: str,
    provenance: str,
) -> str:
    if not re.fullmatch(r"[A-Za-z_][A-Za-z0-9_.]*", namespace):
        raise ValueError(f"invalid Lean namespace: {namespace}")
    instance = _new_instance(deleted_label)
    declarations: list[str] = []
    for index, record in enumerate(records):
        _validate_exact_clause(instance, record)
        stage = record["detector_stage"]
        if stage == DUPLICATE_STAGE:
            cut_source = _duplicate_cut_lean(index, record)
        elif stage == BISECTOR_STAGE:
            cut_source = _bisector_cut_lean(index, record)
        elif stage == EQUAL_K4_STAGE:
            cut_source = _equal_k4_cut_lean(index, record)
        else:  # Guard against callers bypassing records_for_terminal_bank.
            raise FiveOmissionCegarError(f"unsupported detector stage: {stage}")
        declarations.append(cut_source + _cut_obligations_lean(index, record))
    names = ", ".join(f"cut{index}" for index in range(len(records)))
    stage_counts = Counter(record["detector_stage"] for record in records)
    count_comment = ", ".join(
        f"{stage}={count}" for stage, count in sorted(stage_counts.items())
    )
    declarations_source = "\n".join(declarations)
    encodability_source = _bank_encodability_lean(len(records))
    return f"""import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221FiveOmissionTerminalBankConsumer

/-!
{provenance}
Authenticated records emitted: {len(records)} ({count_comment})

Every item is a source-uniform typed cut with its exact four-row CNF choices.
This is not a terminal UNSAT, coverage, universal-lift, or live-closure proof.
-/

namespace {namespace}

open Problem97.Census554.EqualityCore
open Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate
open Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress
open Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress.SourceOrderTerminalBankConsumer
open Problem97.ATailFrontierLiveClosure.ExactTwelveRigid221Ingress.FiveOmissionTerminalBankConsumer
open scoped EuclideanGeometry

abbrev Label := Fin 12

{declarations_source}
def bank : List SourceOrderPositiveNogood := [{names}]

{encodability_source}

end {namespace}
"""


def render_terminal_bank(
    run: AuthenticatedFiveOmissionRun,
    records: tuple[dict[str, Any], ...],
    namespace: str,
) -> str:
    shared_bank = run.summary.get("shared_bank")
    shared_bank_document_sha256 = (
        shared_bank.get("document_sha256")
        if isinstance(shared_bank, dict) and shared_bank.get("enabled") is True
        else None
    )
    generated_from = (
        "Generated from authenticated bootstrap plus "
        f"{run.workdir.as_posix()}/journal.jsonl"
    )
    provenance = "\n".join(
        (
            generated_from,
            f"Shared-bank document SHA-256: {shared_bank_document_sha256}",
            f"Journal SHA-256: {run.journal_artifact['sha256']}",
            f"Authenticated bootstrap records: {len(run.bootstrap_records)}",
            f"Authenticated local records: {len(run.records)}",
        )
    )
    return _render_terminal_bank(
        run.deleted_label, records, namespace, provenance
    )


def render_successor_terminal_bank(
    bank: AuthenticatedFiveOmissionSuccessorBank,
    deleted_label: int,
    records: tuple[dict[str, Any], ...],
    namespace: str,
) -> str:
    expected_records = records_for_successor_terminal_bank(bank, len(records))
    if records != expected_records:
        raise FiveOmissionCegarError(
            "successor terminal records are not the canonical bank prefix"
        )
    provenance = "\n".join(
        (
            f"Generated from authenticated successor {bank.path.name}",
            f"Successor artifact SHA-256: {bank.artifact_sha256}",
            f"Successor document SHA-256: {bank.document_sha256}",
            f"Shared-bank document SHA-256: {bank.bootstrap.document_sha256}",
            f"Authenticated bootstrap records: {len(bank.bootstrap.records)}",
            f"Authenticated local records: {len(bank.local_records)}",
            f"Derived clause-list SHA-256: {bank.derived_clause_list_sha256}",
        )
    )
    return _render_terminal_bank(deleted_label, records, namespace, provenance)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--repo-root", type=Path, default=Path.cwd())
    source_group = parser.add_mutually_exclusive_group(required=True)
    source_group.add_argument("--workdir", type=Path)
    source_group.add_argument("--successor-bank", type=Path)
    parser.add_argument("--bootstrap-bank", type=Path)
    parser.add_argument("--deleted-label", type=int, required=True)
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument("--limit", type=int)
    parser.add_argument(
        "--namespace",
        default=(
            "Problem97.ATailFrontierLiveClosure."
            "ExactTwelveFiveOmissionTypedTerminalBank"
        ),
    )
    parser.add_argument("--manifest", type=Path)
    args = parser.parse_args()

    if args.successor_bank is not None:
        if args.bootstrap_bank is None:
            parser.error("--successor-bank requires --bootstrap-bank")
        bank = load_successor_bank(
            args.successor_bank,
            args.bootstrap_bank,
            _new_instance(args.deleted_label),
        )
        records = records_for_successor_terminal_bank(bank, args.limit)
        source = render_successor_terminal_bank(
            bank, args.deleted_label, records, args.namespace
        )
        manifest_schema = "p97_source_faithful_five_omission_typed_bank.v3"
        manifest_source = {
            "successor_bank": args.successor_bank.as_posix(),
            "successor_artifact_sha256": bank.artifact_sha256,
            "successor_artifact_bytes": bank.artifact_bytes,
            "successor_document_sha256": bank.document_sha256,
            "deleted_label": args.deleted_label,
            "shared_bank_document_sha256": bank.bootstrap.document_sha256,
            "shared_bank_clause_list_sha256": (
                bank.bootstrap.bootstrap_clause_list_sha256
            ),
            "authenticated_bootstrap_record_count": len(bank.bootstrap.records),
            "authenticated_local_record_count": len(bank.local_records),
            "authenticated_record_count": len(bank.bootstrap.records)
            + len(bank.local_records),
            "emitted_record_count": len(records),
            "local_clause_list_sha256": bank.local_clause_list_sha256,
            "derived_clause_list_sha256": bank.derived_clause_list_sha256,
        }
    else:
        if args.bootstrap_bank is not None:
            parser.error("--bootstrap-bank is only valid with --successor-bank")
        assert args.workdir is not None
        run = load_authenticated_run(
            args.repo_root, args.workdir, args.deleted_label
        )
        records = records_for_terminal_bank(run, args.limit)
        source = render_terminal_bank(run, records, args.namespace)
        manifest_schema = "p97_source_faithful_five_omission_typed_bank.v2"
        manifest_source = {
            "run_summary": (run.workdir / "summary.json").as_posix(),
            "run_summary_sha256": run.summary_artifact["sha256"],
            "journal": (run.workdir / "journal.jsonl").as_posix(),
            "journal_sha256": run.journal_artifact["sha256"],
            "journal_bytes": run.journal_artifact["bytes"],
            "deleted_label": run.deleted_label,
            "shared_bank_document_sha256": run.summary["shared_bank"][
                "document_sha256"
            ],
            "shared_bank_clause_list_sha256": run.summary["shared_bank"][
                "bootstrap_clause_list_sha256"
            ],
            "authenticated_bootstrap_record_count": len(run.bootstrap_records),
            "authenticated_local_record_count": len(run.records),
            "authenticated_record_count": len(run.bootstrap_records)
            + len(run.records),
            "emitted_record_count": len(records),
            "terminal_record_sha256": run.terminal_record_sha256,
            "formula_contract_sha256": run.summary["formula_contract_sha256"],
            "detector_contract_sha256": run.summary["detector_contract_sha256"],
        }
    args.out.parent.mkdir(parents=True, exist_ok=True)
    _write_regular_bytes(args.out, source.encode("utf-8"), create=True)

    if args.manifest is not None:
        stage_counts = Counter(record["detector_stage"] for record in records)
        manifest = {
            "schema": manifest_schema,
            "scope": "typed cut validity only; no terminal UNSAT or coverage",
            "source": manifest_source,
            "stage_counts": dict(sorted(stage_counts.items())),
            "output": {
                "path": args.out.as_posix(),
                "bytes": len(source.encode("utf-8")),
                "sha256": hashlib.sha256(source.encode("utf-8")).hexdigest(),
            },
        }
        args.manifest.parent.mkdir(parents=True, exist_ok=True)
        _write_regular_bytes(
            args.manifest,
            json.dumps(manifest, indent=2, sort_keys=True).encode("utf-8") + b"\n",
            create=True,
        )

    print(
        f"wrote {args.out} with {len(records)} authenticated typed source cuts"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
