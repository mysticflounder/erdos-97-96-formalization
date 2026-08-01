"""Fail-closed CEGAR for the exact Phase-3 ``(4,10,(4,4,5))`` cell.

Structural learned clauses are derived from replayed equality certificates.
Duplicate-center clauses negate only the shell memberships used by their
checked closure paths; the other structural stages retain whole-row clauses.
The cap-order stage additionally binds only cap facts whose exact
positive-subset minimization is replayed across every compatible annotation
and all 24 induced orders.  SAT exactness identifies a selected four-point
support, but metric rows remain ``exact=False``: no geometric off-support
inequality is inferred.

The optional typed algebraic bootstraps are deliberately narrower than a
structural certificate.  They replay either QQ unit identities, a QQ
ideal-membership point-collision identity, or all 32 exact QQ(sqrt(3))
orientation-branch identities for an equilateral shell.  Their clauses are
sound only for the P97 Euclidean/distinct-point consumer; the shell cut in
particular uses pairwise distinctness to make its common length positive and
must not be confused with unit infeasibility of its NONUNIT full equality ideal.
"""

from __future__ import annotations

import argparse
import concurrent.futures
import contextlib
import functools
import hashlib
import importlib
import itertools
import json
import os
import sys
import tempfile
from collections import Counter, defaultdict
from collections.abc import Callable, Mapping, Sequence
from pathlib import Path
from typing import Any

import sympy as sp

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[1]
for directory in (ROOT, HERE):
    if str(directory) not in sys.path:
        sys.path.insert(0, str(directory))

sat = importlib.import_module("sat_generate")
realize = importlib.import_module("census.p97_search.realize")
screen = importlib.import_module("census.p97_search.structural_screen")
certificates = importlib.import_module(
    "census.global_confinement.cap_selected_nogood_certificate_probe"
)
metric = importlib.import_module(
    "census.global_confinement.metric_realizability_probe"
)
equality_probe = importlib.import_module(
    "census.global_confinement.equality_ideal_probe"
)
ordered_rules = importlib.import_module(
    "census.p97_search.phase3_ordered_metric_rules"
)
shared_pair_separation = importlib.import_module(
    "census.p97_search.phase3_shared_pair_separation"
)


SCHEMA = "p97-phase3-structural-cegar-v1"
PROJECTED_STATIC_SCHEMA = "p97-phase3-structural-cegar-projected-static-v2"
LEARNED_SCHEMA = "p97-phase3-structural-cegar-learned-v1"
PROJECTED_LEARNED_SCHEMA = (
    "p97-phase3-structural-cegar-learned-projected-static-v2"
)
SURVIVOR_SCHEMA = "p97-phase3-structural-cegar-survivor-v1"
PROJECTED_SURVIVOR_SCHEMA = (
    "p97-phase3-structural-cegar-survivor-projected-static-v2"
)
LOG_SCHEMA = "p97-phase3-structural-cegar-solver-log-v1"
CUBE_PLAN_SCHEMA = "p97-phase3-structural-cegar-cube-plan-v1"
CUBE_RESULT_SCHEMA = "p97-phase3-structural-cegar-cube-result-v2"
CUBE_BATCH_SCHEMA = "p97-phase3-structural-cegar-cube-batch-v2"
SHARD_COVERAGE_SCHEMA = "p97-phase3-structural-cegar-shard-coverage-v1"
SMOKE_SCHEMA = "p97-phase3-structural-cegar-smoke-v1"
FAILURE_SCHEMA = "p97-phase3-structural-cegar-failure-v1"
ALGEBRAIC_CERTIFICATE_SCHEMA = (
    "p97-phase3-survivor-qq-nullstellensatz-certificate-v1"
)
ALGEBRAIC_SYSTEM_SCHEMA = (
    "p97-phase3-survivor-singular-equality-system-v1"
)
ALGEBRAIC_MANIFEST_SCHEMA = (
    "p97-phase3-survivor-qq-nullstellensatz-run-v1"
)
ALGEBRAIC_ORIGIN = "bootstrap-p97-euclidean-gauge-nullstellensatz"
ALGEBRAIC_STAGE = "p97-euclidean-gauge-nullstellensatz"
UNIT_CONTRADICTION_KIND = "UNIT_EQUALITY_INFEASIBILITY"
REAL_DISTINCTNESS_CERTIFICATE_SCHEMA = (
    "p97-phase3-real-distinctness-qq-certificate-v1"
)
REAL_DISTINCTNESS_MANIFEST_SCHEMA = (
    "p97-phase3-real-distinctness-certificate-manifest-v1"
)
REAL_DISTINCTNESS_ORIGIN = (
    "bootstrap-p97-real-distinctness-ideal-membership"
)
REAL_DISTINCTNESS_STAGE = "p97-real-distinctness-ideal-membership"
REAL_DISTINCTNESS_CONTRADICTION_KIND = (
    "REAL_DISTINCTNESS_CONTRADICTION"
)
REAL_DISTINCTNESS_TARGET = "x9x^2+x9y^2"
REAL_DISTINCTNESS_SOURCE_SHA256 = (
    "66fcf278cc2141220951219180d43c95f1ea063d46fcb7fc0156c690fdd5c929"
)
REAL_DISTINCTNESS_ROWS_SHA256 = (
    "d6db6d91d18e0e8ca9efe6941711375be4f3849d21adc4bcfc6c6806afd5ed5e"
)
REAL_DISTINCTNESS_CERTIFICATE_SHA256 = (
    "1b7588630352d17b9ef9bc01e8050c11400e0a579898e3471738876cdf33af6c"
)
REAL_DISTINCTNESS_MANIFEST_SHA256 = (
    "33bdff1ace39b5fb39ff9ac67f9fa00ea96fa90b6c66c56451911998df85f201"
)
REAL_DISTINCTNESS_NONZERO_INDICES = (
    6,
    7,
    8,
    10,
    11,
    12,
    14,
    15,
    17,
    21,
    22,
    24,
    26,
    27,
    28,
    29,
)
EQUILATERAL_SHELL_STATUS_SCHEMA = (
    "p97-projected-v2-shell-exact-algebra-final-v1"
)
EQUILATERAL_SHELL_BRANCH_SYSTEM_SCHEMA = (
    "p97-projected-v2-shell-equilateral-branches-v1"
)
EQUILATERAL_SHELL_BRANCH_RESULTS_SCHEMA = (
    "p97-projected-v2-shell-equilateral-branch-results-v1"
)
EQUILATERAL_SHELL_BANK_SCHEMA = (
    "p97-equilateral-shell-nullstellensatz-bank-v1"
)
EQUILATERAL_SHELL_CERTIFICATE_SCHEMA = (
    "p97-equilateral-branch-nullstellensatz-v1"
)
EQUILATERAL_SHELL_ORIGIN = (
    "bootstrap-p97-equilateral-shell-real-distinctness-nullstellensatz"
)
EQUILATERAL_SHELL_STAGE = (
    "p97-equilateral-shell-real-distinctness-32-branch"
)
EQUILATERAL_SHELL_CONTRADICTION_KIND = (
    "EQUILATERAL_SHELL_REAL_DISTINCTNESS_CONTRADICTION"
)
EQUILATERAL_SHELL_STATUS_SHA256 = (
    "824e6522fcc40fc81b5e0f32ee07ae600c064f48c9dd2b9e12827d1fcd06d7ac"
)
EQUILATERAL_SHELL_SHA256SUMS_SHA256 = (
    "8f8da4c19180732fe1da3dca6b501834c06cabc619dcef19554802e435a855c5"
)
EQUILATERAL_SHELL_SOURCE_RECORD_SHA256 = (
    "0449d1de14457c4b990d43ccff3159dee8fb61840c459cb706bea780be779d01"
)
EQUILATERAL_SHELL_ROWS_SHA256 = (
    "851c782cb69ce8058138a40ab4145ac2a2df1236ea1fbad1c588f5d4793a3dec"
)
EQUILATERAL_SHELL_GRAPH_SHA256 = (
    "864a95408a89c202f4d2411ebe5b147783bcda466d01d0b049264cebf1e31c6c"
)
EQUILATERAL_SHELL_BRANCH_SYSTEM_SHA256 = (
    "d8128dbb4e878dbbca3b3caed74aeca586d60a7eb0b80a6b2c59e4a2b32df6b7"
)
EQUILATERAL_SHELL_BRANCH_RESULTS_SHA256 = (
    "4835cb56ea94d80fa9189c3dcdf76a6e54194c6c647211a4cb8e7ec0a3651c3a"
)
EQUILATERAL_SHELL_BANK_SHA256 = (
    "14e75c4e0f58d29daad76acfc7ca7acd7e5951ba4810c9c04849d79c22ffd3d7"
)
EQUILATERAL_SHELL_FIELD = "QQ(sqrt(3)) with minpoly a^2-3"
EQUILATERAL_SHELL_EDGES = (
    (0, 2),
    (0, 5),
    (0, 7),
    (0, 8),
    (1, 3),
    (1, 4),
    (1, 7),
    (1, 8),
    (2, 3),
    (2, 4),
    (2, 9),
    (3, 8),
    (3, 9),
    (4, 6),
    (4, 7),
    (5, 6),
    (5, 7),
    (5, 9),
    (6, 8),
    (6, 9),
)
EQUILATERAL_SHELL_TRIANGLES = (
    (0, 5, 7),
    (1, 3, 8),
    (1, 4, 7),
    (2, 3, 9),
    (5, 6, 9),
)
EQUILATERAL_SHELL_INNER_CYCLE = (5, 7, 1, 3, 9)
EQUILATERAL_SHELL_OUTER_CYCLE = (0, 4, 8, 2, 6)
EQUILATERAL_SHELL_CENTER_COVER = frozenset(range(7))
EQUILATERAL_SHELL_CENTER_TREE = (
    (0, 2),
    (0, 5),
    (1, 3),
    (1, 4),
    (2, 3),
    (4, 6),
)
CAP_ORDER_CERTIFICATE_SCHEMA = (
    "p97-phase3-cap-order-convex-five-point-certificate-v1"
)
CAP_ORDER_ORIGIN = "solver-cap-order-convex-five-point"
BOOTSTRAP_CAP_ORDER_ORIGIN = "bootstrap-cap-order-convex-five-point"
CAP_ORDER_STAGE = "cap-order-convex-five-point-exhaustive"
CAP_ORDER_FORWARD_STAGE = "equality-convex-five-point"
CAP_ORDER_REVERSE_STAGE = "equality-convex-five-point-reverse"
CAP_ORDER_LEAN_CONSUMERS = (
    {
        "orientation": "forward",
        "signed_area_case": "negative",
        "theorem": (
            "Problem97.Census554.ConvexFivePointCore.false_of_core_of_neg"
        ),
    },
    {
        "orientation": "reverse",
        "signed_area_case": "positive",
        "theorem": "Problem97.Census554.ConvexFivePointCore.false_of_core",
    },
)
RHOMBUS_CAP_ORDER_CERTIFICATE_SCHEMA = (
    "p97-phase3-cap-order-convex-rhombus-certificate-v1"
)
RHOMBUS_CAP_ORDER_ORIGIN = "solver-cap-order-convex-rhombus"
BOOTSTRAP_RHOMBUS_CAP_ORDER_ORIGIN = (
    "bootstrap-cap-order-convex-rhombus"
)
RHOMBUS_CAP_ORDER_STAGE = "cap-order-convex-rhombus-exhaustive"
RHOMBUS_INGRESS_TRUST_BOUNDARY = (
    "generic ConvexRhombusCore Lean theorem names are metadata only; this "
    "concrete Python certificate ingress is not Lean-kernel-checked"
)
KALMANSON_CAP_ORDER_CERTIFICATE_SCHEMA = (
    "p97-phase3-cap-order-five-point-three-selected-row-kalmanson-certificate-v1"
)
KALMANSON_CAP_ORDER_ORIGIN = "solver-cap-order-selected-row-kalmanson"
BOOTSTRAP_KALMANSON_CAP_ORDER_ORIGIN = (
    "bootstrap-cap-order-selected-row-kalmanson"
)
KALMANSON_CAP_ORDER_STAGE = (
    "cap-order-five-point-three-selected-row-kalmanson-exhaustive"
)
KALMANSON_INGRESS_TRUST_BOUNDARY = (
    "CapCrossingKalmansonBridge theorem names and exact roles are metadata "
    "only; this concrete Python certificate ingress is not Lean-kernel-checked"
)
SHARED_PAIR_SEPARATION_CERTIFICATE_SCHEMA = (
    "p97-phase3-shared-pair-cyclic-separation-learned-certificate-v1"
)
SHARED_PAIR_SEPARATION_ORIGIN = "solver-shared-pair-cyclic-separation"
BOOTSTRAP_SHARED_PAIR_SEPARATION_ORIGIN = (
    "bootstrap-shared-pair-cyclic-separation"
)
SHARED_PAIR_SEPARATION_STAGE = "shared-pair-cyclic-separation-exhaustive"
SHARED_PAIR_SEPARATION_INGRESS_TRUST_BOUNDARY = (
    "The finite cap-annotation and cyclic-order coverage replay is "
    "Python-checked. The shared-pair separation implication is consumed from "
    "the Lean-kernel-checked generic theorem named in the nested certificate."
)
DUPLICATE_CENTER_STAGE = "equality-duplicate-center"
DUPLICATE_CENTER_LEAN_CONSUMER = (
    "Problem97.Phase3DuplicateCenterCertificate."
    "DuplicateCenterCertificate.not_realizes_of_check"
)
STRUCTURAL_PATH_ORIGIN = "solver-structural-path-memberships"
BOOTSTRAP_STRUCTURAL_PATH_ORIGIN = (
    "bootstrap-structural-path-memberships"
)
DYNAMIC_CLASSIFIED_ORIGINS = frozenset(
    {
        "solver",
        STRUCTURAL_PATH_ORIGIN,
        CAP_ORDER_ORIGIN,
        RHOMBUS_CAP_ORDER_ORIGIN,
        KALMANSON_CAP_ORDER_ORIGIN,
        SHARED_PAIR_SEPARATION_ORIGIN,
        ALGEBRAIC_ORIGIN,
        REAL_DISTINCTNESS_ORIGIN,
        EQUILATERAL_SHELL_ORIGIN,
    }
)
GAUGE = {"0": ["0", "0"], "1": ["1", "0"]}

CELL = sat.Cell(k=4, n=10, profile=(4, 4, 5), exact=True)
DEFAULT_OUT = (
    ROOT / "scratch/p97-distinct-distance-lane/phase3_structural_cegar"
)
DEFAULT_BOOTSTRAP = (
    HERE
    / "out/phase3-realization"
    / "k4-n10-profile-445-bounded100-structural-current"
    / "results.jsonl"
)
DEFAULT_ALGEBRAIC_BOOTSTRAP = (
    ROOT
    / "scratch/p97-distinct-distance-lane"
    / "phase3_survivor_singular_cert_2_20260729"
)
NEW_ALGEBRAIC_BOOTSTRAP = (
    ROOT
    / "scratch/p97-distinct-distance-lane"
    / "phase3_new_survivors_singular_cert_3_recovered_20260729"
)
REAL_DISTINCTNESS_BOOTSTRAP = (
    ROOT
    / "scratch/p97-distinct-distance-lane"
    / "phase3_nonunit_real_distinctness_cert_d6db6d91d18e_20260729"
)
EQUILATERAL_SHELL_BOOTSTRAP = (
    ROOT
    / "scratch/p97-distinct-distance-lane"
    / "phase3_projected_v2_shell_exact_20260729"
)
DEFAULT_ALGEBRAIC_BOOTSTRAPS = (
    DEFAULT_ALGEBRAIC_BOOTSTRAP,
    NEW_ALGEBRAIC_BOOTSTRAP,
    REAL_DISTINCTNESS_BOOTSTRAP,
    EQUILATERAL_SHELL_BOOTSTRAP,
)
ALGEBRAIC_BANK_SPECS = (
    {
        "artifact_prefix": str(DEFAULT_ALGEBRAIC_BOOTSTRAP.relative_to(ROOT)),
        "scope_count": 2,
        "certificate_summary": {
            "CERTIFIED_UNIT": 2,
            "ERROR": 0,
            "NONUNIT": 0,
            "REPLAY_FAIL": 0,
            "TIMEOUT": 0,
        },
        "audit": {
            "path": (
                "scratch/p97-distinct-distance-lane/"
                "phase3_survivor_singular_2_20260729/manifest.json"
            ),
            "sha256": (
                "445c5895b9775765099642887dda9e34e1f2b694390a9caeb71d1892486a59e0"
            ),
            "system_count": 2,
        },
        "audit_summary": {
            "ERROR": 0,
            "NONUNIT": 0,
            "UNIT": 2,
            "UNKNOWN": 0,
        },
        "audit_systems": (
            (
                "system-00-48c65d6d0dda",
                "UNIT",
                "a946e94e28e5a2ae47b58a0cea0dc1b417fdf1c3cc66826aeb35af5536234e8e",
                "48c65d6d0ddaec5117a01416949882a0b3cb18b4a22a030d03938cfb234b53ca",
                1,
            ),
            (
                "system-01-208c2305f405",
                "UNIT",
                "804c3c6e5af16770a782f8d5927a1f4957068e20d2b279674eeb21ef15e8f570",
                "208c2305f4050b3fd37d0d70a6daee27e3575970f7686d1767ba1f34df0dc5b7",
                99,
            ),
        ),
        "targets": {
            "system-00-48c65d6d0dda": (
                "a946e94e28e5a2ae47b58a0cea0dc1b417fdf1c3cc66826aeb35af5536234e8e",
                "48c65d6d0ddaec5117a01416949882a0b3cb18b4a22a030d03938cfb234b53ca",
                (26, 36, list(range(10))),
            ),
            "system-01-208c2305f405": (
                "804c3c6e5af16770a782f8d5927a1f4957068e20d2b279674eeb21ef15e8f570",
                "208c2305f4050b3fd37d0d70a6daee27e3575970f7686d1767ba1f34df0dc5b7",
                (17, 25, [0, 1, 3, 4, 5, 7, 8, 9]),
            ),
        },
    },
    {
        "artifact_prefix": str(NEW_ALGEBRAIC_BOOTSTRAP.relative_to(ROOT)),
        "scope_count": 3,
        "certificate_summary": {
            "CERTIFIED_UNIT": 3,
            "ERROR": 0,
            "NONUNIT": 0,
            "REPLAY_FAIL": 0,
            "TIMEOUT": 0,
        },
        "audit": {
            "path": (
                "scratch/p97-distinct-distance-lane/"
                "phase3_new_survivors_realization_20260729/manifest.json"
            ),
            "sha256": (
                "c9a62a4b64cfe9b4b2c4880739fe69b14ffd64f6557184ff35168a0658e48ed1"
            ),
            "system_count": 3,
        },
        "audit_summary": {
            "ERROR": 0,
            "NONUNIT": 1,
            "UNIT": 3,
            "UNKNOWN": 0,
        },
        "audit_systems": (
            (
                "system-00-398b59017a31",
                "UNIT",
                "6e985b5e19afead9baa91ae9ef4e02c0aca8c2435a730fc5d7c4880c097136a4",
                "398b59017a31b4604640f723e3ea110902e6662eb294ee830db7504223bd6111",
                1,
            ),
            (
                "system-01-d6db6d91d18e",
                "NONUNIT",
                "66fcf278cc2141220951219180d43c95f1ea063d46fcb7fc0156c690fdd5c929",
                "d6db6d91d18e0e8ca9efe6941711375be4f3849d21adc4bcfc6c6806afd5ed5e",
                1,
            ),
            (
                "system-02-b66cc99cc9ed",
                "UNIT",
                "53a7a1ed59d1cc4b6b68e46145661c3fb878845b5daaa0694b34fe2e73bb3fa4",
                "b66cc99cc9edaf3d5c0aa99c80b7310f0073cd00134ec9a023c05c70706c57d9",
                1,
            ),
            (
                "system-03-540659aed8ba",
                "UNIT",
                "f0d3f063dcef94412adaeec96ce4a7b6199bd909263e78d793f51fb715f5500d",
                "540659aed8ba9d161f4f20624f7fabfa09877c8e6ac39d3b509c27774ddecbc6",
                1,
            ),
        ),
        "targets": {
            "system-00-398b59017a31": (
                "6e985b5e19afead9baa91ae9ef4e02c0aca8c2435a730fc5d7c4880c097136a4",
                "398b59017a31b4604640f723e3ea110902e6662eb294ee830db7504223bd6111",
                (18, 27, [0, 1, 2, 3, 4, 5, 7, 8, 9]),
            ),
            "system-02-b66cc99cc9ed": (
                "53a7a1ed59d1cc4b6b68e46145661c3fb878845b5daaa0694b34fe2e73bb3fa4",
                "b66cc99cc9edaf3d5c0aa99c80b7310f0073cd00134ec9a023c05c70706c57d9",
                (9, 15, [0, 1, 2, 3, 4, 7]),
            ),
            "system-03-540659aed8ba": (
                "f0d3f063dcef94412adaeec96ce4a7b6199bd909263e78d793f51fb715f5500d",
                "540659aed8ba9d161f4f20624f7fabfa09877c8e6ac39d3b509c27774ddecbc6",
                (10, 16, [0, 1, 3, 5, 8, 9]),
            ),
        },
    },
)
MAX_WORKERS = 24
MAX_CUBE_DEPTH = 12
PARALLEL_MODES = ("sequential", "cube-batch")
CUBE_ARTIFACT_MODES = ("full", "compact")
SHARD_TERMINAL_STATUSES = (
    "SHARD_STRUCTURAL_UNSAT_VERIFIED",
    "SHARD_P97_EUCLIDEAN_GAUGE_UNSAT_VERIFIED",
)

SolverRunner = Callable[[Path, int, Path | None], Any]
CheckerRunner = Callable[[Path, Path, int], Any]


class StructuralCegarError(RuntimeError):
    """An encoding, certificate, solver, resume, or artifact failure."""


def _manifest_schema(encoding: Any) -> str:
    return PROJECTED_STATIC_SCHEMA if encoding.projected_static else SCHEMA


def _learned_schema(encoding: Any) -> str:
    return PROJECTED_LEARNED_SCHEMA if encoding.projected_static else LEARNED_SCHEMA


def _survivor_schema(encoding: Any) -> str:
    return (
        PROJECTED_SURVIVOR_SCHEMA
        if encoding.projected_static
        else SURVIVOR_SCHEMA
    )


def _phase3_encoding(*, projected_static_v2: bool) -> Any:
    return sat.SatEncoding(
        CELL,
        blocker=True,
        cap=True,
        project_blockers=projected_static_v2,
        static_dual2=projected_static_v2,
        mincut_scope=(
            sat.MINCUT_SCOPE_CARD_GE_TEN if projected_static_v2 else None
        ),
    )


def _projected_static_v2_from_configuration(
    configuration: Mapping[str, Any],
    *,
    where: str,
) -> bool:
    signatures = {
        False: _phase3_encoding(projected_static_v2=False),
        True: _phase3_encoding(projected_static_v2=True),
    }
    for projected_static_v2, encoding in signatures.items():
        expected = {
            "mode": encoding.mode,
            "artifact_schema": _manifest_schema(encoding),
            "learned_record_schema": _learned_schema(encoding),
            "survivor_record_schema": _survivor_schema(encoding),
            "sat_encoding": encoding.configuration(),
        }
        if all(configuration.get(key) == value for key, value in expected.items()):
            return projected_static_v2
    raise StructuralCegarError(
        f"{where}: unsupported or mixed Phase-3 mode/schema configuration"
    )


def _validate_bootstrap_mode(encoding: Any, source: Path) -> None:
    expected_schema = _learned_schema(encoding)
    for index, record in enumerate(_strict_json_lines(source)):
        where = f"bootstrap record {index}"
        if record.get("schema") != expected_schema:
            raise StructuralCegarError(
                f"{where}: learned schema/mode mismatch"
            )
        semantic = record.get("semantic_assignment")
        if (
            encoding.project_blockers
            and isinstance(semantic, Mapping)
            and any(
                isinstance(name, str) and name.startswith("b[")
                for name in semantic
            )
        ):
            raise StructuralCegarError(
                f"{where}: projected bootstrap contains b atoms"
            )


def _canonical_bytes(value: Any) -> bytes:
    return json.dumps(
        value, sort_keys=True, separators=(",", ":"), allow_nan=False
    ).encode("utf-8")


def _sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def _sha256_chunks(chunks: Sequence[bytes]) -> str:
    digest = hashlib.sha256()
    for chunk in chunks:
        digest.update(chunk)
    return digest.hexdigest()


def _sha256_value(value: Any) -> str:
    return _sha256_bytes(_canonical_bytes(value))


def _sha256_file(path: Path) -> str:
    return _sha256_bytes(path.read_bytes())


def _atomic_bytes(path: Path, data: bytes) -> None:
    _atomic_byte_chunks(path, (data,))


def _atomic_byte_chunks(path: Path, chunks: Sequence[bytes]) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    fd, temporary = tempfile.mkstemp(
        dir=str(path.parent), prefix=f".{path.name}-", suffix=".tmp"
    )
    try:
        with os.fdopen(fd, "wb") as handle:
            for chunk in chunks:
                handle.write(chunk)
            handle.flush()
            os.fsync(handle.fileno())
        os.replace(temporary, path)
    except BaseException:
        with contextlib.suppress(OSError):
            os.remove(temporary)
        raise


def _atomic_json(path: Path, value: Any) -> None:
    _atomic_bytes(path, json.dumps(value, indent=2, sort_keys=True).encode() + b"\n")


def _append_record(path: Path, value: Mapping[str, Any]) -> None:
    data = _canonical_bytes(value) + b"\n"
    with path.open("ab") as handle:
        handle.write(data)
        handle.flush()
        os.fsync(handle.fileno())


def _strict_json_lines(path: Path) -> list[dict[str, Any]]:
    if not path.is_file():
        raise StructuralCegarError(f"missing artifact {path}")
    records: list[dict[str, Any]] = []
    for line_number, raw in enumerate(path.read_bytes().splitlines(), start=1):
        if not raw.strip():
            raise StructuralCegarError(f"{path}:{line_number}: blank JSONL line")
        try:
            value = json.loads(
                raw,
                parse_constant=lambda token: (_ for _ in ()).throw(
                    ValueError(f"invalid JSON constant {token}")
                ),
                object_pairs_hook=_object_without_duplicate_keys,
            )
        except (UnicodeDecodeError, json.JSONDecodeError, ValueError) as exc:
            raise StructuralCegarError(
                f"{path}:{line_number}: invalid JSON: {exc}"
            ) from exc
        if not isinstance(value, dict):
            raise StructuralCegarError(f"{path}:{line_number}: expected object")
        records.append(value)
    return records


def _strict_json(path: Path) -> dict[str, Any]:
    if not path.is_file():
        raise StructuralCegarError(f"missing artifact {path}")
    try:
        value = json.loads(
            path.read_bytes(),
            parse_constant=lambda token: (_ for _ in ()).throw(
                ValueError(f"invalid JSON constant {token}")
            ),
            object_pairs_hook=_object_without_duplicate_keys,
        )
    except (UnicodeDecodeError, json.JSONDecodeError, ValueError) as exc:
        raise StructuralCegarError(f"{path}: invalid JSON: {exc}") from exc
    if not isinstance(value, dict):
        raise StructuralCegarError(f"{path}: expected object")
    return value


def _object_without_duplicate_keys(
    pairs: list[tuple[str, Any]],
) -> dict[str, Any]:
    value: dict[str, Any] = {}
    for key, item in pairs:
        if key in value:
            raise ValueError(f"duplicate JSON key {key!r}")
        value[key] = item
    return value


def _with_record_hash(
    unsigned: Mapping[str, Any], previous: str | None
) -> dict[str, Any]:
    payload = {**unsigned, "previous_record_sha256": previous}
    return {**payload, "record_sha256": _sha256_value(payload)}


def _validate_record_hash(
    record: Mapping[str, Any], previous: str | None, *, where: str
) -> None:
    payload = dict(record)
    claimed = payload.pop("record_sha256", None)
    if payload.get("previous_record_sha256") != previous:
        raise StructuralCegarError(f"{where}: broken record hash chain")
    if not isinstance(claimed, str) or claimed != _sha256_value(payload):
        raise StructuralCegarError(f"{where}: invalid record hash")


def _stable_semantic_variables(
    encoding: Any, depth: int
) -> tuple[tuple[str, int, tuple[Any, ...]], ...]:
    if not 1 <= depth <= MAX_CUBE_DEPTH:
        raise StructuralCegarError(
            f"cube_depth must be in 1..{MAX_CUBE_DEPTH}"
        )
    ordered = tuple(
        sorted(
            (
                encoding.semantic_name(variable),
                variable,
                tuple(encoding.key_for[variable]),
            )
            for variable in encoding.semantic_vars
        )
    )
    if depth > len(ordered):
        raise StructuralCegarError("cube_depth exceeds semantic variable count")
    selected = ordered[:depth]
    if len({name for name, _variable, _key in selected}) != depth:
        raise StructuralCegarError("semantic variable names are not unique")
    return selected


def _cube_partition(
    encoding: Any, depth: int
) -> tuple[tuple[int, ...], ...]:
    variables = tuple(
        variable
        for _name, variable, _key in _stable_semantic_variables(
            encoding, depth
        )
    )
    cubes = tuple(
        tuple(
            variable
            if (cube_index >> (depth - position - 1)) & 1
            else -variable
            for position, variable in enumerate(variables)
        )
        for cube_index in range(1 << depth)
    )
    expected_patterns = set(itertools.product((False, True), repeat=depth))
    observed_patterns = {
        tuple(literal > 0 for literal in cube) for cube in cubes
    }
    if observed_patterns != expected_patterns:
        raise StructuralCegarError("cube partition is not exhaustive")
    if any(
        tuple(abs(literal) for literal in cube) != variables for cube in cubes
    ):
        raise StructuralCegarError("cube partition variable order drift")
    return cubes


def _shard_spec(
    encoding: Any,
    *,
    depth: int,
    index: int,
    global_base_cnf_sha256: str | None = None,
) -> dict[str, Any]:
    if type(depth) is not int or not 1 <= depth <= MAX_CUBE_DEPTH:
        raise StructuralCegarError(
            f"shard_depth must be in 1..{MAX_CUBE_DEPTH}"
        )
    if type(index) is not int or not 0 <= index < 1 << depth:
        raise StructuralCegarError(
            f"shard_index must be in 0..{(1 << depth) - 1}"
        )
    variables = _stable_semantic_variables(encoding, depth)
    partition = _cube_partition(encoding, depth)
    literals = partition[index]
    shard_base_cnf_sha256 = _sha256_bytes(
        encoding.cnf_bytes(tuple((literal,) for literal in literals))
    )
    return {
        "depth": depth,
        "index": index,
        "shard_count": 1 << depth,
        "semantic_variables": [
            {
                "position": position,
                "name": name,
                "variable": variable,
                "key": list(key),
            }
            for position, (name, variable, key) in enumerate(variables)
        ],
        "literals": list(literals),
        "cube_sha256": _sha256_value(list(literals)),
        "partition_sha256": _sha256_value(
            [list(cube) for cube in partition]
        ),
        "shard_base_cnf_sha256": shard_base_cnf_sha256,
        "global_base_cnf_sha256": (
            _sha256_bytes(encoding.cnf_bytes())
            if global_base_cnf_sha256 is None
            else global_base_cnf_sha256
        ),
        "claim_scope": (
            "this process covers exactly one canonical Boolean shard; only a "
            "separate exact-coverage verifier may promote all shard-local "
            "terminal proofs to a global claim"
        ),
    }


def _validate_shard_assignment(
    assignment: Mapping[int, bool],
    shard_literals: Sequence[int],
    *,
    where: str,
) -> None:
    for literal in shard_literals:
        if not _literal_true(int(literal), assignment):
            raise StructuralCegarError(
                f"{where}: SAT assignment violates fixed shard literal {literal}"
            )


def _cube_plan(
    encoding: Any,
    *,
    depth: int,
    batch_index: int,
    snapshot: Mapping[str, Any],
) -> dict[str, Any]:
    variables = _stable_semantic_variables(encoding, depth)
    cubes = _cube_partition(encoding, depth)
    unsigned = {
        "schema": CUBE_PLAN_SCHEMA,
        "batch_index": batch_index,
        "depth": depth,
        "cube_count": len(cubes),
        "semantic_variables": [
            {
                "position": position,
                "name": name,
                "variable": variable,
                "key": list(key),
            }
            for position, (name, variable, key) in enumerate(variables)
        ],
        "cubes": [
            {
                "cube_index": cube_index,
                "literals": list(cube),
                "cube_sha256": _sha256_value(
                    {
                        "cube_index": cube_index,
                        "literals": list(cube),
                    }
                ),
            }
            for cube_index, cube in enumerate(cubes)
        ],
        "snapshot": dict(snapshot),
        "partition": (
            "all Boolean valuations of the named semantic variables in "
            "false-before-true lexicographic order"
        ),
        "claim_scope": (
            "local solver scheduling artifact only; no terminal, theorem-level, "
            "completeness, or non-existence claim"
        ),
    }
    return {**unsigned, "plan_sha256": _sha256_value(unsigned)}


def _cube_common_clause_body(
    encoding: Any, extra_clauses: Sequence[Sequence[int]]
) -> tuple[bytes, int]:
    clauses = [*encoding.clauses, *(tuple(clause) for clause in extra_clauses)]
    return encoding.cnf_clause_body_bytes(clauses), len(clauses)


def _cube_cnf_chunks(
    encoding: Any,
    common_clause_body: bytes,
    common_clause_count: int,
    cube: Sequence[int],
) -> tuple[bytes, bytes, bytes]:
    cube_clauses = tuple((int(literal),) for literal in cube)
    return (
        encoding.cnf_header_bytes(common_clause_count + len(cube_clauses)),
        common_clause_body,
        encoding.cnf_clause_body_bytes(cube_clauses),
    )


def _cube_snapshot(
    encoding: Any,
    *,
    extra_clauses: Sequence[Sequence[int]],
    learned: Sequence[Mapping[str, Any]],
    survivors: Sequence[Mapping[str, Any]],
    logs: Sequence[Mapping[str, Any]],
    common_clause_body: bytes | None = None,
    common_clause_count: int | None = None,
    base_cnf_sha256: str | None = None,
) -> dict[str, Any]:
    if common_clause_body is None or common_clause_count is None:
        common_clause_body, common_clause_count = _cube_common_clause_body(
            encoding, extra_clauses
        )
    common_chunks = (
        encoding.cnf_header_bytes(common_clause_count),
        common_clause_body,
    )
    return {
        "base_cnf_sha256": (
            _sha256_bytes(encoding.cnf_bytes())
            if base_cnf_sha256 is None
            else base_cnf_sha256
        ),
        "cnf_sha256": _sha256_chunks(common_chunks),
        "clause_count": common_clause_count,
        "extra_clauses_sha256": _sha256_value(
            [list(clause) for clause in extra_clauses]
        ),
        "learned_count": len(learned),
        "learned_head_sha256": (
            learned[-1]["record_sha256"] if learned else None
        ),
        "survivor_count": len(survivors),
        "survivor_head_sha256": (
            survivors[-1]["record_sha256"] if survivors else None
        ),
        "solver_log_count": len(logs),
        "solver_log_head_sha256": logs[-1]["record_sha256"] if logs else None,
    }


def _live_cube_snapshot_counts(
    plan: Mapping[str, Any],
    *,
    learned: Sequence[Mapping[str, Any]],
    survivors: Sequence[Mapping[str, Any]],
    survivor_clauses: Sequence[Sequence[int]],
    logs: Sequence[Mapping[str, Any]],
) -> tuple[int, int]:
    snapshot = plan.get("snapshot")
    if not isinstance(snapshot, Mapping):
        raise StructuralCegarError("live cube plan snapshot is not an object")
    streams = (
        ("learned", learned),
        ("survivor", survivors),
        ("solver_log", logs),
    )
    counts: dict[str, int] = {}
    for name, records in streams:
        count = snapshot.get(f"{name}_count")
        expected_head = snapshot.get(f"{name}_head_sha256")
        actual_head = records[-1]["record_sha256"] if records else None
        if (
            type(count) is not int
            or count != len(records)
            or expected_head != actual_head
        ):
            raise StructuralCegarError(
                f"live cube plan {name} snapshot mismatch"
            )
        counts[name] = count
    if len(survivors) != len(survivor_clauses):
        raise StructuralCegarError(
            "live cube survivor record/clause count mismatch"
        )
    return counts["learned"], counts["survivor"]


