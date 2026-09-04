from __future__ import annotations

import json
import subprocess
import sys
from pathlib import Path
from typing import Any

import pytest

from census.card_head import exactfive_opposed_turn_residual_named_core_piqd as lane
from census.p97_search import phase3_piqd_smt_source_adapter as adapter
from census.p97_search.tests import test_phase3_piqd_smt_source_adapter as adapter_test


@pytest.fixture(scope="module")
def parent() -> dict[str, Any]:
    return lane.authenticate_parent_run()


def _replace(path: Path, payload: bytes) -> None:
    path.chmod(0o600)
    path.write_bytes(payload)


def _rewrite_result(path: Path, result: dict[str, Any]) -> None:
    result["result_sha256"] = lane._self_hash(result, "result_sha256")
    _replace(path, lane._json(result))


def test_runner_bootstraps_repository_import_from_external_cwd(
    tmp_path: Path,
) -> None:
    completed = subprocess.run(
        [sys.executable, str(lane.RUNNER_PATH), "--help"],
        cwd=tmp_path,
        check=False,
        capture_output=True,
        text=True,
    )
    assert completed.returncode == 0
    assert "--init-only" in completed.stdout
    assert completed.stderr == ""


class GenericNamedPiqd(adapter_test.FakeCurrentPiqd):
    """Use the genuine adapter fixture with arbitrary readback terms."""

    def request_json(
        self,
        method: str,
        path: str,
        body: dict[str, object] | None = None,
    ) -> adapter.JsonResponse:
        if method == "POST" and path.endswith("/solve") and body is not None:
            original = json.loads(lane._canonical(body))
            adapted = dict(body)
            adapted["get_values"] = ["x"]
            response = super().request_json(method, path, adapted)
            session_id = path.split("/")[2]
            data = self.sessions[session_id]
            data["solve_request"] = original
            receipt = data["receipt"]
            if receipt is not None:
                receipt["get_values"] = list(original["get_values"])
                receipt["request_sha256"] = adapter_test._solve_request_sha(
                    data["journal"], original
                )
            return response
        return super().request_json(method, path, body)


def _genuine_tree(
    tmp_path: Path,
    prepared: lane.PreparedQuery,
    *,
    status: str = "UNSAT",
) -> tuple[Path, GenericNamedPiqd, dict[str, Any]]:
    bindings = prepared.system["assumption_bindings"]
    core = [bindings[0]["assumption_term"], bindings[-1]["assumption_term"]]
    transport = GenericNamedPiqd(
        {prepared.solver: status},
        unsat_core=core,
    )
    output = tmp_path / prepared.key
    result = lane.run_query(prepared, output, transport, set())
    return output, transport, result


def _runtime_root(tmp_path: Path) -> Path:
    root = tmp_path / "run"
    for name in ("artifacts", "events", "tmp"):
        (root / name).mkdir(parents=True, exist_ok=True)
    (root / "run_manifest.json").write_text("{}\n")
    return root


def _accepting_verifier(
    _query: adapter.SourceSemanticQuery,
    solver: str,
    model: str,
    values: str | None,
) -> adapter.SemanticVerification:
    assert solver in adapter.SOLVERS
    assert type(model) is str and type(values) is str
    return adapter.SemanticVerification(True, {"fixture_exact_replay": True})


def test_parent_run_is_fully_reconstructed(parent: dict[str, Any]) -> None:
    assert parent["run_manifest_sha256"] == lane.PARENT_MANIFEST_SHA256
    assert parent["launch_sha256"] == lane.PARENT_LAUNCH_SHA256
    assert parent["terminal_sha256"] == lane.PARENT_TERMINAL_SHA256
    assert parent["terminal_status"] == "TARGET_INCONCLUSIVE"
    assert set(parent["result_file_sha256"]) == set(lane.source.QUERY_KEYS)
    assert parent["parent_custody_sha256"] == lane._self_hash(
        parent, "parent_custody_sha256"
    )


def test_parent_terminal_tamper_fails_closed(monkeypatch: pytest.MonkeyPatch) -> None:
    original = lane._read

    def tampered(path: Path, limit: int = 96 * 1024 * 1024) -> bytes:
        payload = original(path, limit)
        return payload + b" " if path == lane.PARENT_TERMINAL_PATH else payload

    monkeypatch.setattr(lane, "_read", tampered)
    with pytest.raises(lane.ResidualNamedCoreError, match="parent record bytes"):
        lane.authenticate_parent_run()


