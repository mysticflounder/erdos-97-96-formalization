"""PIQD-only GF(32003) route prefilter for the adaptive equality core.

The four target queries run ``slimgb`` and ``std`` on each of the two
characteristic-zero producer gauges.  Results are finite-field diagnostics
used only to select a later route; every mathematical and promotion claim is
false.
"""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import stat
import urllib.parse
import uuid
from collections.abc import Callable, Mapping, Sequence
from dataclasses import dataclass
from datetime import UTC, datetime
from pathlib import Path
from typing import Any

from census.card_head import (
    exactfive_hard_source_swap_adaptive_equality_core_piqd as char0,
)
from census.global_confinement import piqd_singular_backend as singular_backend

LANE_ID = "exactfive-hard-source-swap-adaptive-equality-core-modular-prefilter-20260903"
RUN_ID = "run-0001"
REPOSITORY_ROOT = Path(__file__).resolve().parents[2]
RUN_ROOT = REPOSITORY_ROOT / "scratch" / "runs" / LANE_ID / RUN_ID
CHECKPOINT_PATH = (
    REPOSITORY_ROOT / ".codex" / "worktree-checkpoints" / f"{LANE_ID}.json"
)
SPEC_PATH = (
    REPOSITORY_ROOT
    / "docs"
    / "specs"
    / "p97-exactfive-hard-source-swap-adaptive-equality-core-modular-prefilter-v1.md"
)
RUNNER_PATH = (
    REPOSITORY_ROOT
    / "scripts"
    / "run_exactfive_hard_source_swap_adaptive_equality_core_modular_prefilter_piqd.py"
)
PRIOR_ROOT = REPOSITORY_ROOT / "scratch" / "runs" / char0.LANE_ID / char0.RUN_ID
PRIOR_MANIFEST_PATH = PRIOR_ROOT / "run_manifest.json"
PRIOR_LAUNCH_PATH = PRIOR_ROOT / "events" / "launch.json"
PRIOR_TERMINAL_PATH = PRIOR_ROOT / "events" / "terminal.json"
PRIOR_SUMMARY_PATH = (
    REPOSITORY_ROOT
    / "docs"
    / "computation"
    / "exactfive-hard-source-swap-adaptive-equality-core-20260903"
    / "run-0001-summary.json"
)
PRIOR_SPEC_PATH = char0.SPEC_PATH

PROFILE_INDEX = char0.PROFILE_INDEX
PROFILE_SHA256 = char0.PROFILE_SHA256
FIELD = 32_003
ORDERING = "dp"
BASIS_ALGORITHMS = ("slimgb", "std")
RUN_MANIFEST_SCHEMA = "worktree-run-manifest/v1"
LAUNCH_SCHEMA = (
    "p97-exactfive-hard-source-swap-adaptive-equality-core-modular-prefilter-launch/v1"
)
TERMINAL_SCHEMA = (
    "p97-exactfive-hard-source-swap-adaptive-equality-core-modular-prefilter-result/v1"
)
SOURCE_CONTEXT_SCHEMA = (
    "p97-exactfive-hard-source-swap-adaptive-equality-core-modular-prefilter-query/v1"
)
PRODUCER_VERSION = (
    "p97-exactfive-hard-source-swap-adaptive-equality-core-modular-prefilter/v1"
)
PIQD_PROJECT = "erdos-97-96-formalization/exactfive-adaptive-modular-prefilter"
PIQD_SOURCE = (
    "census/card_head/"
    "exactfive_hard_source_swap_adaptive_equality_core_modular_prefilter_piqd.py"
)
MARKER_BEGIN = "P97_MODULAR_PREFILTER_RESULT_BEGIN"
MARKER_END = "P97_MODULAR_PREFILTER_RESULT_END"
CONTROL_KEYS = (
    "control-unit-linear",
    "control-nonunit-linear",
    "control-unit-distance",
    "control-nonunit-distance",
)
GAUGES = ("z3", "cvc5")
TARGET_KEYS = tuple(
    f"target-gauge-{gauge}-{algorithm}"
    for gauge in GAUGES
    for algorithm in BASIS_ALGORITHMS
)
QUERY_KEYS = (*CONTROL_KEYS, *TARGET_KEYS)
REQUEST_NAMESPACE = uuid.UUID("14acbba7-b53f-5fd2-94d4-42b3b2d7e503")
EXPECTED_PRIOR_HASHES = {
    "producer_source_file": "a4d910cda4f43b26e726f2a7a10e16fbe4e0f5965f4abdccc7b147961d99585e",
    "producer_spec_file": "78a980b346cadb7448d00329e219db250715f75cf6acd995062fd1c085b28ecb",
    "run_manifest_file": "b0561b77ab463275a3ba9dae17df45a001f95fb6de1f0d1c26a9eb9fb07cc6e5",
    "run_manifest_self": "f296d49688c4563b1f1b81214e87229dfcd288db63bba59ad1cb3958f23451b7",
    "launch_file": "f465d05246a2dea90e5065f2357689df12c7b1bf4877d4175544f302d456dce2",
    "launch_self": "d958216f456f8589b9298215bbe7f98ba96f58b61ec116367a8634172d227f6e",
    "terminal_file": "0ee31efc5b4cbce0dcaf45e12a2ca9f0acc26d92498b4b998f0ff0669a18ecda",
    "terminal_self": "faf1ecce822e88542413e0717fc6ff9d0d4ab4610ac492a1edb070d30eed578b",
    "durable_summary_file": "649bdec367d148609c2de4ff71c15f0f327ec2c08abc392e56183ad9118546a6",
    "durable_summary_self": "1a5537d74c7a6c025d0e3b789adfc0bd3e49b72ee85af1ed3f212df51ed7b98f",
}
FALSE_CLAIMS = {
    "mathematical_verdict": False,
    "qq_conclusion": False,
    "complex_infeasibility_theorem": False,
    "real_feasibility": False,
    "source_realization": False,
    "source_elimination": False,
    "lean_statement": False,
    "lean_proof": False,
    "promotion": False,
    "theorem": False,
}
OMITTED_LEDGER = {
    "signed_area_inequalities": {"included": False, "source_count": 165},
    "radius_disequality": {"included": False, "source_count": 1},
    "source_strict_inequality": {"included": False, "source_count": 1},
    "distinctness_saturation": {"included": False, "source_count": 0},
    "elimination_order": {"included": False, "source_count": 0},
    "source_realization_claim": {"included": False, "source_count": 0},
}
_CHECKPOINT_OWNED_PATHS = [
    f".codex/worktree-checkpoints/{LANE_ID}.json",
    "census/card_head/exactfive_hard_source_swap_adaptive_equality_core_modular_prefilter_piqd.py",
    "census/card_head/tests/test_exactfive_hard_source_swap_adaptive_equality_core_modular_prefilter_piqd.py",
    "docs/audits/2026-09-03-rigid221-exactfive-hard-source-swap-adaptive-equality-core-modular-prefilter-plan.md",
    "docs/specs/p97-exactfive-hard-source-swap-adaptive-equality-core-modular-prefilter-v1.md",
    "scripts/run_exactfive_hard_source_swap_adaptive_equality_core_modular_prefilter_piqd.py",
]