def _validate_cube_plan(
    plan: Mapping[str, Any],
    encoding: Any,
    *,
    depth: int,
    batch_index: int,
    snapshot: Mapping[str, Any],
) -> dict[str, Any]:
    expected = _cube_plan(
        encoding,
        depth=depth,
        batch_index=batch_index,
        snapshot=snapshot,
    )
    if dict(plan) != expected:
        raise StructuralCegarError("cube plan replay mismatch")
    return expected


def _literal_true(literal: int, assignment: Mapping[int, bool]) -> bool:
    variable = abs(literal)
    if variable not in assignment:
        raise StructuralCegarError(
            f"assignment omits clause variable {variable}"
        )
    return assignment[variable] if literal > 0 else not assignment[variable]


def _clause_satisfied(
    clause: Sequence[int], assignment: Mapping[int, bool]
) -> bool:
    return any(_literal_true(literal, assignment) for literal in clause)


def _metric_rows(obj: Any) -> tuple[Any, ...]:
    if not isinstance(obj, sat.AnnotatedNode):
        raise StructuralCegarError("profiled SAT model did not decode as AnnotatedNode")
    rows = realize.metric_rows(obj)
    if len(rows) != CELL.n:
        raise StructuralCegarError("metric translation did not produce ten rows")
    for center, row in enumerate(rows):
        _validate_phase3_row(row, expected_center=center)
    return rows


def _validate_phase3_row(row: Any, *, expected_center: int | None = None) -> None:
    if not isinstance(row, metric.MetricRow):
        raise StructuralCegarError("certificate/metric row has wrong type")
    if type(row.center) is not int or not 0 <= row.center < CELL.n:
        raise StructuralCegarError("row center is out of range")
    if expected_center is not None and row.center != expected_center:
        raise StructuralCegarError("metric rows are not in center order")
    if row.exact is not False:
        raise StructuralCegarError("Phase-3 metric row must have exact=False")
    if len(row.support) != CELL.k or len(set(row.support)) != CELL.k:
        raise StructuralCegarError("certificate row is not a distinct four-support")
    if row.center in row.support:
        raise StructuralCegarError("certificate row contains its center")
    if any(type(point) is not int or not 0 <= point < CELL.n for point in row.support):
        raise StructuralCegarError("certificate row support is out of range")


def _detection(rows: Sequence[Any]) -> dict[str, Any] | None:
    try:
        found = metric._formalized_metric_core(
            rows,
            CELL.n,
            (),
            include_extended=True,
            include_ordered=False,
        )
    except Exception as exc:
        raise StructuralCegarError(f"formalized metric-core detector failed: {exc}") from exc
    if found is None:
        return None
    if (
        not isinstance(found, dict)
        or set(found) != {"stage", "core"}
        or found["stage"] not in screen.ORDER_INDEPENDENT_STAGES
        or not isinstance(found["core"], dict)
    ):
        raise StructuralCegarError("detector returned an unsupported witness")
    return found


def _certificate(
    rows: Sequence[Any], detection: Mapping[str, Any]
) -> tuple[dict[str, Any], tuple[Any, ...]]:
    try:
        certificate = certificates._certificate_for_detection(
            rows, CELL.n, detection
        )
        replayed = certificates._validate_certificate(certificate, n=CELL.n)
    except Exception as exc:
        raise StructuralCegarError(
            f"certificate export/independent replay failed: {exc}"
        ) from exc
    if replayed is not True:
        raise StructuralCegarError("certificate validator did not return True")
    key = certificates._key_from_rows_json(certificate["rows"])
    selected = tuple(
        metric.MetricRow(center, support, exact)
        for center, support, exact in key
    )
    if not selected:
        raise StructuralCegarError("certificate contains no rows")
    centers: set[int] = set()
    for row in selected:
        _validate_phase3_row(row)
        if row.center in centers:
            raise StructuralCegarError("certificate has two rows at one center")
        centers.add(row.center)
    return dict(certificate), selected


def _replay_certificate_json(
    value: Any,
) -> tuple[dict[str, Any], tuple[Any, ...]]:
    if not isinstance(value, dict):
        raise StructuralCegarError("learned certificate is not an object")
    try:
        replayed = certificates._validate_certificate(value, n=CELL.n)
        key = certificates._key_from_rows_json(value["rows"])
    except Exception as exc:
        raise StructuralCegarError(
            f"stored certificate replay failed: {exc}"
        ) from exc
    if replayed is not True:
        raise StructuralCegarError("stored certificate validator did not return True")
    selected = tuple(
        metric.MetricRow(center, support, exact)
        for center, support, exact in key
    )
    if not selected:
        raise StructuralCegarError("stored certificate contains no rows")
    centers: set[int] = set()
    for row in selected:
        _validate_phase3_row(row)
        if row.center in centers:
            raise StructuralCegarError("stored certificate repeats a center")
        centers.add(row.center)
    return dict(value), selected


def _duplicate_center_path_memberships(
    certificate: Mapping[str, Any],
) -> tuple[tuple[int, int], ...]:
    """Return exactly the row memberships used by a checked duplicate core.

    ``Phase3DuplicateCenterCertificate`` checks primitive row steps directly
    against the proof-facing row pattern.  Consequently, unused members of a
    selected four-support row are not antecedents of the contradiction.
    """

    if certificate.get("stage") != DUPLICATE_CENTER_STAGE:
        raise StructuralCegarError(
            "path-membership projection requires a duplicate-center certificate"
        )
    core = certificate.get("core")
    if not isinstance(core, dict) or set(core) != {"triple", "centers"}:
        raise StructuralCegarError("duplicate-center core fields mismatch")
    triple = core.get("triple")
    centers = core.get("centers")
    if (
        not isinstance(triple, list)
        or not isinstance(centers, list)
        or len(triple) != 3
        or len(centers) != 2
        or any(type(label) is not int for label in (*triple, *centers))
        or any(not 0 <= label < CELL.n for label in (*triple, *centers))
        or len(set(triple)) != 3
        or len(set(centers)) != 2
    ):
        raise StructuralCegarError(
            "duplicate-center core side conditions mismatch"
        )
    if certificate.get("side_conditions") != [
        {"kind": "injective-realization"}
    ]:
        raise StructuralCegarError(
            "duplicate-center injective-realization side condition mismatch"
        )
    try:
        obligations = certificates._core_obligations(
            DUPLICATE_CENTER_STAGE, core
        )
    except Exception as exc:
        raise StructuralCegarError(
            f"duplicate-center obligations are malformed: {exc}"
        ) from exc
    paths = certificate.get("closure_paths")
    if not isinstance(paths, list) or len(paths) != len(obligations):
        raise StructuralCegarError("duplicate-center closure-path count mismatch")
    memberships: set[tuple[int, int]] = set()
    for path, (field, first, last) in zip(paths, obligations):
        if (
            not isinstance(path, dict)
            or path.get("field") != field
            or path.get("first") != list(first)
            or path.get("last") != list(last)
            or not isinstance(path.get("steps"), list)
        ):
            raise StructuralCegarError(
                "duplicate-center closure-path linkage mismatch"
            )
        for step in path["steps"]:
            if not isinstance(step, dict):
                raise StructuralCegarError(
                    "duplicate-center primitive step is malformed"
                )
            if step.get("kind") == "flip":
                if set(step) != {"kind", "first", "second"}:
                    raise StructuralCegarError(
                        "duplicate-center flip-step fields mismatch"
                    )
                continue
            if step.get("kind") != "row" or set(step) != {
                "kind",
                "center",
                "first",
                "second",
            }:
                raise StructuralCegarError(
                    "duplicate-center row-step fields mismatch"
                )
            center = step["center"]
            first_point = step["first"]
            second_point = step["second"]
            if (
                type(center) is not int
                or type(first_point) is not int
                or type(second_point) is not int
                or center in {first_point, second_point}
                or first_point == second_point
                or any(
                    not 0 <= label < CELL.n
                    for label in (center, first_point, second_point)
                )
            ):
                raise StructuralCegarError(
                    "duplicate-center row-step labels mismatch"
                )
            memberships.add((center, first_point))
            memberships.add((center, second_point))
    normalized = tuple(sorted(memberships))
    if not normalized:
        raise StructuralCegarError(
            "duplicate-center certificate uses no row memberships"
        )
    return normalized


def _cap_facts(obj: Any) -> tuple[tuple[int, int], ...]:
    caps = getattr(obj, "caps", None)
    if caps is None:
        raise StructuralCegarError("cap-order certificate requires cap annotation")
    if caps.M != frozenset({0, 1, 2}):
        raise StructuralCegarError("cap-order certificate requires M={0,1,2}")
    facts = tuple(sorted((label, cap) for label, cap in caps.f.items()))
    if (
        tuple(label for label, _cap in facts) != tuple(range(3, CELL.n))
        or any(type(cap) is not int or cap not in (0, 1, 2) for _label, cap in facts)
        or caps.closed_profile() != CELL.profile
    ):
        raise StructuralCegarError("cap-order annotation is outside the Phase-3 cell")
    return facts


def _cap_orders_from_facts(
    facts: Sequence[tuple[int, int]],
) -> tuple[tuple[str, tuple[int, ...]], ...]:
    normalized = tuple(facts)
    if (
        any(
            not isinstance(fact, tuple)
            or len(fact) != 2
            or type(fact[0]) is not int
            or type(fact[1]) is not int
            for fact in normalized
        )
        or normalized != tuple(sorted(set(normalized)))
        or tuple(label for label, _cap in normalized) != tuple(range(3, CELL.n))
        or any(type(cap) is not int or cap not in (0, 1, 2) for _label, cap in normalized)
    ):
        raise StructuralCegarError("stored cap facts are invalid or incomplete")
    fibers = tuple(
        tuple(label for label, cap in normalized if cap == index)
        for index in range(3)
    )
    if sorted(map(len, fibers)) != [2, 2, 3]:
        raise StructuralCegarError("stored cap facts do not have fiber sizes (2,2,3)")
    raw = sorted(
        {
            (0, *fiber2, 1, *fiber0, 2, *fiber1)
            for fiber2, fiber0, fiber1 in itertools.product(
                itertools.permutations(fibers[2]),
                itertools.permutations(fibers[0]),
                itertools.permutations(fibers[1]),
            )
        }
    )
    if len(raw) != 24 or any(sorted(order) != list(range(CELL.n)) for order in raw):
        raise StructuralCegarError("stored cap facts do not generate exactly 24 orders")
    return tuple((f"order-{index:02d}", order) for index, order in enumerate(raw))


def _cyclic_subsequence(
    order: Sequence[int], roles: Sequence[int]
) -> bool:
    if (
        sorted(order) != list(range(CELL.n))
        or len(set(roles)) != len(roles)
        or any(role not in order for role in roles)
    ):
        return False
    cyclic = tuple(order)
    target = tuple(roles)
    for start in range(CELL.n):
        rotated = cyclic[start:] + cyclic[:start]
        positions = [rotated.index(role) for role in target]
        if positions == sorted(positions):
            return True
    return False


def _cap_order_selected_rows(
    closure_certificates: Sequence[Mapping[str, Any]],
) -> tuple[Any, ...]:
    by_center: dict[int, Any] = {}
    for closure_certificate in closure_certificates:
        _replayed, selected = _replay_certificate_json(closure_certificate)
        for row in selected:
            old = by_center.get(row.center)
            if old is not None and old != row:
                raise StructuralCegarError(
                    "cap-order closure certificates select two rows at one center"
                )
            by_center[row.center] = row
    if not by_center:
        raise StructuralCegarError("cap-order certificate selects no metric rows")
    return tuple(by_center[center] for center in sorted(by_center))


def _all_phase3_cap_annotations() -> tuple[tuple[tuple[int, int], ...], ...]:
    annotations: list[tuple[tuple[int, int], ...]] = []
    labels = tuple(range(3, CELL.n))
    for values in itertools.product(range(3), repeat=len(labels)):
        if sorted(Counter(values).values()) != [2, 2, 3]:
            continue
        annotations.append(tuple(zip(labels, values, strict=True)))
    return tuple(annotations)


def _compatible_cap_coverage(
    retained_facts: Sequence[tuple[int, int]],
    closure_certificates: Sequence[Mapping[str, Any]],
    *,
    core_roles: Sequence[str] = ("a", "x", "b", "c", "y"),
) -> dict[str, Any] | None:
    retained = tuple(retained_facts)
    roles_key = tuple(core_roles)
    if not roles_key or len(roles_key) != len(set(roles_key)):
        raise StructuralCegarError("cap-order core roles are empty or duplicate")
    if retained != tuple(sorted(set(retained))):
        raise StructuralCegarError("retained cap facts are duplicate or unsorted")
    descriptors: list[tuple[str, tuple[int, ...]]] = []
    for closure_certificate in closure_certificates:
        proof_sha256 = closure_certificate.get("proof_sha256")
        core = closure_certificate.get("core")
        if (
            not isinstance(proof_sha256, str)
            or not isinstance(core, dict)
            or set(core) != set(roles_key)
            or any(type(label) is not int for label in core.values())
        ):
            raise StructuralCegarError("cap-order closure descriptor is malformed")
        descriptors.append(
            (
                proof_sha256,
                tuple(core[name] for name in roles_key),
            )
        )
    descriptors.sort()
    stream: list[dict[str, Any]] = []
    annotation_count = 0
    retained_set = set(retained)
    for facts in _all_phase3_cap_annotations():
        if not retained_set.issubset(facts):
            continue
        annotation_count += 1
        for order_id, order in _cap_orders_from_facts(facts):
            match: tuple[str, str] | None = None
            for proof_sha256, roles in descriptors:
                if _cyclic_subsequence(order, roles):
                    match = (proof_sha256, "forward")
                    break
                if _cyclic_subsequence(tuple(reversed(order)), roles):
                    match = (proof_sha256, "reverse")
                    break
            if match is None:
                return None
            stream.append(
                {
                    "f": [list(fact) for fact in facts],
                    "order_id": order_id,
                    "closure_proof_sha256": match[0],
                    "orientation": match[1],
                }
            )
    if annotation_count == 0:
        raise StructuralCegarError("retained cap facts have no compatible annotation")
    return {
        "compatible_annotation_count": annotation_count,
        "compatible_order_count": len(stream),
        "compatible_order_coverage_sha256": _sha256_value(stream),
    }


def _minimize_cap_facts(
    source_facts: Sequence[tuple[int, int]],
    closure_certificates: Sequence[Mapping[str, Any]],
    *,
    core_roles: Sequence[str] = ("a", "x", "b", "c", "y"),
) -> tuple[tuple[tuple[int, int], ...], dict[str, Any]]:
    source = tuple(source_facts)
    _cap_orders_from_facts(source)
    for size in range(len(source) + 1):
        for candidate in itertools.combinations(source, size):
            coverage = _compatible_cap_coverage(
                candidate,
                closure_certificates,
                core_roles=core_roles,
            )
            if coverage is not None:
                retained = tuple(candidate)
                return retained, {
                    "method": (
                        "exact-cardinality-then-lexicographic-subset-enumeration"
                    ),
                    "source_fact_count": len(source),
                    "retained_fact_count": len(retained),
                    "retained_facts": [list(fact) for fact in retained],
                    **coverage,
                }
    raise StructuralCegarError("no sound cap-fact antecedent exists")


def _cap_order_certificate(
    obj: Any, rows: Sequence[Any]
) -> tuple[dict[str, Any], tuple[Any, ...], tuple[tuple[int, int], ...]] | None:
    if len(rows) != CELL.n:
        raise StructuralCegarError("cap-order detector requires ten metric rows")
    for center, row in enumerate(rows):
        _validate_phase3_row(row, expected_center=center)
    if tuple(rows) != _metric_rows(obj):
        raise StructuralCegarError("cap-order rows do not match the annotated node")
    facts = _cap_facts(obj)
    replay_orders = _cap_orders_from_facts(facts)
    try:
        realized_orders = tuple(
            (spec.order_id, tuple(spec.order)) for spec in realize.cap_orders(obj)
        )
    except Exception as exc:
        raise StructuralCegarError(f"cap-order construction failed: {exc}") from exc
    if realized_orders != replay_orders:
        raise StructuralCegarError("independent cap-order construction drift")

    closure_by_hash: dict[str, dict[str, Any]] = {}
    coverage: list[dict[str, Any]] = []
    for order_id, order in realized_orders:
        detection: dict[str, Any] | None = None
        orientation = ""
        for candidate_orientation, candidate_stage, candidate_order in (
            ("forward", CAP_ORDER_FORWARD_STAGE, order),
            ("reverse", CAP_ORDER_REVERSE_STAGE, tuple(reversed(order))),
        ):
            try:
                core = metric._five_point_bisector_circle_core(
                    rows, CELL.n, candidate_order
                )
            except Exception as exc:
                raise StructuralCegarError(
                    f"cap-order five-point detector failed: {exc}"
                ) from exc
            if core is not None:
                detection = {"stage": candidate_stage, "core": core}
                orientation = candidate_orientation
                break
        if detection is None:
            return None
        closure_certificate, _selected = _certificate(rows, detection)
        proof_sha256 = closure_certificate.get("proof_sha256")
        if not isinstance(proof_sha256, str):
            raise StructuralCegarError("closure certificate has no proof hash")
        old = closure_by_hash.get(proof_sha256)
        if old is not None and old != closure_certificate:
            raise StructuralCegarError("closure certificate proof-hash collision")
        closure_by_hash[proof_sha256] = closure_certificate
        coverage.append(
            {
                "order_id": order_id,
                "order": list(order),
                "orientation": orientation,
                "stage": detection["stage"],
                "core": dict(detection["core"]),
                "closure_proof_sha256": proof_sha256,
                "lean_theorem": next(
                    consumer["theorem"]
                    for consumer in CAP_ORDER_LEAN_CONSUMERS
                    if consumer["orientation"] == orientation
                ),
            }
        )

    closure_certificates = [
        closure_by_hash[proof_sha256] for proof_sha256 in sorted(closure_by_hash)
    ]
    selected = _cap_order_selected_rows(closure_certificates)
    retained_facts, minimization = _minimize_cap_facts(
        facts, closure_certificates
    )
    antecedent = {
        "rows": [row.as_dict() for row in selected],
        "cap_memberships": [list(fact) for fact in retained_facts],
        "shell_membership_count": CELL.k * len(selected),
        "cap_membership_count": len(retained_facts),
        "literal_count": CELL.k * len(selected) + len(retained_facts),
    }
    unsigned = {
        "schema": CAP_ORDER_CERTIFICATE_SCHEMA,
        "n": CELL.n,
        "stage": CAP_ORDER_STAGE,
        "lean_consumers": [dict(consumer) for consumer in CAP_ORDER_LEAN_CONSUMERS],
        "order_sign_convention": (
            "Lean IsCcwConvexPolygon: forward cyclic roles give two negative "
            "signedArea2 hypotheses; reversed roles give two positive hypotheses"
        ),
        "cap_semantics": (
            "M={0,1,2}; cap_orders has no reflection quotient; minimization "
            "ranges over every Phase-3 f completion with fiber sizes (2,2,3)"
        ),
        "cap_annotation": {
            "M": [0, 1, 2],
            "f": [list(fact) for fact in facts],
            "closed_profile": list(CELL.profile),
        },
        "cap_minimization": minimization,
        "closure_certificates": closure_certificates,
        "order_coverage": coverage,
        "order_count": len(coverage),
        "order_coverage_sha256": _sha256_value(coverage),
        "antecedent": antecedent,
    }
    certificate = {
        **unsigned,
        "certificate_payload_sha256": _sha256_value(unsigned),
    }
    replayed, replayed_rows, replayed_facts = _replay_cap_order_certificate(
        certificate
    )
    if (
        replayed != certificate
        or replayed_rows != selected
        or replayed_facts != retained_facts
    ):
        raise StructuralCegarError("cap-order certificate self-replay drift")
    return certificate, selected, retained_facts


def _replay_cap_order_certificate(
    value: Any,
) -> tuple[dict[str, Any], tuple[Any, ...], tuple[tuple[int, int], ...]]:
    if not isinstance(value, dict):
        raise StructuralCegarError("cap-order certificate is not an object")
    expected_keys = {
        "schema",
        "n",
        "stage",
        "lean_consumers",
        "order_sign_convention",
        "cap_semantics",
        "cap_annotation",
        "cap_minimization",
        "closure_certificates",
        "order_coverage",
        "order_count",
        "order_coverage_sha256",
        "antecedent",
        "certificate_payload_sha256",
    }
    if set(value) != expected_keys:
        raise StructuralCegarError("cap-order certificate fields mismatch")
    if (
        value["schema"] != CAP_ORDER_CERTIFICATE_SCHEMA
        or value["n"] != CELL.n
        or value["stage"] != CAP_ORDER_STAGE
        or value["lean_consumers"]
        != [dict(consumer) for consumer in CAP_ORDER_LEAN_CONSUMERS]
        or value["order_sign_convention"]
        != (
            "Lean IsCcwConvexPolygon: forward cyclic roles give two negative "
            "signedArea2 hypotheses; reversed roles give two positive hypotheses"
        )
        or value["cap_semantics"]
        != (
            "M={0,1,2}; cap_orders has no reflection quotient; minimization "
            "ranges over every Phase-3 f completion with fiber sizes (2,2,3)"
        )
    ):
        raise StructuralCegarError("cap-order certificate identity mismatch")
    cap_annotation = value["cap_annotation"]
    if not isinstance(cap_annotation, dict) or set(cap_annotation) != {
        "M",
        "f",
        "closed_profile",
    }:
        raise StructuralCegarError("cap-order annotation fields mismatch")
    try:
        facts = tuple(
            (pair[0], pair[1])
            for pair in cap_annotation["f"]
            if isinstance(pair, list) and len(pair) == 2
        )
    except (TypeError, IndexError) as exc:
        raise StructuralCegarError("cap-order facts are malformed") from exc
    if (
        len(facts) != len(cap_annotation["f"])
        or cap_annotation["M"] != [0, 1, 2]
        or cap_annotation["closed_profile"] != list(CELL.profile)
    ):
        raise StructuralCegarError("cap-order annotation mismatch")
    replay_orders = _cap_orders_from_facts(facts)

    closure_certificates = value["closure_certificates"]
    if not isinstance(closure_certificates, list) or not closure_certificates:
        raise StructuralCegarError("cap-order closure certificate list is empty")
    closure_by_hash: dict[str, tuple[dict[str, Any], tuple[Any, ...]]] = {}
    previous_hash: str | None = None
    for closure_value in closure_certificates:
        closure_certificate, closure_rows = _replay_certificate_json(closure_value)
        proof_sha256 = closure_certificate.get("proof_sha256")
        if (
            not isinstance(proof_sha256, str)
            or (previous_hash is not None and proof_sha256 <= previous_hash)
            or proof_sha256 in closure_by_hash
            or closure_certificate.get("stage")
            not in {CAP_ORDER_FORWARD_STAGE, CAP_ORDER_REVERSE_STAGE}
        ):
            raise StructuralCegarError(
                "cap-order closure certificate order/stage mismatch"
            )
        closure_by_hash[proof_sha256] = (closure_certificate, closure_rows)
        previous_hash = proof_sha256

    coverage = value["order_coverage"]
    if (
        not isinstance(coverage, list)
        or value["order_count"] != len(replay_orders)
        or len(coverage) != len(replay_orders)
        or value["order_coverage_sha256"] != _sha256_value(coverage)
    ):
        raise StructuralCegarError("cap-order coverage count/hash mismatch")
    used_closures: set[str] = set()
    for entry, (order_id, order) in zip(coverage, replay_orders, strict=True):
        if not isinstance(entry, dict) or set(entry) != {
            "order_id",
            "order",
            "orientation",
            "stage",
            "core",
            "closure_proof_sha256",
            "lean_theorem",
        }:
            raise StructuralCegarError("cap-order coverage entry fields mismatch")
        if entry["order_id"] != order_id or entry["order"] != list(order):
            raise StructuralCegarError("cap-order coverage order mismatch")
        orientation = entry["orientation"]
        expected_stage = {
            "forward": CAP_ORDER_FORWARD_STAGE,
            "reverse": CAP_ORDER_REVERSE_STAGE,
        }.get(orientation)
        if expected_stage is None or entry["stage"] != expected_stage:
            raise StructuralCegarError("cap-order coverage orientation mismatch")
        expected_theorem = next(
            consumer["theorem"]
            for consumer in CAP_ORDER_LEAN_CONSUMERS
            if consumer["orientation"] == orientation
        )
        if entry["lean_theorem"] != expected_theorem:
            raise StructuralCegarError("cap-order Lean theorem mapping mismatch")
        closure_proof_sha256 = entry["closure_proof_sha256"]
        closure_entry = closure_by_hash.get(closure_proof_sha256)
        if closure_entry is None:
            raise StructuralCegarError("cap-order coverage closure is missing")
        closure_certificate, _closure_rows = closure_entry
        core = entry["core"]
        if (
            not isinstance(core, dict)
            or set(core) != {"a", "x", "b", "c", "y"}
            or any(type(label) is not int for label in core.values())
            or closure_certificate.get("stage") != expected_stage
            or closure_certificate.get("core") != core
        ):
            raise StructuralCegarError("cap-order coverage core mismatch")
        roles = tuple(core[name] for name in ("a", "x", "b", "c", "y"))
        oriented_order = order if orientation == "forward" else tuple(reversed(order))
        if not _cyclic_subsequence(oriented_order, roles):
            raise StructuralCegarError(
                "cap-order core is not in the certified cyclic order"
            )
        used_closures.add(closure_proof_sha256)
    if used_closures != set(closure_by_hash):
        raise StructuralCegarError("cap-order certificate contains unused closures")

    ordered_closures = [entry[0] for entry in closure_by_hash.values()]
    retained_facts, expected_minimization = _minimize_cap_facts(
        facts, ordered_closures
    )
    if value["cap_minimization"] != expected_minimization:
        raise StructuralCegarError("cap-order minimization claim mismatch")
    selected = _cap_order_selected_rows(ordered_closures)
    expected_antecedent = {
        "rows": [row.as_dict() for row in selected],
        "cap_memberships": [list(fact) for fact in retained_facts],
        "shell_membership_count": CELL.k * len(selected),
        "cap_membership_count": len(retained_facts),
        "literal_count": CELL.k * len(selected) + len(retained_facts),
    }
    if value["antecedent"] != expected_antecedent:
        raise StructuralCegarError("cap-order antecedent mismatch")
    unsigned = dict(value)
    payload_sha256 = unsigned.pop("certificate_payload_sha256")
    if payload_sha256 != _sha256_value(unsigned):
        raise StructuralCegarError("cap-order certificate payload hash mismatch")
    return dict(value), selected, retained_facts


def _rhombus_cap_order_certificate(
    obj: Any, rows: Sequence[Any]
) -> tuple[dict[str, Any], tuple[Any, ...], tuple[tuple[int, int], ...]] | None:
    if len(rows) != CELL.n:
        raise StructuralCegarError(
            "rhombus cap-order detector requires ten metric rows"
        )
    for center, row in enumerate(rows):
        _validate_phase3_row(row, expected_center=center)
    if tuple(rows) != _metric_rows(obj):
        raise StructuralCegarError(
            "rhombus cap-order rows do not match the annotated node"
        )
    facts = _cap_facts(obj)
    replay_orders = _cap_orders_from_facts(facts)
    try:
        realized_orders = tuple(
            (spec.order_id, tuple(spec.order)) for spec in realize.cap_orders(obj)
        )
    except Exception as exc:
        raise StructuralCegarError(
            f"rhombus cap-order construction failed: {exc}"
        ) from exc
    if realized_orders != replay_orders:
        raise StructuralCegarError(
            "independent rhombus cap-order construction drift"
        )
    try:
        ordered_rule = ordered_rules.build_convex_rhombus_order_record(
            rows, CELL.n, realized_orders
        )
    except ordered_rules.OrderedMetricRuleError as exc:
        raise StructuralCegarError(
            f"rhombus ordered-rule export failed: {exc}"
        ) from exc
    if ordered_rule is None:
        return None
    closure_certificates = ordered_rule["closure_certificates"]
    selected = _cap_order_selected_rows(closure_certificates)
    try:
        ordered_rules.replay_convex_rhombus_order_record(
            selected, CELL.n, replay_orders, ordered_rule
        )
    except ordered_rules.OrderedMetricRuleError as exc:
        raise StructuralCegarError(
            f"rhombus ordered-rule selected-row replay failed: {exc}"
        ) from exc
    retained_facts, minimization = _minimize_cap_facts(
        facts,
        closure_certificates,
        core_roles=ordered_rules.CORE_ROLES,
    )
    antecedent = {
        "rows": [row.as_dict() for row in selected],
        "cap_memberships": [list(fact) for fact in retained_facts],
        "shell_membership_count": CELL.k * len(selected),
        "cap_membership_count": len(retained_facts),
        "literal_count": CELL.k * len(selected) + len(retained_facts),
    }
    unsigned = {
        "schema": RHOMBUS_CAP_ORDER_CERTIFICATE_SCHEMA,
        "n": CELL.n,
        "stage": RHOMBUS_CAP_ORDER_STAGE,
        "ordered_rule": ordered_rule,
        "generic_lean_consumers": [
            dict(consumer) for consumer in ordered_rules.LEAN_CONSUMERS
        ],
        "concrete_ingress_trust_boundary": RHOMBUS_INGRESS_TRUST_BOUNDARY,
        "cap_semantics": (
            "M={0,1,2}; cap_orders has no reflection quotient; minimization "
            "ranges over every Phase-3 f completion with fiber sizes (2,2,3)"
        ),
        "cap_annotation": {
            "M": [0, 1, 2],
            "f": [list(fact) for fact in facts],
            "closed_profile": list(CELL.profile),
        },
        "cap_minimization": minimization,
        "antecedent": antecedent,
    }
    certificate = {
        **unsigned,
        "certificate_payload_sha256": _sha256_value(unsigned),
    }
    replayed, replayed_rows, replayed_facts = (
        _replay_rhombus_cap_order_certificate(certificate)
    )
    if (
        replayed != certificate
        or replayed_rows != selected
        or replayed_facts != retained_facts
    ):
        raise StructuralCegarError(
            "rhombus cap-order certificate self-replay drift"
        )
    return certificate, selected, retained_facts


def _replay_rhombus_cap_order_certificate(
    value: Any,
) -> tuple[dict[str, Any], tuple[Any, ...], tuple[tuple[int, int], ...]]:
    if not isinstance(value, dict):
        raise StructuralCegarError(
            "rhombus cap-order certificate is not an object"
        )
    expected_keys = {
        "schema",
        "n",
        "stage",
        "ordered_rule",
        "generic_lean_consumers",
        "concrete_ingress_trust_boundary",
        "cap_semantics",
        "cap_annotation",
        "cap_minimization",
        "antecedent",
        "certificate_payload_sha256",
    }
    if set(value) != expected_keys:
        raise StructuralCegarError(
            "rhombus cap-order certificate fields mismatch"
        )
    if (
        value["schema"] != RHOMBUS_CAP_ORDER_CERTIFICATE_SCHEMA
        or value["n"] != CELL.n
        or value["stage"] != RHOMBUS_CAP_ORDER_STAGE
        or value["generic_lean_consumers"]
        != [dict(consumer) for consumer in ordered_rules.LEAN_CONSUMERS]
        or value["concrete_ingress_trust_boundary"]
        != RHOMBUS_INGRESS_TRUST_BOUNDARY
        or value["cap_semantics"]
        != (
            "M={0,1,2}; cap_orders has no reflection quotient; minimization "
            "ranges over every Phase-3 f completion with fiber sizes (2,2,3)"
        )
    ):
        raise StructuralCegarError(
            "rhombus cap-order certificate identity mismatch"
        )
    cap_annotation = value["cap_annotation"]
    if not isinstance(cap_annotation, dict) or set(cap_annotation) != {
        "M",
        "f",
        "closed_profile",
    }:
        raise StructuralCegarError(
            "rhombus cap-order annotation fields mismatch"
        )
    try:
        facts = tuple(
            (pair[0], pair[1])
            for pair in cap_annotation["f"]
            if isinstance(pair, list) and len(pair) == 2
        )
    except (TypeError, IndexError) as exc:
        raise StructuralCegarError(
            "rhombus cap-order facts are malformed"
        ) from exc
    if (
        len(facts) != len(cap_annotation["f"])
        or cap_annotation["M"] != [0, 1, 2]
        or cap_annotation["closed_profile"] != list(CELL.profile)
    ):
        raise StructuralCegarError("rhombus cap-order annotation mismatch")
    replay_orders = _cap_orders_from_facts(facts)
    ordered_rule = value["ordered_rule"]
    if not isinstance(ordered_rule, dict):
        raise StructuralCegarError("rhombus ordered-rule record is malformed")
    closure_certificates = ordered_rule.get("closure_certificates")
    if not isinstance(closure_certificates, list):
        raise StructuralCegarError(
            "rhombus ordered-rule closure list is malformed"
        )
    selected = _cap_order_selected_rows(closure_certificates)
    try:
        ordered_rules.replay_convex_rhombus_order_record(
            selected, CELL.n, replay_orders, ordered_rule
        )
    except ordered_rules.OrderedMetricRuleError as exc:
        raise StructuralCegarError(
            f"rhombus ordered-rule replay failed: {exc}"
        ) from exc
    retained_facts, expected_minimization = _minimize_cap_facts(
        facts,
        closure_certificates,
        core_roles=ordered_rules.CORE_ROLES,
    )
    if value["cap_minimization"] != expected_minimization:
        raise StructuralCegarError(
            "rhombus cap-order minimization claim mismatch"
        )
    expected_antecedent = {
        "rows": [row.as_dict() for row in selected],
        "cap_memberships": [list(fact) for fact in retained_facts],
        "shell_membership_count": CELL.k * len(selected),
        "cap_membership_count": len(retained_facts),
        "literal_count": CELL.k * len(selected) + len(retained_facts),
    }
    if value["antecedent"] != expected_antecedent:
        raise StructuralCegarError("rhombus cap-order antecedent mismatch")
    unsigned = dict(value)
    payload_sha256 = unsigned.pop("certificate_payload_sha256")
    if payload_sha256 != _sha256_value(unsigned):
        raise StructuralCegarError(
            "rhombus cap-order certificate payload hash mismatch"
        )
    return dict(value), selected, retained_facts


def _kalmanson_rows_from_json(value: Any) -> tuple[Any, ...]:
    if not isinstance(value, list) or not value:
        raise StructuralCegarError("Kalmanson row list is empty or malformed")
    rows: list[Any] = []
    centers: set[int] = set()
    for raw in value:
        if not isinstance(raw, dict) or set(raw) != {
            "center",
            "support",
            "exact",
        }:
            raise StructuralCegarError("Kalmanson row descriptor is malformed")
        try:
            row = metric.MetricRow(
                raw["center"], tuple(raw["support"]), raw["exact"]
            )
        except Exception as exc:
            raise StructuralCegarError(
                f"could not decode Kalmanson row: {exc}"
            ) from exc
        _validate_phase3_row(row)
        if row.center in centers:
            raise StructuralCegarError("Kalmanson rows repeat a center")
        centers.add(row.center)
        rows.append(row)
    return tuple(sorted(rows, key=lambda row: (row.center, row.support)))


