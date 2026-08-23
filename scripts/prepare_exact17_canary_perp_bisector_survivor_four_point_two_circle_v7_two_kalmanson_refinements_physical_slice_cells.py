"""Governed code-first V7 physical-slice V3 preparer.

This V3 adapter reuses the committed V6 custody implementation, but replaces
every source/schema/count contract with the committed V7 two-Kalmanson root.  The V7
physical coverage/exporter and V6 immediate-parent exporter are pinned; the
adapter remains intentionally non-production until an external config and the
76 cell identities are frozen.  It never contacts PIQD or a SAT solver.
"""

from __future__ import annotations

import hashlib
import importlib.util
import json
import stat
import subprocess
import sys
from pathlib import Path
from typing import Any

ROOT = Path(__file__).resolve().parents[1]
SCRIPTS = ROOT / "scripts"
if str(SCRIPTS) not in sys.path:
    sys.path.insert(0, str(SCRIPTS))

BASE_PREPARER_RELATIVE = (
    "scripts/prepare_exact17_canary_perp_bisector_survivor_four_point_two_"
    "circle_v5_canary_two_kalmanson_refinements_physical_slice_cells.py"
)
BASE_PREPARER_PATH = ROOT / BASE_PREPARER_RELATIVE
BASE_PREPARER_COMMIT = "01e0f7badb6d177a11cbb481671dcbd192d3f78f"
BASE_PREPARER_SHA256 = "b8be5bf3fc58fc6165ce2f3cfe75760ac92ddd332046b4b8e7e017d59d07a078"
BASE_PREPARER_BYTES = 122_042

ROOT_SOURCE_RELATIVE = (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircle"
    "V7TwoKalmansonRefinements.lean"
)
ROOT_SOURCE_PATH = ROOT / ROOT_SOURCE_RELATIVE
ROOT_SOURCE_COMMIT = "ba5dd982fb3c345e75437daa710186bf5345c701"
ROOT_SOURCE_SHA256 = "1a68382662e8d005109dd6ff50fb3b5c3f18006b01acbd213a1f8ffd6ebf39fb"
ROOT_SOURCE_BYTES = 21_139

LANE_ID = "exact17-v7-two-kalmanson-successor-preparer-v3-20260823"
RUN_ID = "preparation-v3"
RUN_OWNER = "exact17-fourpoint-v7-preparer-v3"
BASE_HEAD = "b5e58d40590b8749979cded525d76f602ae321ea"

SOURCE_PATH = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircle"
    "V7TwoKalmansonRefinementsPhysicalSliceCoverage.lean"
)
SOURCE_RELATIVE = SOURCE_PATH.relative_to(ROOT).as_posix()
SOURCE_COMMIT = "93bd9d50d04e55008a265faf4116dcd2b2f4ae6e"
SOURCE_SHA256 = "81eb86af38a6c87b9b92f9ea859d6e372c3ec01b91da474c6306a13095177280"
SOURCE_BYTES = 5_291
EXPORTER_PATH = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircle"
    "V7TwoKalmansonRefinementsPhysicalSliceCellExport.lean"
)
EXPORTER_RELATIVE = EXPORTER_PATH.relative_to(ROOT).as_posix()
EXPORTER_COMMIT = SOURCE_COMMIT
EXPORTER_SHA256 = "2f0b439bae33e796cf10e312f43ef23dddfa4ee485e119bbd4334353adbcb90e"
EXPORTER_BYTES = 3_667
IMMEDIATE_PARENT_EXPORTER_PATH = ROOT / (
    "lean/Erdos9796Proof/P97/ATail/"
    "BlockerVExactSeventeenCanaryPerpBisectorSurvivorFourPointTwoCircle"
    "V6ModelCoreRefinementsPhysicalSliceCellExport.lean"
)
IMMEDIATE_PARENT_EXPORTER_RELATIVE = (
    IMMEDIATE_PARENT_EXPORTER_PATH.relative_to(ROOT).as_posix()
)
IMMEDIATE_PARENT_EXPORTER_COMMIT = "fae8495d14d9a2cdf35c19d1d7583c9a3d971eba"
IMMEDIATE_PARENT_EXPORTER_SHA256 = (
    "f72079a53cb41ead92f511654f5cc27baa73f79794c57709cac3a07d25f000b7"
)
IMMEDIATE_PARENT_EXPORTER_BYTES = 3_646
CHECKPOINT_PATH = ROOT / (
    ".codex/worktree-checkpoints/"
    "exact17-v7-two-kalmanson-successor-preparer-v3-20260823.json"
)
PREPARER_PATH = Path(__file__).resolve()
TEST_PATH = ROOT / (
    "scripts/test_prepare_exact17_canary_perp_bisector_survivor_four_point_two_"
    "circle_v7_two_kalmanson_refinements_physical_slice_cells.py"
)
PRODUCTION_CONFIG_RELATIVE = Path(
    "census/p97_search/waves/exact17/"
    "canary-perp-bisector-survivor-four-point-two-circle-v7-two-kalmanson-"
    "preparation-config-v3.json"
)
PRODUCTION_CONFIG_PATH = ROOT / PRODUCTION_CONFIG_RELATIVE
PRODUCTION_CONFIG_SCHEMA = (
    "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-v7-two-"
    "kalmanson-refinements-v3-preparation-config/v1"
)