class ModularPrefilterError(RuntimeError):
    """The modular prefilter failed closed."""


@dataclass(frozen=True)
class PreparedQuery:
    key: str
    kind: str
    expected: str | None
    gauge_index: int | None
    algorithm: str
    variables: tuple[str, ...]
    polynomials: tuple[str, ...]
    script: str
    source_context: dict[str, Any]
    request_id: str


def _sha(payload: bytes) -> str:
    return hashlib.sha256(payload).hexdigest()


def _canonical(value: object) -> bytes:
    try:
        return json.dumps(
            value,
            sort_keys=True,
            separators=(",", ":"),
            ensure_ascii=True,
            allow_nan=False,
        ).encode("ascii")
    except (TypeError, ValueError, UnicodeEncodeError) as exc:
        raise ModularPrefilterError("value is not canonical ASCII JSON") from exc


def _json(value: object) -> bytes:
    return _canonical(value) + b"\n"


def _self_hash(value: Mapping[str, Any], field: str) -> str:
    return _sha(_canonical({key: item for key, item in value.items() if key != field}))


def _utc_now() -> str:
    return datetime.now(UTC).replace(microsecond=0).isoformat().replace("+00:00", "Z")


def _read_regular(path: Path, limit: int = 96 * 1024 * 1024) -> bytes:
    try:
        info = path.lstat()
    except OSError as exc:
        raise ModularPrefilterError(f"required artifact is absent: {path}") from exc
    if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1 or info.st_size > limit:
        raise ModularPrefilterError(f"unsafe regular artifact: {path}")
    payload = path.read_bytes()
    if len(payload) != info.st_size:
        raise ModularPrefilterError(f"artifact changed while reading: {path}")
    return payload


def _strict_json(payload: bytes, where: str) -> dict[str, Any]:
    def unique(pairs: list[tuple[str, Any]]) -> dict[str, Any]:
        result: dict[str, Any] = {}
        for key, value in pairs:
            if key in result:
                raise ValueError(f"duplicate JSON key: {key}")
            result[key] = value
        return result

    try:
        value = json.loads(
            payload.decode("utf-8", errors="strict"),
            parse_constant=lambda token: (_ for _ in ()).throw(ValueError(token)),
            object_pairs_hook=unique,
        )
    except (UnicodeDecodeError, json.JSONDecodeError, ValueError) as exc:
        raise ModularPrefilterError(f"{where} is not strict JSON") from exc
    if type(value) is not dict:
        raise ModularPrefilterError(f"{where} is not a JSON object")
    return value


def _repo_path(path: Path) -> str:
    try:
        return path.resolve().relative_to(REPOSITORY_ROOT).as_posix()
    except ValueError as exc:
        raise ModularPrefilterError("governing path escaped the repository") from exc


def _file_record(path: Path) -> dict[str, Any]:
    payload = _read_regular(path)
    return {"path": _repo_path(path), "bytes": len(payload), "sha256": _sha(payload)}


def _source_digest_map(paths: Sequence[Path]) -> dict[str, str]:
    return dict(sorted((_repo_path(path), _sha(_read_regular(path))) for path in paths))


def _load_checkpoint() -> dict[str, Any]:
    checkpoint = _strict_json(_read_regular(CHECKPOINT_PATH), "lane checkpoint")
    expected_keys = {
        "schema",
        "lane_id",
        "owner",
        "base_head",
        "owned_paths",
        "generated_roots",
        "durable_paths",
        "created_utc",
        "manifest_sha256",
    }
    if (
        set(checkpoint) != expected_keys
        or checkpoint.get("schema") != "worktree-lane-checkpoint/v1"
        or checkpoint.get("lane_id") != LANE_ID
        or checkpoint.get("owner") != "codex-rigid221"
        or checkpoint.get("base_head") != "24f982d5e1d56525719cc6b499e044451ea921ac"
        or checkpoint.get("owned_paths") != _CHECKPOINT_OWNED_PATHS
        or checkpoint.get("generated_roots") != [f"scratch/runs/{LANE_ID}/{RUN_ID}"]
        or checkpoint.get("durable_paths") != []
        or type(checkpoint.get("created_utc")) is not str
        or re.fullmatch(
            r"\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}Z", checkpoint["created_utc"]
        )
        is None
        or checkpoint.get("manifest_sha256")
        != _self_hash(checkpoint, "manifest_sha256")
    ):
        raise ModularPrefilterError(
            "lane checkpoint is unauthenticated or does not govern this run"
        )
    return checkpoint


