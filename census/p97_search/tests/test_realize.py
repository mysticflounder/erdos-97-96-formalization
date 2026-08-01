from __future__ import annotations

import hashlib
import importlib
import json
import shutil
import sys
from pathlib import Path

import pytest

ROOT = Path(__file__).resolve().parents[3]
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

realize = importlib.import_module("census.p97_search.realize")


CURRENT_RUN = (
    ROOT
    / "census/p97_search/tests/fixtures"
    / "phase3_legacy_bounded100_current"
)
STALE_RUN = (
    ROOT
    / "census/p97_search/tests/fixtures"
    / "phase3_legacy_bounded100_stale_rule_bank"
)


@pytest.fixture(scope="module")
def source() -> realize.VerifiedSource:
    return realize.load_verified_source(CURRENT_RUN)


@pytest.fixture(scope="module")
def leaves(source: realize.VerifiedSource) -> tuple[dict, ...]:
    return realize.build_leaves(source, workers=24)


def _copy_run(destination: Path) -> Path:
    shutil.copytree(CURRENT_RUN, destination)
    return destination


def _rehash_manifest(run: Path, artifact: str) -> None:
    manifest_path = run / "manifest.json"
    manifest = json.loads(manifest_path.read_text())
    manifest["artifact_hashes"][artifact] = hashlib.sha256(
        (run / artifact).read_bytes()
    ).hexdigest()
    manifest_path.write_text(json.dumps(manifest, indent=2, sort_keys=True) + "\n")


def _driver(source_run: Path, out: Path, *, resume: bool = False) -> dict:
    return realize.run_driver(
        source_run,
        out,
        orders="all-24",
        workers=24,
        solver_threads=1,
        singular_timeout=300,
        z3_timeout=120,
        cvc5_timeout=120,
        resume=resume,
        prepare_only=True,
    )


def _q(numerator: int, denominator: int = 1) -> dict:
    return {
        "kind": "rational",
        "numerator": numerator,
        "denominator": denominator,
    }


def _rational_square_control() -> tuple[dict, dict]:
    system = {
        "schema": realize.SCREEN_INPUT_SCHEMA,
        "leaf_id": "rational-square-control",
        "n": 4,
        "order": [0, 1, 2, 3],
        "rows": [
            {"center": 0, "support": [1, 3], "exact": False},
            {"center": 1, "support": [0, 2], "exact": False},
            {"center": 2, "support": [1, 3], "exact": False},
            {"center": 3, "support": [0, 2], "exact": False},
        ],
    }
    coordinates = {
        "0": {"x": _q(0), "y": _q(0)},
        "1": {"x": _q(1), "y": _q(0)},
        "2": {"x": _q(1), "y": _q(1)},
        "3": {"x": _q(0), "y": _q(1)},
    }
    return system, coordinates


def test_strict_current_ingress_and_exact_open_join(
    source: realize.VerifiedSource,
) -> None:
    assert len(source.models) == 100
    assert len({model.canonical_digest for model in source.models}) == 100
    assert all(model.annotated.caps is not None for model in source.models)
    assert all(model.annotated.blocker is not None for model in source.models)


def test_stale_rule_bank_fails_closed() -> None:
    with pytest.raises(realize.RealizationError, match="strict Phase-3 replay"):
        realize.load_verified_source(STALE_RUN)


def test_strict_model_schema_rejects_rehashed_extra_field(tmp_path: Path) -> None:
    run = _copy_run(tmp_path / "run")
    records = [
        json.loads(line) for line in (run / "models.jsonl").read_text().splitlines()
    ]
    records[0]["unrecognized"] = True
    (run / "models.jsonl").write_text(
        "".join(json.dumps(record, sort_keys=True) + "\n" for record in records)
    )
    _rehash_manifest(run, "models.jsonl")
    with pytest.raises(realize.RealizationError, match="schema mismatch"):
        realize.load_verified_source(run)


def test_join_rejects_rehashed_non_open_bank_entry(tmp_path: Path) -> None:
    run = _copy_run(tmp_path / "run")
    records = [
        json.loads(line) for line in (run / "bank.jsonl").read_text().splitlines()
    ]
    records[1]["status"] = "PRUNED"
    (run / "bank.jsonl").write_text(
        "".join(json.dumps(record, sort_keys=True) + "\n" for record in records)
    )
    _rehash_manifest(run, "bank.jsonl")
    with pytest.raises(realize.RealizationError, match="is not OPEN"):
        realize.load_verified_source(run)


