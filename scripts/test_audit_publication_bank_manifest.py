# Copyright (c) 2026 Adam McKenna. All rights reserved.
# Released under Apache 2.0 license as described in the file LICENSE.
# Author: Adam McKenna <adam@mysticflounder.ai>

from __future__ import annotations

import sqlite3
import subprocess
from pathlib import Path

import audit_publication_bank_manifest as subject
import pytest

HEAD = "a" * 40
CURRENT_HEAD = "b" * 40
BUILD_FINGERPRINT = "c" * 64
REFERENCE_FRESHNESS = {
    "proof_blueprint_build_fingerprint": BUILD_FINGERPRINT,
    "coordinator_reference_module_count": 2_058,
    "coordinator_reference_stale_count": 0,
    "coordinator_reference_missing_count": 0,
}
EXCLUDED_SCOPES = tuple(
    {
        "path": path.as_posix(),
        "kind": kind,
        "absent_from_publish_spine": True,
    }
    for path, kind in subject.EXPECTED_EXCLUDED_SCOPES
)


def digest(index: int) -> str:
    return f"{index:064x}"


def write_blueprint_fixture(
    root: Path,
    rows: tuple[tuple[str, str], ...],
    *,
    primary_key: bool = True,
) -> None:
    (root / "lean").mkdir()
    (root / "data").mkdir()
    (root / ".blueprint.toml").write_text(
        '[paths]\ndb = "data/proof-blueprint.db"\nlean_lib = "lean"\n',
        encoding="utf-8",
    )
    connection = sqlite3.connect(root / "data/proof-blueprint.db")
    key = " PRIMARY KEY" if primary_key else ""
    connection.execute(
        "CREATE TABLE module_mined ("
        f"module_name TEXT{key}, global_fp TEXT NOT NULL)"
    )
    connection.executemany(
        "INSERT INTO module_mined (module_name, global_fp) VALUES (?, ?)", rows
    )
    connection.commit()
    connection.close()


def promoted_records() -> tuple[dict[str, str], ...]:
    active = [
        {
            "destination": subject.COORDINATOR_PATH.as_posix(),
            "promoted_sha256": digest(1),
            "module": (
                "Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificate."
                "Coordinator"
            ),
        }
    ]
    active.extend(
        {
            "destination": (subject.PACKAGE_ROOT / f"Active{i:04}.lean").as_posix(),
            "promoted_sha256": digest(i + 2),
            "module": f"CardEleven.Active{i:04}",
        }
        for i in range(subject.EXPECTED_COORDINATOR_ACTIVE_FILES - 1)
    )
    inactive = [
        {
            "destination": (subject.PACKAGE_ROOT / f"Inactive{i}.lean").as_posix(),
            "promoted_sha256": digest(10_000 + i),
            "module": f"CardEleven.Inactive{i}",
        }
        for i in range(subject.EXPECTED_COORDINATOR_INACTIVE_FILES)
    ]
    return tuple(active + inactive)


def evidence() -> subject.PromotionEvidence:
    records = promoted_records()
    amendments = tuple(
        {
            "destination": records[index]["destination"],
            "manifest_sha256": records[index]["promoted_sha256"],
            "current_sha256": records[index]["promoted_sha256"],
            "source_commit": "1" * 40,
            "current_import_count": 1,
            "current_internal_import_count": 0,
            "external_import_deltas": {},
            "reason": "test amendment",
        }
        for index in range(4)
    )
    return subject.PromotionEvidence(
        generator_version={
            "script": {
                "path": subject.GENERATOR_PATH.as_posix(),
                "bytes": 10,
                "sha256": "1" * 64,
            },
            "promotion_schema": "card-eleven-unique-four-source-promotion-v2",
            "promotion_manifest": {
                "path": subject.PROMOTION_MANIFEST_PATH.as_posix(),
                "bytes": 20,
                "sha256": "2" * 64,
            },
            "support_amendments": list(amendments),
        },
        input_sha256="3" * 64,
        generated_source_sha256="4" * 64,
        lean_records=records,
        replay_asset_count=subject.EXPECTED_REPLAY_ASSETS,
        excluded_scopes=EXCLUDED_SCOPES,
        excluded_file_count=756,
        excluded_directory_count=12,
        support_amendments=amendments,
    )