@pytest.mark.parametrize(
    ("index", "occurrences", "unique", "set_sha", "multiset_sha"),
    [
        (
            360,
            237,
            233,
            "d00e64bf85741b9c17617de71f2bce80c3a54e6e36e347a5a45db775657255fd",
            "a7a14098806456d967ba22dad05ed13f33fd641574af6f197defcf20857c54da",
        ),
        (
            467,
            237,
            233,
            "d00e64bf85741b9c17617de71f2bce80c3a54e6e36e347a5a45db775657255fd",
            "a7a14098806456d967ba22dad05ed13f33fd641574af6f197defcf20857c54da",
        ),
        (
            363,
            303,
            299,
            "e5986432685e259a0f4644366378631e908ed6d121c15e0a74abc437eaa4576e",
            "40658cbf9375d5dfa342ec0abf1e79535ce26e0ad057f919810b9af4eea856c3",
        ),
        (
            376,
            303,
            299,
            "e5986432685e259a0f4644366378631e908ed6d121c15e0a74abc437eaa4576e",
            "40658cbf9375d5dfa342ec0abf1e79535ce26e0ad057f919810b9af4eea856c3",
        ),
        (
            470,
            303,
            299,
            "e5986432685e259a0f4644366378631e908ed6d121c15e0a74abc437eaa4576e",
            "40658cbf9375d5dfa342ec0abf1e79535ce26e0ad057f919810b9af4eea856c3",
        ),
        (
            483,
            303,
            299,
            "e5986432685e259a0f4644366378631e908ed6d121c15e0a74abc437eaa4576e",
            "40658cbf9375d5dfa342ec0abf1e79535ce26e0ad057f919810b9af4eea856c3",
        ),
    ],
)
def test_formula_family_reduction_is_exact(
    index: int,
    occurrences: int,
    unique: int,
    set_sha: str,
    multiset_sha: str,
) -> None:
    record = lane.formula_family_record()
    profile = record["profiles"][str(index)]
    assert profile["assertion_occurrences"] == occurrences
    assert profile["unique_assertions"] == unique
    assert profile["assertion_set_sha256"] == set_sha
    assert profile["assertion_multiset_sha256"] == multiset_sha
    assert record["family_record_sha256"] == lane._self_hash(
        record, "family_record_sha256"
    )


def test_family_reduction_retains_distinct_role_maps() -> None:
    record = lane.formula_family_record()
    assert record["representatives"] == {"family-12": 360, "family-13": 363}
    for family, members in lane.FAMILY_GROUPS.items():
        row = record["families"][family]
        assert row["members"] == list(members)
        assert row["exact_set_equal"] is True
        assert row["exact_multiset_equal"] is True
        assert row["distinct_role_maps"] is True


def test_run_manifest_has_exact_v1_schema_and_binds_parent_results(
    monkeypatch: pytest.MonkeyPatch, parent: dict[str, Any]
) -> None:
    monkeypatch.setattr(lane, "authenticate_parent_run", lambda: parent)
    manifest = lane._expected_run_manifest("2026-09-04T01:00:00Z")
    assert set(manifest) == {
        "schema", "lane_id", "run_id", "root", "owner", "base_head",
        "output_classes", "source_digests", "input_digests", "created_utc",
        "manifest_sha256",
    }
    expected_results = {
        str(
            (lane.PARENT_ROOT / "artifacts" / key / "result.json").relative_to(
                lane.REPOSITORY_ROOT
            )
        )
        for key in parent["result_file_sha256"]
    }
    assert expected_results < set(manifest["input_digests"])
    assert manifest["manifest_sha256"] == lane._self_hash(
        manifest, "manifest_sha256"
    )


