"""Independent validator for the exact-17 small-role-cycle CNF export.

The suffix replay below is intentionally independent of the Lean generator.  It
reconstructs the two named cyclic orders, both directions, every cut, and the
four- and five-role incidence motifs directly from their mathematical data.
"""

from __future__ import annotations

import hashlib
import itertools
import json
import os
import stat
import subprocess
from collections import Counter
from collections.abc import Iterator
from dataclasses import dataclass
from pathlib import Path
from typing import BinaryIO

ROOT = Path(__file__).resolve().parents[1]
PARENT_PATH = (
    ROOT / "scratch/exact17-current-root-two-kalmanson-successor-package-v2/"
    "exact17-current-root-two-kalmanson-successor.cnf"
)
CHILD_PATH = (
    ROOT / "scratch/runs/exact17-small-role-export-run-20260816/export-v1/artifacts/"
    "candidate.cnf"
)
LEAN_ROOT_PATH = (
    ROOT / "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenSmallRoleCycleRefinements.lean"
)
LEAN_EXPORT_PATH = (
    ROOT / "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenSmallRoleCycleRefinementsExport.lean"
)
KALMANSON_HELPER_PATH = (
    ROOT / "lean/Erdos9796Proof/P97/ATail/KalmansonSmallRoleCycleSchemas.lean"
)
PARENT_LEAN_ROOT_PATH = (
    ROOT / "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenCurrentRootTwoKalmansonSuccessorRefinements.lean"
)
PARENT_LEAN_EXPORT_PATH = (
    ROOT / "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenCurrentRootTwoKalmansonSuccessorRefinementsExport.lean"
)
PARENT_MODEL_RECEIPT_PATH = (
    ROOT / "scratch/runs/exact17-current-root-two-kalmanson-successor-piqd/"
    "successor-v1/artifacts/piqd-attempts/"
    "attempt-00000000-c2d5a4472eea7831/solver-receipt.json"
)
PARENT_MODEL_PATH = (
    PARENT_MODEL_RECEIPT_PATH.parent / "attempt.jsonl.artifacts/"
    "eb2ec98e3a8102a98174e592daa703c06aeccd7db2af4a980e7df580d8e913ec"
)

SOURCE_COMMIT = "f05c5699b50e64c559f58a9fea62192f1a51983d"
PARENT_SOURCE_COMMIT = "057ea2af8df5755c7130f23f52c35907d49ae5a5"
LEAN_ROOT_SHA256 = "3c7e053d0cc4f33bff804b80900cdf7d309ca4b340d50e2402f63430f4a1e68d"
LEAN_EXPORT_SHA256 = "6216598203f0cd96d380b1391368b1a366400610d8b2a7f79edc39c7b337a8b6"
KALMANSON_HELPER_SHA256 = (
    "176f894b9698bb50c763b73440c86a0b622c2fb747987348769ad080e5744028"
)
SOURCE_BASELINE_SHA256 = LEAN_ROOT_SHA256
PARENT_LEAN_ROOT_SHA256 = (
    "0fb8317d17a0085334f7a2885361c0ea51da52ec1e2c8cfc857dfb641d2c1638"
)
PARENT_LEAN_EXPORT_SHA256 = (
    "eb4c9e5e2878079ed5d60e096fefb5d198e6b663e4c7098bcbd03eefb9bbf033"
)

PARENT_SHA256 = "c2d5a4472eea783152919078da45083ad31835a407a75e22150bf2eae63cd3e8"
PARENT_BYTES = 333_050_318
PARENT_CLAUSES = 7_037_500
CHILD_SHA256 = "4c47a61712cd4c1d465ea7984189e938b5a2422553adc3e962b7209ee285430d"
CHILD_BYTES = 338_644_740
CHILD_CLAUSES = 7_198_388
VARIABLES = 308

FIVE_ROLE_OFFSET_CHOICES = 1_820
FOUR_ROLE_OFFSET_CHOICES = 546
FIVE_ROLE_CLAUSES = 123_760
FOUR_ROLE_CLAUSES = 37_128
SUFFIX_CLAUSES = 160_888
SUFFIX_BYTES = 5_594_422
SUFFIX_SHA256 = "acb18958281bc2f97ba41b873e7f503cd81a68b8d4a82f2b78b292a7584d8d37"
VALIDATION_SCHEMA = "p97-exact17-small-role-cycle-export-validation/v1"
PARENT_MODEL_RECEIPT_SHA256 = (
    "d17cdb7b58aabedd9163cf51aa9ae8245f2f8a4ee14fac5b986bc7982bdf0ba7"
)
PARENT_MODEL_RECEIPT_BYTES = 33_117
PARENT_MODEL_SHA256 = "eb2ec98e3a8102a98174e592daa703c06aeccd7db2af4a980e7df580d8e913ec"
PARENT_MODEL_BYTES = 1_503
PARENT_MODEL_JOB_ID = "89aef52c-023d-4b9e-9e84-78ac487ea152"

