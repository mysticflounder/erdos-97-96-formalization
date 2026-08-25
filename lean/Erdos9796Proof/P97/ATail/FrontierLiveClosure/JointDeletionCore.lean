/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.ApexRichClassStructure
import Erdos9796Proof.P97.ATail.BiApexBlockerMultiplicity
import Erdos9796Proof.P97.ATail.BiApexRobustCapBounds
import Erdos9796Proof.P97.ATail.BlockerMultiplicityGeometry
import Erdos9796Proof.P97.ATail.CardElevenUniqueFourCertificateIngress
import Erdos9796Proof.P97.ATail.CriticalPairFrontier
import Erdos9796Proof.P97.ATail.ExactFourPhysicalConsumer
import Erdos9796Proof.P97.ATail.ExactFourRobustCapExpansion
import Erdos9796Proof.P97.ATail.ExactFifteenApexProfile
import Erdos9796Proof.P97.ATail.EndpointFreshFiveRoleKalmanson
import Erdos9796Proof.P97.ATail.FirstApexUniqueRadiusResidual
import Erdos9796Proof.P97.ATail.FiveCenterDeletionBoundary
import Erdos9796Proof.P97.ATail.KalmansonThreeEqualitySchemas
import Erdos9796Proof.P97.ATail.KalmansonRadiusOrderReversal
import Erdos9796Proof.P97.ATail.KalmansonSixteenEqualitySchema
import Erdos9796Proof.P97.ATail.LocalizedCollisionMutualOmissionCycle
import Erdos9796Proof.P97.ATail.PhysicalSecondApexSwap
import Erdos9796Proof.P97.ATail.RetainedMatchingCommonDeletionCycle
import Erdos9796Proof.P97.ATail.RetainedMatchingEndpointCollisionLocalization
import Erdos9796Proof.P97.ATail.RetainedMatchingEndpointContinuation
import Erdos9796Proof.P97.ATail.RetainedStrictInteriorPairSelector
import Erdos9796Proof.P97.ATail.SixPointEuclideanObstruction
import Erdos9796Proof.P97.ATail.SixPointSparseEuclideanObstruction
import Erdos9796Proof.P97.ATail.TwoCollisionGlobalProducer
import Erdos9796Proof.P97.ATail.TwoCenterCapLocalization
import Erdos9796Proof.P97.Census554.FivePointCircleIsoscelesOrderBridge
import Erdos9796Proof.P97.Census554.GeneralCarrierBridge
import Erdos9796Proof.P97.Census554.CapSelectedGeometry
import Erdos9796Proof.P97.CircumcenterSide
import Erdos9796Proof.P97.ConvexIndepHelpers
import Erdos9796Proof.P97.Moser.NonDeg
import Erdos9796Proof.P97.Phase3SharedPairSeparation
import Erdos9796Proof.P97.SameShellSuperadditivity
import Erdos9796Proof.P97.TwoCenterAcute
import Erdos9796Proof.P97.U1CarrierInjection
import Erdos9796Proof.P97.PinnedMultiplicity
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.JointDeletion.CardElevenBridge
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.JointDeletion.Constructors
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.JointDeletion.ExactFiveSplit
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.JointDeletion.PinnedMultiplicity
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.JointDeletion.Types
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.BlockerRelation
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.JointDeletion.ProvenanceCore
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.JointDeletion.CallerProvenance
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.JointDeletion.RoundTrip
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.JointDeletion.Producers
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.JointDeletion.CallerConstructors

/-!
# Joint-deletion core (re-export)

This module carries no declarations of its own.  Its content now lives in the
layered `JointDeletion` modules:

* `JointDeletion.Types` — the joint-deletion data structures, on a minimal cone;
* `JointDeletion.Constructors` — source-faithful packet constructors;
* `JointDeletion.ExactFiveSplit` — the finite exact-five classifications;
* `JointDeletion.PinnedMultiplicity` — pinned-multiplicity ingress/projections;
* `JointDeletion.CardElevenBridge` — the card-eleven certificate adapter.

It also re-exports the provenance and blocker layers — `BlockerRelation`,
`JointDeletion.ProvenanceCore`, `JointDeletion.CallerProvenance` and
`JointDeletion.RoundTrip` — so a consumer of this module reaches the
provenance-preserving core, its radius-mode and caller extensions, the
choice-free blocker relation, and the round-trip lemmas relating them to the
historical packet without adding imports of its own.

It also re-exports `JointDeletion.Producers` and
`JointDeletion.CallerConstructors`, so the same consumer reaches the readers
that build a provenance core from the live retained-matching geometry and the
constructors that pin the caller records to the ambient surplus-cap apexes.

The original import block is retained above so that every existing importer of
this module keeps the same transitive import closure and elaborates unchanged.
-/