PARENT_VARIABLES = 308
PARENT_CLAUSES = 7_409_810
IMMEDIATE_PARENT_CLAUSES = 7_409_788
CELL_CLAUSES = 7_409_816
CELL_COUNT = 76
SOURCE_CELL_PREFIX = (
    "canary-perp-bisector-survivor-four-point-two-circle-v7-two-kalmanson-"
    "refinements"
)

EXPECTED_SUFFIX = (
    (-307, -115, -119, -207, -210, -47, -40, -224, -238),
    (-307, -238, -234, -275, -284, -51, -46, -105, -115),
    (-308, -238, -231, -275, -284, -51, -46, -105, -112),
    (-307, -161, -169, -135, -134, -268, -270, -285, -280),
    (-307, -67, -59, -263, -256, -136, -120, -221, -220),
    (-308, -212, -220, -135, -134, -265, -270, -282, -280),
    (-308, -67, -59, -263, -256, -136, -120, -170, -169),
    (-307, -146, -153, -179, -174, -136, -123, -281, -280, -78, -76),
    (-307, -21, -30, -70, -78, -268, -265, -206, -220, -174, -186),
    (-307, -113, -119, -179, -174, -136, -123, -281, -280, -79, -76),
    (-307, -226, -234, -70, -78, -268, -265, -206, -220, -175, -186),
    (-308, -113, -119, -179, -174, -136, -123, -281, -280, -79, -76),
    (-307, -7, -9, -207, -210, -47, -40, -92, -98, -230, -224),
    (-307, -252, -240, -275, -284, -51, -46, -201, -204, -104, -105),
    (-308, -252, -240, -275, -284, -51, -46, -201, -204, -104, -105),
    (-307, -9, -2, -143, -150, -86, -92, -222, -230, -240, -252),
    (-307, -240, -247, -31, -24, -202, -201, -117, -104, -9, -7),
    (-308, -9, -2, -143, -150, -86, -92, -222, -230, -240, -252),
    (-308, -240, -247, -31, -24, -202, -201, -117, -104, -9, -7),
    (-307, -207, -210, -47, -40, -281, -285, -230, -224),
    (-307, -275, -284, -51, -46, -206, -221, -104, -105),
    (-308, -275, -284, -51, -46, -155, -170, -104, -105),
)
EXPECTED_SUFFIX_SHA256 = "3b490543c3dc09319128ef749cdd48cc981bcf86d3afb8560319745c655a0765"
EXPECTED_SUFFIX_OCCURRENCE = (
    0, 0, 0, 1, 1, 1, 1, 2, 2, 3, 3, 3, 5, 5, 5, 6, 6, 6, 6, 8, 8, 8,
)
EXPECTED_STRICT_NEW_PER_OCCURRENCE = (3, 4, 2, 3, 0, 3, 4, 0, 3)