def _expected_run_manifest(created_utc: str) -> dict[str, Any]:
    checkpoint = _load_checkpoint()
    sources = _source_digest_map(
        (
            Path(__file__),
            RUNNER_PATH,
            Path(char0.__file__),
            Path(singular_backend.__file__),
        )
    )
    inputs = _source_digest_map(
        (
            CHECKPOINT_PATH,
            SPEC_PATH,
            PRIOR_SPEC_PATH,
            PRIOR_MANIFEST_PATH,
            PRIOR_LAUNCH_PATH,
            PRIOR_TERMINAL_PATH,
            PRIOR_SUMMARY_PATH,
        )
    )
    manifest = {
        "schema": RUN_MANIFEST_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "root": f"scratch/runs/{LANE_ID}/{RUN_ID}",
        "owner": checkpoint["owner"],
        "base_head": checkpoint["base_head"],
        "output_classes": ["artifacts", "events", "tmp"],
        "source_digests": sources,
        "input_digests": inputs,
        "created_utc": created_utc,
    }
    manifest["manifest_sha256"] = _self_hash(manifest, "manifest_sha256")
    return manifest


def _create_once(path: Path, payload: bytes) -> None:
    descriptor: int | None = None
    try:
        descriptor = os.open(
            path,
            os.O_WRONLY | os.O_CREAT | os.O_EXCL | getattr(os, "O_NOFOLLOW", 0),
            0o400,
        )
        view = memoryview(payload)
        while view:
            written = os.write(descriptor, view)
            if written <= 0:
                raise ModularPrefilterError("short immutable artifact write")
            view = view[written:]
        os.fsync(descriptor)
    except FileExistsError as exc:
        raise ModularPrefilterError(
            f"immutable artifact already exists: {path}"
        ) from exc
    finally:
        if descriptor is not None:
            os.close(descriptor)


def _mkdir_chain_no_symlinks(path: Path) -> None:
    if path.is_relative_to(REPOSITORY_ROOT):
        anchor = REPOSITORY_ROOT
    else:
        anchor = path
        while not anchor.exists() and anchor != anchor.parent:
            anchor = anchor.parent
    anchor_info = anchor.lstat()
    if not stat.S_ISDIR(anchor_info.st_mode) or stat.S_ISLNK(anchor_info.st_mode):
        raise ModularPrefilterError("governed run parent is unsafe")
    current = anchor
    for part in path.relative_to(anchor).parts:
        current = current / part
        try:
            info = current.lstat()
        except FileNotFoundError:
            current.mkdir(mode=0o700)
            info = current.lstat()
        if not stat.S_ISDIR(info.st_mode) or stat.S_ISLNK(info.st_mode):
            raise ModularPrefilterError("governed run parent is unsafe")


def ensure_run_root() -> tuple[Path, dict[str, Any]]:
    manifest_path = RUN_ROOT / "run_manifest.json"
    if not RUN_ROOT.exists():
        _mkdir_chain_no_symlinks(RUN_ROOT)
        for name in ("artifacts", "events", "tmp"):
            (RUN_ROOT / name).mkdir(mode=0o700)
        _create_once(manifest_path, _json(_expected_run_manifest(_utc_now())))
    if not RUN_ROOT.is_dir() or RUN_ROOT.is_symlink():
        raise ModularPrefilterError("governed run root is unsafe")
    manifest = _strict_json(_read_regular(manifest_path), "run manifest")
    created = manifest.get("created_utc")
    if type(created) is not str or manifest != _expected_run_manifest(created):
        raise ModularPrefilterError("run manifest or governing digests drifted")
    if manifest_path.stat(follow_symlinks=False).st_mode & 0o222:
        raise ModularPrefilterError("run manifest is not immutable")
    if {entry.name for entry in RUN_ROOT.iterdir()} != {
        "run_manifest.json",
        "artifacts",
        "events",
        "tmp",
    }:
        raise ModularPrefilterError("governed run root contains an unbound entry")
    for name in ("artifacts", "events", "tmp"):
        path = RUN_ROOT / name
        if not path.is_dir() or path.is_symlink():
            raise ModularPrefilterError("run output class is unsafe")
    if tuple((RUN_ROOT / "tmp").iterdir()):
        raise ModularPrefilterError("governed tmp directory is not empty")
    events = tuple((RUN_ROOT / "events").iterdir())
    if any(
        entry.name not in {"launch.json", "terminal.json"}
        or entry.is_symlink()
        or not entry.is_file()
        or entry.stat(follow_symlinks=False).st_nlink != 1
        or entry.stat(follow_symlinks=False).st_mode & 0o222
        for entry in events
    ):
        raise ModularPrefilterError("events contain an unbound or unsafe entry")
    artifacts = tuple((RUN_ROOT / "artifacts").iterdir())
    if any(
        entry.name not in QUERY_KEYS or not entry.is_dir() or entry.is_symlink()
        for entry in artifacts
    ):
        raise ModularPrefilterError(
            "artifacts contain an unbound or unsafe query directory"
        )
    return RUN_ROOT, manifest


