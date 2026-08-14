"""Fail-closed validator for the isolated exact-17 Child45 export.

The four successor clauses are Lean-owned.  This validator only authenticates
the exporter output, preserves the authenticated Child44 clause prefix, and
checks the already-completed Child44 model/custody record against the new
suffix.  It does not run Lean or a solver.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import stat
from dataclasses import dataclass
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[1]
VARIABLES = 308
PARENT_CLAUSES = 5_848_820
PARENT_BYTES = 291_704_790
NEW_CLAUSES = 4
CHILD_CLAUSES = 5_848_824
CHILD_BYTES = 291_704_992
PARENT_SHA256 = "17f1c9c48e25aa887cbf80d9de31e0d9b0de089c7eca1b3968dbbe1e35494af9"
CHILD_SHA256 = "3a2552fd7ecf7bce037563fec4d4ab0772cdab72d516b10ab1025d159d9f20e2"
MODEL_SHA256 = "2cac1222fb5f265b91499e6ae075c5b19d600c357f5e3d4ae561c4058d13801a"
FINAL_SHA256 = "b16aa0a0440180dc4187167ba0152c22ff47d68325406aa6664ff3a0e7a26efa"
MODEL_MANIFEST_SHA256 = "152570011046aee180b6d385f731fa13911dc9800bfc393dc87ad386cd031048"
MODEL_JOB_ID = "f717c352-2456-412a-ae45-d910f47d3e94"
IDENTITY_HASH = "97825c01cb69aed6c8eceaa6e32ff7ebc0c328dfebe4406ee7dcc204f35c82a2"
LEAN_ROOT_SHA256 = "f9238553222414f52c2282ccdda7764506e69aef4eca710263d7bd6930b6d7f2"
LEAN_EXPORT_SHA256 = "d2eb848ccd9ca3138d3bc97c35dee2f51f7546edfefed54104a21bd84b18ba38"
ORDERED_SUFFIX_SHA256 = "7b0518974d2dba962d45a97c193c69b2e970b46979b5471ea8c7b50eca595590"
ATail = ROOT / "lean/Erdos9796Proof/P97/ATail"
LEAN_ROOT_PATH = ATail / "BlockerVExactSeventeenFortyFourthModelRefinements.lean"
LEAN_EXPORT_PATH = ATail / "BlockerVExactSeventeenFortyFourthModelRefinementsExport.lean"
PARENT_PATH = ROOT / "scratch/exact17-lean-to-sat/exact17-forty-fourth-root-forty-third-model-refinements.cnf"
CHILD_PATH = ROOT / "scratch/exact17-lean-to-sat/exact17-forty-fifth-root-forty-fourth-model-refinements.cnf"
MODEL_PATH = ROOT / "scratch/exact17-lean-to-sat/piqd-child44-core1-custody-model.json"
FINAL_PATH = ROOT / "scratch/exact17-lean-to-sat/piqd-child44-core1-custody-final.json"
RECEIPT_PATH = ROOT / "scratch/exact17-lean-to-sat/child45-export-receipt.json"
Clause = tuple[int, ...]

# occurrenceClauses(cancellationOccurrence.hits), in Lean's named-order then
# forward/reverse enumeration.  The corresponding source theorem proves each
# clause valid for every SourceRealization; this Python record never authors a
# replacement clause.
EXPECTED_SUFFIX: tuple[Clause, ...] = (
    (-307, -10, -3, -143, -141, -154, -156, -44, -39, -52, -58),
    (-307, -242, -241, -31, -28, -66, -54, -38, -45, -168, -167),
    (-308, -13, -3, -143, -141, -205, -207, -47, -39, -52, -58),
    (-308, -242, -241, -31, -28, -66, -54, -38, -45, -219, -218),
)
MODEL_REJECTED_SUFFIX_INDICES = (3,)
EXPECTED_PARENT_SUBSUMED_SUFFIX_INDICES = (1,)


class UnprovisionedError(ValueError):
    """An authenticated Child44 prerequisite or export pin is incomplete."""


@dataclass(frozen=True)
class ExportSpec:
    publication_state: str = "PROVISIONED"
    child_sha256: str | None = CHILD_SHA256
    child_bytes: int | None = CHILD_BYTES
    parent_sha256: str = PARENT_SHA256
    parent_bytes: int = PARENT_BYTES
    parent_clauses: int = PARENT_CLAUSES
    model_sha256: str = MODEL_SHA256
    model_manifest_sha256: str = MODEL_MANIFEST_SHA256
    model_job_id: str = MODEL_JOB_ID
    final_sha256: str | None = FINAL_SHA256
    lean_root_sha256: str | None = LEAN_ROOT_SHA256
    lean_export_sha256: str | None = LEAN_EXPORT_SHA256
    child_clauses: int = CHILD_CLAUSES

    @property
    def provisioned(self) -> bool:
        return self.publication_state == "PROVISIONED" and all(
            value is not None
            for value in (self.child_sha256, self.child_bytes, self.final_sha256,
                          self.lean_root_sha256, self.lean_export_sha256)
        )


PRODUCTION_SPEC = ExportSpec()


def strict_object(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    value: dict[str, Any] = {}
    for key, item in pairs:
        if key in value:
            raise ValueError(f"duplicate JSON key: {key}")
        value[key] = item
    return value


def strict_json_loads(raw: bytes) -> Any:
    return json.loads(raw, object_pairs_hook=strict_object)


def _open_regular(path: Path, label: str) -> int:
    absolute = Path(os.path.abspath(path))
    flags = os.O_RDONLY | getattr(os, "O_DIRECTORY", 0) | getattr(os, "O_NOFOLLOW", 0)
    descriptor: int | None = None
    try:
        descriptor = os.open(os.path.sep, flags)
        for component in absolute.parts[1:-1]:
            next_descriptor = os.open(component, flags, dir_fd=descriptor)
            os.close(descriptor)
            descriptor = next_descriptor
        file_flags = os.O_RDONLY | getattr(os, "O_NOFOLLOW", 0)
        next_descriptor = os.open(absolute.name, file_flags, dir_fd=descriptor)
        os.close(descriptor)
        descriptor = None
        if not stat.S_ISREG(os.fstat(next_descriptor).st_mode):
            os.close(next_descriptor)
            raise ValueError(f"{label} is not a regular non-symlink file")
        return next_descriptor
    except OSError as error:
        raise UnprovisionedError(f"{label} is unavailable: {path}") from error
    finally:
        if descriptor is not None:
            os.close(descriptor)


def read_regular(path: Path, label: str) -> bytes:
    descriptor = _open_regular(path, label)
    try:
        return b"".join(iter(lambda: os.read(descriptor, 1 << 20), b""))
    finally:
        os.close(descriptor)


def sha256_file(path: Path) -> str:
    descriptor = _open_regular(path, str(path))
    digest = hashlib.sha256()
    try:
        while chunk := os.read(descriptor, 1 << 20):
            digest.update(chunk)
    finally:
        os.close(descriptor)
    return digest.hexdigest()


def _header(line: bytes) -> tuple[int, int]:
    try:
        fields = line.decode("ascii").split()
        values = int(fields[2]), int(fields[3])
    except (UnicodeDecodeError, IndexError, ValueError) as error:
        raise ValueError("malformed DIMACS header") from error
    if fields[:2] != ["p", "cnf"] or len(fields) != 4:
        raise ValueError("malformed DIMACS header")
    if line != f"p cnf {values[0]} {values[1]}\n".encode("ascii"):
        raise ValueError("noncanonical DIMACS header")
    return values


def _clause(line: bytes) -> Clause:
    try:
        values = tuple(map(int, line.decode("ascii").split()))
    except (UnicodeDecodeError, ValueError) as error:
        raise ValueError("malformed DIMACS clause") from error
    if len(values) < 2 or values[-1] != 0 or any(x == 0 or abs(x) > VARIABLES for x in values[:-1]):
        raise ValueError("malformed DIMACS clause")
    clause = values[:-1]
    if line != (" ".join(map(str, clause)) + " 0\n").encode("ascii"):
        raise ValueError("noncanonical DIMACS clause")
    return clause


def _stream_validate_dimacs(
    parent_path: Path,
    child_path: Path,
    spec: ExportSpec,
    *,
    expected_suffix: tuple[Clause, ...] = EXPECTED_SUFFIX,
    expected_parent_subsumed_suffix_indices: tuple[int, ...] = (),
) -> dict[str, Any]:
    """Validate both files in lockstep without retaining their clause bodies."""

    if len(expected_suffix) != NEW_CLAUSES or len(set(expected_suffix)) != NEW_CLAUSES:
        raise ValueError("Child45 suffix cardinality or uniqueness drifted")
    suffix_sets = tuple(frozenset(clause) for clause in expected_suffix)
    parent_subsumed_suffix_indices: set[int] = set()
    parent_descriptor = _open_regular(parent_path, f"DIMACS parent {parent_path}")
    child_descriptor = _open_regular(child_path, f"DIMACS child {child_path}")
    parent_hash = hashlib.sha256()
    child_hash = hashlib.sha256()
    parent_bytes = child_bytes = 0
    try:
        with os.fdopen(parent_descriptor, "rb") as parent, os.fdopen(child_descriptor, "rb") as child:
            parent_header = parent.readline()
            child_header = child.readline()
            parent_hash.update(parent_header)
            child_hash.update(child_header)
            parent_bytes += len(parent_header)
            child_bytes += len(child_header)
            if _header(parent_header) != (VARIABLES, spec.parent_clauses):
                raise ValueError("authenticated Child44 parent header drifted")
            if _header(child_header) != (VARIABLES, spec.child_clauses):
                raise ValueError("Child45 header count drifted")
            for parent_index in range(spec.parent_clauses):
                parent_line = parent.readline()
                child_line = child.readline()
                if not parent_line or not child_line:
                    raise ValueError("Child45 is missing an exact parent-body prefix")
                parent_hash.update(parent_line)
                child_hash.update(child_line)
                parent_bytes += len(parent_line)
                child_bytes += len(child_line)
                parent_clause = _clause(parent_line)
                child_clause = _clause(child_line)
                if parent_line != child_line or parent_clause != child_clause:
                    raise ValueError("Child45 export does not preserve exact Child44 clause prefix")
                parent_literals = frozenset(parent_clause)
                for suffix_index, suffix in enumerate(suffix_sets):
                    if parent_literals <= suffix:
                        parent_subsumed_suffix_indices.add(suffix_index + 1)
            suffix: list[Clause] = []
            suffix_hash = hashlib.sha256()
            for expected in expected_suffix:
                line = child.readline()
                if not line:
                    raise ValueError("Child45 suffix is missing a clause")
                child_hash.update(line)
                child_bytes += len(line)
                suffix_hash.update(line)
                actual = _clause(line)
                suffix.append(actual)
                if actual != expected:
                    raise ValueError("Lean Child45 suffix ordering or contents drifted")
            if parent.readline():
                raise ValueError("Child44 parent has extra clauses beyond its authenticated header")
            if child.readline():
                raise ValueError("Child45 has extra clauses beyond its authenticated suffix")
    finally:
        # fdopen owns and closes both descriptors on normal and exceptional exits.
        # If construction itself failed, close the still-open descriptor here.
        for descriptor in (parent_descriptor, child_descriptor):
            try:
                os.close(descriptor)
            except OSError:
                pass
    if parent_bytes != spec.parent_bytes or parent_hash.hexdigest() != spec.parent_sha256:
        raise ValueError("authenticated Child44 parent byte/hash identity drifted")
    if child_bytes != spec.child_bytes or child_hash.hexdigest() != spec.child_sha256:
        raise ValueError("published Child45 root byte/hash identity drifted")
    suffix_digest = suffix_hash.hexdigest()
    if expected_suffix == EXPECTED_SUFFIX and suffix_digest != ORDERED_SUFFIX_SHA256:
        raise ValueError("Lean Child45 suffix digest drifted")
    actual_parent_subsumed = tuple(sorted(parent_subsumed_suffix_indices))
    if actual_parent_subsumed != expected_parent_subsumed_suffix_indices:
        raise ValueError(
            "Child45 parent-subsumed suffix census drifted: "
            f"expected {expected_parent_subsumed_suffix_indices}, got {actual_parent_subsumed}"
        )
    return {
        "parent_sha256": parent_hash.hexdigest(),
        "child_sha256": child_hash.hexdigest(),
        "parent_bytes": parent_bytes,
        "child_bytes": child_bytes,
        "suffix": tuple(suffix),
        "ordered_suffix_sha256": suffix_digest,
        "parent_subsumed_suffix_indices": actual_parent_subsumed,
    }


def _satisfied(clause: Clause, assignment: dict[int, bool]) -> bool:
    return any(assignment[abs(literal)] == (literal > 0) for literal in clause)


def _authenticated_model(path: Path, spec: ExportSpec) -> dict[int, bool]:
    raw = read_regular(path, "Child44 custody model")
    if hashlib.sha256(raw).hexdigest() != spec.model_sha256:
        raise ValueError("Child44 custody model hash drifted")
    payload = strict_json_loads(raw)
    if not isinstance(payload, dict) or payload.get("schema") != "p97-exact17-child44-piqd-model/v3":
        raise ValueError("Child44 custody model schema drifted")
    if any(payload.get(k) != v for k, v in {"job_id": spec.model_job_id, "cnf_sha256": spec.parent_sha256, "manifest_sha256": spec.model_manifest_sha256}.items()):
        raise ValueError("Child44 custody model identity drifted")
    if payload.get("replay") != {"clauses_checked": PARENT_CLAUSES, "satisfies_all": True}:
        raise ValueError("Child44 custody model replay drifted")
    model = payload.get("model")
    if not isinstance(model, dict) or model.get("assignment") is None:
        raise ValueError("Child44 custody model assignment is absent")
    assignment = model["assignment"]
    if type(assignment) is not list or len(assignment) != VARIABLES or any(type(x) is not int or x == 0 or abs(x) > VARIABLES for x in assignment) or {abs(x) for x in assignment} != set(range(1, VARIABLES + 1)):
        raise ValueError("Child44 custody model is not a total assignment")
    return {abs(x): x > 0 for x in assignment}


def _authenticated_final(path: Path, spec: ExportSpec) -> dict[str, Any]:
    raw = read_regular(path, "Child44 custody final")
    if hashlib.sha256(raw).hexdigest() != spec.final_sha256:
        raise ValueError("Child44 custody final hash drifted")
    payload = strict_json_loads(raw)
    if not isinstance(payload, dict) or payload.get("schema") != "p97-exact17-child44-piqd-final/v2":
        raise ValueError("Child44 custody final schema drifted")
    if payload.get("job_id") != spec.model_job_id or payload.get("result") != "SAT":
        raise ValueError("Child44 custody final identity drifted")
    if payload.get("model_sha256") != spec.model_sha256 or payload.get("next_gate") != "mandatory_general_theorem_search":
        raise ValueError("Child44 custody final model binding drifted")
    binding = payload.get("binding")
    if not isinstance(binding, dict) or binding.get("cnf_sha256") != spec.parent_sha256 or binding.get("identity_hash") != IDENTITY_HASH:
        raise ValueError("Child44 custody final parent binding drifted")
    if payload.get("model_replay") != {"clauses_checked": PARENT_CLAUSES, "satisfies_all": True}:
        raise ValueError("Child44 custody final replay drifted")
    return {"path": str(path), "sha256": spec.final_sha256, "job_id": spec.model_job_id, "result": "SAT"}


def validate_sources(spec: ExportSpec = PRODUCTION_SPEC) -> None:
    if not spec.provisioned:
        raise UnprovisionedError("Child45 source pins are incomplete")
    for path, digest in ((LEAN_ROOT_PATH, spec.lean_root_sha256), (LEAN_EXPORT_PATH, spec.lean_export_sha256)):
        if digest is None or sha256_file(path) != digest:
            raise ValueError(f"authenticated Lean source drifted: {path}")


def validate_export(parent_path: Path, child_path: Path, model_path: Path, *, final_path: Path = FINAL_PATH, spec: ExportSpec = PRODUCTION_SPEC, live_export_path: Path | None = None) -> dict[str, Any]:
    validate_sources(spec)
    if not spec.provisioned:
        raise UnprovisionedError("Child45 export is UNPROVISIONED")
    assignment = _authenticated_model(model_path, spec)
    final = _authenticated_final(final_path, spec)
    dimacs = _stream_validate_dimacs(
        parent_path,
        live_export_path or child_path,
        spec,
        expected_parent_subsumed_suffix_indices=EXPECTED_PARENT_SUBSUMED_SUFFIX_INDICES,
    )
    suffix = dimacs["suffix"]
    rejected = tuple(index for index, clause in enumerate(suffix, 1) if not _satisfied(clause, assignment))
    if rejected != MODEL_REJECTED_SUFFIX_INDICES:
        raise ValueError("authenticated Child44 model rejection drifted")
    if set(rejected) & set(dimacs["parent_subsumed_suffix_indices"]):
        raise ValueError("authenticated model-cut clause is subsumed by the Child44 parent")
    return {"schema": "p97-exact17-child45-export-validation/v1", "status": "PASS", "parent_sha256": dimacs["parent_sha256"], "child_sha256": dimacs["child_sha256"], "parent_bytes": dimacs["parent_bytes"], "child_bytes": dimacs["child_bytes"], "variables": VARIABLES, "parent_clauses": spec.parent_clauses, "new_clauses": NEW_CLAUSES, "child_clauses": spec.child_clauses, "ordered_suffix_sha256": dimacs["ordered_suffix_sha256"], "parent_subsumed_suffix_indices": list(dimacs["parent_subsumed_suffix_indices"]), "authenticated_model_rejected_suffix_indices": list(rejected), "final": final}


def main(argv: list[str] | None = None) -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--parent", type=Path, default=PARENT_PATH)
    parser.add_argument("--child", type=Path, default=CHILD_PATH)
    parser.add_argument("--model", type=Path, default=MODEL_PATH)
    parser.add_argument("--final", type=Path, default=FINAL_PATH)
    args = parser.parse_args(argv)
    print(json.dumps(validate_export(args.parent, args.child, args.model, final_path=args.final), indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
