from __future__ import annotations

import json
import os
from pathlib import Path

import pytest

from census.card_head import exactfive_opposed_turn_profile_mine as subject


@pytest.fixture(scope="module")
def headers() -> dict[str, object]:
    return subject.authenticate_parent_headers()


def _systems() -> list[tuple[int, object, dict[str, object]]]:
    return [
        (index, profile, subject.parent.build_profile_system(index, profile))
        for index, profile in subject.parent.indexed_profiles()
    ]


def test_parent_headers_bind_exact_profile_stream_and_terminal(
    headers: dict[str, object],
) -> None:
    assert len(headers["profiles"]) == subject.EXPECTED_PROFILES
    assert len(headers["terminal"]["profiles"]) == subject.EXPECTED_PROFILES
    assert (
        headers["launch"]["profile_stream_sha256"]
        == subject.parent.profile_stream_sha256()
    )
    assert headers["terminal"]["summary"] == {
        "profiles": 2798,
        "engine_status_pairs": {
            "SAT/SAT": 122,
            "SAT/UNKNOWN": 80,
            "UNSAT/UNKNOWN": 10,
            "UNSAT/UNSAT": 2586,
        },
    }


def test_structural_filter_recomputes_exact_558_profiles() -> None:
    selected = [
        index
        for index, _profile, system in _systems()
        if subject.structural_filter(system)["passes"]
    ]
    assert len(selected) == subject.EXPECTED_STRUCTURAL == 558
    assert selected[0] == 282
    assert selected[-1] == 2788


def test_parent_terminal_recomputes_34_profiles_and_56_sat_cells(
    headers: dict[str, object],
) -> None:
    links = headers["terminal"]["profiles"]
    sat_profiles = 0
    sat_cells = 0
    for index, _profile, system in _systems():
        if not subject.structural_filter(system)["passes"]:
            continue
        cells = sum(engine["raw_status"] == "SAT" for engine in links[index]["engines"])
        sat_profiles += cells > 0
        sat_cells += cells
    assert sat_profiles == subject.EXPECTED_SAT_PROFILES == 34
    assert sat_cells == subject.EXPECTED_SAT_CELLS == 56


def test_turn_scan_recomputes_50_28_and_six_residuals(
    headers: dict[str, object],
) -> None:
    links = headers["terminal"]["profiles"]
    matched_cells = 0
    killed = []
    residuals = []
    for index, _profile, system in _systems():
        if not subject.structural_filter(system)["passes"]:
            continue
        link = links[index]
        if not any(engine["raw_status"] == "SAT" for engine in link["engines"]):
            continue
        result_path = (
            subject.PARENT_ROOT / "artifacts/profiles" / link["key"] / "result.json"
        )
        result = subject._strict_json(
            subject._read_regular(result_path), "parent result"
        )
        cell_matches = []
        for engine in result["engines"]:
            if engine["raw_status"] != "SAT":
                continue
            ranks = engine["semantic_replay"]["evidence"]["ranks"]
            matched = subject.opposed_turn_analysis(system, ranks)["matched"]
            matched_cells += matched
            cell_matches.append(matched)
        if all(cell_matches):
            killed.append(index)
        else:
            residuals.append(index)
    assert matched_cells == subject.EXPECTED_MATCHED_CELLS == 50
    assert len(killed) == subject.EXPECTED_KILLED_PROFILES == 28
    assert tuple(residuals) == subject.EXPECTED_RESIDUALS


@pytest.mark.parametrize(
    ("index", "killed", "matched_cells"),
    [(282, True, 2), (360, False, 1)],
)
def test_real_profile_tree_exact_replay_and_role_mapping(
    headers: dict[str, object], index: int, killed: bool, matched_cells: int
) -> None:
    profile = headers["profiles"][index][1]
    link = headers["terminal"]["profiles"][index]
    record = subject.analyze_profile(
        index,
        profile,
        link,
        timeout_ms=headers["launch"]["timeout_ms"],
        parent_header_sha256=headers["parent_header_sha256"],
    )
    assert (
        record["role_class"]["c1"]
        == record["engine_cells"][0]["opposed_turn"]["B_class"]
    )
    assert record["every_sat_cell_killed"] is killed
    assert record["matched_sat_cell_count"] == matched_cells
    assert all(
        cell.get("exact_rational_replay") is True
        for cell in record["engine_cells"]
        if cell["raw_status"] == "SAT"
    )


