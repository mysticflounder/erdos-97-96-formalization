from __future__ import annotations

import copy
import hashlib
import importlib
import os
from pathlib import Path
from typing import Any

import pytest

from census.cap_configuration import schema as json_schema

producer_ref = importlib.import_module("census.p97_search.cegar_producer_ref")


def _digest(index: int) -> str:
    return f"{index:064x}"


def _lean_reference(*, publication: bool = False) -> dict[str, Any]:
    reachability = (
        {
            "consumer_producer_ref_sha256": _digest(11),
            "reachability_receipt_sha256": _digest(12),
        }
        if publication
        else None
    )
    return producer_ref.build_producer_ref(
        producer={
            "kind": producer_ref.LEAN_DECLARATION,
            "qualified_name": "Problem97.Checked.sourceCoverage",
        },
        normalized_statement_sha256=_digest(1),
        hypothesis_sha256=_digest(2),
        import_sha256=_digest(3),
        transitive_source_sha256=_digest(4),
        repository={
            "revision": "5" * 40,
            "dirty_state": producer_ref.CLEAN,
            "dirty_state_sha256": None,
        },
        toolchain={
            "kind": producer_ref.LEAN_TOOLCHAIN,
            "identity_sha256": _digest(6),
        },
        trust_classification="LEAN_KERNEL_CHECKED",
        input_digests={"source-scope": _digest(8), "root-formula": _digest(7)},
        validation_receipt_sha256=_digest(9),
        consumer_reachability=reachability,
    )


def _external_reference() -> dict[str, Any]:
    return producer_ref.build_producer_ref(
        producer={
            "kind": producer_ref.EXTERNAL_CHECKER,
            "registry_id": "p97.closed-checker",
            "executable_sha256": _digest(20),
        },
        normalized_statement_sha256=_digest(21),
        hypothesis_sha256=_digest(22),
        import_sha256=_digest(23),
        transitive_source_sha256=_digest(24),
        repository={
            "revision": "a" * 64,
            "dirty_state": producer_ref.DIRTY,
            "dirty_state_sha256": _digest(25),
        },
        toolchain={
            "kind": producer_ref.EXTERNAL_TOOLCHAIN,
            "identity_sha256": _digest(26),
        },
        trust_classification="P97_CLOSED_REGISTRY_CHECKED",
        input_digests={},
        validation_receipt_sha256=_digest(27),
    )


def _rehash(reference: dict[str, Any]) -> None:
    unsigned = copy.deepcopy(reference)
    unsigned.pop("producer_ref_sha256", None)
    reference["producer_ref_sha256"] = hashlib.sha256(
        json_schema.canonical_json_bytes(unsigned)
    ).hexdigest()


def _set_path(reference: dict[str, Any], path: tuple[str, ...], value: Any) -> None:
    target: dict[str, Any] = reference
    for component in path[:-1]:
        target = target[component]
    target[path[-1]] = value


def test_lean_reference_is_deterministic_and_pointer_is_exact() -> None:
    reference = _lean_reference()

    assert reference["schema"] == producer_ref.SCHEMA
    assert [entry["name"] for entry in reference["input_digests"]] == [
        "root-formula",
        "source-scope",
    ]
    producer_ref.validate_producer_ref(reference)
    assert producer_ref.producer_ref_pointer(reference) == {
        "producer_ref_sha256": reference["producer_ref_sha256"]
    }
    assert _lean_reference() == reference


def test_external_reference_binds_dirty_state_and_checker_bytes() -> None:
    reference = _external_reference()

    producer_ref.validate_producer_ref(reference)
    assert reference["producer"]["executable_sha256"] == _digest(20)
    assert reference["repository"]["dirty_state_sha256"] == _digest(25)


def test_publication_requires_checked_consumer_reachability() -> None:
    with pytest.raises(
        producer_ref.ProducerRefError,
        match="lacks consumer reachability",
    ):
        producer_ref.validate_publication_producer_ref(_lean_reference())

    producer_ref.validate_publication_producer_ref(_lean_reference(publication=True))


