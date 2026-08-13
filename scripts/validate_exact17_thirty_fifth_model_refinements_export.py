"""Validate the Lean-owned exact-17 child36 DIMACS boundary.

The child35 SAT result exposed a raw-label/cyclic-position mix-up in the first
perpendicular-bisector refinement.  This boundary therefore has an additional
fail-closed obligation: the exact Lean suffix must reject the authenticated
child35 assignment before the child can be published or submitted to PIQD.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import stat
from dataclasses import dataclass
from pathlib import Path
from typing import Any, BinaryIO

Clause = tuple[int, ...]
ROOT = Path(__file__).resolve().parents[1]
VARIABLES = 308
PARENT_CLAUSES = 5_847_260
NEW_CLAUSES = 4
CHILD_CLAUSES = PARENT_CLAUSES + NEW_CLAUSES
PARENT_SHA256 = "0ce510af7c5c653719cb2d1250c8577e9c48d244605182bfe8b91112c538787f"
CHILD_SHA256 = "e2236eaa12b10117c0540b2ea545f177e5070b6d96a0ac96668a733fe501eae5"
CHILD_BYTES = 291_621_334
MODEL_SHA256 = "e9d1f74d246225353bbb503c480f44ca2376674a1a6f99b19651b8e7ae5637b3"
MODEL_JOB_ID = "4fa2037f-d0da-42b9-862d-6e78cc3a9498"
MODEL_MANIFEST_SHA256 = (
    "3241c3f22d0bb4a1635430ad35a395a0c46cd8b3a06423e05a682999533a72ae"
)
MODEL_COMPLETION_IDENTITY = (
    "78a300dc3d6b528017aae49e7310397a6d707d70eecb15d1c292f31ac96066ab"
)
LEAN_ROOT_SHA256 = "df5b934e4ee00c952996decd72f61b8f032415e0620d1044922c50b05c771c0c"
LEAN_EXPORT_SHA256 = "e2a8ace13ba96883b7c515aa2831dd723d383af602a1f017a2440911ca845a20"
REFINEMENT_SHA256 = "73547ec8929e39c3bbd578d397a933ce399c7cafd9e328a318d0a758be02ebdb"
SPEC_SCHEMA = "p97-exact17-child36-export-spec/v1"

ATail = ROOT / "lean/Erdos9796Proof/P97/ATail"
LEAN_ROOT_PATH = str(ATail / "BlockerVExactSeventeenThirtyFifthModelRefinements.lean")
LEAN_EXPORT_PATH = str(
    ATail / "BlockerVExactSeventeenThirtyFifthModelRefinementsExport.lean"
)
REFINEMENT_PATH = str(
    ATail
    / "BlockerVExactSeventeenThirtyFifthCanonicalizedPerpendicularBisectorRefinement.lean"
)
PARENT_PATH = str(
    ROOT
    / "scratch/exact17-lean-to-sat/exact17-thirty-fifth-root-thirty-fourth-model-refinements.cnf"
)
CHILD_PATH = str(
    ROOT
    / "scratch/exact17-lean-to-sat/exact17-thirty-sixth-root-thirty-fifth-model-refinements.cnf"
)
MODEL_PATH = str(
    ROOT / "scratch/exact17-lean-to-sat/piqd-child35-core1-custody-model.json"
)
RECEIPT_PATH = str(ROOT / "scratch/exact17-lean-to-sat/child36-export-receipt.json")

SUFFIX: tuple[Clause, ...] = (
    (-307, -21, -31, -56, -61, -65, -225, -226, -231),
    (-307, -146, -143, -164, -157, -160, -112, -113, -106),
    (-308, -21, -31, -56, -64, -65, -225, -226, -234),
    (-308, -149, -143, -215, -208, -211, -115, -113, -106),
)


class UnprovisionedError(ValueError):
    """The boundary is inspectable but lacks immutable production pins."""


@dataclass(frozen=True)
class ExportSpec:
    variables: int = VARIABLES
    parent_clauses: int = PARENT_CLAUSES
    new_clauses: int = NEW_CLAUSES
    parent_sha256: str = PARENT_SHA256
    child_sha256: str | None = CHILD_SHA256
    child_bytes: int | None = CHILD_BYTES
    model_sha256: str = MODEL_SHA256
    publication_state: str = "PROVISIONED"
    schema: str = SPEC_SCHEMA
    lean_root_path: str = LEAN_ROOT_PATH
    lean_export_path: str = LEAN_EXPORT_PATH
    refinement_path: str = REFINEMENT_PATH
    parent_path: str = PARENT_PATH
    child_path: str = CHILD_PATH
    model_path: str = MODEL_PATH
    receipt_path: str = RECEIPT_PATH
    lean_root_sha256: str | None = LEAN_ROOT_SHA256
    lean_export_sha256: str | None = LEAN_EXPORT_SHA256
    refinement_sha256: str | None = REFINEMENT_SHA256

    @property
    def child_clauses(self) -> int:
        return self.parent_clauses + self.new_clauses

    @property
    def provisioned(self) -> bool:
        return (
            self.publication_state == "PROVISIONED"
            and self.child_sha256 is not None
            and self.child_bytes is not None
        )


PRODUCTION_SPEC = ExportSpec()


def _is_sha(value: object) -> bool:
    return (
        type(value) is str
        and len(value) == 64
        and all(c in "0123456789abcdef" for c in value)
    )


def validate_spec(spec: ExportSpec, *, require_source_pins: bool = False) -> None:
    if not isinstance(spec, ExportSpec) or spec.schema != SPEC_SCHEMA:
        raise TypeError("authenticated child36 ExportSpec is required")
    if (spec.variables, spec.parent_clauses, spec.new_clauses) != (
        VARIABLES,
        PARENT_CLAUSES,
        NEW_CLAUSES,
    ):
        raise ValueError("child36 dimension contract drifted")
    if spec.parent_sha256 != PARENT_SHA256 or spec.model_sha256 != MODEL_SHA256:
        raise ValueError("child36 parent/model pin drifted")
    if spec.provisioned and (spec.child_sha256, spec.child_bytes) != (
        CHILD_SHA256,
        CHILD_BYTES,
    ):
        raise ValueError("child36 provisioned artifact pin drifted")
    if spec.provisioned and (
        spec.lean_root_sha256,
        spec.lean_export_sha256,
        spec.refinement_sha256,
    ) != (LEAN_ROOT_SHA256, LEAN_EXPORT_SHA256, REFINEMENT_SHA256):
        raise ValueError("child36 provisioned source pin drifted")
    for name in ("parent_sha256", "model_sha256"):
        if not _is_sha(getattr(spec, name)):
            raise TypeError(f"{name} must be a lowercase SHA-256")
    for name in (
        "child_sha256",
        "lean_root_sha256",
        "lean_export_sha256",
        "refinement_sha256",
    ):
        value = getattr(spec, name)
        if value is not None and not _is_sha(value):
            raise TypeError(f"{name} must be a lowercase SHA-256 or null")
    if spec.publication_state not in {"PROVISIONED", "UNPROVISIONED"}:
        raise ValueError("invalid publication_state")
    if spec.child_bytes is not None and (
        type(spec.child_bytes) is not int or spec.child_bytes <= 0
    ):
        raise TypeError("child_bytes must be a positive integer or null")
    expected = {
        "lean_root_path": LEAN_ROOT_PATH,
        "lean_export_path": LEAN_EXPORT_PATH,
        "refinement_path": REFINEMENT_PATH,
        "parent_path": PARENT_PATH,
        "child_path": CHILD_PATH,
        "model_path": MODEL_PATH,
        "receipt_path": RECEIPT_PATH,
    }
    for name, path in expected.items():
        if getattr(spec, name) != path or not os.path.isabs(path):
            raise ValueError(f"{name} is not the authenticated child36 path")
    if require_source_pins and (
        not spec.provisioned
        or any(
            getattr(spec, name) is None
            for name in (
                "lean_root_sha256",
                "lean_export_sha256",
                "refinement_sha256",
            )
        )
    ):
        raise UnprovisionedError("child36 source or artifact pins are incomplete")


def validate_sources(spec: ExportSpec) -> None:
    validate_spec(spec, require_source_pins=True)
    for path, expected in (
        (Path(spec.lean_root_path), spec.lean_root_sha256),
        (Path(spec.lean_export_path), spec.lean_export_sha256),
        (Path(spec.refinement_path), spec.refinement_sha256),
    ):
        if expected is None or sha256_file(path) != expected:
            raise ValueError(f"authenticated Lean source drifted: {path}")


def sha256_file(path: Path) -> str:
    before_path = os.lstat(path)
    descriptor = os.open(path, os.O_RDONLY | getattr(os, "O_NOFOLLOW", 0))
    try:
        before = os.fstat(descriptor)
        identity = lambda item: (
            item.st_dev,
            item.st_ino,
            item.st_mode,
            item.st_nlink,
            item.st_size,
            item.st_mtime_ns,
            item.st_ctime_ns,
        )
        if not stat.S_ISREG(before.st_mode) or identity(before_path) != identity(
            before
        ):
            raise ValueError(f"not a stable regular file: {path}")
        digest = hashlib.sha256()
        while block := os.read(descriptor, 1024 * 1024):
            digest.update(block)
        after = os.fstat(descriptor)
        if identity(before) != identity(after) or identity(before) != identity(
            os.lstat(path)
        ):
            raise ValueError(f"file changed while hashing: {path}")
        return digest.hexdigest()
    finally:
        os.close(descriptor)


def strict_object(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
    result: dict[str, Any] = {}
    for key, value in pairs:
        if key in result:
            raise ValueError(f"duplicate JSON key: {key}")
        result[key] = value
    return result


def _exact_keys(value: object, keys: set[str], context: str) -> dict[str, Any]:
    if type(value) is not dict or set(value) != keys:
        raise ValueError(f"{context} has missing or extra fields")
    return value


def authenticated_model(path: Path, spec: ExportSpec) -> dict[int, bool]:
    if sha256_file(path) != spec.model_sha256:
        raise ValueError("child35 model SHA-256 does not match authenticated pin")
    with path.open("r", encoding="utf-8") as handle:
        payload = json.load(handle, object_pairs_hook=strict_object)
    top = _exact_keys(
        payload,
        {
            "schema",
            "job_id",
            "cnf_sha256",
            "manifest_sha256",
            "completion_identity_hash",
            "replay",
            "model",
        },
        "child35 custody model",
    )
    expected_top = {
        "schema": "p97-exact17-child35-piqd-model/v3",
        "job_id": MODEL_JOB_ID,
        "cnf_sha256": PARENT_SHA256,
        "manifest_sha256": MODEL_MANIFEST_SHA256,
        "completion_identity_hash": MODEL_COMPLETION_IDENTITY,
    }
    for key, expected in expected_top.items():
        if top[key] != expected:
            raise ValueError(f"child35 custody model {key} drifted")
    replay = _exact_keys(
        top["replay"], {"clauses_checked", "satisfies_all"}, "child35 replay"
    )
    if replay != {"clauses_checked": PARENT_CLAUSES, "satisfies_all": True}:
        raise ValueError("child35 custody replay claim drifted")
    model = _exact_keys(
        top["model"],
        {"assignment", "backend", "job_id", "num_assigned", "result", "solver_profile"},
        "child35 model",
    )
    if {key: model[key] for key in model if key != "assignment"} != {
        "backend": "cadical",
        "job_id": MODEL_JOB_ID,
        "num_assigned": VARIABLES,
        "result": "SAT",
        "solver_profile": "sat",
    }:
        raise ValueError("child35 model metadata drifted")
    assignment = model["assignment"]
    if (
        type(assignment) is not list
        or len(assignment) != VARIABLES
        or any(
            type(lit) is not int or lit == 0 or abs(lit) > VARIABLES
            for lit in assignment
        )
        or {abs(lit) for lit in assignment} != set(range(1, VARIABLES + 1))
    ):
        raise ValueError("child35 assignment is not a total 308-variable assignment")
    return {abs(lit): lit > 0 for lit in assignment}


def _header(handle: BinaryIO, path: Path) -> tuple[int, int]:
    fields = handle.readline().decode("ascii").split()
    if len(fields) != 4 or fields[:2] != ["p", "cnf"]:
        raise ValueError(f"malformed DIMACS header: {path}")
    return int(fields[2]), int(fields[3])


def _clause(line: bytes, context: str) -> Clause:
    fields = tuple(map(int, line.decode("ascii").split()))
    if (
        len(fields) < 2
        or fields[-1] != 0
        or any(lit == 0 or abs(lit) > VARIABLES for lit in fields[:-1])
    ):
        raise ValueError(f"malformed DIMACS clause: {context}")
    return fields[:-1]


def clause_satisfied(clause: Clause, assignment: dict[int, bool]) -> bool:
    return any(assignment[abs(lit)] == (lit > 0) for lit in clause)


def suffix_cut_indices(
    suffix: tuple[Clause, ...], assignment: dict[int, bool]
) -> tuple[int, ...]:
    return tuple(
        index
        for index, clause in enumerate(suffix, 1)
        if not clause_satisfied(clause, assignment)
    )


def require_motivating_model_cut(
    suffix: tuple[Clause, ...], assignment: dict[int, bool]
) -> tuple[int, ...]:
    cut_indices = suffix_cut_indices(suffix, assignment)
    if not cut_indices:
        raise ValueError(
            "child36 suffix does not reject authenticated child35 assignment"
        )
    return cut_indices


def validate_export(
    parent_path: Path,
    child_path: Path,
    model_path: Path,
    *,
    spec: ExportSpec = PRODUCTION_SPEC,
    allow_unprovisioned: bool = False,
) -> dict[str, Any]:
    validate_spec(spec)
    if not spec.provisioned and not allow_unprovisioned:
        raise UnprovisionedError("child36 export is UNPROVISIONED")
    if sha256_file(parent_path) != spec.parent_sha256:
        raise ValueError("parent SHA-256 does not match authenticated child35 pin")
    validate_sources(spec)
    assignment = authenticated_model(model_path, spec)
    suffix_keys = {frozenset(clause) for clause in SUFFIX}
    if len(suffix_keys) != NEW_CLAUSES:
        raise ValueError("duplicate semantic clause in configured child36 suffix")
    suffix_lines: list[bytes] = []
    parent_model_failures: list[int] = []
    with parent_path.open("rb") as parent, child_path.open("rb") as child:
        if _header(parent, parent_path) != (VARIABLES, PARENT_CLAUSES):
            raise ValueError("unexpected parent DIMACS header")
        if _header(child, child_path) != (VARIABLES, CHILD_CLAUSES):
            raise ValueError("unexpected child DIMACS header")
        for index in range(PARENT_CLAUSES):
            left, right = parent.readline(), child.readline()
            if not left or left != right:
                raise ValueError(f"parent-prefix mismatch at clause {index + 1}")
            clause = _clause(left, f"parent/{index + 1}")
            if frozenset(clause) in suffix_keys:
                raise ValueError(
                    "semantic child36 suffix clause already occurs in parent"
                )
            if not clause_satisfied(clause, assignment):
                parent_model_failures.append(index + 1)
        if parent.readline():
            raise ValueError("parent file contains extra clauses")
        for index, expected in enumerate(SUFFIX):
            line = child.readline()
            if not line or _clause(line, f"suffix/{index + 1}") != expected:
                raise ValueError(f"child36 suffix mismatch at clause {index + 1}")
            suffix_lines.append(line)
        if child.readline():
            raise ValueError("child file contains extra clauses")
    if parent_model_failures:
        raise ValueError(
            "authenticated child35 assignment does not satisfy its parent CNF"
        )
    cut_indices = require_motivating_model_cut(SUFFIX, assignment)
    child_sha256 = sha256_file(child_path)
    child_bytes = child_path.stat().st_size
    if spec.child_sha256 is not None and child_sha256 != spec.child_sha256:
        raise ValueError("child SHA-256 does not match authenticated pin")
    if spec.child_bytes is not None and child_bytes != spec.child_bytes:
        raise ValueError("child byte count does not match authenticated pin")
    return {
        "schema": "p97-exact17-child36-export-validation/v1",
        "status": "PASS" if spec.provisioned else "UNPROVISIONED",
        "publication_state": spec.publication_state,
        "parent": {"sha256": spec.parent_sha256, "clauses": PARENT_CLAUSES},
        "child": {
            "sha256": child_sha256,
            "bytes": child_bytes,
            "variables": VARIABLES,
            "clauses": CHILD_CLAUSES,
        },
        "model": {
            "sha256": spec.model_sha256,
            "job_id": MODEL_JOB_ID,
            "parent_replay_exact": True,
        },
        "ordered_suffix_sha256": hashlib.sha256(b"".join(suffix_lines)).hexdigest(),
        "ordered_suffix_exact": True,
        "motivating_model_cut_suffix_indices": list(cut_indices),
        "source_clause_families": ["child35CanonicalPerpBisectorClauses"],
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--parent", type=Path, default=Path(PARENT_PATH))
    parser.add_argument("--child", type=Path, default=Path(CHILD_PATH))
    parser.add_argument("--model", type=Path, default=Path(MODEL_PATH))
    arguments = parser.parse_args()
    result = validate_export(arguments.parent, arguments.child, arguments.model)
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
