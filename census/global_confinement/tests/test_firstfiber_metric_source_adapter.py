from __future__ import annotations

import copy
import hashlib
import json
from pathlib import Path

import pytest

from census.global_confinement.firstfiber_metric_source_adapter import (
    PACKET_SCHEMA,
    SCHEMA,
    SourceAdapterError,
    as_metric_payload,
    as_metric_system,
    load_source,
    normalize_source,
)


def _source() -> dict:
    roles = [
        ("source_blocker", 3, [0, 5, 7, 9]),
        ("first_apex_blocker", 4, [0, 2, 6, 8]),
        ("opp_apex1", 5, [1, 2, 6, 8]),
        ("opp_apex2", 6, [1, 4, 7, 9]),
        ("surplus_apex", 7, [2, 4, 5, 9]),
    ]
    return {
        "schema": SCHEMA,
        "source_revision": {
            "lean_path": "lean/Erdos9796Proof/P97/ATail/FrontierLiveClosure/TwoSourceFirstFiberCollision.lean",
            "lean_sha256": "a" * 64,
            "declaration": "false_of_capSource_firstFiber_outsidePairDeletionExactRows",
        },
        "packets": [
            {
                "schema": PACKET_SCHEMA,
                "packet_id": "0" * 20,
                "n": 11,
                "profile": [6, 4, 4],
                "order": list(range(11)),
                "deleted": 10,
                "centers": {role: center for role, center, _ in roles},
                "rows": [
                    {"role": role, "center": center, "support": support, "exact": True}
                    for role, center, support in roles
                ],
                "provenance": {
                    "arm": "source",
                    "deleted_identity": "Q.source.1",
                    "lean_declaration": "false_of_capSource_firstFiber_outsidePairDeletionExactRows",
                    "centers_distinct": True,
                    "q_deleted": True,
                    "outside_pair": True,
                },
            }
        ],
    }


def test_normalize_and_project_explicit_order() -> None:
    normalized = normalize_source(_source())
    assert normalized["packets"][0]["rows"][0]["role"] == "source_blocker"
    system = as_metric_system(normalized["packets"][0])
    assert system["order"] == list(range(11))
    assert len(system["rows"]) == 5
    assert len(system["system_id"]) == 20
    assert as_metric_payload(normalized)["systems"] == [system]


@pytest.mark.parametrize(
    ("path", "value"),
    [
        ("packets[0].provenance.q_deleted", False),
        ("packets[0].rows[0].exact", False),
        ("packets[0].rows[0].support", [0, 5, 7, 10]),
        ("packets[0].order", list(range(10)) + [9]),
    ],
)
def test_rejects_unproved_or_malformed_packet(path: str, value: object) -> None:
    source = _source()
    target: object = source
    parts = path.replace("]", "").replace("[", ".").split(".")
    for part in parts[:-1]:
        target = target[int(part)] if part.isdigit() else target[part]  # type: ignore[index]
    if parts[-1].isdigit():
        target[int(parts[-1])] = value  # type: ignore[index]
    else:
        target[parts[-1]] = value  # type: ignore[index]
    with pytest.raises(SourceAdapterError):
        normalize_source(source)


def test_rejects_crossed_arm_declaration() -> None:
    source = copy.deepcopy(_source())
    source["packets"][0]["provenance"]["lean_declaration"] = "other"
    with pytest.raises(SourceAdapterError):
        normalize_source(source)


@pytest.mark.parametrize(
    ("field", "value"),
    [
        ("deleted_identity", "Q.otherOutsidePoint"),
        ("arm", "other"),
    ],
)
def test_rejects_arm_deleted_identity_mismatch(field: str, value: str) -> None:
    source = copy.deepcopy(_source())
    source["packets"][0]["provenance"][field] = value
    with pytest.raises(SourceAdapterError):
        normalize_source(source)


def test_rejects_profile_cardinality_mismatch() -> None:
    source = copy.deepcopy(_source())
    source["packets"][0]["profile"] = [7, 4, 4]
    with pytest.raises(SourceAdapterError):
        normalize_source(source)


def test_rejects_deleted_named_center() -> None:
    source = copy.deepcopy(_source())
    source["packets"][0]["deleted"] = 3
    with pytest.raises(SourceAdapterError):
        normalize_source(source)


def test_load_source_binds_declared_lean_bytes(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    source = _source()
    lean_path = tmp_path / "decl.lean"
    lean_bytes = b"theorem source_contract : True := by trivial\n"
    lean_path.write_bytes(lean_bytes)
    source["source_revision"]["lean_path"] = "decl.lean"
    source["source_revision"]["lean_sha256"] = hashlib.sha256(lean_bytes).hexdigest()
    artifact = tmp_path / "source.json"
    artifact.write_text(json.dumps(source), encoding="utf-8")
    monkeypatch.chdir(tmp_path)
    assert load_source(artifact)["source_revision"]["lean_path"] == "decl.lean"
    lean_path.write_bytes(b"mutated\n")
    with pytest.raises(SourceAdapterError):
        load_source(artifact)