def _compatible_kalmanson_cap_coverage(
    retained_facts: Sequence[tuple[int, int]],
    rows: Sequence[Any],
) -> dict[str, Any] | None:
    retained = tuple(retained_facts)
    if retained != tuple(sorted(set(retained))):
        raise StructuralCegarError(
            "retained Kalmanson cap facts are duplicate or unsorted"
        )
    selected = tuple(rows)
    if not selected:
        raise StructuralCegarError("Kalmanson coverage has no selected rows")
    stream: list[dict[str, Any]] = []
    annotation_count = 0
    retained_set = set(retained)
    for facts in _all_phase3_cap_annotations():
        if not retained_set.issubset(facts):
            continue
        annotation_count += 1
        for order_id, order in _cap_orders_from_facts(facts):
            try:
                detected = ordered_rules.detect_selected_row_kalmanson(
                    selected, CELL.n, order
                )
            except ordered_rules.OrderedMetricRuleError as exc:
                raise StructuralCegarError(
                    f"Kalmanson cap-coverage replay failed: {exc}"
                ) from exc
            if detected is None:
                return None
            stream.append(
                {
                    "f": [list(fact) for fact in facts],
                    "order_id": order_id,
                    "core": detected["core"],
                    "boundary_rotation_start": detected[
                        "boundary_rotation_start"
                    ],
                    "row_centers": detected["row_centers"],
                }
            )
    if annotation_count == 0:
        raise StructuralCegarError(
            "retained Kalmanson cap facts have no compatible annotation"
        )
    return {
        "compatible_annotation_count": annotation_count,
        "compatible_order_count": len(stream),
        "compatible_order_coverage_sha256": _sha256_value(stream),
    }


def _minimize_kalmanson_cap_facts(
    source_facts: Sequence[tuple[int, int]],
    rows: Sequence[Any],
) -> tuple[tuple[tuple[int, int], ...], dict[str, Any]]:
    source = tuple(source_facts)
    _cap_orders_from_facts(source)
    for size in range(len(source) + 1):
        for candidate in itertools.combinations(source, size):
            coverage = _compatible_kalmanson_cap_coverage(candidate, rows)
            if coverage is not None:
                retained = tuple(candidate)
                return retained, {
                    "method": (
                        "exact-cardinality-then-lexicographic-subset-enumeration"
                    ),
                    "source_fact_count": len(source),
                    "retained_fact_count": len(retained),
                    "retained_facts": [list(fact) for fact in retained],
                    **coverage,
                }
    raise StructuralCegarError(
        "no sound selected-row Kalmanson cap-fact antecedent exists"
    )


def _kalmanson_cap_order_certificate(
    obj: Any, rows: Sequence[Any]
) -> tuple[dict[str, Any], tuple[Any, ...], tuple[tuple[int, int], ...]] | None:
    if len(rows) != CELL.n:
        raise StructuralCegarError(
            "Kalmanson cap-order detector requires ten metric rows"
        )
    for center, row in enumerate(rows):
        _validate_phase3_row(row, expected_center=center)
    if tuple(rows) != _metric_rows(obj):
        raise StructuralCegarError(
            "Kalmanson cap-order rows do not match the annotated node"
        )
    facts = _cap_facts(obj)
    replay_orders = _cap_orders_from_facts(facts)
    try:
        realized_orders = tuple(
            (spec.order_id, tuple(spec.order)) for spec in realize.cap_orders(obj)
        )
    except Exception as exc:
        raise StructuralCegarError(
            f"Kalmanson cap-order construction failed: {exc}"
        ) from exc
    if realized_orders != replay_orders:
        raise StructuralCegarError(
            "independent Kalmanson cap-order construction drift"
        )
    try:
        minimized = ordered_rules.minimize_selected_row_kalmanson_rows(
            rows, CELL.n, realized_orders
        )
    except ordered_rules.OrderedMetricRuleError as exc:
        raise StructuralCegarError(
            f"Kalmanson exact row minimization failed: {exc}"
        ) from exc
    if minimized is None:
        return None
    selected, row_minimization = minimized
    try:
        ordered_rule = ordered_rules.build_selected_row_kalmanson_order_record(
            selected, CELL.n, realized_orders
        )
    except ordered_rules.OrderedMetricRuleError as exc:
        raise StructuralCegarError(
            f"Kalmanson ordered-rule export failed: {exc}"
        ) from exc
    if ordered_rule is None:
        raise StructuralCegarError(
            "Kalmanson minimized rows lost complete order coverage"
        )
    retained_facts, cap_minimization = _minimize_kalmanson_cap_facts(
        facts, selected
    )
    row_minimization = {
        **row_minimization,
        "source_rows": [row.as_dict() for row in rows],
    }
    antecedent = {
        "rows": [row.as_dict() for row in selected],
        "cap_memberships": [list(fact) for fact in retained_facts],
        "shell_membership_count": CELL.k * len(selected),
        "cap_membership_count": len(retained_facts),
        "literal_count": CELL.k * len(selected) + len(retained_facts),
    }
    lean_consumer = {
        "module": ordered_rules.KALMANSON_LEAN_MODULE,
        "source": ordered_rules.KALMANSON_LEAN_SOURCE,
        "theorem": ordered_rules.KALMANSON_LEAN_THEOREM,
        "core_role_order": list(ordered_rules.KALMANSON_CORE_ROLES),
        "selected_row_roles": list(ordered_rules.KALMANSON_ROW_ROLES),
        "direct_support_role_pairs": {
            role: list(pair)
            for role, pair in (
                ordered_rules.KALMANSON_DIRECT_SUPPORT_ROLES.items()
            )
        },
    }
    unsigned = {
        "schema": KALMANSON_CAP_ORDER_CERTIFICATE_SCHEMA,
        "n": CELL.n,
        "stage": KALMANSON_CAP_ORDER_STAGE,
        "ordered_rule": ordered_rule,
        "lean_consumer": lean_consumer,
        "concrete_ingress_trust_boundary": KALMANSON_INGRESS_TRUST_BOUNDARY,
        "cap_semantics": (
            "M={0,1,2}; cap_orders has no reflection quotient; one bound "
            "selected-row antecedent replays all 24 within-fiber orders for "
            "every retained-fact-compatible Phase-3 annotation"
        ),
        "cap_annotation": {
            "M": [0, 1, 2],
            "f": [list(fact) for fact in facts],
            "closed_profile": list(CELL.profile),
        },
        "row_minimization": row_minimization,
        "cap_minimization": cap_minimization,
        "antecedent": antecedent,
    }
    certificate = {
        **unsigned,
        "certificate_payload_sha256": _sha256_value(unsigned),
    }
    replayed, replayed_rows, replayed_facts = (
        _replay_kalmanson_cap_order_certificate(certificate)
    )
    if (
        replayed != certificate
        or replayed_rows != selected
        or replayed_facts != retained_facts
    ):
        raise StructuralCegarError(
            "Kalmanson cap-order certificate self-replay drift"
        )
    return certificate, selected, retained_facts


def _replay_kalmanson_cap_order_certificate(
    value: Any,
) -> tuple[dict[str, Any], tuple[Any, ...], tuple[tuple[int, int], ...]]:
    if not isinstance(value, dict):
        raise StructuralCegarError(
            "Kalmanson cap-order certificate is not an object"
        )
    expected_keys = {
        "schema",
        "n",
        "stage",
        "ordered_rule",
        "lean_consumer",
        "concrete_ingress_trust_boundary",
        "cap_semantics",
        "cap_annotation",
        "row_minimization",
        "cap_minimization",
        "antecedent",
        "certificate_payload_sha256",
    }
    if set(value) != expected_keys:
        raise StructuralCegarError(
            "Kalmanson cap-order certificate fields mismatch"
        )
    expected_consumer = {
        "module": ordered_rules.KALMANSON_LEAN_MODULE,
        "source": ordered_rules.KALMANSON_LEAN_SOURCE,
        "theorem": ordered_rules.KALMANSON_LEAN_THEOREM,
        "core_role_order": list(ordered_rules.KALMANSON_CORE_ROLES),
        "selected_row_roles": list(ordered_rules.KALMANSON_ROW_ROLES),
        "direct_support_role_pairs": {
            role: list(pair)
            for role, pair in (
                ordered_rules.KALMANSON_DIRECT_SUPPORT_ROLES.items()
            )
        },
    }
    if (
        value["schema"] != KALMANSON_CAP_ORDER_CERTIFICATE_SCHEMA
        or value["n"] != CELL.n
        or value["stage"] != KALMANSON_CAP_ORDER_STAGE
        or value["lean_consumer"] != expected_consumer
        or value["concrete_ingress_trust_boundary"]
        != KALMANSON_INGRESS_TRUST_BOUNDARY
        or value["cap_semantics"]
        != (
            "M={0,1,2}; cap_orders has no reflection quotient; one bound "
            "selected-row antecedent replays all 24 within-fiber orders for "
            "every retained-fact-compatible Phase-3 annotation"
        )
    ):
        raise StructuralCegarError(
            "Kalmanson cap-order certificate identity mismatch"
        )
    cap_annotation = value["cap_annotation"]
    if not isinstance(cap_annotation, dict) or set(cap_annotation) != {
        "M",
        "f",
        "closed_profile",
    }:
        raise StructuralCegarError(
            "Kalmanson cap-order annotation fields mismatch"
        )
    try:
        facts = tuple(
            (pair[0], pair[1])
            for pair in cap_annotation["f"]
            if isinstance(pair, list) and len(pair) == 2
        )
    except (TypeError, IndexError) as exc:
        raise StructuralCegarError(
            "Kalmanson cap-order facts are malformed"
        ) from exc
    if (
        len(facts) != len(cap_annotation["f"])
        or cap_annotation["M"] != [0, 1, 2]
        or cap_annotation["closed_profile"] != list(CELL.profile)
    ):
        raise StructuralCegarError("Kalmanson cap-order annotation mismatch")
    replay_orders = _cap_orders_from_facts(facts)
    row_minimization = value["row_minimization"]
    if not isinstance(row_minimization, dict):
        raise StructuralCegarError(
            "Kalmanson row-minimization record is malformed"
        )
    source_rows = _kalmanson_rows_from_json(
        row_minimization.get("source_rows")
    )
    if len(source_rows) != CELL.n:
        raise StructuralCegarError(
            "Kalmanson row-minimization source must contain ten rows"
        )
    try:
        minimized = ordered_rules.minimize_selected_row_kalmanson_rows(
            source_rows, CELL.n, replay_orders
        )
    except ordered_rules.OrderedMetricRuleError as exc:
        raise StructuralCegarError(
            f"Kalmanson row-minimization replay failed: {exc}"
        ) from exc
    if minimized is None:
        raise StructuralCegarError(
            "Kalmanson source rows no longer cover every compatible order"
        )
    selected, expected_row_minimization = minimized
    expected_row_minimization = {
        **expected_row_minimization,
        "source_rows": [row.as_dict() for row in source_rows],
    }
    if row_minimization != expected_row_minimization:
        raise StructuralCegarError(
            "Kalmanson row-minimization claim mismatch"
        )
    ordered_rule = value["ordered_rule"]
    if not isinstance(ordered_rule, dict):
        raise StructuralCegarError("Kalmanson ordered-rule record is malformed")
    if ordered_rule.get("selected_rows") != [
        row.as_dict() for row in selected
    ]:
        raise StructuralCegarError(
            "Kalmanson ordered-rule selected rows mismatch"
        )
    try:
        ordered_rules.replay_selected_row_kalmanson_order_record(
            selected, CELL.n, replay_orders, ordered_rule
        )
    except ordered_rules.OrderedMetricRuleError as exc:
        raise StructuralCegarError(
            f"Kalmanson ordered-rule replay failed: {exc}"
        ) from exc
    retained_facts, expected_cap_minimization = (
        _minimize_kalmanson_cap_facts(facts, selected)
    )
    if value["cap_minimization"] != expected_cap_minimization:
        raise StructuralCegarError(
            "Kalmanson cap-order minimization claim mismatch"
        )
    expected_antecedent = {
        "rows": [row.as_dict() for row in selected],
        "cap_memberships": [list(fact) for fact in retained_facts],
        "shell_membership_count": CELL.k * len(selected),
        "cap_membership_count": len(retained_facts),
        "literal_count": CELL.k * len(selected) + len(retained_facts),
    }
    if value["antecedent"] != expected_antecedent:
        raise StructuralCegarError("Kalmanson cap-order antecedent mismatch")
    unsigned = dict(value)
    payload_sha256 = unsigned.pop("certificate_payload_sha256")
    if payload_sha256 != _sha256_value(unsigned):
        raise StructuralCegarError(
            "Kalmanson cap-order certificate payload hash mismatch"
        )
    return dict(value), selected, retained_facts


def _clause_for_rows(
    encoding: Any,
    rows: Sequence[Any],
    assignment: Mapping[int, bool] | None = None,
) -> tuple[int, ...]:
    clause = tuple(
        -encoding.var("s", row.center, point)
        for row in rows
        for point in row.support
    )
    if len(clause) != CELL.k * len(rows) or len(set(clause)) != len(clause):
        raise StructuralCegarError("certificate clause has duplicate/missing literals")
    if assignment is not None:
        missing = [abs(literal) for literal in clause if abs(literal) not in assignment]
        if missing:
            raise StructuralCegarError("certificate clause assignment is incomplete")
        if any(not assignment[abs(literal)] for literal in clause):
            raise StructuralCegarError(
                "certificate row is not selected in the current assignment"
            )
        if any(
            assignment[literal] if literal > 0 else not assignment[-literal]
            for literal in clause
        ):
            raise StructuralCegarError(
                "learned certificate clause is not false in current assignment"
            )
    return clause


def _shared_pair_source_record(
    encoding: Any, assignment: Mapping[int, bool], rows: Sequence[Any]
) -> dict[str, Any]:
    """Make the authenticated source shape required by the standalone replayer.

    The synthetic record is an ingress container, rather than a claim that an
    old survivor journal is closed.  Dynamic replay below independently binds
    its rows and cap facts back to the live SAT assignment.
    """

    rows_json = [row.as_dict() for row in rows]
    unsigned = {
        "schema": shared_pair_separation.SURVIVOR_SCHEMA,
        "classification": "STRUCTURALLY_UNRESOLVED",
        "previous_record_sha256": None,
        "assignment_sha256": _assignment_hash(encoding, assignment),
        "metric_rows": rows_json,
        "metric_rows_sha256": shared_pair_separation.sha256_value(rows_json),
        "semantic_assignment": encoding.semantic_record(assignment),
    }
    return {
        **unsigned,
        "record_sha256": shared_pair_separation.sha256_value(unsigned),
    }


def _shared_pair_coverage(
    retained_facts: Sequence[tuple[int, int]],
    selected_cores: Sequence[Mapping[str, Any]],
) -> dict[str, Any] | None:
    """Check every Phase-3 completion and its 24 within-fiber orders."""

    retained = tuple(retained_facts)
    if retained != tuple(sorted(set(retained))):
        raise StructuralCegarError(
            "shared-pair retained cap facts are duplicate or unsorted"
        )
    if not selected_cores:
        raise StructuralCegarError("shared-pair coverage has no selected core")
    retained_set = set(retained)
    stream: list[dict[str, Any]] = []
    annotation_count = 0
    for facts in _all_phase3_cap_annotations():
        if not retained_set.issubset(facts):
            continue
        annotation_count += 1
        for order_id, order in _cap_orders_from_facts(facts):
            violating = next(
                (
                    core
                    for core in selected_cores
                    if not shared_pair_separation.core_satisfied(order, core)
                ),
                None,
            )
            if violating is None:
                return None
            stream.append(
                {
                    "f": [list(fact) for fact in facts],
                    "order_id": order_id,
                    "order_sha256": shared_pair_separation.sha256_value(
                        list(order)
                    ),
                    "violating_core_sha256": violating["core_sha256"],
                }
            )
    if annotation_count == 0:
        raise StructuralCegarError(
            "shared-pair retained cap facts have no compatible annotation"
        )
    return {
        "compatible_annotation_count": annotation_count,
        "compatible_order_count": len(stream),
        "compatible_order_coverage_sha256": _sha256_value(stream),
    }


def _minimize_shared_pair_antecedent(
    source_facts: Sequence[tuple[int, int]], rows: Sequence[Any]
) -> tuple[
    tuple[Any, ...], tuple[dict[str, Any], ...], tuple[tuple[int, int], ...], dict[str, Any]
]:
    """Exact literal-count minimization over row centers and positive cap facts."""

    source = tuple(source_facts)
    _cap_orders_from_facts(source)
    rows_by_center = {row.center: row for row in rows}
    if tuple(sorted(rows_by_center)) != tuple(range(CELL.n)):
        raise StructuralCegarError("shared-pair source rows do not cover Fin10")
    normalized_rows = [rows_by_center[center].as_dict() for center in range(CELL.n)]
    cores = shared_pair_separation.shared_pair_cores(normalized_rows)
    for literal_count in range(2 * CELL.k, CELL.n * CELL.k + len(source) + 1):
        for row_count in range(2, CELL.n + 1):
            fact_count = literal_count - CELL.k * row_count
            if not 0 <= fact_count <= len(source):
                continue
            for centers in itertools.combinations(range(CELL.n), row_count):
                center_set = set(centers)
                selected_cores = tuple(
                    core
                    for core in cores
                    if core["first_center"] in center_set
                    and core["second_center"] in center_set
                )
                if not selected_cores:
                    continue
                for retained in itertools.combinations(source, fact_count):
                    coverage = _shared_pair_coverage(retained, selected_cores)
                    if coverage is None:
                        continue
                    selected_rows = tuple(rows_by_center[center] for center in centers)
                    return selected_rows, selected_cores, tuple(retained), {
                        "method": (
                            "exact-literal-count-then-lexicographic-center-and-"
                            "positive-cap-subset-enumeration"
                        ),
                        "source_fact_count": len(source),
                        "selected_row_count": len(selected_rows),
                        "selected_centers": list(centers),
                        "selected_core_count": len(selected_cores),
                        "selected_core_sha256": [
                            core["core_sha256"] for core in selected_cores
                        ],
                        "retained_fact_count": len(retained),
                        "retained_facts": [list(fact) for fact in retained],
                        "literal_count": literal_count,
                        **coverage,
                    }
    raise StructuralCegarError("no shared-pair cyclic-separation antecedent exists")


def _shared_pair_separation_certificate(
    encoding: Any, assignment: Mapping[int, bool], obj: Any, rows: Sequence[Any]
) -> tuple[dict[str, Any], tuple[Any, ...], tuple[tuple[int, int], ...]] | None:
    if len(rows) != CELL.n or tuple(rows) != _metric_rows(obj):
        raise StructuralCegarError("shared-pair rows do not match Phase-3 node")
    for center, row in enumerate(rows):
        _validate_phase3_row(row, expected_center=center)
    facts = _cap_facts(obj)
    source = _shared_pair_source_record(encoding, assignment, rows)
    try:
        nested = shared_pair_separation.build_certificate(source, None)
    except shared_pair_separation.SharedPairSeparationError:
        return None
    selected, selected_cores, retained, minimization = (
        _minimize_shared_pair_antecedent(facts, rows)
    )
    antecedent = {
        "rows": [row.as_dict() for row in selected],
        "cap_memberships": [list(fact) for fact in retained],
        "shell_membership_count": CELL.k * len(selected),
        "cap_membership_count": len(retained),
        "literal_count": CELL.k * len(selected) + len(retained),
    }
    unsigned = {
        "schema": SHARED_PAIR_SEPARATION_CERTIFICATE_SCHEMA,
        "n": CELL.n,
        "profile": list(CELL.profile),
        "stage": SHARED_PAIR_SEPARATION_STAGE,
        "concrete_ingress_trust_boundary": SHARED_PAIR_SEPARATION_INGRESS_TRUST_BOUNDARY,
        "source_certificate": nested,
        "minimization": minimization,
        "antecedent": antecedent,
        "selected_cores": list(selected_cores),
    }
    certificate = {**unsigned, "certificate_payload_sha256": _sha256_value(unsigned)}
    _replay_shared_pair_separation_certificate(certificate)
    return certificate, selected, retained


def _replay_shared_pair_separation_certificate(
    value: Any,
) -> tuple[dict[str, Any], tuple[Any, ...], tuple[tuple[int, int], ...]]:
    if not isinstance(value, dict) or set(value) != {
        "schema", "n", "profile", "stage", "concrete_ingress_trust_boundary",
        "source_certificate", "minimization", "antecedent", "selected_cores",
        "certificate_payload_sha256",
    }:
        raise StructuralCegarError("shared-pair certificate fields mismatch")
    if (
        value["schema"] != SHARED_PAIR_SEPARATION_CERTIFICATE_SCHEMA
        or value["n"] != CELL.n
        or value["profile"] != list(CELL.profile)
        or value["stage"] != SHARED_PAIR_SEPARATION_STAGE
        or value["concrete_ingress_trust_boundary"] != SHARED_PAIR_SEPARATION_INGRESS_TRUST_BOUNDARY
    ):
        raise StructuralCegarError("shared-pair certificate identity mismatch")
    try:
        nested = shared_pair_separation.replay_certificate(value["source_certificate"])
    except shared_pair_separation.SharedPairSeparationError as exc:
        raise StructuralCegarError(f"shared-pair nested replay failed: {exc}") from exc
    rows = _kalmanson_rows_from_json(nested["rows"])
    facts = tuple(tuple(fact) for fact in nested["cap_facts"])
    selected, expected_cores, retained, expected_minimization = (
        _minimize_shared_pair_antecedent(facts, rows)
    )
    if value["selected_cores"] != list(expected_cores):
        raise StructuralCegarError("shared-pair selected core claim mismatch")
    if value["minimization"] != expected_minimization:
        raise StructuralCegarError("shared-pair minimization claim mismatch")
    expected_antecedent = {
        "rows": [row.as_dict() for row in selected],
        "cap_memberships": [list(fact) for fact in retained],
        "shell_membership_count": CELL.k * len(selected),
        "cap_membership_count": len(retained),
        "literal_count": CELL.k * len(selected) + len(retained),
    }
    if value["antecedent"] != expected_antecedent:
        raise StructuralCegarError("shared-pair antecedent mismatch")
    unsigned = dict(value)
    claimed = unsigned.pop("certificate_payload_sha256")
    if claimed != _sha256_value(unsigned):
        raise StructuralCegarError("shared-pair certificate payload hash mismatch")
    return dict(value), selected, retained


def _clause_for_shared_pair_separation_certificate(
    encoding: Any,
    certificate: Mapping[str, Any],
    assignment: Mapping[int, bool] | None = None,
) -> tuple[int, ...]:
    _replayed, selected, facts = _replay_shared_pair_separation_certificate(certificate)
    clause = (*_clause_for_rows(encoding, selected), *(
        -encoding.var("f", label, cap) for label, cap in facts
    ))
    if len(clause) != len(set(clause)):
        raise StructuralCegarError("shared-pair clause has duplicate literals")
    if assignment is not None:
        if any(abs(literal) not in assignment for literal in clause):
            raise StructuralCegarError("shared-pair clause assignment is incomplete")
        if any(not assignment[abs(literal)] for literal in clause):
            raise StructuralCegarError("shared-pair antecedent is not selected")
        _clause_false(clause, assignment)
    return clause


def _clause_for_structural_certificate(
    encoding: Any,
    certificate: Mapping[str, Any],
    rows: Sequence[Any],
    assignment: Mapping[int, bool] | None = None,
) -> tuple[int, ...]:
    if certificate.get("stage") == DUPLICATE_CENTER_STAGE:
        memberships = _duplicate_center_path_memberships(certificate)
        return _clause_for_memberships(encoding, memberships, assignment)
    return _clause_for_rows(encoding, rows, assignment)


def _clause_for_cap_order_certificate(
    encoding: Any,
    certificate: Mapping[str, Any],
    assignment: Mapping[int, bool] | None = None,
) -> tuple[int, ...]:
    _replayed, selected, facts = _replay_cap_order_certificate(certificate)
    row_clause = _clause_for_rows(encoding, selected)
    cap_clause = tuple(-encoding.var("f", label, cap) for label, cap in facts)
    clause = (*row_clause, *cap_clause)
    if len(clause) != len(set(clause)):
        raise StructuralCegarError("cap-order clause has duplicate literals")
    if assignment is not None:
        missing = [abs(literal) for literal in clause if abs(literal) not in assignment]
        if missing:
            raise StructuralCegarError("cap-order clause assignment is incomplete")
        if any(not assignment[abs(literal)] for literal in clause):
            raise StructuralCegarError(
                "cap-order antecedent is not selected in the current assignment"
            )
        _clause_false(clause, assignment)
    return clause


def _clause_for_rhombus_cap_order_certificate(
    encoding: Any,
    certificate: Mapping[str, Any],
    assignment: Mapping[int, bool] | None = None,
) -> tuple[int, ...]:
    _replayed, selected, facts = _replay_rhombus_cap_order_certificate(
        certificate
    )
    row_clause = _clause_for_rows(encoding, selected)
    cap_clause = tuple(-encoding.var("f", label, cap) for label, cap in facts)
    clause = (*row_clause, *cap_clause)
    if len(clause) != len(set(clause)):
        raise StructuralCegarError(
            "rhombus cap-order clause has duplicate literals"
        )
    if assignment is not None:
        missing = [
            abs(literal) for literal in clause if abs(literal) not in assignment
        ]
        if missing:
            raise StructuralCegarError(
                "rhombus cap-order clause assignment is incomplete"
            )
        if any(not assignment[abs(literal)] for literal in clause):
            raise StructuralCegarError(
                "rhombus cap-order antecedent is not selected in the "
                "current assignment"
            )
        _clause_false(clause, assignment)
    return clause


def _clause_for_kalmanson_cap_order_certificate(
    encoding: Any,
    certificate: Mapping[str, Any],
    assignment: Mapping[int, bool] | None = None,
) -> tuple[int, ...]:
    _replayed, selected, facts = _replay_kalmanson_cap_order_certificate(
        certificate
    )
    row_clause = _clause_for_rows(encoding, selected)
    cap_clause = tuple(-encoding.var("f", label, cap) for label, cap in facts)
    clause = (*row_clause, *cap_clause)
    if len(clause) != len(set(clause)):
        raise StructuralCegarError(
            "Kalmanson cap-order clause has duplicate literals"
        )
    if assignment is not None:
        missing = [
            abs(literal) for literal in clause if abs(literal) not in assignment
        ]
        if missing:
            raise StructuralCegarError(
                "Kalmanson cap-order clause assignment is incomplete"
            )
        if any(not assignment[abs(literal)] for literal in clause):
            raise StructuralCegarError(
                "Kalmanson cap-order antecedent is not selected in the "
                "current assignment"
            )
        _clause_false(clause, assignment)
    return clause


def _clause_for_memberships(
    encoding: Any,
    memberships: Sequence[tuple[int, int]],
    assignment: Mapping[int, bool] | None = None,
) -> tuple[int, ...]:
    """Negate a sorted, duplicate-free set of shell facts.

    For an algebraic certificate term attached to the equality
    ``d(center,pivot)^2 = d(center,target)^2``, the SAT/P97 semantics needs
    only ``s(center,pivot)`` and ``s(center,target)``.  Same-row membership
    makes that equality true in every Euclidean realization.  A checked
    duplicate-center closure path has the same local membership semantics.
    """

    normalized = tuple(sorted(set(memberships)))
    if (
        not normalized
        or len(normalized) != len(memberships)
        or any(
            type(center) is not int
            or type(point) is not int
            or center == point
            or not 0 <= center < CELL.n
            or not 0 <= point < CELL.n
            for center, point in normalized
        )
    ):
        raise StructuralCegarError(
            "algebraic antecedent memberships are invalid, duplicate, or unsorted"
        )
    clause = tuple(-encoding.var("s", center, point) for center, point in normalized)
    if len(set(clause)) != len(clause):
        raise StructuralCegarError("algebraic clause has duplicate literals")
    if assignment is not None:
        missing = [abs(literal) for literal in clause if abs(literal) not in assignment]
        if missing:
            raise StructuralCegarError("algebraic clause assignment is incomplete")
        if any(not assignment[abs(literal)] for literal in clause):
            raise StructuralCegarError(
                "algebraic antecedent is not selected in the current assignment"
            )
        _clause_false(clause, assignment)
    return clause


def _rows_from_algebraic_system(system: Mapping[str, Any]) -> tuple[Any, ...]:
    expected_flags = {
        "schema": ALGEBRAIC_SYSTEM_SCHEMA,
        "n": CELL.n,
        "equation_count": 30,
        "blockers_used": False,
        "exact_flags_used": False,
        "full_distance_classes_used": False,
        "inequalities_used": False,
        "coordinate_gauge": GAUGE,
        "free_variables": list(equality_probe.variable_names(CELL.n)),
    }
    for field, expected in expected_flags.items():
        if system.get(field) != expected:
            raise StructuralCegarError(
                f"algebraic source system has invalid {field!r}"
            )
    raw_rows = system.get("rows")
    if not isinstance(raw_rows, list) or len(raw_rows) != CELL.n:
        raise StructuralCegarError("algebraic source system must contain ten rows")
    rows: list[Any] = []
    for center, raw in enumerate(raw_rows):
        if not isinstance(raw, dict) or set(raw) != {"center", "support", "exact"}:
            raise StructuralCegarError("algebraic source row has invalid shape")
        try:
            row = metric.MetricRow(
                raw["center"], tuple(raw["support"]), raw["exact"]
            )
        except Exception as exc:
            raise StructuralCegarError(
                f"could not decode algebraic source row {center}: {exc}"
            ) from exc
        _validate_phase3_row(row, expected_center=center)
        rows.append(row)
    rows_json = [
        {"center": row.center, "support": list(row.support), "exact": row.exact}
        for row in rows
    ]
    if system.get("metric_rows_sha256") != _sha256_value(rows_json):
        raise StructuralCegarError("algebraic source metric-row hash mismatch")
    polynomials = list(equality_probe.system_polynomials(rows))
    if system.get("polynomials") != polynomials:
        raise StructuralCegarError(
            "algebraic source polynomial stream does not match its rows"
        )
    return tuple(rows)


def _expected_generator_entries(rows: Sequence[Any]) -> list[dict[str, Any]]:
    expected: list[dict[str, Any]] = []
    index = 0
    for row_index, row in enumerate(rows):
        pivot = row.support[0]
        row_polynomials = equality_probe.row_equalities(row)
        for support_position, (target, polynomial) in enumerate(
            zip(row.support[1:], row_polynomials, strict=True), start=1
        ):
            expected.append(
                {
                    "index": index,
                    "singular_index": index + 1,
                    "name": (
                        f"f{index:02d}_r{row_index:02d}_c{row.center}_"
                        f"p{pivot}_q{target}"
                    ),
                    "row_index": row_index,
                    "support_position": support_position,
                    "center": row.center,
                    "pivot": pivot,
                    "target": target,
                    "polynomial": polynomial,
                }
            )
            index += 1
    if index != 30:
        raise StructuralCegarError("algebraic row mapping did not yield 30 generators")
    return expected


def _parse_qq_poly(
    expression: Any,
    *,
    symbols: Sequence[Any],
    symbol_table: Mapping[str, Any],
    where: str,
) -> Any:
    if not isinstance(expression, str):
        raise StructuralCegarError(f"{where} is not a polynomial string")
    try:
        parsed = sp.sympify(expression.replace("^", "**"), locals=dict(symbol_table))
        if parsed.free_symbols - set(symbols):
            raise ValueError("expression contains an undeclared symbol")
        return sp.Poly(parsed, *symbols, domain=sp.QQ)
    except Exception as exc:
        raise StructuralCegarError(f"{where} is not an exact QQ polynomial: {exc}") from exc


def _replay_algebraic_certificate(
    certificate: Mapping[str, Any],
    system: Mapping[str, Any],
) -> tuple[tuple[Any, ...], tuple[tuple[int, int], ...], dict[str, Any]]:
    """Replay one saved identity and derive its sparse P97 antecedent."""

    rows = _rows_from_algebraic_system(system)
    fixed = {
        "schema": ALGEBRAIC_CERTIFICATE_SCHEMA,
        "source_system_sha256": _sha256_bytes(
            _canonical_bytes(system) + b"\n"
        ),
        "source_metric_rows_sha256": system.get("metric_rows_sha256"),
        "scope": (
            "one gauge-fixed equality-only finite polynomial system; "
            "no inequalities, blockers, exact off-support classes, "
            "Phase3 coverage, Lean, or P97 closure"
        ),
        "coefficient_field": "QQ",
        "variables": list(equality_probe.variable_names(CELL.n)),
        "coordinate_gauge": GAUGE,
        "identity": "1 = sum_i cofactor_i * generator_i",
        "generator_order": "row index, then support positions 1,2,3",
    }
    for field, expected in fixed.items():
        if certificate.get(field) != expected:
            raise StructuralCegarError(
                f"algebraic certificate has invalid {field!r}"
            )
    if certificate.get("source_metric_rows_sha256") != system.get(
        "metric_rows_sha256"
    ):
        raise StructuralCegarError(
            "algebraic certificate/source row hash mapping mismatch"
        )
    payload = dict(certificate)
    claimed_payload_hash = payload.pop("certificate_payload_sha256", None)
    if claimed_payload_hash != _sha256_bytes(_canonical_bytes(payload) + b"\n"):
        raise StructuralCegarError("algebraic certificate payload hash mismatch")

    entries = certificate.get("entries")
    expected_entries = _expected_generator_entries(rows)
    if not isinstance(entries, list) or len(entries) != len(expected_entries):
        raise StructuralCegarError("algebraic certificate must contain 30 entries")
    cofactors: list[str] = []
    for index, (entry, expected) in enumerate(
        zip(entries, expected_entries, strict=True)
    ):
        if not isinstance(entry, dict) or set(entry) != {*expected, "cofactor"}:
            raise StructuralCegarError(
                f"algebraic certificate entry {index} has invalid shape"
            )
        if any(entry[field] != value for field, value in expected.items()):
            raise StructuralCegarError(
                f"algebraic certificate entry {index} row/generator mapping mismatch"
            )
        if not isinstance(entry["cofactor"], str):
            raise StructuralCegarError(
                f"algebraic certificate entry {index} cofactor is not text"
            )
        cofactors.append(entry["cofactor"])
    if certificate.get("cofactor_stream_sha256") != _sha256_bytes(
        _canonical_bytes(cofactors) + b"\n"
    ):
        raise StructuralCegarError("algebraic cofactor stream hash mismatch")

    variable_names = list(equality_probe.variable_names(CELL.n))
    symbols = sp.symbols(" ".join(variable_names))
    symbol_table = dict(zip(variable_names, symbols, strict=True))
    total = sp.Poly(0, *symbols, domain=sp.QQ)
    memberships: set[tuple[int, int]] = set()
    used_rows: set[int] = set()
    nonzero_count = 0
    for index, entry in enumerate(entries):
        generator = _parse_qq_poly(
            entry["polynomial"],
            symbols=symbols,
            symbol_table=symbol_table,
            where=f"generator {index}",
        )
        cofactor = _parse_qq_poly(
            entry["cofactor"],
            symbols=symbols,
            symbol_table=symbol_table,
            where=f"cofactor {index}",
        )
        textual_nonzero = entry["cofactor"] != "0"
        if textual_nonzero == cofactor.is_zero:
            raise StructuralCegarError(
                f"cofactor {index} has noncanonical zero/nonzero spelling"
            )
        if not cofactor.is_zero:
            nonzero_count += 1
            used_rows.add(entry["row_index"])
            memberships.add((entry["center"], entry["pivot"]))
            memberships.add((entry["center"], entry["target"]))
        total += cofactor * generator
    if total != sp.Poly(1, *symbols, domain=sp.QQ):
        raise StructuralCegarError(
            "independent exact QQ replay did not obtain the unit identity"
        )
    antecedent = tuple(sorted(memberships))
    if not antecedent:
        raise StructuralCegarError("algebraic certificate has no used antecedent")
    return rows, antecedent, {
        "certificate_kind": UNIT_CONTRADICTION_KIND,
        "identity_replayed": True,
        "generator_count": len(entries),
        "nonzero_cofactor_count": nonzero_count,
        "antecedent_literal_count": len(antecedent),
        "used_row_indices": sorted(used_rows),
        "coordinate_gauge": GAUGE,
        "gauge_precondition": "P0 != P1 from P97 distinct points",
    }