def revalidate_prior_char0_run() -> dict[str, Any]:
    """Revalidate the completed characteristic-zero run without transport."""

    records = {
        "producer_source": _file_record(Path(char0.__file__)),
        "producer_spec": _file_record(PRIOR_SPEC_PATH),
        "run_manifest": _file_record(PRIOR_MANIFEST_PATH),
        "launch": _file_record(PRIOR_LAUNCH_PATH),
        "terminal": _file_record(PRIOR_TERMINAL_PATH),
        "durable_summary": _file_record(PRIOR_SUMMARY_PATH),
    }
    file_expectations = {
        "producer_source": "producer_source_file",
        "producer_spec": "producer_spec_file",
        "run_manifest": "run_manifest_file",
        "launch": "launch_file",
        "terminal": "terminal_file",
        "durable_summary": "durable_summary_file",
    }
    if any(
        records[name]["sha256"] != EXPECTED_PRIOR_HASHES[expected]
        for name, expected in file_expectations.items()
    ):
        raise ModularPrefilterError("prior characteristic-zero file hash drifted")
    manifest = _strict_json(_read_regular(PRIOR_MANIFEST_PATH), "prior run manifest")
    launch = _strict_json(_read_regular(PRIOR_LAUNCH_PATH), "prior launch")
    terminal = _strict_json(_read_regular(PRIOR_TERMINAL_PATH), "prior terminal")
    summary = _strict_json(_read_regular(PRIOR_SUMMARY_PATH), "prior durable summary")
    if (
        manifest.get("schema") != char0.RUN_MANIFEST_SCHEMA
        or manifest.get("manifest_sha256") != EXPECTED_PRIOR_HASHES["run_manifest_self"]
        or manifest.get("manifest_sha256")
        != char0._self_hash(manifest, "manifest_sha256")
        or launch.get("schema") != char0.LAUNCH_SCHEMA
        or launch.get("launch_sha256") != EXPECTED_PRIOR_HASHES["launch_self"]
        or launch.get("launch_sha256") != char0._self_hash(launch, "launch_sha256")
        or terminal.get("schema") != char0.TERMINAL_SCHEMA
        or terminal.get("terminal_sha256") != EXPECTED_PRIOR_HASHES["terminal_self"]
        or terminal.get("terminal_sha256")
        != char0._self_hash(terminal, "terminal_sha256")
        or summary.get("schema")
        != "p97-exactfive-hard-source-swap-adaptive-equality-core-run-summary/v1"
        or summary.get("summary_sha256")
        != EXPECTED_PRIOR_HASHES["durable_summary_self"]
        or summary.get("summary_sha256") != char0._self_hash(summary, "summary_sha256")
    ):
        raise ModularPrefilterError("prior characteristic-zero self-hash drifted")
    source_core = char0.revalidate_prior_adaptive_run()

    def forbidden_runner(*_args: object, **_kwargs: object) -> object:
        raise ModularPrefilterError("prior completed replay attempted transport")

    try:
        replayed = char0.run_diagnostic(
            server=launch["server"],
            timeout_s=launch["timeout_seconds"],
            prior_revalidator=lambda: source_core,
            runner_factory=forbidden_runner,
        )
    except Exception as exc:
        raise ModularPrefilterError(
            f"prior characteristic-zero no-transport replay failed: {exc}"
        ) from exc
    controls = summary.get("controls")
    targets = summary.get("targets")
    completed = summary.get("completed_resume")
    summary_manifest = summary.get("run_manifest")
    summary_launch = summary.get("launch")
    summary_terminal = summary.get("terminal")
    if (
        replayed != terminal
        or launch.get("prior_adaptive") != source_core
        or launch.get("workers") != 1
        or launch.get("sequential") is not True
        or launch.get("local_fallback") is not False
        or terminal.get("status") != "TARGET_INCONCLUSIVE"
        or terminal.get("claims") != char0.FALSE_CLAIMS
        or summary.get("claims") != char0.FALSE_CLAIMS
        or type(controls) is not list
        or [
            (row.get("key"), row.get("expected"), row.get("verdict"))
            for row in controls
        ]
        != [
            ("control-unit-linear", "UNIT", "UNIT"),
            ("control-nonunit-linear", "NONUNIT", "NONUNIT"),
            ("control-unit-distance", "UNIT", "UNIT"),
            ("control-nonunit-distance", "NONUNIT", "NONUNIT"),
        ]
        or type(targets) is not list
        or [
            (row.get("key"), row.get("verdict"), row.get("run_status"))
            for row in targets
        ]
        != [
            ("target-gauge-z3", "TIMEOUT", "TIMED_OUT"),
            ("target-gauge-cvc5", "TIMEOUT", "TIMED_OUT"),
        ]
        or type(completed) is not dict
        or completed.get("status") != "PASSED_NO_TRANSPORT"
        or type(summary_manifest) is not dict
        or type(summary_launch) is not dict
        or type(summary_terminal) is not dict
        or summary_manifest.get("file_sha256") != records["run_manifest"]["sha256"]
        or summary_launch.get("file_sha256") != records["launch"]["sha256"]
        or summary_terminal.get("file_sha256") != records["terminal"]["sha256"]
    ):
        raise ModularPrefilterError(
            "prior durable summary does not bind the completed replay"
        )
    return {
        "profile_index": PROFILE_INDEX,
        "profile_sha256": PROFILE_SHA256,
        "files": records,
        "run_manifest_sha256": manifest["manifest_sha256"],
        "launch_sha256": launch["launch_sha256"],
        "terminal_sha256": terminal["terminal_sha256"],
        "durable_summary_sha256": summary["summary_sha256"],
        "source_core": source_core,
        "completed_no_transport_replay": True,
        "char0_status": terminal["status"],
    }


def singular_script(
    variables: Sequence[str], polynomials: Sequence[str], *, algorithm: str
) -> str:
    """Render one GF(32003), dp basis diagnostic."""

    if not variables or any(
        re.fullmatch(r"[A-Za-z_][A-Za-z0-9_]*", item) is None for item in variables
    ):
        raise ModularPrefilterError("ring variables are empty or malformed")
    if len(set(variables)) != len(variables):
        raise ModularPrefilterError("ring variables are repeated")
    if algorithm not in BASIS_ALGORITHMS:
        raise ModularPrefilterError("basis algorithm is outside the closed matrix")
    if not polynomials or any(
        type(poly) is not str or not poly for poly in polynomials
    ):
        raise ModularPrefilterError("ideal generators are empty or malformed")
    generators = ",\n  ".join(polynomials)
    return "\n".join(
        (
            f"ring r = {FIELD}, ({','.join(variables)}), {ORDERING};",
            f"ideal I = {generators};",
            f"ideal G = {algorithm}(I);",
            f'print("{MARKER_BEGIN}");',
            'print("basis_size " + string(size(G)));',
            "int d = dim(G);",
            'print("dim " + string(d));',
            'if (d == 0) { print("vdim " + string(vdim(G))); }',
            'print("reduce_one " + string(reduce(1,G)));',
            f'print("{MARKER_END}");',
            "quit;",
            "",
        )
    )