@pytest.mark.parametrize(
    ("path", "replacement", "message"),
    [
        (("schema",), "p97-cegar-producer-ref/v2", "schema"),
        (("normalized_statement_sha256",), "A" * 64, "SHA-256"),
        (("hypothesis_sha256",), "0" * 63, "SHA-256"),
        (("import_sha256",), True, "SHA-256"),
        (("transitive_source_sha256",), None, "SHA-256"),
        (("repository", "revision"), "not-a-revision", "revision"),
        (("repository", "dirty_state"), "UNKNOWN", "dirty_state"),
        (("toolchain", "kind"), "EXTERNAL", "must be LEAN"),
        (("toolchain", "identity_sha256"), "f" * 65, "SHA-256"),
        (("trust_classification",), "caller says true", "canonical token"),
        (("validation_receipt_sha256",), {}, "SHA-256"),
    ],
)
def test_recomputed_outer_hash_does_not_hide_invalid_fields(
    path: tuple[str, ...], replacement: Any, message: str
) -> None:
    reference = _lean_reference()
    _set_path(reference, path, replacement)
    _rehash(reference)

    with pytest.raises(producer_ref.ProducerRefError, match=message):
        producer_ref.validate_producer_ref(reference)


def test_clean_and_dirty_repository_states_are_cross_checked() -> None:
    reference = _lean_reference()
    reference["repository"]["dirty_state_sha256"] = _digest(30)
    _rehash(reference)
    with pytest.raises(producer_ref.ProducerRefError, match="clean repository"):
        producer_ref.validate_producer_ref(reference)

    reference["repository"]["dirty_state"] = producer_ref.DIRTY
    reference["repository"]["dirty_state_sha256"] = None
    _rehash(reference)
    with pytest.raises(producer_ref.ProducerRefError, match="SHA-256"):
        producer_ref.validate_producer_ref(reference)


def test_producer_identity_uses_an_exact_tagged_shape() -> None:
    reference = _lean_reference()
    reference["producer"]["registry_id"] = "not-allowed-on-lean"
    _rehash(reference)
    with pytest.raises(producer_ref.ProducerRefError, match="keys mismatch"):
        producer_ref.validate_producer_ref(reference)

    external = _external_reference()
    external["producer"]["executable_sha256"] = "g" * 64
    _rehash(external)
    with pytest.raises(producer_ref.ProducerRefError, match="SHA-256"):
        producer_ref.validate_producer_ref(external)


def test_input_digests_are_unique_and_name_sorted() -> None:
    reference = _lean_reference()
    reference["input_digests"].reverse()
    _rehash(reference)
    with pytest.raises(producer_ref.ProducerRefError, match="name-sorted"):
        producer_ref.validate_producer_ref(reference)

    reference = _lean_reference()
    reference["input_digests"].append(copy.deepcopy(reference["input_digests"][0]))
    _rehash(reference)
    with pytest.raises(producer_ref.ProducerRefError, match="unique"):
        producer_ref.validate_producer_ref(reference)


def test_input_digest_count_is_bounded() -> None:
    inputs = {
        f"input-{index:04d}": _digest(index + 100)
        for index in range(producer_ref.MAX_INPUT_DIGESTS + 1)
    }

    with pytest.raises(producer_ref.ProducerRefError, match="too many entries"):
        producer_ref.build_producer_ref(
            producer={
                "kind": producer_ref.LEAN_DECLARATION,
                "qualified_name": "Problem97.Checked.sourceCoverage",
            },
            normalized_statement_sha256=_digest(1),
            hypothesis_sha256=_digest(2),
            import_sha256=_digest(3),
            transitive_source_sha256=_digest(4),
            repository={
                "revision": "5" * 40,
                "dirty_state": producer_ref.CLEAN,
                "dirty_state_sha256": None,
            },
            toolchain={
                "kind": producer_ref.LEAN_TOOLCHAIN,
                "identity_sha256": _digest(6),
            },
            trust_classification="LEAN_KERNEL_CHECKED",
            input_digests=inputs,
            validation_receipt_sha256=_digest(9),
        )


@pytest.mark.parametrize(
    "field",
    ["verified", "supports_source_promotion", "supports_theorem_promotion"],
)
def test_caller_controlled_authority_fields_are_unknown(field: str) -> None:
    reference = _lean_reference()
    reference[field] = True
    _rehash(reference)

    with pytest.raises(producer_ref.ProducerRefError, match="extra"):
        producer_ref.validate_producer_ref(reference)