OPERATOR_HELP = """\
Govern the V7 two-Kalmanson physical packet on the fresh preparation-v3 surface.

The authenticated 22-clause suffix extends the 7,409,788-clause V6 parent to
a 7,409,810-clause V7 root.  Each of the 76 physical cells has 308 variables
and 7,409,816 clauses.  This command never contacts PIQD or a SAT solver.

required options:
  --source PATH
  --root-source PATH
  --exporter PATH
  --immediate-parent-exporter PATH
  --checkpoint PATH
  --production-config PATH
  --production-config-commit COMMIT
  --output-root PATH

actions:
  --preflight
  --initialize-run-root
  preparation (default; also requires --source-commit COMMIT)
"""


def _sha256(raw: bytes) -> str:
    return hashlib.sha256(raw).hexdigest()


def _canonical_json_bytes(value: Any) -> bytes:
    return json.dumps(
        value, ensure_ascii=True, sort_keys=True, separators=(",", ":")
    ).encode("utf-8")


def _read_regular(path: Path, label: str) -> bytes:
    if path.is_symlink() or not path.is_file():
        raise RuntimeError(f"{label} is not a regular non-symlink file")
    info = path.stat()
    if not stat.S_ISREG(info.st_mode) or info.st_nlink != 1:
        raise RuntimeError(f"{label} custody shape drifted")
    return path.read_bytes()


def _verify_committed_blob(
    path: Path, relative: str, commit: str, expected_sha256: str, expected_bytes: int
) -> None:
    live = _read_regular(path, relative)
    if len(live) != expected_bytes or _sha256(live) != expected_sha256:
        raise RuntimeError(f"{relative} live bytes drifted")
    try:
        kind = subprocess.run(
            ["git", "cat-file", "-t", commit],
            cwd=ROOT,
            check=True,
            capture_output=True,
        ).stdout
        committed = subprocess.run(
            ["git", "show", f"{commit}:{relative}"],
            cwd=ROOT,
            check=True,
            capture_output=True,
        ).stdout
    except (OSError, subprocess.CalledProcessError) as error:
        raise RuntimeError(f"{relative} committed blob unavailable") from error
    if kind != b"commit\n" or committed != live:
        raise RuntimeError(f"{relative} committed blob drifted")


def validate_committed_dependencies() -> None:
    _verify_committed_blob(
        BASE_PREPARER_PATH,
        BASE_PREPARER_RELATIVE,
        BASE_PREPARER_COMMIT,
        BASE_PREPARER_SHA256,
        BASE_PREPARER_BYTES,
    )
    _verify_committed_blob(
        ROOT_SOURCE_PATH,
        ROOT_SOURCE_RELATIVE,
        ROOT_SOURCE_COMMIT,
        ROOT_SOURCE_SHA256,
        ROOT_SOURCE_BYTES,
    )
    _verify_committed_blob(
        SOURCE_PATH, SOURCE_RELATIVE, SOURCE_COMMIT, SOURCE_SHA256, SOURCE_BYTES
    )
    _verify_committed_blob(
        EXPORTER_PATH,
        EXPORTER_RELATIVE,
        EXPORTER_COMMIT,
        EXPORTER_SHA256,
        EXPORTER_BYTES,
    )
    _verify_committed_blob(
        IMMEDIATE_PARENT_EXPORTER_PATH,
        IMMEDIATE_PARENT_EXPORTER_RELATIVE,
        IMMEDIATE_PARENT_EXPORTER_COMMIT,
        IMMEDIATE_PARENT_EXPORTER_SHA256,
        IMMEDIATE_PARENT_EXPORTER_BYTES,
    )
    _validate_v7_contract()


def missing_lean_dependencies() -> tuple[Path, ...]:
    return tuple(
        path
        for path in (SOURCE_PATH, EXPORTER_PATH, IMMEDIATE_PARENT_EXPORTER_PATH)
        if not path.is_file() or path.is_symlink()
    )


def _load_base() -> Any:
    spec = importlib.util.spec_from_file_location(
        "exact17_v7_twok_committed_v6_preparer", BASE_PREPARER_PATH
    )
    if spec is None or spec.loader is None:
        raise RuntimeError("cannot load committed V6 preparer")
    module = importlib.util.module_from_spec(spec)
    sys.modules[spec.name] = module
    spec.loader.exec_module(module)
    return module