PARENT_SUBSUMING_CLAUSES = 276
PARENT_SUBSUMED_SUFFIX_CLAUSES = 64_097
NONREDUNDANT_SUFFIX_CLAUSES = 96_791
PARENT_EXACT_DUPLICATE_SUFFIX_CLAUSES = 204
REDUNDANCY_WITNESS_BYTES = 850_436
REDUNDANCY_WITNESS_SHA256 = (
    "379840e715642dd76adbb64a7ee11ac00805d3aff2a45e30ef1dbfba64900a03"
)
SHORTEST_PARENT_LENGTH_DISTRIBUTION = ((1, 62_537), (2, 1_416), (7, 144))
FAMILY_SHORTEST_PARENT_LENGTH_DISTRIBUTION = (
    ("five", 1, 48_519),
    ("five", 2, 1_056),
    ("five", 7, 101),
    ("four", 1, 14_018),
    ("four", 2, 360),
    ("four", 7, 43),
)
MODEL_FALSIFIED_NONREDUNDANT_INDICES = (
    87_731,
    94_189,
    106_818,
    109_198,
    149_786,
    154_928,
    156_728,
)

# Inverses of the two source-normal-form position tables.  These are copied
# from the live successor validator and regression-tested at the suffix edges.
_ORDER_TABLES = (
    (0, 6, 8, 11, 10, 9, 12, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
    (0, 6, 8, 11, 10, 12, 9, 7, 2, 15, 16, 3, 4, 5, 1, 13, 14),
)
_NAMED_ORDERS = (0, 1)
_DIRECTIONS = (False, True)  # forward, reverse
_CUTS = tuple(range(17))


@dataclass(frozen=True)
class ExportSpec:
    parent_sha256: str = PARENT_SHA256
    parent_bytes: int = PARENT_BYTES
    parent_clauses: int = PARENT_CLAUSES
    child_sha256: str = CHILD_SHA256
    child_bytes: int = CHILD_BYTES
    child_clauses: int = CHILD_CLAUSES
    variables: int = VARIABLES


@dataclass(frozen=True)
class _SuffixProfile:
    sha256: str
    byte_count: int
    clause_count: int
    five_role_count: int
    four_role_count: int
    semantic_masks: frozenset[int]
    ordered_masks: tuple[int, ...]
    postings: tuple[int, ...]
    posting_counts: tuple[int, ...]


@dataclass(frozen=True)
class _RedundancyCensus:
    parent_subsuming_clauses: int
    parent_subsumed_suffix_clauses: int
    nonredundant_suffix_clauses: int
    shortest_parent_length_distribution: tuple[tuple[int, int], ...]
    family_shortest_parent_length_distribution: tuple[tuple[str, int, int], ...]
    parent_exact_duplicate_suffix_clauses: int
    semantic_suffix_duplicates: int
    witness_sha256: str
    witness_bytes: int
    witness_rows: int
    model_falsified_nonredundant_indices: tuple[int, ...]


@dataclass(frozen=True)
class _ParentModel:
    true_mask: int
    sha256: str
    byte_count: int
    receipt_sha256: str
    receipt_byte_count: int


PRODUCTION_SPEC = ExportSpec()
PRODUCTION_REDUNDANCY_CENSUS = _RedundancyCensus(
    parent_subsuming_clauses=PARENT_SUBSUMING_CLAUSES,
    parent_subsumed_suffix_clauses=PARENT_SUBSUMED_SUFFIX_CLAUSES,
    nonredundant_suffix_clauses=NONREDUNDANT_SUFFIX_CLAUSES,
    shortest_parent_length_distribution=SHORTEST_PARENT_LENGTH_DISTRIBUTION,
    family_shortest_parent_length_distribution=(
        FAMILY_SHORTEST_PARENT_LENGTH_DISTRIBUTION
    ),
    parent_exact_duplicate_suffix_clauses=PARENT_EXACT_DUPLICATE_SUFFIX_CLAUSES,
    semantic_suffix_duplicates=0,
    witness_sha256=REDUNDANCY_WITNESS_SHA256,
    witness_bytes=REDUNDANCY_WITNESS_BYTES,
    witness_rows=PARENT_SUBSUMED_SUFFIX_CLAUSES,
    model_falsified_nonredundant_indices=MODEL_FALSIFIED_NONREDUNDANT_INDICES,
)
EMPTY_REDUNDANCY_CENSUS = _RedundancyCensus(
    parent_subsuming_clauses=0,
    parent_subsumed_suffix_clauses=0,
    nonredundant_suffix_clauses=SUFFIX_CLAUSES,
    shortest_parent_length_distribution=(),
    family_shortest_parent_length_distribution=(),
    parent_exact_duplicate_suffix_clauses=0,
    semantic_suffix_duplicates=0,
    witness_sha256=hashlib.sha256(b"").hexdigest(),
    witness_bytes=0,
    witness_rows=0,
    model_falsified_nonredundant_indices=(),
)


def _required_open_flag(name: str) -> int:
    value = getattr(os, name, None)
    if type(value) is not int or value == 0:
        raise ValueError(f"required open flag {name} is unavailable")
    return value


def _open_directory_nofollow(path: Path) -> int:
    absolute = Path(os.path.abspath(path))
    flags = (
        os.O_RDONLY
        | _required_open_flag("O_DIRECTORY")
        | _required_open_flag("O_NOFOLLOW")
        | _required_open_flag("O_CLOEXEC")
    )
    descriptor = os.open(absolute.anchor, flags)
    try:
        for component in absolute.parts[1:]:
            child: int | None = None
            try:
                child = os.open(component, flags, dir_fd=descriptor)
                named = os.stat(component, dir_fd=descriptor, follow_symlinks=False)
                opened = os.fstat(child)
                if (named.st_dev, named.st_ino) != (opened.st_dev, opened.st_ino):
                    raise ValueError(f"path component changed while opening {path}")
                os.close(descriptor)
                descriptor = child
                child = None
            except BaseException:
                if child is not None:
                    os.close(child)
                raise
        return descriptor
    except BaseException:
        os.close(descriptor)
        raise


def _open_regular_nofollow(path: Path) -> BinaryIO:
    parent = _open_directory_nofollow(path.parent)
    descriptor: int | None = None
    try:
        descriptor = os.open(
            path.name,
            os.O_RDONLY
            | _required_open_flag("O_NOFOLLOW")
            | _required_open_flag("O_CLOEXEC"),
            dir_fd=parent,
        )
        opened = os.fstat(descriptor)
        named = os.stat(path.name, dir_fd=parent, follow_symlinks=False)
        if not stat.S_ISREG(opened.st_mode) or opened.st_nlink != 1:
            raise ValueError(f"not an exclusive regular file: {path}")
        if (named.st_dev, named.st_ino) != (opened.st_dev, opened.st_ino):
            raise ValueError(f"file changed while opening: {path}")
        stream = os.fdopen(descriptor, "rb", closefd=True)
        descriptor = None
        return stream
    finally:
        if descriptor is not None:
            os.close(descriptor)
        os.close(parent)


def _state(stream: BinaryIO) -> tuple[int, int, int, int, int]:
    value = os.fstat(stream.fileno())
    return (
        value.st_dev,
        value.st_ino,
        value.st_size,
        value.st_mtime_ns,
        value.st_nlink,
    )


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with _open_regular_nofollow(path) as stream:
        before = _state(stream)
        for block in iter(lambda: stream.read(1 << 20), b""):
            digest.update(block)
        after = _state(stream)
    if before != after:
        raise ValueError(f"file changed during hashing: {path}")
    return digest.hexdigest()


def _read_authenticated_bytes(
    path: Path, expected_sha256: str, expected_bytes: int, label: str
) -> bytes:
    with _open_regular_nofollow(path) as stream:
        before = _state(stream)
        data = stream.read()
        after = _state(stream)
    if before != after:
        raise ValueError(f"{label} changed during authentication")
    identity = (hashlib.sha256(data).hexdigest(), before[2], len(data))
    if identity != (expected_sha256, expected_bytes, expected_bytes):
        raise ValueError(f"{label} identity drifted")
    return data


def _load_parent_model() -> _ParentModel:
    receipt_raw = _read_authenticated_bytes(
        PARENT_MODEL_RECEIPT_PATH,
        PARENT_MODEL_RECEIPT_SHA256,
        PARENT_MODEL_RECEIPT_BYTES,
        "parent model solver receipt",
    )
    model_raw = _read_authenticated_bytes(
        PARENT_MODEL_PATH,
        PARENT_MODEL_SHA256,
        PARENT_MODEL_BYTES,
        "parent SAT model",
    )
    try:
        receipt = json.loads(receipt_raw)
        model = json.loads(model_raw)
    except (json.JSONDecodeError, UnicodeDecodeError) as error:
        raise ValueError("parent model provenance JSON is malformed") from error
    if not isinstance(receipt, dict) or not isinstance(model, dict):
        raise TypeError("parent model provenance JSON has the wrong shape")
    terminal = receipt.get("terminal_status")
    if not isinstance(terminal, dict):
        raise TypeError("parent model receipt lacks terminal status")
    receipt_identity = (
        receipt.get("schema"),
        receipt.get("outcome"),
        receipt.get("status_classification"),
        receipt.get("job_id"),
        receipt.get("cnf_sha256"),
        receipt.get("num_variables"),
        receipt.get("num_clauses"),
        receipt.get("model_response_sha256"),
        terminal.get("cnf_blob_hash"),
        terminal.get("result"),
        terminal.get("backend"),
        terminal.get("solver_profile"),
    )
    expected_receipt_identity = (
        "p97-piqd-static-solver-receipt/v1",
        "STRUCTURAL_SAT",
        "ATTESTED_SOLVER_RESULT",
        PARENT_MODEL_JOB_ID,
        PARENT_SHA256,
        VARIABLES,
        PARENT_CLAUSES,
        PARENT_MODEL_SHA256,
        PARENT_SHA256,
        "SAT",
        "cadical",
        "sat",
    )
    if receipt_identity != expected_receipt_identity:
        raise ValueError("parent model receipt provenance drifted")
    assignment = model.get("assignment")
    if (
        model.get("job_id") != PARENT_MODEL_JOB_ID
        or model.get("result") != "SAT"
        or model.get("backend") != "cadical"
        or model.get("solver_profile") != "sat"
        or model.get("num_assigned") != VARIABLES
        or not isinstance(assignment, list)
        or len(assignment) != VARIABLES
        or any(type(literal) is not int for literal in assignment)
        or {abs(literal) for literal in assignment} != set(range(1, VARIABLES + 1))
    ):
        raise ValueError("parent SAT model assignment drifted")
    true_mask = sum(1 << (abs(literal) - 1) for literal in assignment if literal > 0)
    return _ParentModel(
        true_mask=true_mask,
        sha256=PARENT_MODEL_SHA256,
        byte_count=PARENT_MODEL_BYTES,
        receipt_sha256=PARENT_MODEL_RECEIPT_SHA256,
        receipt_byte_count=PARENT_MODEL_RECEIPT_BYTES,
    )


def _git_show(commit: str, path: Path) -> bytes:
    relative = path.relative_to(ROOT)
    try:
        result = subprocess.run(
            ["git", "show", f"{commit}:{relative}"],
            cwd=ROOT,
            check=True,
            capture_output=True,
        )
    except (subprocess.CalledProcessError, ValueError) as error:
        raise ValueError(f"committed {path} is unavailable at {commit}") from error
    return result.stdout


def _require_committed_source(
    path: Path, commit: str, expected: str, label: str
) -> None:
    if len(commit) != 40 or any(
        character not in "0123456789abcdef" for character in commit
    ):
        raise ValueError(f"{label} commit pin is malformed")
    committed = _git_show(commit, path)
    committed_identity = (hashlib.sha256(committed).hexdigest(), len(committed))
    with _open_regular_nofollow(path) as stream:
        live_size = os.fstat(stream.fileno()).st_size
    if committed_identity != (expected, live_size):
        raise ValueError(f"{label} committed bytes drifted")
    if sha256_file(path) != expected:
        raise ValueError(f"{label} live bytes drifted")


def _require_all_sources() -> None:
    _require_committed_source(
        LEAN_ROOT_PATH, SOURCE_COMMIT, LEAN_ROOT_SHA256, "Lean refinement source"
    )
    _require_committed_source(
        LEAN_EXPORT_PATH, SOURCE_COMMIT, LEAN_EXPORT_SHA256, "Lean exporter"
    )
    _require_committed_source(
        KALMANSON_HELPER_PATH,
        SOURCE_COMMIT,
        KALMANSON_HELPER_SHA256,
        "Kalmanson small-role helper",
    )
    _require_committed_source(
        PARENT_LEAN_ROOT_PATH,
        PARENT_SOURCE_COMMIT,
        PARENT_LEAN_ROOT_SHA256,
        "parent Lean source",
    )
    _require_committed_source(
        PARENT_LEAN_EXPORT_PATH,
        PARENT_SOURCE_COMMIT,
        PARENT_LEAN_EXPORT_SHA256,
        "parent Lean exporter",
    )


def _five_role_offset_choices() -> tuple[tuple[int, ...], ...]:
    # Lean's List.sublistsLen uses the reverse of itertools.combinations'
    # lexicographic traversal for fixed-cardinality sublists.
    return tuple(reversed(tuple(itertools.combinations(range(1, 17), 4))))


def _four_role_admissible(offsets: tuple[int, ...]) -> bool:
    b, c, d = offsets
    return 1 < b or c + 1 < d


def _four_role_offset_choices() -> tuple[tuple[int, ...], ...]:
    return tuple(
        offsets
        for offsets in reversed(tuple(itertools.combinations(range(1, 17), 3)))
        if _four_role_admissible(offsets)
    )


def _placed_label(order: int, reverse: bool, cut: int, offset: int) -> int:
    position = (cut - offset if reverse else cut + offset) % 17
    return _ORDER_TABLES[order][position]


def _hit_var(center: int, point: int) -> int:
    value = 1 + center * 17 + point
    if not 1 <= value <= VARIABLES:
        raise ValueError("generated literal is outside the DIMACS variable range")
    return value


def _clause_line(
    family: str,
    order: int,
    reverse: bool,
    cut: int,
    offsets: tuple[int, ...],
) -> bytes:
    if family == "five":
        b, c, d, e = offsets
        hits = ((0, b), (0, c), (b, c), (b, e), (d, b), (d, e))
    elif family == "four":
        b, c, d = offsets
        hits = ((0, b), (0, c), (b, 0), (b, c), (d, 0), (d, b))
    else:
        raise ValueError(f"unknown small-role family: {family}")
    literals = [-(307 + order)]
    literals.extend(
        -_hit_var(
            _placed_label(order, reverse, cut, center),
            _placed_label(order, reverse, cut, point),
        )
        for center, point in hits
    )
    return (" ".join(map(str, literals)) + " 0\n").encode("ascii")


def _family_lines(family: str, choices: tuple[tuple[int, ...], ...]) -> Iterator[bytes]:
    for order in _NAMED_ORDERS:
        for reverse in _DIRECTIONS:
            for cut in _CUTS:
                for offsets in choices:
                    yield _clause_line(family, order, reverse, cut, offsets)


def expected_suffix_lines() -> Iterator[bytes]:
    """Yield five-role then four-role clauses in the exact Lean list order."""

    yield from _family_lines("five", _five_role_offset_choices())
    yield from _family_lines("four", _four_role_offset_choices())


def _semantic_mask(line: bytes) -> tuple[int, tuple[int, ...]]:
    if not line.endswith(b"\n"):
        raise ValueError("generated suffix clause lacks its final newline")
    fields = line[:-1].split(b" ")
    if not fields or fields[-1] != b"0" or any(not field for field in fields):
        raise ValueError("generated suffix clause is malformed")
    try:
        literals = tuple(int(field) for field in fields[:-1])
    except ValueError as error:
        raise ValueError("generated suffix clause is malformed") from error
    if len(literals) != 7 or literals[0] not in (-307, -308):
        raise ValueError("generated suffix clause has the wrong guarded shape")
    if any(literal >= 0 or literal < -VARIABLES for literal in literals):
        raise ValueError(
            "generated suffix literal is outside the negative DIMACS range"
        )
    variables = tuple(-literal for literal in literals)
    if len(set(variables)) != len(variables):
        raise ValueError("generated suffix clause repeats a literal")
    mask = sum(1 << (variable - 1) for variable in variables)
    return mask, variables


def _build_suffix_profile() -> _SuffixProfile:
    digest = hashlib.sha256()
    byte_count = 0
    semantic_masks: set[int] = set()
    ordered_masks: list[int] = []
    five_role_count = 0
    four_role_count = 0
    five_choices = _five_role_offset_choices()
    four_choices = _four_role_offset_choices()
    if len(five_choices) != FIVE_ROLE_OFFSET_CHOICES:
        raise ValueError("five-role offset-choice count drifted")
    if len(four_choices) != FOUR_ROLE_OFFSET_CHOICES:
        raise ValueError("four-role offset-choice count drifted")
    for family, choices in (("five", five_choices), ("four", four_choices)):
        for line in _family_lines(family, choices):
            mask, _variables = _semantic_mask(line)
            if mask in semantic_masks:
                raise ValueError("duplicate semantic suffix clause")
            semantic_masks.add(mask)
            ordered_masks.append(mask)
            digest.update(line)
            byte_count += len(line)
            if family == "five":
                five_role_count += 1
            else:
                four_role_count += 1
    identity = (digest.hexdigest(), byte_count, len(ordered_masks))
    expected_identity = (SUFFIX_SHA256, SUFFIX_BYTES, SUFFIX_CLAUSES)
    if five_role_count != FIVE_ROLE_CLAUSES:
        raise ValueError("five-role suffix clause count drifted")
    if four_role_count != FOUR_ROLE_CLAUSES:
        raise ValueError("four-role suffix clause count drifted")
    if identity != expected_identity:
        raise ValueError("independently regenerated suffix identity drifted")

    posting_bytes = [bytearray((SUFFIX_CLAUSES + 7) // 8) for _ in range(VARIABLES)]
    for index, mask in enumerate(ordered_masks):
        remaining = mask
        while remaining:
            bit = remaining & -remaining
            variable_index = bit.bit_length() - 1
            posting_bytes[variable_index][index >> 3] |= 1 << (index & 7)
            remaining ^= bit
    postings = tuple(int.from_bytes(bits, "little") for bits in posting_bytes)
    return _SuffixProfile(
        sha256=identity[0],
        byte_count=identity[1],
        clause_count=identity[2],
        five_role_count=five_role_count,
        four_role_count=four_role_count,
        semantic_masks=frozenset(semantic_masks),
        ordered_masks=tuple(ordered_masks),
        postings=postings,
        posting_counts=tuple(posting.bit_count() for posting in postings),
    )


def _parse_parent_clause(line: bytes) -> tuple[int, ...]:
    if not line.endswith(b"\n"):
        raise ValueError("parent contains an unterminated DIMACS clause")
    fields = line.split()
    if not fields or fields[-1] != b"0":
        raise ValueError("parent contains a malformed DIMACS clause")
    try:
        literals = tuple(int(field) for field in fields[:-1])
    except ValueError as error:
        raise ValueError("parent contains a malformed DIMACS clause") from error
    if any(literal == 0 or abs(literal) > VARIABLES for literal in literals):
        raise ValueError("parent contains an out-of-range DIMACS literal")
    return literals


def _parent_clause_candidates(
    literals: tuple[int, ...], profile: _SuffixProfile
) -> tuple[int, int]:
    if any(literal > 0 for literal in literals):
        return 0, 0
    variables = frozenset(-literal for literal in literals)
    if len(variables) > 7:
        return len(variables), 0
    if not variables:
        return 0, (1 << profile.clause_count) - 1
    candidates: int | None = None
    for variable in sorted(
        variables, key=lambda item: profile.posting_counts[item - 1]
    ):
        posting = profile.postings[variable - 1]
        candidates = posting if candidates is None else candidates & posting
        if not candidates:
            return len(variables), 0
    return len(variables), candidates or 0


def _parent_clause_subsumes_suffix(line: bytes, profile: _SuffixProfile) -> bool:
    _length, candidates = _parent_clause_candidates(_parse_parent_clause(line), profile)
    return bool(candidates)


def _assignment_satisfies_clause(literals: tuple[int, ...], true_mask: int) -> bool:
    for literal in literals:
        is_true = bool(true_mask & (1 << (abs(literal) - 1)))
        if (literal > 0 and is_true) or (literal < 0 and not is_true):
            return True
    return False


def _finish_redundancy_census(
    profile: _SuffixProfile,
    parent_subsuming_clauses: int,
    shortest_lengths: list[int],
    witnesses: list[int],
    exact_parent_duplicates: int,
    model_true_mask: int,
) -> _RedundancyCensus:
    witness_digest = hashlib.sha256()
    witness_bytes = 0
    witness_rows = 0
    length_counts: Counter[int] = Counter()
    family_length_counts: Counter[tuple[str, int]] = Counter()
    model_falsified: list[int] = []
    for suffix_index, (length, parent_index, mask) in enumerate(
        zip(shortest_lengths, witnesses, profile.ordered_masks, strict=True)
    ):
        if parent_index >= 0:
            row = f"{suffix_index} {parent_index}\n".encode("ascii")
            witness_digest.update(row)
            witness_bytes += len(row)
            witness_rows += 1
            length_counts[length] += 1
            family = "five" if suffix_index < FIVE_ROLE_CLAUSES else "four"
            family_length_counts[(family, length)] += 1
        elif mask & model_true_mask == mask:
            model_falsified.append(suffix_index)
    family_distribution = tuple(
        (family, length, family_length_counts[(family, length)])
        for family in ("five", "four")
        for length in sorted(
            key_length
            for key_family, key_length in family_length_counts
            if key_family == family
        )
    )
    return _RedundancyCensus(
        parent_subsuming_clauses=parent_subsuming_clauses,
        parent_subsumed_suffix_clauses=witness_rows,
        nonredundant_suffix_clauses=profile.clause_count - witness_rows,
        shortest_parent_length_distribution=tuple(sorted(length_counts.items())),
        family_shortest_parent_length_distribution=family_distribution,
        parent_exact_duplicate_suffix_clauses=exact_parent_duplicates.bit_count(),
        semantic_suffix_duplicates=(profile.clause_count - len(profile.semantic_masks)),
        witness_sha256=witness_digest.hexdigest(),
        witness_bytes=witness_bytes,
        witness_rows=witness_rows,
        model_falsified_nonredundant_indices=tuple(model_falsified),
    )


def _require_redundancy_census(
    observed: _RedundancyCensus, expected: _RedundancyCensus
) -> None:
    if observed != expected:
        raise ValueError("authenticated parent redundancy census drifted")


def _validate_export(
    parent_path: Path = PARENT_PATH,
    child_path: Path = CHILD_PATH,
    *,
    check_support: bool,
    spec: ExportSpec,
) -> dict[str, object]:
    """Authenticate the parent prefix and independently replay the suffix."""

    if check_support:
        _require_all_sources()
    profile = _build_suffix_profile()
    if check_support:
        parent_model = _load_parent_model()
        expected_redundancy = PRODUCTION_REDUNDANCY_CENSUS
    else:
        parent_model = _ParentModel(0, "", 0, "", 0)
        expected_redundancy = EMPTY_REDUNDANCY_CENSUS

    parent_digest = hashlib.sha256()
    child_digest = hashlib.sha256()
    suffix_digest = hashlib.sha256()
    suffix_bytes = 0
    suffix_clauses = 0
    seen_semantic: set[int] = set()
    shortest_lengths = [VARIABLES + 1] * profile.clause_count
    witnesses = [-1] * profile.clause_count
    exact_parent_duplicates = 0
    parent_subsuming_clauses = 0
    with (
        _open_regular_nofollow(parent_path) as parent,
        _open_regular_nofollow(child_path) as child,
    ):
        parent_before = _state(parent)
        child_before = _state(child)
        if parent_before[:2] == child_before[:2]:
            raise ValueError("parent and child export paths crossed")
        parent_header = parent.readline()
        child_header = child.readline()
        if parent_header != f"p cnf {spec.variables} {spec.parent_clauses}\n".encode():
            raise ValueError("small-role parent DIMACS header drifted")
        if child_header != f"p cnf {spec.variables} {spec.child_clauses}\n".encode():
            raise ValueError("small-role child DIMACS header drifted")
        parent_digest.update(parent_header)
        child_digest.update(child_header)
        for index in range(spec.parent_clauses):
            parent_line = parent.readline()
            child_line = child.readline()
            if not parent_line:
                raise ValueError(f"parent ended before clause {index}")
            if child_line != parent_line:
                raise ValueError("child does not preserve the exact parent body prefix")
            literals = _parse_parent_clause(parent_line)
            if check_support and not _assignment_satisfies_clause(
                literals, parent_model.true_mask
            ):
                raise ValueError(f"parent SAT model falsifies parent clause {index}")
            length, candidates = _parent_clause_candidates(literals, profile)
            if candidates:
                parent_subsuming_clauses += 1
                if length == 7:
                    exact_parent_duplicates |= candidates
                remaining = candidates
                while remaining:
                    bit = remaining & -remaining
                    suffix_index = bit.bit_length() - 1
                    if length < shortest_lengths[suffix_index]:
                        shortest_lengths[suffix_index] = length
                        witnesses[suffix_index] = index
                    remaining ^= bit
            parent_digest.update(parent_line)
            child_digest.update(child_line)
        if parent.read(1):
            raise ValueError("parent contains extra bytes after its declared clauses")
        redundancy = _finish_redundancy_census(
            profile,
            parent_subsuming_clauses,
            shortest_lengths,
            witnesses,
            exact_parent_duplicates,
            parent_model.true_mask,
        )
        _require_redundancy_census(redundancy, expected_redundancy)
        for expected in expected_suffix_lines():
            observed = child.readline()
            if observed != expected:
                raise ValueError(f"ordered suffix drifted at clause {suffix_clauses}")
            mask, _variables = _semantic_mask(observed)
            if mask in seen_semantic:
                raise ValueError(
                    f"duplicate semantic suffix clause at index {suffix_clauses}"
                )
            seen_semantic.add(mask)
            suffix_digest.update(observed)
            child_digest.update(observed)
            suffix_bytes += len(observed)
            suffix_clauses += 1
        if child.read(1):
            raise ValueError("child contains extra bytes after the expected suffix")
        parent_after = _state(parent)
        child_after = _state(child)

    for label, before, after in (
        ("parent", parent_before, parent_after),
        ("child", child_before, child_after),
    ):
        if before != after:
            raise ValueError(f"{label} changed during validation")

    parent_identity = (parent_digest.hexdigest(), parent_before[2])
    child_identity = (child_digest.hexdigest(), child_before[2])
    suffix_identity = (suffix_digest.hexdigest(), suffix_bytes, suffix_clauses)
    if parent_identity != (spec.parent_sha256, spec.parent_bytes):
        raise ValueError("small-role parent identity drifted")
    if child_identity != (spec.child_sha256, spec.child_bytes):
        raise ValueError("small-role child identity drifted")
    if suffix_identity != (profile.sha256, profile.byte_count, profile.clause_count):
        raise ValueError("observed suffix identity drifted")
    return {
        "schema": VALIDATION_SCHEMA,
        "status": "PASS",
        "source_baseline_sha256": SOURCE_BASELINE_SHA256,
        "source_commit": SOURCE_COMMIT,
        "parent_source_commit": PARENT_SOURCE_COMMIT,
        "variables": spec.variables,
        "parent": {
            "path": os.path.abspath(parent_path),
            "sha256": parent_identity[0],
            "bytes": parent_identity[1],
            "clauses": spec.parent_clauses,
        },
        "child": {
            "path": os.path.abspath(child_path),
            "sha256": child_identity[0],
            "bytes": child_identity[1],
            "clauses": spec.child_clauses,
        },
        "suffix": {
            "sha256": suffix_identity[0],
            "bytes": suffix_identity[1],
            "clauses": suffix_identity[2],
            "generator": "independent-python-exact17-small-role-cycle-generator/v1",
            "five_role_clauses": profile.five_role_count,
            "four_role_clauses": profile.four_role_count,
            "five_role_offset_choices": FIVE_ROLE_OFFSET_CHOICES,
            "four_role_offset_choices": FOUR_ROLE_OFFSET_CHOICES,
            "named_orders": len(_NAMED_ORDERS),
            "directions": len(_DIRECTIONS),
            "cuts": len(_CUTS),
            "semantic_duplicates": redundancy.semantic_suffix_duplicates,
            "redundancy": {
                "parent_subsuming_clauses": (redundancy.parent_subsuming_clauses),
                "parent_subsumed_suffix_clauses": (
                    redundancy.parent_subsumed_suffix_clauses
                ),
                "nonredundant_suffix_clauses": (redundancy.nonredundant_suffix_clauses),
                "shortest_parent_length_distribution": {
                    str(length): count
                    for length, count in (
                        redundancy.shortest_parent_length_distribution
                    )
                },
                "family_shortest_parent_length_distribution": [
                    {"family": family, "length": length, "count": count}
                    for family, length, count in (
                        redundancy.family_shortest_parent_length_distribution
                    )
                ],
                "parent_exact_duplicate_suffix_clauses": (
                    redundancy.parent_exact_duplicate_suffix_clauses
                ),
                "witness_serialization": (
                    "ASCII `<suffix_index> <minimal-length-then-first-parent-index>\\n`, "
                    "suffix index ascending"
                ),
                "witness_rows": redundancy.witness_rows,
                "witness_bytes": redundancy.witness_bytes,
                "witness_sha256": redundancy.witness_sha256,
            },
        },
        "parent_model": {
            "path": os.path.abspath(PARENT_MODEL_PATH) if check_support else None,
            "sha256": parent_model.sha256 or None,
            "bytes": parent_model.byte_count or None,
            "receipt_path": (
                os.path.abspath(PARENT_MODEL_RECEIPT_PATH) if check_support else None
            ),
            "receipt_sha256": parent_model.receipt_sha256 or None,
            "receipt_bytes": parent_model.receipt_byte_count or None,
            "independently_satisfies_parent": check_support,
            "falsified_nonredundant_suffix_indices": list(
                redundancy.model_falsified_nonredundant_indices
            ),
        },
        "lean": {
            "root_sha256": LEAN_ROOT_SHA256,
            "export_sha256": LEAN_EXPORT_SHA256,
            "kalmanson_helper_sha256": KALMANSON_HELPER_SHA256,
        },
        "parent_lean": {
            "root_sha256": PARENT_LEAN_ROOT_SHA256,
            "export_sha256": PARENT_LEAN_EXPORT_SHA256,
        },
    }


def validate_export(
    parent_path: Path = PARENT_PATH, child_path: Path = CHILD_PATH
) -> dict[str, object]:
    """Validate only the authenticated production export profile."""

    return _validate_export(
        parent_path,
        child_path,
        check_support=True,
        spec=PRODUCTION_SPEC,
    )


__all__ = [
    "CHILD_BYTES",
    "CHILD_CLAUSES",
    "CHILD_PATH",
    "CHILD_SHA256",
    "FIVE_ROLE_CLAUSES",
    "FIVE_ROLE_OFFSET_CHOICES",
    "FOUR_ROLE_CLAUSES",
    "FOUR_ROLE_OFFSET_CHOICES",
    "KALMANSON_HELPER_PATH",
    "KALMANSON_HELPER_SHA256",
    "LEAN_EXPORT_PATH",
    "LEAN_EXPORT_SHA256",
    "LEAN_ROOT_PATH",
    "LEAN_ROOT_SHA256",
    "MODEL_FALSIFIED_NONREDUNDANT_INDICES",
    "NONREDUNDANT_SUFFIX_CLAUSES",
    "PARENT_BYTES",
    "PARENT_CLAUSES",
    "PARENT_EXACT_DUPLICATE_SUFFIX_CLAUSES",
    "PARENT_LEAN_EXPORT_PATH",
    "PARENT_LEAN_EXPORT_SHA256",
    "PARENT_LEAN_ROOT_PATH",
    "PARENT_LEAN_ROOT_SHA256",
    "PARENT_MODEL_BYTES",
    "PARENT_MODEL_PATH",
    "PARENT_MODEL_RECEIPT_BYTES",
    "PARENT_MODEL_RECEIPT_PATH",
    "PARENT_MODEL_RECEIPT_SHA256",
    "PARENT_MODEL_SHA256",
    "PARENT_PATH",
    "PARENT_SHA256",
    "PARENT_SOURCE_COMMIT",
    "PARENT_SUBSUMED_SUFFIX_CLAUSES",
    "PARENT_SUBSUMING_CLAUSES",
    "PRODUCTION_REDUNDANCY_CENSUS",
    "PRODUCTION_SPEC",
    "REDUNDANCY_WITNESS_BYTES",
    "REDUNDANCY_WITNESS_SHA256",
    "SOURCE_BASELINE_SHA256",
    "SOURCE_COMMIT",
    "SUFFIX_BYTES",
    "SUFFIX_CLAUSES",
    "SUFFIX_SHA256",
    "VALIDATION_SCHEMA",
    "VARIABLES",
    "ExportSpec",
    "expected_suffix_lines",
    "sha256_file",
    "validate_export",
]