def _replay_real_distinctness_certificate(
    certificate: Mapping[str, Any],
    system: Mapping[str, Any],
) -> tuple[tuple[Any, ...], tuple[tuple[int, int], ...], dict[str, Any]]:
    """Replay the exact ideal-membership identity and its sparse antecedent."""

    rows = _rows_from_algebraic_system(system)
    source_descriptor = {
        "relative_path": (
            "scratch/p97-distinct-distance-lane/"
            "phase3_new_survivors_realization_20260729/"
            "system-01-d6db6d91d18e/system.json"
        ),
        "sha256": REAL_DISTINCTNESS_SOURCE_SHA256,
        "schema": ALGEBRAIC_SYSTEM_SCHEMA,
        "metric_rows_sha256": REAL_DISTINCTNESS_ROWS_SHA256,
        "coordinate_gauge": GAUGE,
        "inequalities_used": False,
    }
    fixed = {
        "schema": REAL_DISTINCTNESS_CERTIFICATE_SCHEMA,
        "coefficient_field": "QQ",
        "variables": list(equality_probe.variable_names(CELL.n)),
        "generator_count": 30,
        "source_system": source_descriptor,
        "target": REAL_DISTINCTNESS_TARGET,
        "exact_identity": (
            "sum_i cofactor_i * generator_i = "
            f"{REAL_DISTINCTNESS_TARGET} over QQ"
        ),
    }
    for field, expected in fixed.items():
        if certificate.get(field) != expected:
            raise StructuralCegarError(
                f"real-distinctness certificate has invalid {field!r}"
            )
    if (
        _sha256_bytes(_canonical_bytes(system) + b"\n")
        != REAL_DISTINCTNESS_SOURCE_SHA256
        or system.get("metric_rows_sha256")
        != REAL_DISTINCTNESS_ROWS_SHA256
        or system.get("inequalities_used") is not False
        or system.get("coordinate_gauge") != GAUGE
    ):
        raise StructuralCegarError(
            "real-distinctness source system/hash/gauge invariant mismatch"
        )

    expected_generators = _expected_generator_entries(rows)
    entries = certificate.get("entries")
    if not isinstance(entries, list) or len(entries) != 30:
        raise StructuralCegarError(
            "real-distinctness certificate must contain 30 entries"
        )
    variable_names = list(equality_probe.variable_names(CELL.n))
    symbols = sp.symbols(" ".join(variable_names))
    symbol_table = dict(zip(variable_names, symbols, strict=True))
    total = sp.Poly(0, *symbols, domain=sp.QQ)
    memberships: set[tuple[int, int]] = set()
    used_rows: set[int] = set()
    nonzero_indices: list[int] = []
    for index, (entry, expected) in enumerate(
        zip(entries, expected_generators, strict=True)
    ):
        if not isinstance(entry, dict) or set(entry) != {
            "index",
            "singular_index",
            "polynomial",
            "cofactor",
        }:
            raise StructuralCegarError(
                f"real-distinctness entry {index} has invalid shape"
            )
        if (
            entry["index"] != index
            or entry["singular_index"] != index + 1
            or entry["polynomial"] != expected["polynomial"]
        ):
            raise StructuralCegarError(
                f"real-distinctness entry {index} generator mapping mismatch"
            )
        generator = _parse_qq_poly(
            entry["polynomial"],
            symbols=symbols,
            symbol_table=symbol_table,
            where=f"real-distinctness generator {index}",
        )
        cofactor = _parse_qq_poly(
            entry["cofactor"],
            symbols=symbols,
            symbol_table=symbol_table,
            where=f"real-distinctness cofactor {index}",
        )
        textual_nonzero = entry["cofactor"] != "0"
        if textual_nonzero == cofactor.is_zero:
            raise StructuralCegarError(
                f"real-distinctness cofactor {index} has noncanonical zero spelling"
            )
        if not cofactor.is_zero:
            nonzero_indices.append(index)
            used_rows.add(expected["row_index"])
            memberships.add((expected["center"], expected["pivot"]))
            memberships.add((expected["center"], expected["target"]))
        total += cofactor * generator
    if tuple(nonzero_indices) != REAL_DISTINCTNESS_NONZERO_INDICES:
        raise StructuralCegarError(
            "real-distinctness nonzero cofactor support mismatch"
        )
    target = _parse_qq_poly(
        REAL_DISTINCTNESS_TARGET,
        symbols=symbols,
        symbol_table=symbol_table,
        where="real-distinctness target",
    )
    if total != target:
        raise StructuralCegarError(
            "independent exact QQ replay did not obtain the pinned target"
        )
    antecedent = tuple(sorted(memberships))
    return rows, antecedent, {
        "certificate_kind": REAL_DISTINCTNESS_CONTRADICTION_KIND,
        "identity_replayed": True,
        "coefficient_field": "QQ",
        "generator_count": 30,
        "nonzero_cofactor_count": len(nonzero_indices),
        "nonzero_cofactor_indices": nonzero_indices,
        "antecedent_literal_count": len(antecedent),
        "used_row_indices": sorted(used_rows),
        "target": REAL_DISTINCTNESS_TARGET,
        "coordinate_gauge": GAUGE,
        "inequalities_used": False,
        "external_hypothesis": "P97 point pairwise-distinctness",
        "real_deduction": (
            "over R, x9x^2+x9y^2=0 forces P9=P0=P0_gauge, "
            "contradicting pairwise distinctness"
        ),
    }


def _saved_artifact_path(
    directory: Path, declared: Any, artifact_prefix: str
) -> Path:
    if not isinstance(declared, str):
        raise StructuralCegarError("saved artifact path is not text")
    prefix = artifact_prefix + "/"
    if not declared.startswith(prefix):
        raise StructuralCegarError(f"saved artifact path leaves pinned prefix: {declared}")
    relative = Path(declared[len(prefix) :])
    if not relative.parts or relative.is_absolute() or ".." in relative.parts:
        raise StructuralCegarError(f"unsafe saved artifact path: {declared}")
    return directory / relative


def _verify_saved_hashes(
    directory: Path, artifact_prefix: str
) -> dict[str, str]:
    checksum_path = directory / "SHA256SUMS"
    if not checksum_path.is_file():
        raise StructuralCegarError("algebraic bootstrap lacks SHA256SUMS")
    hashes: dict[str, str] = {}
    for line_number, raw in enumerate(
        checksum_path.read_text().splitlines(), start=1
    ):
        if len(raw) < 67 or raw[64:66] != "  ":
            raise StructuralCegarError(
                f"SHA256SUMS:{line_number}: invalid checksum line"
            )
        digest, declared = raw[:64], raw[66:]
        if (
            any(character not in "0123456789abcdef" for character in digest)
            or declared in hashes
        ):
            raise StructuralCegarError(
                f"SHA256SUMS:{line_number}: invalid or duplicate entry"
            )
        path = _saved_artifact_path(directory, declared, artifact_prefix)
        if not path.is_file() or _sha256_file(path) != digest:
            raise StructuralCegarError(f"saved artifact hash mismatch: {declared}")
        hashes[declared] = digest
    manifest_name = f"{artifact_prefix}/manifest.json"
    if manifest_name not in hashes:
        raise StructuralCegarError("SHA256SUMS does not cover manifest.json")
    return hashes


def _load_real_distinctness_template_bank(
    directory: Path,
) -> tuple[list[dict[str, Any]], dict[str, Any]]:
    manifest_path = directory / "manifest.json"
    certificate_path = directory / "certificate.json"
    if _sha256_file(manifest_path) != REAL_DISTINCTNESS_MANIFEST_SHA256:
        raise StructuralCegarError(
            "real-distinctness manifest hash mismatch"
        )
    if _sha256_file(certificate_path) != REAL_DISTINCTNESS_CERTIFICATE_SHA256:
        raise StructuralCegarError(
            "real-distinctness certificate hash mismatch"
        )
    manifest = _strict_json(manifest_path)
    if (
        manifest.get("schema") != REAL_DISTINCTNESS_MANIFEST_SCHEMA
        or manifest.get("status")
        != "CERTIFIED_REAL_DISTINCTNESS_CONTRADICTION"
        or manifest.get("source_system_sha256")
        != REAL_DISTINCTNESS_SOURCE_SHA256
        or manifest.get("metric_rows_sha256")
        != REAL_DISTINCTNESS_ROWS_SHA256
        or manifest.get("target") != REAL_DISTINCTNESS_TARGET
        or manifest.get("generator_count") != 30
    ):
        raise StructuralCegarError(
            "real-distinctness manifest invariant mismatch"
        )
    certificate = _strict_json(certificate_path)
    source_descriptor = certificate.get("source_system")
    if not isinstance(source_descriptor, dict):
        raise StructuralCegarError(
            "real-distinctness source descriptor is missing"
        )
    source_relative = source_descriptor.get("relative_path")
    if not isinstance(source_relative, str):
        raise StructuralCegarError(
            "real-distinctness source path is missing"
        )
    source_path = ROOT / source_relative
    if (
        not source_path.is_file()
        or _sha256_file(source_path) != REAL_DISTINCTNESS_SOURCE_SHA256
    ):
        raise StructuralCegarError(
            "real-distinctness source system hash mismatch"
        )
    system = _strict_json(source_path)
    _rows, antecedent, replay = _replay_real_distinctness_certificate(
        certificate, system
    )
    template_unsigned = {
        "name": "system-01-d6db6d91d18e-real-distinctness",
        "certificate_kind": REAL_DISTINCTNESS_CONTRADICTION_KIND,
        "algebraic_certificate": certificate,
        "algebraic_system": system,
        "algebraic_replay": replay,
        "antecedent_memberships": [list(pair) for pair in antecedent],
        "origin": REAL_DISTINCTNESS_ORIGIN,
        "stage": REAL_DISTINCTNESS_STAGE,
    }
    template = {
        **template_unsigned,
        "template_sha256": _sha256_value(template_unsigned),
    }
    summary = {
        "schema": REAL_DISTINCTNESS_MANIFEST_SCHEMA,
        "manifest_sha256": REAL_DISTINCTNESS_MANIFEST_SHA256,
        "certificate_count": 1,
        "certificate_kind": REAL_DISTINCTNESS_CONTRADICTION_KIND,
        "template_sha256": [template["template_sha256"]],
        "systems": [
            {
                "name": template["name"],
                "source_system_sha256": REAL_DISTINCTNESS_SOURCE_SHA256,
                "source_metric_rows_sha256": REAL_DISTINCTNESS_ROWS_SHA256,
                "certificate_file_sha256": (
                    REAL_DISTINCTNESS_CERTIFICATE_SHA256
                ),
                **replay,
            }
        ],
        "semantics": (
            "exact QQ ideal membership forces P9=P0 over R after the pinned "
            "P0=(0,0) gauge; contradiction requires external P97 pairwise "
            "distinctness and is not equality-ideal unit infeasibility"
        ),
        "lean_kernel_checked": False,
        "artifact_prefix": str(directory.relative_to(ROOT)),
    }
    return [template], summary


def _strict_json_list(path: Path) -> list[Any]:
    if not path.is_file():
        raise StructuralCegarError(f"missing artifact {path}")
    try:
        value = json.loads(
            path.read_bytes(),
            parse_constant=lambda token: (_ for _ in ()).throw(
                ValueError(f"invalid JSON constant {token}")
            ),
            object_pairs_hook=_object_without_duplicate_keys,
        )
    except (UnicodeDecodeError, json.JSONDecodeError, ValueError) as exc:
        raise StructuralCegarError(f"{path}: invalid JSON: {exc}") from exc
    if not isinstance(value, list):
        raise StructuralCegarError(f"{path}: expected a JSON array")
    return value


def _verify_equilateral_shell_hashes(directory: Path) -> dict[str, str]:
    sums_path = directory / "SHA256SUMS"
    if (
        not sums_path.is_file()
        or _sha256_file(sums_path) != EQUILATERAL_SHELL_SHA256SUMS_SHA256
    ):
        raise StructuralCegarError(
            "equilateral-shell SHA256SUMS hash mismatch"
        )
    hashes: dict[str, str] = {}
    for line_number, raw in enumerate(
        sums_path.read_text().splitlines(), start=1
    ):
        fields = raw.split("  ", 1)
        if (
            len(fields) != 2
            or len(fields[0]) != 64
            or any(character not in "0123456789abcdef" for character in fields[0])
        ):
            raise StructuralCegarError(
                f"equilateral-shell SHA256SUMS:{line_number}: malformed line"
            )
        digest, relative = fields
        relative_path = Path(relative)
        if (
            not relative
            or relative_path.is_absolute()
            or ".." in relative_path.parts
            or relative in hashes
        ):
            raise StructuralCegarError(
                f"equilateral-shell SHA256SUMS:{line_number}: unsafe path"
            )
        artifact = directory / relative_path
        if not artifact.is_file() or _sha256_file(artifact) != digest:
            raise StructuralCegarError(
                f"equilateral-shell saved artifact hash mismatch: {relative}"
            )
        hashes[relative] = digest
    if len(hashes) != 90:
        raise StructuralCegarError(
            "equilateral-shell manifested artifact count mismatch"
        )
    return hashes


def _cycle_edges(vertices: Sequence[int]) -> set[tuple[int, int]]:
    return {
        tuple(sorted((vertices[index], vertices[(index + 1) % len(vertices)])))
        for index in range(len(vertices))
    }


def _cycle_step_edges(
    vertices: Sequence[int], step: int
) -> set[tuple[int, int]]:
    return {
        tuple(
            sorted((vertices[index], vertices[(index + step) % len(vertices)]))
        )
        for index in range(len(vertices))
    }


def _equilateral_shell_antecedent() -> tuple[
    tuple[tuple[int, int], ...], dict[str, Any]
]:
    edges = set(EQUILATERAL_SHELL_EDGES)
    cover = set(EQUILATERAL_SHELL_CENTER_COVER)
    if any(left not in cover and right not in cover for left, right in edges):
        raise StructuralCegarError(
            "equilateral-shell pinned center set is not a vertex cover"
        )
    minimum_cover_size = next(
        (
            size
            for size in range(CELL.n + 1)
            if any(
                all(left in candidate or right in candidate for left, right in edges)
                for candidate in map(set, itertools.combinations(range(CELL.n), size))
            )
        ),
        None,
    )
    if minimum_cover_size != len(cover):
        raise StructuralCegarError(
            "equilateral-shell minimum center-cover replay drift"
        )

    tree = {tuple(sorted(edge)) for edge in EQUILATERAL_SHELL_CENTER_TREE}
    if (
        len(tree) != len(cover) - 1
        or not tree <= edges
        or any(not set(edge) <= cover for edge in tree)
    ):
        raise StructuralCegarError(
            "equilateral-shell center tree invariant mismatch"
        )
    reached = {min(cover)}
    while True:
        expanded = reached | {
            right
            for left, right in tree
            if left in reached
        } | {
            left
            for left, right in tree
            if right in reached
        }
        if expanded == reached:
            break
        reached = expanded
    if reached != cover:
        raise StructuralCegarError(
            "equilateral-shell center tree is disconnected"
        )

    memberships: set[tuple[int, int]] = set()
    for left, right in EQUILATERAL_SHELL_EDGES:
        memberships.add((left, right) if left in cover else (right, left))
    for left, right in tree:
        memberships.update(((left, right), (right, left)))
    antecedent = tuple(sorted(memberships))
    if len(antecedent) != 26:
        raise StructuralCegarError(
            "equilateral-shell antecedent cardinality drift"
        )

    incidence: dict[tuple[Any, ...], set[tuple[Any, ...]]] = defaultdict(set)
    edge_nodes = {("edge", left, right) for left, right in edges}
    for center, point in antecedent:
        edge = tuple(sorted((center, point)))
        if edge not in edges or center not in cover:
            raise StructuralCegarError(
                "equilateral-shell antecedent is outside the pinned shell"
            )
        center_node = ("center", center)
        edge_node = ("edge", *edge)
        incidence[center_node].add(edge_node)
        incidence[edge_node].add(center_node)
    reached_nodes = {next(iter(edge_nodes))}
    while True:
        expanded_nodes = reached_nodes | {
            neighbor
            for node in reached_nodes
            for neighbor in incidence[node]
        }
        if expanded_nodes == reached_nodes:
            break
        reached_nodes = expanded_nodes
    all_nodes = edge_nodes | {("center", center) for center in cover}
    if reached_nodes != all_nodes:
        raise StructuralCegarError(
            "equilateral-shell antecedent does not connect every shell length"
        )
    lower_bound = len(edges) + minimum_cover_size - 1
    if lower_bound != len(antecedent):
        raise StructuralCegarError(
            "equilateral-shell antecedent minimality replay mismatch"
        )
    return antecedent, {
        "antecedent_literal_count": len(antecedent),
        "shell_edge_count": len(edges),
        "minimum_center_vertex_cover_size": minimum_cover_size,
        "incidence_tree_lower_bound": lower_bound,
        "center_cover": sorted(cover),
        "center_tree": [list(edge) for edge in sorted(tree)],
        "minimality": (
            "every shell edge needs an incidence; its centers form a vertex "
            "cover of minimum size 7; connecting 20 edge nodes and 7 center "
            "nodes needs at least 26 incidences, attained by this antecedent"
        ),
    }


@functools.lru_cache(maxsize=64)
def _replay_equilateral_shell_identity(
    generators: tuple[str, ...], coefficients: tuple[str, ...]
) -> bool:
    variables = sp.symbols("z1x z1y z2x z2y z3x z3y")
    sqrt_three = sp.Symbol("a")
    symbols = {str(variable): variable for variable in variables}
    symbols["a"] = sqrt_three
    total = sp.Integer(0)
    for generator, coefficient in zip(generators, coefficients, strict=True):
        total += sp.sympify(
            generator.replace("^", "**"), locals=symbols
        ) * sp.sympify(coefficient.replace("^", "**"), locals=symbols)
    expanded = sp.expand(total - 1)
    reduced = sp.rem(
        sp.Poly(expanded, sqrt_three),
        sp.Poly(sqrt_three**2 - 3, sqrt_three),
    ).as_expr()
    denominator, polynomial = sp.Poly(
        sp.expand(reduced), *variables, sqrt_three
    ).clear_denoms(convert=True)
    if denominator == 0:
        raise StructuralCegarError(
            "equilateral-shell identity has zero cleared denominator"
        )
    return sp.expand(polynomial.as_expr()) == 0


def _load_equilateral_shell_template_bank(
    directory: Path,
) -> tuple[list[dict[str, Any]], dict[str, Any]]:
    hashes = _verify_equilateral_shell_hashes(directory)
    pinned_hashes = {
        "exact-status.json": EQUILATERAL_SHELL_STATUS_SHA256,
        "graph-audit.json": EQUILATERAL_SHELL_GRAPH_SHA256,
        "equilateral-branch-system.json": (
            EQUILATERAL_SHELL_BRANCH_SYSTEM_SHA256
        ),
        "equilateral-branch-results.json": (
            EQUILATERAL_SHELL_BRANCH_RESULTS_SHA256
        ),
        "equilateral-nullstellensatz-bank.json": EQUILATERAL_SHELL_BANK_SHA256,
    }
    if any(hashes.get(path) != digest for path, digest in pinned_hashes.items()):
        raise StructuralCegarError(
            "equilateral-shell pinned artifact hash mismatch"
        )

    status = _strict_json(directory / "exact-status.json")
    status_hashes = status.get("artifact_hashes")
    expected_status_hashes = dict(hashes)
    expected_status_hashes.pop("exact-status.json")
    if (
        status.get("schema") != EQUILATERAL_SHELL_STATUS_SCHEMA
        or status.get("source_record_sha256")
        != EQUILATERAL_SHELL_SOURCE_RECORD_SHA256
        or status.get("source_metric_rows_sha256")
        != EQUILATERAL_SHELL_ROWS_SHA256
        or status_hashes != expected_status_hashes
        or status.get("no_lean_changes") is not True
    ):
        raise StructuralCegarError(
            "equilateral-shell exact-status invariant mismatch"
        )
    full_ideal = status.get("full_gauged_qq_ideal")
    real_status = status.get("real_distinct_realizability")
    if (
        not isinstance(full_ideal, dict)
        or full_ideal.get("classification") != "NONUNIT"
        or not isinstance(real_status, dict)
        or real_status.get("classification") != "EXACTLY_REFUTED"
        or real_status.get("branch_count") != 32
        or real_status.get("unit_branch_count") != 32
        or real_status.get("strict_convexity_used") is not False
    ):
        raise StructuralCegarError(
            "equilateral-shell equality/real classification mismatch"
        )

    graph = _strict_json(directory / "graph-audit.json")
    edges = tuple(tuple(edge) for edge in graph.get("edges", []))
    triangles = tuple(tuple(triangle) for triangle in graph.get("triangles", []))
    if (
        graph.get("n") != CELL.n
        or graph.get("connected") is not True
        or graph.get("reciprocal") is not True
        or graph.get("automorphism_group_size") != 10
        or edges != EQUILATERAL_SHELL_EDGES
        or triangles != EQUILATERAL_SHELL_TRIANGLES
    ):
        raise StructuralCegarError(
            "equilateral-shell graph invariant mismatch"
        )
    triangle_edges = {
        tuple(sorted(edge))
        for triangle in triangles
        for edge in itertools.combinations(triangle, 2)
    }
    outer_edges = _cycle_step_edges(EQUILATERAL_SHELL_OUTER_CYCLE, 2)
    if (
        len(triangle_edges) != 15
        or triangle_edges & outer_edges
        or triangle_edges | outer_edges != set(EQUILATERAL_SHELL_EDGES)
        or not _cycle_edges(EQUILATERAL_SHELL_INNER_CYCLE) <= triangle_edges
    ):
        raise StructuralCegarError(
            "equilateral-shell five-triangle edge partition mismatch"
        )

    rows = _strict_json_list(directory / "metric-rows.json")
    expected_rows = [
        {
            "center": center,
            "exact": False,
            "support": sorted(
                point
                for edge in EQUILATERAL_SHELL_EDGES
                if center in edge
                for point in edge
                if point != center
            ),
        }
        for center in range(CELL.n)
    ]
    if rows != expected_rows or _sha256_value(rows) != EQUILATERAL_SHELL_ROWS_SHA256:
        raise StructuralCegarError(
            "equilateral-shell metric row invariant mismatch"
        )
    source_record = _strict_json(directory / "record-000.json")
    _validate_record_hash(source_record, None, where="equilateral-shell source")
    if (
        source_record.get("record_sha256")
        != EQUILATERAL_SHELL_SOURCE_RECORD_SHA256
        or source_record.get("metric_rows_sha256")
        != EQUILATERAL_SHELL_ROWS_SHA256
        or source_record.get("metric_rows") != rows
        or source_record.get("classification") != "STRUCTURALLY_UNRESOLVED"
    ):
        raise StructuralCegarError(
            "equilateral-shell source record invariant mismatch"
        )

    branch_system = _strict_json(directory / "equilateral-branch-system.json")
    precheck = branch_system.get("graph_precheck")
    expected_signs = list(itertools.product((-1, 1), repeat=5))
    cases = branch_system.get("cases")
    if (
        branch_system.get("schema") != EQUILATERAL_SHELL_BRANCH_SYSTEM_SCHEMA
        or branch_system.get("coefficient_field") != EQUILATERAL_SHELL_FIELD
        or branch_system.get("unknowns")
        != ["z1x", "z1y", "z2x", "z2y", "z3x", "z3y"]
        or branch_system.get("branch_count") != 32
        or not isinstance(cases, list)
        or len(cases) != 32
        or not isinstance(precheck, dict)
        or precheck.get("checked_exact_edge_partition") is not True
        or precheck.get("graph_audit_sha256")
        != EQUILATERAL_SHELL_GRAPH_SHA256
        or precheck.get("inner_cycle")
        != list(EQUILATERAL_SHELL_INNER_CYCLE)
        or precheck.get("outer_cycle_step_two")
        != list(EQUILATERAL_SHELL_OUTER_CYCLE)
        or precheck.get("equilateral_triangles")
        != [list(triangle) for triangle in EQUILATERAL_SHELL_TRIANGLES]
        or [case.get("signs") for case in cases]
        != [list(signs) for signs in expected_signs]
    ):
        raise StructuralCegarError(
            "equilateral-shell branch-system invariant mismatch"
        )

    results = _strict_json(directory / "equilateral-branch-results.json")
    branch_results = results.get("results")
    if (
        results.get("schema") != EQUILATERAL_SHELL_BRANCH_RESULTS_SCHEMA
        or results.get("system_sha256")
        != EQUILATERAL_SHELL_BRANCH_SYSTEM_SHA256
        or results.get("status_counts") != {"UNIT": 32}
        or not isinstance(branch_results, list)
        or len(branch_results) != 32
        or any(
            result.get("classification") != "UNIT"
            or result.get("basis_size") != 1
            or result.get("dimension") != -1
            or result.get("remainder_of_one") != 0
            or result.get("returncode") != 0
            or result.get("timed_out") is not False
            for result in branch_results
        )
    ):
        raise StructuralCegarError(
            "equilateral-shell branch-result invariant mismatch"
        )

    bank = _strict_json(directory / "equilateral-nullstellensatz-bank.json")
    certificate_meta = bank.get("certificates")
    if (
        bank.get("schema") != EQUILATERAL_SHELL_BANK_SCHEMA
        or bank.get("branch_system_sha256")
        != EQUILATERAL_SHELL_BRANCH_SYSTEM_SHA256
        or bank.get("certificate_count") != 32
        or bank.get("all_sympy_exact_replay") is not True
        or bank.get("all_singular_explicit_replay") is not True
        or not isinstance(certificate_meta, list)
        or len(certificate_meta) != 32
    ):
        raise StructuralCegarError(
            "equilateral-shell certificate-bank invariant mismatch"
        )
    replayed_branches: list[str] = []
    for case, result, meta, signs in zip(
        cases, branch_results, certificate_meta, expected_signs, strict=True
    ):
        branch = "".join("m" if sign == -1 else "p" for sign in signs)
        if (
            case.get("branch") != branch
            or result.get("branch") != branch
            or meta.get("branch") != branch
        ):
            raise StructuralCegarError(
                "equilateral-shell branch join mismatch"
            )
        certificate_path = meta.get("certificate")
        replay_path = meta.get("replay_script")
        if (
            not isinstance(certificate_path, str)
            or not isinstance(replay_path, str)
            or hashes.get(certificate_path) != meta.get("certificate_sha256")
            or hashes.get(replay_path) != meta.get("replay_script_sha256")
        ):
            raise StructuralCegarError(
                "equilateral-shell certificate hash join mismatch"
            )
        certificate = _strict_json(directory / certificate_path)
        generators = certificate.get("generators")
        coefficients = certificate.get("coefficients")
        if (
            certificate.get("schema") != EQUILATERAL_SHELL_CERTIFICATE_SCHEMA
            or certificate.get("branch") != branch
            or certificate.get("signs") != list(signs)
            or certificate.get("coefficient_field") != EQUILATERAL_SHELL_FIELD
            or certificate.get("identity")
            != "sum(coefficients[i] * generators[i]) = 1"
            or certificate.get("liftstd_transform_residual") != "0"
            or certificate.get("sympy_exact_replay") is not True
            or certificate.get("singular_explicit_replay") is not True
            or certificate.get("replay_script") != replay_path
            or certificate.get("replay_script_sha256")
            != meta.get("replay_script_sha256")
            or not isinstance(generators, list)
            or not isinstance(coefficients, list)
            or len(generators) != 9
            or len(coefficients) != 9
            or generators != case.get("polynomials")
            or any(not isinstance(item, str) for item in generators + coefficients)
        ):
            raise StructuralCegarError(
                "equilateral-shell explicit certificate invariant mismatch"
            )
        try:
            identity_holds = _replay_equilateral_shell_identity(
                tuple(generators), tuple(coefficients)
            )
        except (ValueError, TypeError, sp.PolynomialError) as exc:
            raise StructuralCegarError(
                f"equilateral-shell exact identity parse failed: {branch}"
            ) from exc
        if not identity_holds:
            raise StructuralCegarError(
                f"equilateral-shell exact identity replay failed: {branch}"
            )
        replayed_branches.append(branch)

    antecedent, antecedent_replay = _equilateral_shell_antecedent()
    replay = {
        "certificate_kind": EQUILATERAL_SHELL_CONTRADICTION_KIND,
        "full_gauged_qq_ideal_classification": "NONUNIT",
        "real_distinct_realizability": "EXACTLY_REFUTED",
        "coefficient_field": EQUILATERAL_SHELL_FIELD,
        "orientation_branch_count": len(replayed_branches),
        "unit_branch_count": len(replayed_branches),
        "explicit_identity_count": len(replayed_branches),
        "identity_replayed": True,
        "external_hypothesis": "P97 point pairwise-distinctness",
        "strict_convexity_used": False,
        "real_reduction": (
            "the common shell length is positive by pairwise distinctness; "
            "similarity fixes one inner edge, and the five equilateral "
            "triangles exhaust the 32 choices of signed 60-degree apex"
        ),
        "antecedent_semantics": (
            "the directed selected-shell memberships connect all 20 "
            "undirected shell-edge squared lengths into one equality class"
        ),
        **antecedent_replay,
    }
    certificate_summary = {
        "schema": EQUILATERAL_SHELL_BANK_SCHEMA,
        "exact_status_sha256": EQUILATERAL_SHELL_STATUS_SHA256,
        "branch_system_sha256": EQUILATERAL_SHELL_BRANCH_SYSTEM_SHA256,
        "branch_results_sha256": EQUILATERAL_SHELL_BRANCH_RESULTS_SHA256,
        "certificate_bank_sha256": EQUILATERAL_SHELL_BANK_SHA256,
        "certificate_count": 32,
    }
    system_summary = {
        "schema": EQUILATERAL_SHELL_STATUS_SCHEMA,
        "source_record_sha256": EQUILATERAL_SHELL_SOURCE_RECORD_SHA256,
        "source_metric_rows_sha256": EQUILATERAL_SHELL_ROWS_SHA256,
        "graph_audit_sha256": EQUILATERAL_SHELL_GRAPH_SHA256,
        "full_gauged_qq_ideal_classification": "NONUNIT",
    }
    template_unsigned = {
        "name": "system-00-851c782cb69c-equilateral-shell-real-distinctness",
        "certificate_kind": EQUILATERAL_SHELL_CONTRADICTION_KIND,
        "algebraic_certificate": certificate_summary,
        "algebraic_system": system_summary,
        "algebraic_replay": replay,
        "antecedent_memberships": [list(pair) for pair in antecedent],
        "origin": EQUILATERAL_SHELL_ORIGIN,
        "stage": EQUILATERAL_SHELL_STAGE,
    }
    template = {
        **template_unsigned,
        "template_sha256": _sha256_value(template_unsigned),
    }
    summary = {
        "schema": EQUILATERAL_SHELL_STATUS_SCHEMA,
        "manifest_sha256": EQUILATERAL_SHELL_STATUS_SHA256,
        "sha256s_sha256": EQUILATERAL_SHELL_SHA256SUMS_SHA256,
        "certificate_count": 1,
        "certificate_kind": EQUILATERAL_SHELL_CONTRADICTION_KIND,
        "template_sha256": [template["template_sha256"]],
        "systems": [{"name": template["name"], **system_summary, **replay}],
        "semantics": (
            "the full gauged QQ equality ideal is NONUNIT; the typed cut uses "
            "P97 real pairwise-distinctness to reduce to 32 equilateral "
            "orientation branches, each closed by an exactly replayed "
            "QQ(sqrt(3)) Nullstellensatz identity"
        ),
        "lean_kernel_checked": False,
        "trust_boundary": status.get("trust_boundary"),
        "artifact_prefix": str(directory),
    }
    return [template], summary