_BASE = _load_base()
PreparationError = _BASE.PreparationError
_INHERITED_CATEGORY_ID = _BASE.category_id


def category_id(center: int, category: str) -> str:
    """Return the V7-owned source ID after inherited physical validation."""

    _INHERITED_CATEGORY_ID(center, category)
    return f"{SOURCE_CELL_PREFIX}-next-center-{center:02d}-physical-{category}"


def _expected_v7_source_cell_inventory() -> tuple[tuple[int, str, str], ...]:
    cells: list[tuple[int, str, str]] = []
    for center in _BASE.LEGAL_CENTERS:
        categories = _BASE._delegated_call(
            _BASE.accepted.hardened._physical_categories, center
        )
        for physical_category in categories:
            cells.append(
                (center, physical_category, category_id(center, physical_category))
            )
    return tuple(cells)


def _validate_v7_source_id_contract() -> None:
    """Fail closed unless every source-ID producer resolves to the V7 surface."""

    inventory = _expected_v7_source_cell_inventory()
    identifiers = tuple(identifier for _, _, identifier in inventory)
    expected_prefix = f"{SOURCE_CELL_PREFIX}-next-center-"
    if len(inventory) != CELL_COUNT or len(set(identifiers)) != CELL_COUNT:
        raise PreparationError("V7 source cell inventory is not exactly 76 unique IDs")
    if any(
        not identifier.startswith(expected_prefix)
        or "v5-canary-two-kalmanson-refinements-next-center" in identifier
        for identifier in identifiers
    ):
        raise PreparationError("V7 source cell inventory contains an inherited ID")
    if _BASE.category_id is not category_id or _BASE._cell_id is not category_id:
        raise PreparationError("V7 source ID binding drifted")

    digest = "0" * 64
    for center, physical_category, identifier in inventory:
        if _BASE.category_id(center, physical_category) != identifier:
            raise PreparationError("V7 generated directory ID drifted")
        producer_raw = _BASE.build_producer(
            center=center,
            category=physical_category,
            source_path="source.lean",
            source_sha256=digest,
            root_source_path="root.lean",
            root_source_sha256=digest,
            exporter_path="exporter.lean",
            exporter_sha256=digest,
            immediate_parent_exporter_path="parent-exporter.lean",
            immediate_parent_exporter_sha256=digest,
            variable_map_sha256=digest,
            parent_root_sha256=digest,
            parent_producer_sha256=digest,
            parent_novelty={},
            delegated_dependencies={},
            production_config={},
        )
        producer = json.loads(producer_raw)
        source = producer.get("source_manifest")
        expected_run_id = f"{identifier}-{RUN_ID}"
        if (
            type(source) is not dict
            or source.get("source_id") != identifier
            or source.get("cardinality_scope")
            != f"exactly 17 models in {identifier}"
            or producer.get("producer_id") != expected_run_id
        ):
            raise PreparationError("V7 source ID did not reach every generated manifest")


def _validate_v7_contract() -> None:
    _validate_v7_source_id_contract()
    suffix = _BASE.EXPECTED_CANARY_PERP_BISECTOR_SURVIVOR_FOUR_POINT_TWO_CIRCLE_REFINEMENT_SUFFIX
    if suffix != EXPECTED_SUFFIX or len(suffix) != 22 or len(set(suffix)) != 22:
        raise PreparationError("V7 two-Kalmanson suffix inventory drifted")
    if _BASE.sha256_bytes(_BASE.canonical_json_bytes(suffix)) != EXPECTED_SUFFIX_SHA256:
        raise PreparationError("V7 two-Kalmanson suffix digest drifted")
    for clause in suffix:
        if not clause or len(set(clause)) != len(clause):
            raise PreparationError("V7 suffix clause is empty or repeats a literal")
        if any(literal == 0 or abs(literal) > PARENT_VARIABLES for literal in clause):
            raise PreparationError("V7 suffix clause exceeds the variable map")
        literal_set = set(clause)
        if any(-literal in literal_set for literal in literal_set):
            raise PreparationError("V7 suffix clause is tautological")
    if PARENT_CLAUSES != IMMEDIATE_PARENT_CLAUSES + len(suffix):
        raise PreparationError("V7 root is not V6 plus the exact 22-clause suffix")
    if CELL_CLAUSES != PARENT_CLAUSES + 6:
        raise PreparationError("V7 physical cell is not root plus six units")


