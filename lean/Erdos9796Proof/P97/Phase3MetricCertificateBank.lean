/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.TwoTripleRowSixPointEuclideanObstruction
import Erdos9796Proof.P97.Phase3ThreeRhombusRowAdapter
import Erdos9796Proof.P97.Phase3SurvivorSingularCertificates

/-!
# Phase-3 metric certificate bank

This import-only module collects the current source-clean metric artifacts
from the Phase-3 realization lane:

* the two-triple six-point Euclidean obstruction;
* the order-free seven-point three-rhombus collision obstruction and its
  exact thirteen-membership Phase-3 row adapter; and
* the two exact rational unit-ideal certificates representing the 100 frozen
  survivors (one survivor in the first equality system and 99 in the second).

The imports establish Lean ingress only.  They do not assert that all 100
survivors satisfy either equality system, nor do they provide a Phase-3
coverage bridge or a Problem 97 closure theorem.
-/