def parse_transcript(stdout: str) -> dict[str, int | str | None]:
    """Parse the complete marker transcript and cross-check its basis verdict."""

    if type(stdout) is not str:
        raise ModularPrefilterError("Singular stdout is not text")
    if not stdout.endswith("\n") or "\r" in stdout:
        raise ModularPrefilterError("malformed modular marker transcript")
    lines = stdout[:-1].split("\n")
    if len(lines) not in {5, 6} or lines[0] != MARKER_BEGIN or lines[-1] != MARKER_END:
        raise ModularPrefilterError("malformed modular marker transcript")
    payload = lines[1:-1]
    names = [line.split(" ", 1)[0] for line in payload]
    if names not in (
        ["basis_size", "dim", "reduce_one"],
        ["basis_size", "dim", "vdim", "reduce_one"],
    ):
        raise ModularPrefilterError("malformed modular marker fields")
    parsed: dict[str, int] = {}
    for line in payload:
        match = re.fullmatch(
            r"(basis_size|dim|vdim|reduce_one) (0|-?[1-9][0-9]*)", line
        )
        if match is None:
            raise ModularPrefilterError("malformed modular marker value")
        token = match.group(2)
        if len(token.removeprefix("-")) > 19:
            raise ModularPrefilterError("modular marker integer exceeds its bound")
        try:
            value = int(token)
        except ValueError as exc:
            raise ModularPrefilterError("malformed modular marker integer") from exc
        if abs(value) > singular_backend.I64_MAX:
            raise ModularPrefilterError("modular marker integer exceeds its bound")
        parsed[match.group(1)] = value
    basis_size = parsed["basis_size"]
    dimension = parsed["dim"]
    vdimension = parsed.get("vdim")
    remainder = parsed["reduce_one"]
    if (
        basis_size < 1
        or dimension < -1
        or (dimension == 0) != (vdimension is not None)
        or (vdimension is not None and vdimension < 1)
        or remainder not in {0, 1}
    ):
        raise ModularPrefilterError("modular marker invariants failed")
    if remainder == 0:
        if dimension != -1 or vdimension is not None or basis_size != 1:
            raise ModularPrefilterError("unit-basis marker fields disagree")
        verdict = "UNIT"
    else:
        if dimension < 0:
            raise ModularPrefilterError("nonunit-basis marker fields disagree")
        verdict = "NONUNIT"
    return {
        "basis_size": basis_size,
        "dim": dimension,
        "vdim": vdimension,
        "reduce_one": remainder,
        "basis_verdict": verdict,
    }


def _control_data(key: str) -> tuple[tuple[str, ...], tuple[str, ...], str]:
    cases = {
        "control-unit-linear": (("z",), ("z", "z-1"), "UNIT"),
        "control-nonunit-linear": (("z",), ("z^2-1",), "NONUNIT"),
        "control-unit-distance": (("x", "y"), ("x^2+y^2", "x^2+y^2-1"), "UNIT"),
        "control-nonunit-distance": (("x", "y"), ("x^2+y^2-1",), "NONUNIT"),
    }
    try:
        return cases[key]
    except KeyError as exc:
        raise ModularPrefilterError(f"unknown control: {key}") from exc


def _context(
    *,
    prior: Mapping[str, Any],
    key: str,
    kind: str,
    expected: str | None,
    gauge_index: int | None,
    algorithm: str,
    variables: tuple[str, ...],
    polynomials: tuple[str, ...],
    script: str,
    timeout_s: int,
    char0_context: Mapping[str, Any] | None,
) -> dict[str, Any]:
    return {
        "schema": SOURCE_CONTEXT_SCHEMA,
        "producer_version": PRODUCER_VERSION,
        "query": {
            "key": key,
            "kind": kind,
            "expected": expected,
            "gauge_index": gauge_index,
            "basis_algorithm": algorithm,
        },
        "prior_char0": dict(prior),
        "char0_target_context": None if char0_context is None else dict(char0_context),
        "coefficient_field": {"kind": "prime_field", "characteristic": FIELD},
        "monomial_order": ORDERING,
        "variables": list(variables),
        "variable_count": len(variables),
        "ordered_polynomials": list(polynomials),
        "ordered_polynomials_sha256": _sha(_canonical(list(polynomials))),
        "polynomial_count": len(polynomials),
        "script_sha256": _sha(script.encode("utf-8")),
        "omitted": OMITTED_LEDGER,
        "execution_profile": {
            "backend": "piqd-singular",
            "solver": "Singular",
            "sequential": True,
            "workers": 1,
            "local_fallback": False,
            "timeout_seconds": timeout_s,
        },
        "claims": FALSE_CLAIMS,
    }


def build_control_query(
    prior: Mapping[str, Any], key: str, *, timeout_s: int
) -> PreparedQuery:
    variables, polynomials, expected = _control_data(key)
    algorithm = "slimgb"
    script = singular_script(variables, polynomials, algorithm=algorithm)
    context = _context(
        prior=prior,
        key=key,
        kind="control",
        expected=expected,
        gauge_index=None,
        algorithm=algorithm,
        variables=variables,
        polynomials=polynomials,
        script=script,
        timeout_s=timeout_s,
        char0_context=None,
    )
    request_id = str(uuid.uuid5(REQUEST_NAMESPACE, _sha(_canonical(context))))
    return PreparedQuery(
        key,
        "control",
        expected,
        None,
        algorithm,
        variables,
        polynomials,
        script,
        context,
        request_id,
    )


def build_target_query(
    prior: Mapping[str, Any], gauge_index: int, algorithm: str, *, timeout_s: int
) -> PreparedQuery:
    if gauge_index not in (0, 1) or algorithm not in BASIS_ALGORITHMS:
        raise ModularPrefilterError("target lies outside the fixed gauge/basis matrix")
    char0_query = char0.build_target_query(
        prior["source_core"], gauge_index, timeout_s=timeout_s
    )
    variables = char0_query.variables
    polynomials = char0_query.polynomials
    if len(variables) != 18 or len(polynomials) != 13:
        raise ModularPrefilterError(
            "target is not the 18-variable/13-polynomial system"
        )
    key = f"target-gauge-{GAUGES[gauge_index]}-{algorithm}"
    script = singular_script(variables, polynomials, algorithm=algorithm)
    context = _context(
        prior=prior,
        key=key,
        kind="target",
        expected=None,
        gauge_index=gauge_index,
        algorithm=algorithm,
        variables=variables,
        polynomials=polynomials,
        script=script,
        timeout_s=timeout_s,
        char0_context=char0_query.source_context,
    )
    request_id = str(uuid.uuid5(REQUEST_NAMESPACE, _sha(_canonical(context))))
    return PreparedQuery(
        key,
        "target",
        None,
        gauge_index,
        algorithm,
        variables,
        polynomials,
        script,
        context,
        request_id,
    )