def _load_algebraic_template_bank(
    directory: Path,
) -> tuple[list[dict[str, Any]], dict[str, Any]]:
    if (directory / "exact-status.json").is_file():
        status = _strict_json(directory / "exact-status.json")
        if status.get("schema") == EQUILATERAL_SHELL_STATUS_SCHEMA:
            return _load_equilateral_shell_template_bank(directory)
    manifest = _strict_json(directory / "manifest.json")
    if manifest.get("schema") == REAL_DISTINCTNESS_MANIFEST_SCHEMA:
        return _load_real_distinctness_template_bank(directory)
    if manifest.get("schema") != ALGEBRAIC_MANIFEST_SCHEMA:
        raise StructuralCegarError("algebraic bootstrap manifest schema mismatch")
    declared_audit = manifest.get("source_unit_audit")
    spec = next(
        (
            candidate
            for candidate in ALGEBRAIC_BANK_SPECS
            if declared_audit == candidate["audit"]
        ),
        None,
    )
    if spec is None:
        raise StructuralCegarError("algebraic bootstrap source audit is not pinned")
    artifact_prefix = str(spec["artifact_prefix"])
    hashes = _verify_saved_hashes(directory, artifact_prefix)
    scope_count = int(spec["scope_count"])
    if manifest.get("scope") != {
        "blockers_used": False,
        "equality_only": True,
        "finite_system_count": scope_count,
        "inequalities_used": False,
        "lean_kernel_checked": False,
        "off_support_exactness_used": False,
        "p97_closure_claimed": False,
        "phase3_completeness_claimed": False,
    }:
        raise StructuralCegarError("algebraic bootstrap manifest scope mismatch")
    if manifest.get("summary") != spec["certificate_summary"]:
        raise StructuralCegarError("algebraic bootstrap manifest summary mismatch")

    audit = spec["audit"]
    audit_path = ROOT / str(audit["path"])
    if (
        not audit_path.is_file()
        or _sha256_file(audit_path) != audit.get("sha256")
    ):
        raise StructuralCegarError("algebraic bootstrap source audit hash mismatch")
    audit_manifest = _strict_json(audit_path)
    if (
        audit_manifest.get("schema")
        != "p97-phase3-survivor-singular-equality-run-v1"
        or audit_manifest.get("summary") != spec["audit_summary"]
    ):
        raise StructuralCegarError(
            "algebraic bootstrap source audit composition mismatch"
        )
    audit_systems = audit_manifest.get("systems")
    expected_audit_systems = spec["audit_systems"]
    if (
        not isinstance(audit_systems, list)
        or len(audit_systems) != len(expected_audit_systems)
    ):
        raise StructuralCegarError("source unit audit system set mismatch")
    for actual, expected in zip(audit_systems, expected_audit_systems, strict=True):
        if not isinstance(actual, dict) or (
            actual.get("name"),
            actual.get("classification"),
            actual.get("system_artifact_sha256"),
            actual.get("metric_rows_sha256"),
            actual.get("survivor_count"),
        ) != expected:
            raise StructuralCegarError(
                "algebraic bootstrap source audit system mismatch"
            )
    audit_by_name = {
        item.get("name"): item for item in audit_systems if isinstance(item, dict)
    }

    targets = manifest.get("targets")
    expected_targets = spec["targets"]
    if not isinstance(targets, list) or len(targets) != len(expected_targets):
        raise StructuralCegarError("algebraic bootstrap target count mismatch")
    if [target.get("name") for target in targets if isinstance(target, dict)] != list(
        expected_targets
    ):
        raise StructuralCegarError("algebraic bootstrap target order mismatch")
    templates: list[dict[str, Any]] = []
    summaries: list[dict[str, Any]] = []
    seen_names: set[str] = set()
    for target in targets:
        if not isinstance(target, dict) or target.get("status") != "CERTIFIED_UNIT":
            raise StructuralCegarError("algebraic bootstrap target is not certified")
        name = target.get("name")
        if not isinstance(name, str) or name in seen_names:
            raise StructuralCegarError("algebraic bootstrap target name mismatch")
        seen_names.add(name)
        source_audit = audit_by_name.get(name)
        if (
            not isinstance(source_audit, dict)
            or source_audit.get("classification") != "UNIT"
        ):
            raise StructuralCegarError("target is absent from source unit audit")
        expected_system_hash, expected_rows_hash, _expected_projection = (
            expected_targets[name]
        )
        if (
            target.get("source_system_sha256") != expected_system_hash
            or target.get("source_metric_rows_sha256") != expected_rows_hash
        ):
            raise StructuralCegarError(
                f"algebraic pinned source invariant mismatch for {name}"
            )
        for target_field, audit_field in (
            ("source_system", "system_artifact"),
            ("source_system_sha256", "system_artifact_sha256"),
            ("source_metric_rows_sha256", "metric_rows_sha256"),
            ("survivor_count", "survivor_count"),
        ):
            if target.get(target_field) != source_audit.get(audit_field):
                raise StructuralCegarError(
                    f"target/source-audit {target_field} mapping mismatch"
                )
        source_path = ROOT / str(target.get("source_system"))
        if (
            not source_path.is_file()
            or _sha256_file(source_path) != target.get("source_system_sha256")
        ):
            raise StructuralCegarError("algebraic source system hash mismatch")
        system = _strict_json(source_path)
        if system.get("metric_rows_sha256") != target.get(
            "source_metric_rows_sha256"
        ):
            raise StructuralCegarError("target/source-system row hash mismatch")

        certificate_meta = target.get("certificate")
        replay_meta = target.get("replay")
        if not isinstance(certificate_meta, dict) or not isinstance(replay_meta, dict):
            raise StructuralCegarError("target certificate/replay metadata missing")
        certificate_path = _saved_artifact_path(
            directory, certificate_meta.get("path"), artifact_prefix
        )
        declared_certificate_path = certificate_meta.get("path")
        if hashes.get(declared_certificate_path) != certificate_meta.get(
            "file_sha256"
        ) or _sha256_file(certificate_path) != certificate_meta.get("file_sha256"):
            raise StructuralCegarError("target certificate saved hash mismatch")
        certificate = _strict_json(certificate_path)
        if certificate.get("source_system") != target.get("source_system"):
            raise StructuralCegarError("certificate/source-system path mismatch")
        if certificate.get("source_system_sha256") != target.get(
            "source_system_sha256"
        ):
            raise StructuralCegarError("certificate/source-system hash mismatch")
        if certificate.get("certificate_payload_sha256") != certificate_meta.get(
            "payload_sha256"
        ):
            raise StructuralCegarError("certificate payload metadata mismatch")
        if (
            replay_meta.get("status") != "PASS"
            or replay_meta.get("producer_preflight_status") != "PASS"
            or replay_meta.get("result", {}).get("status") != "PASS"
        ):
            raise StructuralCegarError("saved independent replay was not PASS")
        for path_field, hash_field in (
            ("checker", "checker_sha256"),
            ("command_path", "command_sha256"),
            ("producer_preflight_path", "producer_preflight_sha256"),
            ("stdout", "stdout_sha256"),
            ("stderr", "stderr_sha256"),
        ):
            declared = replay_meta.get(path_field)
            if hashes.get(declared) != replay_meta.get(hash_field):
                raise StructuralCegarError(
                    f"saved replay {path_field} hash mapping mismatch"
                )

        _rows, antecedent, replay = _replay_algebraic_certificate(
            certificate, system
        )
        expected_projection = expected_targets[name][2]
        if (
            replay["nonzero_cofactor_count"],
            replay["antecedent_literal_count"],
            replay["used_row_indices"],
        ) != expected_projection:
            raise StructuralCegarError(
                f"algebraic sparse projection invariant mismatch for {name}"
            )
        template_unsigned = {
            "name": name,
            "certificate_kind": UNIT_CONTRADICTION_KIND,
            "algebraic_certificate": certificate,
            "algebraic_system": system,
            "algebraic_replay": replay,
            "antecedent_memberships": [list(pair) for pair in antecedent],
            "origin": ALGEBRAIC_ORIGIN,
            "stage": ALGEBRAIC_STAGE,
        }
        templates.append(
            {
                **template_unsigned,
                "template_sha256": _sha256_value(template_unsigned),
            }
        )
        summaries.append(
            {
                "name": name,
                "source_system_sha256": target["source_system_sha256"],
                "source_metric_rows_sha256": target[
                    "source_metric_rows_sha256"
                ],
                "certificate_file_sha256": certificate_meta["file_sha256"],
                "certificate_payload_sha256": certificate_meta["payload_sha256"],
                **replay,
            }
        )
    if seen_names != set(expected_targets):
        raise StructuralCegarError("algebraic bootstrap target set mismatch")
    summary = {
        "schema": ALGEBRAIC_MANIFEST_SCHEMA,
        "manifest_sha256": hashes[
            f"{artifact_prefix}/manifest.json"
        ],
        "sha256s_sha256": _sha256_file(directory / "SHA256SUMS"),
        "certificate_count": len(templates),
        "systems": summaries,
        "semantics": (
            "P97 Euclidean/distinct-point nogoods conditional on P0 != P1; "
            "similarity-normalized to P0=(0,0), P1=(1,0)"
        ),
        "lean_kernel_checked": False,
        "artifact_prefix": artifact_prefix,
        "source_audit": audit,
    }
    return templates, {
        **summary,
        "template_sha256": [
            template["template_sha256"] for template in templates
        ],
    }


def _algebraic_directories(
    value: str | Path | Sequence[str | Path] | None,
) -> tuple[Path, ...]:
    if value is None:
        return ()
    if isinstance(value, (str, Path)):
        return (Path(value),)
    return tuple(Path(directory) for directory in value)


def _load_algebraic_templates(
    directories: str | Path | Sequence[str | Path],
) -> tuple[list[dict[str, Any]], dict[str, Any]]:
    templates: list[dict[str, Any]] = []
    banks: list[dict[str, Any]] = []
    seen_names: set[str] = set()
    seen_template_hashes: set[str] = set()
    for directory in _algebraic_directories(directories):
        bank_templates, bank_summary = _load_algebraic_template_bank(directory)
        for template in bank_templates:
            name = template["name"]
            template_hash = template["template_sha256"]
            if name in seen_names:
                raise StructuralCegarError(
                    f"cross-bank duplicate algebraic target name: {name}"
                )
            if template_hash in seen_template_hashes:
                raise StructuralCegarError(
                    "cross-bank duplicate algebraic template hash"
                )
            seen_names.add(name)
            seen_template_hashes.add(template_hash)
        templates.extend(bank_templates)
        banks.append(
            {
                **bank_summary,
                "source": str(directory.resolve()),
            }
        )
    return templates, {
        "certificate_count": len(templates),
        "certificate_kind_histogram": dict(
            sorted(
                Counter(
                    str(template["certificate_kind"])
                    for template in templates
                ).items()
            )
        ),
        "template_sha256": [
            template["template_sha256"] for template in templates
        ],
        "systems": [
            system
            for bank in banks
            for system in bank["systems"]
        ],
        "banks": banks,
        "semantics": (
            "typed P97 Euclidean/distinct-point nogoods: QQ unit equality "
            "infeasibility and QQ ideal membership forcing a real point "
            "collision, plus exact QQ(sqrt(3)) closure of all 32 real "
            "equilateral-shell orientation branches; the latter two separately "
            "require external pairwise distinctness"
        ),
        "lean_kernel_checked": False,
    }


def _validate_permutation(value: Any) -> tuple[int, ...]:
    if (
        not isinstance(value, list)
        or len(value) != CELL.n
        or any(type(point) is not int for point in value)
        or set(value) != set(range(CELL.n))
    ):
        raise StructuralCegarError("algebraic match is not a Fin10 bijection")
    return tuple(value)


def _mapped_memberships(
    template: Mapping[str, Any], permutation: Sequence[int]
) -> tuple[tuple[int, int], ...]:
    raw = template.get("antecedent_memberships")
    if not isinstance(raw, list):
        raise StructuralCegarError("algebraic template lacks antecedent memberships")
    try:
        source = tuple((int(pair[0]), int(pair[1])) for pair in raw)
    except (TypeError, ValueError, IndexError) as exc:
        raise StructuralCegarError("invalid algebraic template antecedent") from exc
    if (
        len(source) != len(set(source))
        or tuple(sorted(source)) != source
        or any(
            center == point
            or not 0 <= center < CELL.n
            or not 0 <= point < CELL.n
            for center, point in source
        )
    ):
        raise StructuralCegarError("invalid algebraic template antecedent")
    mapped = tuple(
        sorted((permutation[center], permutation[point]) for center, point in source)
    )
    if len(mapped) != len(set(mapped)):
        raise StructuralCegarError("bijection collapsed algebraic antecedent edges")
    return mapped


def _find_template_permutation(
    encoding: Any,
    assignment: Mapping[int, bool],
    template: Mapping[str, Any],
) -> tuple[int, ...] | None:
    """Deterministically find a non-induced directed spanning-subgraph match."""

    source_edges = {
        tuple(pair) for pair in template.get("antecedent_memberships", [])
    }
    if not source_edges or any(
        len(edge) != 2
        or any(type(point) is not int for point in edge)
        for edge in source_edges
    ):
        raise StructuralCegarError("invalid algebraic template edge set")
    target_edges = {
        (center, point)
        for center in range(CELL.n)
        for point in range(CELL.n)
        if center != point
        and assignment.get(encoding.var("s", center, point)) is True
    }
    source_out = Counter(left for left, _right in source_edges)
    source_in = Counter(right for _left, right in source_edges)
    target_out = Counter(left for left, _right in target_edges)
    target_in = Counter(right for _left, right in target_edges)
    mapping: dict[int, int] = {}
    used: set[int] = set()

    def viable(source: int, target: int) -> bool:
        if target in used:
            return False
        if (
            source_out[source] > target_out[target]
            or source_in[source] > target_in[target]
        ):
            return False
        for other_source, other_target in mapping.items():
            if (
                (source, other_source) in source_edges
                and (target, other_target) not in target_edges
            ) or (
                (other_source, source) in source_edges
                and (other_target, target) not in target_edges
            ):
                return False
        return True

    def search() -> tuple[int, ...] | None:
        if len(mapping) == CELL.n:
            permutation = tuple(mapping[source] for source in range(CELL.n))
            mapped = _mapped_memberships(template, permutation)
            if any(edge not in target_edges for edge in mapped):
                raise StructuralCegarError(
                    "completed algebraic mapping lost a required edge"
                )
            return permutation
        choices: list[tuple[int, int, int, list[int]]] = []
        for source in range(CELL.n):
            if source in mapping:
                continue
            candidates = [
                target
                for target in range(CELL.n)
                if viable(source, target)
            ]
            if not candidates:
                return None
            # Most-constrained first; higher directed degree breaks equal domain
            # sizes, then source label. Candidate targets remain ascending.
            choices.append(
                (
                    len(candidates),
                    -(source_out[source] + source_in[source]),
                    source,
                    candidates,
                )
            )
        _size, _degree, source, candidates = min(choices)
        for target in candidates:
            mapping[source] = target
            used.add(target)
            result = search()
            if result is not None:
                return result
            used.remove(target)
            del mapping[source]
        return None

    return search()


def _find_algebraic_match(
    encoding: Any,
    assignment: Mapping[int, bool],
    templates: Sequence[Mapping[str, Any]],
) -> tuple[Mapping[str, Any], tuple[int, ...], tuple[tuple[int, int], ...]] | None:
    for template in templates:
        permutation = _find_template_permutation(encoding, assignment, template)
        if permutation is None:
            continue
        mapped = _mapped_memberships(template, permutation)
        _clause_for_memberships(encoding, mapped, assignment)
        return template, permutation, mapped
    return None


def _assignment_hash(
    encoding: Any, assignment: Mapping[int, bool]
) -> str:
    return _sha256_value(encoding.semantic_record(assignment))


def _run_smoke_gates() -> dict[str, Any]:
    dead_rows = tuple(
        metric.MetricRow(center, support, False)
        for center, support in enumerate(
            (
                (1, 2, 3, 4),
                (0, 2, 3, 5),
                (0, 1, 3, 6),
                (0, 1, 2, 7),
                (0, 1, 5, 8),
                (0, 1, 4, 9),
                (0, 2, 4, 8),
                (0, 2, 6, 9),
                (0, 3, 4, 7),
                (0, 4, 5, 6),
            )
        )
    )
    for center, row in enumerate(dead_rows):
        _validate_phase3_row(row, expected_center=center)
    dead_detection = _detection(dead_rows)
    if dead_detection is None:
        raise StructuralCegarError("known-dead smoke model was not detected")
    dead_certificate, _ = _certificate(dead_rows, dead_detection)

    unresolved_rows = tuple(
        metric.MetricRow(center, ((center + 1) % 4,), False)
        for center in range(4)
    )
    unresolved = metric._formalized_metric_core(
        unresolved_rows,
        4,
        (),
        include_extended=True,
        include_ordered=False,
    )
    if unresolved is not None:
        raise StructuralCegarError("synthetic non-detected smoke candidate was detected")
    unsigned = {
        "schema": SMOKE_SCHEMA,
        "known_dead": {
            "source": "current bounded100 model index 0 rows",
            "stage": dead_detection["stage"],
            "certificate_proof_sha256": dead_certificate["proof_sha256"],
            "certificate_replayed": True,
        },
        "synthetic_non_detected": {
            "source": "forward directed four-cycle singleton rows",
            "detector_result": None,
        },
    }
    return {**unsigned, "smoke_sha256": _sha256_value(unsigned)}


def _dependency_hashes() -> dict[str, str]:
    paths = (
        Path(__file__).resolve(),
        Path(sat.__file__).resolve(),
        Path(realize.__file__).resolve(),
        Path(metric.__file__).resolve(),
        Path(certificates.__file__).resolve(),
        Path(equality_probe.__file__).resolve(),
        Path(ordered_rules.__file__).resolve(),
        Path(ordered_rules.producer_bank.__file__).resolve(),
        Path(shared_pair_separation.__file__).resolve(),
        ROOT
        / "lean/Erdos9796Proof/P97/Census554/ConvexFivePointCore.lean",
        ROOT
        / "lean/Erdos9796Proof/P97/Census554/ConvexRhombusCore.lean",
        ROOT
        / "lean/Erdos9796Proof/P97/ATail/CapCrossingKalmanson.lean",
        ROOT / "lean/Erdos9796Proof/P97/Phase3SharedPairSeparation.lean",
        ROOT
        / "lean/Erdos9796Proof/P97/EndpointCertificate/OrderedCoreSigns.lean",
    )
    return {str(path.relative_to(ROOT)): _sha256_file(path) for path in paths}


def _algebraic_bank_certificate_kind(directory: Path) -> str:
    exact_status = directory / "exact-status.json"
    if exact_status.is_file():
        schema = _strict_json(exact_status).get("schema")
        if schema == EQUILATERAL_SHELL_STATUS_SCHEMA:
            return EQUILATERAL_SHELL_CONTRADICTION_KIND
    schema = _strict_json(directory / "manifest.json").get("schema")
    if schema == ALGEBRAIC_MANIFEST_SCHEMA:
        return UNIT_CONTRADICTION_KIND
    if schema == REAL_DISTINCTNESS_MANIFEST_SCHEMA:
        return REAL_DISTINCTNESS_CONTRADICTION_KIND
    raise StructuralCegarError(
        f"unsupported algebraic certificate manifest schema: {schema!r}"
    )


def _algebraic_bank_descriptor(directory: Path) -> Path:
    exact_status = directory / "exact-status.json"
    if exact_status.is_file():
        return exact_status
    return directory / "manifest.json"


def _algebraic_bank_semantics(directory: Path) -> str:
    kind = _algebraic_bank_certificate_kind(directory)
    if kind == EQUILATERAL_SHELL_CONTRADICTION_KIND:
        return (
            "conditional P97 real-distinctness cut; connected shell "
            "equalities and positivity reduce to 32 exactly replayed "
            "QQ(sqrt(3)) orientation branches; the full equality ideal is "
            "NONUNIT"
        )
    if kind == REAL_DISTINCTNESS_CONTRADICTION_KIND:
        return (
            "conditional P97 real-distinctness cut; P0 != P1 justifies "
            "similarity gauge P0=(0,0), P1=(1,0), and QQ ideal membership "
            "forces a forbidden collision"
        )
    return (
        "conditional P97 Euclidean/distinct-point cut; P0 != P1 justifies "
        "similarity gauge P0=(0,0), P1=(1,0), and the QQ equality ideal is unit"
    )


def _base_configuration(
    encoding: Any,
    *,
    timeout_s: int,
    learned_core_limit: int,
    survivor_limit: int,
    workers: int,
    parallel_mode: str,
    cube_depth: int,
    cube_artifact_mode: str,
    bootstrap_results: Path | None,
    algebraic_bootstraps: Sequence[Path],
    shard_depth: int | None = None,
    shard_index: int | None = None,
) -> dict[str, Any]:
    cube_variables = (
        []
        if parallel_mode == "sequential"
        else [
            {
                "position": position,
                "name": name,
                "variable": variable,
                "key": list(key),
            }
            for position, (name, variable, key) in enumerate(
                _stable_semantic_variables(encoding, cube_depth)
            )
        ]
    )
    global_base_cnf_sha256 = _sha256_bytes(encoding.cnf_bytes())
    shard = (
        None
        if shard_depth is None or shard_index is None
        else _shard_spec(
            encoding,
            depth=shard_depth,
            index=shard_index,
            global_base_cnf_sha256=global_base_cnf_sha256,
        )
    )
    return {
        "cell": {"k": 4, "n": 10, "profile": [4, 4, 5], "exact": True},
        "mode": encoding.mode,
        "artifact_schema": _manifest_schema(encoding),
        "learned_record_schema": _learned_schema(encoding),
        "survivor_record_schema": _survivor_schema(encoding),
        "sat_encoding": encoding.configuration(),
        "source_provenance": {
            "legacy_driver_sha256": (
                "af87693d1ff05f556c967237704edd447d3800486bdb530e4b1ebefd5897e33a"
            ),
            "legacy_sat_generate_sha256": (
                "df18dcebc77577826803fdfb60951d0812b3935587569be8c7ae443bcca851d3"
            ),
            "snapshot": (
                "scratch/p97-distinct-distance-lane/"
                "phase3_legacy_source_snapshot_20260729.json"
            ),
        },
        "static_constraints": {
            "blocker_projection": {
                "enabled": encoding.project_blockers,
                "semantics": (
                    "existential B1 projection; classifiers reconstruct "
                    "c_min(x)=min{d:s[d,x]}"
                ),
            },
            "dual2": {
                "enabled": encoding.static_dual2,
                "scope": (
                    "convex-independent Euclidean carrier; at most two carrier "
                    "centers lie on a target-pair perpendicular bisector"
                ),
            },
            "s_mincut": {
                "enabled": encoding.mincut_scope is not None,
                "scope_token": encoding.mincut_scope,
                "scope": (
                    "Problem97.counterexample_card_ge_ten at n=10"
                    if encoding.mincut_scope == sat.MINCUT_SCOPE_CARD_GE_TEN
                    else (
                        "explicit cardinal-minimal counterexample source"
                        if encoding.mincut_scope == sat.MINCUT_SCOPE_MINIMAL_SOURCE
                        else None
                    )
                ),
            },
            "dynamic_perpendicular_bisector_detector": {
                "enabled": True,
                "reason": (
                    "retained for closure-derived longer equality paths; "
                    "DUAL2 does not subsume the audited 189 of 425 records"
                ),
            },
        },
        "timeout_seconds": timeout_s,
        "dynamic_learned_core_limit": learned_core_limit,
        "survivor_limit": survivor_limit,
        "workers": workers,
        "parallel": {
            "mode": parallel_mode,
            "cube_depth": cube_depth,
            "artifact_mode": cube_artifact_mode,
            "artifact_policy": (
                "retain per-cube CNF and available unverified DRAT files"
                if cube_artifact_mode == "full"
                else (
                    "retain only hashed plan/results; regenerate cube CNFs from "
                    "the pinned snapshot and discard local unverified DRAT files"
                )
            ),
            "compact_crash_policy": (
                "transient cube files may remain after an interrupted batch; "
                "resume fails closed on any unjournaled or unexpected artifact"
            ),
            "artifact_schema_compatibility": (
                "cube result/batch v2 is required because retention mode is "
                "hash-bound; pre-v2 cube journals intentionally fail closed"
            ),
            "cube_count": (
                0 if parallel_mode == "sequential" else 1 << cube_depth
            ),
            "semantic_variables": cube_variables,
            "coordinator_commit_order": (
                "ascending cube index; worker completion order is ignored"
            ),
            "stale_result_policy": (
                "decode and recheck every SAT assignment against the live "
                "structural antichain and committed cut streams"
            ),
            "claim_scope": (
                "cube results are scheduling artifacts only and never establish "
                "a terminal or theorem-level result"
            ),
        },
        "detector": (
            "_formalized_metric_core(rows,10,(),"
            "include_extended=True,include_ordered=False); then all 24 "
            "cap_orders with forward/reverse equality-convex-five-point; "
            "then phase3_ordered_metric_rules exhaustive convex-rhombus; "
            "then shared-pair cyclic separation over every compatible cap "
            "annotation/order with an exact minimized positive antecedent; "
            "then direct five-point/three-selected-row Kalmanson coverage "
            "over every within-fiber order under one minimized row antecedent"
        ),
        "metric_row_exact": False,
        **({} if shard is None else {"shard": shard}),
        "bootstrap_results": (
            None
            if bootstrap_results is None
            else {
                "path": str(bootstrap_results.resolve()),
                "sha256": _sha256_file(bootstrap_results),
            }
        ),
        "algebraic_bootstraps": [
            {
                "path": str(algebraic_bootstrap.resolve()),
                "descriptor": _algebraic_bank_descriptor(
                    algebraic_bootstrap
                ).name,
                "descriptor_sha256": _sha256_file(
                    _algebraic_bank_descriptor(algebraic_bootstrap)
                ),
                "sha256s_sha256": _sha256_file(
                    algebraic_bootstrap / "SHA256SUMS"
                ),
                "certificate_kind": _algebraic_bank_certificate_kind(
                    algebraic_bootstrap
                ),
                "matching": (
                    "deterministic non-induced directed spanning-subgraph "
                    "bijection over Fin10"
                ),
                "semantics": (
                    _algebraic_bank_semantics(algebraic_bootstrap)
                ),
            }
            for algebraic_bootstrap in algebraic_bootstraps
        ],
        "dependency_sha256": _dependency_hashes(),
    }


def _clause_subsumption_minimize(
    certificates: Mapping[tuple[int, ...], Any],
) -> tuple[
    tuple[tuple[int, ...], ...],
    dict[tuple[int, ...], tuple[int, ...]],
]:
    """Return a deterministic syntactic clause antichain and its cover map."""

    kept: list[tuple[int, ...]] = []
    by_anchor: dict[int, list[tuple[int, ...]]] = defaultdict(list)
    clause_sets: dict[tuple[int, ...], frozenset[int]] = {}
    cover: dict[tuple[int, ...], tuple[int, ...]] = {}
    for clause in sorted(
        certificates, key=lambda item: (len(item), tuple(sorted(item)))
    ):
        if not clause or len(clause) != len(set(clause)):
            raise StructuralCegarError(
                "bootstrap learned clause is empty or repeats a literal"
            )
        clause_set = frozenset(clause)
        candidates = {
            existing
            for literal in clause
            for existing in by_anchor.get(literal, ())
            if len(existing) <= len(clause)
            and clause_sets[existing] <= clause_set
        }
        matched = (
            min(
                candidates,
                key=lambda item: (len(item), tuple(sorted(item))),
            )
            if candidates
            else None
        )
        if matched is None:
            kept.append(clause)
            by_anchor[clause[0]].append(clause)
            clause_sets[clause] = clause_set
            cover[clause] = clause
        else:
            cover[clause] = matched
    return tuple(kept), cover


def _bootstrap_certificates(
    encoding: Any, source: Path
) -> tuple[list[dict[str, Any]], dict[str, Any]]:
    raw = _strict_json_lines(source)
    source_fields = {
        "schema",
        "index",
        "origin",
        "raw_sat_index",
        "assignment_sha256",
        "semantic_assignment",
        "stage",
        "certificate",
        "clause",
        "clause_sha256",
        "superseded_nogood_sha256",
        "previous_record_sha256",
        "record_sha256",
    }
    structural_by_key: dict[Any, dict[str, Any]] = {}
    cap_order_by_schema: dict[
        str, dict[tuple[int, ...], dict[str, Any]]
    ] = {
        CAP_ORDER_CERTIFICATE_SCHEMA: {},
        RHOMBUS_CAP_ORDER_CERTIFICATE_SCHEMA: {},
        KALMANSON_CAP_ORDER_CERTIFICATE_SCHEMA: {},
        SHARED_PAIR_SEPARATION_CERTIFICATE_SCHEMA: {},
    }
    source_structural_bank = certificates._NogoodBank()
    source_cap_order_clauses: dict[str, set[tuple[int, ...]]] = {
        CAP_ORDER_CERTIFICATE_SCHEMA: set(),
        RHOMBUS_CAP_ORDER_CERTIFICATE_SCHEMA: set(),
        KALMANSON_CAP_ORDER_CERTIFICATE_SCHEMA: set(),
        SHARED_PAIR_SEPARATION_CERTIFICATE_SCHEMA: set(),
    }
    stages: Counter[str] = Counter()
    schemas: Counter[str] = Counter()
    previous: str | None = None
    for index, record in enumerate(raw):
        where = f"bootstrap record {index}"
        if set(record) != source_fields:
            raise StructuralCegarError(
                f"{where} learned-record fields mismatch"
            )
        _validate_record_hash(record, previous, where=where)
        previous = record["record_sha256"]
        if (
            record.get("schema") != _learned_schema(encoding)
            or record.get("index") != index
        ):
            raise StructuralCegarError(
                f"{where} learned-record identity mismatch"
            )
        certificate = record.get("certificate")
        if not isinstance(certificate, dict):
            raise StructuralCegarError(
                f"{where} lacks a certificate"
            )
        try:
            if "schema" not in certificate:
                replayed, selected = _replay_certificate_json(certificate)
                legacy_clause = _clause_for_rows(encoding, selected)
                current_clause = _clause_for_structural_certificate(
                    encoding, replayed, selected
                )
                key = certificates._rows_key(selected)
                _matched, superseded, added = source_structural_bank.add(
                    key, replayed
                )
                if not added:
                    raise StructuralCegarError(
                        "source learned certificate was redundant"
                    )
                expected_superseded = sorted(
                    certificates._nogood_sha256(old)
                    for old in superseded
                )
                if (
                    record.get("superseded_nogood_sha256")
                    != expected_superseded
                ):
                    raise StructuralCegarError(
                        "source learned supersession list mismatch"
                    )
                current = structural_by_key.get(key)
                if (
                    current is None
                    or _canonical_bytes(replayed) < _canonical_bytes(current)
                ):
                    structural_by_key[key] = replayed
                schema = "structural-row-certificate"
                source_origin = record.get("origin")
                if source_origin in {
                    "solver",
                    "bootstrap-structural-prefix",
                }:
                    clause = legacy_clause
                elif source_origin in {
                    STRUCTURAL_PATH_ORIGIN,
                    BOOTSTRAP_STRUCTURAL_PATH_ORIGIN,
                }:
                    clause = current_clause
                else:
                    raise StructuralCegarError(
                        "structural source origin mismatch"
                    )
                dynamic_origins = {"solver", STRUCTURAL_PATH_ORIGIN}
                bootstrap_origins = {
                    "bootstrap-structural-prefix",
                    BOOTSTRAP_STRUCTURAL_PATH_ORIGIN,
                }
                expected_stage = replayed["stage"]
            elif certificate["schema"] == CAP_ORDER_CERTIFICATE_SCHEMA:
                replayed, _selected, _facts = _replay_cap_order_certificate(
                    certificate
                )
                clause = _clause_for_cap_order_certificate(encoding, replayed)
                current = cap_order_by_schema[
                    CAP_ORDER_CERTIFICATE_SCHEMA
                ].get(clause)
                if (
                    current is None
                    or _canonical_bytes(replayed) < _canonical_bytes(current)
                ):
                    cap_order_by_schema[CAP_ORDER_CERTIFICATE_SCHEMA][
                        clause
                    ] = replayed
                schema = CAP_ORDER_CERTIFICATE_SCHEMA
                dynamic_origin = CAP_ORDER_ORIGIN
                bootstrap_origin = BOOTSTRAP_CAP_ORDER_ORIGIN
                dynamic_origins = {dynamic_origin}
                bootstrap_origins = {bootstrap_origin}
                expected_stage = CAP_ORDER_STAGE
            elif certificate["schema"] == RHOMBUS_CAP_ORDER_CERTIFICATE_SCHEMA:
                replayed, _selected, _facts = (
                    _replay_rhombus_cap_order_certificate(certificate)
                )
                clause = _clause_for_rhombus_cap_order_certificate(
                    encoding, replayed
                )
                current = cap_order_by_schema[
                    RHOMBUS_CAP_ORDER_CERTIFICATE_SCHEMA
                ].get(clause)
                if (
                    current is None
                    or _canonical_bytes(replayed) < _canonical_bytes(current)
                ):
                    cap_order_by_schema[RHOMBUS_CAP_ORDER_CERTIFICATE_SCHEMA][
                        clause
                    ] = replayed
                schema = RHOMBUS_CAP_ORDER_CERTIFICATE_SCHEMA
                dynamic_origin = RHOMBUS_CAP_ORDER_ORIGIN
                bootstrap_origin = BOOTSTRAP_RHOMBUS_CAP_ORDER_ORIGIN
                dynamic_origins = {dynamic_origin}
                bootstrap_origins = {bootstrap_origin}
                expected_stage = RHOMBUS_CAP_ORDER_STAGE
            elif certificate["schema"] == KALMANSON_CAP_ORDER_CERTIFICATE_SCHEMA:
                replayed, _selected, _facts = (
                    _replay_kalmanson_cap_order_certificate(certificate)
                )
                clause = _clause_for_kalmanson_cap_order_certificate(
                    encoding, replayed
                )
                current = cap_order_by_schema[
                    KALMANSON_CAP_ORDER_CERTIFICATE_SCHEMA
                ].get(clause)
                if (
                    current is None
                    or _canonical_bytes(replayed) < _canonical_bytes(current)
                ):
                    cap_order_by_schema[
                        KALMANSON_CAP_ORDER_CERTIFICATE_SCHEMA
                    ][clause] = replayed
                schema = KALMANSON_CAP_ORDER_CERTIFICATE_SCHEMA
                dynamic_origin = KALMANSON_CAP_ORDER_ORIGIN
                bootstrap_origin = BOOTSTRAP_KALMANSON_CAP_ORDER_ORIGIN
                dynamic_origins = {dynamic_origin}
                bootstrap_origins = {bootstrap_origin}
                expected_stage = KALMANSON_CAP_ORDER_STAGE
            elif certificate["schema"] == SHARED_PAIR_SEPARATION_CERTIFICATE_SCHEMA:
                replayed, _selected, _facts = (
                    _replay_shared_pair_separation_certificate(certificate)
                )
                clause = _clause_for_shared_pair_separation_certificate(
                    encoding, replayed
                )
                current = cap_order_by_schema[
                    SHARED_PAIR_SEPARATION_CERTIFICATE_SCHEMA
                ].get(clause)
                if (
                    current is None
                    or _canonical_bytes(replayed) < _canonical_bytes(current)
                ):
                    cap_order_by_schema[
                        SHARED_PAIR_SEPARATION_CERTIFICATE_SCHEMA
                    ][clause] = replayed
                schema = SHARED_PAIR_SEPARATION_CERTIFICATE_SCHEMA
                dynamic_origin = SHARED_PAIR_SEPARATION_ORIGIN
                bootstrap_origin = BOOTSTRAP_SHARED_PAIR_SEPARATION_ORIGIN
                dynamic_origins = {dynamic_origin}
                bootstrap_origins = {bootstrap_origin}
                expected_stage = SHARED_PAIR_SEPARATION_STAGE
            else:
                raise StructuralCegarError(
                    f"unknown certificate schema {certificate.get('schema')!r}"
                )
            if schema != "structural-row-certificate":
                if clause in source_cap_order_clauses[schema]:
                    raise StructuralCegarError(
                        "duplicate source cap-order learned clause"
                    )
                source_cap_order_clauses[schema].add(clause)
                if record.get("superseded_nogood_sha256") != []:
                    raise StructuralCegarError(
                        "cap-order source supersession list mismatch"
                    )
            if (
                record.get("origin")
                not in dynamic_origins | bootstrap_origins
                or record.get("stage") != expected_stage
                or record.get("clause") != list(clause)
                or record.get("clause_sha256")
                != _sha256_value(list(clause))
            ):
                raise StructuralCegarError(
                    "learned-record certificate linkage mismatch"
                )
            if record["origin"] in bootstrap_origins:
                if (
                    record.get("raw_sat_index") is not None
                    or record.get("assignment_sha256") is not None
                    or record.get("semantic_assignment") is not None
                ):
                    raise StructuralCegarError(
                        "bootstrapped learned-record assignment mismatch"
                    )
            else:
                raw_sat_index = record.get("raw_sat_index")
                if (
                    isinstance(raw_sat_index, bool)
                    or not isinstance(raw_sat_index, int)
                    or raw_sat_index < 0
                ):
                    raise StructuralCegarError(
                        "solver learned-record raw SAT index mismatch"
                    )
                assignment = encoding.assignment_from_record(record)
                obj = encoding.decode(assignment)
                encoding.validate(obj, assignment)
                rows = _metric_rows(obj)
                if schema == "structural-row-certificate":
                    found = _detection(rows)
                    if found is None:
                        raise StructuralCegarError(
                            "solver certificate replay became non-detected"
                        )
                    regenerated, regenerated_rows = _certificate(rows, found)
                    if regenerated != replayed or regenerated_rows != selected:
                        raise StructuralCegarError(
                            "solver certificate replay drift"
                        )
                    _clause_for_structural_certificate(
                        encoding, replayed, selected, assignment
                    )
                elif schema == CAP_ORDER_CERTIFICATE_SCHEMA:
                    regenerated_result = _cap_order_certificate(obj, rows)
                    if (
                        regenerated_result is None
                        or regenerated_result[0] != replayed
                    ):
                        raise StructuralCegarError(
                            "cap-order certificate replay drift"
                        )
                    _clause_for_cap_order_certificate(
                        encoding, replayed, assignment
                    )
                elif schema == RHOMBUS_CAP_ORDER_CERTIFICATE_SCHEMA:
                    regenerated_result = _rhombus_cap_order_certificate(
                        obj, rows
                    )
                    if (
                        regenerated_result is None
                        or regenerated_result[0] != replayed
                    ):
                        raise StructuralCegarError(
                            "rhombus cap-order certificate replay drift"
                        )
                    _clause_for_rhombus_cap_order_certificate(
                        encoding, replayed, assignment
                    )
                elif schema == SHARED_PAIR_SEPARATION_CERTIFICATE_SCHEMA:
                    regenerated_result = _shared_pair_separation_certificate(
                        encoding, assignment, obj, rows
                    )
                    if (
                        regenerated_result is None
                        or regenerated_result[0] != replayed
                    ):
                        raise StructuralCegarError(
                            "shared-pair certificate replay drift"
                        )
                    _clause_for_shared_pair_separation_certificate(
                        encoding, replayed, assignment
                    )
                else:
                    regenerated_result = _kalmanson_cap_order_certificate(
                        obj, rows
                    )
                    if (
                        regenerated_result is None
                        or regenerated_result[0] != replayed
                    ):
                        raise StructuralCegarError(
                            "Kalmanson cap-order certificate replay drift"
                        )
                    _clause_for_kalmanson_cap_order_certificate(
                        encoding, replayed, assignment
                    )
                if record.get("assignment_sha256") != _assignment_hash(
                    encoding, assignment
                ):
                    raise StructuralCegarError(
                        "solver learned-record assignment hash mismatch"
                    )
        except StructuralCegarError as exc:
            raise StructuralCegarError(
                f"{where} certificate failed replay: {exc}"
            ) from exc
        stages[str(certificate["stage"])] += 1
        schemas[schema] += 1
    structural_row_kept, structural_row_cover = (
        certificates._subsumption_minimize(structural_by_key)
    )
    structural_by_clause: dict[
        tuple[int, ...], tuple[Any, dict[str, Any]]
    ] = {}
    for key in structural_row_kept:
        certificate = structural_by_key[key]
        selected = tuple(
            metric.MetricRow(center, support, exact)
            for center, support, exact in key
        )
        clause = _clause_for_structural_certificate(
            encoding, certificate, selected
        )
        candidate = (key, certificate)
        current = structural_by_clause.get(clause)
        if current is None or (
            _canonical_bytes(candidate[1]),
            candidate[0],
        ) < (
            _canonical_bytes(current[1]),
            current[0],
        ):
            structural_by_clause[clause] = candidate
    structural_clause_kept, _structural_clause_cover = (
        _clause_subsumption_minimize(structural_by_clause)
    )
    cap_order_kept: dict[str, list[tuple[int, ...]]] = {}
    cap_order_cover: dict[
        str, dict[tuple[int, ...], tuple[int, ...]]
    ] = {}
    for schema, by_clause in cap_order_by_schema.items():
        kept: list[tuple[int, ...]] = []
        cover: dict[tuple[int, ...], tuple[int, ...]] = {}
        for clause in sorted(by_clause, key=lambda item: (len(item), item)):
            clause_set = frozenset(clause)
            matched = next(
                (
                    existing
                    for existing in kept
                    if frozenset(existing) <= clause_set
                ),
                None,
            )
            if matched is None:
                kept.append(clause)
                cover[clause] = clause
            else:
                cover[clause] = matched
        cap_order_kept[schema] = kept
        cap_order_cover[schema] = cover
    learned: list[dict[str, Any]] = []
    previous: str | None = None
    for clause in structural_clause_kept:
        _key, certificate = structural_by_clause[clause]
        record = _with_record_hash(
            {
                "schema": _learned_schema(encoding),
                "index": len(learned),
                "origin": BOOTSTRAP_STRUCTURAL_PATH_ORIGIN,
                "raw_sat_index": None,
                "assignment_sha256": None,
                "semantic_assignment": None,
                "stage": certificate["stage"],
                "certificate": certificate,
                "clause": list(clause),
                "clause_sha256": _sha256_value(list(clause)),
                "superseded_nogood_sha256": [],
            },
            previous,
        )
        previous = record["record_sha256"]
        learned.append(record)
    cap_order_metadata = {
        CAP_ORDER_CERTIFICATE_SCHEMA: (
            BOOTSTRAP_CAP_ORDER_ORIGIN,
            CAP_ORDER_STAGE,
        ),
        RHOMBUS_CAP_ORDER_CERTIFICATE_SCHEMA: (
            BOOTSTRAP_RHOMBUS_CAP_ORDER_ORIGIN,
            RHOMBUS_CAP_ORDER_STAGE,
        ),
        KALMANSON_CAP_ORDER_CERTIFICATE_SCHEMA: (
            BOOTSTRAP_KALMANSON_CAP_ORDER_ORIGIN,
            KALMANSON_CAP_ORDER_STAGE,
        ),
        SHARED_PAIR_SEPARATION_CERTIFICATE_SCHEMA: (
            BOOTSTRAP_SHARED_PAIR_SEPARATION_ORIGIN,
            SHARED_PAIR_SEPARATION_STAGE,
        ),
    }
    for schema in (
        CAP_ORDER_CERTIFICATE_SCHEMA,
        RHOMBUS_CAP_ORDER_CERTIFICATE_SCHEMA,
        KALMANSON_CAP_ORDER_CERTIFICATE_SCHEMA,
        SHARED_PAIR_SEPARATION_CERTIFICATE_SCHEMA,
    ):
        origin, stage = cap_order_metadata[schema]
        for clause in cap_order_kept[schema]:
            certificate = cap_order_by_schema[schema][clause]
            record = _with_record_hash(
                {
                    "schema": _learned_schema(encoding),
                    "index": len(learned),
                    "origin": origin,
                    "raw_sat_index": None,
                    "assignment_sha256": None,
                    "semantic_assignment": None,
                    "stage": stage,
                    "certificate": certificate,
                    "clause": list(clause),
                    "clause_sha256": _sha256_value(list(clause)),
                    "superseded_nogood_sha256": [],
                },
                previous,
            )
            previous = record["record_sha256"]
            learned.append(record)
    five_point_source_count = len(
        cap_order_by_schema[CAP_ORDER_CERTIFICATE_SCHEMA]
    )
    rhombus_source_count = len(
        cap_order_by_schema[RHOMBUS_CAP_ORDER_CERTIFICATE_SCHEMA]
    )
    kalmanson_source_count = len(
        cap_order_by_schema[KALMANSON_CAP_ORDER_CERTIFICATE_SCHEMA]
    )
    shared_pair_separation_source_count = len(
        cap_order_by_schema[SHARED_PAIR_SEPARATION_CERTIFICATE_SCHEMA]
    )
    cap_order_source_count = (
        five_point_source_count
        + rhombus_source_count
        + kalmanson_source_count
        + shared_pair_separation_source_count
    )
    five_point_kept_count = len(
        cap_order_kept[CAP_ORDER_CERTIFICATE_SCHEMA]
    )
    rhombus_kept_count = len(
        cap_order_kept[RHOMBUS_CAP_ORDER_CERTIFICATE_SCHEMA]
    )
    kalmanson_kept_count = len(
        cap_order_kept[KALMANSON_CAP_ORDER_CERTIFICATE_SCHEMA]
    )
    shared_pair_separation_kept_count = len(
        cap_order_kept[SHARED_PAIR_SEPARATION_CERTIFICATE_SCHEMA]
    )
    cap_order_kept_count = (
        five_point_kept_count
        + rhombus_kept_count
        + kalmanson_kept_count
        + shared_pair_separation_kept_count
    )
    cap_order_covered_count = sum(
        len(cover) for cover in cap_order_cover.values()
    )
    source_unique_count = len(structural_by_key) + cap_order_source_count
    kept_count = len(structural_clause_kept) + cap_order_kept_count
    summary = {
        "source_record_count": len(raw),
        "source_unique_certificate_count": source_unique_count,
        "source_stage_histogram": dict(sorted(stages.items())),
        "source_certificate_schema_histogram": dict(sorted(schemas.items())),
        "source_structural_unique_certificate_count": len(structural_by_key),
        "source_cap_order_unique_certificate_count": cap_order_source_count,
        "source_five_point_cap_order_unique_certificate_count": (
            five_point_source_count
        ),
        "source_rhombus_cap_order_unique_certificate_count": (
            rhombus_source_count
        ),
        "source_kalmanson_cap_order_unique_certificate_count": (
            kalmanson_source_count
        ),
        "source_shared_pair_separation_unique_certificate_count": (
            shared_pair_separation_source_count
        ),
        "kept_antichain_count": kept_count,
        "kept_structural_antichain_count": len(structural_clause_kept),
        "kept_structural_row_antichain_count": len(structural_row_kept),
        "structural_projected_unique_clause_count": len(structural_by_clause),
        "structural_projected_duplicate_clause_count": (
            len(structural_row_kept) - len(structural_by_clause)
        ),
        "structural_projected_subsumed_clause_count": (
            len(structural_by_clause) - len(structural_clause_kept)
        ),
        "kept_cap_order_antichain_count": cap_order_kept_count,
        "kept_five_point_cap_order_antichain_count": five_point_kept_count,
        "kept_rhombus_cap_order_antichain_count": rhombus_kept_count,
        "kept_kalmanson_cap_order_antichain_count": kalmanson_kept_count,
        "kept_shared_pair_separation_antichain_count": (
            shared_pair_separation_kept_count
        ),
        "covered_certificate_count": (
            len(structural_row_cover) + cap_order_covered_count
        ),
        "subsumed_certificate_count": source_unique_count - kept_count,
    }
    return learned, summary