def _validate_v7_parent_novelty(immediate_parent: Any, successor_root: Any) -> dict[str, Any]:
    """Authenticate exact prefix extension and full-parent non-subsumption."""

    _validate_v7_contract()
    suffix = EXPECTED_SUFFIX
    before_parent = immediate_parent.verify("V6 immediate parent")
    before_successor = successor_root.verify("V7 successor root")
    exact = [0] * len(suffix)
    subsumed = [0] * len(suffix)
    witnesses: list[dict[str, Any] | None] = [None] * len(suffix)
    successor_multiplicity = [0] * len(suffix)
    targets = [set(clause) for clause in suffix]
    parent_fd = -1
    successor_fd = -1
    observed_suffix: list[tuple[int, ...]] = []
    try:
        parent_fd = _BASE.os.dup(immediate_parent.descriptor)
        successor_fd = _BASE.os.dup(successor_root.descriptor)
        _BASE.os.lseek(parent_fd, 0, _BASE.os.SEEK_SET)
        _BASE.os.lseek(successor_fd, 0, _BASE.os.SEEK_SET)
        with (
            _BASE.os.fdopen(parent_fd, "rb", closefd=True) as parent_handle,
            _BASE.os.fdopen(successor_fd, "rb", closefd=True) as successor_handle,
        ):
            parent_fd = successor_fd = -1
            if _BASE._parent_header(parent_handle.readline()) != (
                PARENT_VARIABLES,
                IMMEDIATE_PARENT_CLAUSES,
            ):
                raise PreparationError("V6 parent DIMACS dimensions drifted")
            if _BASE._parent_header(successor_handle.readline()) != (
                PARENT_VARIABLES,
                PARENT_CLAUSES,
            ):
                raise PreparationError("V7 root DIMACS dimensions drifted")
            for index in range(IMMEDIATE_PARENT_CLAUSES):
                parent_line = parent_handle.readline()
                successor_line = successor_handle.readline()
                if not parent_line or successor_line != parent_line:
                    raise PreparationError(f"V7 parent prefix drifted at clause {index}")
                clause = _BASE._clause_tuple(
                    parent_line,
                    PARENT_VARIABLES,
                    f"V6 parent clause {index}",
                    require_unique_literals=False,
                )
                clause_set = set(clause)
                for target_index, target in enumerate(targets):
                    if clause == suffix[target_index]:
                        exact[target_index] += 1
                        successor_multiplicity[target_index] += 1
                    elif clause_set < target:
                        subsumed[target_index] += 1
                        if witnesses[target_index] is None:
                            witnesses[target_index] = {
                                "parent_clause_index": index,
                                "clause": list(clause),
                            }
            if parent_handle.readline():
                raise PreparationError("V6 parent has trailing clauses")
            for expected in suffix:
                line = successor_handle.readline()
                if not line:
                    raise PreparationError("V7 successor suffix ended early")
                observed = _BASE._clause_tuple(
                    line,
                    PARENT_VARIABLES,
                    "V7 successor suffix clause",
                    require_unique_literals=True,
                )
                observed_suffix.append(observed)
                if observed != expected:
                    raise PreparationError("V7 successor suffix order drifted")
                successor_multiplicity[suffix.index(observed)] += 1
            if successor_handle.readline():
                raise PreparationError("V7 successor has trailing clauses")
    finally:
        if parent_fd >= 0:
            _BASE.os.close(parent_fd)
        if successor_fd >= 0:
            _BASE.os.close(successor_fd)
    if _BASE._anchor(before_parent) != _BASE._anchor(immediate_parent.verify("V6 immediate parent")):
        raise PreparationError("V6 parent changed during novelty scan")
    if _BASE._anchor(before_successor) != _BASE._anchor(successor_root.verify("V7 successor root")):
        raise PreparationError("V7 successor changed during novelty scan")
    if exact != [0] * len(suffix) or subsumed != [0] * len(suffix):
        raise PreparationError("V7 suffix is not strict-new against the complete V6 parent")
    if successor_multiplicity != [1] * len(suffix):
        raise PreparationError("V7 suffix multiplicity is not exactly one")
    per_occurrence = [EXPECTED_SUFFIX_OCCURRENCE.count(index) for index in range(9)]
    if tuple(per_occurrence) != EXPECTED_STRICT_NEW_PER_OCCURRENCE:
        raise PreparationError("V7 strict-new per-occurrence profile drifted")
    return {
        "schema": (
            "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-v7-"
            "two-kalmanson-refinements-parent-novelty/v1"
        ),
        "policy": {
            "parent_scan": "stream-all-immediate-parent-clauses",
            "exact_novelty": "ordered-literal-tuple multiplicity must be zero",
            "subsumption": "all 22 selected orbit clauses are strict-new",
            "successor_shape": "byte-exact parent prefix plus ordered 22-clause suffix",
            "child_multiplicity": "each suffix tuple occurs exactly once",
        },
        "immediate_parent_clause_count_scanned": IMMEDIATE_PARENT_CLAUSES,
        "suffix_clause_count": len(suffix),
        "suffix_clauses": [list(clause) for clause in suffix],
        "exact_parent_multiplicity": exact,
        "parent_subsumer_count": subsumed,
        "parent_subsumer_witness": witnesses,
        "strict_new_suffix_indices": list(range(len(suffix))),
        "strict_new_suffix_count": len(suffix),
        "strict_new_per_occurrence": per_occurrence,
        "successor_multiplicity": successor_multiplicity,
        "parent_body_exact_prefix": True,
        "suffix_exact_order": observed_suffix == list(suffix),
        "observed_suffix": [list(clause) for clause in observed_suffix],
    }


