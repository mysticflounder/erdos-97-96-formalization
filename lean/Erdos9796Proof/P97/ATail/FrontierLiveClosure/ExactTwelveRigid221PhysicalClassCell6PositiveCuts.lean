/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221PhysicalClassWitnessBridge
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SafeCandidate

/-!
# Exact-twelve cell-6 physically-bridged class cuts

GENERATED FILE - do not edit by hand.  Produced by
`scratch/rigid221-sourceheavy-anchor/core-pair/generate_s1_class_cut_lean.py`
from `s1_class_cut_manifest_v1.json`; regenerate rather than patching.

Each entry is one full-row unit cut of the S1 mid-angle witness family at
the cell-6 placement `(d, v) = (0, 3)`: a distinct candidate four-row
hosted at an on-class center `z` whose support contains a class pair
`{p, q}` that `z` never strictly separates in any of the 48 canonical
boundary orders (`witnessSameSideAll48 z p q = true`).  A row hosting
several admissible pairs appears once, certified by its first admissible
witness in combo order, so the emitted clause list is duplicate-free.  The proof-carrying form is
`PhysicalClassPositiveNogood.ofCut` with `PhysicalClassCutData.witness`;
the class-radius hypothesis is discharged at the leaf by
`FrozenRoleLabeling.physicalClassRadius`.

This is finite exact-twelve certificate ingress only.  It does not assert
terminal UNSAT, complete arm coverage, an arbitrary-cardinality lift, or
live Rigid221 closure.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress
namespace PhysicalClassCell6PositiveCuts

open ExactTwelveCarrierIngress
open GenericRowNogoodCertificate