@pytest.mark.parametrize(
    ("key", "count", "areas"),
    [
        ("z3-target-0360", 236, 220),
        ("cvc5-target-0360", 236, 220),
        ("z3-target-0363", 302, 286),
        ("cvc5-target-0363", 302, 286),
    ],
)
def test_target_named_inventory_and_exact_expansion(
    parent: dict[str, Any], key: str, count: int, areas: int
) -> None:
    prepared = lane.prepare_query(key, parent=parent)
    bindings = prepared.system["assumption_bindings"]
    assert len(bindings) == count
    assert [row["family"] for row in bindings[:16]] == [
        "normalization",
        *("row-equality" for _ in range(13)),
        "radius-disequality",
        "source-strict",
    ]
    assert len(bindings[16:]) == areas
    assert all(row["family"] == "strict-signed-area" for row in bindings[16:])
    expanded = sorted(command for row in bindings for command in row["source_commands"])
    original = sorted(
        command
        for command in prepared.system["source_unguarded_commands"]
        if command.startswith("(assert ")
    )
    assert expanded == original
    assert prepared.query.descriptor["solve"]["assumption_ids"] == [
        row["assumption_id"] for row in bindings
    ]
    assert prepared.assumption_labels == tuple(row["label_sha256"] for row in bindings)
    assert all(
        row["label_sha256"] == lane._self_hash(row, "label_sha256")
        for row in bindings
    )


@pytest.mark.parametrize("key", lane.POSITIVE_CONTROL_KEYS + lane.NEGATIVE_CONTROL_KEYS)
def test_controls_are_named_and_source_complete(
    parent: dict[str, Any], key: str
) -> None:
    prepared = lane.prepare_query(key, parent=parent)
    assert len(prepared.system["assumption_bindings"]) == 12
    assert len(prepared.query.assumptions) == 12
    assert len(prepared.assumption_labels) == 12
    assert all(
        command.startswith("(assert (=> assume_control_")
        for command in prepared.query.journal_commands[-12:]
    )


def test_query_plan_has_eight_fresh_single_solver_cells() -> None:
    assert lane.WORKERS == 1
    assert len(lane.QUERY_PLAN) == 8
    assert [solver for _, solver, _ in lane.QUERY_PLAN] == [
        "z3", "z3", "z3", "z3", "cvc5", "cvc5", "cvc5", "cvc5"
    ]
    assert set(lane.TARGET_KEYS) == {
        "z3-target-0360", "z3-target-0363", "cvc5-target-0360", "cvc5-target-0363"
    }


def test_sat_replay_delegates_to_frozen_exact_checker(
    monkeypatch: pytest.MonkeyPatch, parent: dict[str, Any]
) -> None:
    prepared = lane.prepare_query("z3-target-0360", parent=parent)
    observed: dict[str, Any] = {}

    def exact(query: object, solver: str, model: str, values: str) -> adapter.SemanticVerification:
        observed.update(query=query, solver=solver, model=model, values=values)
        return adapter.SemanticVerification(True, {"exact": True})

    monkeypatch.setattr(lane.source, "verify_sat_model", exact)
    verification = lane.verify_sat_model(prepared.query, "z3", "(model)", "((x 1))")
    assert verification.accepted is True
    assert observed["solver"] == "z3"
    assert observed["query"].journal_commands == tuple(
        prepared.system["source_unguarded_commands"]
    )


@pytest.mark.parametrize("key", ("z3-target-0360", "cvc5-target-0363"))
def test_genuine_named_adapter_session_tree_and_transport_free_resume(
    tmp_path: Path, parent: dict[str, Any], key: str
) -> None:
    prepared = lane.prepare_query(key, parent=parent)
    output, transport, first = _genuine_tree(tmp_path, prepared)
    assert set(first["engine"]) == lane._ENGINE_KEYS
    assert first["engine"]["raw_status"] == "UNSAT"
    assert first["engine"]["unsat_assumptions"]["terminal_unsat"] is False
    assert transport.actual_solves == 1

    class NoTransport:
        def __getattr__(self, name: str) -> object:
            raise AssertionError(f"resume used transport: {name}")

    assert lane.run_query(prepared, output, NoTransport()) == first


def test_genuine_target_unknown_is_inconclusive(
    tmp_path: Path, parent: dict[str, Any]
) -> None:
    prepared = lane.prepare_query("cvc5-target-0363", parent=parent)
    _, _, result = _genuine_tree(tmp_path, prepared, status="UNKNOWN")
    assert result["engine"]["raw_status"] == "UNKNOWN"
    assert result["engine"]["effective_status"] == "INCONCLUSIVE_UNKNOWN"
    assert result["engine"]["unsat_assumptions"] is None
    assert result["engine"]["semantic_replay"] is None