def test_missing_field_and_stale_self_hash_fail_closed() -> None:
    missing = _lean_reference()
    missing.pop("hypothesis_sha256")
    _rehash(missing)
    with pytest.raises(producer_ref.ProducerRefError, match="missing"):
        producer_ref.validate_producer_ref(missing)

    stale = _lean_reference()
    stale["import_sha256"] = _digest(63)
    with pytest.raises(producer_ref.ProducerRefError, match="does not authenticate"):
        producer_ref.validate_producer_ref(stale)


def test_malformed_in_memory_object_keys_use_the_contract_error() -> None:
    with pytest.raises(producer_ref.ProducerRefError, match="non-string object key"):
        producer_ref.validate_producer_ref({1: "not-json"})


def test_canonical_bytes_reject_duplicate_keys_and_alternate_spelling() -> None:
    payload = producer_ref.canonical_producer_ref_bytes(_lean_reference())
    assert payload.endswith(b"\n") and not payload.endswith(b"\n\n")
    assert producer_ref.parse_producer_ref_bytes(payload) == _lean_reference()

    duplicate = b'{"schema":"p97-cegar-producer-ref/v1",' + payload[1:-1] + b"\n"
    with pytest.raises(producer_ref.ProducerRefError, match="duplicate JSON"):
        producer_ref.parse_producer_ref_bytes(duplicate)

    for malformed in (b" " + payload, payload[:-1], payload + b"\n"):
        with pytest.raises(producer_ref.ProducerRefError):
            producer_ref.parse_producer_ref_bytes(malformed)


@pytest.mark.parametrize(
    "payload",
    [
        b'{"value":1.5}\n',
        b'{"value":NaN}\n',
        b'{"value":"\xff"}\n',
    ],
)
def test_parser_rejects_float_nonfinite_and_invalid_utf8(payload: bytes) -> None:
    with pytest.raises(producer_ref.ProducerRefError):
        producer_ref.parse_producer_ref_bytes(payload)


def test_parser_rejects_oversized_input_before_json_work() -> None:
    with pytest.raises(producer_ref.ProducerRefError, match="size limit"):
        producer_ref.parse_producer_ref_bytes(
            b"x" * (producer_ref.MAX_DOCUMENT_BYTES + 1)
        )


def test_publish_is_create_once_and_load_replays_custody(tmp_path: Path) -> None:
    reference = _lean_reference(publication=True)
    path = tmp_path / "producer-ref.json"

    published = producer_ref.publish_producer_ref(path, reference)
    assert published == path.absolute()
    assert path.read_bytes() == producer_ref.canonical_producer_ref_bytes(reference)
    assert producer_ref.load_producer_ref(path) == reference

    with pytest.raises(producer_ref.ProducerRefError, match="refusing to overwrite"):
        producer_ref.publish_producer_ref(path, reference)