def _configure_base() -> None:
    replacements = {
        "LANE_ID": LANE_ID,
        "RUN_ID": RUN_ID,
        "RUN_OWNER": RUN_OWNER,
        "BASE_HEAD": BASE_HEAD,
        "SOURCE_PATH": SOURCE_PATH,
        "ROOT_SOURCE_PATH": ROOT_SOURCE_PATH,
        "EXPORTER_PATH": EXPORTER_PATH,
        "IMMEDIATE_PARENT_EXPORTER_PATH": IMMEDIATE_PARENT_EXPORTER_PATH,
        "CHECKPOINT_PATH": CHECKPOINT_PATH,
        "PREPARER_PATH": PREPARER_PATH,
        "TEST_PATH": TEST_PATH,
        "PRODUCTION_CONFIG_RELATIVE": PRODUCTION_CONFIG_RELATIVE,
        "PRODUCTION_CONFIG_PATH": PRODUCTION_CONFIG_PATH,
        "PRODUCTION_CONFIG_SCHEMA": PRODUCTION_CONFIG_SCHEMA,
        "PARENT_VARIABLES": PARENT_VARIABLES,
        "PARENT_CLAUSES": PARENT_CLAUSES,
        "IMMEDIATE_PARENT_CLAUSES": IMMEDIATE_PARENT_CLAUSES,
        "CELL_CLAUSES": CELL_CLAUSES,
        "CELL_COUNT": CELL_COUNT,
        "SOURCE_THEOREM": (
            "Problem97.ATailBlockerVExactSeventeenCanaryPerpBisectorSurvivor"
            "FourPointTwoCircleV7TwoKalmansonRefinementsPhysicalSliceCoverage."
            "sourceAssign_canaryPerpBisectorSurvivorFourPointTwoCircleV7TwoKalmanson"
            "RefinementPhysicalSliceCell"
        ),
        "EXPECTED_CANARY_PERP_BISECTOR_SURVIVOR_FOUR_POINT_TWO_CIRCLE_REFINEMENT_SUFFIX": EXPECTED_SUFFIX,
        "EXPECTED_CANARY_PERP_BISECTOR_SURVIVOR_FOUR_POINT_TWO_CIRCLE_REFINEMENT_SUFFIX_SHA256": EXPECTED_SUFFIX_SHA256,
        "EXPECTED_EXACT_PARENT_MULTIPLICITY": (0,) * 22,
        "EXPECTED_PARENT_SUBSUMER_COUNTS": (0,) * 22,
        "EXPECTED_PARENT_SUBSUMER_CLAUSES": ((),) * 22,
        "EXPECTED_STRICT_NEW_SUFFIX_INDICES": tuple(range(22)),
        "EXPECTED_SUFFIX_OCCURRENCE": EXPECTED_SUFFIX_OCCURRENCE,
        "EXPECTED_STRICT_NEW_PER_OCCURRENCE": EXPECTED_STRICT_NEW_PER_OCCURRENCE,
        "ORDER_SHA256": _BASE.sha256_bytes(
            b"exact17-canary-perp-bisector-survivor-four-point-two-circle-v7-two-kalmanson-refinements-physical-slice-order-v1"
        ),
        "SCHEMA": "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-v7-two-kalmanson-refinements-physical-slice-preparation/v1",
        "CAMPAIGN_SCHEMA": "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-v7-two-kalmanson-refinements-physical-slice-campaign/v1",
        "FINITE_SCHEMA": "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-v7-two-kalmanson-refinements-physical-slice/v1",
        "ROOT_PRODUCER_SCHEMA": "p97-exact17-canary-perp-bisector-survivor-four-point-two-circle-v7-two-kalmanson-refinements-root-producer/v1",
        "PRODUCTION_PINS_FINALIZED": False,
        "PINNED_SOURCE_COMMIT": "",
        "REGISTERED_GENERATED_ROOT": "",
        "EXPECTED_SOURCE_SHA256": "",
        "EXPECTED_ROOT_SOURCE_SHA256": "",
        "EXPECTED_EXPORTER_SHA256": "",
        "EXPECTED_IMMEDIATE_PARENT_EXPORTER_SHA256": "",
        "EXPECTED_CHECKPOINT_SHA256": "",
        "EXPECTED_CHECKPOINT_MANIFEST_SHA256": "",
    }
    for name, value in replacements.items():
        setattr(_BASE, name, value)
    for function_name in ("preflight_configuration", "initialize_run_root", "prepare_campaign"):
        function = getattr(_BASE, function_name)
        defaults = dict(function.__kwdefaults__ or {})
        defaults.update(
            {
                "source_path": SOURCE_PATH,
                "root_source_path": ROOT_SOURCE_PATH,
                "exporter_path": EXPORTER_PATH,
                "immediate_parent_exporter_path": IMMEDIATE_PARENT_EXPORTER_PATH,
                "checkpoint_path": CHECKPOINT_PATH,
                "preparer_path": PREPARER_PATH,
                "test_path": TEST_PATH,
            }
        )
        function.__kwdefaults__ = defaults
    _BASE._validate_canary_perp_bisector_survivor_four_point_two_circle_v4_combined_refinement_contract = _validate_v7_contract
    _BASE.validate_canary_perp_bisector_survivor_four_point_two_circle_v4_combined_refinement_parent_novelty = _validate_v7_parent_novelty
    # The delegated V5 preparer resolves `category_id` from its own module
    # globals at every source-ID call site.  `_cell_id` is retained only as a
    # compatibility alias for downstream adapters; overriding it alone does
    # not affect physical packet generation.
    _BASE.category_id = category_id
    _BASE._cell_id = category_id


_configure_base()


def preflight_configuration(**kwargs: Any) -> dict[str, Any]:
    validate_committed_dependencies()
    return _BASE.preflight_configuration(**kwargs)


def initialize_run_root(**kwargs: Any) -> dict[str, Any]:
    validate_committed_dependencies()
    return _BASE.initialize_run_root(**kwargs)


def prepare_campaign(**kwargs: Any) -> dict[str, Any]:
    validate_committed_dependencies()
    return _BASE.prepare_campaign(**kwargs)


def __getattr__(name: str) -> Any:
    return getattr(_BASE, name)


def main(argv: list[str] | None = None) -> int:
    operator_args = sys.argv[1:] if argv is None else argv
    if "-h" in operator_args or "--help" in operator_args:
        print(OPERATOR_HELP)
        return 0
    validate_committed_dependencies()
    return _BASE.main(argv)


if __name__ == "__main__":
    raise SystemExit(main())