def prepare_queries(
    prior: Mapping[str, Any], *, timeout_s: int
) -> tuple[PreparedQuery, ...]:
    controls = tuple(
        build_control_query(prior, key, timeout_s=timeout_s) for key in CONTROL_KEYS
    )
    targets = tuple(
        build_target_query(prior, gauge, algorithm, timeout_s=timeout_s)
        for gauge in range(2)
        for algorithm in BASIS_ALGORITHMS
    )
    queries = (*controls, *targets)
    if [query.key for query in queries] != list(QUERY_KEYS):
        raise ModularPrefilterError("query matrix drifted")
    for gauge in range(2):
        left, right = targets[2 * gauge : 2 * gauge + 2]
        if (left.variables, left.polynomials) != (right.variables, right.polynomials):
            raise ModularPrefilterError(
                "basis algorithms do not share one gauge system"
            )
    left_context = targets[0].source_context["char0_target_context"]
    right_context = targets[2].source_context["char0_target_context"]
    if (
        left_context["order_independent_polynomial_template"]
        != right_context["order_independent_polynomial_template"]
    ):
        raise ModularPrefilterError(
            "gauges do not share the characteristic-zero template"
        )
    return queries


def _execution_fields(
    result: singular_backend.SingularExecutionResult, wall_ms: int
) -> dict[str, Any]:
    return {
        "run_id": result.run_id,
        "run_status": result.run_status,
        "exit_code": result.exit_code,
        "wall_ms": wall_ms,
        "request_sha256": result.request_sha256,
        "result_sha256": result.result_sha256,
        "script_sha256": result.script_sha256,
        "stdout_sha256": result.stdout_sha256,
        "stderr_sha256": result.stderr_sha256,
        "source_context_sha256": result.source_context_sha256,
        "receipt_sha256": result.receipt_sha256,
        "artifact_sha256": result.artifact_sha256,
        "replayed": result.replayed,
    }


def _validate_query_artifact(query: PreparedQuery, directory: Path) -> dict[str, Any]:
    try:
        result = singular_backend.validate_artifact_directory(directory)
    except singular_backend.PiqdSingularCustodyError as exc:
        raise ModularPrefilterError(
            f"{query.key} artifact custody failed: {exc}"
        ) from exc
    if _read_regular(result.script_path) != query.script.encode("utf-8"):
        raise ModularPrefilterError(f"{query.key} script differs from current producer")
    manifest = _strict_json(
        _read_regular(result.manifest_path), f"{query.key} backend manifest"
    )
    request = manifest.get("request")
    receipt = manifest.get("receipt")
    if (
        manifest.get("source_context") != query.source_context
        or type(request) is not dict
        or request.get("request_id") != query.request_id
        or request.get("project") != PIQD_PROJECT
        or request.get("timeout_s")
        != query.source_context["execution_profile"]["timeout_seconds"]
        or manifest.get("source") != PIQD_SOURCE
        or type(receipt) is not dict
    ):
        raise ModularPrefilterError(f"{query.key} request or source context drifted")
    if (
        receipt.get("stdout_truncated") is not False
        or receipt.get("stderr_truncated") is not False
    ):
        raise ModularPrefilterError(f"{query.key} contains a truncated Singular stream")
    wall_ms = receipt.get("wall_ms")
    if type(wall_ms) is not int or wall_ms < 0:
        raise ModularPrefilterError(f"{query.key} lacks authenticated wall time")
    if result.stdout is None or result.stderr is None:
        raise ModularPrefilterError(f"{query.key} lacks exact Singular streams")
    if result.stderr != b"":
        raise ModularPrefilterError(f"{query.key} Singular stderr is not empty")
    if result.run_status == "TIMED_OUT":
        if result.stdout != b"":
            raise ModularPrefilterError(f"{query.key} timeout has a partial transcript")
        diagnostic = "MOD_TIMEOUT"
        parsed: dict[str, int | str | None] = {
            "basis_size": None,
            "dim": None,
            "vdim": None,
            "reduce_one": None,
            "basis_verdict": None,
        }
    else:
        if result.run_status != "RAN" or result.exit_code != 0:
            raise ModularPrefilterError(
                f"{query.key} did not produce a successful RAN receipt"
            )
        try:
            text = result.stdout.decode("utf-8", errors="strict")
        except UnicodeDecodeError as exc:
            raise ModularPrefilterError(
                f"{query.key} stdout is not strict UTF-8"
            ) from exc
        parsed = parse_transcript(text)
        raw = parsed["basis_verdict"]
        assert raw in {"UNIT", "NONUNIT"}
        diagnostic = raw if query.kind == "control" else f"MOD_{raw}"
    record = {
        "key": query.key,
        "kind": query.kind,
        "expected": query.expected,
        "gauge_index": query.gauge_index,
        "basis_algorithm": query.algorithm,
        "diagnostic": diagnostic,
        "basis_size": parsed["basis_size"],
        "dim": parsed["dim"],
        "vdim": parsed["vdim"],
        "reduce_one": parsed["reduce_one"],
        "request_id": query.request_id,
        "variables": len(query.variables),
        "polynomials": len(query.polynomials),
        "script_sha256": _sha(query.script.encode("utf-8")),
        "source_context_sha256": _sha(_canonical(query.source_context)),
        "artifact_directory": f"artifacts/{query.key}",
        "execution": _execution_fields(result, wall_ms),
    }
    record["query_result_sha256"] = _self_hash(record, "query_result_sha256")
    return record


