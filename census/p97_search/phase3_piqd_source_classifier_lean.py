# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

"""Emit typed Lean provenance for one finite-local source classifier.

The input must satisfy the complete v2 source-classifier validator.  The
generated certificate is kernel-checked against the pre-existing record, but
the emitted hashes are metadata: Lean does not authenticate the JSON from them.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import lzma
import os
import re
import tempfile
from collections.abc import Mapping, Sequence
from dataclasses import dataclass
from pathlib import Path
from typing import Any

from census.p97_search.phase3_piqd_exact12_replay import (
    Exact12PiqdReplayError,
    validate_source_duplicate_center_classifier,
)

DEFAULT_NAMESPACE = (
    "Problem97.ATailFrontierLiveClosure.ExactTwelveSourceDuplicateCenter0000"
)
_PATH_FIELDS = ("ap_aq", "ap_ar", "bp_bq", "bp_br")
_DIGEST_FIELDS = (
    ("modelSha256", "model_sha256"),
    ("sourceJobSha256", "source_job_sha256"),
    ("discoveryCnfSha256", "discovery_cnf_sha256"),
    ("sourceBundleSha256", "source_bundle_sha256"),
    ("cubeSha256", "cube_sha256"),
    ("detectorContractSha256", "detector_contract_sha256"),
    ("certificateSha256", "certificate_sha256"),
    ("selectedPositiveVariablesSha256", "selected_positive_variables_sha256"),
)
_NAMESPACE_PART = re.compile(r"[A-Za-z][A-Za-z0-9_]*\Z")
_MAX_CLASSIFIER_BYTES = 2 * 1024 * 1024


class SourceClassifierLeanError(ValueError):
    """A source classifier cannot be emitted as the finite Lean obstruction."""


@dataclass(frozen=True)
class RowData:
    center: int
    support: tuple[int, ...]


@dataclass(frozen=True)
class StepData:
    kind: str
    first: int
    second: int
    center: int | None = None


@dataclass(frozen=True)
class PathData:
    first: tuple[int, int]
    steps: tuple[StepData, ...]
    last: tuple[int, int]


@dataclass(frozen=True)
class ClassifierData:
    classifier_sha256: str
    digests: tuple[tuple[str, str], ...]
    rows: tuple[RowData, ...]
    triple: tuple[int, int, int]
    centers: tuple[int, int]
    paths: tuple[PathData, ...]


def _canonical_json_sha256(value: Mapping[str, Any]) -> str:
    raw = json.dumps(
        value,
        ensure_ascii=False,
        sort_keys=True,
        separators=(",", ":"),
    ).encode("utf-8")
    return hashlib.sha256(raw).hexdigest()


def _strict_json(raw: bytes, *, source: str) -> Mapping[str, Any]:
    def reject_constant(value: str) -> None:
        raise ValueError(f"nonstandard JSON constant: {value}")

    def reject_duplicates(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
        result: dict[str, Any] = {}
        for key, value in pairs:
            if key in result:
                raise ValueError(f"duplicate object key: {key}")
            result[key] = value
        return result

    try:
        value = json.loads(
            raw,
            parse_constant=reject_constant,
            object_pairs_hook=reject_duplicates,
        )
    except (UnicodeDecodeError, json.JSONDecodeError, ValueError) as error:
        raise SourceClassifierLeanError(f"{source} is not strict JSON") from error
    if not isinstance(value, Mapping):
        raise SourceClassifierLeanError(f"{source} must contain a JSON object")
    return value


def _label(value: Any, *, field: str) -> int:
    if isinstance(value, bool) or not isinstance(value, int) or not 0 <= value < 12:
        raise SourceClassifierLeanError(f"{field} is not a label in Fin 12")
    return value


def _edge(value: Any, *, field: str) -> tuple[int, int]:
    if not isinstance(value, list) or len(value) != 2:
        raise SourceClassifierLeanError(f"{field} is not an edge")
    return (
        _label(value[0], field=f"{field}[0]"),
        _label(value[1], field=f"{field}[1]"),
    )


def _parse_step(value: Any, *, field: str) -> StepData:
    if not isinstance(value, Mapping):
        raise SourceClassifierLeanError(f"{field} is not a step object")
    kind = value.get("kind")
    if kind == "row" and set(value) == {"kind", "center", "first", "second"}:
        return StepData(
            kind="row",
            center=_label(value["center"], field=f"{field}.center"),
            first=_label(value["first"], field=f"{field}.first"),
            second=_label(value["second"], field=f"{field}.second"),
        )
    if kind == "flip" and set(value) == {"kind", "first", "second"}:
        return StepData(
            kind="flip",
            first=_label(value["first"], field=f"{field}.first"),
            second=_label(value["second"], field=f"{field}.second"),
        )
    raise SourceClassifierLeanError(f"{field} has an unsupported step shape")


def _parse_path(value: Any, *, field: str) -> PathData:
    if not isinstance(value, Mapping) or not isinstance(value.get("steps"), list):
        raise SourceClassifierLeanError(f"{field} is not a closure path")
    return PathData(
        first=_edge(value.get("first"), field=f"{field}.first"),
        steps=tuple(
            _parse_step(step, field=f"{field}.steps[{index}]")
            for index, step in enumerate(value["steps"])
        ),
        last=_edge(value.get("last"), field=f"{field}.last"),
    )


def _parse_validated_classifier(value: Mapping[str, Any]) -> ClassifierData:
    certificate = value["certificate"]
    if not isinstance(certificate, Mapping):
        raise SourceClassifierLeanError("certificate is not an object")

    raw_rows = certificate.get("rows")
    if not isinstance(raw_rows, list) or not raw_rows:
        raise SourceClassifierLeanError("certificate rows are missing")
    rows: list[RowData] = []
    for index, row in enumerate(raw_rows):
        if not isinstance(row, Mapping) or row.get("exact") is not False:
            raise SourceClassifierLeanError(
                f"certificate.rows[{index}] must have exact=false"
            )
        support = row.get("support")
        if not isinstance(support, list):
            raise SourceClassifierLeanError(
                f"certificate.rows[{index}].support is not a list"
            )
        rows.append(
            RowData(
                center=_label(
                    row.get("center"), field=f"certificate.rows[{index}].center"
                ),
                support=tuple(
                    _label(point, field=f"certificate.rows[{index}].support")
                    for point in support
                ),
            )
        )

    core = certificate.get("core")
    if not isinstance(core, Mapping):
        raise SourceClassifierLeanError("certificate core is missing")
    triple_value = core.get("triple")
    centers_value = core.get("centers")
    if not isinstance(triple_value, list) or len(triple_value) != 3:
        raise SourceClassifierLeanError("certificate core triple is malformed")
    if not isinstance(centers_value, list) or len(centers_value) != 2:
        raise SourceClassifierLeanError("certificate core centers are malformed")
    triple = tuple(
        _label(point, field=f"certificate.core.triple[{index}]")
        for index, point in enumerate(triple_value)
    )
    centers = tuple(
        _label(point, field=f"certificate.core.centers[{index}]")
        for index, point in enumerate(centers_value)
    )

    raw_paths = certificate.get("closure_paths")
    if not isinstance(raw_paths, list):
        raise SourceClassifierLeanError("certificate closure paths are missing")
    path_by_field: dict[str, Mapping[str, Any]] = {}
    for path in raw_paths:
        if not isinstance(path, Mapping) or path.get("field") not in _PATH_FIELDS:
            raise SourceClassifierLeanError("certificate closure path field is invalid")
        path_field = str(path["field"])
        if path_field in path_by_field:
            raise SourceClassifierLeanError(
                "certificate closure path field is duplicated"
            )
        path_by_field[path_field] = path
    if set(path_by_field) != set(_PATH_FIELDS):
        raise SourceClassifierLeanError(
            "certificate closure path fields are incomplete"
        )

    return ClassifierData(
        classifier_sha256=_canonical_json_sha256(value),
        digests=tuple(
            (lean_name, str(value[field])) for lean_name, field in _DIGEST_FIELDS
        ),
        rows=tuple(rows),
        triple=(triple[0], triple[1], triple[2]),
        centers=(centers[0], centers[1]),
        paths=tuple(
            _parse_path(path_by_field[field], field=f"certificate.{field}")
            for field in _PATH_FIELDS
        ),
    )


def _read_classifier_bytes(path: Path) -> bytes:
    """Read raw JSON or one bounded, non-concatenated xz stream."""

    try:
        raw = path.read_bytes()
    except OSError as error:
        raise SourceClassifierLeanError(
            f"cannot read classifier {path}: {error}"
        ) from error

    if path.suffix != ".xz":
        if len(raw) > _MAX_CLASSIFIER_BYTES:
            raise SourceClassifierLeanError(
                f"classifier exceeds {_MAX_CLASSIFIER_BYTES} decoded bytes"
            )
        return raw

    try:
        decoder = lzma.LZMADecompressor(format=lzma.FORMAT_XZ)
        decoded = decoder.decompress(raw, max_length=_MAX_CLASSIFIER_BYTES + 1)
    except (lzma.LZMAError, OSError) as error:
        raise SourceClassifierLeanError(
            f"{path} is not a valid single-stream xz classifier"
        ) from error
    if len(decoded) > _MAX_CLASSIFIER_BYTES:
        raise SourceClassifierLeanError(
            f"classifier exceeds {_MAX_CLASSIFIER_BYTES} decoded bytes"
        )
    if not decoder.eof:
        raise SourceClassifierLeanError(
            f"{path} is a truncated or invalid single-stream xz classifier"
        )
    if decoder.unused_data:
        raise SourceClassifierLeanError(
            f"{path} has trailing data or concatenated xz streams"
        )
    return decoded


def load_classifier(path: Path) -> ClassifierData:
    """Strictly read, validate, and normalize one v2 classifier."""

    raw = _read_classifier_bytes(path)
    value = _strict_json(raw, source=str(path))
    try:
        validate_source_duplicate_center_classifier(value)
    except (Exact12PiqdReplayError, KeyError, TypeError, ValueError) as error:
        raise SourceClassifierLeanError(
            f"classifier validation failed: {error}"
        ) from error
    return _parse_validated_classifier(value)


def _lean_string(value: str) -> str:
    escaped: list[str] = []
    for character in value:
        if character == '"':
            escaped.append('\\"')
        elif character == "\\":
            escaped.append("\\\\")
        elif character == "\n":
            escaped.append("\\n")
        elif character == "\r":
            escaped.append("\\r")
        elif character == "\t":
            escaped.append("\\t")
        elif ord(character) < 0x20 or ord(character) == 0x7F:
            escaped.append(f"\\u{{{ord(character):x}}}")
        else:
            escaped.append(character)
    return '"' + "".join(escaped) + '"'


def _namespace_parts(namespace: str) -> list[str]:
    parts = namespace.split(".")
    if (
        len(parts) < 2
        or parts[0] != "Problem97"
        or any(_NAMESPACE_PART.fullmatch(part) is None for part in parts)
    ):
        raise SourceClassifierLeanError(
            "generated namespace must be a dotted identifier under Problem97"
        )
    return parts


def _render_path(path: PathData, *, indent: str) -> list[str]:
    lines = [
        f"{indent}{{ first := ({path.first[0]}, {path.first[1]})",
        f"{indent}  steps :=",
    ]
    if path.steps:
        lines.append(f"{indent}    [")
        for index, step in enumerate(path.steps):
            comma = "," if index + 1 < len(path.steps) else ""
            if step.kind == "row":
                lines.append(
                    f"{indent}      .row {step.center} {step.first} {step.second}{comma}"
                )
            else:
                lines.append(f"{indent}      .flip {step.first} {step.second}{comma}")
        lines.append(f"{indent}    ]")
    else:
        lines.append(f"{indent}    []")
    lines.append(f"{indent}  last := ({path.last[0]}, {path.last[1]}) }}")
    return lines


def render_module(data: ClassifierData, *, namespace: str = DEFAULT_NAMESPACE) -> str:
    """Render a deterministic finite-local checked Lean module."""

    parts = _namespace_parts(namespace)
    p, q, r = data.triple
    a, b = data.centers
    lines = [
        "/-",
        "Copyright (c) 2026 Adam McKenna. All rights reserved.",
        "Released under Apache 2.0 license as described in the file LICENSE.",
        "Authors: Adam McKenna",
        "-/",
        "",
        "import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveV14DuplicateCenterCanary",
        "",
        "/-!",
        "# Typed provenance for one exact-twelve PIQD source classifier",
        "",
        "This generated module records one externally validated source classifier and",
        "kernel-checks that its typed certificate is the pre-existing normalized-v14",
        "`ExactTwelveV14DuplicateCenterCanary.record0`. The logical obstruction and its",
        "conditional source consumers therefore predate this generated provenance map.",
        "",
        "The SHA-256 strings below are provenance metadata, not kernel authentication",
        "of the classifier JSON. This module proves no aggregate coverage, universal",
        "lift, live-spine closure, or executed-byte provenance claim.",
        "-/",
        "",
    ]
    lines.extend(f"namespace {part}" for part in parts)
    lines.extend(
        [
            "",
            "open Census554.EqualityCore",
            "open Problem97.ATailFrontierLiveClosure.GenericRowNogoodCertificate",
            "open scoped EuclideanGeometry",
            "",
            "/-- The finite label type of this local source record. -/",
            "abbrev Label := Fin 12",
            "",
            "/-- Canonical JSON hash of the validated source classifier. -/",
            f"def canonicalClassifierSha256 : String := {_lean_string(data.classifier_sha256)}",
        ]
    )
    for lean_name, digest in data.digests:
        lines.append(f"def {lean_name} : String := {_lean_string(digest)}")
    lines.extend(
        [
            "",
            "/-- The captured detector sources are not authenticated as executed bytes. -/",
            "def executedByteProvenance : Bool := false",
            "/-- This one obstruction does not establish schedule coverage. -/",
            "def aggregateCoverage : Bool := false",
            "/-- This finite normalized record has no proved universal lift. -/",
            "def universalLift : Bool := false",
            "/-- The classifier metadata does not claim Lean theorem closure. -/",
            "def leanTheoremClosure : Bool := false",
            "",
            "/-- Selected positive row incidences used by the closure certificate. -/",
            "def positiveRowChoices : List (RowChoice Label) :=",
            "  [",
        ]
    )
    for index, row in enumerate(data.rows):
        comma = "," if index + 1 < len(data.rows) else ""
        support = ", ".join(str(point) for point in row.support)
        lines.append(
            f"    {{ center := {row.center}, support := {{{support}}} }}{comma}"
        )
    lines.extend(
        [
            "  ]",
            "",
            "/-- Equality-closure data for the recorded duplicate-center core. -/",
            "def duplicateCenterData : DuplicateCenterData Label :=",
            f"  {{ p := {p}",
            f"    q := {q}",
            f"    r := {r}",
            f"    a := {a}",
            f"    b := {b}",
        ]
    )
    for field, path in zip(_PATH_FIELDS, data.paths, strict=True):
        lines.append(f"    {field} :=")
        lines.extend(_render_path(path, indent="      "))
    lines.extend(
        [
            "  }",
            "",
            "/-- The classifier's typed finite-local source record. -/",
            "def sourceNogood : DuplicateCenterNogood Label :=",
            "  { choices := positiveRowChoices",
            "    data := duplicateCenterData }",
            "",
            "/-- The recorded positive incidences compose to a duplicate-center core. -/",
            "theorem sourceNogood_check :",
            "    sourceNogood.check = true := by",
            "  decide",
            "",
            "/-- Kernel-checked content mapping from the validated classifier to the",
            "pre-existing canary record. The SHA-256 strings remain metadata. -/",
            "theorem sourceNogood_eq_existingRecord0 :",
            "    sourceNogood =",
            "      ExactTwelveRigid221Ingress.ExactTwelveV14DuplicateCenterCanary.record0 := by",
            "  decide",
            "",
            "set_option maxRecDepth 100000 in",
            "/-- The classifier rows encode the pre-existing learned blocking clause.",
            "This computes only the local clause; it does not show that any source",
            "assignment falsifies it. -/",
            "theorem sourceNogood_learnedClause :",
            "    ExactTwelveRigid221Ingress.SafeCoverIndexBridge.learnedClause",
            "        sourceNogood.choices =",
            "      [-6, -55, -155, -175, -525] := by",
            "  decide",
            "",
            "/-- Any exact-twelve row pattern containing these positive incidences has",
            "no injective planar realization. This restates the pre-existing finite-local",
            "obstruction; it is not a coverage or live-spine theorem. -/",
            "theorem not_realizes_of_positiveMatches {P : RowPattern Label}",
            "    (hpositive : sourceNogood.PositivelyMatches P) :",
            "    ¬ (∃ pointOf : Label → ℝ², Realizes P pointOf) :=",
            "  sourceNogood.not_realizes_of_positiveCheck",
            "    sourceNogood_check hpositive",
            "",
        ]
    )
    lines.extend(f"end {part}" for part in reversed(parts))
    return "\n".join(lines) + "\n"


def _parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("classifier", type=Path, help="validated v2 classifier JSON")
    parser.add_argument("output", type=Path, help="generated Lean module")
    parser.add_argument("--namespace", default=DEFAULT_NAMESPACE)
    parser.add_argument(
        "--check",
        action="store_true",
        help="fail unless the existing output is byte-for-byte current",
    )
    return parser


def main(argv: Sequence[str] | None = None) -> int:
    args = _parser().parse_args(argv)
    try:
        data = load_classifier(args.classifier)
        rendered = render_module(data, namespace=args.namespace)
    except SourceClassifierLeanError as error:
        raise SystemExit(str(error)) from error

    output = args.output.resolve()
    if args.check:
        try:
            existing = output.read_text(encoding="utf-8")
        except OSError as error:
            raise SystemExit(
                f"cannot read generated output {output}: {error}"
            ) from error
        if existing != rendered:
            raise SystemExit(f"generated output is stale: {output}")
        print(f"PASS {output}")
        return 0

    output.parent.mkdir(parents=True, exist_ok=True)
    temporary_path: Path | None = None
    try:
        with tempfile.NamedTemporaryFile(
            "w",
            encoding="utf-8",
            dir=output.parent,
            prefix=f".{output.name}.",
            suffix=".tmp",
            delete=False,
        ) as temporary:
            temporary.write(rendered)
            temporary.flush()
            os.fsync(temporary.fileno())
            temporary_path = Path(temporary.name)
        temporary_path.replace(output)
    finally:
        if temporary_path is not None and temporary_path.exists():
            temporary_path.unlink()
    print(
        f"WROTE {output} classifier_sha256={data.classifier_sha256} "
        f"rows={len(data.rows)}"
    )
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