/-- The cell-6 S1 class-cut entries: one hosted candidate row and its
witness datum per cut. -/
def cutEntries : List (RowChoice Label × PhysicalClassCutData) :=
  [ ({ center := 0, support := {1, 3, 4, 6} },
     .witness 0 3 6)
  , ({ center := 0, support := {1, 3, 4, 8} },
     .witness 0 3 8)
  , ({ center := 0, support := {1, 3, 4, 9} },
     .witness 0 3 9)
  , ({ center := 0, support := {1, 3, 5, 6} },
     .witness 0 3 6)
  , ({ center := 0, support := {1, 3, 5, 8} },
     .witness 0 3 8)
  , ({ center := 0, support := {1, 3, 5, 9} },
     .witness 0 3 9)
  , ({ center := 0, support := {3, 4, 5, 6} },
     .witness 0 3 6)
  , ({ center := 0, support := {3, 4, 5, 8} },
     .witness 0 3 8)
  , ({ center := 0, support := {3, 4, 5, 9} },
     .witness 0 3 9)
  , ({ center := 0, support := {3, 4, 6, 10} },
     .witness 0 3 6)
  , ({ center := 0, support := {3, 4, 6, 11} },
     .witness 0 3 6)
  , ({ center := 0, support := {3, 4, 8, 10} },
     .witness 0 3 8)
  , ({ center := 0, support := {3, 4, 8, 11} },
     .witness 0 3 8)
  , ({ center := 0, support := {3, 4, 9, 10} },
     .witness 0 3 9)
  , ({ center := 0, support := {3, 4, 9, 11} },
     .witness 0 3 9)
  , ({ center := 0, support := {3, 5, 6, 10} },
     .witness 0 3 6)
  , ({ center := 0, support := {3, 5, 6, 11} },
     .witness 0 3 6)
  , ({ center := 0, support := {3, 5, 8, 10} },
     .witness 0 3 8)
  , ({ center := 0, support := {3, 5, 8, 11} },
     .witness 0 3 8)
  , ({ center := 0, support := {3, 5, 9, 10} },
     .witness 0 3 9)
  , ({ center := 0, support := {3, 5, 9, 11} },
     .witness 0 3 9)
  , ({ center := 3, support := {0, 1, 4, 6} },
     .witness 3 0 6)
  , ({ center := 3, support := {0, 1, 4, 8} },
     .witness 3 0 8)
  , ({ center := 3, support := {0, 1, 4, 9} },
     .witness 3 0 9)
  , ({ center := 3, support := {0, 1, 5, 6} },
     .witness 3 0 6)
  , ({ center := 3, support := {0, 1, 5, 8} },
     .witness 3 0 8)
  , ({ center := 3, support := {0, 1, 5, 9} },
     .witness 3 0 9)
  , ({ center := 3, support := {0, 1, 6, 7} },
     .witness 3 0 6)
  , ({ center := 3, support := {0, 1, 6, 8} },
     .witness 3 0 6)
  , ({ center := 3, support := {0, 1, 6, 9} },
     .witness 3 0 6)
  , ({ center := 3, support := {0, 1, 6, 10} },
     .witness 3 0 6)
  , ({ center := 3, support := {0, 1, 6, 11} },
     .witness 3 0 6)
  , ({ center := 3, support := {0, 1, 7, 8} },
     .witness 3 0 8)
  , ({ center := 3, support := {0, 1, 7, 9} },
     .witness 3 0 9)
  , ({ center := 3, support := {0, 1, 8, 9} },
     .witness 3 0 8)
  , ({ center := 3, support := {0, 1, 8, 10} },
     .witness 3 0 8)
  , ({ center := 3, support := {0, 1, 8, 11} },
     .witness 3 0 8)
  , ({ center := 3, support := {0, 1, 9, 10} },
     .witness 3 0 9)
  , ({ center := 3, support := {0, 1, 9, 11} },
     .witness 3 0 9)
  , ({ center := 3, support := {0, 2, 4, 6} },
     .witness 3 0 6)
  , ({ center := 3, support := {0, 2, 4, 8} },
     .witness 3 0 8)
  , ({ center := 3, support := {0, 2, 4, 9} },
     .witness 3 0 9)
  , ({ center := 3, support := {0, 2, 5, 6} },
     .witness 3 0 6)
  , ({ center := 3, support := {0, 2, 5, 8} },
     .witness 3 0 8)
  , ({ center := 3, support := {0, 2, 5, 9} },
     .witness 3 0 9)
  , ({ center := 3, support := {0, 2, 6, 7} },
     .witness 3 0 6)
  , ({ center := 3, support := {0, 2, 6, 8} },
     .witness 3 0 6)
  , ({ center := 3, support := {0, 2, 6, 9} },
     .witness 3 0 6)
  , ({ center := 3, support := {0, 2, 6, 10} },
     .witness 3 0 6)
  , ({ center := 3, support := {0, 2, 6, 11} },
     .witness 3 0 6)
  , ({ center := 3, support := {0, 2, 7, 8} },
     .witness 3 0 8)
  , ({ center := 3, support := {0, 2, 7, 9} },
     .witness 3 0 9)
  , ({ center := 3, support := {0, 2, 8, 9} },
     .witness 3 0 8)
  , ({ center := 3, support := {0, 2, 8, 10} },
     .witness 3 0 8)
  , ({ center := 3, support := {0, 2, 8, 11} },
     .witness 3 0 8)
  , ({ center := 3, support := {0, 2, 9, 10} },
     .witness 3 0 9)
  , ({ center := 3, support := {0, 2, 9, 11} },
     .witness 3 0 9)
  , ({ center := 3, support := {0, 4, 5, 6} },
     .witness 3 0 6)
  , ({ center := 3, support := {0, 4, 5, 8} },
     .witness 3 0 8)
  , ({ center := 3, support := {0, 4, 5, 9} },
     .witness 3 0 9)
  , ({ center := 3, support := {0, 4, 6, 7} },
     .witness 3 0 6)
  , ({ center := 3, support := {0, 4, 6, 8} },
     .witness 3 0 6)
  , ({ center := 3, support := {0, 4, 6, 9} },
     .witness 3 0 6)
  , ({ center := 3, support := {0, 4, 6, 10} },
     .witness 3 0 6)
  , ({ center := 3, support := {0, 4, 6, 11} },
     .witness 3 0 6)
  , ({ center := 3, support := {0, 4, 7, 8} },
     .witness 3 0 8)
  , ({ center := 3, support := {0, 4, 7, 9} },
     .witness 3 0 9)
  , ({ center := 3, support := {0, 4, 8, 9} },
     .witness 3 0 8)
  , ({ center := 3, support := {0, 4, 8, 10} },
     .witness 3 0 8)
  , ({ center := 3, support := {0, 4, 8, 11} },
     .witness 3 0 8)
  , ({ center := 3, support := {0, 4, 9, 10} },
     .witness 3 0 9)
  , ({ center := 3, support := {0, 4, 9, 11} },
     .witness 3 0 9)
  , ({ center := 3, support := {0, 5, 6, 7} },
     .witness 3 0 6)
  , ({ center := 3, support := {0, 5, 6, 8} },
     .witness 3 0 6)
  , ({ center := 3, support := {0, 5, 6, 9} },
     .witness 3 0 6)
  , ({ center := 3, support := {0, 5, 6, 10} },
     .witness 3 0 6)
  , ({ center := 3, support := {0, 5, 6, 11} },
     .witness 3 0 6)
  , ({ center := 3, support := {0, 5, 7, 8} },
     .witness 3 0 8)
  , ({ center := 3, support := {0, 5, 7, 9} },
     .witness 3 0 9)
  , ({ center := 3, support := {0, 5, 8, 9} },
     .witness 3 0 8)
  , ({ center := 3, support := {0, 5, 8, 10} },
     .witness 3 0 8)
  , ({ center := 3, support := {0, 5, 8, 11} },
     .witness 3 0 8)
  , ({ center := 3, support := {0, 5, 9, 10} },
     .witness 3 0 9)
  , ({ center := 3, support := {0, 5, 9, 11} },
     .witness 3 0 9)
  , ({ center := 3, support := {0, 6, 7, 8} },
     .witness 3 0 6)
  , ({ center := 3, support := {0, 6, 7, 9} },
     .witness 3 0 6)
  , ({ center := 3, support := {0, 6, 7, 10} },
     .witness 3 0 6)
  , ({ center := 3, support := {0, 6, 7, 11} },
     .witness 3 0 6)
  , ({ center := 3, support := {0, 6, 8, 9} },
     .witness 3 0 6)
  , ({ center := 3, support := {0, 6, 8, 10} },
     .witness 3 0 6)
  , ({ center := 3, support := {0, 6, 8, 11} },
     .witness 3 0 6)
  , ({ center := 3, support := {0, 6, 9, 10} },
     .witness 3 0 6)
  , ({ center := 3, support := {0, 6, 9, 11} },
     .witness 3 0 6)
  , ({ center := 3, support := {0, 6, 10, 11} },
     .witness 3 0 6)
  , ({ center := 3, support := {0, 7, 8, 9} },
     .witness 3 0 8)
  , ({ center := 3, support := {0, 7, 8, 10} },
     .witness 3 0 8)
  , ({ center := 3, support := {0, 7, 8, 11} },
     .witness 3 0 8)
  , ({ center := 3, support := {0, 7, 9, 10} },
     .witness 3 0 9)
  , ({ center := 3, support := {0, 7, 9, 11} },
     .witness 3 0 9)
  , ({ center := 3, support := {0, 8, 9, 10} },
     .witness 3 0 8)
  , ({ center := 3, support := {0, 8, 9, 11} },
     .witness 3 0 8)
  , ({ center := 3, support := {0, 8, 10, 11} },
     .witness 3 0 8)
  , ({ center := 3, support := {0, 9, 10, 11} },
     .witness 3 0 9)
  , ({ center := 3, support := {1, 2, 6, 8} },
     .witness 3 6 8)
  , ({ center := 3, support := {1, 2, 6, 9} },
     .witness 3 6 9)
  , ({ center := 3, support := {1, 2, 8, 9} },
     .witness 3 8 9)
  , ({ center := 3, support := {1, 4, 6, 8} },
     .witness 3 6 8)
  , ({ center := 3, support := {1, 4, 6, 9} },
     .witness 3 6 9)
  , ({ center := 3, support := {1, 4, 8, 9} },
     .witness 3 8 9)
  , ({ center := 3, support := {1, 5, 6, 8} },
     .witness 3 6 8)
  , ({ center := 3, support := {1, 5, 6, 9} },
     .witness 3 6 9)
  , ({ center := 3, support := {1, 5, 8, 9} },
     .witness 3 8 9)
  , ({ center := 3, support := {1, 6, 7, 8} },
     .witness 3 6 8)
  , ({ center := 3, support := {1, 6, 7, 9} },
     .witness 3 6 9)
  , ({ center := 3, support := {1, 6, 8, 9} },
     .witness 3 6 8)
  , ({ center := 3, support := {1, 6, 8, 10} },
     .witness 3 6 8)
  , ({ center := 3, support := {1, 6, 8, 11} },
     .witness 3 6 8)
  , ({ center := 3, support := {1, 6, 9, 10} },
     .witness 3 6 9)
  , ({ center := 3, support := {1, 6, 9, 11} },
     .witness 3 6 9)
  , ({ center := 3, support := {1, 7, 8, 9} },
     .witness 3 8 9)
  , ({ center := 3, support := {1, 8, 9, 10} },
     .witness 3 8 9)
  , ({ center := 3, support := {1, 8, 9, 11} },
     .witness 3 8 9)
  , ({ center := 3, support := {2, 4, 6, 8} },
     .witness 3 6 8)
  , ({ center := 3, support := {2, 4, 6, 9} },
     .witness 3 6 9)
  , ({ center := 3, support := {2, 4, 8, 9} },
     .witness 3 8 9)
  , ({ center := 3, support := {2, 5, 6, 8} },
     .witness 3 6 8)
  , ({ center := 3, support := {2, 5, 6, 9} },
     .witness 3 6 9)
  , ({ center := 3, support := {2, 5, 8, 9} },
     .witness 3 8 9)
  , ({ center := 3, support := {2, 6, 7, 8} },
     .witness 3 6 8)
  , ({ center := 3, support := {2, 6, 7, 9} },
     .witness 3 6 9)
  , ({ center := 3, support := {2, 6, 8, 9} },
     .witness 3 6 8)
  , ({ center := 3, support := {2, 6, 8, 10} },
     .witness 3 6 8)
  , ({ center := 3, support := {2, 6, 8, 11} },
     .witness 3 6 8)
  , ({ center := 3, support := {2, 6, 9, 10} },
     .witness 3 6 9)
  , ({ center := 3, support := {2, 6, 9, 11} },
     .witness 3 6 9)
  , ({ center := 3, support := {2, 7, 8, 9} },
     .witness 3 8 9)
  , ({ center := 3, support := {2, 8, 9, 10} },
     .witness 3 8 9)
  , ({ center := 3, support := {2, 8, 9, 11} },
     .witness 3 8 9)
  , ({ center := 3, support := {4, 5, 6, 8} },
     .witness 3 6 8)
  , ({ center := 3, support := {4, 5, 6, 9} },
     .witness 3 6 9)
  , ({ center := 3, support := {4, 5, 8, 9} },
     .witness 3 8 9)
  , ({ center := 3, support := {4, 6, 7, 8} },
     .witness 3 6 8)
  , ({ center := 3, support := {4, 6, 7, 9} },
     .witness 3 6 9)
  , ({ center := 3, support := {4, 6, 8, 9} },
     .witness 3 6 8)
  , ({ center := 3, support := {4, 6, 8, 10} },
     .witness 3 6 8)
  , ({ center := 3, support := {4, 6, 8, 11} },
     .witness 3 6 8)
  , ({ center := 3, support := {4, 6, 9, 10} },
     .witness 3 6 9)
  , ({ center := 3, support := {4, 6, 9, 11} },
     .witness 3 6 9)
  , ({ center := 3, support := {4, 7, 8, 9} },
     .witness 3 8 9)
  , ({ center := 3, support := {4, 8, 9, 10} },
     .witness 3 8 9)
  , ({ center := 3, support := {4, 8, 9, 11} },
     .witness 3 8 9)
  , ({ center := 3, support := {5, 6, 7, 8} },
     .witness 3 6 8)
  , ({ center := 3, support := {5, 6, 7, 9} },
     .witness 3 6 9)
  , ({ center := 3, support := {5, 6, 8, 9} },
     .witness 3 6 8)
  , ({ center := 3, support := {5, 6, 8, 10} },
     .witness 3 6 8)
  , ({ center := 3, support := {5, 6, 8, 11} },
     .witness 3 6 8)
  , ({ center := 3, support := {5, 6, 9, 10} },
     .witness 3 6 9)
  , ({ center := 3, support := {5, 6, 9, 11} },
     .witness 3 6 9)
  , ({ center := 3, support := {5, 7, 8, 9} },
     .witness 3 8 9)
  , ({ center := 3, support := {5, 8, 9, 10} },
     .witness 3 8 9)
  , ({ center := 3, support := {5, 8, 9, 11} },
     .witness 3 8 9)
  , ({ center := 3, support := {6, 7, 8, 9} },
     .witness 3 6 8)
  , ({ center := 3, support := {6, 7, 8, 10} },
     .witness 3 6 8)
  , ({ center := 3, support := {6, 7, 8, 11} },
     .witness 3 6 8)
  , ({ center := 3, support := {6, 7, 9, 10} },
     .witness 3 6 9)
  , ({ center := 3, support := {6, 7, 9, 11} },
     .witness 3 6 9)
  , ({ center := 3, support := {6, 8, 9, 10} },
     .witness 3 6 8)
  , ({ center := 3, support := {6, 8, 9, 11} },
     .witness 3 6 8)
  , ({ center := 3, support := {6, 8, 10, 11} },
     .witness 3 6 8)
  , ({ center := 3, support := {6, 9, 10, 11} },
     .witness 3 6 9)
  , ({ center := 3, support := {7, 8, 9, 10} },
     .witness 3 8 9)
  , ({ center := 3, support := {7, 8, 9, 11} },
     .witness 3 8 9)
  , ({ center := 3, support := {8, 9, 10, 11} },
     .witness 3 8 9)
  , ({ center := 6, support := {0, 1, 8, 9} },
     .witness 6 8 9)
  , ({ center := 6, support := {0, 2, 8, 9} },
     .witness 6 8 9)
  , ({ center := 6, support := {0, 3, 8, 9} },
     .witness 6 8 9)
  , ({ center := 6, support := {0, 4, 8, 9} },
     .witness 6 8 9)
  , ({ center := 6, support := {0, 5, 8, 9} },
     .witness 6 8 9)
  , ({ center := 6, support := {0, 8, 9, 10} },
     .witness 6 8 9)
  , ({ center := 6, support := {0, 8, 9, 11} },
     .witness 6 8 9)
  , ({ center := 6, support := {1, 2, 8, 9} },
     .witness 6 8 9)
  , ({ center := 6, support := {1, 3, 8, 9} },
     .witness 6 8 9)
  , ({ center := 6, support := {1, 4, 8, 9} },
     .witness 6 8 9)
  , ({ center := 6, support := {1, 5, 8, 9} },
     .witness 6 8 9)
  , ({ center := 6, support := {1, 8, 9, 10} },
     .witness 6 8 9)
  , ({ center := 6, support := {1, 8, 9, 11} },
     .witness 6 8 9)
  , ({ center := 6, support := {2, 3, 8, 9} },
     .witness 6 8 9)
  , ({ center := 6, support := {2, 4, 8, 9} },
     .witness 6 8 9)
  , ({ center := 6, support := {2, 5, 8, 9} },
     .witness 6 8 9)
  , ({ center := 6, support := {2, 8, 9, 10} },
     .witness 6 8 9)
  , ({ center := 6, support := {2, 8, 9, 11} },
     .witness 6 8 9)
  , ({ center := 6, support := {3, 4, 8, 9} },
     .witness 6 8 9)
  , ({ center := 6, support := {3, 5, 8, 9} },
     .witness 6 8 9)
  , ({ center := 6, support := {3, 8, 9, 10} },
     .witness 6 8 9)
  , ({ center := 6, support := {3, 8, 9, 11} },
     .witness 6 8 9)
  , ({ center := 6, support := {4, 5, 8, 9} },
     .witness 6 8 9)
  , ({ center := 6, support := {4, 8, 9, 10} },
     .witness 6 8 9)
  , ({ center := 6, support := {4, 8, 9, 11} },
     .witness 6 8 9)
  , ({ center := 6, support := {5, 8, 9, 10} },
     .witness 6 8 9)
  , ({ center := 6, support := {5, 8, 9, 11} },
     .witness 6 8 9)
  , ({ center := 6, support := {8, 9, 10, 11} },
     .witness 6 8 9)
  , ({ center := 9, support := {0, 1, 6, 8} },
     .witness 9 6 8)
  , ({ center := 9, support := {0, 2, 6, 8} },
     .witness 9 6 8)
  , ({ center := 9, support := {0, 3, 6, 8} },
     .witness 9 6 8)
  , ({ center := 9, support := {0, 4, 6, 8} },
     .witness 9 6 8)
  , ({ center := 9, support := {0, 5, 6, 8} },
     .witness 9 6 8)
  , ({ center := 9, support := {0, 6, 8, 10} },
     .witness 9 6 8)
  , ({ center := 9, support := {0, 6, 8, 11} },
     .witness 9 6 8)
  , ({ center := 9, support := {1, 2, 6, 8} },
     .witness 9 6 8)
  , ({ center := 9, support := {1, 3, 6, 8} },
     .witness 9 6 8)
  , ({ center := 9, support := {1, 4, 6, 8} },
     .witness 9 6 8)
  , ({ center := 9, support := {1, 5, 6, 8} },
     .witness 9 6 8)
  , ({ center := 9, support := {1, 6, 8, 10} },
     .witness 9 6 8)
  , ({ center := 9, support := {1, 6, 8, 11} },
     .witness 9 6 8)
  , ({ center := 9, support := {2, 3, 6, 8} },
     .witness 9 6 8)
  , ({ center := 9, support := {2, 4, 6, 8} },
     .witness 9 6 8)
  , ({ center := 9, support := {2, 5, 6, 8} },
     .witness 9 6 8)
  , ({ center := 9, support := {2, 6, 8, 10} },
     .witness 9 6 8)
  , ({ center := 9, support := {2, 6, 8, 11} },
     .witness 9 6 8)
  , ({ center := 9, support := {3, 4, 6, 8} },
     .witness 9 6 8)
  , ({ center := 9, support := {3, 5, 6, 8} },
     .witness 9 6 8)
  , ({ center := 9, support := {3, 6, 8, 10} },
     .witness 9 6 8)
  , ({ center := 9, support := {3, 6, 8, 11} },
     .witness 9 6 8)
  , ({ center := 9, support := {4, 5, 6, 8} },
     .witness 9 6 8)
  , ({ center := 9, support := {4, 6, 8, 10} },
     .witness 9 6 8)
  , ({ center := 9, support := {4, 6, 8, 11} },
     .witness 9 6 8)
  , ({ center := 9, support := {5, 6, 8, 10} },
     .witness 9 6 8)
  , ({ center := 9, support := {5, 6, 8, 11} },
     .witness 9 6 8)
  , ({ center := 9, support := {6, 8, 10, 11} },
     .witness 9 6 8) ]