def test_genuine_unreconciled_transport_loss_is_inconclusive(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    parent: dict[str, Any],
) -> None:
    prepared = lane.prepare_query("z3-target-0360", parent=parent)
    monkeypatch.setattr(adapter, "TRANSPORT_RECONCILIATION_DELAYS_S", (0.0,))
    transport = GenericNamedPiqd(
        {"z3": "UNSAT"},
        unsat_core=[prepared.system["assumption_bindings"][0]["assumption_term"]],
        solve_transport_loss={"z3"},
        transport_loss_commits=False,
    )
    result = lane.run_query(prepared, tmp_path / prepared.key, transport, set())
    assert result["engine"]["raw_status"] is None
    assert result["engine"]["effective_status"] == "INCONCLUSIVE_TRANSPORT_LOSS"
    assert result["engine"]["result_sha256"] is None
    assert result["engine"]["unsat_assumptions"] is None


@pytest.mark.parametrize(
    "mutation",
    [
        "extra-result-key",
        "extra-engine-key",
        "source-record",
        "session-create-request",
        "journal-frontiers",
        "solve-request",
        "session",
        "receipts",
        "session-lifecycle",
        "core-label",
        "extra-file",
    ],
)
def test_genuine_named_tree_mutations_fail_closed(
    tmp_path: Path, parent: dict[str, Any], mutation: str
) -> None:
    prepared = lane.prepare_query("z3-target-0360", parent=parent)
    output, _, _ = _genuine_tree(tmp_path, prepared)
    result_path = output / "result.json"
    result = json.loads(result_path.read_bytes())
    if mutation == "extra-result-key":
        result["future_result"] = False
        _rewrite_result(result_path, result)
    elif mutation == "extra-engine-key":
        result["engine"]["future_engine"] = False
        _rewrite_result(result_path, result)
    elif mutation == "core-label":
        result["engine"]["unsat_assumptions"]["core_labels"][0] = "0" * 64
        _rewrite_result(result_path, result)
    elif mutation == "extra-file":
        (output / "unbound.bin").write_bytes(b"extra")
    else:
        artifact = result["custody"].get(mutation.replace("-", "_"))
        if artifact is None:
            artifact = result["engine"]["artifacts"][mutation.replace("-", "_")]
        _replace(output / artifact["path"], b"{}\n")
    with pytest.raises(lane.ResidualNamedCoreError):
        lane.verify_query_tree(prepared, output)


@pytest.mark.parametrize(
    ("key", "status"),
    [
        ("z3-control-positive", "SAT"),
        ("cvc5-control-positive", "SAT"),
        ("z3-control-negative", "UNSAT"),
        ("cvc5-control-negative", "UNSAT"),
    ],
)
def test_genuine_named_controls_per_engine(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    parent: dict[str, Any],
    key: str,
    status: str,
) -> None:
    prepared = lane.prepare_query(key, parent=parent)
    if status == "SAT":
        monkeypatch.setattr(lane, "verify_sat_model", _accepting_verifier)
    _, _, result = _genuine_tree(tmp_path, prepared, status=status)
    assert result["engine"]["raw_status"] == status
    if status == "SAT":
        assert result["engine"]["effective_status"] == "SAT_SEMANTICALLY_REPLAYED"
    else:
        assert result["engine"]["unsat_assumptions"]["core_labels"]


def test_core_rejects_empty_terminal_and_wrong_labels(parent: dict[str, Any]) -> None:
    prepared = lane.prepare_query("z3-target-0360", parent=parent)
    provenance = {
        "basis": "get-unsat-assumptions",
        "named_core_support": True,
        "daemon_field": "core",
        "assumption_terms": [],
        "source_atom_ids": [],
        "terminal_unsat": True,
        "ordered_assumption_labels": list(prepared.assumption_labels),
        "core_labels": [],
    }
    engine = {
        "raw_status": "UNSAT",
        "effective_status": "UNSAT_DISCOVERY_ONLY",
        "unsat_assumptions": provenance,
    }
    with pytest.raises(lane.ResidualNamedCoreError, match="empty"):
        lane._validate_core(prepared, engine)
    first = prepared.system["assumption_bindings"][0]
    provenance.update(
        assumption_terms=[first["assumption_term"]],
        source_atom_ids=[first["assumption_id"]],
        terminal_unsat=False,
        core_labels=["0" * 64],
    )
    with pytest.raises(lane.ResidualNamedCoreError, match="cross-bound"):
        lane._validate_core(prepared, engine)