def test_every_record_has_24_unquotiented_cap_orders(
    source: realize.VerifiedSource,
) -> None:
    for model in source.models:
        orders = realize.cap_orders(model.annotated)
        assert len(orders) == 24
        assert len({spec.order for spec in orders}) == 24
        assert [spec.order_id for spec in orders] == [
            f"order-{index:02d}" for index in range(24)
        ]
        caps = model.annotated.caps
        assert caps is not None
        moser = caps.sorted_moser()
        fibers = tuple(
            tuple(sorted(x for x, cap in caps.f.items() if cap == index))
            for index in range(3)
        )
        for spec in orders:
            order = spec.order
            assert order[0] == moser[0]
            m1_position = 1 + len(fibers[2])
            m2_position = m1_position + 1 + len(fibers[0])
            assert order[m1_position] == moser[1]
            assert order[m2_position] == moser[2]
            assert set(order[1:m1_position]) == set(fibers[2])
            assert set(order[m1_position + 1 : m2_position]) == set(fibers[0])
            assert set(order[m2_position + 1 :]) == set(fibers[1])


def test_2400_unique_deterministic_unresolved_leaves(
    source: realize.VerifiedSource, leaves: tuple[dict, ...]
) -> None:
    assert len(leaves) == 2400
    assert len({leaf["leaf_id"] for leaf in leaves}) == 2400
    assert leaves == realize.build_leaves(source, workers=24)
    assert {leaf["status"] for leaf in leaves} == {"UNRESOLVED"}
    assert all(leaf["evidence"] is None for leaf in leaves)
    assert all(row["exact"] is False for leaf in leaves for row in leaf["metric_rows"])


def test_metric_translation_boundary_constructs_inexact_rows(
    source: realize.VerifiedSource,
) -> None:
    rows = realize.metric_rows(source.models[0].annotated)
    assert len(rows) == 10
    assert all(type(row) is realize.MetricRow for row in rows)
    assert all(row.exact is False for row in rows)
    assert all(len(row.support) == 4 for row in rows)


def test_sha256_sharding_is_exact(leaves: tuple[dict, ...]) -> None:
    for leaf in leaves:
        digest = hashlib.sha256(
            (leaf["canonical_digest"] + leaf["order_id"]).encode("ascii")
        ).hexdigest()
        assert leaf["leaf_id"] == digest
        assert leaf["shard"] == int(digest, 16) % 24
        assert leaf["shard"] == realize.shard_for(
            leaf["canonical_digest"], leaf["order_id"], 24
        )


def test_append_only_resume_and_tamper_fail_closed(tmp_path: Path) -> None:
    complete = tmp_path / "complete"
    summary = _driver(CURRENT_RUN, complete)
    assert summary["leaf_count"] == 2400
    assert summary["status_counts"] == {"UNRESOLVED": 2400}
    assert _driver(CURRENT_RUN, complete, resume=True) == summary

    interrupted = tmp_path / "interrupted"
    shutil.copytree(complete, interrupted)
    shard = interrupted / "shard-000-of-024.jsonl"
    lines = shard.read_text().splitlines(keepends=True)
    assert len(lines) > 2
    shard.write_text("".join(lines[:-2]))
    (interrupted / "summary.json").unlink()
    resumed = _driver(CURRENT_RUN, interrupted, resume=True)
    assert resumed == summary

    tampered = tmp_path / "tampered"
    shutil.copytree(complete, tampered)
    shard = tampered / "shard-000-of-024.jsonl"
    records = [json.loads(line) for line in shard.read_text().splitlines()]
    records[0]["status"] = "EXACT_REALIZED"
    shard.write_text(
        "".join(json.dumps(record, sort_keys=True) + "\n" for record in records)
    )
    (tampered / "summary.json").unlink()
    with pytest.raises(realize.RealizationError, match="unsupported status promotion"):
        _driver(CURRENT_RUN, tampered, resume=True)


def test_resource_caps_and_prepare_only_gate(tmp_path: Path) -> None:
    with pytest.raises(realize.RealizationError, match="choose exactly one"):
        realize.run_driver(CURRENT_RUN, tmp_path / "not-prepared")
    with pytest.raises(realize.RealizationError, match="exactly 1"):
        realize.run_driver(
            CURRENT_RUN,
            tmp_path / "threads",
            solver_threads=2,
            prepare_only=True,
        )
    with pytest.raises(realize.RealizationError, match="1..3600"):
        realize.run_driver(
            CURRENT_RUN,
            tmp_path / "timeout",
            z3_timeout=0,
            prepare_only=True,
        )
    with pytest.raises(realize.RealizationError, match="1..24"):
        realize.run_driver(
            CURRENT_RUN,
            tmp_path / "workers",
            workers=25,
            prepare_only=True,
        )


