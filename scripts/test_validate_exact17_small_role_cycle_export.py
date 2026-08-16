from __future__ import annotations

import hashlib
import os
from dataclasses import replace
from pathlib import Path
from typing import Self

import pytest
import validate_exact17_small_role_cycle_export as validator

EXACT_SUFFIX = b"".join(validator.expected_suffix_lines())


def _tiny_export(
    tmp_path: Path, parent_lines: tuple[bytes, ...] = (b"1 0\n",)
) -> tuple[Path, Path, validator.ExportSpec]:
    parent_body = b"".join(parent_lines)
    parent_clauses = len(parent_lines)
    parent_bytes = (
        f"p cnf {validator.VARIABLES} {parent_clauses}\n".encode() + parent_body
    )
    child_clauses = parent_clauses + validator.SUFFIX_CLAUSES
    child_bytes = (
        f"p cnf {validator.VARIABLES} {child_clauses}\n".encode()
        + parent_body
        + EXACT_SUFFIX
    )
    parent = tmp_path / "parent.cnf"
    child = tmp_path / "child.cnf"
    parent.write_bytes(parent_bytes)
    child.write_bytes(child_bytes)
    spec = validator.ExportSpec(
        parent_sha256=hashlib.sha256(parent_bytes).hexdigest(),
        parent_bytes=len(parent_bytes),
        parent_clauses=parent_clauses,
        child_sha256=hashlib.sha256(child_bytes).hexdigest(),
        child_bytes=len(child_bytes),
        child_clauses=child_clauses,
        variables=validator.VARIABLES,
    )
    return parent, child, spec


def test_independent_suffix_identity_counts_order_and_boundaries() -> None:
    lines = tuple(validator.expected_suffix_lines())
    suffix = b"".join(lines)
    assert len(validator._five_role_offset_choices()) == 1_820
    assert len(validator._four_role_offset_choices()) == 546
    assert lines[: validator.FIVE_ROLE_CLAUSES]
    assert len(lines) == validator.FIVE_ROLE_CLAUSES + validator.FOUR_ROLE_CLAUSES
    assert len(lines) == validator.SUFFIX_CLAUSES
    assert lines[0] == b"-307 -6 -2 -87 -100 -227 -236 0\n"
    assert lines[validator.FIVE_ROLE_CLAUSES - 1] == (
        b"-308 -252 -240 -223 -226 -99 -90 0\n"
    )
    assert lines[validator.FIVE_ROLE_CLAUSES] == (b"-307 -2 -14 -18 -31 -239 -240 0\n")
    assert lines[-1] == b"-308 -252 -240 -236 -223 -83 -82 0\n"
    assert len(suffix) == validator.SUFFIX_BYTES
    assert hashlib.sha256(suffix).hexdigest() == validator.SUFFIX_SHA256


def test_every_clause_is_one_guarded_six_hit_nogood() -> None:
    semantic_masks: set[int] = set()
    for line in validator.expected_suffix_lines():
        fields = tuple(int(item) for item in line.split())
        assert fields[-1] == 0
        literals = fields[:-1]
        assert len(literals) == 7
        assert literals[0] in (-307, -308)
        assert len(set(literals)) == len(literals)
        assert all(-validator.VARIABLES <= literal < 0 for literal in literals)
        mask, _variables = validator._semantic_mask(line)
        assert mask not in semantic_masks
        semantic_masks.add(mask)
    assert len(semantic_masks) == validator.SUFFIX_CLAUSES


def test_four_role_filter_is_exactly_the_required_gap_rule() -> None:
    choices = validator._four_role_offset_choices()
    rejected = {
        offsets
        for offsets in __import__("itertools").combinations(range(1, 17), 3)
        if not validator._four_role_admissible(offsets)
    }
    assert all(b > 1 or c + 1 < d for b, c, d in choices)
    assert rejected == {(1, c, c + 1) for c in range(2, 16)}