def test_exact_inventory_and_failure_custody(tmp_path: Path) -> None:
    root = _runtime_root(tmp_path)
    manifest = {"manifest_sha256": "a" * 64}
    assert lane._inventory(root) == "INITIALIZED"
    launch = {"launch_sha256": "b" * 64}
    lane._publish_once(root / "events/launch.json", lane._json(launch))
    failure = lane._write_failure(root, manifest, RuntimeError("boom"))
    assert failure == lane._read_failure(root, manifest)
    (root / "tmp" / "late.bin").write_bytes(b"mutation")
    with pytest.raises(lane.ResidualNamedCoreError, match="tmp"):
        lane._read_failure(root, manifest)


def test_inventory_uses_its_root_and_rejects_nested(tmp_path: Path) -> None:
    first = _runtime_root(tmp_path / "first")
    second = _runtime_root(tmp_path / "second")
    (second / "artifacts" / "foreign").mkdir()
    with pytest.raises(lane.ResidualNamedCoreError):
        lane._inventory(second)
    assert lane._inventory(first) == "INITIALIZED"


def test_bounds_and_sparse_cli(
    monkeypatch: pytest.MonkeyPatch, capsys: pytest.CaptureFixture[str]
) -> None:
    for kwargs in (
        {"workers": 2, "init_only": True},
        {"workers": True, "init_only": True},
        {"timeout_s": 0, "init_only": True},
        {"timeout_s": 3600.001, "init_only": True},
        {"timeout_s": True, "init_only": True},
    ):
        with pytest.raises(lane.ResidualNamedCoreError):
            lane.run_campaign(**kwargs)
    result = {
        "status": "INITIALIZED",
        "lane_id": lane.LANE_ID,
        "run_manifest_sha256": "a" * 64,
    }
    monkeypatch.setattr(lane, "run_campaign", lambda **_kwargs: result)
    assert lane.main(["--init-only"]) == 0
    assert capsys.readouterr() == ("", "")
    assert lane.main(["--init-only", "--verbose"]) == 0
    captured = capsys.readouterr()
    assert json.loads(captured.out) == result
    assert captured.err == ""


def test_terminal_replay_constructs_no_transport(
    tmp_path: Path,
    monkeypatch: pytest.MonkeyPatch,
    parent: dict[str, Any],
) -> None:
    monkeypatch.setattr(lane, "verify_sat_model", _accepting_verifier)
    root = _runtime_root(tmp_path)
    manifest = {
        "manifest_sha256": "c" * 64,
    }
    prepared = {
        key: lane.prepare_query(key, parent=parent) for key in lane.QUERY_KEYS
    }
    results: dict[str, dict[str, Any]] = {}
    for key, item in prepared.items():
        status = "SAT" if key in lane.POSITIVE_CONTROL_KEYS else "UNSAT"
        _, _, results[key] = _genuine_tree(root / "artifacts", item, status=status)
    launch = lane._launch_record(manifest, "http://127.0.0.1:7272", 60_000)
    lane._publish_once(root / "events/launch.json", lane._json(launch))
    terminal = lane._terminal_record(manifest, launch, results)
    lane._publish_once(root / "events/terminal.json", lane._json(terminal))
    monkeypatch.setattr(lane, "RUN_ROOT", root)
    monkeypatch.setattr(lane, "ensure_run_root", lambda: (root, manifest))
    monkeypatch.setattr(lane, "authenticate_parent_run", lambda: parent)
    monkeypatch.setattr(
        lane, "prepare_query", lambda key, **_kwargs: prepared[key]
    )

    class ForbiddenTransport:
        def __init__(self, *_args: object, **_kwargs: object) -> None:
            raise AssertionError("terminal replay constructed transport")

    monkeypatch.setattr(adapter, "UrllibPiqdTransport", ForbiddenTransport)
    assert lane.run_campaign() == terminal
    assert not (root / "events/failure.json").exists()


def test_claim_boundary_remains_false(parent: dict[str, Any]) -> None:
    assert lane.FALSE_CLAIMS["formula_family_scope_only"] is True
    assert all(
        value is False
        for key, value in lane.FALSE_CLAIMS.items()
        if key != "formula_family_scope_only"
    )
    prepared = lane.prepare_query("cvc5-target-0363", parent=parent)
    assert prepared.system["claims"] == lane.FALSE_CLAIMS