def _load_learned(
    path: Path,
    encoding: Any,
    algebraic_templates: Sequence[Mapping[str, Any]] = (),
    shard_literals: Sequence[int] = (),
) -> tuple[list[dict[str, Any]], Any, list[tuple[int, ...]]]:
    records = _strict_json_lines(path)
    bank = certificates._NogoodBank()
    clauses: list[tuple[int, ...]] = []
    cap_order_clauses: dict[str, set[tuple[int, ...]]] = {
        CAP_ORDER_CERTIFICATE_SCHEMA: set(),
        RHOMBUS_CAP_ORDER_CERTIFICATE_SCHEMA: set(),
        KALMANSON_CAP_ORDER_CERTIFICATE_SCHEMA: set(),
        SHARED_PAIR_SEPARATION_CERTIFICATE_SCHEMA: set(),
    }
    previous: str | None = None
    for index, record in enumerate(records):
        where = f"{path}:{index + 1}"
        _validate_record_hash(record, previous, where=where)
        previous = record["record_sha256"]
        if (
            record.get("schema") != _learned_schema(encoding)
            or record.get("index") != index
        ):
            raise StructuralCegarError(f"{where}: learned record identity mismatch")
        if record.get("origin") in {
            CAP_ORDER_ORIGIN,
            BOOTSTRAP_CAP_ORDER_ORIGIN,
            RHOMBUS_CAP_ORDER_ORIGIN,
            BOOTSTRAP_RHOMBUS_CAP_ORDER_ORIGIN,
            KALMANSON_CAP_ORDER_ORIGIN,
            BOOTSTRAP_KALMANSON_CAP_ORDER_ORIGIN,
            SHARED_PAIR_SEPARATION_ORIGIN,
            BOOTSTRAP_SHARED_PAIR_SEPARATION_ORIGIN,
        }:
            is_rhombus = record["origin"] in {
                RHOMBUS_CAP_ORDER_ORIGIN,
                BOOTSTRAP_RHOMBUS_CAP_ORDER_ORIGIN,
            }
            is_kalmanson = record["origin"] in {
                KALMANSON_CAP_ORDER_ORIGIN,
                BOOTSTRAP_KALMANSON_CAP_ORDER_ORIGIN,
            }
            is_bootstrap = record["origin"] in {
                BOOTSTRAP_CAP_ORDER_ORIGIN,
                BOOTSTRAP_RHOMBUS_CAP_ORDER_ORIGIN,
                BOOTSTRAP_KALMANSON_CAP_ORDER_ORIGIN,
                BOOTSTRAP_SHARED_PAIR_SEPARATION_ORIGIN,
            }
            is_shared_pair = record["origin"] in {
                SHARED_PAIR_SEPARATION_ORIGIN,
                BOOTSTRAP_SHARED_PAIR_SEPARATION_ORIGIN,
            }
            if is_shared_pair:
                schema = SHARED_PAIR_SEPARATION_CERTIFICATE_SCHEMA
                stage = SHARED_PAIR_SEPARATION_STAGE
                certificate, _selected, _facts = (
                    _replay_shared_pair_separation_certificate(
                        record.get("certificate")
                    )
                )
                clause = _clause_for_shared_pair_separation_certificate(
                    encoding, certificate
                )
            elif is_kalmanson:
                schema = KALMANSON_CAP_ORDER_CERTIFICATE_SCHEMA
                stage = KALMANSON_CAP_ORDER_STAGE
                certificate, _selected, _facts = (
                    _replay_kalmanson_cap_order_certificate(
                        record.get("certificate")
                    )
                )
                clause = _clause_for_kalmanson_cap_order_certificate(
                    encoding, certificate
                )
            elif is_rhombus:
                schema = RHOMBUS_CAP_ORDER_CERTIFICATE_SCHEMA
                stage = RHOMBUS_CAP_ORDER_STAGE
                certificate, _selected, _facts = (
                    _replay_rhombus_cap_order_certificate(
                        record.get("certificate")
                    )
                )
                clause = _clause_for_rhombus_cap_order_certificate(
                    encoding, certificate
                )
            else:
                schema = CAP_ORDER_CERTIFICATE_SCHEMA
                stage = CAP_ORDER_STAGE
                certificate, _selected, _facts = (
                    _replay_cap_order_certificate(record.get("certificate"))
                )
                clause = _clause_for_cap_order_certificate(
                    encoding, certificate
                )
            if clause in cap_order_clauses[schema]:
                raise StructuralCegarError(
                    f"{where}: duplicate cap-order learned clause"
                )
            if (
                record.get("stage") != stage
                or record.get("clause") != list(clause)
                or record.get("clause_sha256") != _sha256_value(list(clause))
                or record.get("superseded_nogood_sha256") != []
            ):
                raise StructuralCegarError(
                    f"{where}: cap-order learned metadata mismatch"
                )
            if is_bootstrap:
                if (
                    record.get("raw_sat_index") is not None
                    or record.get("semantic_assignment") is not None
                    or record.get("assignment_sha256") is not None
                ):
                    raise StructuralCegarError(
                        f"{where}: bootstrapped cap-order assignment mismatch"
                    )
                cap_order_clauses[schema].add(clause)
                clauses.append(clause)
                continue
            assignment = encoding.assignment_from_record(record)
            _validate_shard_assignment(
                assignment, shard_literals, where=where
            )
            obj = encoding.decode(assignment)
            encoding.validate(obj, assignment)
            rows = _metric_rows(obj)
            if is_shared_pair:
                regenerated = _shared_pair_separation_certificate(
                    encoding, assignment, obj, rows
                )
            elif is_kalmanson:
                regenerated = _kalmanson_cap_order_certificate(obj, rows)
            elif is_rhombus:
                regenerated = _rhombus_cap_order_certificate(obj, rows)
            else:
                regenerated = _cap_order_certificate(obj, rows)
            if regenerated is None or regenerated[0] != certificate:
                raise StructuralCegarError(
                    f"{where}: cap-order certificate replay drift"
                )
            if is_shared_pair:
                _clause_for_shared_pair_separation_certificate(
                    encoding, certificate, assignment
                )
            elif is_kalmanson:
                _clause_for_kalmanson_cap_order_certificate(
                    encoding, certificate, assignment
                )
            elif is_rhombus:
                _clause_for_rhombus_cap_order_certificate(
                    encoding, certificate, assignment
                )
            else:
                _clause_for_cap_order_certificate(
                    encoding, certificate, assignment
                )
            if record.get("assignment_sha256") != _assignment_hash(
                encoding, assignment
            ):
                raise StructuralCegarError(
                    f"{where}: cap-order assignment hash mismatch"
                )
            cap_order_clauses[schema].add(clause)
            clauses.append(clause)
            continue
        if record.get("origin") in {
            ALGEBRAIC_ORIGIN,
            REAL_DISTINCTNESS_ORIGIN,
            EQUILATERAL_SHELL_ORIGIN,
        }:
            by_hash = {
                template.get("template_sha256"): template
                for template in algebraic_templates
            }
            template = by_hash.get(record.get("algebraic_template_sha256"))
            if template is None or len(by_hash) != len(algebraic_templates):
                raise StructuralCegarError(
                    f"{where}: algebraic template hash is absent or ambiguous"
                )
            if (
                record.get("origin") != template.get("origin")
                or record.get("stage") != template.get("stage")
                or record.get("certificate_kind")
                != template.get("certificate_kind")
                or record.get("certificate") is not None
                or record.get("algebraic_template_name") != template.get("name")
                or record.get("superseded_nogood_sha256") != []
            ):
                raise StructuralCegarError(
                    f"{where}: typed algebraic learned metadata mismatch"
                )
            permutation = _validate_permutation(record.get("permutation"))
            mapped = _mapped_memberships(template, permutation)
            if record.get("antecedent_memberships") != [
                list(pair) for pair in mapped
            ]:
                raise StructuralCegarError(
                    f"{where}: algebraic mapped antecedent mismatch"
                )
            clause = _clause_for_memberships(encoding, mapped)
            if (
                record.get("clause") != list(clause)
                or record.get("clause_sha256") != _sha256_value(list(clause))
            ):
                raise StructuralCegarError(
                    f"{where}: algebraic learned clause mismatch"
                )
            assignment = encoding.assignment_from_record(record)
            _validate_shard_assignment(
                assignment, shard_literals, where=where
            )
            obj = encoding.decode(assignment)
            encoding.validate(obj, assignment)
            replayed_match = _find_algebraic_match(
                encoding, assignment, algebraic_templates
            )
            if replayed_match is None:
                raise StructuralCegarError(
                    f"{where}: algebraic template no longer matches"
                )
            replayed_template, replayed_permutation, replayed_mapped = replayed_match
            if (
                replayed_template.get("template_sha256")
                != template.get("template_sha256")
                or replayed_permutation != permutation
                or replayed_mapped != mapped
            ):
                raise StructuralCegarError(
                    f"{where}: deterministic algebraic match replay drift"
                )
            _clause_for_memberships(encoding, mapped, assignment)
            if record.get("assignment_sha256") != _assignment_hash(
                encoding, assignment
            ):
                raise StructuralCegarError(
                    f"{where}: algebraic assignment hash mismatch"
                )
            clauses.append(clause)
            continue
        certificate, selected = _replay_certificate_json(
            record.get("certificate")
        )
        origin = record.get("origin")
        if origin in {"solver", "bootstrap-structural-prefix"}:
            clause = _clause_for_rows(encoding, selected)
        elif origin in {
            STRUCTURAL_PATH_ORIGIN,
            BOOTSTRAP_STRUCTURAL_PATH_ORIGIN,
        }:
            clause = _clause_for_structural_certificate(
                encoding, certificate, selected
            )
        else:
            raise StructuralCegarError(f"{where}: invalid learned origin")
        if (
            record.get("stage") != certificate["stage"]
            or record.get("clause") != list(clause)
            or record.get("clause_sha256")
            != _sha256_value(list(clause))
        ):
            raise StructuralCegarError(f"{where}: learned clause mismatch")
        if origin in {"solver", STRUCTURAL_PATH_ORIGIN}:
            assignment = encoding.assignment_from_record(record)
            _validate_shard_assignment(
                assignment, shard_literals, where=where
            )
            obj = encoding.decode(assignment)
            encoding.validate(obj, assignment)
            rows = _metric_rows(obj)
            found = _detection(rows)
            if found is None:
                raise StructuralCegarError(f"{where}: replay became non-detected")
            replayed, replayed_rows = _certificate(rows, found)
            if replayed != certificate or replayed_rows != selected:
                raise StructuralCegarError(f"{where}: solver certificate replay drift")
            _clause_for_structural_certificate(
                encoding, certificate, selected, assignment
            )
            _clause_false(clause, assignment)
            if record.get("assignment_sha256") != _assignment_hash(
                encoding, assignment
            ):
                raise StructuralCegarError(f"{where}: assignment hash mismatch")
        elif (
            origin
            not in {
                "bootstrap-structural-prefix",
                BOOTSTRAP_STRUCTURAL_PATH_ORIGIN,
            }
            or record.get("semantic_assignment") is not None
            or record.get("assignment_sha256") is not None
        ):
            raise StructuralCegarError(f"{where}: invalid learned origin")
        key = certificates._rows_key(selected)
        _matched, superseded, added = bank.add(key, certificate)
        if not added:
            raise StructuralCegarError(f"{where}: learned certificate was redundant")
        expected_superseded = sorted(
            certificates._nogood_sha256(old) for old in superseded
        )
        if record.get("superseded_nogood_sha256") != expected_superseded:
            raise StructuralCegarError(f"{where}: supersession list mismatch")
        clauses.append(clause)
    return records, bank, clauses


def _load_survivors(
    path: Path,
    encoding: Any,
    shard_literals: Sequence[int] = (),
) -> tuple[list[dict[str, Any]], list[tuple[int, ...]]]:
    records = _strict_json_lines(path)
    clauses: list[tuple[int, ...]] = []
    previous: str | None = None
    for index, record in enumerate(records):
        where = f"{path}:{index + 1}"
        _validate_record_hash(record, previous, where=where)
        previous = record["record_sha256"]
        if (
            record.get("schema") != _survivor_schema(encoding)
            or record.get("index") != index
        ):
            raise StructuralCegarError(f"{where}: survivor identity mismatch")
        assignment = encoding.assignment_from_record(record)
        _validate_shard_assignment(assignment, shard_literals, where=where)
        obj = encoding.decode(assignment)
        encoding.validate(obj, assignment)
        rows = _metric_rows(obj)
        if _detection(rows) is not None:
            raise StructuralCegarError(f"{where}: survivor is now structurally detected")
        block = encoding.blocking_clause(assignment)
        if record.get("blocking_clause") != list(block):
            raise StructuralCegarError(f"{where}: survivor block mismatch")
        if record.get("assignment_sha256") != _assignment_hash(
            encoding, assignment
        ):
            raise StructuralCegarError(f"{where}: survivor assignment hash mismatch")
        clauses.append(block)
    return records, clauses


def _load_logs(path: Path) -> list[dict[str, Any]]:
    records = _strict_json_lines(path)
    previous: str | None = None
    for index, record in enumerate(records):
        where = f"{path}:{index + 1}"
        _validate_record_hash(record, previous, where=where)
        previous = record["record_sha256"]
        if record.get("schema") != LOG_SCHEMA or record.get("attempt") != index:
            raise StructuralCegarError(f"{where}: solver log identity mismatch")
    return records


def _validate_stale_recheck_evidence(
    encoding: Any,
    assignment: Mapping[int, bool],
    evidence: Mapping[str, Any],
    *,
    learned: Sequence[Mapping[str, Any]],
    survivor_clauses: Sequence[Sequence[int]],
) -> None:
    kind = evidence.get("kind")
    if kind == "active-structural-antichain":
        claimed = evidence.get("nogood_sha256")
        candidates = {
            record["certificate"]["nogood_sha256"]: record
            for record in learned
            if record["origin"]
            in {
                "bootstrap-structural-prefix",
                BOOTSTRAP_STRUCTURAL_PATH_ORIGIN,
                "solver",
                STRUCTURAL_PATH_ORIGIN,
            }
        }
        matched = candidates.get(claimed)
        if matched is None or _clause_satisfied(matched["clause"], assignment):
            raise StructuralCegarError(
                "stale antichain evidence does not block the assignment"
            )
        return
    if kind == "current-learned-clause":
        matched = next(
            (
                record
                for record in learned
                if record["record_sha256"] == evidence.get("record_sha256")
            ),
            None,
        )
        if matched is None or _clause_satisfied(matched["clause"], assignment):
            raise StructuralCegarError(
                "stale learned-clause evidence does not block the assignment"
            )
        return
    if kind == "current-survivor-block":
        index = evidence.get("survivor_index")
        if (
            type(index) is not int
            or not 0 <= index < len(survivor_clauses)
            or _clause_satisfied(survivor_clauses[index], assignment)
        ):
            raise StructuralCegarError(
                "stale survivor evidence does not block the assignment"
            )
        return
    raise StructuralCegarError("stale result has invalid recheck evidence")


def _load_cube_batches(
    path: Path,
    out: Path,
    encoding: Any,
    *,
    depth: int,
    artifact_mode: str,
    base_cnf_sha256: str,
    learned: Sequence[Mapping[str, Any]],
    learned_clauses: Sequence[Sequence[int]],
    survivors: Sequence[Mapping[str, Any]],
    survivor_clauses: Sequence[Sequence[int]],
    logs: Sequence[Mapping[str, Any]],
) -> list[dict[str, Any]]:
    records = _strict_json_lines(path)
    previous: str | None = None
    batch_root = out / "cube-batches"
    expected_directories: set[str] = set()
    allowed_dispositions = {
        "committed",
        "stale-current-antichain",
        "cube-unsat-unverified",
        "solver-unknown",
        "solver-exception",
        "coordinator-certificate-failure",
        "unprocessed-after-failure",
        "unprocessed-after-limit",
    }
    expected_learned_count = sum(
        record["origin"]
        in {
            "bootstrap-structural-prefix",
            BOOTSTRAP_STRUCTURAL_PATH_ORIGIN,
            BOOTSTRAP_CAP_ORDER_ORIGIN,
            BOOTSTRAP_RHOMBUS_CAP_ORDER_ORIGIN,
            BOOTSTRAP_KALMANSON_CAP_ORDER_ORIGIN,
            BOOTSTRAP_SHARED_PAIR_SEPARATION_ORIGIN,
        }
        for record in learned
    )
    expected_survivor_count = 0
    expected_log_count = 0
    expected_raw_sat_index = 0
    for batch_index, record in enumerate(records):
        where = f"{path}:{batch_index + 1}"
        _validate_record_hash(record, previous, where=where)
        previous = record["record_sha256"]
        if (
            record.get("schema") != CUBE_BATCH_SCHEMA
            or record.get("batch_index") != batch_index
            or record.get("cube_artifact_mode") != artifact_mode
        ):
            raise StructuralCegarError(f"{where}: cube batch identity mismatch")
        directory_name = f"batch-{batch_index:06d}"
        if record.get("directory") != f"cube-batches/{directory_name}":
            raise StructuralCegarError(f"{where}: cube batch directory mismatch")
        expected_directories.add(directory_name)
        directory = batch_root / directory_name
        plan_path = directory / "plan.json"
        results_path = directory / "results.jsonl"
        plan = _strict_json(plan_path)
        snapshot_obj = plan.get("snapshot")
        if not isinstance(snapshot_obj, dict):
            raise StructuralCegarError(f"{plan_path}: snapshot is not an object")
        learned_count = snapshot_obj.get("learned_count")
        survivor_count = snapshot_obj.get("survivor_count")
        log_count = snapshot_obj.get("solver_log_count")
        if (
            type(learned_count) is not int
            or type(survivor_count) is not int
            or type(log_count) is not int
            or not 0 <= learned_count <= len(learned)
            or not 0 <= survivor_count <= len(survivors)
            or not 0 <= log_count <= len(logs)
            or learned_count != expected_learned_count
            or survivor_count != expected_survivor_count
            or log_count != expected_log_count
        ):
            raise StructuralCegarError(f"{plan_path}: invalid snapshot counts")
        snapshot_clauses = [
            *learned_clauses[:learned_count],
            *survivor_clauses[:survivor_count],
        ]
        common_clause_body, common_clause_count = _cube_common_clause_body(
            encoding, snapshot_clauses
        )
        snapshot = _cube_snapshot(
            encoding,
            extra_clauses=snapshot_clauses,
            learned=learned[:learned_count],
            survivors=survivors[:survivor_count],
            logs=logs[:log_count],
            common_clause_body=common_clause_body,
            common_clause_count=common_clause_count,
            base_cnf_sha256=base_cnf_sha256,
        )
        _validate_cube_plan(
            plan,
            encoding,
            depth=depth,
            batch_index=batch_index,
            snapshot=snapshot,
        )
        if record.get("plan_sha256") != plan["plan_sha256"]:
            raise StructuralCegarError(f"{where}: cube plan hash mismatch")
        results = _strict_json_lines(results_path)
        result_previous: str | None = None
        dispositions: Counter[str] = Counter()
        committed: list[str] = []
        expected_files = {"plan.json", "results.jsonl"}
        cubes = _cube_partition(encoding, depth)
        if len(results) != len(cubes):
            raise StructuralCegarError(f"{results_path}: incomplete cube results")
        for cube_index, result in enumerate(results):
            result_where = f"{results_path}:{cube_index + 1}"
            _validate_record_hash(
                result, result_previous, where=result_where
            )
            result_previous = result["record_sha256"]
            cube = cubes[cube_index]
            cube_spec = plan["cubes"][cube_index]
            if (
                result.get("schema") != CUBE_RESULT_SCHEMA
                or result.get("batch_index") != batch_index
                or result.get("cube_index") != cube_index
                or result.get("cube_artifact_mode") != artifact_mode
                or result.get("plan_sha256") != plan["plan_sha256"]
                or result.get("cube_sha256") != cube_spec["cube_sha256"]
                or result.get("cube_literals") != list(cube)
            ):
                raise StructuralCegarError(
                    f"{result_where}: cube result identity mismatch"
                )
            disposition = result.get("disposition")
            if disposition not in allowed_dispositions:
                raise StructuralCegarError(
                    f"{result_where}: invalid cube disposition"
                )
            dispositions[str(disposition)] += 1
            cube_cnf_chunks = _cube_cnf_chunks(
                encoding, common_clause_body, common_clause_count, cube
            )
            cube_cnf_sha256 = _sha256_chunks(cube_cnf_chunks)
            cube_path = directory / f"cube-{cube_index:06d}.cnf"
            if result.get("cnf_sha256") != cube_cnf_sha256:
                raise StructuralCegarError(
                    f"{result_where}: cube CNF replay mismatch"
                )
            if artifact_mode == "full":
                expected_files.add(cube_path.name)
                if (
                    not cube_path.is_file()
                    or _sha256_file(cube_path) != cube_cnf_sha256
                ):
                    raise StructuralCegarError(
                        f"{result_where}: cube CNF artifact mismatch"
                    )
            elif cube_path.exists():
                raise StructuralCegarError(
                    f"{result_where}: compact cube CNF was unexpectedly retained"
                )
            attempt = result.get("solver_log_attempt")
            if (
                type(attempt) is not int
                or attempt != log_count + cube_index
                or not 0 <= attempt < len(logs)
            ):
                raise StructuralCegarError(
                    f"{result_where}: solver log reference mismatch"
                )
            log = logs[attempt]
            if (
                result.get("solver_log_record_sha256")
                != log["record_sha256"]
                or log.get("cube_batch_index") != batch_index
                or log.get("cube_index") != cube_index
                or log.get("cube_plan_sha256") != plan["plan_sha256"]
                or log.get("cnf_sha256") != result.get("cnf_sha256")
            ):
                raise StructuralCegarError(
                    f"{result_where}: solver log replay mismatch"
                )
            semantic = result.get("semantic_assignment")
            assignment: Mapping[int, bool] | None = None
            if log["verdict"] == "SAT":
                assignment = encoding.assignment_from_record(
                    {"semantic_assignment": semantic}
                )
                encoding.validate(encoding.decode(assignment), assignment)
                if any(
                    not _clause_satisfied(clause, assignment)
                    for clause in snapshot_clauses
                ):
                    raise StructuralCegarError(
                        f"{result_where}: SAT assignment violates its snapshot"
                    )
                if any(not _literal_true(literal, assignment) for literal in cube):
                    raise StructuralCegarError(
                        f"{result_where}: SAT assignment violates its cube"
                    )
                if result.get("assignment_sha256") != _assignment_hash(
                    encoding, assignment
                ):
                    raise StructuralCegarError(
                        f"{result_where}: SAT assignment hash mismatch"
                    )
            elif semantic is not None or result.get("assignment_sha256") is not None:
                raise StructuralCegarError(
                    f"{result_where}: non-SAT result contains an assignment"
                )
            proof = result.get("proof")
            if proof is not None:
                if artifact_mode != "full":
                    raise StructuralCegarError(
                        f"{result_where}: compact result retains a proof"
                    )
                if not isinstance(proof, dict):
                    raise StructuralCegarError(
                        f"{result_where}: proof metadata is invalid"
                    )
                expected_proof_path = directory / f"cube-{cube_index:06d}.drat"
                proof_path = out / str(proof.get("path"))
                if (
                    log.get("verdict") != "UNSAT"
                    or proof_path != expected_proof_path
                    or proof.get("verification") != "not-run-local-cube-only"
                ):
                    raise StructuralCegarError(
                        f"{result_where}: proof identity mismatch"
                    )
                expected_files.add(proof_path.name)
                if (
                    not proof_path.is_file()
                    or proof.get("size") != proof_path.stat().st_size
                    or proof.get("sha256") != _sha256_file(proof_path)
                ):
                    raise StructuralCegarError(
                        f"{result_where}: proof artifact hash mismatch"
                    )
            committed_sha = result.get("committed_record_sha256")
            if disposition == "committed":
                if not isinstance(committed_sha, str) or assignment is None:
                    raise StructuralCegarError(
                        f"{result_where}: committed record is missing"
                    )
                learned_candidate = (
                    learned[expected_learned_count]
                    if expected_learned_count < len(learned)
                    else None
                )
                survivor_candidate = (
                    survivors[expected_survivor_count]
                    if expected_survivor_count < len(survivors)
                    else None
                )
                if (
                    learned_candidate is not None
                    and learned_candidate["record_sha256"] == committed_sha
                ):
                    committed_record = learned_candidate
                    expected_learned_count += 1
                elif (
                    survivor_candidate is not None
                    and survivor_candidate["record_sha256"] == committed_sha
                ):
                    committed_record = survivor_candidate
                    expected_survivor_count += 1
                else:
                    raise StructuralCegarError(
                        f"{result_where}: commit is not the next live record"
                    )
                if (
                    committed_record["raw_sat_index"]
                    != expected_raw_sat_index
                    or committed_record["assignment_sha256"]
                    != result["assignment_sha256"]
                ):
                    raise StructuralCegarError(
                        f"{result_where}: committed SAT replay mismatch"
                    )
                expected_raw_sat_index += 1
                committed.append(committed_sha)
            elif committed_sha is not None:
                raise StructuralCegarError(
                    f"{result_where}: non-commit names a committed record"
                )
            stale_evidence = result.get("stale_recheck")
            if disposition == "stale-current-antichain":
                if assignment is None or not isinstance(stale_evidence, dict):
                    raise StructuralCegarError(
                        f"{result_where}: stale result lacks SAT evidence"
                    )
                _validate_stale_recheck_evidence(
                    encoding,
                    assignment,
                    stale_evidence,
                    learned=learned[:expected_learned_count],
                    survivor_clauses=survivor_clauses[
                        :expected_survivor_count
                    ],
                )
            elif stale_evidence is not None:
                raise StructuralCegarError(
                    f"{result_where}: non-stale result has stale evidence"
                )
            verdict = log["verdict"]
            if (
                (disposition == "committed" and verdict != "SAT")
                or (
                    disposition == "stale-current-antichain"
                    and verdict != "SAT"
                )
                or (
                    disposition == "cube-unsat-unverified"
                    and verdict != "UNSAT"
                )
                or (disposition == "solver-exception" and verdict != "EXCEPTION")
                or (
                    disposition == "coordinator-certificate-failure"
                    and verdict != "SAT"
                )
            ):
                raise StructuralCegarError(
                    f"{result_where}: disposition/verdict mismatch"
                )
        if (
            record.get("result_count") != len(results)
            or record.get("results_sha256") != _sha256_file(results_path)
            or record.get("result_chain_head_sha256")
            != (results[-1]["record_sha256"] if results else None)
            or record.get("disposition_histogram")
            != dict(sorted(dispositions.items()))
            or record.get("committed_record_sha256") != committed
        ):
            raise StructuralCegarError(f"{where}: cube result summary mismatch")
        actual_files = {item.name for item in directory.iterdir() if item.is_file()}
        if actual_files != expected_files:
            raise StructuralCegarError(f"{where}: cube artifact journal mismatch")
        expected_log_count += len(results)
    actual_directories = (
        {item.name for item in batch_root.iterdir() if item.is_dir()}
        if batch_root.is_dir()
        else set()
    )
    if actual_directories != expected_directories:
        raise StructuralCegarError("cube batch directory journal mismatch")
    if records and (
        expected_learned_count != len(learned)
        or expected_survivor_count != len(survivors)
        or expected_log_count != len(logs)
    ):
        raise StructuralCegarError("cube journal does not cover the live streams")
    return records


def _cube_batch_counts(
    cube_batches: Sequence[Mapping[str, Any]],
) -> Counter[str]:
    counts: Counter[str] = Counter()
    for batch in cube_batches:
        counts["batches"] += 1
        for disposition, count in batch["disposition_histogram"].items():
            counts[str(disposition)] += int(count)
    return counts


def _active_counts(bank: Any) -> Counter[str]:
    return Counter(
        str(certificate["stage"]) for certificate in bank.active.values()
    )


def _artifact_hashes(out: Path) -> dict[str, str]:
    names = (
        "base.cnf",
        "smoke.json",
        "bootstrap.json",
        "learned-certificates.jsonl",
        "survivors.jsonl",
        "solver-logs.jsonl",
        "cube-batches.jsonl",
        "failure.json",
        "terminal.cnf",
        "terminal.drat",
        "terminal.drat.check",
    )
    return {
        name: _sha256_file(out / name)
        for name in names
        if (out / name).is_file()
    }