def test_rational_control_replays_exactly_and_promotes() -> None:
    system, coordinates = _rational_square_control()
    assert realize.replay_rational_coordinates(system, coordinates) == coordinates
    status, diagnostic, evidence = realize._screen_classification(
        system, {"solver_status": "SAT", "coordinates": coordinates}
    )
    assert status == "EXACT_REALIZED"
    assert diagnostic == "Z3_SAT_RATIONAL_REPLAYED"
    assert evidence is not None
    assert evidence["kind"] == "independent-fraction-replay"

    bad = json.loads(json.dumps(coordinates))
    bad["2"]["y"] = _q(-1)
    status, diagnostic, evidence = realize._screen_classification(
        system, {"solver_status": "SAT", "coordinates": bad}
    )
    assert (status, diagnostic, evidence) == (
        "UNRESOLVED",
        "Z3_SAT_RATIONAL_REPLAY_FAILED",
        None,
    )


def test_algebraic_sat_and_unsat_never_promote() -> None:
    system, coordinates = _rational_square_control()
    algebraic = json.loads(json.dumps(coordinates))
    algebraic["2"]["x"] = {
        "kind": "algebraic",
        "sexpr": "(root-obj (+ (^ x 2) (- 2)) 2)",
        "approximation": {"numerator": 1414, "denominator": 1000},
    }
    assert realize._screen_classification(
        system, {"solver_status": "SAT", "coordinates": algebraic}
    ) == ("UNRESOLVED", "Z3_SAT_ALGEBRAIC", None)
    assert realize._screen_classification(system, {"solver_status": "UNSAT"}) == (
        "UNRESOLVED",
        "Z3_UNSAT_UNCERTIFIED",
        None,
    )


def test_z3_subprocess_rational_sat_control() -> None:
    pytest.importorskip("z3")
    system, _coordinates = _rational_square_control()
    answer = realize._run_z3_subprocess(system, 5)
    assert answer["solver_status"] == "SAT"
    assert realize._screen_classification(system, answer)[0] == "EXACT_REALIZED"


def test_hard_subprocess_timeout() -> None:
    answer = realize._run_solver_subprocess(
        [sys.executable, "-c", "import time; time.sleep(2)"],
        {},
        timeout_s=0.05,
    )
    assert answer == {"solver_status": "TIMEOUT"}


def test_screen_shard_resume_and_tamper(
    tmp_path: Path, leaves: tuple[dict, ...], source: realize.VerifiedSource
) -> None:
    selected = leaves[:3]
    path = tmp_path / "screen.jsonl"
    calls: list[str] = []

    def unknown_runner(system: dict, _timeout: int) -> dict:
        calls.append(system["leaf_id"])
        return {"solver_status": "UNKNOWN", "reason": "control"}

    realize._screen_one_shard(
        path,
        selected,
        source_manifest_sha256=source.manifest_sha256,
        z3_timeout=1,
        runner=unknown_runner,
    )
    assert calls == [leaf["leaf_id"] for leaf in selected]
    realize._screen_one_shard(
        path,
        selected,
        source_manifest_sha256=source.manifest_sha256,
        z3_timeout=1,
        runner=unknown_runner,
    )
    assert len(calls) == 3

    lines = path.read_text().splitlines(keepends=True)
    path.write_text("".join(lines[:-1]))
    realize._screen_one_shard(
        path,
        selected,
        source_manifest_sha256=source.manifest_sha256,
        z3_timeout=1,
        runner=unknown_runner,
    )
    assert len(calls) == 4

    records = [json.loads(line) for line in path.read_text().splitlines()]
    records[0]["diagnostic"] = "Z3_UNSAT_UNCERTIFIED"
    path.write_text(
        "".join(json.dumps(record, sort_keys=True) + "\n" for record in records)
    )
    with pytest.raises(realize.RealizationError, match="invalid record hash"):
        realize._screen_one_shard(
            path,
            selected,
            source_manifest_sha256=source.manifest_sha256,
            z3_timeout=1,
            runner=unknown_runner,
        )