def _execute_or_resume(
    query: PreparedQuery,
    directory: Path,
    runner: singular_backend.PiqdSingularRunner | None,
) -> dict[str, Any]:
    if directory.exists():
        return _validate_query_artifact(query, directory)
    if runner is None:
        raise ModularPrefilterError(f"completed resume is missing {query.key}")
    try:
        returned = runner.execute(
            query.script.encode("utf-8"),
            source=PIQD_SOURCE,
            project=PIQD_PROJECT,
            request_id=query.request_id,
            timeout_s=query.source_context["execution_profile"]["timeout_seconds"],
            output_directory=directory,
            source_context=query.source_context,
        )
    except singular_backend.PiqdSingularCustodyError as exc:
        raise ModularPrefilterError(
            f"{query.key} PIQD Singular execution failed: {exc}"
        ) from exc
    replayed = _validate_query_artifact(query, directory)
    if not isinstance(returned, singular_backend.SingularExecutionResult):
        raise ModularPrefilterError(
            f"{query.key} runner returned the wrong result type"
        )
    if (
        _execution_fields(returned, replayed["execution"]["wall_ms"])
        != replayed["execution"]
    ):
        raise ModularPrefilterError(
            f"{query.key} returned execution differs from local replay"
        )
    return replayed


def _select_gauges(targets: Sequence[Mapping[str, Any]]) -> list[dict[str, Any]]:
    selections: list[dict[str, Any]] = []
    for gauge_index, gauge in enumerate(GAUGES):
        rows = list(targets[2 * gauge_index : 2 * gauge_index + 2])
        completed = [row for row in rows if row.get("diagnostic") != "MOD_TIMEOUT"]
        diagnostics = {row.get("diagnostic") for row in completed}
        if len(diagnostics) > 1:
            raise ModularPrefilterError(f"basis verdict disagreement for gauge {gauge}")
        selected = min(
            completed,
            key=lambda row: (
                row["execution"]["wall_ms"],
                row["basis_size"],
                row["basis_algorithm"],
            ),
            default=None,
        )
        selections.append(
            {
                "gauge_index": gauge_index,
                "gauge": gauge,
                "selected_key": None if selected is None else selected["key"],
                "basis_algorithm": None
                if selected is None
                else selected["basis_algorithm"],
                "diagnostic": None if selected is None else selected["diagnostic"],
                "wall_ms": None
                if selected is None
                else selected["execution"]["wall_ms"],
                "basis_size": None if selected is None else selected["basis_size"],
                "selection_rule": "completed then lower wall_ms then smaller basis_size",
            }
        )
    return selections


def _check_basis_agreement(rows: Sequence[Mapping[str, Any]], gauge: str) -> None:
    completed = [row for row in rows if row.get("diagnostic") != "MOD_TIMEOUT"]
    if len({row.get("diagnostic") for row in completed}) > 1:
        raise ModularPrefilterError(f"basis verdict disagreement for gauge {gauge}")


def _launch_record(
    root: Path,
    prior: Mapping[str, Any],
    queries: Sequence[PreparedQuery],
    *,
    server: str,
    timeout_s: int,
) -> dict[str, Any]:
    launch = {
        "schema": LAUNCH_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "run_manifest_sha256": _sha(_read_regular(root / "run_manifest.json")),
        "server": server,
        "timeout_seconds": timeout_s,
        "workers": 1,
        "sequential": True,
        "local_fallback": False,
        "coefficient_field": FIELD,
        "monomial_order": ORDERING,
        "prior_char0": dict(prior),
        "query_plan": [
            {
                "key": query.key,
                "kind": query.kind,
                "expected": query.expected,
                "gauge_index": query.gauge_index,
                "basis_algorithm": query.algorithm,
                "request_id": query.request_id,
                "script_sha256": _sha(query.script.encode("utf-8")),
                "source_context_sha256": _sha(_canonical(query.source_context)),
            }
            for query in queries
        ],
        "claims": FALSE_CLAIMS,
    }
    launch["launch_sha256"] = _self_hash(launch, "launch_sha256")
    return launch


def _terminal_record(
    launch: Mapping[str, Any],
    controls: Sequence[Mapping[str, Any]],
    targets: Sequence[Mapping[str, Any]],
    selections: Sequence[Mapping[str, Any]],
) -> dict[str, Any]:
    selected = [row for row in selections if row["selected_key"] is not None]
    if not selected:
        status = "MOD_ALL_TIMEOUT"
    elif len(selected) < 2:
        status = "MOD_PARTIAL_TIMEOUT"
    elif selected[0]["diagnostic"] == selected[1]["diagnostic"] == "MOD_UNIT":
        status = "MOD_BOTH_GAUGES_UNIT"
    elif selected[0]["diagnostic"] == selected[1]["diagnostic"] == "MOD_NONUNIT":
        status = "MOD_BOTH_GAUGES_NONUNIT"
    else:
        status = "MOD_GAUGE_DISAGREEMENT"
    terminal = {
        "schema": TERMINAL_SCHEMA,
        "lane_id": LANE_ID,
        "run_id": RUN_ID,
        "run_manifest_sha256": launch["run_manifest_sha256"],
        "launch_sha256": launch["launch_sha256"],
        "status": status,
        "controls": list(controls),
        "targets": list(targets),
        "gauge_selections": list(selections),
        "finite_field_diagnostic_only": True,
        "claim_boundary": "GF(32003) basis-route prefilter for the fixed equality ideals",
        "claims": FALSE_CLAIMS,
    }
    terminal["terminal_sha256"] = _self_hash(terminal, "terminal_sha256")
    return terminal