def test_profile_link_custody_cannot_cross_profiles(
    headers: dict[str, object],
) -> None:
    index = 282
    profile = headers["profiles"][index][1]
    crossed_link = headers["terminal"]["profiles"][index + 1]
    with pytest.raises(subject.OpposedTurnProfileMineError, match="identity crossed"):
        subject.analyze_profile(
            index,
            profile,
            crossed_link,
            timeout_ms=headers["launch"]["timeout_ms"],
            parent_header_sha256=headers["parent_header_sha256"],
        )


def test_residual_engine_identity_and_outcomes_are_exact(
    headers: dict[str, object],
) -> None:
    records = {}
    for index in subject.EXPECTED_RESIDUALS:
        profile = headers["profiles"][index][1]
        records[index] = subject.analyze_profile(
            index,
            profile,
            headers["terminal"]["profiles"][index],
            timeout_ms=headers["launch"]["timeout_ms"],
            parent_header_sha256=headers["parent_header_sha256"],
        )
        observed = tuple(
            (
                cell["solver"],
                cell["raw_status"],
                cell.get("opposed_turn", {}).get("matched"),
            )
            for cell in records[index]["engine_cells"]
        )
        assert observed == subject.EXPECTED_RESIDUAL_ENGINE_OUTCOMES[index]

    assert records[360]["engine_cells"][1]["opposed_turn"]["matched"] is True
    assert records[467]["engine_cells"][1]["opposed_turn"]["matched"] is True
    assert all(
        records[index]["engine_cells"][0]["opposed_turn"]["matched"] is False
        for index in subject.EXPECTED_RESIDUALS
    )

    swapped = dict(records[360])
    swapped["engine_cells"] = [dict(cell) for cell in records[360]["engine_cells"]]
    swapped["engine_cells"][0]["solver"] = "cvc5"
    swapped["engine_cells"][1]["solver"] = "z3"
    with pytest.raises(subject.OpposedTurnProfileMineError, match="engine identity"):
        subject._validate_residual_engine_outcome(swapped)


def test_cyclic_turn_sign_and_opposition_are_cut_independent() -> None:
    ranks = {"B": 0, "O": 2, "c2": 4, "u": 1, "v": 3}
    system = {"role_class": {"c1": "B", "O": "O", "c2": "c2", "u": "u", "v": "v"}}
    first = subject.opposed_turn_analysis(system, ranks)
    rotated = {key: (value + 2) % 5 for key, value in ranks.items()}
    assert subject.opposed_turn_analysis(system, rotated) == first
    assert subject.cyclic_turn_sign(ranks, "B", "O", "B") == 0


def test_profile_record_tamper_symlink_and_hardlink_fail_closed(
    tmp_path: Path,
) -> None:
    record = {
        "schema": subject.PROFILE_SCHEMA,
        "claims": dict(subject.FALSE_CLAIMS),
        "profile_index": 1,
    }
    record["record_sha256"] = subject._self_hash(record, "record_sha256")
    path = tmp_path / "profile.json"
    subject._write_once(path, subject._json(record))
    assert subject.verify_profile_record(path) == record

    linked = tmp_path / "linked.json"
    linked.symlink_to(path)
    with pytest.raises(subject.OpposedTurnProfileMineError, match="unsafe"):
        subject.verify_profile_record(linked)

    hardlink = tmp_path / "hardlink.json"
    os.link(path, hardlink)
    with pytest.raises(subject.OpposedTurnProfileMineError, match="unsafe"):
        subject.verify_profile_record(path)

    hardlink.unlink()
    path.chmod(0o600)
    changed = dict(record)
    changed["profile_index"] = 2
    path.write_bytes(subject._json(changed))
    with pytest.raises(subject.OpposedTurnProfileMineError, match="drifted"):
        subject.verify_profile_record(path)


def test_create_once_refuses_overwrite(tmp_path: Path) -> None:
    path = tmp_path / "immutable.json"
    subject._write_once(path, b"first\n")
    with pytest.raises(subject.OpposedTurnProfileMineError, match="exists"):
        subject._write_once(path, b"second\n")
    assert path.read_bytes() == b"first\n"