def _manifest(
    out: Path,
    *,
    configuration: Mapping[str, Any],
    status: str,
    diagnostic: str | None,
    learned: Sequence[Mapping[str, Any]],
    survivors: Sequence[Mapping[str, Any]],
    logs: Sequence[Mapping[str, Any]],
    cube_batches: Sequence[Mapping[str, Any]],
    bank: Any,
    bootstrap_summary: Mapping[str, Any],
    terminal_clause_count: int | None,
    unsat_verified: bool,
) -> dict[str, Any]:
    bootstrap_count = sum(
        record["origin"]
        in {
            "bootstrap-structural-prefix",
            BOOTSTRAP_STRUCTURAL_PATH_ORIGIN,
            BOOTSTRAP_CAP_ORDER_ORIGIN,
            BOOTSTRAP_RHOMBUS_CAP_ORDER_ORIGIN,
            BOOTSTRAP_KALMANSON_CAP_ORDER_ORIGIN,
        }
        for record in learned
    )
    bootstrap_five_point_cap_order_count = sum(
        record["origin"] == BOOTSTRAP_CAP_ORDER_ORIGIN for record in learned
    )
    bootstrap_rhombus_cap_order_count = sum(
        record["origin"] == BOOTSTRAP_RHOMBUS_CAP_ORDER_ORIGIN
        for record in learned
    )
    bootstrap_kalmanson_cap_order_count = sum(
        record["origin"] == BOOTSTRAP_KALMANSON_CAP_ORDER_ORIGIN
        for record in learned
    )
    bootstrap_shared_pair_separation_count = sum(
        record["origin"] == BOOTSTRAP_SHARED_PAIR_SEPARATION_ORIGIN
        for record in learned
    )
    bootstrap_cap_order_count = (
        bootstrap_five_point_cap_order_count
        + bootstrap_rhombus_cap_order_count
        + bootstrap_kalmanson_cap_order_count
        + bootstrap_shared_pair_separation_count
    )
    row_dynamic = [
        record
        for record in learned
        if record["origin"] in {"solver", STRUCTURAL_PATH_ORIGIN}
    ]
    five_point_cap_order_dynamic = [
        record for record in learned if record["origin"] == CAP_ORDER_ORIGIN
    ]
    rhombus_cap_order_dynamic = [
        record
        for record in learned
        if record["origin"] == RHOMBUS_CAP_ORDER_ORIGIN
    ]
    kalmanson_cap_order_dynamic = [
        record
        for record in learned
        if record["origin"] == KALMANSON_CAP_ORDER_ORIGIN
    ]
    shared_pair_separation_dynamic = [
        record
        for record in learned
        if record["origin"] == SHARED_PAIR_SEPARATION_ORIGIN
    ]
    cap_order_dynamic = [
        *five_point_cap_order_dynamic,
        *rhombus_cap_order_dynamic,
        *kalmanson_cap_order_dynamic,
        *shared_pair_separation_dynamic,
    ]
    dynamic = [*row_dynamic, *cap_order_dynamic]
    algebraic_dynamic = [
        record for record in learned if record["origin"] == ALGEBRAIC_ORIGIN
    ]
    real_distinctness_dynamic = [
        record
        for record in learned
        if record["origin"]
        in {REAL_DISTINCTNESS_ORIGIN, EQUILATERAL_SHELL_ORIGIN}
    ]
    equilateral_shell_dynamic = [
        record
        for record in learned
        if record["origin"] == EQUILATERAL_SHELL_ORIGIN
    ]
    classified_learned = [
        *dynamic,
        *algebraic_dynamic,
        *real_distinctness_dynamic,
    ]
    classified_raw_indices = sorted(
        [
            *(int(record["raw_sat_index"]) for record in classified_learned),
            *(int(record["raw_sat_index"]) for record in survivors),
        ]
    )
    if classified_raw_indices != list(range(len(classified_raw_indices))):
        raise StructuralCegarError("raw SAT indices are not a dense prefix")
    raw_sat_count = sum(record["verdict"] == "SAT" for record in logs)
    if raw_sat_count < len(classified_raw_indices):
        raise StructuralCegarError("classified assignments exceed raw SAT verdicts")
    unclassified_raw_sat_count = raw_sat_count - len(classified_raw_indices)
    cube_counts = _cube_batch_counts(cube_batches)
    failure = None
    failure_path = out / "failure.json"
    if failure_path.is_file():
        try:
            failure = json.loads(
                failure_path.read_text(),
                parse_constant=lambda token: (_ for _ in ()).throw(
                    ValueError(f"invalid JSON constant {token}")
                ),
                object_pairs_hook=_object_without_duplicate_keys,
            )
        except (UnicodeDecodeError, json.JSONDecodeError, ValueError) as exc:
            raise StructuralCegarError(
                f"{failure_path}: invalid failure artifact: {exc}"
            ) from exc
        if not isinstance(failure, dict):
            raise StructuralCegarError("failure artifact is not an object")
        failure_unsigned = dict(failure)
        failure_claim = failure_unsigned.pop("failure_sha256", None)
        if failure_claim != _sha256_value(failure_unsigned):
            raise StructuralCegarError("failure artifact hash mismatch")
    stages = Counter(str(record["stage"]) for record in learned)
    dynamic_stages = Counter(str(record["stage"]) for record in dynamic)
    observed_stages = Counter(dynamic_stages)
    if (
        isinstance(failure, dict)
        and isinstance(failure.get("detail"), dict)
        and isinstance(failure["detail"].get("detection_stage"), str)
    ):
        observed_stages[failure["detail"]["detection_stage"]] += 1
    if status == "SHARD_STRUCTURAL_UNSAT_VERIFIED":
        claim = (
            "the exact canonical Boolean shard is structurally UNSAT with a "
            "DRAT-verified terminal proof; this is shard-local and is not a "
            "global Phase-3 non-existence claim"
        )
    elif status == "SHARD_P97_EUCLIDEAN_GAUGE_UNSAT_VERIFIED":
        claim = (
            "the exact canonical Boolean shard is terminally UNSAT after "
            "conditional P97 Euclidean-gauge algebraic cuts, with a "
            "DRAT-verified proof; this is shard-local and not Lean closure"
        )
    elif status == "SHARD_ENUMERATION_COMPLETE_WITH_SURVIVORS":
        claim = (
            "the exact canonical Boolean shard was terminally enumerated with "
            "stored structural survivors; it establishes neither shard UNSAT "
            "nor global Phase-3 non-existence"
        )
    elif status == "STRUCTURAL_UNSAT_VERIFIED":
        claim = (
            "the exact audited Phase-3 CNF is covered by independently replayed "
            "structural row and exhaustive cap-order certificates; terminal "
            "UNSAT is DRAT-verified"
        )
    elif status == "P97_EUCLIDEAN_GAUGE_UNSAT_VERIFIED":
        claim = (
            "terminal DRAT verifies the exact Phase-3 CNF augmented by replayed "
            "structural cuts, dynamically relabeled QQ unit identities, and "
            "typed real-distinctness nogoods from ideal membership and exact "
            "equilateral-shell orientation branches; the shell full equality "
            "ideal remains NONUNIT, and all algebraic cuts are conditional on "
            "the P97 Euclidean distinct-point semantics and are not Lean-kernel "
            "closure"
        )
    elif status == "ENUMERATION_COMPLETE_WITH_SURVIVORS":
        claim = (
            "terminal DRAT verifies coverage by structural cuts plus explicit "
            "full-assignment blocks for stored structurally unresolved survivors"
        )
    else:
        claim = (
            "bounded structural CEGAR checkpoint only; no Euclidean, P97-realizable, "
            "kernel-level, completeness, or non-existence claim"
        )
    unsigned = {
        "schema": configuration.get("artifact_schema", SCHEMA),
        "status": status,
        "diagnostic": diagnostic,
        "configuration": dict(configuration),
        "counts": {
            "bootstrap_learned_core_count": bootstrap_count,
            "bootstrap_cap_order_nogood_count": bootstrap_cap_order_count,
            "bootstrap_five_point_cap_order_nogood_count": (
                bootstrap_five_point_cap_order_count
            ),
            "bootstrap_rhombus_cap_order_nogood_count": (
                bootstrap_rhombus_cap_order_count
            ),
            "bootstrap_kalmanson_cap_order_nogood_count": (
                bootstrap_kalmanson_cap_order_count
            ),
            "bootstrap_shared_pair_separation_nogood_count": (
                bootstrap_shared_pair_separation_count
            ),
            "dynamic_learned_core_count": len(dynamic),
            "dynamic_cap_order_nogood_count": len(cap_order_dynamic),
            "dynamic_five_point_cap_order_nogood_count": len(
                five_point_cap_order_dynamic
            ),
            "dynamic_rhombus_cap_order_nogood_count": len(
                rhombus_cap_order_dynamic
            ),
            "dynamic_kalmanson_cap_order_nogood_count": len(
                kalmanson_cap_order_dynamic
            ),
            "dynamic_shared_pair_separation_nogood_count": len(
                shared_pair_separation_dynamic
            ),
            "dynamic_algebraic_nogood_count": len(algebraic_dynamic),
            "dynamic_real_distinctness_nogood_count": len(
                real_distinctness_dynamic
            ),
            "dynamic_equilateral_shell_nogood_count": len(
                equilateral_shell_dynamic
            ),
            "dynamic_certificate_kind_histogram": dict(
                sorted(
                    Counter(
                        str(record.get("certificate_kind", "STRUCTURAL"))
                        for record in classified_learned
                    ).items()
                )
            ),
            "dynamic_total_nogood_count": len(classified_learned),
            "learned_core_count": len(learned),
            "active_antichain_count": len(bank.active),
            "raw_sat_count": raw_sat_count,
            "classified_raw_sat_count": len(classified_raw_indices),
            "unclassified_raw_sat_count": unclassified_raw_sat_count,
            "structural_survivor_count": len(survivors),
            "solver_attempt_count": len(logs),
            "cube_batch_count": cube_counts["batches"],
            "cube_result_count": sum(
                count
                for disposition, count in cube_counts.items()
                if disposition != "batches"
            ),
            "cube_committed_result_count": cube_counts["committed"],
            "cube_stale_result_count": cube_counts[
                "stale-current-antichain"
            ],
            "cube_local_unsat_unverified_count": cube_counts[
                "cube-unsat-unverified"
            ],
        },
        "stage_histogram": dict(sorted(stages.items())),
        "dynamic_stage_histogram": dict(sorted(dynamic_stages.items())),
        "observed_detector_stage_histogram": dict(sorted(observed_stages.items())),
        "active_stage_histogram": dict(sorted(_active_counts(bank).items())),
        "bootstrap": dict(bootstrap_summary),
        "failure": failure,
        "terminal_clause_count": terminal_clause_count,
        "terminal_drat_verified": unsat_verified,
        "result_claim": claim,
        "trust_boundary": {
            "sat": "CaDiCaL assignment decoded and revalidated by SatEncoding",
            "structural": (
                "current order-independent Python formalized-core detector plus "
                "a checked-path membership clause for duplicate-center cores "
                "or a minimum whole-row clause for other structural cores, "
                "with independent Python replay; "
                "each cap-order certificate retains an exactly minimized subset "
                "of positive f facts, reconstructs every compatible Phase-3 "
                "completion and all 24 source cap_orders without a reflection "
                "quotient, and replays either the cyclic five-point closures or "
                "the convex-rhombus closures in every order; the selected-row "
                "Kalmanson rule additionally binds an exactly minimized union "
                "of complete rows and replays its three direct rows, five roles, "
                "and boundary rotation separately in every order"
            ),
            "algebraic": (
                "saved Singular QQ identities are hash-pinned and independently "
                "replayed with exact SymPy Poly arithmetic; a deterministic "
                "non-induced Fin10 directed-subgraph matcher maps only nonzero-"
                "cofactor generator endpoints. Unit identities establish "
                "equality infeasibility after the P0/P1 similarity gauge, whose "
                "normalization uses the external P97 fact P0 != P1. The "
                "separately typed real-distinctness identity establishes "
                "x9x^2+x9y^2=0 and uses the ordered-real step P9=P0 plus the "
                "external P97 pairwise-distinctness hypothesis; it is not routed "
                "through unit/equality infeasibility. These are not unconditional "
                "order-independent structural contradictions"
            ),
            "lean": (
                "the generic ConvexFivePointCore.false_of_core and "
                "ConvexRhombusCore.false_of_core consumers (and their negative "
                "orientation variants), plus CapCrossingKalmansonBridge."
                "false_of_selected_rows_in_five_ccw_order, are kernel-checked "
                "generic theorems; this Phase-3 certificate format and all concrete "
                "cap-order ingress paths are not kernel-landed"
            ),
            "survivor": (
                "order-independent and exhaustive cap-order detectors returned "
                "none and no unit or real-distinctness algebraic template matched; "
                "this is structurally unresolved only, not Euclidean or "
                "P97-realizable"
            ),
            "parallel": (
                "cube-batch mode is explicit opt-in local scheduling over an "
                "exhaustive deterministic semantic-variable partition; workers "
                "only solve immutable snapshot CNFs, while the coordinator "
                "rechecks SAT assignments against live cuts and alone appends "
                "hash-chained records. Per-cube UNSAT is unverified and never "
                "terminal"
            ),
            "terminal": (
                "UNSAT is terminal only after drat-trim prints exact s VERIFIED"
            ),
        },
        "artifact_hashes": _artifact_hashes(out),
    }
    return {**unsigned, "manifest_sha256": _sha256_value(unsigned)}


def _classification_count_cache(
    learned: Sequence[Mapping[str, Any]],
    survivors: Sequence[Mapping[str, Any]],
) -> tuple[int, int]:
    dynamic = [
        record
        for record in learned
        if record.get("origin") in DYNAMIC_CLASSIFIED_ORIGINS
    ]
    raw_indices: list[int] = []
    for record in (*dynamic, *survivors):
        raw_sat_index = record.get("raw_sat_index")
        if type(raw_sat_index) is not int or raw_sat_index < 0:
            raise StructuralCegarError(
                "cached classification raw SAT index is invalid"
            )
        raw_indices.append(raw_sat_index)
    if sorted(raw_indices) != list(range(len(raw_indices))):
        raise StructuralCegarError(
            "cached classification raw SAT indices are not a dense prefix"
        )
    return len(dynamic), len(raw_indices)


def _committed_classification_delta(
    learned: Sequence[Mapping[str, Any]],
    survivors: Sequence[Mapping[str, Any]],
    *,
    learned_before: int,
    survivors_before: int,
) -> tuple[int, int]:
    learned_delta = len(learned) - learned_before
    survivor_delta = len(survivors) - survivors_before
    if (learned_delta, survivor_delta) not in {(1, 0), (0, 1)}:
        raise StructuralCegarError(
            "successful classification did not commit exactly one committed "
            "outcome (learned xor survivor)"
        )
    if (
        learned_delta == 1
        and learned[-1].get("origin") not in DYNAMIC_CLASSIFIED_ORIGINS
    ):
        raise StructuralCegarError(
            "successful classification committed an invalid learned origin"
        )
    return learned_delta, 1


def _validate_manifest_count_cache(
    manifest: Mapping[str, Any],
    *,
    dynamic_learned_count: int,
    raw_count: int,
) -> None:
    counts = manifest.get("counts")
    if not isinstance(counts, Mapping):
        raise StructuralCegarError("manifest count cache check has no counts")
    actual_dynamic = counts.get("dynamic_total_nogood_count")
    actual_raw = counts.get("classified_raw_sat_count")
    if (
        type(actual_dynamic) is not int
        or actual_dynamic != dynamic_learned_count
        or type(actual_raw) is not int
        or actual_raw != raw_count
    ):
        raise StructuralCegarError(
            "manifest full recount disagrees with cached classification counts"
        )


def _write_failure(
    out: Path,
    *,
    kind: str,
    diagnostic: str,
    attempt: int,
    raw_sat_index: int | None,
    detail: Mapping[str, Any] | None = None,
) -> None:
    unsigned = {
        "schema": FAILURE_SCHEMA,
        "kind": kind,
        "diagnostic": diagnostic,
        "attempt": attempt,
        "raw_sat_index": raw_sat_index,
        "learned_clause_added": False,
        "detail": dict(detail or {}),
    }
    _atomic_json(
        out / "failure.json",
        {**unsigned, "failure_sha256": _sha256_value(unsigned)},
    )


def _stale_sat_recheck(
    encoding: Any,
    assignment: Mapping[int, bool],
    *,
    learned: Sequence[Mapping[str, Any]],
    survivor_clauses: Sequence[Sequence[int]],
    learned_snapshot_count: int,
    survivor_snapshot_count: int,
) -> dict[str, Any] | None:
    if (
        type(learned_snapshot_count) is not int
        or not 0 <= learned_snapshot_count <= len(learned)
        or type(survivor_snapshot_count) is not int
        or not 0 <= survivor_snapshot_count <= len(survivor_clauses)
    ):
        raise StructuralCegarError("live cube stale-recheck snapshot count mismatch")
    obj = encoding.decode(assignment)
    encoding.validate(obj, assignment)
    for record in learned[learned_snapshot_count:]:
        clause = tuple(int(literal) for literal in record["clause"])
        if not _clause_satisfied(clause, assignment):
            return {
                "kind": "current-learned-clause",
                "origin": record["origin"],
                "record_sha256": record["record_sha256"],
                "clause_sha256": record["clause_sha256"],
            }
    for index in range(survivor_snapshot_count, len(survivor_clauses)):
        clause = survivor_clauses[index]
        if not _clause_satisfied(clause, assignment):
            return {
                "kind": "current-survivor-block",
                "survivor_index": index,
            }
    return None


def _commit_sat_classification(
    encoding: Any,
    assignment: Mapping[int, bool],
    *,
    raw_sat_index: int,
    algebraic_templates: Sequence[Mapping[str, Any]],
    learned: list[dict[str, Any]],
    learned_clauses: list[tuple[int, ...]],
    learned_path: Path,
    survivors: list[dict[str, Any]],
    survivor_clauses: list[tuple[int, ...]],
    survivors_path: Path,
    bank: Any,
    failure_detail: dict[str, Any],
    shard_literals: Sequence[int] = (),
) -> dict[str, Any]:
    _validate_shard_assignment(
        assignment, shard_literals, where="live solver result"
    )
    obj = encoding.decode(assignment)
    encoding.validate(obj, assignment)
    semantic = encoding.semantic_record(assignment)
    assignment_sha256 = _assignment_hash(encoding, assignment)
    failure_detail.update(
        {
            "assignment_sha256": assignment_sha256,
            "semantic_assignment": semantic,
        }
    )
    rows = _metric_rows(obj)
    rows_json = [row.as_dict() for row in rows]
    failure_detail["metric_rows_sha256"] = _sha256_value(rows_json)
    found = _detection(rows)
    failure_detail["detection_stage"] = (
        None if found is None else found["stage"]
    )
    if found is None:
        cap_order_match = _cap_order_certificate(obj, rows)
        failure_detail["cap_order_match"] = (
            None
            if cap_order_match is None
            else cap_order_match[0]["certificate_payload_sha256"]
        )
        if cap_order_match is not None:
            certificate, _selected, _facts = cap_order_match
            clause = _clause_for_cap_order_certificate(
                encoding, certificate, assignment
            )
            if clause in learned_clauses:
                raise StructuralCegarError(
                    "SAT assignment survived an existing cap-order cut"
                )
            record = _with_record_hash(
                {
                    "schema": _learned_schema(encoding),
                    "index": len(learned),
                    "origin": CAP_ORDER_ORIGIN,
                    "raw_sat_index": raw_sat_index,
                    "assignment_sha256": assignment_sha256,
                    "semantic_assignment": semantic,
                    "stage": CAP_ORDER_STAGE,
                    "certificate": certificate,
                    "clause": list(clause),
                    "clause_sha256": _sha256_value(list(clause)),
                    "superseded_nogood_sha256": [],
                },
                learned[-1]["record_sha256"] if learned else None,
            )
            _append_record(learned_path, record)
            learned.append(record)
            learned_clauses.append(clause)
            return {
                "classification": "learned-cap-order",
                "record_sha256": record["record_sha256"],
                "assignment_sha256": assignment_sha256,
            }

        rhombus_cap_order_match = _rhombus_cap_order_certificate(obj, rows)
        failure_detail["rhombus_cap_order_match"] = (
            None
            if rhombus_cap_order_match is None
            else rhombus_cap_order_match[0][
                "certificate_payload_sha256"
            ]
        )
        if rhombus_cap_order_match is not None:
            certificate, _selected, _facts = rhombus_cap_order_match
            clause = _clause_for_rhombus_cap_order_certificate(
                encoding, certificate, assignment
            )
            if clause in learned_clauses:
                raise StructuralCegarError(
                    "SAT assignment survived an existing rhombus cap-order cut"
                )
            record = _with_record_hash(
                {
                    "schema": _learned_schema(encoding),
                    "index": len(learned),
                    "origin": RHOMBUS_CAP_ORDER_ORIGIN,
                    "raw_sat_index": raw_sat_index,
                    "assignment_sha256": assignment_sha256,
                    "semantic_assignment": semantic,
                    "stage": RHOMBUS_CAP_ORDER_STAGE,
                    "certificate": certificate,
                    "clause": list(clause),
                    "clause_sha256": _sha256_value(list(clause)),
                    "superseded_nogood_sha256": [],
                },
                learned[-1]["record_sha256"] if learned else None,
            )
            _append_record(learned_path, record)
            learned.append(record)
            learned_clauses.append(clause)
            return {
                "classification": "learned-rhombus-cap-order",
                "record_sha256": record["record_sha256"],
                "assignment_sha256": assignment_sha256,
            }

        shared_pair_match = _shared_pair_separation_certificate(
            encoding, assignment, obj, rows
        )
        failure_detail["shared_pair_separation_match"] = (
            None
            if shared_pair_match is None
            else shared_pair_match[0]["certificate_payload_sha256"]
        )
        if shared_pair_match is not None:
            certificate, _selected, _facts = shared_pair_match
            clause = _clause_for_shared_pair_separation_certificate(
                encoding, certificate, assignment
            )
            if clause in learned_clauses:
                raise StructuralCegarError(
                    "SAT assignment survived an existing shared-pair "
                    "cyclic-separation cut"
                )
            record = _with_record_hash(
                {
                    "schema": _learned_schema(encoding),
                    "index": len(learned),
                    "origin": SHARED_PAIR_SEPARATION_ORIGIN,
                    "raw_sat_index": raw_sat_index,
                    "assignment_sha256": assignment_sha256,
                    "semantic_assignment": semantic,
                    "stage": SHARED_PAIR_SEPARATION_STAGE,
                    "certificate": certificate,
                    "clause": list(clause),
                    "clause_sha256": _sha256_value(list(clause)),
                    "superseded_nogood_sha256": [],
                },
                learned[-1]["record_sha256"] if learned else None,
            )
            _append_record(learned_path, record)
            learned.append(record)
            learned_clauses.append(clause)
            return {
                "classification": "learned-shared-pair-cyclic-separation",
                "record_sha256": record["record_sha256"],
                "assignment_sha256": assignment_sha256,
            }

        kalmanson_cap_order_match = _kalmanson_cap_order_certificate(obj, rows)
        failure_detail["kalmanson_cap_order_match"] = (
            None
            if kalmanson_cap_order_match is None
            else kalmanson_cap_order_match[0][
                "certificate_payload_sha256"
            ]
        )
        if kalmanson_cap_order_match is not None:
            certificate, _selected, _facts = kalmanson_cap_order_match
            clause = _clause_for_kalmanson_cap_order_certificate(
                encoding, certificate, assignment
            )
            if clause in learned_clauses:
                raise StructuralCegarError(
                    "SAT assignment survived an existing Kalmanson "
                    "cap-order cut"
                )
            record = _with_record_hash(
                {
                    "schema": _learned_schema(encoding),
                    "index": len(learned),
                    "origin": KALMANSON_CAP_ORDER_ORIGIN,
                    "raw_sat_index": raw_sat_index,
                    "assignment_sha256": assignment_sha256,
                    "semantic_assignment": semantic,
                    "stage": KALMANSON_CAP_ORDER_STAGE,
                    "certificate": certificate,
                    "clause": list(clause),
                    "clause_sha256": _sha256_value(list(clause)),
                    "superseded_nogood_sha256": [],
                },
                learned[-1]["record_sha256"] if learned else None,
            )
            _append_record(learned_path, record)
            learned.append(record)
            learned_clauses.append(clause)
            return {
                "classification": "learned-kalmanson-cap-order",
                "record_sha256": record["record_sha256"],
                "assignment_sha256": assignment_sha256,
            }

        algebraic_match = _find_algebraic_match(
            encoding, assignment, algebraic_templates
        )
        failure_detail["algebraic_match"] = (
            None
            if algebraic_match is None
            else algebraic_match[0]["template_sha256"]
        )
        if algebraic_match is None:
            block = encoding.blocking_clause(assignment)
            _clause_false(block, assignment)
            record = _with_record_hash(
                {
                    "schema": _survivor_schema(encoding),
                    "index": len(survivors),
                    "raw_sat_index": raw_sat_index,
                    "classification": "STRUCTURALLY_UNRESOLVED",
                    "semantic_assignment": semantic,
                    "assignment_sha256": assignment_sha256,
                    "metric_rows": rows_json,
                    "metric_rows_sha256": _sha256_value(rows_json),
                    "blocking_clause": list(block),
                    "trust": (
                        "order-independent and exhaustive cap-order detectors "
                        "returned none and no replayed algebraic template matched; "
                        "not Euclidean or P97-realizable"
                    ),
                },
                survivors[-1]["record_sha256"] if survivors else None,
            )
            _append_record(survivors_path, record)
            survivors.append(record)
            survivor_clauses.append(block)
            return {
                "classification": "structurally-unresolved-survivor",
                "record_sha256": record["record_sha256"],
                "assignment_sha256": assignment_sha256,
            }

        template, permutation, mapped = algebraic_match
        clause = _clause_for_memberships(encoding, mapped, assignment)
        record = _with_record_hash(
            {
                "schema": _learned_schema(encoding),
                "index": len(learned),
                "origin": template["origin"],
                "raw_sat_index": raw_sat_index,
                "assignment_sha256": assignment_sha256,
                "semantic_assignment": semantic,
                "stage": template["stage"],
                "certificate_kind": template["certificate_kind"],
                "certificate": None,
                "algebraic_template_name": template["name"],
                "algebraic_template_sha256": template["template_sha256"],
                "permutation": list(permutation),
                "antecedent_memberships": [list(pair) for pair in mapped],
                "clause": list(clause),
                "clause_sha256": _sha256_value(list(clause)),
                "superseded_nogood_sha256": [],
            },
            learned[-1]["record_sha256"] if learned else None,
        )
        _append_record(learned_path, record)
        learned.append(record)
        learned_clauses.append(clause)
        return {
            "classification": (
                "learned-real-distinctness"
                if template["certificate_kind"]
                in {
                    REAL_DISTINCTNESS_CONTRADICTION_KIND,
                    EQUILATERAL_SHELL_CONTRADICTION_KIND,
                }
                else "learned-algebraic"
            ),
            "record_sha256": record["record_sha256"],
            "assignment_sha256": assignment_sha256,
        }

    certificate, selected = _certificate(rows, found)
    clause = _clause_for_structural_certificate(
        encoding, certificate, selected, assignment
    )
    key = certificates._rows_key(selected)
    _matched, superseded, added = bank.add(key, certificate)
    if not added:
        raise StructuralCegarError(
            "SAT assignment survived an already learned/subsuming cut"
        )
    record = _with_record_hash(
        {
            "schema": _learned_schema(encoding),
            "index": len(learned),
            "origin": STRUCTURAL_PATH_ORIGIN,
            "raw_sat_index": raw_sat_index,
            "assignment_sha256": assignment_sha256,
            "semantic_assignment": semantic,
            "stage": found["stage"],
            "certificate": certificate,
            "clause": list(clause),
            "clause_sha256": _sha256_value(list(clause)),
            "superseded_nogood_sha256": sorted(
                certificates._nogood_sha256(old) for old in superseded
            ),
        },
        learned[-1]["record_sha256"] if learned else None,
    )
    _append_record(learned_path, record)
    learned.append(record)
    learned_clauses.append(clause)
    return {
        "classification": "learned-structural",
        "record_sha256": record["record_sha256"],
        "assignment_sha256": assignment_sha256,
    }


def _launch_cube_batch(
    out: Path,
    encoding: Any,
    *,
    batch_index: int,
    depth: int,
    workers: int,
    timeout_s: int,
    base_cnf_sha256: str,
    extra_clauses: Sequence[Sequence[int]],
    learned: Sequence[Mapping[str, Any]],
    survivors: Sequence[Mapping[str, Any]],
    logs: Sequence[Mapping[str, Any]],
    solver_runner: SolverRunner,
) -> tuple[dict[str, Any], Path, list[dict[str, Any]]]:
    common_clause_body, common_clause_count = _cube_common_clause_body(
        encoding, extra_clauses
    )
    snapshot = _cube_snapshot(
        encoding,
        extra_clauses=extra_clauses,
        learned=learned,
        survivors=survivors,
        logs=logs,
        common_clause_body=common_clause_body,
        common_clause_count=common_clause_count,
        base_cnf_sha256=base_cnf_sha256,
    )
    plan = _cube_plan(
        encoding,
        depth=depth,
        batch_index=batch_index,
        snapshot=snapshot,
    )
    directory = out / "cube-batches" / f"batch-{batch_index:06d}"
    if directory.exists():
        raise StructuralCegarError(f"cube batch directory already exists: {directory}")
    directory.mkdir(parents=True)
    _atomic_json(directory / "plan.json", plan)

    jobs: list[dict[str, Any]] = []
    for cube_spec in plan["cubes"]:
        cube_index = int(cube_spec["cube_index"])
        cube = tuple(int(literal) for literal in cube_spec["literals"])
        cnf_chunks = _cube_cnf_chunks(
            encoding, common_clause_body, common_clause_count, cube
        )
        cnf_sha256 = _sha256_chunks(cnf_chunks)
        cnf_path = directory / f"cube-{cube_index:06d}.cnf"
        proof_path = directory / f"cube-{cube_index:06d}.drat"
        _atomic_byte_chunks(cnf_path, cnf_chunks)
        with contextlib.suppress(FileNotFoundError):
            proof_path.unlink()
        jobs.append(
            {
                "cube_index": cube_index,
                "cube": cube,
                "cube_sha256": cube_spec["cube_sha256"],
                "cnf_sha256": cnf_sha256,
                "cnf_path": cnf_path,
                "proof_path": proof_path,
            }
        )

    def solve(job: Mapping[str, Any]) -> dict[str, Any]:
        try:
            result = solver_runner(
                job["cnf_path"], timeout_s, job["proof_path"]
            )
            return {"result": result, "exception": None}
        except Exception as exc:  # noqa: BLE001
            return {
                "result": None,
                "exception": f"{type(exc).__name__}: {exc}",
            }

    completed: dict[int, dict[str, Any]] = {}
    with concurrent.futures.ThreadPoolExecutor(
        max_workers=min(workers, len(jobs))
    ) as executor:
        future_to_index = {
            executor.submit(solve, job): int(job["cube_index"]) for job in jobs
        }
        for future in concurrent.futures.as_completed(future_to_index):
            completed[future_to_index[future]] = future.result()
    for job in jobs:
        job.update(completed[int(job["cube_index"])])
    return plan, directory, jobs


def _finalize_cube_batch(
    cube_batches_path: Path,
    cube_batches: list[dict[str, Any]],
    *,
    out: Path,
    plan: Mapping[str, Any],
    directory: Path,
    results: Sequence[Mapping[str, Any]],
    artifact_mode: str,
) -> dict[str, Any]:
    results_path = directory / "results.jsonl"
    _atomic_bytes(
        results_path,
        b"".join(_canonical_bytes(result) + b"\n" for result in results),
    )
    dispositions = Counter(str(result["disposition"]) for result in results)
    committed = [
        str(result["committed_record_sha256"])
        for result in results
        if result["disposition"] == "committed"
    ]
    unsigned = {
        "schema": CUBE_BATCH_SCHEMA,
        "batch_index": int(plan["batch_index"]),
        "directory": str(directory.relative_to(out)),
        "cube_artifact_mode": artifact_mode,
        "plan_sha256": plan["plan_sha256"],
        "result_count": len(results),
        "results_sha256": _sha256_file(results_path),
        "result_chain_head_sha256": (
            results[-1]["record_sha256"] if results else None
        ),
        "disposition_histogram": dict(sorted(dispositions.items())),
        "committed_record_sha256": committed,
    }
    record = _with_record_hash(
        unsigned,
        cube_batches[-1]["record_sha256"] if cube_batches else None,
    )
    _append_record(cube_batches_path, record)
    cube_batches.append(record)
    return record