def install_build_boundaries(
    monkeypatch: pytest.MonkeyPatch, *, excluded_publish_path: str | None = None
) -> subject.PromotionEvidence:
    checked = evidence()
    active = frozenset(
        record["destination"]
        for record in checked.lean_records[
            : subject.EXPECTED_COORDINATOR_ACTIVE_FILES
        ]
    )
    coordinator = active | {"lean/Erdos9796Proof/P97/SharedDependency.lean"}
    publish = active | {subject.INGRESS_PATH.as_posix()}
    if excluded_publish_path is not None:
        publish = publish | {excluded_publish_path}

    monkeypatch.setattr(
        subject, "_promotion_evidence", lambda _root, _head: checked
    )
    monkeypatch.setattr(subject, "_git_head", lambda _root: CURRENT_HEAD)
    monkeypatch.setattr(subject, "_git_is_ancestor", lambda *_args: True)

    def fake_spine(_root: Path, symbol: str | None = None) -> frozenset[str]:
        return frozenset(coordinator if symbol else publish)

    monkeypatch.setattr(subject, "_spine_paths", fake_spine)
    monkeypatch.setattr(
        subject,
        "_reference_freshness",
        lambda _root, _spine: dict(REFERENCE_FRESHNESS),
    )
    monkeypatch.setattr(
        subject,
        "_source_records",
        lambda _root, paths: [
            {"path": path, "bytes": len(path), "sha256": digest(index + 20_000)}
            for index, path in enumerate(sorted(paths))
        ],
    )
    monkeypatch.setattr(
        subject,
        "_axiom_audit",
        lambda _root: (
            [
                {"symbol": symbol, "axioms": ["propext"]}
                for symbol in subject.AXIOM_SYMBOLS
            ],
            ["propext"],
        ),
    )
    return checked


def finish_manifest(bank: dict[str, object]) -> dict[str, object]:
    manifest: dict[str, object] = {
        "schema": subject.TOP_SCHEMA,
        "bank_count": 1,
        "target_symbol": subject.TARGET_SYMBOL,
        "banks": [bank],
    }
    manifest["manifest_sha256"] = subject.manifest_self_hash(manifest)
    return manifest


def minimal_bank() -> dict[str, object]:
    return {
        "bank_id": subject.BANK_ID,
        "generator_entrypoint": subject.GENERATOR_PATH.as_posix(),
        "generator_version": {},
        "input_sha256": "1" * 64,
        "generated_source_sha256": "2" * 64,
        "lean_dependency_manifest_sha256": "3" * 64,
        "checker_theorem": subject.COORDINATOR_THEOREM,
        "aggregate_certificate_theorems": list(
            subject.AGGREGATE_CERTIFICATE_THEOREMS
        ),
        "public_projection_theorems": list(subject.PUBLIC_PROJECTION_THEOREMS),
        "trust_mode": "replay",
        "publication_reachable": True,
        "last_verified_head": HEAD,
        **REFERENCE_FRESHNESS,
    }