def _validate_terminal(value: object) -> dict[str, Any]:
    if type(value) is not dict:
        raise ModularPrefilterError("terminal record is not an object")
    if (
        value.get("schema") != TERMINAL_SCHEMA
        or value.get("claims") != FALSE_CLAIMS
        or value.get("finite_field_diagnostic_only") is not True
        or value.get("status")
        not in {
            "MOD_ALL_TIMEOUT",
            "MOD_PARTIAL_TIMEOUT",
            "MOD_BOTH_GAUGES_UNIT",
            "MOD_BOTH_GAUGES_NONUNIT",
            "MOD_GAUGE_DISAGREEMENT",
        }
        or value.get("terminal_sha256") != _self_hash(value, "terminal_sha256")
    ):
        raise ModularPrefilterError("terminal record is malformed")
    return dict(value)


def _validate_server(server: str) -> str:
    if type(server) is not str:
        raise ModularPrefilterError("PIQD server must be a string")
    parsed = urllib.parse.urlsplit(server)
    if (
        parsed.scheme not in {"http", "https"}
        or not parsed.netloc
        or parsed.username is not None
        or parsed.password is not None
        or parsed.query
        or parsed.fragment
    ):
        raise ModularPrefilterError("invalid PIQD server URL")
    return server.rstrip("/")


def run_diagnostic(
    *,
    server: str = "http://127.0.0.1:7272",
    timeout_s: int = 300,
    prior_revalidator: Callable[[], dict[str, Any]] = revalidate_prior_char0_run,
    runner_factory: Callable[..., singular_backend.PiqdSingularRunner] = (
        singular_backend.PiqdSingularRunner
    ),
) -> dict[str, Any]:
    """Execute or locally replay the fixed eight-query sequential lane."""

    server = _validate_server(server)
    if (
        type(timeout_s) is not int
        or type(timeout_s) is bool
        or not 1 <= timeout_s <= singular_backend.MAX_TIMEOUT_S
    ):
        raise ModularPrefilterError("timeout must be an integer in 1..86400 seconds")
    root, _manifest = ensure_run_root()
    prior = prior_revalidator()
    queries = prepare_queries(prior, timeout_s=timeout_s)
    launch = _launch_record(root, prior, queries, server=server, timeout_s=timeout_s)
    launch_path = root / "events" / "launch.json"
    terminal_path = root / "events" / "terminal.json"
    if terminal_path.exists() and not launch_path.exists():
        raise ModularPrefilterError(
            "terminal exists without its immutable launch record"
        )
    if launch_path.exists():
        launch_payload = _read_regular(launch_path)
        if (
            launch_payload != _json(launch)
            or _strict_json(launch_payload, "launch record") != launch
        ):
            raise ModularPrefilterError("launch record differs on resume")
    else:
        _create_once(launch_path, _json(launch))
    if terminal_path.exists():
        terminal_payload = _read_regular(terminal_path)
        stored = _validate_terminal(_strict_json(terminal_payload, "terminal record"))
        if terminal_payload != _json(stored):
            raise ModularPrefilterError(
                "terminal record is not canonical immutable JSON"
            )
        results = [
            _execute_or_resume(query, root / "artifacts" / query.key, None)
            for query in queries
        ]
        controls, targets = results[:4], results[4:]
        for query, result in zip(queries[:4], controls, strict=True):
            if result["diagnostic"] != query.expected:
                raise ModularPrefilterError(
                    f"control {query.key} expected {query.expected}, got {result['diagnostic']}"
                )
        selections = _select_gauges(targets)
        expected = _terminal_record(launch, controls, targets, selections)
        if stored != expected:
            raise ModularPrefilterError(
                "terminal record differs from complete local replay"
            )
        if {entry.name for entry in (root / "artifacts").iterdir()} != set(QUERY_KEYS):
            raise ModularPrefilterError(
                "completed artifact inventory is partial or unbound"
            )
        return stored

    runner = runner_factory(server, max_poll_s=float(timeout_s + 300))
    results: list[dict[str, Any]] = []
    for query in queries:
        result = _execute_or_resume(query, root / "artifacts" / query.key, runner)
        results.append(result)
        if query.kind == "control" and result["diagnostic"] != query.expected:
            raise ModularPrefilterError(
                f"control {query.key} expected {query.expected}, got {result['diagnostic']}"
            )
        if query.kind == "target" and query.algorithm == BASIS_ALGORITHMS[-1]:
            gauge_rows = results[-len(BASIS_ALGORITHMS) :]
            assert query.gauge_index is not None
            _check_basis_agreement(gauge_rows, GAUGES[query.gauge_index])
    controls, targets = results[:4], results[4:]
    selections = _select_gauges(targets)
    terminal = _terminal_record(launch, controls, targets, selections)
    _create_once(terminal_path, _json(terminal))
    stored = _validate_terminal(
        _strict_json(_read_regular(terminal_path), "terminal record")
    )
    if stored != terminal or {
        entry.name for entry in (root / "artifacts").iterdir()
    } != set(QUERY_KEYS):
        raise ModularPrefilterError("new terminal or artifact inventory failed replay")
    return stored


def main(argv: Sequence[str] | None = None) -> int:
    parser = argparse.ArgumentParser(allow_abbrev=False)
    parser.add_argument("--server", default="http://127.0.0.1:7272")
    parser.add_argument("--timeout", type=int, default=300)
    parser.add_argument("--verbose", action="store_true")
    args = parser.parse_args(argv)
    try:
        result = run_diagnostic(server=args.server, timeout_s=args.timeout)
    except (ModularPrefilterError, singular_backend.PiqdSingularCustodyError) as exc:
        print(f"error: {exc}", file=os.sys.stderr)
        return 1
    if args.verbose:
        print(json.dumps(result, sort_keys=True, separators=(",", ":")))
    return 0


__all__ = [
    "BASIS_ALGORITHMS",
    "CONTROL_KEYS",
    "FALSE_CLAIMS",
    "FIELD",
    "MARKER_BEGIN",
    "MARKER_END",
    "OMITTED_LEDGER",
    "QUERY_KEYS",
    "TARGET_KEYS",
    "ModularPrefilterError",
    "PreparedQuery",
    "build_control_query",
    "build_target_query",
    "parse_transcript",
    "prepare_queries",
    "revalidate_prior_char0_run",
    "run_diagnostic",
    "singular_script",
]


if __name__ == "__main__":
    raise SystemExit(main())
