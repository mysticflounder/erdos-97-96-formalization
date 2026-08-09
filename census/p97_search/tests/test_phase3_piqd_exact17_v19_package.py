from __future__ import annotations

import hashlib
import json
from pathlib import Path
from typing import Any

import pytest

from census.p97_search import phase3_piqd_exact17_semantic as semantic
from census.p97_search import phase3_piqd_exact17_v19_package as package


@pytest.fixture(scope="module")
def live_files() -> dict[str, bytes]:
    root = Path(__file__).resolve().parents[3]
    files, _ = package.build_package(repo_root=root)
    return files


def _sha(raw: bytes) -> str:
    return hashlib.sha256(raw).hexdigest()


def _rebind(files: dict[str, bytes], changed: str) -> None:
    producer = semantic.load_strict_json(files["producer-manifest.json"])
    if changed in producer["artifacts"]:
        producer["artifacts"][changed] = _sha(files[changed])
        files["producer-manifest.json"] = semantic.canonical_json(producer)
    wave = semantic.load_strict_json(files["wave-manifest.json"])
    wave["encoding"]["producer_manifest_sha256"] = _sha(files["producer-manifest.json"])
    files["wave-manifest.json"] = semantic.canonical_json(wave)
    result = semantic.load_strict_json(files["package-result.json"])
    for name in result["artifacts"]:
        result["artifacts"][name] = _sha(files[name])
    files["package-result.json"] = semantic.canonical_json(result)


def test_live_package_is_deterministic_and_exact(live_files: dict[str, bytes]) -> None:
    root = Path(__file__).resolve().parents[3]
    second, bundle = package.build_package(repo_root=root)
    assert second == live_files
    assert package.validate_package_files(second) == bundle
    assert set(second) == package.PACKAGE_FILES
    assert _sha(second["upstream-manifest.json"]) == package.PINNED_MANIFEST_SHA256
    assert _sha(second["discovery.cnf"]) == package.PINNED_CNF_SHA256
    assert _sha(second["producer-provenance.json"]) == package.PINNED_SIDECAR_SHA256
    assert len(bundle.payload["sources"]) == 9
    assert len(bundle.payload["inputs"]) == 45


@pytest.mark.parametrize(
    "name",
    [
        "upstream-manifest.json",
        "discovery.cnf",
        "producer-provenance.json",
        "variable-map.json",
        "semantic-package.json",
    ],
)
def test_package_rejects_primary_artifact_tamper(
    live_files: dict[str, bytes], name: str
) -> None:
    files = dict(live_files)
    files[name] += b"x"
    with pytest.raises(Exception, match="changed|mismatch|differs|invalid"):
        package.validate_package_files(files)


@pytest.mark.parametrize("collection", ["sources", "inputs"])
def test_package_rejects_embedded_source_or_input_tamper(
    live_files: dict[str, bytes], collection: str
) -> None:
    files = dict(live_files)
    bundle = semantic.load_strict_json(files["source-bundle.json"])
    bundle[collection][0]["base64"] = "eA=="
    files["source-bundle.json"] = semantic.canonical_json(bundle)
    _rebind(files, "source-bundle.json")
    with pytest.raises(semantic.SemanticCustodyError):
        package.validate_package_files(files)


def test_package_rejects_duplicate_json_keys(live_files: dict[str, bytes]) -> None:
    files = dict(live_files)
    files["producer-manifest.json"] = b'{"schema":"x","schema":"y"}'
    with pytest.raises(semantic.SemanticCustodyError, match="duplicate"):
        package.validate_package_files(files)


def test_package_rejects_bool_as_core_limit(live_files: dict[str, bytes]) -> None:
    files = dict(live_files)
    producer = semantic.load_strict_json(files["producer-manifest.json"])
    producer["requested_core_limit"] = True
    files["producer-manifest.json"] = semantic.canonical_json(producer)
    _rebind(files, "producer-manifest.json")
    with pytest.raises(package.Exact17V19PackageError, match="core limit"):
        package.validate_package_files(files)


def test_package_rejects_nonfinite_json(live_files: dict[str, bytes]) -> None:
    files = dict(live_files)
    files["producer-manifest.json"] = b'{"value":NaN}'
    with pytest.raises(semantic.SemanticCustodyError, match="non-finite"):
        package.validate_package_files(files)


def test_package_output_rejects_symlink(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, live_files: dict[str, bytes]
) -> None:
    root = tmp_path / "real"
    root.mkdir()
    link = tmp_path / "link"
    link.symlink_to(root, target_is_directory=True)
    monkeypatch.setattr(
        package,
        "build_package",
        lambda **_kwargs: (
            dict(live_files),
            package.validate_package_files(live_files),
        ),
    )
    with pytest.raises(Exception, match="symlink|non-directory"):
        package.package_exact17_v19(repo_root=tmp_path, output_dir=link)


def test_package_output_rejects_collision(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, live_files: dict[str, bytes]
) -> None:
    output = tmp_path / "package"
    output.mkdir()
    (output / "discovery.cnf").write_bytes(b"wrong")
    monkeypatch.setattr(
        package,
        "build_package",
        lambda **_kwargs: (
            dict(live_files),
            package.validate_package_files(live_files),
        ),
    )
    with pytest.raises(Exception, match="different existing artifact"):
        package.package_exact17_v19(repo_root=tmp_path, output_dir=output)


def test_package_input_rejects_symlinked_parent_component(tmp_path: Path) -> None:
    real = tmp_path / "real"
    real.mkdir()
    (real / "input.json").write_bytes(b"{}")
    linked_parent = tmp_path / "linked-parent"
    linked_parent.symlink_to(real, target_is_directory=True)

    with pytest.raises(package.Exact17V19PackageError, match="safely capture"):
        package._read_regular(
            linked_parent,
            "input.json",
            maximum_bytes=16,
        )


def test_manifest_contract_has_exact_builtin_counts(
    live_files: dict[str, bytes],
) -> None:
    producer: dict[str, Any] = json.loads(live_files["producer-manifest.json"])
    assert type(producer["requested_core_limit"]) is int
    assert producer["requested_core_limit"] == 1
    assert producer["identity"]["variables"] == 74_813
    assert producer["identity"]["clauses"] == 2_875_629
    assert all(
        value is False
        for key, value in producer["claims"].items()
        if key
        in {
            "aggregate_order_case_coverage",
            "universal_lift",
            "theorem_closure",
            "lean_checked",
        }
    )