def test_required_fields_counts_and_inactive_roster(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    install_build_boundaries(monkeypatch)
    manifest = subject.build_manifest(verified_head=HEAD)
    assert manifest["schema"] == "publication-bank-manifests/v1"
    assert manifest["bank_count"] == 1
    assert manifest["target_symbol"] == "Problem97.erdos97_rhs"
    bank = manifest["banks"][0]
    assert subject._REQUIRED_BANK_FIELDS <= set(bank)
    assert bank["bank_id"] == "card-eleven-unique-four-certificate"
    assert bank["promotion_lean_file_count"] == 2_061
    assert bank["replay_asset_count"] == 1_656
    assert bank["coordinator_active_manifest_file_count"] == 2_057
    inactive = bank["coordinator_inactive_manifest_files"]
    assert [record["destination"] for record in inactive] == [
        (subject.PACKAGE_ROOT / f"Inactive{i}.lean").as_posix() for i in range(4)
    ]
    assert bank["manifest_scope_exclusions"] == list(EXCLUDED_SCOPES)
    assert bank["manifest_scope_excluded_file_count"] == 756
    assert bank["manifest_scope_excluded_directory_count"] == 12
    assert bank["proof_blueprint_build_fingerprint"] == BUILD_FINGERPRINT
    assert bank["coordinator_reference_module_count"] == 2_058
    assert bank["coordinator_reference_stale_count"] == 0
    assert bank["coordinator_reference_missing_count"] == 0


def test_excluded_root_must_be_off_publish_spine(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    excluded_file = (
        f"{EXCLUDED_SCOPES[0]['path']}/CompactWindowedRupReplay/Compose.lean"
    )
    install_build_boundaries(monkeypatch, excluded_publish_path=excluded_file)
    with pytest.raises(subject.ManifestAuditError, match="excluded scope"):
        subject.build_manifest(verified_head=HEAD)


@pytest.mark.parametrize("returncode", [0, 1])
def test_refs_check_accepts_clean_or_globally_stale_exit(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path, returncode: int
) -> None:
    prefix = "a" * 12

    def run(args: list[str], **_kwargs: object) -> subprocess.CompletedProcess[str]:
        assert args == ["proof-blueprint", "refs", "--check"]
        return subprocess.CompletedProcess(
            args,
            returncode,
            stdout=f"current build: {prefix}\n  stale: 36\n",
            stderr="",
        )

    monkeypatch.setattr(subject.subprocess, "run", run)
    assert subject._refs_current_build(tmp_path) == prefix


@pytest.mark.parametrize(
    "output",
    [
        "",
        f"current build: {'a' * 11}\n",
        f"current build: {'A' * 12}\n",
        f"current build: {'a' * 12} trailing\n",
        f"notice\ncurrent build: {'a' * 12}\n",
        f"current build: {'a' * 12}\ncurrent build: {'a' * 12}\n",
    ],
)
def test_refs_check_rejects_invalid_current_build_grammar(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path, output: str
) -> None:
    monkeypatch.setattr(
        subject.subprocess,
        "run",
        lambda args, **_kwargs: subprocess.CompletedProcess(
            args, 1, stdout=output, stderr=""
        ),
    )
    with pytest.raises(subject.ManifestAuditError, match="refs --check"):
        subject._refs_current_build(tmp_path)


def test_reference_freshness_records_one_current_fingerprint(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    fingerprint = "a" * 64
    write_blueprint_fixture(
        tmp_path,
        (("Baz", fingerprint), ("Foo.Bar", fingerprint)),
    )
    monkeypatch.setattr(subject, "_refs_current_build", lambda _root: "a" * 12)
    result = subject._reference_freshness(
        tmp_path,
        frozenset({"lean/Foo/Bar.lean", "lean/Baz.lean"}),
    )
    assert result == {
        "proof_blueprint_build_fingerprint": fingerprint,
        "coordinator_reference_module_count": 2,
        "coordinator_reference_stale_count": 0,
        "coordinator_reference_missing_count": 0,
    }


@pytest.mark.parametrize(
    ("rows", "prefix", "message"),
    [
        ((("Foo.Bar", "a" * 64),), "a" * 12, "missing 1 coordinator"),
        (
            (("Baz", "a" * 64), ("Foo.Bar", "b" * 64)),
            "a" * 12,
            "mixed proof-blueprint",
        ),
        (
            (("Baz", "b" * 64), ("Foo.Bar", "b" * 64)),
            "a" * 12,
            "older proof-blueprint",
        ),
        (
            (("Baz", "A" * 64), ("Foo.Bar", "A" * 64)),
            "a" * 12,
            "lowercase SHA-256",
        ),
    ],
)
def test_reference_freshness_rejects_missing_mixed_old_or_invalid_rows(
    monkeypatch: pytest.MonkeyPatch,
    tmp_path: Path,
    rows: tuple[tuple[str, str], ...],
    prefix: str,
    message: str,
) -> None:
    write_blueprint_fixture(tmp_path, rows)
    monkeypatch.setattr(subject, "_refs_current_build", lambda _root: prefix)
    with pytest.raises(subject.ManifestAuditError, match=message):
        subject._reference_freshness(
            tmp_path,
            frozenset({"lean/Foo/Bar.lean", "lean/Baz.lean"}),
        )


def test_reference_freshness_rejects_duplicate_module_rows(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    fingerprint = "a" * 64
    write_blueprint_fixture(
        tmp_path,
        (
            ("Baz", fingerprint),
            ("Foo.Bar", fingerprint),
            ("Foo.Bar", fingerprint),
        ),
        primary_key=False,
    )
    monkeypatch.setattr(subject, "_refs_current_build", lambda _root: "a" * 12)
    with pytest.raises(subject.ManifestAuditError, match="duplicate mined rows"):
        subject._reference_freshness(
            tmp_path,
            frozenset({"lean/Foo/Bar.lean", "lean/Baz.lean"}),
        )


def test_reference_freshness_rejects_invalid_config(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    (tmp_path / "lean").mkdir()
    (tmp_path / ".blueprint.toml").write_text(
        '[paths]\nlean_lib = "lean"\n', encoding="utf-8"
    )
    monkeypatch.setattr(subject, "_refs_current_build", lambda _root: "a" * 12)
    with pytest.raises(subject.ManifestAuditError, match="paths.db"):
        subject._reference_freshness(tmp_path, frozenset({"lean/Foo.lean"}))


def test_reference_freshness_rejects_invalid_database(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    (tmp_path / "lean").mkdir()
    (tmp_path / "data").mkdir()
    (tmp_path / ".blueprint.toml").write_text(
        '[paths]\ndb = "data/proof-blueprint.db"\nlean_lib = "lean"\n',
        encoding="utf-8",
    )
    (tmp_path / "data/proof-blueprint.db").write_bytes(b"not sqlite")
    monkeypatch.setattr(subject, "_refs_current_build", lambda _root: "a" * 12)
    with pytest.raises(subject.ManifestAuditError, match="invalid proof-blueprint"):
        subject._reference_freshness(tmp_path, frozenset({"lean/Foo.lean"}))


def test_reference_freshness_rejects_source_outside_configured_lean_lib(
    monkeypatch: pytest.MonkeyPatch, tmp_path: Path
) -> None:
    write_blueprint_fixture(tmp_path, (("Foo", "a" * 64),))
    monkeypatch.setattr(subject, "_refs_current_build", lambda _root: "a" * 12)
    with pytest.raises(subject.ManifestAuditError, match="outside paths.lean_lib"):
        subject._reference_freshness(tmp_path, frozenset({"other/Foo.lean"}))


def promotion_manifest() -> dict[str, object]:
    files = [
        {
            "source": f"scratch/source/F{i:04}.lean",
            "destination": (subject.PACKAGE_ROOT / f"F{i:04}.lean").as_posix(),
            "source_sha256": digest(i + 1),
            "promoted_sha256": digest(i + 3_000),
            "module": f"CardEleven.F{i:04}",
        }
        for i in range(subject.EXPECTED_PROMOTED_FILES)
    ]
    assets = [
        {
            "source": f"scratch/assets/A{i:04}.bin",
            "destination": (subject.PACKAGE_ROOT / f"data/A{i:04}.bin").as_posix(),
            "sha256": digest(i + 6_000),
            "byte_count": i,
        }
        for i in range(subject.EXPECTED_REPLAY_ASSETS)
    ]
    return {
        "schema": "card-eleven-unique-four-source-promotion-v2",
        "source_log": {"path": "scratch/source.log", "sha256": "f" * 64},
        "files": files,
        "replay_asset_promotion": {"files": assets},
    }


def test_promotion_hashes_detect_source_and_generated_drift() -> None:
    manifest = promotion_manifest()
    input_sha, generated_sha, _records, _assets = (
        subject._normalize_promotion_manifest(manifest)
    )
    manifest["files"][0]["source_sha256"] = "e" * 64
    changed_input, unchanged_generated, _records, _assets = (
        subject._normalize_promotion_manifest(manifest)
    )
    assert changed_input != input_sha
    assert unchanged_generated == generated_sha
    manifest["files"][0]["promoted_sha256"] = "d" * 64
    _input, changed_generated, _records, _assets = (
        subject._normalize_promotion_manifest(manifest)
    )
    assert changed_generated != generated_sha


def test_live_promoted_hash_drift_is_rejected(tmp_path: Path) -> None:
    destination = Path("lean/CardEleven/F.lean")
    full_path = tmp_path / destination
    full_path.parent.mkdir(parents=True)
    full_path.write_bytes(b"original\n")
    original_sha = subject._file_record(tmp_path, destination)["sha256"]
    historical = (
        {
            "destination": destination.as_posix(),
            "promoted_sha256": str(original_sha),
            "module": "CardEleven.F",
        },
    )
    records = subject._live_promoted_records(tmp_path, historical, ())
    assert records[0]["promoted_sha256"] == original_sha
    full_path.write_bytes(b"drift\n")
    with pytest.raises(subject.ManifestAuditError, match="unrecorded"):
        subject._live_promoted_records(tmp_path, historical, ())


def test_promotion_boundary_binds_exclusions_amendments_and_history(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    roots = tuple(path for path, _kind in subject.EXPECTED_EXCLUDED_SCOPES)
    amendment_rows = [
        {
            "destination": (subject.PACKAGE_ROOT / f"Amended{i}.lean").as_posix(),
            "manifest_sha256": digest(30_000 + i),
            "current_sha256": digest(31_000 + i),
            "source_commit": "1" * 40 if i < 3 else "2" * 40,
            "current_import_count": 1,
            "current_internal_import_count": 0,
            "external_import_deltas": {},
            "reason": "approved test amendment",
        }
        for i in range(4)
    ]
    amendment_bindings = object()
    monkeypatch.setattr(subject.promotion, "MANIFEST_SCOPE_EXCLUDED_ROOTS", roots)
    monkeypatch.setattr(
        subject.promotion,
        "MANIFEST_SCOPE_SUPPORT_AMENDMENTS",
        amendment_bindings,
        raising=False,
    )
    called: dict[str, object] = {}

    def fake_check(**kwargs: object) -> dict[str, object]:
        called.update(kwargs)
        return {
            "promoted": 2_061,
            "assets": 1_656,
            "excluded_extra_files": 756,
            "excluded_extra_directories": 12,
            "allowed_extra_roots": [path.as_posix() for path in roots],
            "support_amendments": amendment_rows,
        }

    monkeypatch.setattr(subject.promotion, "check_installed_promotion", fake_check)
    monkeypatch.setattr(
        subject,
        "_normalize_excluded_scopes",
        lambda _root, _roots: tuple(
            sorted(
                subject.EXPECTED_EXCLUDED_SCOPES,
                key=lambda item: item[0].as_posix(),
            )
        ),
    )
    manifest_file = tmp_path / "promotion-manifest.json"
    manifest_file.write_bytes(b"{}")
    monkeypatch.setattr(subject, "_repo_file", lambda *_args: manifest_file)
    monkeypatch.setattr(
        subject,
        "_strict_json_bytes",
        lambda *_args: {"schema": "card-eleven-unique-four-source-promotion-v2"},
    )
    historical = tuple(
        {
            "destination": row["destination"],
            "promoted_sha256": row["manifest_sha256"],
            "module": f"CardEleven.Amended{i}",
        }
        for i, row in enumerate(amendment_rows)
    )
    seen_amendments: list[tuple[dict[str, object], ...]] = []

    def fake_normalize(
        _manifest: dict[str, object],
        amendments: tuple[dict[str, object], ...],
    ) -> tuple[str, str, tuple[dict[str, str], ...], int]:
        seen_amendments.append(amendments)
        return "5" * 64, "6" * 64, historical, 1_656

    monkeypatch.setattr(subject, "_normalize_promotion_manifest", fake_normalize)
    monkeypatch.setattr(
        subject,
        "_live_promoted_records",
        lambda _root, records, _amendments: records,
    )
    monkeypatch.setattr(
        subject,
        "_file_record",
        lambda _root, path: {"path": path.as_posix(), "bytes": 1, "sha256": "7" * 64},
    )
    monkeypatch.setattr(subject, "_git_head", lambda _root: CURRENT_HEAD)
    ancestry: list[tuple[str, str]] = []

    def fake_ancestor(_root: Path, ancestor: str, descendant: str) -> bool:
        ancestry.append((ancestor, descendant))
        return True

    monkeypatch.setattr(subject, "_git_is_ancestor", fake_ancestor)
    checked = subject._promotion_evidence(tmp_path, HEAD)
    assert called == {
        "allowed_extra_roots": roots,
        "support_amendments": amendment_bindings,
    }
    assert seen_amendments == [checked.support_amendments]
    assert checked.generator_version["support_amendments"] == list(
        checked.support_amendments
    )
    assert all(
        len(str(record["source_commit"])) == 40
        for record in checked.support_amendments
    )
    assert set(ancestry) == {
        ("1" * 40, HEAD),
        ("1" * 40, CURRENT_HEAD),
        ("2" * 40, HEAD),
        ("2" * 40, CURRENT_HEAD),
    }


def test_support_amendments_reject_non_full_source_commit() -> None:
    rows = [
        {
            "destination": (subject.PACKAGE_ROOT / f"Amended{i}.lean").as_posix(),
            "manifest_sha256": digest(40_000 + i),
            "current_sha256": digest(41_000 + i),
            "source_commit": "12345678" if i == 0 else "1" * 40,
            "current_import_count": 1,
            "current_internal_import_count": 0,
            "external_import_deltas": {},
            "reason": "test amendment",
        }
        for i in range(4)
    ]
    with pytest.raises(subject.ManifestAuditError, match="full lowercase Git SHA"):
        subject._normalize_support_amendments(rows)


def axiom_output(symbol: str, rows: list[tuple[str, str]]) -> str:
    rendered = [
        f"axioms reported by `#print axioms {symbol}` ({len(rows)}):",
        *(f"      {classification}  {axiom}" for classification, axiom in rows),
    ]
    native_count = sum(classification == "core*" for classification, _ in rows)
    if native_count:
        rendered.extend(
            [
                "",
                f"  * native-reduction trust ({native_count}): the Lean compiler, interpreter, and all",
                "    @[implemented_by]/@[extern] annotations are in the trusted base (native_decide,",
                "    Lean.reduceBool). Core-allowed; no [axioms].approved entry needed.",
            ]
        )
    return "\n".join(rendered) + "\n"


@pytest.mark.parametrize(
    "output",
    [
        axiom_output("S", [("core", "Custom.axiom")]),
        axiom_output("S", [("core", "sorryAx")]),
        "unknown declaration S\n",
    ],
)
def test_axiom_parser_rejects_unknown_or_unapproved_output(output: str) -> None:
    with pytest.raises(subject.ManifestAuditError):
        subject._parse_axioms("S", output)


def test_axiom_queries_are_sequential_and_store_union(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    calls: list[str] = []

    def fake_subprocess(
        args: list[str], _root: Path, *, label: str
    ) -> subprocess.CompletedProcess[str]:
        del label
        symbol = args[-1]
        calls.append(symbol)
        rows = [("core", "propext")]
        if symbol == subject.AXIOM_SYMBOLS[0]:
            rows.append(("core*", "Lean.trustCompiler"))
        return subprocess.CompletedProcess(args, 0, axiom_output(symbol, rows), "")

    monkeypatch.setattr(subject, "_subprocess", fake_subprocess)
    closures, union = subject._axiom_audit(Path("."))
    assert calls == list(subject.AXIOM_SYMBOLS)
    assert [closure["symbol"] for closure in closures] == list(subject.AXIOM_SYMBOLS)
    assert union == ["Lean.trustCompiler", "propext"]


def test_self_hash_excludes_only_its_own_field() -> None:
    manifest = finish_manifest(minimal_bank())
    claimed = manifest["manifest_sha256"]
    assert claimed == subject.manifest_self_hash(manifest)
    manifest["manifest_sha256"] = "0" * 64
    assert subject.manifest_self_hash(manifest) == claimed
    manifest["banks"][0]["input_sha256"] = "9" * 64
    assert subject.manifest_self_hash(manifest) != claimed


def fail_if_called(*_args: object, **_kwargs: object) -> None:
    raise AssertionError("expensive work or write ran before head validation")


def test_generate_rejects_non_full_head_before_live_work(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    output = tmp_path / "manifest.json"
    monkeypatch.setattr(subject, "_git_head", fail_if_called)
    monkeypatch.setattr(subject, "_promotion_evidence", fail_if_called)
    monkeypatch.setattr(subject, "_atomic_write", fail_if_called)
    with pytest.raises(subject.ManifestAuditError, match="full lowercase Git SHA"):
        subject.generate_manifest(
            output, repo_root=tmp_path, verified_head="a" * 8
        )
    assert not output.exists()


def test_generate_rejects_divergent_head_before_live_work(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    output = tmp_path / "manifest.json"
    monkeypatch.setattr(subject, "_git_head", lambda _root: CURRENT_HEAD)
    monkeypatch.setattr(subject, "_git_is_ancestor", lambda *_args: False)
    monkeypatch.setattr(subject, "_promotion_evidence", fail_if_called)
    monkeypatch.setattr(subject, "_atomic_write", fail_if_called)
    with pytest.raises(subject.ManifestAuditError, match="not an ancestor"):
        subject.generate_manifest(output, repo_root=tmp_path, verified_head=HEAD)
    assert not output.exists()


def test_generate_rejects_unknown_full_head_before_live_work(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    output = tmp_path / "manifest.json"
    monkeypatch.setattr(subject, "_git_head", lambda _root: CURRENT_HEAD)

    def unknown_commit(
        args: list[str], **_kwargs: object
    ) -> subprocess.CompletedProcess[str]:
        return subprocess.CompletedProcess(
            args, 128, "", "fatal: not a valid commit name"
        )

    monkeypatch.setattr(subject.subprocess, "run", unknown_commit)
    monkeypatch.setattr(subject, "_promotion_evidence", fail_if_called)
    monkeypatch.setattr(subject, "_atomic_write", fail_if_called)
    with pytest.raises(subject.ManifestAuditError, match="merge-base"):
        subject.generate_manifest(output, repo_root=tmp_path, verified_head=HEAD)
    assert not output.exists()


def test_default_generation_uses_current_head_without_ancestor_probe(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    install_build_boundaries(monkeypatch)
    monkeypatch.setattr(subject, "_git_head", lambda _root: CURRENT_HEAD)
    monkeypatch.setattr(subject, "_git_is_ancestor", fail_if_called)
    manifest = subject.build_manifest(repo_root=tmp_path)
    assert manifest["banks"][0]["last_verified_head"] == CURRENT_HEAD


def test_check_rejects_nonancestor_verified_head(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    path = tmp_path / "manifest.json"
    manifest = finish_manifest(minimal_bank())
    path.write_bytes(subject.canonical_json_bytes(manifest))
    monkeypatch.setattr(subject, "_git_head", lambda _root: CURRENT_HEAD)
    monkeypatch.setattr(subject, "_git_is_ancestor", lambda *_args: False)
    with pytest.raises(subject.ManifestAuditError, match="not an ancestor"):
        subject.check_manifest(path)


def test_check_rejects_regenerated_semantic_drift(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    path = tmp_path / "manifest.json"
    stored = finish_manifest(minimal_bank())
    path.write_bytes(subject.canonical_json_bytes(stored))
    changed_bank = minimal_bank()
    changed_bank["input_sha256"] = "8" * 64
    regenerated = finish_manifest(changed_bank)
    monkeypatch.setattr(subject, "_git_head", lambda _root: CURRENT_HEAD)
    monkeypatch.setattr(subject, "_git_is_ancestor", lambda *_args: True)
    monkeypatch.setattr(subject, "build_manifest", lambda **_kwargs: regenerated)
    with pytest.raises(subject.ManifestAuditError, match="semantic drift"):
        subject.check_manifest(path)


def test_check_rejects_noncanonical_bytes(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    path = tmp_path / "manifest.json"
    stored = finish_manifest(minimal_bank())
    path.write_text(
        __import__("json").dumps(stored, sort_keys=True), encoding="utf-8"
    )
    monkeypatch.setattr(subject, "_git_head", lambda _root: CURRENT_HEAD)
    monkeypatch.setattr(subject, "_git_is_ancestor", lambda *_args: True)
    monkeypatch.setattr(subject, "build_manifest", lambda **_kwargs: stored)
    with pytest.raises(subject.ManifestAuditError, match="byte encoding drift"):
        subject.check_manifest(path)


def test_check_regenerates_with_the_stored_verified_head(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    path = tmp_path / "manifest.json"
    stored = finish_manifest(minimal_bank())
    path.write_bytes(subject.canonical_json_bytes(stored))
    monkeypatch.setattr(subject, "_git_head", lambda _root: CURRENT_HEAD)
    monkeypatch.setattr(subject, "_git_is_ancestor", lambda *_args: True)
    seen: list[str | None] = []

    def regenerate(**kwargs: object) -> dict[str, object]:
        seen.append(kwargs.get("verified_head"))
        return stored

    monkeypatch.setattr(subject, "build_manifest", regenerate)
    assert subject.check_manifest(path) == stored
    assert seen == [HEAD]