/-- Every entry passes the physically-bridged certificate check at the
cell-6 placement. -/
theorem cutEntries_check :
    cutEntries.all
      (fun entry => entry.2.check 0 3 [entry.1]) = true := by
  native_decide

/-- The number of cell-6 S1 class cuts. -/
theorem cutEntries_length : cutEntries.length = 229 := by
  native_decide

/-- The proof-carrying cell-6 class bank. -/
def physicalClassCell6Bank : List (PhysicalClassPositiveNogood 0 3) :=
  cutEntries.attach.map fun entry =>
    PhysicalClassPositiveNogood.ofCut 0 3 [entry.1.1] entry.1.2
      (List.all_eq_true.mp cutEntries_check entry.1 entry.2)

/-- Every bank choice lies on the frozen safe candidate surface, as the
class-extended terminal consumer requires. -/
theorem physicalClassCell6Bank_encodable :
    ∀ nogood ∈ physicalClassCell6Bank, ∀ choice ∈ nogood.choices,
      FrozenSafeCandidateAt choice.center choice.support := by
  have hall :
      cutEntries.all
        (fun entry =>
          decide (FrozenSafeCandidateAt entry.1.center entry.1.support)) =
        true := by
    native_decide
  intro nogood hnogood choice hchoice
  simp only [physicalClassCell6Bank, List.mem_map, List.mem_attach,
    true_and] at hnogood
  obtain ⟨entry, hentry⟩ := hnogood
  subst hentry
  simp only [PhysicalClassPositiveNogood.ofCut, List.mem_singleton]
    at hchoice
  subst hchoice
  exact of_decide_eq_true
    (List.all_eq_true.mp hall entry.1 entry.2)

end PhysicalClassCell6PositiveCuts
end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