def run_driver(
    out_dir: str | Path,
    *,
    timeout_s: int = 300,
    learned_core_limit: int = 1000,
    survivor_limit: int = 100,
    workers: int = 1,
    parallel_mode: str = "sequential",
    cube_depth: int = 4,
    cube_artifact_mode: str = "full",
    shard_depth: int | None = None,
    shard_index: int | None = None,
    bootstrap_results: str | Path | None = DEFAULT_BOOTSTRAP,
    algebraic_bootstrap: (
        str | Path | Sequence[str | Path] | None
    ) = DEFAULT_ALGEBRAIC_BOOTSTRAPS,
    projected_static_v2: bool = False,
    resume: bool = False,
    max_new_raw: int | None = None,
    solver_runner: SolverRunner = sat.run_cadical,
    checker_runner: CheckerRunner = sat.run_drat_trim,
) -> dict[str, Any]:
    if timeout_s <= 0:
        raise StructuralCegarError("timeout_s must be positive")
    if learned_core_limit <= 0 or survivor_limit <= 0:
        raise StructuralCegarError("limits must be positive")
    if not 1 <= workers <= MAX_WORKERS:
        raise StructuralCegarError("workers must be in 1..24")
    if parallel_mode not in PARALLEL_MODES:
        raise StructuralCegarError(
            f"parallel_mode must be one of {', '.join(PARALLEL_MODES)}"
        )
    if cube_artifact_mode not in CUBE_ARTIFACT_MODES:
        raise StructuralCegarError(
            "cube_artifact_mode must be one of "
            f"{', '.join(CUBE_ARTIFACT_MODES)}"
        )
    if not 1 <= cube_depth <= MAX_CUBE_DEPTH:
        raise StructuralCegarError(
            f"cube_depth must be in 1..{MAX_CUBE_DEPTH}"
        )
    if max_new_raw is not None and max_new_raw <= 0:
        raise StructuralCegarError("max_new_raw must be positive")
    if (shard_depth is None) != (shard_index is None):
        raise StructuralCegarError(
            "shard_depth and shard_index must be provided together"
        )
    if shard_depth is not None:
        if type(shard_depth) is not int or not 1 <= shard_depth <= MAX_CUBE_DEPTH:
            raise StructuralCegarError(
                f"shard_depth must be in 1..{MAX_CUBE_DEPTH}"
            )
        if (
            type(shard_index) is not int
            or not 0 <= shard_index < 1 << shard_depth
        ):
            raise StructuralCegarError(
                f"shard_index must be in 0..{(1 << shard_depth) - 1}"
            )
        if parallel_mode != "sequential":
            raise StructuralCegarError(
                "fixed top-level shards require parallel_mode='sequential'"
            )

    out = Path(out_dir)
    bootstrap = None if bootstrap_results is None else Path(bootstrap_results)
    if bootstrap is not None and not bootstrap.is_file():
        raise StructuralCegarError(f"bootstrap results do not exist: {bootstrap}")
    encoding = _phase3_encoding(projected_static_v2=projected_static_v2)
    if bootstrap is not None:
        _validate_bootstrap_mode(encoding, bootstrap)
    algebraic_directories = _algebraic_directories(algebraic_bootstrap)
    for algebraic_directory in algebraic_directories:
        if not algebraic_directory.is_dir():
            raise StructuralCegarError(
                f"algebraic bootstrap does not exist: {algebraic_directory}"
            )
    algebraic_templates, algebraic_summary = _load_algebraic_templates(
        algebraic_directories
    )
    configuration = _base_configuration(
        encoding,
        timeout_s=timeout_s,
        learned_core_limit=learned_core_limit,
        survivor_limit=survivor_limit,
        workers=workers,
        parallel_mode=parallel_mode,
        cube_depth=cube_depth,
        cube_artifact_mode=cube_artifact_mode,
        bootstrap_results=bootstrap,
        algebraic_bootstraps=algebraic_directories,
        shard_depth=shard_depth,
        shard_index=shard_index,
    )
    shard_literals = (
        ()
        if shard_depth is None or shard_index is None
        else tuple(
            int(literal)
            for literal in configuration["shard"]["literals"]
        )
    )
    shard_clauses = tuple((literal,) for literal in shard_literals)
    base_cnf_bytes = encoding.cnf_bytes(shard_clauses)
    base_cnf_sha256 = _sha256_bytes(base_cnf_bytes)
    learned_path = out / "learned-certificates.jsonl"
    survivors_path = out / "survivors.jsonl"
    logs_path = out / "solver-logs.jsonl"
    cube_batches_path = out / "cube-batches.jsonl"
    manifest_path = out / "manifest.json"
    prior_manifest: dict[str, Any] | None = None

    if resume:
        if not manifest_path.is_file():
            raise StructuralCegarError("resume requires manifest.json")
        prior_manifest = _strict_json(manifest_path)
        unsigned_prior = dict(prior_manifest)
        claimed_manifest_hash = unsigned_prior.pop("manifest_sha256", None)
        if claimed_manifest_hash != _sha256_value(unsigned_prior):
            raise StructuralCegarError("resume manifest hash is invalid")
        if prior_manifest.get("configuration") != configuration:
            raise StructuralCegarError("resume configuration/dependency mismatch")
        if (out / "failure.json").exists():
            raise StructuralCegarError("failed-closed run cannot be resumed in place")
        if _sha256_file(out / "base.cnf") != base_cnf_sha256:
            raise StructuralCegarError("resume base.cnf mismatch")
        smoke = _run_smoke_gates()
        if json.loads((out / "smoke.json").read_text()) != smoke:
            raise StructuralCegarError("resume smoke-gate artifact mismatch")
        bootstrap_summary = _strict_json(out / "bootstrap.json")
        if bootstrap_summary.get("algebraic") != algebraic_summary:
            raise StructuralCegarError(
                "resume algebraic bootstrap replay/configuration mismatch"
            )
        learned, bank, learned_clauses = _load_learned(
            learned_path, encoding, algebraic_templates, shard_literals
        )
        survivors, survivor_clauses = _load_survivors(
            survivors_path, encoding, shard_literals
        )
        logs = _load_logs(logs_path)
        cube_batches = _load_cube_batches(
            cube_batches_path,
            out,
            encoding,
            depth=cube_depth,
            artifact_mode=cube_artifact_mode,
            base_cnf_sha256=base_cnf_sha256,
            learned=learned,
            learned_clauses=learned_clauses,
            survivors=survivors,
            survivor_clauses=survivor_clauses,
            logs=logs,
        )
    else:
        if out.exists() and any(out.iterdir()):
            raise StructuralCegarError("output directory is nonempty; pass resume=True")
        out.mkdir(parents=True, exist_ok=True)
        _atomic_bytes(out / "base.cnf", base_cnf_bytes)
        smoke = _run_smoke_gates()
        _atomic_json(out / "smoke.json", smoke)
        if bootstrap is None:
            learned = []
            structural_summary = {
                "source_record_count": 0,
                "source_unique_certificate_count": 0,
                "source_stage_histogram": {},
                "source_certificate_schema_histogram": {},
                "source_structural_unique_certificate_count": 0,
                "source_cap_order_unique_certificate_count": 0,
                "source_five_point_cap_order_unique_certificate_count": 0,
                "source_rhombus_cap_order_unique_certificate_count": 0,
                "kept_antichain_count": 0,
                "kept_structural_antichain_count": 0,
                "kept_structural_row_antichain_count": 0,
                "structural_projected_unique_clause_count": 0,
                "structural_projected_duplicate_clause_count": 0,
                "structural_projected_subsumed_clause_count": 0,
                "kept_cap_order_antichain_count": 0,
                "kept_five_point_cap_order_antichain_count": 0,
                "kept_rhombus_cap_order_antichain_count": 0,
                "covered_certificate_count": 0,
                "subsumed_certificate_count": 0,
            }
        else:
            learned, structural_summary = _bootstrap_certificates(
                encoding, bootstrap
            )
        bootstrap_summary = {
            "structural": {
                **structural_summary,
                "source": configuration["bootstrap_results"],
            },
            "algebraic": algebraic_summary,
        }
        _atomic_json(out / "bootstrap.json", bootstrap_summary)
        _atomic_bytes(
            learned_path,
            b"".join(_canonical_bytes(record) + b"\n" for record in learned),
        )
        _atomic_bytes(survivors_path, b"")
        _atomic_bytes(logs_path, b"")
        _atomic_bytes(cube_batches_path, b"")
        learned, bank, learned_clauses = _load_learned(
            learned_path, encoding, algebraic_templates
        )
        survivors, survivor_clauses = [], []
        logs = []
        cube_batches = []

    status = "RUNNING"
    diagnostic: str | None = None
    terminal_clause_count: int | None = (
        None
        if prior_manifest is None
        else prior_manifest.get("terminal_clause_count")
    )
    unsat_verified = bool(
        prior_manifest is not None
        and prior_manifest.get("terminal_drat_verified") is True
    )
    dynamic_learned_count, raw_count = _classification_count_cache(
        learned, survivors
    )
    initial_raw_count = raw_count

    def publish() -> dict[str, Any]:
        manifest = _manifest(
            out,
            configuration=configuration,
            status=status,
            diagnostic=diagnostic,
            learned=learned,
            survivors=survivors,
            logs=logs,
            cube_batches=cube_batches,
            bank=bank,
            bootstrap_summary=bootstrap_summary,
            terminal_clause_count=terminal_clause_count,
            unsat_verified=unsat_verified,
        )
        _validate_manifest_count_cache(
            manifest,
            dynamic_learned_count=dynamic_learned_count,
            raw_count=raw_count,
        )
        _atomic_json(manifest_path, manifest)
        return manifest

    if prior_manifest is not None and prior_manifest.get("status") in {
        "STRUCTURAL_UNSAT_VERIFIED",
        "P97_EUCLIDEAN_GAUGE_UNSAT_VERIFIED",
        "ENUMERATION_COMPLETE_WITH_SURVIVORS",
        "SHARD_STRUCTURAL_UNSAT_VERIFIED",
        "SHARD_P97_EUCLIDEAN_GAUGE_UNSAT_VERIFIED",
        "SHARD_ENUMERATION_COMPLETE_WITH_SURVIVORS",
        "LEARNED_CORE_LIMIT",
        "SURVIVOR_LIMIT",
        "CUBE_BATCH_NO_SAT_CHECKPOINT",
    }:
        status = str(prior_manifest["status"])
        diagnostic = prior_manifest.get("diagnostic")
        replayed_manifest = _manifest(
            out,
            configuration=configuration,
            status=status,
            diagnostic=diagnostic,
            learned=learned,
            survivors=survivors,
            logs=logs,
            cube_batches=cube_batches,
            bank=bank,
            bootstrap_summary=bootstrap_summary,
            terminal_clause_count=terminal_clause_count,
            unsat_verified=unsat_verified,
        )
        _validate_manifest_count_cache(
            replayed_manifest,
            dynamic_learned_count=dynamic_learned_count,
            raw_count=raw_count,
        )
        if replayed_manifest != prior_manifest:
            raise StructuralCegarError("completed/checkpoint manifest replay mismatch")
        return prior_manifest

    publish()
    while True:
        if dynamic_learned_count >= learned_core_limit:
            status = "LEARNED_CORE_LIMIT"
            diagnostic = "bounded dynamic learned-core limit reached"
            return publish()
        if len(survivors) >= survivor_limit:
            status = "SURVIVOR_LIMIT"
            diagnostic = "100 structurally unresolved survivors reached"
            return publish()
        if max_new_raw is not None and raw_count - initial_raw_count >= max_new_raw:
            status = "CHECKPOINT"
            diagnostic = "requested bounded raw-SAT checkpoint reached"
            return publish()

        extra_clauses = [
            *shard_clauses,
            *learned_clauses,
            *survivor_clauses,
        ]
        if parallel_mode == "cube-batch":
            plan, batch_directory, jobs = _launch_cube_batch(
                out,
                encoding,
                batch_index=len(cube_batches),
                depth=cube_depth,
                workers=workers,
                timeout_s=timeout_s,
                base_cnf_sha256=base_cnf_sha256,
                extra_clauses=extra_clauses,
                learned=learned,
                survivors=survivors,
                logs=logs,
                solver_runner=solver_runner,
            )
            (
                learned_snapshot_count,
                survivor_snapshot_count,
            ) = _live_cube_snapshot_counts(
                plan,
                learned=learned,
                survivors=survivors,
                survivor_clauses=survivor_clauses,
                logs=logs,
            )
            batch_results: list[dict[str, Any]] = []
            first_failure: dict[str, Any] | None = None
            committed_count = 0
            stopped_for_limit = False
            for job in jobs:
                cube_index = int(job["cube_index"])
                cube = tuple(int(literal) for literal in job["cube"])
                result = job["result"]
                exception = job["exception"]
                if exception is None:
                    verdict = str(result.verdict)
                    returncode = int(result.returncode)
                    stdout = str(result.stdout)
                    stderr = str(result.stderr)
                else:
                    verdict = "EXCEPTION"
                    returncode = 0
                    stdout = ""
                    stderr = str(exception)
                attempt = len(logs)
                log = _with_record_hash(
                    {
                        "schema": LOG_SCHEMA,
                        "attempt": attempt,
                        "cnf_sha256": job["cnf_sha256"],
                        "clause_count": (
                            len(encoding.clauses)
                            + len(extra_clauses)
                            + len(cube)
                        ),
                        "verdict": verdict,
                        "returncode": returncode,
                        "stdout": stdout,
                        "stderr": stderr,
                        "parallel_mode": "cube-batch",
                        "cube_batch_index": int(plan["batch_index"]),
                        "cube_index": cube_index,
                        "cube_plan_sha256": plan["plan_sha256"],
                    },
                    logs[-1]["record_sha256"] if logs else None,
                )
                _append_record(logs_path, log)
                logs.append(log)

                semantic: Any = None
                assignment_sha256: str | None = None
                assignment_error: str | None = None
                assignment: Mapping[int, bool] | None = None
                if verdict == "SAT":
                    assignment = result.assignment
                    try:
                        obj = encoding.decode(assignment)
                        encoding.validate(obj, assignment)
                        if any(
                            not _clause_satisfied(clause, assignment)
                            for clause in extra_clauses
                        ):
                            raise StructuralCegarError(
                                "SAT assignment violates the batch snapshot"
                            )
                        if any(
                            not _literal_true(literal, assignment)
                            for literal in cube
                        ):
                            raise StructuralCegarError(
                                "SAT assignment violates its cube"
                            )
                        semantic = encoding.semantic_record(assignment)
                        assignment_sha256 = _assignment_hash(
                            encoding, assignment
                        )
                    except Exception as exc:  # noqa: BLE001
                        assignment_error = f"{type(exc).__name__}: {exc}"

                proof: dict[str, Any] | None = None
                proof_path = Path(job["proof_path"])
                if (
                    verdict == "UNSAT"
                    and cube_artifact_mode == "full"
                    and proof_path.is_file()
                    and proof_path.stat().st_size > 0
                ):
                    proof = {
                        "path": str(proof_path.relative_to(out)),
                        "size": proof_path.stat().st_size,
                        "sha256": _sha256_file(proof_path),
                        "verification": "not-run-local-cube-only",
                    }
                else:
                    with contextlib.suppress(FileNotFoundError):
                        proof_path.unlink()
                if cube_artifact_mode == "compact":
                    with contextlib.suppress(FileNotFoundError):
                        Path(job["cnf_path"]).unlink()

                disposition: str
                stale_recheck: dict[str, Any] | None = None
                committed_record_sha256: str | None = None
                classification: str | None = None
                if first_failure is not None:
                    disposition = "unprocessed-after-failure"
                elif stopped_for_limit and verdict != "SAT":
                    disposition = "unprocessed-after-limit"
                elif exception is not None:
                    disposition = "solver-exception"
                    first_failure = {
                        "kind": "SOLVER_EXCEPTION",
                        "diagnostic": f"cube solver runner raised: {exception}",
                        "attempt": attempt,
                        "raw_sat_index": None,
                        "detail": {
                            "cube_batch_index": int(plan["batch_index"]),
                            "cube_index": cube_index,
                        },
                    }
                elif verdict == "SAT" and assignment_error is not None:
                    disposition = "coordinator-certificate-failure"
                    first_failure = {
                        "kind": "SAT_CERTIFICATE_FAILURE",
                        "diagnostic": (
                            "cube SAT decode/recheck failure: "
                            f"{assignment_error}"
                        ),
                        "attempt": attempt,
                        "raw_sat_index": raw_count,
                        "detail": {
                            "cube_batch_index": int(plan["batch_index"]),
                            "cube_index": cube_index,
                        },
                    }
                elif verdict == "SAT":
                    if assignment is None:
                        raise AssertionError("validated SAT assignment is missing")
                    stale_recheck = _stale_sat_recheck(
                        encoding,
                        assignment,
                        learned=learned,
                        survivor_clauses=survivor_clauses,
                        learned_snapshot_count=learned_snapshot_count,
                        survivor_snapshot_count=survivor_snapshot_count,
                    )
                    if stale_recheck is not None:
                        disposition = "stale-current-antichain"
                    elif stopped_for_limit:
                        disposition = "unprocessed-after-limit"
                    else:
                        failure_detail: dict[str, Any] = {
                            "cube_batch_index": int(plan["batch_index"]),
                            "cube_index": cube_index,
                        }
                        learned_before = len(learned)
                        survivors_before = len(survivors)
                        try:
                            committed = _commit_sat_classification(
                                encoding,
                                assignment,
                                raw_sat_index=raw_count,
                                algebraic_templates=algebraic_templates,
                                learned=learned,
                                learned_clauses=learned_clauses,
                                learned_path=learned_path,
                                survivors=survivors,
                                survivor_clauses=survivor_clauses,
                                survivors_path=survivors_path,
                                bank=bank,
                                failure_detail=failure_detail,
                            )
                            classification = str(committed["classification"])
                            committed_record_sha256 = str(
                                committed["record_sha256"]
                            )
                            (
                                dynamic_delta,
                                raw_delta,
                            ) = _committed_classification_delta(
                                learned,
                                survivors,
                                learned_before=learned_before,
                                survivors_before=survivors_before,
                            )
                            dynamic_learned_count += dynamic_delta
                            raw_count += raw_delta
                            disposition = "committed"
                            committed_count += 1
                        except Exception as exc:  # noqa: BLE001
                            disposition = "coordinator-certificate-failure"
                            first_failure = {
                                "kind": "SAT_CERTIFICATE_FAILURE",
                                "diagnostic": (
                                    "cube SAT decode/detect/certificate failure: "
                                    f"{exc}"
                                ),
                                "attempt": attempt,
                                "raw_sat_index": raw_count,
                                "detail": failure_detail,
                            }
                    stopped_for_limit = (
                        dynamic_learned_count >= learned_core_limit
                        or len(survivors) >= survivor_limit
                        or (
                            max_new_raw is not None
                            and raw_count - initial_raw_count >= max_new_raw
                        )
                    )
                elif verdict == "UNSAT":
                    disposition = "cube-unsat-unverified"
                else:
                    disposition = "solver-unknown"
                    first_failure = {
                        "kind": "SOLVER_UNKNOWN",
                        "diagnostic": (
                            f"cube solver returned {verdict!r} "
                            f"(returncode={returncode}); no learned clause was added"
                        ),
                        "attempt": attempt,
                        "raw_sat_index": None,
                        "detail": {
                            "cube_batch_index": int(plan["batch_index"]),
                            "cube_index": cube_index,
                        },
                    }

                unsigned_result = {
                    "schema": CUBE_RESULT_SCHEMA,
                    "batch_index": int(plan["batch_index"]),
                    "cube_index": cube_index,
                    "cube_artifact_mode": cube_artifact_mode,
                    "plan_sha256": plan["plan_sha256"],
                    "cube_sha256": job["cube_sha256"],
                    "cube_literals": list(cube),
                    "cnf_sha256": job["cnf_sha256"],
                    "solver_log_attempt": attempt,
                    "solver_log_record_sha256": log["record_sha256"],
                    "semantic_assignment": semantic,
                    "assignment_sha256": assignment_sha256,
                    "disposition": disposition,
                    "stale_recheck": stale_recheck,
                    "classification": classification,
                    "committed_record_sha256": committed_record_sha256,
                    "proof": proof,
                    "claim_scope": (
                        "local cube result only; never terminal or theorem-level"
                    ),
                }
                batch_results.append(
                    _with_record_hash(
                        unsigned_result,
                        (
                            batch_results[-1]["record_sha256"]
                            if batch_results
                            else None
                        ),
                    )
                )
            _finalize_cube_batch(
                cube_batches_path,
                cube_batches,
                out=out,
                plan=plan,
                directory=batch_directory,
                results=batch_results,
                artifact_mode=cube_artifact_mode,
            )
            if first_failure is not None:
                diagnostic = str(first_failure["diagnostic"])
                _write_failure(
                    out,
                    kind=str(first_failure["kind"]),
                    diagnostic=diagnostic,
                    attempt=int(first_failure["attempt"]),
                    raw_sat_index=first_failure["raw_sat_index"],
                    detail=first_failure["detail"],
                )
                status = "UNKNOWN"
                return publish()
            if committed_count == 0:
                status = "CUBE_BATCH_NO_SAT_CHECKPOINT"
                diagnostic = (
                    "every cube in the exhaustive local partition returned "
                    "UNSAT, but no composed terminal proof was produced or "
                    "verified"
                )
                return publish()
            status = "RUNNING"
            diagnostic = None
            publish()
            continue

        solve_path = out / ".solver.cnf"
        proof_tmp = out / ".solver.drat"
        cnf_bytes = encoding.cnf_bytes(extra_clauses)
        _atomic_bytes(solve_path, cnf_bytes)
        with contextlib.suppress(FileNotFoundError):
            proof_tmp.unlink()
        attempt = len(logs)
        # The imported/caller-supplied solver boundary can raise arbitrary
        # exceptions; catching them here is required to persist UNKNOWN without a cut.
        try:
            result = solver_runner(solve_path, timeout_s, proof_tmp)
        except Exception as exc:  # noqa: BLE001
            diagnostic = f"solver runner raised: {exc}"
            _write_failure(
                out,
                kind="SOLVER_EXCEPTION",
                diagnostic=diagnostic,
                attempt=attempt,
                raw_sat_index=None,
            )
            status = "UNKNOWN"
            return publish()
        log = _with_record_hash(
            {
                "schema": LOG_SCHEMA,
                "attempt": attempt,
                "cnf_sha256": _sha256_bytes(cnf_bytes),
                "clause_count": len(encoding.clauses) + len(extra_clauses),
                "verdict": result.verdict,
                "returncode": result.returncode,
                "stdout": result.stdout,
                "stderr": result.stderr,
            },
            logs[-1]["record_sha256"] if logs else None,
        )
        _append_record(logs_path, log)
        logs.append(log)

        if result.verdict == "SAT":
            with contextlib.suppress(FileNotFoundError):
                proof_tmp.unlink()
            current_raw_index = raw_count
            failure_detail: dict[str, Any] = {}
            learned_before = len(learned)
            survivors_before = len(survivors)
            # Decoder, detector, certificate exporter, and independent validator
            # are imported trust boundaries. Any exception must stop this SAT
            # assignment without learning a clause.
            try:
                _commit_sat_classification(
                    encoding,
                    result.assignment,
                    raw_sat_index=current_raw_index,
                    algebraic_templates=algebraic_templates,
                    learned=learned,
                    learned_clauses=learned_clauses,
                    learned_path=learned_path,
                    survivors=survivors,
                    survivor_clauses=survivor_clauses,
                    survivors_path=survivors_path,
                    bank=bank,
                    failure_detail=failure_detail,
                    shard_literals=shard_literals,
                )
                dynamic_delta, raw_delta = _committed_classification_delta(
                    learned,
                    survivors,
                    learned_before=learned_before,
                    survivors_before=survivors_before,
                )
                dynamic_learned_count += dynamic_delta
                raw_count += raw_delta
                status = "RUNNING"
                diagnostic = None
                publish()
                continue
            except Exception as exc:  # noqa: BLE001
                diagnostic = f"SAT decode/detect/certificate failure: {exc}"
                _write_failure(
                    out,
                    kind="SAT_CERTIFICATE_FAILURE",
                    diagnostic=diagnostic,
                    attempt=attempt,
                    raw_sat_index=current_raw_index,
                    detail=failure_detail,
                )
                status = "UNKNOWN"
                return publish()
        if result.verdict == "UNSAT":
            terminal_path = out / "terminal.cnf"
            proof_path = out / "terminal.drat"
            _atomic_bytes(terminal_path, cnf_bytes)
            terminal_clause_count = len(encoding.clauses) + len(extra_clauses)
            if not proof_tmp.is_file() or proof_tmp.stat().st_size == 0:
                diagnostic = "solver reported UNSAT but terminal DRAT is missing"
                _write_failure(
                    out,
                    kind="MISSING_DRAT",
                    diagnostic=diagnostic,
                    attempt=attempt,
                    raw_sat_index=None,
                )
                status = "UNKNOWN"
                return publish()
            os.replace(proof_tmp, proof_path)
            # The imported/caller-supplied checker boundary can raise arbitrary
            # exceptions; catching them here records UNKNOWN, never verification.
            try:
                checked = checker_runner(
                    terminal_path, proof_path, timeout_s
                )
            except Exception as exc:  # noqa: BLE001
                diagnostic = f"DRAT checker raised: {exc}"
                _write_failure(
                    out,
                    kind="CHECKER_EXCEPTION",
                    diagnostic=diagnostic,
                    attempt=attempt,
                    raw_sat_index=None,
                )
                status = "UNKNOWN"
                return publish()
            _atomic_bytes(
                out / "terminal.drat.check",
                (
                    checked.stdout
                    + ("\nSTDERR\n" + checked.stderr if checked.stderr else "")
                ).encode(),
            )
            if checked.verified is not True:
                diagnostic = "drat-trim did not report exact line 's VERIFIED'"
                _write_failure(
                    out,
                    kind="DRAT_REJECTED",
                    diagnostic=diagnostic,
                    attempt=attempt,
                    raw_sat_index=None,
                )
                status = "UNKNOWN"
                return publish()
            unsat_verified = True
            diagnostic = None
            has_algebraic = any(
                record["origin"]
                in {
                    ALGEBRAIC_ORIGIN,
                    REAL_DISTINCTNESS_ORIGIN,
                    EQUILATERAL_SHELL_ORIGIN,
                }
                for record in learned
            )
            if shard_literals:
                status = (
                    (
                        "SHARD_P97_EUCLIDEAN_GAUGE_UNSAT_VERIFIED"
                        if has_algebraic
                        else "SHARD_STRUCTURAL_UNSAT_VERIFIED"
                    )
                    if not survivors
                    else "SHARD_ENUMERATION_COMPLETE_WITH_SURVIVORS"
                )
            else:
                status = (
                    (
                        "P97_EUCLIDEAN_GAUGE_UNSAT_VERIFIED"
                        if has_algebraic
                        else "STRUCTURAL_UNSAT_VERIFIED"
                    )
                    if not survivors
                    else "ENUMERATION_COMPLETE_WITH_SURVIVORS"
                )
            return publish()

        with contextlib.suppress(FileNotFoundError):
            proof_tmp.unlink()
        diagnostic = (
            f"solver returned {result.verdict!r} "
            f"(returncode={result.returncode}); no learned clause was added"
        )
        _write_failure(
            out,
            kind="SOLVER_UNKNOWN",
            diagnostic=diagnostic,
            attempt=attempt,
            raw_sat_index=None,
        )
        status = "UNKNOWN"
        return publish()


def verify_shard_coverage(
    shard_directories: Sequence[str | Path],
    *,
    checker_runner: CheckerRunner = sat.run_drat_trim,
) -> dict[str, Any]:
    if not shard_directories:
        raise StructuralCegarError("shard coverage requires at least one directory")

    replayed: list[tuple[Path, dict[str, Any]]] = []
    common_projected_static_v2: bool | None = None
    for raw_directory in shard_directories:
        directory = Path(raw_directory)
        manifest_path = directory / "manifest.json"
        manifest = _strict_json(manifest_path)
        unsigned = dict(manifest)
        claimed_hash = unsigned.pop("manifest_sha256", None)
        if claimed_hash != _sha256_value(unsigned):
            raise StructuralCegarError(
                f"{manifest_path}: manifest hash mismatch"
            )
        configuration = manifest.get("configuration")
        if not isinstance(configuration, Mapping):
            raise StructuralCegarError(
                f"{manifest_path}: configuration is not an object"
            )
        projected_static_v2 = _projected_static_v2_from_configuration(
            configuration,
            where=str(manifest_path),
        )
        if common_projected_static_v2 is None:
            common_projected_static_v2 = projected_static_v2
        elif projected_static_v2 != common_projected_static_v2:
            raise StructuralCegarError(
                f"{manifest_path}: shard coverage mode/schema mismatch"
            )
        encoding = _phase3_encoding(
            projected_static_v2=projected_static_v2
        )
        shard = configuration.get("shard")
        if not isinstance(shard, Mapping):
            raise StructuralCegarError(
                f"{manifest_path}: not a fixed-shard manifest"
            )
        depth = shard.get("depth")
        index = shard.get("index")
        if type(depth) is not int or type(index) is not int:
            raise StructuralCegarError(
                f"{manifest_path}: invalid shard depth/index"
            )
        expected_shard = _shard_spec(
            encoding, depth=depth, index=index
        )
        if dict(shard) != expected_shard:
            raise StructuralCegarError(
                f"{manifest_path}: canonical shard provenance mismatch"
            )
        if (
            manifest.get("status") not in SHARD_TERMINAL_STATUSES
            or manifest.get("terminal_drat_verified") is not True
            or manifest.get("counts", {}).get("structural_survivor_count") != 0
        ):
            raise StructuralCegarError(
                f"{manifest_path}: shard is not terminally UNSAT"
            )

        bootstrap_config = configuration.get("bootstrap_results")
        algebraic_configs = configuration.get("algebraic_bootstraps")
        if not isinstance(algebraic_configs, list):
            raise StructuralCegarError(
                f"{manifest_path}: algebraic bootstrap provenance is not a list"
            )
        bootstrap_path = (
            None
            if bootstrap_config is None
            else Path(str(bootstrap_config["path"]))
        )
        algebraic_paths = tuple(
            Path(str(algebraic_config["path"]))
            for algebraic_config in algebraic_configs
        )
        replay_manifest = run_driver(
            directory,
            timeout_s=int(configuration["timeout_seconds"]),
            learned_core_limit=int(
                configuration["dynamic_learned_core_limit"]
            ),
            survivor_limit=int(configuration["survivor_limit"]),
            workers=int(configuration["workers"]),
            parallel_mode=str(configuration["parallel"]["mode"]),
            cube_depth=int(configuration["parallel"]["cube_depth"]),
            cube_artifact_mode=str(
                configuration["parallel"]["artifact_mode"]
            ),
            shard_depth=depth,
            shard_index=index,
            bootstrap_results=bootstrap_path,
            algebraic_bootstrap=algebraic_paths,
            projected_static_v2=projected_static_v2,
            resume=True,
        )
        if replay_manifest != manifest:
            raise StructuralCegarError(
                f"{manifest_path}: replayed manifest mismatch"
            )
        terminal_cnf = directory / "terminal.cnf"
        terminal_drat = directory / "terminal.drat"
        checked = checker_runner(
            terminal_cnf,
            terminal_drat,
            int(configuration["timeout_seconds"]),
        )
        if checked.verified is not True:
            raise StructuralCegarError(
                f"{manifest_path}: terminal DRAT recheck failed"
            )
        replayed.append((directory.resolve(), manifest))

    first_configuration = replayed[0][1]["configuration"]
    first_shard = first_configuration["shard"]
    depth = int(first_shard["depth"])
    common_configuration = dict(first_configuration)
    common_configuration.pop("shard")
    common_provenance = {
        "configuration_without_shard": common_configuration,
        "shard_depth": depth,
        "shard_count": first_shard["shard_count"],
        "semantic_variables": first_shard["semantic_variables"],
        "partition_sha256": first_shard["partition_sha256"],
        "global_base_cnf_sha256": first_shard["global_base_cnf_sha256"],
        "bootstrap": replayed[0][1]["bootstrap"],
        "trust_boundary": replayed[0][1]["trust_boundary"],
    }
    by_index: dict[int, tuple[Path, dict[str, Any]]] = {}
    for directory, manifest in replayed:
        configuration = manifest["configuration"]
        shard = configuration["shard"]
        normalized_configuration = dict(configuration)
        normalized_configuration.pop("shard")
        provenance = {
            "configuration_without_shard": normalized_configuration,
            "shard_depth": shard["depth"],
            "shard_count": shard["shard_count"],
            "semantic_variables": shard["semantic_variables"],
            "partition_sha256": shard["partition_sha256"],
            "global_base_cnf_sha256": shard["global_base_cnf_sha256"],
            "bootstrap": manifest["bootstrap"],
            "trust_boundary": manifest["trust_boundary"],
        }
        if provenance != common_provenance:
            raise StructuralCegarError(
                f"{directory}: shard coverage provenance mismatch"
            )
        index = int(shard["index"])
        if index in by_index:
            raise StructuralCegarError(f"duplicate shard index {index}")
        by_index[index] = (directory, manifest)

    expected_indices = set(range(1 << depth))
    if set(by_index) != expected_indices:
        missing = sorted(expected_indices - set(by_index))
        extra = sorted(set(by_index) - expected_indices)
        raise StructuralCegarError(
            f"shard index coverage mismatch: missing={missing}, extra={extra}"
        )

    conditional = any(
        manifest["status"]
        == "SHARD_P97_EUCLIDEAN_GAUGE_UNSAT_VERIFIED"
        for _, manifest in replayed
    )
    status = (
        "P97_EUCLIDEAN_GAUGE_SHARD_COVERAGE_UNSAT_VERIFIED"
        if conditional
        else "STRUCTURAL_SHARD_COVERAGE_UNSAT_VERIFIED"
    )
    unsigned_coverage = {
        "schema": SHARD_COVERAGE_SCHEMA,
        "status": status,
        "depth": depth,
        "shard_count": 1 << depth,
        "provenance_sha256": _sha256_value(common_provenance),
        "shards": [
            {
                "index": index,
                "directory": str(directory),
                "literals": manifest["configuration"]["shard"]["literals"],
                "status": manifest["status"],
                "manifest_sha256": manifest["manifest_sha256"],
                "base_cnf_sha256": manifest["artifact_hashes"]["base.cnf"],
                "terminal_cnf_sha256": manifest["artifact_hashes"][
                    "terminal.cnf"
                ],
                "terminal_drat_sha256": manifest["artifact_hashes"][
                    "terminal.drat"
                ],
            }
            for index, (directory, manifest) in sorted(by_index.items())
        ],
        "result_claim": (
            "all canonical Boolean shards are covered by independently "
            "replayed and DRAT-rechecked shard-local terminal proofs"
        ),
        "trust_boundary": (
            "coverage composition and provenance comparison are checked by "
            "this Python verifier; the aggregate is not Lean-kernel-checked"
        ),
    }
    return {
        **unsigned_coverage,
        "coverage_sha256": _sha256_value(unsigned_coverage),
    }


def _clause_false(
    clause: Sequence[int], assignment: Mapping[int, bool]
) -> None:
    if any(
        assignment[literal] if literal > 0 else not assignment[-literal]
        for literal in clause
    ):
        raise StructuralCegarError("blocking clause is not false in current assignment")


def _parse_args(argv: Sequence[str] | None = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--out", type=Path, default=DEFAULT_OUT)
    parser.add_argument("--timeout", type=int, default=300)
    parser.add_argument("--learned-core-limit", type=int, default=1000)
    parser.add_argument("--survivor-limit", type=int, default=100)
    parser.add_argument("--workers", type=int, default=1)
    parser.add_argument(
        "--parallel-mode",
        choices=PARALLEL_MODES,
        default="sequential",
        help="opt in to deterministic local cube batching",
    )
    parser.add_argument("--cube-depth", type=int, default=4)
    parser.add_argument("--shard-depth", type=int)
    parser.add_argument("--shard-index", type=int)
    parser.add_argument(
        "--verify-shards",
        type=Path,
        nargs="+",
        help=(
            "replay, DRAT-recheck, and aggregate a complete canonical set of "
            "fixed-shard output directories"
        ),
    )
    parser.add_argument(
        "--cube-artifact-mode",
        choices=CUBE_ARTIFACT_MODES,
        default="full",
        help=(
            "full retains per-cube CNF and unverified DRAT artifacts; compact "
            "retains hashed plans/results and regenerates CNFs during replay"
        ),
    )
    parser.add_argument("--bootstrap-results", type=Path, default=DEFAULT_BOOTSTRAP)
    parser.add_argument("--no-bootstrap", action="store_true")
    parser.add_argument(
        "--algebraic-bootstrap",
        type=Path,
        action="append",
        default=None,
        help=(
            "repeat for each ordered typed exact certificate bank; "
            "the default is the old two-system bank followed by the new "
            "three-system unit bank and the real-distinctness ideal-membership "
            "and 32-branch equilateral-shell banks"
        ),
    )
    parser.add_argument("--no-algebraic-bootstrap", action="store_true")
    parser.add_argument("--resume", action="store_true")
    parser.add_argument(
        "--projected-static-v2",
        action="store_true",
        help=(
            "opt in to blocker projection, static DUAL2, and the n=10 "
            "counterexample_card_ge_ten S-MINCUT family"
        ),
    )
    parser.add_argument("--max-new-raw", type=int)
    args = parser.parse_args(argv)
    if args.learned_core_limit < 1000:
        parser.error("--learned-core-limit must be at least 1000")
    if (args.shard_depth is None) != (args.shard_index is None):
        parser.error("--shard-depth and --shard-index must be provided together")
    if args.verify_shards is not None and args.shard_depth is not None:
        parser.error("--verify-shards cannot be combined with shard run options")
    return args


def main() -> int:
    args = _parse_args()
    if args.verify_shards is not None:
        coverage = verify_shard_coverage(args.verify_shards)
        print(json.dumps(coverage, indent=2, sort_keys=True))
        return 0
    manifest = run_driver(
        args.out,
        timeout_s=args.timeout,
        learned_core_limit=args.learned_core_limit,
        survivor_limit=args.survivor_limit,
        workers=args.workers,
        parallel_mode=args.parallel_mode,
        cube_depth=args.cube_depth,
        cube_artifact_mode=args.cube_artifact_mode,
        shard_depth=args.shard_depth,
        shard_index=args.shard_index,
        bootstrap_results=(
            None if args.no_bootstrap else args.bootstrap_results
        ),
        algebraic_bootstrap=(
            ()
            if args.no_algebraic_bootstrap
            else (
                DEFAULT_ALGEBRAIC_BOOTSTRAPS
                if args.algebraic_bootstrap is None
                else tuple(args.algebraic_bootstrap)
            )
        ),
        projected_static_v2=args.projected_static_v2,
        resume=args.resume,
        max_new_raw=args.max_new_raw,
    )
    print(json.dumps(manifest, indent=2, sort_keys=True))
    return 0 if manifest["status"] != "UNKNOWN" else 2


if __name__ == "__main__":
    raise SystemExit(main())