def test_create_once_checks_completed_descriptor(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    original_fstat = subject.os.fstat

    def unsafe_fstat(descriptor: int) -> os.stat_result:
        values = list(original_fstat(descriptor))
        values[3] = 2
        return os.stat_result(values)

    monkeypatch.setattr(subject.os, "fstat", unsafe_fstat)
    with pytest.raises(subject.OpposedTurnProfileMineError, match="descriptor"):
        subject._write_once(tmp_path / "unsafe.json", b"{}\n")


def test_json_publication_rereads_exact_bytes(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    def corrupted_write(path: Path, _payload: bytes) -> None:
        path.write_bytes(b'{"wrong":true}\n')

    monkeypatch.setattr(subject, "_write_once", corrupted_write)
    with pytest.raises(subject.OpposedTurnProfileMineError, match="changed"):
        subject._publish_json_once(tmp_path / "record.json", {"right": True}, "record")


def test_run_root_rejects_escape_symlink_ancestor_and_unsafe_children(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    repository = tmp_path / "repository"
    runs = repository / "scratch/runs"
    runs.mkdir(parents=True)
    outside = tmp_path / "outside"
    outside.mkdir()
    lane = runs / subject.LANE_ID
    lane.symlink_to(outside, target_is_directory=True)
    monkeypatch.setattr(subject, "REPOSITORY_ROOT", repository)
    monkeypatch.setattr(subject, "RUN_ROOT", lane / subject.RUN_ID)
    with pytest.raises(subject.OpposedTurnProfileMineError, match="symlink"):
        subject.ensure_run_root()
    assert not (outside / subject.RUN_ID).exists()

    monkeypatch.setattr(subject, "RUN_ROOT", outside / subject.RUN_ID)
    with pytest.raises(subject.OpposedTurnProfileMineError, match="escapes"):
        subject.ensure_run_root()

    root = runs / "safe-lane" / subject.RUN_ID
    root.mkdir(parents=True)
    (root / "artifacts").write_text("not a directory", encoding="utf-8")
    monkeypatch.setattr(subject, "RUN_ROOT", root)
    with pytest.raises(subject.OpposedTurnProfileMineError, match="child"):
        subject.ensure_run_root()


def test_parent_directory_ancestry_rejects_symlink_and_escape(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    repository = tmp_path / "repository"
    repository.mkdir()
    outside = tmp_path / "outside"
    (outside / "child").mkdir(parents=True)
    linked = repository / "linked"
    linked.symlink_to(outside, target_is_directory=True)
    monkeypatch.setattr(subject, "REPOSITORY_ROOT", repository)
    with pytest.raises(subject.OpposedTurnProfileMineError, match="unsafe"):
        subject._require_existing_directory(linked / "child", "parent input")
    with pytest.raises(subject.OpposedTurnProfileMineError, match="escapes"):
        subject._require_existing_directory(outside, "parent input")


def _runtime_tree(root: Path) -> dict[str, object]:
    for name in ("artifacts", "events", "tmp"):
        (root / name).mkdir(parents=True, exist_ok=True)
    manifest = {"manifest_sha256": "a" * 64}
    subject._write_once(root / "run_manifest.json", subject._json(manifest))
    return manifest


@pytest.mark.parametrize(
    ("subtree", "unknown_name", "as_directory"),
    [
        ("artifacts", "unknown.bin", False),
        ("events", "unknown.json", False),
        ("tmp", "unknown-dir", True),
    ],
)
def test_runtime_inventory_rejects_unknown_entries_in_each_subtree(
    tmp_path: Path, subtree: str, unknown_name: str, as_directory: bool
) -> None:
    root = tmp_path / "run"
    _runtime_tree(root)
    unknown = root / subtree / unknown_name
    if as_directory:
        unknown.mkdir()
    else:
        unknown.write_bytes(b"unknown")
    with pytest.raises(subject.OpposedTurnProfileMineError, match="inventory"):
        subject.verify_runtime_inventory(root)


def test_runtime_inventory_rejects_unbound_profile_file(tmp_path: Path) -> None:
    root = tmp_path / "run"
    _runtime_tree(root)
    profiles = root / "artifacts/profiles"
    profiles.mkdir()
    (profiles / "profile-9999-unbound.json").write_bytes(b"{}\n")
    with pytest.raises(subject.OpposedTurnProfileMineError, match="unknown entry"):
        subject.verify_runtime_inventory(root)


def test_unexpected_parent_key_error_publishes_verified_failure(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    root = tmp_path / "run"
    manifest = _runtime_tree(root)
    monkeypatch.setattr(subject, "ensure_run_root", lambda: (root, manifest))

    def broken_headers() -> dict[str, object]:
        raise KeyError("unexpected")

    monkeypatch.setattr(subject, "authenticate_parent_headers", broken_headers)
    with pytest.raises(subject.OpposedTurnProfileMineError, match="preserved"):
        subject.run_mine()
    failure = subject.verify_failure_record(root / "events/failure.json")
    assert failure["failure_stage"] == "parent-authentication"
    assert failure["failure_type"] == "KeyError"


def test_launch_drift_publishes_verified_failure(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    root = tmp_path / "run"
    manifest = _runtime_tree(root)
    wrong_launch = {"launch_sha256": "wrong"}
    subject._write_once(root / "events/launch.json", subject._json(wrong_launch))
    expected_launch = {"launch_sha256": ""}
    expected_launch["launch_sha256"] = subject._self_hash(
        expected_launch, "launch_sha256"
    )
    headers = {"parent_header_sha256": "h"}
    monkeypatch.setattr(subject, "ensure_run_root", lambda: (root, manifest))
    monkeypatch.setattr(subject, "authenticate_parent_headers", lambda: headers)
    monkeypatch.setattr(subject, "_launch_record", lambda *_args: expected_launch)
    with pytest.raises(subject.OpposedTurnProfileMineError, match="preserved"):
        subject.run_mine()
    failure = subject.verify_failure_record(root / "events/failure.json")
    assert failure["failure_stage"] == "launch-publication"


@pytest.mark.parametrize("mode", ["drift", "write-failure"])
def test_terminal_publication_failures_publish_verified_failure(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, mode: str
) -> None:
    root = tmp_path / "run"
    manifest = _runtime_tree(root)
    launch = {"launch_sha256": ""}
    launch["launch_sha256"] = subject._self_hash(launch, "launch_sha256")
    headers = {
        "parent_header_sha256": "h",
        "profiles": [],
        "launch": {"timeout_ms": 1},
        "terminal": {"profiles": [], "controls": []},
    }
    monkeypatch.setattr(subject, "ensure_run_root", lambda: (root, manifest))
    monkeypatch.setattr(subject, "authenticate_parent_headers", lambda: headers)
    monkeypatch.setattr(subject, "_launch_record", lambda *_args: launch)
    monkeypatch.setattr(subject.parent, "CONTROL_IDS", ())
    monkeypatch.setattr(
        subject.parent, "_terminal_record", lambda *_args: headers["terminal"]
    )
    monkeypatch.setattr(subject, "_summary", lambda _records: {"tested": True})
    if mode == "drift":
        subject._write_once(
            root / "events/terminal.json",
            subject._json({"terminal_sha256": "wrong"}),
        )
    else:
        original_publish = subject._publish_json_once

        def fail_terminal(
            path: Path, record: dict[str, object], label: str
        ) -> dict[str, object]:
            if label == "terminal record":
                raise OSError("terminal storage failed")
            return original_publish(path, record, label)

        monkeypatch.setattr(subject, "_publish_json_once", fail_terminal)

    with pytest.raises(subject.OpposedTurnProfileMineError, match="preserved"):
        subject.run_mine()
    failure = subject.verify_failure_record(root / "events/failure.json")
    assert failure["failure_stage"] == "terminal-publication"
    expected_type = "OpposedTurnProfileMineError" if mode == "drift" else "OSError"
    assert failure["failure_type"] == expected_type


def test_incomplete_failure_record_is_self_hashed() -> None:
    record = subject._failure_record(
        {"manifest_sha256": "a" * 64},
        "b" * 64,
        17,
        subject.OpposedTurnProfileMineError("failure"),
        "profile-analysis",
    )
    assert record["state"] == "INCOMPLETE_FAILED_CUSTODY"
    assert record["completed_profile_records"] == 17
    assert record["failure_stage"] == "profile-analysis"
    assert record["failure_sha256"] == subject._self_hash(record, "failure_sha256")


def test_default_sparse_verbose_and_errors(
    monkeypatch: pytest.MonkeyPatch, capsys: pytest.CaptureFixture[str]
) -> None:
    manifest = {"schema": subject.RUN_MANIFEST_SCHEMA, "manifest_sha256": "a" * 64}
    monkeypatch.setattr(
        subject, "ensure_run_root", lambda: (subject.RUN_ROOT, manifest)
    )
    monkeypatch.setattr(subject, "verify_runtime_inventory", lambda _root: None)
    assert subject.main(["--init-only"]) == 0
    assert capsys.readouterr() == ("", "")
    assert subject.main(["--init-only", "--verbose"]) == 0
    captured = capsys.readouterr()
    assert json.loads(captured.out) == manifest
    assert captured.err == ""

    def failed() -> tuple[Path, dict[str, object]]:
        raise subject.OpposedTurnProfileMineError("broken custody")

    monkeypatch.setattr(subject, "ensure_run_root", failed)
    assert subject.main(["--init-only"]) == 1
    assert capsys.readouterr() == ("", "error: broken custody\n")


def test_claims_and_runner_are_solver_free() -> None:
    assert all(value is False for value in subject.FALSE_CLAIMS.values())
    source = Path(subject.__file__).read_text(encoding="utf-8")
    assert "run_authenticated_single_solver_query" not in source
    assert "UrllibPiqdTransport" not in source