def test_artifact_paths_must_be_absolute_and_lexically_canonical(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    path = tmp_path / "producer-ref.json"
    producer_ref.publish_producer_ref(path, _lean_reference())
    monkeypatch.chdir(tmp_path)

    with pytest.raises(producer_ref.ProducerRefError, match="absolute"):
        producer_ref.load_producer_ref(Path("producer-ref.json"))
    with pytest.raises(producer_ref.ProducerRefError, match="lexically canonical"):
        producer_ref.load_producer_ref(tmp_path / "child" / ".." / path.name)
    with pytest.raises(producer_ref.ProducerRefError, match="lexically canonical"):
        producer_ref.load_producer_ref(f"{tmp_path}//{path.name}")


def test_custody_fails_closed_without_posix_no_follow_support(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    path = tmp_path / "producer-ref.json"
    producer_ref.publish_producer_ref(path, _lean_reference())
    monkeypatch.delattr(producer_ref.os, "O_NOFOLLOW")

    with pytest.raises(producer_ref.ProducerRefError, match="POSIX no-follow"):
        producer_ref.load_producer_ref(path)


def test_custody_fails_closed_without_dir_fd_capability_sets(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    path = tmp_path / "producer-ref.json"
    producer_ref.publish_producer_ref(path, _lean_reference())
    monkeypatch.delattr(producer_ref.os, "supports_dir_fd")

    with pytest.raises(producer_ref.ProducerRefError, match="POSIX dir-fd"):
        producer_ref.load_producer_ref(path)


def test_loader_rejects_symlink_ancestor_and_hardlink(tmp_path: Path) -> None:
    reference = _lean_reference()
    real = tmp_path / "real"
    real.mkdir()
    path = real / "producer-ref.json"
    producer_ref.publish_producer_ref(path, reference)

    alias = tmp_path / "alias"
    alias.symlink_to(real, target_is_directory=True)
    with pytest.raises(producer_ref.ProducerRefError, match="unsafe ancestor"):
        producer_ref.load_producer_ref(alias / path.name)

    hardlink = tmp_path / "hardlink.json"
    os.link(path, hardlink)
    with pytest.raises(producer_ref.ProducerRefError, match="single-link regular"):
        producer_ref.load_producer_ref(path)


def test_final_symlink_and_nonfile_publication_collisions_are_rejected(
    tmp_path: Path,
) -> None:
    reference = _lean_reference()
    source = tmp_path / "source.json"
    producer_ref.publish_producer_ref(source, reference)

    symlink = tmp_path / "symlink.json"
    symlink.symlink_to(source)
    with pytest.raises(producer_ref.ProducerRefError, match="cannot read"):
        producer_ref.load_producer_ref(symlink)
    with pytest.raises(producer_ref.ProducerRefError, match="refusing to overwrite"):
        producer_ref.publish_producer_ref(symlink, reference)

    directory = tmp_path / "directory.json"
    directory.mkdir()
    with pytest.raises(producer_ref.ProducerRefError, match="refusing to overwrite"):
        producer_ref.publish_producer_ref(directory, reference)

    fifo = tmp_path / "collision.fifo"
    os.mkfifo(fifo)
    with pytest.raises(producer_ref.ProducerRefError, match="refusing to overwrite"):
        producer_ref.publish_producer_ref(fifo, reference)


def test_loader_rejects_fifo_without_blocking(tmp_path: Path) -> None:
    fifo = tmp_path / "producer-ref.fifo"
    os.mkfifo(fifo)

    with pytest.raises(producer_ref.ProducerRefError, match="single-link regular"):
        producer_ref.load_producer_ref(fifo)


def test_failed_publication_removes_its_partial_file(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    path = tmp_path / "producer-ref.json"

    def fail_write(_descriptor: int, _payload: object) -> int:
        raise OSError("injected write failure")

    monkeypatch.setattr(producer_ref.os, "write", fail_write)
    with pytest.raises(producer_ref.ProducerRefError, match="cannot publish"):
        producer_ref.publish_producer_ref(path, _lean_reference())
    assert not path.exists()


def test_loader_detects_source_mutation_during_read(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    path = tmp_path / "producer-ref.json"
    producer_ref.publish_producer_ref(path, _lean_reference())
    real_read = os.read
    changed = False

    def racing_read(descriptor: int, count: int) -> bytes:
        nonlocal changed
        payload = real_read(descriptor, count)
        if payload and not changed:
            changed = True
            with path.open("r+b") as output:
                output.seek(0)
                output.write(b"X")
                output.flush()
                os.fsync(output.fileno())
        return payload

    monkeypatch.setattr(producer_ref.os, "read", racing_read)
    with pytest.raises(producer_ref.ProducerRefError, match="mutated during read"):
        producer_ref.load_producer_ref(path)


def test_loader_detects_path_replacement_during_read(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    path = tmp_path / "producer-ref.json"
    reference = _lean_reference()
    producer_ref.publish_producer_ref(path, reference)
    original_bytes = path.read_bytes()
    real_read = os.read
    replaced = False

    def racing_read(descriptor: int, count: int) -> bytes:
        nonlocal replaced
        payload = real_read(descriptor, count)
        if payload and not replaced:
            replaced = True
            path.rename(tmp_path / "original.json")
            path.write_bytes(original_bytes)
        return payload

    monkeypatch.setattr(producer_ref.os, "read", racing_read)
    with pytest.raises(
        producer_ref.ProducerRefError,
        match="mutated during read|path changed",
    ):
        producer_ref.load_producer_ref(path)