@pytest.mark.parametrize("mutation", ["count", "order", "filter", "gap"])
def test_generator_mutations_are_rejected(
    monkeypatch: pytest.MonkeyPatch, mutation: str
) -> None:
    if mutation == "count":
        choices = validator._five_role_offset_choices()
        monkeypatch.setattr(
            validator, "_five_role_offset_choices", lambda: choices[:-1]
        )
        match = "five-role offset-choice count"
    elif mutation == "order":
        monkeypatch.setattr(validator, "_DIRECTIONS", (True, False))
        match = "suffix identity"
    elif mutation == "filter":
        monkeypatch.setattr(validator, "_four_role_admissible", lambda _offsets: True)
        match = "four-role offset-choice count"
    else:
        original = validator._placed_label
        monkeypatch.setattr(
            validator,
            "_placed_label",
            lambda order, reverse, cut, offset: original(
                order, reverse, (cut + 1) % 17, offset
            ),
        )
        match = "suffix identity"
    with pytest.raises(ValueError, match=match):
        validator._build_suffix_profile()


def test_semantic_duplicate_generator_output_is_rejected(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    first = b"-307 -6 -2 -87 -100 -227 -236 0\n"
    reordered = b"-307 -2 -6 -87 -100 -227 -236 0\n"

    def duplicate_family(_family: str, _choices: tuple[tuple[int, ...], ...]) -> object:
        yield first
        yield reordered

    monkeypatch.setattr(validator, "_family_lines", duplicate_family)
    with pytest.raises(ValueError, match="duplicate semantic suffix clause"):
        validator._build_suffix_profile()


def test_tiny_export_accepts_exact_prefix_and_suffix(tmp_path: Path) -> None:
    parent, child, spec = _tiny_export(tmp_path)
    result = validator._validate_export(parent, child, check_support=False, spec=spec)
    assert result["status"] == "PASS"
    assert result["suffix"]["clauses"] == validator.SUFFIX_CLAUSES
    assert result["suffix"]["semantic_duplicates"] == 0
    assert result["suffix"]["redundancy"]["parent_subsumed_suffix_clauses"] == 0
    assert result["lean"]["kalmanson_helper_sha256"] == (
        validator.KALMANSON_HELPER_SHA256
    )


def test_parent_subsumed_suffix_clause_is_rejected(tmp_path: Path) -> None:
    parent, child, spec = _tiny_export(tmp_path, (b"-307 -7 0\n",))
    with pytest.raises(ValueError, match="redundancy census drifted"):
        validator._validate_export(parent, child, check_support=False, spec=spec)


def test_public_validator_rejects_test_only_bypasses(tmp_path: Path) -> None:
    parent, child, spec = _tiny_export(tmp_path)
    with pytest.raises(TypeError):
        validator.validate_export(parent, child, check_support=False)  # type: ignore[call-arg]
    with pytest.raises(TypeError):
        validator.validate_export(parent, child, spec=spec)  # type: ignore[call-arg]


def test_reporting_uses_authenticated_fstat_not_path_stat(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    parent, child, spec = _tiny_export(tmp_path)
    monkeypatch.setattr(
        Path,
        "stat",
        lambda *_args, **_kwargs: pytest.fail("path stat must not report identity"),
    )
    result = validator._validate_export(parent, child, check_support=False, spec=spec)
    assert result["parent"]["bytes"] == spec.parent_bytes
    assert result["child"]["bytes"] == spec.child_bytes


@pytest.mark.parametrize("target", ["parent", "child"])
def test_malformed_header_is_rejected(tmp_path: Path, target: str) -> None:
    parent, child, spec = _tiny_export(tmp_path)
    path = parent if target == "parent" else child
    data = path.read_bytes()
    path.write_bytes(b"p cnd" + data[5:])
    with pytest.raises(ValueError, match="DIMACS header drifted"):
        validator._validate_export(parent, child, check_support=False, spec=spec)


@pytest.mark.parametrize("target", ["parent", "child_prefix", "suffix", "trailing"])
def test_parent_and_child_byte_mutations_are_rejected(
    tmp_path: Path, target: str
) -> None:
    parent, child, spec = _tiny_export(tmp_path)
    if target == "parent":
        data = bytearray(parent.read_bytes())
        data[data.index(b"\n") + 1] = ord("2")
        parent.write_bytes(data)
        match = "parent body prefix"
    elif target == "child_prefix":
        data = bytearray(child.read_bytes())
        data[data.index(b"\n") + 1] = ord("2")
        child.write_bytes(data)
        match = "parent body prefix"
    elif target == "suffix":
        data = bytearray(child.read_bytes())
        first_suffix = data.index(b"\n", data.index(b"\n") + 1) + 1
        data[first_suffix + 6] = ord("3")
        child.write_bytes(data)
        match = "ordered suffix"
    else:
        child.write_bytes(child.read_bytes() + b"x")
        match = "extra bytes"
    with pytest.raises(ValueError, match=match):
        validator._validate_export(parent, child, check_support=False, spec=spec)


def test_parent_trailing_clause_is_rejected(tmp_path: Path) -> None:
    parent, child, spec = _tiny_export(tmp_path)
    parent.write_bytes(parent.read_bytes() + b"2 0\n")
    header_end = child.read_bytes().index(b"\n") + 1
    child_data = child.read_bytes()
    child.write_bytes(
        child_data[: header_end + 4] + b"2 0\n" + child_data[header_end + 4 :]
    )
    with pytest.raises(ValueError, match="parent contains extra bytes"):
        validator._validate_export(parent, child, check_support=False, spec=spec)


def test_source_pin_failure_precedes_cnf_open(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    parent, child, spec = _tiny_export(tmp_path)
    monkeypatch.setattr(
        validator,
        "_require_all_sources",
        lambda: (_ for _ in ()).throw(ValueError("source pin drifted")),
    )
    monkeypatch.setattr(
        validator,
        "_open_regular_nofollow",
        lambda _path: pytest.fail("CNF was opened before source authentication"),
    )
    with pytest.raises(ValueError, match="source pin drifted"):
        validator._validate_export(parent, child, check_support=True, spec=spec)


def test_all_three_direct_and_both_parent_sources_are_pinned(
    monkeypatch: pytest.MonkeyPatch,
) -> None:
    observed: list[tuple[Path, str, str]] = []
    monkeypatch.setattr(
        validator,
        "_require_committed_source",
        lambda path, commit, expected, _label: observed.append(
            (path, commit, expected)
        ),
    )
    validator._require_all_sources()
    assert observed == [
        (validator.LEAN_ROOT_PATH, validator.SOURCE_COMMIT, validator.LEAN_ROOT_SHA256),
        (
            validator.LEAN_EXPORT_PATH,
            validator.SOURCE_COMMIT,
            validator.LEAN_EXPORT_SHA256,
        ),
        (
            validator.KALMANSON_HELPER_PATH,
            validator.SOURCE_COMMIT,
            validator.KALMANSON_HELPER_SHA256,
        ),
        (
            validator.PARENT_LEAN_ROOT_PATH,
            validator.PARENT_SOURCE_COMMIT,
            validator.PARENT_LEAN_ROOT_SHA256,
        ),
        (
            validator.PARENT_LEAN_EXPORT_PATH,
            validator.PARENT_SOURCE_COMMIT,
            validator.PARENT_LEAN_EXPORT_SHA256,
        ),
    ]


def test_helper_source_live_mutation_is_rejected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    committed = validator.KALMANSON_HELPER_PATH.read_bytes()
    mutated = bytes([committed[0] ^ 1]) + committed[1:]
    target = tmp_path / "helper.lean"
    target.write_bytes(mutated)
    monkeypatch.setattr(validator, "_git_show", lambda *_args: committed)
    with pytest.raises(ValueError, match="helper live bytes drifted"):
        validator._require_committed_source(
            target,
            validator.SOURCE_COMMIT,
            validator.KALMANSON_HELPER_SHA256,
            "helper",
        )


def test_helper_source_path_swap_is_rejected_before_cnf(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    parent, child, spec = _tiny_export(tmp_path)
    monkeypatch.setattr(validator, "KALMANSON_HELPER_PATH", validator.LEAN_ROOT_PATH)
    monkeypatch.setattr(validator, "_git_show", lambda _commit, path: path.read_bytes())
    with pytest.raises(ValueError, match="helper committed bytes drifted"):
        validator._validate_export(parent, child, check_support=True, spec=spec)


def test_wrong_well_formed_source_commit_is_rejected() -> None:
    with pytest.raises(ValueError, match="unavailable|committed bytes drifted"):
        validator._require_committed_source(
            validator.LEAN_ROOT_PATH,
            validator.PARENT_SOURCE_COMMIT,
            validator.LEAN_ROOT_SHA256,
            "Lean refinement source",
        )


@pytest.mark.parametrize("commit", ["not-a-commit", "f" * 39, "F" * 40])
def test_malformed_source_commit_pin_is_rejected(commit: str) -> None:
    with pytest.raises(ValueError, match="commit pin is malformed"):
        validator._require_committed_source(
            validator.LEAN_ROOT_PATH,
            commit,
            validator.LEAN_ROOT_SHA256,
            "source",
        )


def test_production_commit_and_hash_pins_are_full_length_lower_hex() -> None:
    pins = (
        validator.SOURCE_COMMIT,
        validator.PARENT_SOURCE_COMMIT,
        validator.LEAN_ROOT_SHA256,
        validator.LEAN_EXPORT_SHA256,
        validator.KALMANSON_HELPER_SHA256,
        validator.PARENT_LEAN_ROOT_SHA256,
        validator.PARENT_LEAN_EXPORT_SHA256,
    )
    assert all(len(pin) in (40, 64) for pin in pins)
    assert all(set(pin) <= set("0123456789abcdef") for pin in pins)


def test_authenticated_redundancy_census_constants_are_exact() -> None:
    census = validator.PRODUCTION_REDUNDANCY_CENSUS
    assert census.parent_subsuming_clauses == 276
    assert census.parent_subsumed_suffix_clauses == 64_097
    assert census.nonredundant_suffix_clauses == 96_791
    assert census.shortest_parent_length_distribution == (
        (1, 62_537),
        (2, 1_416),
        (7, 144),
    )
    assert census.family_shortest_parent_length_distribution == (
        ("five", 1, 48_519),
        ("five", 2, 1_056),
        ("five", 7, 101),
        ("four", 1, 14_018),
        ("four", 2, 360),
        ("four", 7, 43),
    )
    assert census.parent_exact_duplicate_suffix_clauses == 204
    assert census.semantic_suffix_duplicates == 0
    assert census.witness_rows == 64_097
    assert census.witness_bytes == 850_436
    assert census.witness_sha256 == (
        "379840e715642dd76adbb64a7ee11ac00805d3aff2a45e30ef1dbfba64900a03"
    )
    assert census.model_falsified_nonredundant_indices == (
        87_731,
        94_189,
        106_818,
        109_198,
        149_786,
        154_928,
        156_728,
    )


@pytest.mark.parametrize(
    ("field", "mutated"),
    [
        ("parent_subsuming_clauses", 277),
        ("parent_subsumed_suffix_clauses", 64_098),
        ("nonredundant_suffix_clauses", 96_792),
        ("shortest_parent_length_distribution", ((1, 62_536),)),
        (
            "family_shortest_parent_length_distribution",
            (("five", 1, 48_518),),
        ),
        ("parent_exact_duplicate_suffix_clauses", 205),
        ("semantic_suffix_duplicates", 1),
        ("witness_sha256", "0" * 64),
        ("witness_bytes", 850_437),
        ("witness_rows", 64_098),
        ("model_falsified_nonredundant_indices", (87_731,)),
    ],
)
def test_every_redundancy_census_mutation_is_rejected(
    field: str, mutated: object
) -> None:
    expected = validator.PRODUCTION_REDUNDANCY_CENSUS
    observed = replace(expected, **{field: mutated})
    with pytest.raises(ValueError, match="redundancy census drifted"):
        validator._require_redundancy_census(observed, expected)


def test_authenticated_parent_model_and_receipt_load_exactly() -> None:
    model = validator._load_parent_model()
    assert model.sha256 == validator.PARENT_MODEL_SHA256
    assert model.byte_count == validator.PARENT_MODEL_BYTES
    assert model.receipt_sha256 == validator.PARENT_MODEL_RECEIPT_SHA256
    assert model.receipt_byte_count == validator.PARENT_MODEL_RECEIPT_BYTES
    assert model.true_mask.bit_count() > 0
    assert validator._assignment_satisfies_clause((-137,), model.true_mask)


@pytest.mark.parametrize("target_name", ["receipt", "model"])
def test_parent_model_artifact_byte_mutation_is_rejected(
    tmp_path: Path, target_name: str
) -> None:
    if target_name == "receipt":
        source = validator.PARENT_MODEL_RECEIPT_PATH
        expected_sha = validator.PARENT_MODEL_RECEIPT_SHA256
        expected_bytes = validator.PARENT_MODEL_RECEIPT_BYTES
    else:
        source = validator.PARENT_MODEL_PATH
        expected_sha = validator.PARENT_MODEL_SHA256
        expected_bytes = validator.PARENT_MODEL_BYTES
    raw = source.read_bytes()
    target = tmp_path / target_name
    target.write_bytes(bytes([raw[0] ^ 1]) + raw[1:])
    with pytest.raises(ValueError, match="identity drifted"):
        validator._read_authenticated_bytes(
            target, expected_sha, expected_bytes, f"parent {target_name}"
        )


def test_parent_model_path_swap_is_rejected(monkeypatch: pytest.MonkeyPatch) -> None:
    monkeypatch.setattr(
        validator, "PARENT_MODEL_PATH", validator.PARENT_MODEL_RECEIPT_PATH
    )
    with pytest.raises(ValueError, match="parent SAT model identity drifted"):
        validator._load_parent_model()


@pytest.mark.parametrize("target_name", ["receipt", "model"])
def test_parent_model_semantic_provenance_mutation_is_rejected(
    monkeypatch: pytest.MonkeyPatch, target_name: str
) -> None:
    receipt_raw = validator.PARENT_MODEL_RECEIPT_PATH.read_bytes()
    model_raw = validator.PARENT_MODEL_PATH.read_bytes()
    if target_name == "receipt":
        import json

        payload = json.loads(receipt_raw)
        payload["cnf_sha256"] = "0" * 64
        receipt_raw = json.dumps(payload).encode()
        match = "receipt provenance drifted"
    else:
        import json

        payload = json.loads(model_raw)
        payload["num_assigned"] = validator.VARIABLES - 1
        model_raw = json.dumps(payload).encode()
        match = "model assignment drifted"

    def fake_read(path: Path, *_args: object) -> bytes:
        return receipt_raw if path == validator.PARENT_MODEL_RECEIPT_PATH else model_raw

    monkeypatch.setattr(validator, "_read_authenticated_bytes", fake_read)
    with pytest.raises(ValueError, match=match):
        validator._load_parent_model()


def test_component_and_direct_file_symlinks_are_rejected(tmp_path: Path) -> None:
    real = tmp_path / "real"
    real.mkdir()
    target = real / "source"
    target.write_bytes(b"source")
    redirect = tmp_path / "redirect"
    redirect.symlink_to(real, target_is_directory=True)
    direct = tmp_path / "direct"
    direct.symlink_to(target)
    with pytest.raises((OSError, ValueError)):
        validator.sha256_file(redirect / "source")
    with pytest.raises((OSError, ValueError)):
        validator.sha256_file(direct)


def test_preexisting_hardlink_is_rejected(tmp_path: Path) -> None:
    target = tmp_path / "source"
    alias = tmp_path / "alias"
    target.write_bytes(b"source")
    os.link(target, alias)
    with pytest.raises(ValueError, match="exclusive regular file"):
        validator.sha256_file(target)


@pytest.mark.parametrize("failure", ["stat", "fstat"])
def test_directory_component_metadata_failure_does_not_leak_fds(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, failure: str
) -> None:
    leaf = tmp_path / "leaf"
    leaf.mkdir()
    original_open = os.open
    original_stat = os.stat
    original_fstat = os.fstat
    leaf_fds: set[int] = set()

    def tracked_open(path: object, *args: object, **kwargs: object) -> int:
        descriptor = original_open(path, *args, **kwargs)  # type: ignore[arg-type]
        if path == leaf.name:
            leaf_fds.add(descriptor)
        return descriptor

    def injected_stat(path: object, *args: object, **kwargs: object) -> os.stat_result:
        if failure == "stat" and path == leaf.name:
            raise OSError("injected component stat failure")
        return original_stat(path, *args, **kwargs)  # type: ignore[arg-type]

    def injected_fstat(descriptor: int) -> os.stat_result:
        if failure == "fstat" and descriptor in leaf_fds:
            raise OSError("injected component fstat failure")
        return original_fstat(descriptor)

    monkeypatch.setattr(os, "open", tracked_open)
    monkeypatch.setattr(os, "stat", injected_stat)
    monkeypatch.setattr(os, "fstat", injected_fstat)
    for _attempt in range(8):
        leaf_fds.clear()
        before = len(os.listdir("/dev/fd"))
        with pytest.raises(OSError, match="injected component"):
            validator._open_directory_nofollow(leaf)
        assert len(os.listdir("/dev/fd")) == before


@pytest.mark.parametrize("flag", ["O_NOFOLLOW", "O_DIRECTORY", "O_CLOEXEC"])
def test_missing_security_critical_open_flag_is_fail_closed(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, flag: str
) -> None:
    target = tmp_path / "source"
    target.write_bytes(b"source")
    monkeypatch.setattr(os, flag, 0)
    monkeypatch.setattr(
        os,
        "open",
        lambda *_args, **_kwargs: pytest.fail("opened a path without required flags"),
    )
    with pytest.raises(ValueError, match=f"required open flag {flag} is unavailable"):
        validator.sha256_file(target)


def test_final_component_inode_swap_race_is_rejected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    target = tmp_path / "source"
    replacement = tmp_path / "replacement"
    target.write_bytes(b"source")
    replacement.write_bytes(b"other")
    original_stat = os.stat
    monkeypatch.setattr(
        validator,
        "_open_directory_nofollow",
        lambda path: os.open(path, os.O_RDONLY | getattr(os, "O_DIRECTORY", 0)),
    )

    def swapped_stat(path: object, *args: object, **kwargs: object) -> os.stat_result:
        if path == target.name and kwargs.get("dir_fd") is not None:
            return original_stat(
                replacement.name,
                dir_fd=kwargs["dir_fd"],
                follow_symlinks=False,
            )
        return original_stat(path, *args, **kwargs)  # type: ignore[arg-type]

    monkeypatch.setattr(os, "stat", swapped_stat)
    with pytest.raises(ValueError, match="file changed while opening"):
        validator.sha256_file(target)


@pytest.mark.parametrize("target_name", ["parent", "child"])
def test_provenance_mutation_during_validation_is_rejected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch, target_name: str
) -> None:
    parent, child, spec = _tiny_export(tmp_path)
    target = parent if target_name == "parent" else child
    original_open = validator._open_regular_nofollow

    class TouchingStream:
        def __init__(self, stream: object) -> None:
            self.stream = stream
            self.touched = False

        def __enter__(self) -> Self:
            self.stream.__enter__()  # type: ignore[attr-defined]
            return self

        def __exit__(self, *args: object) -> None:
            self.stream.__exit__(*args)  # type: ignore[attr-defined]

        def fileno(self) -> int:
            return self.stream.fileno()  # type: ignore[attr-defined]

        def readline(self, *args: object) -> bytes:
            value = self.stream.readline(*args)  # type: ignore[attr-defined]
            if not self.touched:
                current = os.stat(target)
                os.utime(
                    target,
                    ns=(current.st_atime_ns, current.st_mtime_ns + 1_000_000),
                )
                self.touched = True
            return value

        def read(self, *args: object) -> bytes:
            return self.stream.read(*args)  # type: ignore[attr-defined]

    def open_with_touch(path: Path) -> object:
        stream = original_open(path)
        return TouchingStream(stream) if path == target else stream

    monkeypatch.setattr(validator, "_open_regular_nofollow", open_with_touch)
    with pytest.raises(ValueError, match=f"{target_name} changed during validation"):
        validator._validate_export(parent, child, check_support=False, spec=spec)


def test_hardlink_addition_during_validation_is_rejected(
    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
) -> None:
    parent, child, spec = _tiny_export(tmp_path)
    alias = tmp_path / "child-hardlink"
    original_open = validator._open_regular_nofollow

    class LinkAddingStream:
        def __init__(self, stream: object) -> None:
            self.stream = stream
            self.added = False

        def __enter__(self) -> Self:
            self.stream.__enter__()  # type: ignore[attr-defined]
            return self

        def __exit__(self, *args: object) -> None:
            self.stream.__exit__(*args)  # type: ignore[attr-defined]

        def fileno(self) -> int:
            return self.stream.fileno()  # type: ignore[attr-defined]

        def readline(self, *args: object) -> bytes:
            value = self.stream.readline(*args)  # type: ignore[attr-defined]
            if not self.added:
                os.link(child, alias)
                self.added = True
            return value

        def read(self, *args: object) -> bytes:
            return self.stream.read(*args)  # type: ignore[attr-defined]

    def open_with_link(path: Path) -> object:
        stream = original_open(path)
        return LinkAddingStream(stream) if path == child else stream

    monkeypatch.setattr(validator, "_open_regular_nofollow", open_with_link)
    try:
        with pytest.raises(ValueError, match="child changed during validation"):
            validator._validate_export(parent, child, check_support=False, spec=spec)
    finally:
        if alias.exists():
            alias.unlink()


def test_parent_and_child_same_inode_is_rejected(tmp_path: Path) -> None:
    parent, _child, spec = _tiny_export(tmp_path)
    with pytest.raises(ValueError, match="paths crossed"):
        validator._validate_export(parent, parent, check_support=False, spec=spec)


def test_production_child_identity_is_derived_from_parent_and_suffix() -> None:
    parent_digest = hashlib.sha256()
    child_digest = hashlib.sha256()
    suffix_digest = hashlib.sha256()
    child_byte_count = 0
    suffix_byte_count = 0
    with validator._open_regular_nofollow(validator.PARENT_PATH) as parent:
        before = validator._state(parent)
        parent_header = parent.readline()
        child_header = (
            f"p cnf {validator.VARIABLES} {validator.CHILD_CLAUSES}\n".encode()
        )
        assert parent_header == (
            f"p cnf {validator.VARIABLES} {validator.PARENT_CLAUSES}\n".encode()
        )
        parent_digest.update(parent_header)
        child_digest.update(child_header)
        child_byte_count += len(child_header)
        while block := parent.read(1 << 20):
            parent_digest.update(block)
            child_digest.update(block)
            child_byte_count += len(block)
        for line in validator.expected_suffix_lines():
            suffix_digest.update(line)
            child_digest.update(line)
            suffix_byte_count += len(line)
            child_byte_count += len(line)
        after = validator._state(parent)
    assert before == after
    assert (parent_digest.hexdigest(), before[2]) == (
        validator.PARENT_SHA256,
        validator.PARENT_BYTES,
    )
    assert (suffix_digest.hexdigest(), suffix_byte_count) == (
        validator.SUFFIX_SHA256,
        validator.SUFFIX_BYTES,
    )
    assert (child_digest.hexdigest(), child_byte_count) == (
        validator.CHILD_SHA256,
        validator.CHILD_BYTES,
    )


def test_default_child_path_is_the_governed_export_candidate() -> None:
    assert validator.CHILD_PATH.name == "candidate.cnf"
    assert validator.CHILD_PATH.parent.name == "artifacts"


def test_live_authenticated_production_export_end_to_end() -> None:
    result = validator._validate_export(
        validator.PARENT_PATH,
        validator.CHILD_PATH,
        check_support=True,
        spec=validator.PRODUCTION_SPEC,
    )
    assert result["status"] == "PASS"
    assert result["source_commit"] == validator.SOURCE_COMMIT
    assert result["parent_source_commit"] == validator.PARENT_SOURCE_COMMIT
    assert result["parent"] == {
        "path": os.path.abspath(validator.PARENT_PATH),
        "sha256": validator.PARENT_SHA256,
        "bytes": validator.PARENT_BYTES,
        "clauses": validator.PARENT_CLAUSES,
    }
    assert result["child"] == {
        "path": os.path.abspath(validator.CHILD_PATH),
        "sha256": validator.CHILD_SHA256,
        "bytes": validator.CHILD_BYTES,
        "clauses": validator.CHILD_CLAUSES,
    }
    assert result["suffix"]["sha256"] == validator.SUFFIX_SHA256
    assert result["suffix"]["bytes"] == validator.SUFFIX_BYTES
    assert result["suffix"]["clauses"] == validator.SUFFIX_CLAUSES
    assert result["suffix"]["semantic_duplicates"] == 0
    assert result["suffix"]["redundancy"] == {
        "parent_subsuming_clauses": 276,
        "parent_subsumed_suffix_clauses": 64_097,
        "nonredundant_suffix_clauses": 96_791,
        "shortest_parent_length_distribution": {
            "1": 62_537,
            "2": 1_416,
            "7": 144,
        },
        "family_shortest_parent_length_distribution": [
            {"family": "five", "length": 1, "count": 48_519},
            {"family": "five", "length": 2, "count": 1_056},
            {"family": "five", "length": 7, "count": 101},
            {"family": "four", "length": 1, "count": 14_018},
            {"family": "four", "length": 2, "count": 360},
            {"family": "four", "length": 7, "count": 43},
        ],
        "parent_exact_duplicate_suffix_clauses": 204,
        "witness_serialization": (
            "ASCII `<suffix_index> <minimal-length-then-first-parent-index>\\n`, "
            "suffix index ascending"
        ),
        "witness_rows": 64_097,
        "witness_bytes": 850_436,
        "witness_sha256": (
            "379840e715642dd76adbb64a7ee11ac00805d3aff2a45e30ef1dbfba64900a03"
        ),
    }
    assert result["parent_model"]["independently_satisfies_parent"] is True
    assert result["parent_model"]["falsified_nonredundant_suffix_indices"] == [
        87_731,
        94_189,
        106_818,
        109_198,
        149_786,
        154_928,
        156_728,
    ]
