/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under GPL-3.0-or-later as described in the file LICENSE.
Authors: Adam McKenna
-/

import Definitions.Def_Erdos9796FiniteNine_N8Interface
import Definitions.Def_Erdos9796Counting_Adapter
import Definitions.Def_Erdos9796Counting_CGN_CGN
import Definitions.Def_Erdos9796Counting_CGN_CGN4g
import Definitions.Def_Erdos9796Counting_CGN_CGN6
import Definitions.Def_Erdos9796Counting_Cap_Partition
import Definitions.Def_Erdos9796Counting_Cap_PartitionFromMEC
import Definitions.Def_Erdos9796Counting_Cap_Structure
import Definitions.Def_Erdos9796Counting_CircumscribedMECPacket
import Definitions.Def_Erdos9796Counting_ConvexCyclicOrder_Construct
import Definitions.Def_Erdos9796Counting_Dumitrescu_L6
import Definitions.Def_Erdos9796Counting_Foundation
import Definitions.Def_Erdos9796Counting_IsoscelesCount
import Definitions.Def_Erdos9796Counting_MEC_ArcAngle
import Definitions.Def_Erdos9796Counting_MEC_Basic
import Definitions.Def_Erdos9796Counting_MEC_Boundary
import Definitions.Def_Erdos9796Counting_Moser_Triangle
import Definitions.Def_Erdos9796Counting_Moser_TriangleNonObtuse
import Definitions.Def_Erdos9796Counting_SignedAreaOangle
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Algebra.BigOperators.Group.Finset.Piecewise
import Mathlib.Algebra.BigOperators.Group.Finset.Sigma
import Mathlib.Algebra.BigOperators.Intervals
import Mathlib.Algebra.Group.Nat.Even
import Mathlib.Algebra.Order.BigOperators.Group.Finset
import Mathlib.Analysis.Convex.Between
import Mathlib.Analysis.Convex.Caratheodory
import Mathlib.Analysis.Convex.Combination
import Mathlib.Analysis.Convex.Extreme
import Mathlib.Analysis.Convex.Hull
import Mathlib.Analysis.Convex.Independent
import Mathlib.Analysis.Convex.Join
import Mathlib.Analysis.Convex.StrictConvexSpace
import Mathlib.Analysis.Convex.Topology
import Mathlib.Analysis.InnerProductSpace.Basic
import Mathlib.Analysis.InnerProductSpace.Orthonormal
import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.Analysis.InnerProductSpace.Projection.Minimal
import Mathlib.Analysis.InnerProductSpace.TwoDim
import Mathlib.Analysis.LocallyConvex.Separation
import Mathlib.Analysis.Normed.Affine.AddTorsorBases
import Mathlib.Analysis.SpecialFunctions.Trigonometric.Angle
import Mathlib.Data.Finset.Card
import Mathlib.Data.Finset.Filter
import Mathlib.Data.Finset.Powerset
import Mathlib.Data.Finset.SDiff
import Mathlib.Data.Finset.Sigma
import Mathlib.Data.Finset.Sort
import Mathlib.Data.Fintype.BigOperators
import Mathlib.Data.Nat.Choose.Basic
import Mathlib.Data.Real.Basic
import Mathlib.Geometry.Euclidean.Angle.Oriented.Basic
import Mathlib.Geometry.Euclidean.Angle.Oriented.RightAngle
import Mathlib.Geometry.Euclidean.Angle.Sphere
import Mathlib.Geometry.Euclidean.PerpBisector
import Mathlib.Geometry.Euclidean.Simplex
import Mathlib.Geometry.Euclidean.Sphere.Basic
import Mathlib.Geometry.Euclidean.Triangle
import Mathlib.LinearAlgebra.AffineSpace.FiniteDimensional
import Mathlib.Logic.Equiv.Fin.Rotate
import Mathlib.Order.Interval.Finset.Fin
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Mathlib.Topology.MetricSpace.ProperSpace
import Mathlib.Topology.Order.Lattice
import Theorems.Thm_Problem97_CGN_CGN4g_strictCapBlockData_of_supportCap_oriented
import Theorems.Thm_Problem97_CGN_CGN6b_nonacute_of_minorCapChainCoords
import Theorems.Thm_Problem97_CGN_CGN6norm_minorCapChainModel_of_mecCapPacket
import Theorems.Thm_Problem97_ConvexIndep_not_collinear_of_card_ge_three
import Theorems.Thm_Problem97_ConvexIndep_not_wbtw
import Theorems.Thm_Problem97_Dumitrescu_three_cap_decomposition
import Theorems.Thm_Problem97_MEC_exists_nonobtuse_circumscribed_triple
import Theorems.Thm_Problem97_MEC_no_diameter_under_k4
import Theorems.Thm_Problem97_MEC_not_collinear_of_three_dist_eq
import Theorems.Thm_Problem97_affineSpan_eq_top_of_not_collinear
import Theorems.Thm_Problem97_card_ge_five_of_K4
import Theorems.Thm_Problem97_center_same_side_as_apex_of_nonobtuse
import Theorems.Thm_Problem97_collinear_of_signedArea2_eq_zero
import Theorems.Thm_Problem97_exists_cut_sorted_enumeration_of_convexIndep
import Theorems.Thm_Problem97_inner_chord_eq_two_mul_inner_midpoint
import Theorems.Thm_Problem97_isCcwConvexPolygon_of_cut_sorted_arcAngle
import Theorems.Thm_Problem97_signedArea2_eq_zero_iff_collinear
import Theorems.Thm_Problem97_signedArea2_sign_eq_oangle_sign
import Theorems.Thm_Problem97_signedArea_prod_eq_inner_mul_dist_sq
import Theorems.Thm_Problem97_three_le_card_of_convexIndep_noncoll

/-
Source: mysticflounder/erdos-97-96-formalization, commit
a46894f6078319d3001d06310531df50af0f6bbd, Erdos9796Proof/P97.
Original mathematical proof credited to the upstream contributors.
This is a faithful Lean 4.33.1 compatibility port and source dependency slice.
Private helpers have distinct module prefixes to preserve separate-file scope.
The assembly generator and diagnostic elaborators are not part of this proof.
-/
/- Exact name exports to the genuine public constants; no intermediate values or nominal structures are introduced. -/
namespace Batch3N9
namespace Problem97.CGN
export _root_.Problem97.CGN (BoundaryCapBlock)
end Problem97.CGN
namespace Problem97.CGN.BoundaryCapBlock
export _root_.Problem97.CGN.BoundaryCapBlock (cap_image)
end Problem97.CGN.BoundaryCapBlock
namespace Problem97.CGN.BoundaryCapBlock
export _root_.Problem97.CGN.BoundaryCapBlock (cap_subset_A)
end Problem97.CGN.BoundaryCapBlock
namespace Problem97.CGN.BoundaryCapBlock
export _root_.Problem97.CGN.BoundaryCapBlock (casesOn)
end Problem97.CGN.BoundaryCapBlock
namespace Problem97.CGN.BoundaryCapBlock
export _root_.Problem97.CGN.BoundaryCapBlock (ctorIdx)
end Problem97.CGN.BoundaryCapBlock
namespace Problem97.CGN.BoundaryCapBlock
export _root_.Problem97.CGN.BoundaryCapBlock (hi)
end Problem97.CGN.BoundaryCapBlock
namespace Problem97.CGN.BoundaryCapBlock
export _root_.Problem97.CGN.BoundaryCapBlock (hlohi)
end Problem97.CGN.BoundaryCapBlock
namespace Problem97.CGN.BoundaryCapBlock
export _root_.Problem97.CGN.BoundaryCapBlock (hm)
end Problem97.CGN.BoundaryCapBlock
namespace Problem97.CGN.BoundaryCapBlock
export _root_.Problem97.CGN.BoundaryCapBlock (idx)
end Problem97.CGN.BoundaryCapBlock
namespace Problem97.CGN.BoundaryCapBlock
export _root_.Problem97.CGN.BoundaryCapBlock (idx_first)
end Problem97.CGN.BoundaryCapBlock
namespace Problem97.CGN.BoundaryCapBlock
export _root_.Problem97.CGN.BoundaryCapBlock (idx_last)
end Problem97.CGN.BoundaryCapBlock
namespace Problem97.CGN.BoundaryCapBlock
export _root_.Problem97.CGN.BoundaryCapBlock (idx_range_exact)
end Problem97.CGN.BoundaryCapBlock
namespace Problem97.CGN.BoundaryCapBlock
export _root_.Problem97.CGN.BoundaryCapBlock (idx_strict)
end Problem97.CGN.BoundaryCapBlock
namespace Problem97.CGN.BoundaryCapBlock
export _root_.Problem97.CGN.BoundaryCapBlock (lo)
end Problem97.CGN.BoundaryCapBlock
namespace Problem97.CGN.BoundaryCapBlock
export _root_.Problem97.CGN.BoundaryCapBlock (mk)
end Problem97.CGN.BoundaryCapBlock
namespace Problem97.CGN.BoundaryCapBlock.mk
export _root_.Problem97.CGN.BoundaryCapBlock.mk (inj)
end Problem97.CGN.BoundaryCapBlock.mk
namespace Problem97.CGN.BoundaryCapBlock.mk
export _root_.Problem97.CGN.BoundaryCapBlock.mk (injEq)
end Problem97.CGN.BoundaryCapBlock.mk
namespace Problem97.CGN.BoundaryCapBlock.mk
export _root_.Problem97.CGN.BoundaryCapBlock.mk (noConfusion)
end Problem97.CGN.BoundaryCapBlock.mk
namespace Problem97.CGN.BoundaryCapBlock.mk
export _root_.Problem97.CGN.BoundaryCapBlock.mk (sizeOf_spec)
end Problem97.CGN.BoundaryCapBlock.mk
namespace Problem97.CGN.BoundaryCapBlock
export _root_.Problem97.CGN.BoundaryCapBlock (noConfusion)
end Problem97.CGN.BoundaryCapBlock
namespace Problem97.CGN.BoundaryCapBlock
export _root_.Problem97.CGN.BoundaryCapBlock (noConfusionType)
end Problem97.CGN.BoundaryCapBlock
namespace Problem97.CGN.BoundaryCapBlock
export _root_.Problem97.CGN.BoundaryCapBlock (phi_image)
end Problem97.CGN.BoundaryCapBlock
namespace Problem97.CGN.BoundaryCapBlock
export _root_.Problem97.CGN.BoundaryCapBlock (points_eq)
end Problem97.CGN.BoundaryCapBlock
namespace Problem97.CGN.BoundaryCapBlock
export _root_.Problem97.CGN.BoundaryCapBlock (rec)
end Problem97.CGN.BoundaryCapBlock
namespace Problem97.CGN.BoundaryCapBlock
export _root_.Problem97.CGN.BoundaryCapBlock (recOn)
end Problem97.CGN.BoundaryCapBlock
namespace Problem97.CGN
export _root_.Problem97.CGN (CapIndexPairs)
end Problem97.CGN
namespace Problem97.CGN
export _root_.Problem97.CGN (HasCapWitness)
end Problem97.CGN
namespace Problem97.CGN
export _root_.Problem97.CGN (MecCapPacket)
end Problem97.CGN
namespace Problem97.CGN.MecCapPacket
export _root_.Problem97.CGN.MecCapPacket (casesOn)
end Problem97.CGN.MecCapPacket
namespace Problem97.CGN.MecCapPacket
export _root_.Problem97.CGN.MecCapPacket (center)
end Problem97.CGN.MecCapPacket
namespace Problem97.CGN.MecCapPacket
export _root_.Problem97.CGN.MecCapPacket (ctorIdx)
end Problem97.CGN.MecCapPacket
namespace Problem97.CGN.MecCapPacket
export _root_.Problem97.CGN.MecCapPacket (disk_mem)
end Problem97.CGN.MecCapPacket
namespace Problem97.CGN.MecCapPacket
export _root_.Problem97.CGN.MecCapPacket (first_on_circle)
end Problem97.CGN.MecCapPacket
namespace Problem97.CGN.MecCapPacket
export _root_.Problem97.CGN.MecCapPacket (hm)
end Problem97.CGN.MecCapPacket
namespace Problem97.CGN.MecCapPacket
export _root_.Problem97.CGN.MecCapPacket (last_on_circle)
end Problem97.CGN.MecCapPacket
namespace Problem97.CGN.MecCapPacket
export _root_.Problem97.CGN.MecCapPacket (mem_A)
end Problem97.CGN.MecCapPacket
namespace Problem97.CGN.MecCapPacket
export _root_.Problem97.CGN.MecCapPacket (mk)
end Problem97.CGN.MecCapPacket
namespace Problem97.CGN.MecCapPacket.mk
export _root_.Problem97.CGN.MecCapPacket.mk (inj)
end Problem97.CGN.MecCapPacket.mk
namespace Problem97.CGN.MecCapPacket.mk
export _root_.Problem97.CGN.MecCapPacket.mk (injEq)
end Problem97.CGN.MecCapPacket.mk
namespace Problem97.CGN.MecCapPacket.mk
export _root_.Problem97.CGN.MecCapPacket.mk (noConfusion)
end Problem97.CGN.MecCapPacket.mk
namespace Problem97.CGN.MecCapPacket.mk
export _root_.Problem97.CGN.MecCapPacket.mk (sizeOf_spec)
end Problem97.CGN.MecCapPacket.mk
namespace Problem97.CGN.MecCapPacket
export _root_.Problem97.CGN.MecCapPacket (noConfusion)
end Problem97.CGN.MecCapPacket
namespace Problem97.CGN.MecCapPacket
export _root_.Problem97.CGN.MecCapPacket (noConfusionType)
end Problem97.CGN.MecCapPacket
namespace Problem97.CGN.MecCapPacket
export _root_.Problem97.CGN.MecCapPacket (radius)
end Problem97.CGN.MecCapPacket
namespace Problem97.CGN.MecCapPacket
export _root_.Problem97.CGN.MecCapPacket (radius_nonneg)
end Problem97.CGN.MecCapPacket
namespace Problem97.CGN.MecCapPacket
export _root_.Problem97.CGN.MecCapPacket (rec)
end Problem97.CGN.MecCapPacket
namespace Problem97.CGN.MecCapPacket
export _root_.Problem97.CGN.MecCapPacket (recOn)
end Problem97.CGN.MecCapPacket
namespace Problem97.CGN
export _root_.Problem97.CGN (MinorCapChainCoords)
end Problem97.CGN
namespace Problem97.CGN.MinorCapChainCoords
export _root_.Problem97.CGN.MinorCapChainCoords (X)
end Problem97.CGN.MinorCapChainCoords
namespace Problem97.CGN.MinorCapChainCoords
export _root_.Problem97.CGN.MinorCapChainCoords (X_first)
end Problem97.CGN.MinorCapChainCoords
namespace Problem97.CGN.MinorCapChainCoords
export _root_.Problem97.CGN.MinorCapChainCoords (X_last)
end Problem97.CGN.MinorCapChainCoords
namespace Problem97.CGN.MinorCapChainCoords
export _root_.Problem97.CGN.MinorCapChainCoords (Y)
end Problem97.CGN.MinorCapChainCoords
namespace Problem97.CGN.MinorCapChainCoords
export _root_.Problem97.CGN.MinorCapChainCoords (Y_first)
end Problem97.CGN.MinorCapChainCoords
namespace Problem97.CGN.MinorCapChainCoords
export _root_.Problem97.CGN.MinorCapChainCoords (Y_last)
end Problem97.CGN.MinorCapChainCoords
namespace Problem97.CGN.MinorCapChainCoords
export _root_.Problem97.CGN.MinorCapChainCoords (adjacent_slopes_decreasing)
end Problem97.CGN.MinorCapChainCoords
namespace Problem97.CGN.MinorCapChainCoords
export _root_.Problem97.CGN.MinorCapChainCoords (casesOn)
end Problem97.CGN.MinorCapChainCoords
namespace Problem97.CGN.MinorCapChainCoords
export _root_.Problem97.CGN.MinorCapChainCoords (ctorIdx)
end Problem97.CGN.MinorCapChainCoords
namespace Problem97.CGN.MinorCapChainCoords
export _root_.Problem97.CGN.MinorCapChainCoords (hm)
end Problem97.CGN.MinorCapChainCoords
namespace Problem97.CGN.MinorCapChainCoords
export _root_.Problem97.CGN.MinorCapChainCoords (mk)
end Problem97.CGN.MinorCapChainCoords
namespace Problem97.CGN.MinorCapChainCoords.mk
export _root_.Problem97.CGN.MinorCapChainCoords.mk (inj)
end Problem97.CGN.MinorCapChainCoords.mk
namespace Problem97.CGN.MinorCapChainCoords.mk
export _root_.Problem97.CGN.MinorCapChainCoords.mk (injEq)
end Problem97.CGN.MinorCapChainCoords.mk
namespace Problem97.CGN.MinorCapChainCoords.mk
export _root_.Problem97.CGN.MinorCapChainCoords.mk (noConfusion)
end Problem97.CGN.MinorCapChainCoords.mk
namespace Problem97.CGN.MinorCapChainCoords.mk
export _root_.Problem97.CGN.MinorCapChainCoords.mk (sizeOf_spec)
end Problem97.CGN.MinorCapChainCoords.mk
namespace Problem97.CGN.MinorCapChainCoords
export _root_.Problem97.CGN.MinorCapChainCoords (noConfusion)
end Problem97.CGN.MinorCapChainCoords
namespace Problem97.CGN.MinorCapChainCoords
export _root_.Problem97.CGN.MinorCapChainCoords (noConfusionType)
end Problem97.CGN.MinorCapChainCoords
namespace Problem97.CGN.MinorCapChainCoords
export _root_.Problem97.CGN.MinorCapChainCoords (rec)
end Problem97.CGN.MinorCapChainCoords
namespace Problem97.CGN.MinorCapChainCoords
export _root_.Problem97.CGN.MinorCapChainCoords (recOn)
end Problem97.CGN.MinorCapChainCoords
namespace Problem97.CGN.MinorCapChainCoords
export _root_.Problem97.CGN.MinorCapChainCoords (unit_disk)
end Problem97.CGN.MinorCapChainCoords
namespace Problem97.CGN.MinorCapChainCoords
export _root_.Problem97.CGN.MinorCapChainCoords (x_strict)
end Problem97.CGN.MinorCapChainCoords
namespace Problem97.CGN.MinorCapChainCoords
export _root_.Problem97.CGN.MinorCapChainCoords (y_nonneg)
end Problem97.CGN.MinorCapChainCoords
namespace Problem97.CGN
export _root_.Problem97.CGN (MinorCapChainModel)
end Problem97.CGN
namespace Problem97.CGN.MinorCapChainModel
export _root_.Problem97.CGN.MinorCapChainModel (casesOn)
end Problem97.CGN.MinorCapChainModel
namespace Problem97.CGN.MinorCapChainModel
export _root_.Problem97.CGN.MinorCapChainModel (coords)
end Problem97.CGN.MinorCapChainModel
namespace Problem97.CGN.MinorCapChainModel
export _root_.Problem97.CGN.MinorCapChainModel (ctorIdx)
end Problem97.CGN.MinorCapChainModel
namespace Problem97.CGN.MinorCapChainModel
export _root_.Problem97.CGN.MinorCapChainModel (mk)
end Problem97.CGN.MinorCapChainModel
namespace Problem97.CGN.MinorCapChainModel.mk
export _root_.Problem97.CGN.MinorCapChainModel.mk (inj)
end Problem97.CGN.MinorCapChainModel.mk
namespace Problem97.CGN.MinorCapChainModel.mk
export _root_.Problem97.CGN.MinorCapChainModel.mk (injEq)
end Problem97.CGN.MinorCapChainModel.mk
namespace Problem97.CGN.MinorCapChainModel.mk
export _root_.Problem97.CGN.MinorCapChainModel.mk (noConfusion)
end Problem97.CGN.MinorCapChainModel.mk
namespace Problem97.CGN.MinorCapChainModel.mk
export _root_.Problem97.CGN.MinorCapChainModel.mk (sizeOf_spec)
end Problem97.CGN.MinorCapChainModel.mk
namespace Problem97.CGN.MinorCapChainModel
export _root_.Problem97.CGN.MinorCapChainModel (noConfusion)
end Problem97.CGN.MinorCapChainModel
namespace Problem97.CGN.MinorCapChainModel
export _root_.Problem97.CGN.MinorCapChainModel (noConfusionType)
end Problem97.CGN.MinorCapChainModel
namespace Problem97.CGN.MinorCapChainModel
export _root_.Problem97.CGN.MinorCapChainModel (points_eq)
end Problem97.CGN.MinorCapChainModel
namespace Problem97.CGN.MinorCapChainModel
export _root_.Problem97.CGN.MinorCapChainModel (rec)
end Problem97.CGN.MinorCapChainModel
namespace Problem97.CGN.MinorCapChainModel
export _root_.Problem97.CGN.MinorCapChainModel (recOn)
end Problem97.CGN.MinorCapChainModel
namespace Problem97.CGN
export _root_.Problem97.CGN (MinorCapSideHypotheses)
end Problem97.CGN
namespace Problem97.CGN.MinorCapSideHypotheses
export _root_.Problem97.CGN.MinorCapSideHypotheses (cap_side_nonneg)
end Problem97.CGN.MinorCapSideHypotheses
namespace Problem97.CGN.MinorCapSideHypotheses
export _root_.Problem97.CGN.MinorCapSideHypotheses (casesOn)
end Problem97.CGN.MinorCapSideHypotheses
namespace Problem97.CGN.MinorCapSideHypotheses
export _root_.Problem97.CGN.MinorCapSideHypotheses (center_side_nonpos)
end Problem97.CGN.MinorCapSideHypotheses
namespace Problem97.CGN.MinorCapSideHypotheses
export _root_.Problem97.CGN.MinorCapSideHypotheses (mk)
end Problem97.CGN.MinorCapSideHypotheses
namespace Problem97.CGN.MinorCapSideHypotheses
export _root_.Problem97.CGN.MinorCapSideHypotheses (rec)
end Problem97.CGN.MinorCapSideHypotheses
namespace Problem97.CGN.MinorCapSideHypotheses
export _root_.Problem97.CGN.MinorCapSideHypotheses (recOn)
end Problem97.CGN.MinorCapSideHypotheses
namespace Problem97.CGN
export _root_.Problem97.CGN (NoCapWitness)
end Problem97.CGN
namespace Problem97.CGN
export _root_.Problem97.CGN (OrderedCap)
end Problem97.CGN
namespace Problem97.CGN.OrderedCap
export _root_.Problem97.CGN.OrderedCap (casesOn)
end Problem97.CGN.OrderedCap
namespace Problem97.CGN.OrderedCap
export _root_.Problem97.CGN.OrderedCap (ctorIdx)
end Problem97.CGN.OrderedCap
namespace Problem97.CGN.OrderedCap
export _root_.Problem97.CGN.OrderedCap (injective)
end Problem97.CGN.OrderedCap
namespace Problem97.CGN.OrderedCap
export _root_.Problem97.CGN.OrderedCap (map)
end Problem97.CGN.OrderedCap
namespace Problem97.CGN.OrderedCap
export _root_.Problem97.CGN.OrderedCap (mk)
end Problem97.CGN.OrderedCap
namespace Problem97.CGN.OrderedCap.mk
export _root_.Problem97.CGN.OrderedCap.mk (inj)
end Problem97.CGN.OrderedCap.mk
namespace Problem97.CGN.OrderedCap.mk
export _root_.Problem97.CGN.OrderedCap.mk (injEq)
end Problem97.CGN.OrderedCap.mk
namespace Problem97.CGN.OrderedCap.mk
export _root_.Problem97.CGN.OrderedCap.mk (noConfusion)
end Problem97.CGN.OrderedCap.mk
namespace Problem97.CGN.OrderedCap.mk
export _root_.Problem97.CGN.OrderedCap.mk (sizeOf_spec)
end Problem97.CGN.OrderedCap.mk
namespace Problem97.CGN.OrderedCap
export _root_.Problem97.CGN.OrderedCap (noConfusion)
end Problem97.CGN.OrderedCap
namespace Problem97.CGN.OrderedCap
export _root_.Problem97.CGN.OrderedCap (noConfusionType)
end Problem97.CGN.OrderedCap
namespace Problem97.CGN.OrderedCap
export _root_.Problem97.CGN.OrderedCap (points)
end Problem97.CGN.OrderedCap
namespace Problem97.CGN.OrderedCap
export _root_.Problem97.CGN.OrderedCap (rec)
end Problem97.CGN.OrderedCap
namespace Problem97.CGN.OrderedCap
export _root_.Problem97.CGN.OrderedCap (recOn)
end Problem97.CGN.OrderedCap
namespace Problem97.CGN
export _root_.Problem97.CGN (SimilarityTransportData)
end Problem97.CGN
namespace Problem97.CGN.SimilarityTransportData
export _root_.Problem97.CGN.SimilarityTransportData (casesOn)
end Problem97.CGN.SimilarityTransportData
namespace Problem97.CGN.SimilarityTransportData
export _root_.Problem97.CGN.SimilarityTransportData (convexHull_mem_iff)
end Problem97.CGN.SimilarityTransportData
namespace Problem97.CGN.SimilarityTransportData
export _root_.Problem97.CGN.SimilarityTransportData (ctorIdx)
end Problem97.CGN.SimilarityTransportData
namespace Problem97.CGN.SimilarityTransportData
export _root_.Problem97.CGN.SimilarityTransportData (dist_eq_iff)
end Problem97.CGN.SimilarityTransportData
namespace Problem97.CGN.SimilarityTransportData
export _root_.Problem97.CGN.SimilarityTransportData (dist_image)
end Problem97.CGN.SimilarityTransportData
namespace Problem97.CGN.SimilarityTransportData
export _root_.Problem97.CGN.SimilarityTransportData (halfplane_sign)
end Problem97.CGN.SimilarityTransportData
namespace Problem97.CGN.SimilarityTransportData
export _root_.Problem97.CGN.SimilarityTransportData (mk)
end Problem97.CGN.SimilarityTransportData
namespace Problem97.CGN.SimilarityTransportData.mk
export _root_.Problem97.CGN.SimilarityTransportData.mk (inj)
end Problem97.CGN.SimilarityTransportData.mk
namespace Problem97.CGN.SimilarityTransportData.mk
export _root_.Problem97.CGN.SimilarityTransportData.mk (injEq)
end Problem97.CGN.SimilarityTransportData.mk
namespace Problem97.CGN.SimilarityTransportData.mk
export _root_.Problem97.CGN.SimilarityTransportData.mk (noConfusion)
end Problem97.CGN.SimilarityTransportData.mk
namespace Problem97.CGN.SimilarityTransportData.mk
export _root_.Problem97.CGN.SimilarityTransportData.mk (sizeOf_spec)
end Problem97.CGN.SimilarityTransportData.mk
namespace Problem97.CGN.SimilarityTransportData
export _root_.Problem97.CGN.SimilarityTransportData (noConfusion)
end Problem97.CGN.SimilarityTransportData
namespace Problem97.CGN.SimilarityTransportData
export _root_.Problem97.CGN.SimilarityTransportData (noConfusionType)
end Problem97.CGN.SimilarityTransportData
namespace Problem97.CGN.SimilarityTransportData
export _root_.Problem97.CGN.SimilarityTransportData (orientation)
end Problem97.CGN.SimilarityTransportData
namespace Problem97.CGN.SimilarityTransportData
export _root_.Problem97.CGN.SimilarityTransportData (orientation_sq)
end Problem97.CGN.SimilarityTransportData
namespace Problem97.CGN.SimilarityTransportData
export _root_.Problem97.CGN.SimilarityTransportData (rec)
end Problem97.CGN.SimilarityTransportData
namespace Problem97.CGN.SimilarityTransportData
export _root_.Problem97.CGN.SimilarityTransportData (recOn)
end Problem97.CGN.SimilarityTransportData
namespace Problem97.CGN.SimilarityTransportData
export _root_.Problem97.CGN.SimilarityTransportData (scale)
end Problem97.CGN.SimilarityTransportData
namespace Problem97.CGN.SimilarityTransportData
export _root_.Problem97.CGN.SimilarityTransportData (scale_pos)
end Problem97.CGN.SimilarityTransportData
namespace Problem97.CGN
export _root_.Problem97.CGN (StrictCapBlockData)
end Problem97.CGN
namespace Problem97.CGN.StrictCapBlockData
export _root_.Problem97.CGN.StrictCapBlockData (Block)
end Problem97.CGN.StrictCapBlockData
namespace Problem97.CGN.StrictCapBlockData
export _root_.Problem97.CGN.StrictCapBlockData (Hord)
end Problem97.CGN.StrictCapBlockData
namespace Problem97.CGN.StrictCapBlockData
export _root_.Problem97.CGN.StrictCapBlockData (Hside)
end Problem97.CGN.StrictCapBlockData
namespace Problem97.CGN.StrictCapBlockData
export _root_.Problem97.CGN.StrictCapBlockData (L)
end Problem97.CGN.StrictCapBlockData
namespace Problem97.CGN.StrictCapBlockData
export _root_.Problem97.CGN.StrictCapBlockData (Packet)
end Problem97.CGN.StrictCapBlockData
namespace Problem97.CGN.StrictCapBlockData
export _root_.Problem97.CGN.StrictCapBlockData (casesOn)
end Problem97.CGN.StrictCapBlockData
namespace Problem97.CGN.StrictCapBlockData
export _root_.Problem97.CGN.StrictCapBlockData (ctorIdx)
end Problem97.CGN.StrictCapBlockData
namespace Problem97.CGN.StrictCapBlockData
export _root_.Problem97.CGN.StrictCapBlockData (m)
end Problem97.CGN.StrictCapBlockData
namespace Problem97.CGN.StrictCapBlockData
export _root_.Problem97.CGN.StrictCapBlockData (mk)
end Problem97.CGN.StrictCapBlockData
namespace Problem97.CGN.StrictCapBlockData.mk
export _root_.Problem97.CGN.StrictCapBlockData.mk (inj)
end Problem97.CGN.StrictCapBlockData.mk
namespace Problem97.CGN.StrictCapBlockData.mk
export _root_.Problem97.CGN.StrictCapBlockData.mk (injEq)
end Problem97.CGN.StrictCapBlockData.mk
namespace Problem97.CGN.StrictCapBlockData.mk
export _root_.Problem97.CGN.StrictCapBlockData.mk (noConfusion)
end Problem97.CGN.StrictCapBlockData.mk
namespace Problem97.CGN.StrictCapBlockData.mk
export _root_.Problem97.CGN.StrictCapBlockData.mk (sizeOf_spec)
end Problem97.CGN.StrictCapBlockData.mk
namespace Problem97.CGN.StrictCapBlockData
export _root_.Problem97.CGN.StrictCapBlockData (n)
end Problem97.CGN.StrictCapBlockData
namespace Problem97.CGN.StrictCapBlockData
export _root_.Problem97.CGN.StrictCapBlockData (noConfusion)
end Problem97.CGN.StrictCapBlockData
namespace Problem97.CGN.StrictCapBlockData
export _root_.Problem97.CGN.StrictCapBlockData (noConfusionType)
end Problem97.CGN.StrictCapBlockData
namespace Problem97.CGN.StrictCapBlockData
export _root_.Problem97.CGN.StrictCapBlockData (phi)
end Problem97.CGN.StrictCapBlockData
namespace Problem97.CGN.StrictCapBlockData
export _root_.Problem97.CGN.StrictCapBlockData (phi_ccw)
end Problem97.CGN.StrictCapBlockData
namespace Problem97.CGN.StrictCapBlockData
export _root_.Problem97.CGN.StrictCapBlockData (phi_injective)
end Problem97.CGN.StrictCapBlockData
namespace Problem97.CGN.StrictCapBlockData
export _root_.Problem97.CGN.StrictCapBlockData (rec)
end Problem97.CGN.StrictCapBlockData
namespace Problem97.CGN.StrictCapBlockData
export _root_.Problem97.CGN.StrictCapBlockData (recOn)
end Problem97.CGN.StrictCapBlockData
namespace Problem97.CGN
export _root_.Problem97.CGN (StrictCapOrder)
end Problem97.CGN
namespace Problem97.CGN.StrictCapOrder
export _root_.Problem97.CGN.StrictCapOrder (casesOn)
end Problem97.CGN.StrictCapOrder
namespace Problem97.CGN.StrictCapOrder
export _root_.Problem97.CGN.StrictCapOrder (chord_projection_strict)
end Problem97.CGN.StrictCapOrder
namespace Problem97.CGN.StrictCapOrder
export _root_.Problem97.CGN.StrictCapOrder (consecutive_turn_nonpos)
end Problem97.CGN.StrictCapOrder
namespace Problem97.CGN.StrictCapOrder
export _root_.Problem97.CGN.StrictCapOrder (hm)
end Problem97.CGN.StrictCapOrder
namespace Problem97.CGN.StrictCapOrder
export _root_.Problem97.CGN.StrictCapOrder (mk)
end Problem97.CGN.StrictCapOrder
namespace Problem97.CGN.StrictCapOrder
export _root_.Problem97.CGN.StrictCapOrder (rec)
end Problem97.CGN.StrictCapOrder
namespace Problem97.CGN.StrictCapOrder
export _root_.Problem97.CGN.StrictCapOrder (recOn)
end Problem97.CGN.StrictCapOrder
namespace Problem97.CGN.StrictCapOrder
export _root_.Problem97.CGN.StrictCapOrder (subchord_open_side_iff_A)
end Problem97.CGN.StrictCapOrder
namespace Problem97.CGN
export _root_.Problem97.CGN (WitnessedPairsAt)
end Problem97.CGN
namespace Problem97.CGN
export _root_.Problem97.CGN (WitnessesCapEdgeAt)
end Problem97.CGN
namespace Problem97.CGN
export _root_.Problem97.CGN (adjSlopeNat)
end Problem97.CGN
namespace Problem97.CGN
export _root_.Problem97.CGN (adjacentSlope)
end Problem97.CGN
namespace Problem97.CGN
export _root_.Problem97.CGN (chordFrame)
end Problem97.CGN
namespace Problem97.CGN
export _root_.Problem97.CGN (edgeAt)
end Problem97.CGN
namespace Problem97.CGN
export _root_.Problem97.CGN (finIndex)
end Problem97.CGN
namespace Problem97.CGN
export _root_.Problem97.CGN (firstIndex)
end Problem97.CGN
namespace Problem97.CGN
export _root_.Problem97.CGN (lastIndex)
end Problem97.CGN
namespace Problem97.CGN
export _root_.Problem97.CGN (nextAdjacentSlope)
end Problem97.CGN
namespace Problem97.CGN
export _root_.Problem97.CGN (point)
end Problem97.CGN
namespace Problem97.CGN
export _root_.Problem97.CGN (slopeAt)
end Problem97.CGN
namespace Problem97.CGN
export _root_.Problem97.CGN (vec2)
end Problem97.CGN
namespace Problem97.CGN
export _root_.Problem97.CGN (xCoord)
end Problem97.CGN
namespace Problem97.CGN
export _root_.Problem97.CGN (yCoord)
end Problem97.CGN
namespace Problem97
export _root_.Problem97 (CapPartition)
end Problem97
namespace Problem97.CapPartition
export _root_.Problem97.CapPartition (C1)
end Problem97.CapPartition
namespace Problem97.CapPartition
export _root_.Problem97.CapPartition (C1_sub)
end Problem97.CapPartition
namespace Problem97.CapPartition
export _root_.Problem97.CapPartition (C2)
end Problem97.CapPartition
namespace Problem97.CapPartition
export _root_.Problem97.CapPartition (C2_sub)
end Problem97.CapPartition
namespace Problem97.CapPartition
export _root_.Problem97.CapPartition (C3)
end Problem97.CapPartition
namespace Problem97.CapPartition
export _root_.Problem97.CapPartition (C3_sub)
end Problem97.CapPartition
namespace Problem97.CapPartition
export _root_.Problem97.CapPartition (M_card)
end Problem97.CapPartition
namespace Problem97.CapPartition
export _root_.Problem97.CapPartition (M_sub)
end Problem97.CapPartition
namespace Problem97.CapPartition
export _root_.Problem97.CapPartition (casesOn)
end Problem97.CapPartition
namespace Problem97.CapPartition
export _root_.Problem97.CapPartition (ctorIdx)
end Problem97.CapPartition
namespace Problem97.CapPartition
export _root_.Problem97.CapPartition (mk)
end Problem97.CapPartition
namespace Problem97.CapPartition.mk
export _root_.Problem97.CapPartition.mk (inj)
end Problem97.CapPartition.mk
namespace Problem97.CapPartition.mk
export _root_.Problem97.CapPartition.mk (injEq)
end Problem97.CapPartition.mk
namespace Problem97.CapPartition.mk
export _root_.Problem97.CapPartition.mk (noConfusion)
end Problem97.CapPartition.mk
namespace Problem97.CapPartition.mk
export _root_.Problem97.CapPartition.mk (sizeOf_spec)
end Problem97.CapPartition.mk
namespace Problem97.CapPartition
export _root_.Problem97.CapPartition (moser_in_two)
end Problem97.CapPartition
namespace Problem97.CapPartition
export _root_.Problem97.CapPartition (noConfusion)
end Problem97.CapPartition
namespace Problem97.CapPartition
export _root_.Problem97.CapPartition (noConfusionType)
end Problem97.CapPartition
namespace Problem97.CapPartition
export _root_.Problem97.CapPartition (nonmoser_in_one)
end Problem97.CapPartition
namespace Problem97.CapPartition
export _root_.Problem97.CapPartition (rec)
end Problem97.CapPartition
namespace Problem97.CapPartition
export _root_.Problem97.CapPartition (recOn)
end Problem97.CapPartition
namespace Problem97
export _root_.Problem97 (CapTriple)
end Problem97
namespace Problem97.CapTriple
export _root_.Problem97.CapTriple (C1)
end Problem97.CapTriple
namespace Problem97.CapTriple
export _root_.Problem97.CapTriple (C1_subset)
end Problem97.CapTriple
namespace Problem97.CapTriple
export _root_.Problem97.CapTriple (C2)
end Problem97.CapTriple
namespace Problem97.CapTriple
export _root_.Problem97.CapTriple (C2_subset)
end Problem97.CapTriple
namespace Problem97.CapTriple
export _root_.Problem97.CapTriple (C3)
end Problem97.CapTriple
namespace Problem97.CapTriple
export _root_.Problem97.CapTriple (C3_subset)
end Problem97.CapTriple
namespace Problem97.CapTriple
export _root_.Problem97.CapTriple (arc_membership)
end Problem97.CapTriple
namespace Problem97.CapTriple
export _root_.Problem97.CapTriple (casesOn)
end Problem97.CapTriple
namespace Problem97.CapTriple
export _root_.Problem97.CapTriple (ctorIdx)
end Problem97.CapTriple
namespace Problem97.CapTriple
export _root_.Problem97.CapTriple (mk)
end Problem97.CapTriple
namespace Problem97.CapTriple.mk
export _root_.Problem97.CapTriple.mk (inj)
end Problem97.CapTriple.mk
namespace Problem97.CapTriple.mk
export _root_.Problem97.CapTriple.mk (injEq)
end Problem97.CapTriple.mk
namespace Problem97.CapTriple.mk
export _root_.Problem97.CapTriple.mk (noConfusion)
end Problem97.CapTriple.mk
namespace Problem97.CapTriple.mk
export _root_.Problem97.CapTriple.mk (sizeOf_spec)
end Problem97.CapTriple.mk
namespace Problem97.CapTriple
export _root_.Problem97.CapTriple (moser_in_two)
end Problem97.CapTriple
namespace Problem97.CapTriple
export _root_.Problem97.CapTriple (noConfusion)
end Problem97.CapTriple
namespace Problem97.CapTriple
export _root_.Problem97.CapTriple (noConfusionType)
end Problem97.CapTriple
namespace Problem97.CapTriple
export _root_.Problem97.CapTriple (nonmoser_in_one)
end Problem97.CapTriple
namespace Problem97.CapTriple
export _root_.Problem97.CapTriple (rec)
end Problem97.CapTriple
namespace Problem97.CapTriple
export _root_.Problem97.CapTriple (recOn)
end Problem97.CapTriple
namespace Problem97.CapTriple
export _root_.Problem97.CapTriple (toCapPartition)
end Problem97.CapTriple
namespace Problem97.CapTriple
export _root_.Problem97.CapTriple (v1_mem_C2)
end Problem97.CapTriple
namespace Problem97.CapTriple
export _root_.Problem97.CapTriple (v1_mem_C3)
end Problem97.CapTriple
namespace Problem97.CapTriple
export _root_.Problem97.CapTriple (v1_notin_C1)
end Problem97.CapTriple
namespace Problem97.CapTriple
export _root_.Problem97.CapTriple (v2_mem_C1)
end Problem97.CapTriple
namespace Problem97.CapTriple
export _root_.Problem97.CapTriple (v2_mem_C3)
end Problem97.CapTriple
namespace Problem97.CapTriple
export _root_.Problem97.CapTriple (v2_notin_C2)
end Problem97.CapTriple
namespace Problem97.CapTriple
export _root_.Problem97.CapTriple (v3_mem_C1)
end Problem97.CapTriple
namespace Problem97.CapTriple
export _root_.Problem97.CapTriple (v3_mem_C2)
end Problem97.CapTriple
namespace Problem97.CapTriple
export _root_.Problem97.CapTriple (v3_notin_C3)
end Problem97.CapTriple
namespace Problem97
export _root_.Problem97 (CircumscribedMECPacket)
end Problem97
namespace Problem97.CircumscribedMECPacket
export _root_.Problem97.CircumscribedMECPacket (casesOn)
end Problem97.CircumscribedMECPacket
namespace Problem97.CircumscribedMECPacket
export _root_.Problem97.CircumscribedMECPacket (center)
end Problem97.CircumscribedMECPacket
namespace Problem97.CircumscribedMECPacket
export _root_.Problem97.CircumscribedMECPacket (ctorIdx)
end Problem97.CircumscribedMECPacket
namespace Problem97.CircumscribedMECPacket
export _root_.Problem97.CircumscribedMECPacket (disk_contains_A)
end Problem97.CircumscribedMECPacket
namespace Problem97.CircumscribedMECPacket
export _root_.Problem97.CircumscribedMECPacket (inner_at_v1)
end Problem97.CircumscribedMECPacket
namespace Problem97.CircumscribedMECPacket
export _root_.Problem97.CircumscribedMECPacket (inner_at_v2)
end Problem97.CircumscribedMECPacket
namespace Problem97.CircumscribedMECPacket
export _root_.Problem97.CircumscribedMECPacket (inner_at_v3)
end Problem97.CircumscribedMECPacket
namespace Problem97.CircumscribedMECPacket
export _root_.Problem97.CircumscribedMECPacket (mk)
end Problem97.CircumscribedMECPacket
namespace Problem97.CircumscribedMECPacket.mk
export _root_.Problem97.CircumscribedMECPacket.mk (inj)
end Problem97.CircumscribedMECPacket.mk
namespace Problem97.CircumscribedMECPacket.mk
export _root_.Problem97.CircumscribedMECPacket.mk (injEq)
end Problem97.CircumscribedMECPacket.mk
namespace Problem97.CircumscribedMECPacket.mk
export _root_.Problem97.CircumscribedMECPacket.mk (noConfusion)
end Problem97.CircumscribedMECPacket.mk
namespace Problem97.CircumscribedMECPacket.mk
export _root_.Problem97.CircumscribedMECPacket.mk (sizeOf_spec)
end Problem97.CircumscribedMECPacket.mk
namespace Problem97.CircumscribedMECPacket
export _root_.Problem97.CircumscribedMECPacket (moser_on_boundary_1)
end Problem97.CircumscribedMECPacket
namespace Problem97.CircumscribedMECPacket
export _root_.Problem97.CircumscribedMECPacket (moser_on_boundary_2)
end Problem97.CircumscribedMECPacket
namespace Problem97.CircumscribedMECPacket
export _root_.Problem97.CircumscribedMECPacket (moser_on_boundary_3)
end Problem97.CircumscribedMECPacket
namespace Problem97.CircumscribedMECPacket
export _root_.Problem97.CircumscribedMECPacket (noConfusion)
end Problem97.CircumscribedMECPacket
namespace Problem97.CircumscribedMECPacket
export _root_.Problem97.CircumscribedMECPacket (noConfusionType)
end Problem97.CircumscribedMECPacket
namespace Problem97.CircumscribedMECPacket
export _root_.Problem97.CircumscribedMECPacket (ofNonObtuse)
end Problem97.CircumscribedMECPacket
namespace Problem97.CircumscribedMECPacket
export _root_.Problem97.CircumscribedMECPacket (radius)
end Problem97.CircumscribedMECPacket
namespace Problem97.CircumscribedMECPacket
export _root_.Problem97.CircumscribedMECPacket (radius_pos)
end Problem97.CircumscribedMECPacket
namespace Problem97.CircumscribedMECPacket
export _root_.Problem97.CircumscribedMECPacket (rec)
end Problem97.CircumscribedMECPacket
namespace Problem97.CircumscribedMECPacket
export _root_.Problem97.CircumscribedMECPacket (recOn)
end Problem97.CircumscribedMECPacket
namespace Problem97
export _root_.Problem97 (ConvexIndep)
end Problem97
namespace Problem97.Dumitrescu
export _root_.Problem97.Dumitrescu (capPairApexes)
end Problem97.Dumitrescu
namespace Problem97
export _root_.Problem97 (IsoscelesPairsAt)
end Problem97
namespace Problem97.MEC
export _root_.Problem97.MEC (MoserTriangle)
end Problem97.MEC
namespace Problem97.MEC.MoserTriangle
export _root_.Problem97.MEC.MoserTriangle (case_split)
end Problem97.MEC.MoserTriangle
namespace Problem97.MEC.MoserTriangle
export _root_.Problem97.MEC.MoserTriangle (casesOn)
end Problem97.MEC.MoserTriangle
namespace Problem97.MEC.MoserTriangle
export _root_.Problem97.MEC.MoserTriangle (ctorIdx)
end Problem97.MEC.MoserTriangle
namespace Problem97.MEC.MoserTriangle
export _root_.Problem97.MEC.MoserTriangle (mk)
end Problem97.MEC.MoserTriangle
namespace Problem97.MEC.MoserTriangle.mk
export _root_.Problem97.MEC.MoserTriangle.mk (inj)
end Problem97.MEC.MoserTriangle.mk
namespace Problem97.MEC.MoserTriangle.mk
export _root_.Problem97.MEC.MoserTriangle.mk (injEq)
end Problem97.MEC.MoserTriangle.mk
namespace Problem97.MEC.MoserTriangle.mk
export _root_.Problem97.MEC.MoserTriangle.mk (noConfusion)
end Problem97.MEC.MoserTriangle.mk
namespace Problem97.MEC.MoserTriangle.mk
export _root_.Problem97.MEC.MoserTriangle.mk (sizeOf_spec)
end Problem97.MEC.MoserTriangle.mk
namespace Problem97.MEC.MoserTriangle
export _root_.Problem97.MEC.MoserTriangle (noConfusion)
end Problem97.MEC.MoserTriangle
namespace Problem97.MEC.MoserTriangle
export _root_.Problem97.MEC.MoserTriangle (noConfusionType)
end Problem97.MEC.MoserTriangle
namespace Problem97.MEC.MoserTriangle
export _root_.Problem97.MEC.MoserTriangle (rec)
end Problem97.MEC.MoserTriangle
namespace Problem97.MEC.MoserTriangle
export _root_.Problem97.MEC.MoserTriangle (recOn)
end Problem97.MEC.MoserTriangle
namespace Problem97.MEC.MoserTriangle
export _root_.Problem97.MEC.MoserTriangle (toStructural)
end Problem97.MEC.MoserTriangle
namespace Problem97.MEC.MoserTriangle
export _root_.Problem97.MEC.MoserTriangle (v1)
end Problem97.MEC.MoserTriangle
namespace Problem97.MEC.MoserTriangle
export _root_.Problem97.MEC.MoserTriangle (v1_boundary)
end Problem97.MEC.MoserTriangle
namespace Problem97.MEC.MoserTriangle
export _root_.Problem97.MEC.MoserTriangle (v1_mem)
end Problem97.MEC.MoserTriangle
namespace Problem97.MEC.MoserTriangle
export _root_.Problem97.MEC.MoserTriangle (v2)
end Problem97.MEC.MoserTriangle
namespace Problem97.MEC.MoserTriangle
export _root_.Problem97.MEC.MoserTriangle (v2_boundary)
end Problem97.MEC.MoserTriangle
namespace Problem97.MEC.MoserTriangle
export _root_.Problem97.MEC.MoserTriangle (v2_mem)
end Problem97.MEC.MoserTriangle
namespace Problem97.MEC.MoserTriangle
export _root_.Problem97.MEC.MoserTriangle (v3)
end Problem97.MEC.MoserTriangle
namespace Problem97.MEC.MoserTriangle
export _root_.Problem97.MEC.MoserTriangle (v3_boundary)
end Problem97.MEC.MoserTriangle
namespace Problem97.MEC.MoserTriangle
export _root_.Problem97.MEC.MoserTriangle (v3_mem)
end Problem97.MEC.MoserTriangle
namespace Problem97.MEC
export _root_.Problem97.MEC (NonObtuseCircumscribedMoserTriangle)
end Problem97.MEC
namespace Problem97.MEC.NonObtuseCircumscribedMoserTriangle
export _root_.Problem97.MEC.NonObtuseCircumscribedMoserTriangle (casesOn)
end Problem97.MEC.NonObtuseCircumscribedMoserTriangle
namespace Problem97.MEC.NonObtuseCircumscribedMoserTriangle
export _root_.Problem97.MEC.NonObtuseCircumscribedMoserTriangle (ctorIdx)
end Problem97.MEC.NonObtuseCircumscribedMoserTriangle
namespace Problem97.MEC.NonObtuseCircumscribedMoserTriangle
export _root_.Problem97.MEC.NonObtuseCircumscribedMoserTriangle (inner_at_v1)
end Problem97.MEC.NonObtuseCircumscribedMoserTriangle
namespace Problem97.MEC.NonObtuseCircumscribedMoserTriangle
export _root_.Problem97.MEC.NonObtuseCircumscribedMoserTriangle (inner_at_v2)
end Problem97.MEC.NonObtuseCircumscribedMoserTriangle
namespace Problem97.MEC.NonObtuseCircumscribedMoserTriangle
export _root_.Problem97.MEC.NonObtuseCircumscribedMoserTriangle (inner_at_v3)
end Problem97.MEC.NonObtuseCircumscribedMoserTriangle
namespace Problem97.MEC.NonObtuseCircumscribedMoserTriangle
export _root_.Problem97.MEC.NonObtuseCircumscribedMoserTriangle (mk)
end Problem97.MEC.NonObtuseCircumscribedMoserTriangle
namespace Problem97.MEC.NonObtuseCircumscribedMoserTriangle.mk
export _root_.Problem97.MEC.NonObtuseCircumscribedMoserTriangle.mk (inj)
end Problem97.MEC.NonObtuseCircumscribedMoserTriangle.mk
namespace Problem97.MEC.NonObtuseCircumscribedMoserTriangle.mk
export _root_.Problem97.MEC.NonObtuseCircumscribedMoserTriangle.mk (injEq)
end Problem97.MEC.NonObtuseCircumscribedMoserTriangle.mk
namespace Problem97.MEC.NonObtuseCircumscribedMoserTriangle.mk
export _root_.Problem97.MEC.NonObtuseCircumscribedMoserTriangle.mk (noConfusion)
end Problem97.MEC.NonObtuseCircumscribedMoserTriangle.mk
namespace Problem97.MEC.NonObtuseCircumscribedMoserTriangle.mk
export _root_.Problem97.MEC.NonObtuseCircumscribedMoserTriangle.mk (sizeOf_spec)
end Problem97.MEC.NonObtuseCircumscribedMoserTriangle.mk
namespace Problem97.MEC.NonObtuseCircumscribedMoserTriangle
export _root_.Problem97.MEC.NonObtuseCircumscribedMoserTriangle (noConfusion)
end Problem97.MEC.NonObtuseCircumscribedMoserTriangle
namespace Problem97.MEC.NonObtuseCircumscribedMoserTriangle
export _root_.Problem97.MEC.NonObtuseCircumscribedMoserTriangle (noConfusionType)
end Problem97.MEC.NonObtuseCircumscribedMoserTriangle
namespace Problem97.MEC.NonObtuseCircumscribedMoserTriangle
export _root_.Problem97.MEC.NonObtuseCircumscribedMoserTriangle (rec)
end Problem97.MEC.NonObtuseCircumscribedMoserTriangle
namespace Problem97.MEC.NonObtuseCircumscribedMoserTriangle
export _root_.Problem97.MEC.NonObtuseCircumscribedMoserTriangle (recOn)
end Problem97.MEC.NonObtuseCircumscribedMoserTriangle
namespace Problem97.MEC.NonObtuseCircumscribedMoserTriangle
export _root_.Problem97.MEC.NonObtuseCircumscribedMoserTriangle (toMoserTriangle)
end Problem97.MEC.NonObtuseCircumscribedMoserTriangle
namespace Problem97.MEC
export _root_.Problem97.MEC (boundary)
end Problem97.MEC
namespace Problem97.MEC
export _root_.Problem97.MEC (mec)
end Problem97.MEC
namespace Problem97.MEC
export _root_.Problem97.MEC (mec_radius_pos)
end Problem97.MEC
namespace Problem97
export _root_.Problem97 (MinEnclosingCircle)
end Problem97
namespace Problem97.MinEnclosingCircle
export _root_.Problem97.MinEnclosingCircle (casesOn)
end Problem97.MinEnclosingCircle
namespace Problem97.MinEnclosingCircle
export _root_.Problem97.MinEnclosingCircle (center)
end Problem97.MinEnclosingCircle
namespace Problem97.MinEnclosingCircle
export _root_.Problem97.MinEnclosingCircle (ctorIdx)
end Problem97.MinEnclosingCircle
namespace Problem97.MinEnclosingCircle
export _root_.Problem97.MinEnclosingCircle (enclosing)
end Problem97.MinEnclosingCircle
namespace Problem97.MinEnclosingCircle
export _root_.Problem97.MinEnclosingCircle (exists_mec)
end Problem97.MinEnclosingCircle
namespace Problem97.MinEnclosingCircle
export _root_.Problem97.MinEnclosingCircle (minimal)
end Problem97.MinEnclosingCircle
namespace Problem97.MinEnclosingCircle
export _root_.Problem97.MinEnclosingCircle (mk)
end Problem97.MinEnclosingCircle
namespace Problem97.MinEnclosingCircle.mk
export _root_.Problem97.MinEnclosingCircle.mk (inj)
end Problem97.MinEnclosingCircle.mk
namespace Problem97.MinEnclosingCircle.mk
export _root_.Problem97.MinEnclosingCircle.mk (injEq)
end Problem97.MinEnclosingCircle.mk
namespace Problem97.MinEnclosingCircle.mk
export _root_.Problem97.MinEnclosingCircle.mk (noConfusion)
end Problem97.MinEnclosingCircle.mk
namespace Problem97.MinEnclosingCircle.mk
export _root_.Problem97.MinEnclosingCircle.mk (sizeOf_spec)
end Problem97.MinEnclosingCircle.mk
namespace Problem97.MinEnclosingCircle
export _root_.Problem97.MinEnclosingCircle (noConfusion)
end Problem97.MinEnclosingCircle
namespace Problem97.MinEnclosingCircle
export _root_.Problem97.MinEnclosingCircle (noConfusionType)
end Problem97.MinEnclosingCircle
namespace Problem97.MinEnclosingCircle
export _root_.Problem97.MinEnclosingCircle (radius)
end Problem97.MinEnclosingCircle
namespace Problem97.MinEnclosingCircle
export _root_.Problem97.MinEnclosingCircle (radius_nn)
end Problem97.MinEnclosingCircle
namespace Problem97.MinEnclosingCircle
export _root_.Problem97.MinEnclosingCircle (rec)
end Problem97.MinEnclosingCircle
namespace Problem97.MinEnclosingCircle
export _root_.Problem97.MinEnclosingCircle (recOn)
end Problem97.MinEnclosingCircle
namespace Problem97
export _root_.Problem97 (MoserTriangle)
end Problem97
namespace Problem97.MoserTriangle
export _root_.Problem97.MoserTriangle (casesOn)
end Problem97.MoserTriangle
namespace Problem97.MoserTriangle
export _root_.Problem97.MoserTriangle (ctorIdx)
end Problem97.MoserTriangle
namespace Problem97.MoserTriangle
export _root_.Problem97.MoserTriangle (mk)
end Problem97.MoserTriangle
namespace Problem97.MoserTriangle.mk
export _root_.Problem97.MoserTriangle.mk (inj)
end Problem97.MoserTriangle.mk
namespace Problem97.MoserTriangle.mk
export _root_.Problem97.MoserTriangle.mk (injEq)
end Problem97.MoserTriangle.mk
namespace Problem97.MoserTriangle.mk
export _root_.Problem97.MoserTriangle.mk (noConfusion)
end Problem97.MoserTriangle.mk
namespace Problem97.MoserTriangle.mk
export _root_.Problem97.MoserTriangle.mk (sizeOf_spec)
end Problem97.MoserTriangle.mk
namespace Problem97.MoserTriangle
export _root_.Problem97.MoserTriangle (noConfusion)
end Problem97.MoserTriangle
namespace Problem97.MoserTriangle
export _root_.Problem97.MoserTriangle (noConfusionType)
end Problem97.MoserTriangle
namespace Problem97.MoserTriangle
export _root_.Problem97.MoserTriangle (rec)
end Problem97.MoserTriangle
namespace Problem97.MoserTriangle
export _root_.Problem97.MoserTriangle (recOn)
end Problem97.MoserTriangle
namespace Problem97.MoserTriangle
export _root_.Problem97.MoserTriangle (v1)
end Problem97.MoserTriangle
namespace Problem97.MoserTriangle
export _root_.Problem97.MoserTriangle (v12_ne)
end Problem97.MoserTriangle
namespace Problem97.MoserTriangle
export _root_.Problem97.MoserTriangle (v13_ne)
end Problem97.MoserTriangle
namespace Problem97.MoserTriangle
export _root_.Problem97.MoserTriangle (v1_mem)
end Problem97.MoserTriangle
namespace Problem97.MoserTriangle
export _root_.Problem97.MoserTriangle (v2)
end Problem97.MoserTriangle
namespace Problem97.MoserTriangle
export _root_.Problem97.MoserTriangle (v23_ne)
end Problem97.MoserTriangle
namespace Problem97.MoserTriangle
export _root_.Problem97.MoserTriangle (v2_mem)
end Problem97.MoserTriangle
namespace Problem97.MoserTriangle
export _root_.Problem97.MoserTriangle (v3)
end Problem97.MoserTriangle
namespace Problem97.MoserTriangle
export _root_.Problem97.MoserTriangle (v3_mem)
end Problem97.MoserTriangle
namespace Problem97.MoserTriangle
export _root_.Problem97.MoserTriangle (verts)
end Problem97.MoserTriangle
namespace Problem97.MoserTriangle
export _root_.Problem97.MoserTriangle (verts_card)
end Problem97.MoserTriangle
namespace Problem97.MoserTriangle
export _root_.Problem97.MoserTriangle (verts_subset)
end Problem97.MoserTriangle
namespace Problem97
export _root_.Problem97 (OnArcOpposite)
end Problem97
namespace Problem97
export _root_.Problem97 (SurplusCapPacket)
end Problem97
namespace Problem97.SurplusCapPacket
export _root_.Problem97.SurplusCapPacket (casesOn)
end Problem97.SurplusCapPacket
namespace Problem97.SurplusCapPacket
export _root_.Problem97.SurplusCapPacket (ctorIdx)
end Problem97.SurplusCapPacket
namespace Problem97.SurplusCapPacket
export _root_.Problem97.SurplusCapPacket (hA)
end Problem97.SurplusCapPacket
namespace Problem97.SurplusCapPacket
export _root_.Problem97.SurplusCapPacket (hCirc)
end Problem97.SurplusCapPacket
namespace Problem97.SurplusCapPacket
export _root_.Problem97.SurplusCapPacket (hncol)
end Problem97.SurplusCapPacket
namespace Problem97.SurplusCapPacket
export _root_.Problem97.SurplusCapPacket (match_1)
end Problem97.SurplusCapPacket
namespace Problem97.SurplusCapPacket
export _root_.Problem97.SurplusCapPacket (mk)
end Problem97.SurplusCapPacket
namespace Problem97.SurplusCapPacket.mk
export _root_.Problem97.SurplusCapPacket.mk (inj)
end Problem97.SurplusCapPacket.mk
namespace Problem97.SurplusCapPacket.mk
export _root_.Problem97.SurplusCapPacket.mk (injEq)
end Problem97.SurplusCapPacket.mk
namespace Problem97.SurplusCapPacket.mk
export _root_.Problem97.SurplusCapPacket.mk (noConfusion)
end Problem97.SurplusCapPacket.mk
namespace Problem97.SurplusCapPacket.mk
export _root_.Problem97.SurplusCapPacket.mk (sizeOf_spec)
end Problem97.SurplusCapPacket.mk
namespace Problem97.SurplusCapPacket
export _root_.Problem97.SurplusCapPacket (noConfusion)
end Problem97.SurplusCapPacket
namespace Problem97.SurplusCapPacket
export _root_.Problem97.SurplusCapPacket (noConfusionType)
end Problem97.SurplusCapPacket
namespace Problem97.SurplusCapPacket
export _root_.Problem97.SurplusCapPacket (partition)
end Problem97.SurplusCapPacket
namespace Problem97.SurplusCapPacket
export _root_.Problem97.SurplusCapPacket (rec)
end Problem97.SurplusCapPacket
namespace Problem97.SurplusCapPacket
export _root_.Problem97.SurplusCapPacket (recOn)
end Problem97.SurplusCapPacket
namespace Problem97.SurplusCapPacket
export _root_.Problem97.SurplusCapPacket (surplus)
end Problem97.SurplusCapPacket
namespace Problem97.SurplusCapPacket
export _root_.Problem97.SurplusCapPacket (surplusIdx)
end Problem97.SurplusCapPacket
namespace Problem97.SurplusCapPacket
export _root_.Problem97.SurplusCapPacket (triangleNonObtuse)
end Problem97.SurplusCapPacket
namespace Problem97
export _root_.Problem97 (arcAngle)
end Problem97
namespace Problem97
export _root_.Problem97 (cutKey)
end Problem97
namespace Problem97
export _root_.Problem97 (iCount)
end Problem97
namespace Problem97
export _root_.Problem97 (iCountAt)
end Problem97
namespace Problem97
export _root_.Problem97 (signedArea2)
end Problem97
namespace Problem97
export _root_.Problem97 (stdOrientation)
end Problem97
namespace Problem97.CGN
export _root_.Problem97.CGN (CGN4g_strictCapBlockData_of_supportCap_oriented)
end Problem97.CGN
namespace Problem97.CGN
export _root_.Problem97.CGN (CGN6b_nonacute_of_minorCapChainCoords)
end Problem97.CGN
namespace Problem97.CGN
export _root_.Problem97.CGN (CGN6norm_minorCapChainModel_of_mecCapPacket)
end Problem97.CGN
namespace Problem97.ConvexIndep
export _root_.Problem97.ConvexIndep (not_collinear_of_card_ge_three)
end Problem97.ConvexIndep
namespace Problem97.ConvexIndep
export _root_.Problem97.ConvexIndep (not_wbtw)
end Problem97.ConvexIndep
namespace Problem97.Dumitrescu
export _root_.Problem97.Dumitrescu (three_cap_decomposition)
end Problem97.Dumitrescu
namespace Problem97.MEC
export _root_.Problem97.MEC (exists_nonobtuse_circumscribed_triple)
end Problem97.MEC
namespace Problem97.MEC
export _root_.Problem97.MEC (no_diameter_under_k4)
end Problem97.MEC
namespace Problem97.MEC
export _root_.Problem97.MEC (not_collinear_of_three_dist_eq)
end Problem97.MEC
namespace Problem97
export _root_.Problem97 (affineSpan_eq_top_of_not_collinear)
end Problem97
namespace Problem97
export _root_.Problem97 (card_ge_five_of_K4)
end Problem97
namespace Problem97
export _root_.Problem97 (center_same_side_as_apex_of_nonobtuse)
end Problem97
namespace Problem97
export _root_.Problem97 (collinear_of_signedArea2_eq_zero)
end Problem97
namespace Problem97
export _root_.Problem97 (exists_cut_sorted_enumeration_of_convexIndep)
end Problem97
namespace Problem97
export _root_.Problem97 (inner_chord_eq_two_mul_inner_midpoint)
end Problem97
namespace Problem97
export _root_.Problem97 (isCcwConvexPolygon_of_cut_sorted_arcAngle)
end Problem97
namespace Problem97
export _root_.Problem97 (signedArea2_eq_zero_iff_collinear)
end Problem97
namespace Problem97
export _root_.Problem97 (signedArea2_sign_eq_oangle_sign)
end Problem97
namespace Problem97
export _root_.Problem97 (signedArea_prod_eq_inner_mul_dist_sq)
end Problem97
namespace Problem97
export _root_.Problem97 (three_le_card_of_convexIndep_noncoll)
end Problem97
end Batch3N9


open scoped EuclideanGeometry InnerProductSpace

-- Original module: Solutions.Batch3N9.Foundation
section Batch3N9Unit000
namespace Batch3N9
open scoped EuclideanGeometry
namespace Problem97
export Erdos97 (HasNEquidistantPointsAt HasNEquidistantPointsOn)
theorem dist_sq_coord (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by
  rw [EuclideanSpace.dist_sq_eq]
  simp [Fin.sum_univ_two, Real.dist_eq, sq_abs]
abbrev FiniteN9ClosureStatement : Prop :=
  ∀ A : Finset ℝ², A.card = 9 → ConvexIndep A →
    ¬ HasNEquidistantProperty 4 A
end Problem97
end Batch3N9
end Batch3N9Unit000

-- Original module: Solutions.Batch3N9.IsoscelesCount
section Batch3N9Unit001
namespace Batch3N9
set_option linter.style.openClassical false
open scoped EuclideanGeometry
open Finset Classical
namespace Problem97
end Problem97
end Batch3N9
end Batch3N9Unit001

-- Original module: Solutions.Batch3N9.CountingArithmetic
section Batch3N9Unit002
namespace Batch3N9
namespace Problem97
end Problem97
end Batch3N9
end Batch3N9Unit002

-- Original module: Solutions.Batch3N9.ConvexIndepHelpers
section Batch3N9Unit003
namespace Batch3N9
open scoped EuclideanGeometry
namespace Problem97
theorem ConvexIndep.mono {A B : Finset ℝ²} (hBA : B ⊆ A)
    (hA : ConvexIndep A) : ConvexIndep B := by
  intro a haB hmem
  have haA : a ∈ (A : Set ℝ²) := Finset.coe_subset.mpr hBA haB
  have hsub : ((B : Set ℝ²) \ {a}) ⊆ ((A : Set ℝ²) \ {a}) :=
    Set.diff_subset_diff_left (Finset.coe_subset.mpr hBA)
  exact hA a haA (convexHull_mono hsub hmem)
namespace _root_.Problem97.ConvexIndep
export _root_.Batch3N9.Problem97.ConvexIndep (mono)
end _root_.Problem97.ConvexIndep
theorem ConvexIndep.erase {A : Finset ℝ²} (x : ℝ²)
    (hA : ConvexIndep A) : ConvexIndep (A.erase x) :=
  ConvexIndep.mono (Finset.erase_subset x A) hA
namespace _root_.Problem97.ConvexIndep
export _root_.Batch3N9.Problem97.ConvexIndep (erase)
end _root_.Problem97.ConvexIndep
theorem collinear_three_wbtw {x y z : ℝ²}
    (hcol : Collinear ℝ ({x, y, z} : Set ℝ²)) :
    Wbtw ℝ x y z ∨ Wbtw ℝ y z x ∨ Wbtw ℝ z x y := by
  simpa using hcol.wbtw_or_wbtw_or_wbtw
theorem ConvexIndep.not_three_collinear {A : Finset ℝ²}
    (hA : ConvexIndep A) {x y z : ℝ²} (hx : x ∈ A) (hy : y ∈ A)
    (hz : z ∈ A) (hxy : x ≠ y) (hxz : x ≠ z) (hyz : y ≠ z)
    (hcol : Collinear ℝ ({x, y, z} : Set ℝ²)) : False := by
  rcases collinear_three_wbtw hcol with hw | hw | hw
  · exact hA.not_wbtw hx hy hz hw hxy.symm hyz
  · exact hA.not_wbtw hy hz hx hw hyz.symm hxz.symm
  · exact hA.not_wbtw hz hx hy hw hxz hxy
namespace _root_.Problem97.ConvexIndep
export _root_.Batch3N9.Problem97.ConvexIndep (not_three_collinear)
end _root_.Problem97.ConvexIndep
end Problem97
end Batch3N9
end Batch3N9Unit003

-- Original module: Solutions.Batch3N9.MEC.Basic
section Batch3N9Unit004
namespace Batch3N9
open scoped EuclideanGeometry
open Finset
namespace Problem97
namespace MinEnclosingCircle
end MinEnclosingCircle
namespace MEC
end MEC
end Problem97
end Batch3N9
end Batch3N9Unit004

-- Original module: Solutions.Batch3N9.MEC.Boundary
section Batch3N9Unit005
namespace Batch3N9
open scoped EuclideanGeometry
open Finset
namespace Problem97
namespace MEC
end MEC
end Problem97
end Batch3N9
end Batch3N9Unit005

-- Original module: Solutions.Batch3N9.Moser.Triangle
section Batch3N9Unit006
namespace Batch3N9
open scoped EuclideanGeometry
open Finset
namespace Problem97
namespace MEC
end MEC
end Problem97
end Batch3N9
end Batch3N9Unit006

-- Original module: Solutions.Batch3N9.NoDiameterUnderK4
section Batch3N9Unit007
namespace Batch3N9
open scoped EuclideanGeometry
open Finset
namespace Problem97
namespace MEC
end MEC
end Problem97
end Batch3N9
end Batch3N9Unit007

-- Original module: Solutions.Batch3N9.SmallerCounterexample
section Batch3N9Unit008
namespace Batch3N9
open scoped EuclideanGeometry
namespace Problem97
end Problem97
end Batch3N9
end Batch3N9Unit008

-- Original module: Solutions.Batch3N9.Cap.Partition
section Batch3N9Unit009
namespace Batch3N9
open Finset
namespace Problem97
end Problem97
end Batch3N9
end Batch3N9Unit009

-- Original module: Solutions.Batch3N9.Cap.Structure
section Batch3N9Unit010
namespace Batch3N9
open scoped EuclideanGeometry
open Finset
namespace Problem97
namespace MoserTriangle
variable {A : Finset ℝ²}
end MoserTriangle
namespace CapTriple
variable {A : Finset ℝ²} {M : MoserTriangle A}
end CapTriple
end Problem97
end Batch3N9
end Batch3N9Unit010

-- Original module: Solutions.Batch3N9.Dumitrescu.L1
section Batch3N9Unit011
namespace Batch3N9
set_option linter.style.openClassical false
open scoped EuclideanGeometry
open Finset Classical
namespace Problem97
namespace Dumitrescu
end Dumitrescu
end Problem97
end Batch3N9
end Batch3N9Unit011

-- Original module: Solutions.Batch3N9.Dumitrescu.L3
section Batch3N9Unit012
namespace Batch3N9
set_option linter.style.openClassical false
open scoped EuclideanGeometry
open Finset Classical
namespace Problem97
namespace Dumitrescu
end Dumitrescu
end Problem97
end Batch3N9
end Batch3N9Unit012

-- Original module: Solutions.Batch3N9.Dumitrescu.L5
section Batch3N9Unit013
namespace Batch3N9
set_option linter.style.openClassical false
open scoped EuclideanGeometry
open Finset Classical
namespace Problem97
namespace Dumitrescu
noncomputable def capWitnessPairs (A C : Finset ℝ²) : Finset (Finset ℝ²) :=
  (C.powersetCard 2).filter
    (fun xy => ∃ a ∈ A, a ∉ C ∧ ∃ r : ℝ, ∀ q ∈ xy, dist a q = r)
structure CapWitnessRanking (A C : Finset ℝ²) where
  target : Finset ℝ²
  target_subset : target ⊆ C
  target_card_le : target.card ≤ C.card - 1
  rank : Finset ℝ² → ℝ²
  rank_mem : ∀ xy ∈ capWitnessPairs A C, rank xy ∈ target
  rank_injOn : Set.InjOn rank (capWitnessPairs A C : Set (Finset ℝ²))
namespace CapWitnessRanking
variable {A C : Finset ℝ²}
end CapWitnessRanking
end Dumitrescu
end Problem97
end Batch3N9
end Batch3N9Unit013

-- Original module: Solutions.Batch3N9.Dumitrescu.L6
section Batch3N9Unit014
namespace Batch3N9
set_option linter.style.openClassical false
open scoped EuclideanGeometry
open Finset Classical
namespace Problem97
namespace Dumitrescu
end Dumitrescu
end Problem97
end Batch3N9
end Batch3N9Unit014

-- Original module: Solutions.Batch3N9.MidpointInequality
section Batch3N9Unit015
namespace Batch3N9
open scoped EuclideanGeometry InnerProductSpace
namespace Problem97
end Problem97
end Batch3N9
end Batch3N9Unit015

-- Original module: Solutions.Batch3N9.Cap.ArcInscribedAngle
section Batch3N9Unit016
namespace Batch3N9
open scoped EuclideanGeometry InnerProductSpace
namespace Problem97
end Problem97
end Batch3N9
end Batch3N9Unit016

-- Original module: Solutions.Batch3N9.CircumcenterSide
section Batch3N9Unit017
namespace Batch3N9
open scoped EuclideanGeometry InnerProductSpace
namespace Problem97
end Problem97
end Batch3N9
end Batch3N9Unit017

-- Original module: Solutions.Batch3N9.Moser.TriangleNonObtuse
section Batch3N9Unit018
namespace Batch3N9
open scoped EuclideanGeometry InnerProductSpace
open Finset
namespace Problem97
namespace MEC
end MEC
end Problem97
end Batch3N9
end Batch3N9Unit018

-- Original module: Solutions.Batch3N9.Cap.PartitionFromMEC
section Batch3N9Unit019
namespace Batch3N9
open scoped EuclideanGeometry
open Finset
namespace Problem97
namespace MEC
end MEC
namespace SurplusCapPacket
variable {A : Finset ℝ²}
@[reducible] def triangle (S : SurplusCapPacket A) : MoserTriangle A :=
  S.triangleNonObtuse.toMoserTriangle.toStructural S.hCirc
namespace _root_.Problem97.SurplusCapPacket
export _root_.Batch3N9.Problem97.SurplusCapPacket (triangle)
end _root_.Problem97.SurplusCapPacket
end SurplusCapPacket
namespace SurplusCapPacket
@[reducible] def capByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) : Finset ℝ² :=
  match i.1 with
  | 0 => S.partition.C1
  | 1 => S.partition.C2
  | _ => S.partition.C3
namespace _root_.Problem97.SurplusCapPacket
export _root_.Batch3N9.Problem97.SurplusCapPacket (capByIndex)
end _root_.Problem97.SurplusCapPacket
@[reducible] noncomputable def capInteriorByIndex
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) : Finset ℝ² :=
  match i.1 with
  | 0 => (S.partition.C1.erase (_root_.Batch3N9.Problem97.SurplusCapPacket.triangle S).v2).erase (_root_.Batch3N9.Problem97.SurplusCapPacket.triangle S).v3
  | 1 => (S.partition.C2.erase (_root_.Batch3N9.Problem97.SurplusCapPacket.triangle S).v3).erase (_root_.Batch3N9.Problem97.SurplusCapPacket.triangle S).v1
  | _ => (S.partition.C3.erase (_root_.Batch3N9.Problem97.SurplusCapPacket.triangle S).v1).erase (_root_.Batch3N9.Problem97.SurplusCapPacket.triangle S).v2
namespace _root_.Problem97.SurplusCapPacket
export _root_.Batch3N9.Problem97.SurplusCapPacket (capInteriorByIndex)
end _root_.Problem97.SurplusCapPacket
theorem capInteriorByIndex_subset
    {A : Finset ℝ²} (S : SurplusCapPacket A) (i : Fin 3) :
    (_root_.Batch3N9.Problem97.SurplusCapPacket.capInteriorByIndex S) i ⊆ A := by
  intro x hx
  fin_cases i
  · simp only [capInteriorByIndex] at hx
    rw [Finset.mem_erase, Finset.mem_erase] at hx
    exact S.partition.C1_subset hx.2.2
  · simp only [capInteriorByIndex] at hx
    rw [Finset.mem_erase, Finset.mem_erase] at hx
    exact S.partition.C2_subset hx.2.2
  · simp only [capInteriorByIndex] at hx
    rw [Finset.mem_erase, Finset.mem_erase] at hx
    exact S.partition.C3_subset hx.2.2
namespace _root_.Problem97.SurplusCapPacket
export _root_.Batch3N9.Problem97.SurplusCapPacket (capInteriorByIndex_subset)
end _root_.Problem97.SurplusCapPacket
end SurplusCapPacket
end Problem97
end Batch3N9
end Batch3N9Unit019

-- Original module: Solutions.Batch3N9.Cap.ConeContainment
section Batch3N9Unit020
namespace Batch3N9
open scoped EuclideanGeometry InnerProductSpace
namespace Problem97
end Problem97
end Batch3N9
end Batch3N9Unit020

-- Original module: Solutions.Batch3N9.Cap.ArcInteriorPoints
section Batch3N9Unit021
namespace Batch3N9
open scoped EuclideanGeometry InnerProductSpace
namespace Problem97
theorem inner_midpoint_eq_signedArea_prod_of_chord_sphere
    (v2 v3 v O : ℝ²)
    (heq : ‖v2 - O‖ ^ 2 = ‖v3 - O‖ ^ 2) :
    ⟪midpoint ℝ v2 v3 - v, midpoint ℝ v2 v3 - O⟫_ℝ * ‖v3 - v2‖ ^ 2
      = signedArea2 O v2 v3 * signedArea2 v v2 v3 := by
  have norm_sub_sq : ∀ (x y : ℝ²),
      ‖x - y‖ ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := fun x y => by
    rw [EuclideanSpace.norm_sq_eq]
    simp [Fin.sum_univ_two, sq_abs, Real.norm_eq_abs, PiLp.sub_apply]
  have inner_eq : ∀ (a b : ℝ²),
      ⟪a, b⟫_ℝ = a 0 * b 0 + a 1 * b 1 := fun a b => by
    rw [PiLp.inner_apply]
    simp [Fin.sum_univ_two, mul_comm (a _) (b _)]
  have hmid : ∀ i : Fin 2, (midpoint ℝ v2 v3) i = ((v2 i + v3 i) : ℝ) / 2 := by
    intro i; rw [midpoint_eq_smul_add]
    simp [PiLp.smul_apply, PiLp.add_apply, invOf_eq_inv]; ring
  rw [norm_sub_sq v2 O, norm_sub_sq v3 O] at heq
  rw [norm_sub_sq v3 v2, inner_eq]
  simp only [signedArea2, PiLp.sub_apply, hmid]
  set a := v2 0; set b := v2 1; set c := v3 0; set d := v3 1
  set p := v 0; set q := v 1
  linear_combination (1 / 2 : ℝ) *
    (((a + c) / 2 - p) * (a - c) + ((b + d) / 2 - q) * (b - d)) * heq
theorem signedArea_prod_pos_trans {A B C : ℝ}
    (hAC : 0 < A * C) (hBC : 0 < B * C) : 0 < A * B := by
  rcases lt_trichotomy C 0 with hC | hC | hC
  · exact mul_pos_of_neg_of_neg (by nlinarith only [hAC, hC]) (by nlinarith only [hBC, hC])
  · subst hC; simp at hAC
  · exact mul_pos (by nlinarith only [hAC, hC]) (by nlinarith only [hBC, hC])
theorem signedArea_prod_pos_of_inner_midpoint_pos
    {v3 x a O : ℝ²}
    (heq : ‖v3 - O‖ = ‖x - O‖) (hne : x ≠ v3)
    (hpos : 0 < ⟪midpoint ℝ v3 x - a, midpoint ℝ v3 x - O⟫_ℝ) :
    0 < signedArea2 a v3 x * signedArea2 O v3 x := by
  have heq2 : ‖v3 - O‖ ^ 2 = ‖x - O‖ ^ 2 := by rw [heq]
  have hbridge := inner_midpoint_eq_signedArea_prod_of_chord_sphere v3 x a O heq2
  have hsq_pos : 0 < ‖x - v3‖ ^ 2 := by
    have : x - v3 ≠ 0 := sub_ne_zero.mpr hne
    positivity
  have hprod_pos : 0 < signedArea2 O v3 x * signedArea2 a v3 x := by
    rw [← hbridge]; exact mul_pos hpos hsq_pos
  linarith [hprod_pos, mul_comm (signedArea2 O v3 x) (signedArea2 a v3 x)]
theorem inner_chord_eq_two_mul_inner_midpoint_off_sphere
    (v2 v3 v O : ℝ²) (heq : ‖v2 - O‖ ^ 2 = ‖v3 - O‖ ^ 2) :
    ⟪v2 - v, v3 - v⟫_ℝ
      = 2 * ⟪midpoint ℝ v2 v3 - O, midpoint ℝ v2 v3 - v⟫_ℝ
        + ‖v - O‖ ^ 2 - ‖v2 - O‖ ^ 2 := by
  have norm_sub_sq : ∀ (x y : ℝ²),
      ‖x - y‖ ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := fun x y => by
    rw [EuclideanSpace.norm_sq_eq]
    simp [Fin.sum_univ_two, sq_abs, Real.norm_eq_abs, PiLp.sub_apply]
  have inner_eq : ∀ (a b : ℝ²),
      ⟪a, b⟫_ℝ = a 0 * b 0 + a 1 * b 1 := fun a b => by
    rw [PiLp.inner_apply]
    simp [Fin.sum_univ_two, mul_comm (a _) (b _)]
  have hmid : ∀ i : Fin 2, (midpoint ℝ v2 v3) i = ((v2 i + v3 i) : ℝ) / 2 := by
    intro i; rw [midpoint_eq_smul_add]
    simp [PiLp.smul_apply, PiLp.add_apply, invOf_eq_inv]; ring
  rw [norm_sub_sq v O, norm_sub_sq v2 O] at *
  rw [norm_sub_sq v3 O] at heq
  rw [inner_eq, inner_eq]
  simp only [PiLp.sub_apply, hmid] at *
  linarith
end Problem97
end Batch3N9
end Batch3N9Unit021

-- Original module: Solutions.Batch3N9.CircumscribedMECPacket
section Batch3N9Unit022
namespace Batch3N9
open scoped EuclideanGeometry InnerProductSpace
open Finset
namespace Problem97
namespace MoserTriangle
variable {A : Finset ℝ²}
end MoserTriangle
namespace CircumscribedMECPacket
variable {A : Finset ℝ²}
end CircumscribedMECPacket
end Problem97
end Batch3N9
end Batch3N9Unit022

-- Original module: Solutions.Batch3N9.Dumitrescu.L2
section Batch3N9Unit023
namespace Batch3N9
set_option linter.style.openClassical false
open scoped EuclideanGeometry
open Finset Classical
namespace Problem97
namespace Dumitrescu
end Dumitrescu
end Problem97
end Batch3N9
end Batch3N9Unit023

-- Original module: Solutions.Batch3N9.Dumitrescu.Lc3
section Batch3N9Unit024
namespace Batch3N9
set_option linter.style.openClassical false
open scoped EuclideanGeometry
open Finset Classical
namespace Problem97
namespace Dumitrescu
structure CapDiagonalVertexProfile (C : Finset ℝ²) where
  perApex : ℝ² → ℕ
  bound : ∀ a ∈ C, (Problem97.IsoscelesPairsAt C a).card ≤ perApex a
  sum_bound : 4 * (∑ a ∈ C, perApex a) ≤ (C.card - 1) ^ 2
namespace CapDiagonalVertexProfile
variable {C : Finset ℝ²}
end CapDiagonalVertexProfile
end Dumitrescu
end Problem97
end Batch3N9
end Batch3N9Unit024

-- Original module: Solutions.Batch3N9.CGN.CGN
section Batch3N9Unit025
namespace Batch3N9
open scoped EuclideanGeometry
open scoped InnerProductSpace
open Finset
namespace Problem97
namespace CGN
namespace OrderedCap
variable {m : ℕ}
@[simp] theorem map_points (L : OrderedCap m) (T : ℝ² → ℝ²)
    (hT : Function.Injective T) (i : Fin m) :
    (L.map T hT).points i = T (L.points i) := rfl
namespace _root_.Problem97.CGN.OrderedCap
export _root_.Batch3N9.Problem97.CGN.OrderedCap (map_points)
end _root_.Problem97.CGN.OrderedCap
end OrderedCap
@[simp] theorem lastIndex_val {m : ℕ} (hm : 2 ≤ m) : (lastIndex hm).val = m - 1 := rfl
end CGN
end Problem97
end Batch3N9
end Batch3N9Unit025

-- Original module: Solutions.Batch3N9.SignedAreaOangle
section Batch3N9Unit026
namespace Batch3N9
open scoped EuclideanGeometry
namespace Problem97
theorem signedArea2_eq_stdOrientation_areaForm (v vj vk : ℝ²) :
    Problem97.signedArea2 v vj vk =
      stdOrientation.areaForm (vj - v) (vk - v) := by
  rw [stdOrientation, Orientation.areaForm_to_volumeForm,
      Orientation.volumeForm_robust _ (EuclideanSpace.basisFun (Fin 2) ℝ) rfl,
      Module.Basis.det_apply]
  simp only [Module.Basis.toMatrix_apply, Matrix.det_fin_two, signedArea2,
             EuclideanSpace.basisFun_toBasis, PiLp.basisFun_repr,
             Matrix.cons_val_zero, Matrix.cons_val_one, PiLp.sub_apply]
end Problem97
end Batch3N9
end Batch3N9Unit026

-- Original module: Solutions.Batch3N9.ConvexCyclicOrder.Basic
section Batch3N9Unit027
namespace Batch3N9
open scoped EuclideanGeometry
namespace Problem97
end Problem97
end Batch3N9
end Batch3N9Unit027

-- Original module: Solutions.Batch3N9.MEC.ArcAngle
section Batch3N9Unit028
namespace Batch3N9
open scoped EuclideanGeometry Real
namespace Problem97
theorem arcAngle_sub_arcAngle (center p q : ℝ²)
    (hp : p ≠ center) (hq : q ≠ center) :
    arcAngle center p - arcAngle center q =
      stdOrientation.oangle (q - center) (p - center) := by
  unfold arcAngle
  have he : (EuclideanSpace.basisFun (Fin 2) ℝ) 0 ≠ (0 : ℝ²) :=
    (EuclideanSpace.basisFun (Fin 2) ℝ).orthonormal.ne_zero 0
  have hpv : p - center ≠ 0 := sub_ne_zero.mpr hp
  have hqv : q - center ≠ 0 := sub_ne_zero.mpr hq
  exact stdOrientation.oangle_sub_left he hqv hpv
theorem arcAngle_chord_length (center : ℝ²) (r : ℝ) (hr : 0 < r) (p q : ℝ²)
    (hp : dist p center = r) (hq : dist q center = r) :
    dist p q = 2 * r *
      |Real.sin ((arcAngle center p - arcAngle center q).toReal / 2)| := by
  have hp_ne : p ≠ center := by
    intro h; rw [h, dist_self] at hp; linarith
  have hq_ne : q ≠ center := by
    intro h; rw [h, dist_self] at hq; linarith
  have hu : ‖p - center‖ = r := by rw [← dist_eq_norm]; exact hp
  have hv : ‖q - center‖ = r := by rw [← dist_eq_norm]; exact hq
  have hpq : dist p q = ‖(p - center) - (q - center)‖ := by
    rw [dist_eq_norm]; congr 1; module
  have hcos : inner ℝ (p - center) (q - center)
            = r ^ 2 * (stdOrientation.oangle (p - center) (q - center)).cos := by
    rw [stdOrientation.inner_eq_norm_mul_norm_mul_cos_oangle (p - center) (q - center)]
    rw [hu, hv]; ring
  have hnsq : ‖(p - center) - (q - center)‖ ^ 2
            = 2 * r ^ 2 *
                (1 - (stdOrientation.oangle (p - center) (q - center)).cos) := by
    rw [norm_sub_sq_real, hu, hv, hcos]; ring
  have ha0 : arcAngle center p - arcAngle center q
           = stdOrientation.oangle (q - center) (p - center) :=
    arcAngle_sub_arcAngle center p q hp_ne hq_ne
  have hoangle_rev : stdOrientation.oangle (p - center) (q - center)
                  = -(stdOrientation.oangle (q - center) (p - center)) := by
    rw [stdOrientation.oangle_rev (q - center) (p - center)]
  have hcos_eq : (stdOrientation.oangle (p - center) (q - center)).cos
              = (arcAngle center p - arcAngle center q).cos := by
    rw [hoangle_rev, Real.Angle.cos_neg, ha0]
  have hcos_toReal : (arcAngle center p - arcAngle center q).cos
                  = Real.cos (arcAngle center p - arcAngle center q).toReal :=
    (Real.Angle.cos_toReal _).symm
  have hhalf : 1 - Real.cos (arcAngle center p - arcAngle center q).toReal
            = 2 * Real.sin ((arcAngle center p - arcAngle center q).toReal / 2) ^ 2 := by
    set x := (arcAngle center p - arcAngle center q).toReal
    have hcs := Real.cos_sq (x / 2)
    have h2 : (2 * (x / 2)) = x := by ring
    rw [h2] at hcs
    linarith [Real.sin_sq (x / 2)]
  have hsq : ‖(p - center) - (q - center)‖ ^ 2
          = (2 * r *
              |Real.sin ((arcAngle center p - arcAngle center q).toReal / 2)|) ^ 2 := by
    rw [hnsq, hcos_eq, hcos_toReal, hhalf]
    rw [mul_pow, mul_pow, sq_abs]
    ring
  have h_nonneg_rhs : 0 ≤ 2 * r *
      |Real.sin ((arcAngle center p - arcAngle center q).toReal / 2)| := by
    refine mul_nonneg (mul_nonneg ?_ ?_) (abs_nonneg _)
    · norm_num
    · linarith
  rw [hpq]
  exact (pow_left_inj₀ (norm_nonneg _) h_nonneg_rhs two_ne_zero).mp hsq
theorem abs_sin_half_eq_iff (θ₁ θ₂ : Real.Angle) :
    |Real.sin (θ₁.toReal / 2)| = |Real.sin (θ₂.toReal / 2)| ↔
      |θ₁.toReal| = |θ₂.toReal| := by
  have habs₁ : |θ₁.toReal| ≤ Real.pi :=
    abs_le.mpr ⟨le_of_lt (Real.Angle.neg_pi_lt_toReal _),
               Real.Angle.toReal_le_pi _⟩
  have habs₂ : |θ₂.toReal| ≤ Real.pi :=
    abs_le.mpr ⟨le_of_lt (Real.Angle.neg_pi_lt_toReal _),
               Real.Angle.toReal_le_pi _⟩
  have hpi_pos : 0 < Real.pi := Real.pi_pos
  have hdiv₁ : |θ₁.toReal / 2| ≤ Real.pi := by
    rw [abs_div, abs_of_pos (by norm_num : (0:ℝ) < 2)]; linarith
  have hdiv₂ : |θ₂.toReal / 2| ≤ Real.pi := by
    rw [abs_div, abs_of_pos (by norm_num : (0:ℝ) < 2)]; linarith
  rw [Real.abs_sin_eq_sin_abs_of_abs_le_pi hdiv₁,
      Real.abs_sin_eq_sin_abs_of_abs_le_pi hdiv₂]
  have hd₁ : |θ₁.toReal / 2| = |θ₁.toReal| / 2 := by
    rw [abs_div, abs_of_pos (by norm_num : (0:ℝ) < 2)]
  have hd₂ : |θ₂.toReal / 2| = |θ₂.toReal| / 2 := by
    rw [abs_div, abs_of_pos (by norm_num : (0:ℝ) < 2)]
  rw [hd₁, hd₂]
  refine ⟨fun h => ?_, fun h => by rw [h]⟩
  have hup₁ : |θ₁.toReal| / 2 ≤ Real.pi / 2 := by linarith
  have hup₂ : |θ₂.toReal| / 2 ≤ Real.pi / 2 := by linarith
  have hmem₁ : |θ₁.toReal| / 2 ∈ Set.Icc (-(Real.pi / 2)) (Real.pi / 2) := by
    refine ⟨?_, hup₁⟩
    have h0 : (0:ℝ) ≤ |θ₁.toReal| / 2 := by positivity
    have : -(Real.pi / 2) ≤ 0 := by linarith
    linarith
  have hmem₂ : |θ₂.toReal| / 2 ∈ Set.Icc (-(Real.pi / 2)) (Real.pi / 2) := by
    refine ⟨?_, hup₂⟩
    have h0 : (0:ℝ) ≤ |θ₂.toReal| / 2 := by positivity
    have : -(Real.pi / 2) ≤ 0 := by linarith
    linarith
  have : |θ₁.toReal| / 2 = |θ₂.toReal| / 2 := Real.injOn_sin hmem₁ hmem₂ h
  linarith
theorem arcAngle_chord_length_eq_iff
    (center : ℝ²) (r : ℝ) (hr : 0 < r)
    (p q₁ q₂ : ℝ²)
    (hp : dist p center = r) (hq₁ : dist q₁ center = r) (hq₂ : dist q₂ center = r) :
    dist p q₁ = dist p q₂ ↔
      |(arcAngle center p - arcAngle center q₁).toReal|
        = |(arcAngle center p - arcAngle center q₂).toReal| := by
  rw [arcAngle_chord_length center r hr p q₁ hp hq₁,
      arcAngle_chord_length center r hr p q₂ hp hq₂]
  have h2r_pos : 0 < 2 * r := by linarith
  have h2r_ne : (2 * r) ≠ 0 := ne_of_gt h2r_pos
  constructor
  · intro h
    have h' : |Real.sin ((arcAngle center p - arcAngle center q₁).toReal / 2)|
            = |Real.sin ((arcAngle center p - arcAngle center q₂).toReal / 2)| :=
      mul_left_cancel₀ h2r_ne h
    exact (abs_sin_half_eq_iff _ _).mp h'
  · intro h
    have h' : |Real.sin ((arcAngle center p - arcAngle center q₁).toReal / 2)|
            = |Real.sin ((arcAngle center p - arcAngle center q₂).toReal / 2)| :=
      (abs_sin_half_eq_iff _ _).mpr h
    rw [h']
end Problem97
end Batch3N9
end Batch3N9Unit028

-- Original module: Solutions.Batch3N9.Moser.NonDeg
section Batch3N9Unit029
namespace Batch3N9
open scoped EuclideanGeometry
open Finset
namespace Problem97
namespace MEC
lemma signedArea2_ne_zero_of_three_dist_eq {p₁ p₂ p₃ c : ℝ²} {r : ℝ}
    (h1 : dist p₁ c = r) (h2 : dist p₂ c = r) (h3 : dist p₃ c = r)
    (h12 : p₁ ≠ p₂) (h23 : p₂ ≠ p₃) (h13 : p₁ ≠ p₃) :
    Problem97.signedArea2 p₁ p₂ p₃ ≠ 0 := by
  intro hz
  exact not_collinear_of_three_dist_eq h1 h2 h3 h12 h23 h13
    (Problem97.collinear_of_signedArea2_eq_zero p₁ p₂ p₃ hz)
end MEC
end Problem97
end Batch3N9
end Batch3N9Unit029

-- Original module: Solutions.Batch3N9.ConvexCyclicOrder.Construct
section Batch3N9Unit030
namespace Batch3N9
open scoped EuclideanGeometry Real
namespace Problem97
theorem exists_center_interior_convexHull_of_convexIndep_noncoll
    {A : Finset ℝ²} (_hA : Problem97.ConvexIndep A)
    (hnoncoll : ¬ Collinear ℝ (A : Set ℝ²)) :
    ∃ c : ℝ², c ∈ interior (convexHull ℝ (A : Set ℝ²)) := by
  have hspan : affineSpan ℝ (A : Set ℝ²) = ⊤ :=
    affineSpan_eq_top_of_not_collinear hnoncoll
  have hint : (interior (convexHull ℝ (A : Set ℝ²))).Nonempty :=
    interior_convexHull_nonempty_iff_affineSpan_eq_top.mpr hspan
  exact hint
theorem exists_isCcwConvexPolygon_of_convexIndep
    {A : Finset ℝ²} (hA : Problem97.ConvexIndep A)
    (hnoncoll : ¬ Collinear ℝ (A : Set ℝ²)) :
    ∃ (n : ℕ) (_ : 3 ≤ n) (phi : Fin n → ℝ²),
      Function.Injective phi ∧
      Finset.univ.image phi = A ∧
      EuclideanGeometry.IsCcwConvexPolygon phi := by
  obtain ⟨c, hc⟩ := Problem97.exists_center_interior_convexHull_of_convexIndep_noncoll hA hnoncoll
  obtain ⟨phi, hphi_inj, hphi_image, hphi_sorted⟩ :=
    Problem97.exists_cut_sorted_enumeration_of_convexIndep hA hc
  refine ⟨A.card, Problem97.three_le_card_of_convexIndep_noncoll hA hnoncoll, phi,
    hphi_inj, hphi_image, ?_⟩
  exact Problem97.isCcwConvexPolygon_of_cut_sorted_arcAngle
    hA hc hphi_inj hphi_image hphi_sorted
end Problem97
end Batch3N9
end Batch3N9Unit030

-- Original module: Solutions.Batch3N9.OangleBridge
section Batch3N9Unit031
namespace Batch3N9
open scoped EuclideanGeometry
namespace Problem97
namespace MEC
end MEC
end Problem97
end Batch3N9
end Batch3N9Unit031

-- Original module: Solutions.Batch3N9.CGN.CGN4g
section Batch3N9Unit032
namespace Batch3N9
open scoped EuclideanGeometry
open scoped InnerProductSpace
namespace Problem97
namespace CGN
theorem CGN4g0_globalBoundaryOrder_of_convexIndep
    {A : Finset ℝ²} (hA : Problem97.ConvexIndep A)
    (hnoncoll : ¬ Collinear ℝ (A : Set ℝ²)) :
    ∃ (n : ℕ) (_ : 3 ≤ n) (phi : Fin n → ℝ²),
      Function.Injective phi ∧
      Finset.univ.image phi = A ∧
      EuclideanGeometry.IsCcwConvexPolygon phi := by
  simpa using Problem97.exists_isCcwConvexPolygon_of_convexIndep hA hnoncoll
namespace StrictCapBlockData
variable {A C : Finset ℝ²}
theorem cap_image (B : StrictCapBlockData A C) :
    Finset.univ.image B.L.points = C :=
  B.Block.cap_image
namespace _root_.Problem97.CGN.StrictCapBlockData
export _root_.Batch3N9.Problem97.CGN.StrictCapBlockData (cap_image)
end _root_.Problem97.CGN.StrictCapBlockData
theorem cap_card_eq (B : StrictCapBlockData A C) : B.m = C.card := by
  have himageCard :
      (Finset.univ.image B.L.points).card = C.card := by
    rw [B.Block.cap_image]
  rw [Finset.card_image_of_injective _ B.L.injective] at himageCard
  simpa using himageCard
namespace _root_.Problem97.CGN.StrictCapBlockData
export _root_.Batch3N9.Problem97.CGN.StrictCapBlockData (cap_card_eq)
end _root_.Problem97.CGN.StrictCapBlockData
end StrictCapBlockData
end CGN
namespace CGN
theorem CGN4g_capData_of_supportCap_oriented
    {A C : Finset ℝ²} {M : Problem97.MoserTriangle A}
    (hA : Problem97.ConvexIndep A)
    (hnoncoll : ¬ Collinear ℝ (A : Set ℝ²))
    (hC_subset : C ⊆ A)
    (hC_arc : ∀ x ∈ A, x ∈ C ↔ Problem97.OnArcOpposite M.v1 M.v2 M.v3 x)
    (hv_mem : M.v2 ∈ C)
    (hw_mem : M.v3 ∈ C)
    (P : Problem97.CircumscribedMECPacket A M)
    (hacute : 0 ≤ ⟪M.v2 - M.v1, M.v3 - M.v1⟫_ℝ) :
    ∃ m, ∃ L : OrderedCap m,
      ∃ Packet : MecCapPacket A L,
      ∃ Hside : MinorCapSideHypotheses Packet,
      ∃ Hord : StrictCapOrder A L,
        Finset.univ.image L.points = C ∧
          ((L.points (firstIndex Packet.hm) = M.v2 ∧
              L.points (lastIndex Packet.hm) = M.v3) ∨
            (L.points (firstIndex Packet.hm) = M.v3 ∧
              L.points (lastIndex Packet.hm) = M.v2)) := by
  rcases CGN4g_strictCapBlockData_of_supportCap_oriented
      (A := A) (C := C) (M := M) hA hnoncoll hC_subset hC_arc hv_mem hw_mem
      P hacute with
    ⟨B, horient⟩
  exact ⟨B.m, B.L, B.Packet, B.Hside, B.Hord, (_root_.Batch3N9.Problem97.CGN.StrictCapBlockData.cap_image B), horient⟩
end CGN
end Problem97
end Batch3N9
end Batch3N9Unit032

-- Original module: Solutions.Batch3N9.Dumitrescu.Lc1Strict
section Batch3N9Unit033
namespace Batch3N9
open scoped EuclideanGeometry InnerProductSpace
open Finset
namespace Problem97
end Problem97
end Batch3N9
end Batch3N9Unit033

-- Original module: Solutions.Batch3N9.CGN.CGN6
section Batch3N9Unit034
namespace Batch3N9
open scoped EuclideanGeometry
open scoped InnerProductSpace
open scoped BigOperators
namespace Problem97
namespace CGN
theorem CGN6b_nonacute_of_minorCapChainModel {m : ℕ} {L : OrderedCap m}
    (M : MinorCapChainModel L) :
    ∀ {i j k : Fin m}, i < j → j < k →
      ⟪L.points i - L.points j, L.points k - L.points j⟫_ℝ ≤ 0 := by
  intro i j k hij hjk
  rw [M.points_eq i, M.points_eq j, M.points_eq k]
  exact CGN6b_nonacute_of_minorCapChainCoords M.coords hij hjk
theorem CGN6c_dist_strict_from_first {m : ℕ} {L : OrderedCap m}
    (M : MinorCapChainModel L)
    {i0 : Fin m}
    (hi0 : i0 = finIndex m 0 (by
      have hm : 2 ≤ m := M.coords.hm
      omega)) :
    ∀ {r s : Fin m}, i0 < r → r < s →
      dist (L.points i0) (L.points r) <
        dist (L.points i0) (L.points s) := by
  subst i0
  intro r s h0r hrs
  let i0 : Fin m := finIndex m 0 (by
    have hm : 2 ≤ m := M.coords.hm
    omega)
  have hnonacute :
      ⟪L.points i0 - L.points r, L.points s - L.points r⟫_ℝ ≤ 0 :=
    CGN6b_nonacute_of_minorCapChainModel M h0r hrs
  have hinner_nonneg :
      0 ≤ ⟪L.points i0 - L.points r, L.points r - L.points s⟫_ℝ := by
    have hneg :
        ⟪L.points i0 - L.points r, L.points r - L.points s⟫_ℝ =
          -⟪L.points i0 - L.points r, L.points s - L.points r⟫_ℝ := by
      simpa [sub_eq_add_neg, add_comm, add_left_comm, add_assoc] using
        (inner_neg_right (L.points i0 - L.points r) (L.points s - L.points r))
    rw [hneg]
    linarith
  have hrs_ne : L.points r ≠ L.points s := by
    intro h
    exact (ne_of_lt hrs) (L.injective h)
  have hrs_pos : 0 < dist (L.points r) (L.points s) := dist_pos.mpr hrs_ne
  have hsq_gap :
      dist (L.points i0) (L.points s) ^ 2 =
        dist (L.points i0) (L.points r) ^ 2 + dist (L.points r) (L.points s) ^ 2
          + 2 * ⟪L.points i0 - L.points r, L.points r - L.points s⟫_ℝ := by
    have hvec :
        L.points i0 - L.points s =
          (L.points i0 - L.points r) + (L.points r - L.points s) := by
      abel
    rw [dist_eq_norm, hvec, norm_add_pow_two_real, dist_eq_norm, dist_eq_norm]
    ring
  have hsq_lt :
      dist (L.points i0) (L.points r) ^ 2 <
        dist (L.points i0) (L.points s) ^ 2 := by
    have hrs_sq_pos : 0 < dist (L.points r) (L.points s) ^ 2 := by
      nlinarith only [hrs_pos, sq_pos_of_pos hrs_pos]
    nlinarith only [hinner_nonneg, hsq_gap, hrs_sq_pos]
  have hr_nonneg : 0 ≤ dist (L.points i0) (L.points r) := dist_nonneg
  have hs_nonneg : 0 ≤ dist (L.points i0) (L.points s) := dist_nonneg
  nlinarith only [hsq_lt, hr_nonneg, hs_nonneg, sq_nonneg (dist (L.points i0) (L.points r) - dist (L.points i0) (L.points s)), sq_nonneg (dist (L.points i0) (L.points r) + dist (L.points i0) (L.points s))]

theorem CGN6c_dist_strict_from_last {m : ℕ} {L : OrderedCap m}
    (M : MinorCapChainModel L)
    {jm : Fin m}
    (hjm : jm = finIndex m (m - 1) (by
      have hm : 2 ≤ m := M.coords.hm
      omega)) :
    ∀ {r s : Fin m}, r < s → s < jm →
      dist (L.points jm) (L.points s) <
        dist (L.points jm) (L.points r) := by
  subst jm
  intro r s hrs hsj
  let jm : Fin m := finIndex m (m - 1) (by
    have hm : 2 ≤ m := M.coords.hm
    omega)
  have hnonacute :
      ⟪L.points r - L.points s, L.points jm - L.points s⟫_ℝ ≤ 0 :=
    CGN6b_nonacute_of_minorCapChainModel M hrs hsj
  have hinner_nonneg :
      0 ≤ ⟪L.points jm - L.points s, L.points s - L.points r⟫_ℝ := by
    have hnonacute' :
        ⟪L.points jm - L.points s, L.points r - L.points s⟫_ℝ ≤ 0 := by
      simpa [real_inner_comm] using hnonacute
    have hneg :
        ⟪L.points jm - L.points s, L.points s - L.points r⟫_ℝ =
          -⟪L.points jm - L.points s, L.points r - L.points s⟫_ℝ := by
      simpa [sub_eq_add_neg, add_comm, add_left_comm, add_assoc] using
        (inner_neg_right (L.points jm - L.points s) (L.points r - L.points s))
    rw [hneg]
    linarith
  have hrs_ne : L.points r ≠ L.points s := by
    intro h
    exact (ne_of_lt hrs) (L.injective h)
  have hrs_pos : 0 < dist (L.points r) (L.points s) := dist_pos.mpr hrs_ne
  have hsq_gap :
      dist (L.points jm) (L.points r) ^ 2 =
        dist (L.points jm) (L.points s) ^ 2 + dist (L.points r) (L.points s) ^ 2
          + 2 * ⟪L.points jm - L.points s, L.points s - L.points r⟫_ℝ := by
    have hvec :
        L.points jm - L.points r =
          (L.points jm - L.points s) + (L.points s - L.points r) := by
      abel
    rw [dist_eq_norm, hvec, norm_add_pow_two_real, dist_eq_norm, dist_eq_norm]
    have hnorm_rev : ‖L.points s - L.points r‖ ^ 2 = ‖L.points r - L.points s‖ ^ 2 := by
      rw [norm_sub_rev]
    nlinarith only [hnorm_rev]
  have hsq_lt :
      dist (L.points jm) (L.points s) ^ 2 <
        dist (L.points jm) (L.points r) ^ 2 := by
    have hrs_sq_pos : 0 < dist (L.points r) (L.points s) ^ 2 := by
      nlinarith only [hrs_pos, sq_pos_of_pos hrs_pos]
    nlinarith only [hinner_nonneg, hsq_gap, hrs_sq_pos]
  have hs_nonneg : 0 ≤ dist (L.points jm) (L.points s) := dist_nonneg
  have hr_nonneg : 0 ≤ dist (L.points jm) (L.points r) := dist_nonneg
  nlinarith only [hsq_lt, hs_nonneg, hr_nonneg, sq_nonneg (dist (L.points jm) (L.points s) - dist (L.points jm) (L.points r)), sq_nonneg (dist (L.points jm) (L.points s) + dist (L.points jm) (L.points r))]

end CGN
end Problem97
end Batch3N9
end Batch3N9Unit034

-- Original module: Solutions.Batch3N9.CGN.CGN7
section Batch3N9Unit035
namespace Batch3N9
open scoped EuclideanGeometry
open scoped InnerProductSpace
open scoped BigOperators
open Finset
namespace Problem97
namespace CGN
end CGN
end Problem97
end Batch3N9
end Batch3N9Unit035

-- Original module: Solutions.Batch3N9.ArcPartitionCount
section Batch3N9Unit036
namespace Batch3N9
open scoped EuclideanGeometry
open Finset Classical
namespace Problem97
namespace MEC
end MEC
end Problem97
end Batch3N9
end Batch3N9Unit036

-- Original module: Solutions.Batch3N9.Dumitrescu.L4
section Batch3N9Unit037
namespace Batch3N9
set_option linter.style.openClassical false
open scoped EuclideanGeometry
open Finset Classical
namespace Problem97
namespace Dumitrescu
end Dumitrescu
end Problem97
end Batch3N9
end Batch3N9Unit037

-- Original module: Solutions.Batch3N9.Dumitrescu.L7
section Batch3N9Unit038
namespace Batch3N9
set_option linter.style.openClassical false
open scoped EuclideanGeometry
open Finset Classical
namespace Problem97
namespace Dumitrescu
def IsCrossCapEdge {A : Finset ℝ²} {M : Problem97.MoserTriangle A}
    (CP : Problem97.CapTriple A M) (uv : Finset ℝ²) : Prop :=
  uv ⊆ A ∧ uv.card = 2 ∧
    ¬ uv ⊆ CP.C1 ∧ ¬ uv ⊆ CP.C2 ∧ ¬ uv ⊆ CP.C3
lemma IsCrossCapEdge.card_eq_two
    {A : Finset ℝ²} {M : Problem97.MoserTriangle A}
    {CP : Problem97.CapTriple A M} {uv : Finset ℝ²}
    (h : IsCrossCapEdge CP uv) : uv.card = 2 := h.2.1
end Dumitrescu
end Problem97
end Batch3N9
end Batch3N9Unit038

-- Original module: Solutions.Batch3N9.Dumitrescu.L10
section Batch3N9Unit039
namespace Batch3N9
set_option linter.style.openClassical false
open scoped EuclideanGeometry
open Finset Classical
namespace Problem97
namespace Dumitrescu
end Dumitrescu
end Problem97
end Batch3N9
end Batch3N9Unit039

-- Original module: Solutions.Batch3N9.Dumitrescu.L9
section Batch3N9Unit040
namespace Batch3N9
namespace Problem97
namespace Dumitrescu
end Dumitrescu
end Problem97
end Batch3N9
end Batch3N9Unit040

-- Original module: Solutions.Batch3N9.Dumitrescu.L10c
section Batch3N9Unit041
namespace Batch3N9
namespace Problem97
namespace Dumitrescu
end Dumitrescu
end Problem97
end Batch3N9
end Batch3N9Unit041

-- Original module: Solutions.Batch3N9.CGN.CGN8
section Batch3N9Unit042
namespace Batch3N9
open scoped EuclideanGeometry
open scoped InnerProductSpace
open scoped BigOperators
open Finset
namespace Problem97
end Problem97
end Batch3N9
end Batch3N9Unit042

-- Original module: Solutions.Batch3N9.Counting
section Batch3N9Unit043
namespace Batch3N9
open scoped EuclideanGeometry
open Finset
namespace Problem97
theorem not_collinear_of_K4 {A : Finset ℝ²} (hne : A.Nonempty)
    (hconv : ConvexIndep A) (hK4 : HasNEquidistantProperty 4 A) :
    ¬ Collinear ℝ (A : Set ℝ²) := by
  have h5 : 5 ≤ A.card := card_ge_five_of_K4 hne hK4
  have h3 : 3 ≤ A.card := le_trans (by decide : 3 ≤ 5) h5
  exact ConvexIndep.not_collinear_of_card_ge_three hconv h3
theorem boundary_card_ge_three_of_K4 {A : Finset ℝ²} (hne : A.Nonempty)
    (hconv : ConvexIndep A) (hK4 : HasNEquidistantProperty 4 A) :
    3 ≤ (A.filter (fun p =>
      dist p (Problem97.MEC.mec A hne).center = (Problem97.MEC.mec A hne).radius)).card := by
  have hnoncol : ¬ Collinear ℝ (A : Set ℝ²) :=
    not_collinear_of_K4 hne hconv hK4
  exact Problem97.MEC.no_diameter_under_k4 hne hnoncol hconv hK4
end Problem97
end Batch3N9
end Batch3N9Unit043

-- Original module: Solutions.Batch3N9.N9Endpoint.N4a
section Batch3N9Unit044
namespace Batch3N9
open scoped EuclideanGeometry
open scoped InnerProductSpace
open Finset
namespace Problem97
namespace FiniteEndpoint
structure OrderedSideChain (m : ℕ) where
  points : Fin m → ℝ²
  injective : Function.Injective points
namespace OrderedSideChain
variable {m : ℕ}
noncomputable def support (L : OrderedSideChain m) : Finset ℝ² :=
  Finset.univ.image L.points
@[simp] theorem mem_support_iff {L : OrderedSideChain m} {x : ℝ²} :
    x ∈ L.support ↔ ∃ i : Fin m, L.points i = x := by
  classical
  unfold support
  simp
theorem b3n9m044_card_filter_eqDist_le_one
    (center : ℝ²) (L : OrderedSideChain m)
    (hmono : ∀ {i j : Fin m}, i < j → dist center (L.points i) < dist center (L.points j))
    (r : ℝ) :
    (Finset.univ.filter (fun i => dist center (L.points i) = r)).card ≤ 1 := by
  classical
  rw [Finset.card_le_one]
  intro i hi j hj
  by_cases hij : i = j
  · exact hij
  · rcases lt_or_gt_of_ne hij with hij_lt | hji_lt
    · have hdi : dist center (L.points i) = r := (Finset.mem_filter.mp hi).2
      have hdj : dist center (L.points j) = r := (Finset.mem_filter.mp hj).2
      have hlt := hmono hij_lt
      rw [hdi, hdj] at hlt
      exact (False.elim (lt_irrefl r hlt))
    · have hdi : dist center (L.points i) = r := (Finset.mem_filter.mp hi).2
      have hdj : dist center (L.points j) = r := (Finset.mem_filter.mp hj).2
      have hlt := hmono hji_lt
      rw [hdj, hdi] at hlt
      exact (False.elim (lt_irrefl r hlt))
theorem card_support_filter_eqDist_le_one
    (center : ℝ²) (L : OrderedSideChain m)
    (hmono : ∀ {i j : Fin m}, i < j → dist center (L.points i) < dist center (L.points j))
    (r : ℝ) :
    (L.support.filter (fun x => dist center x = r)).card ≤ 1 := by
  classical
  have hrepr :
      L.support.filter (fun x => dist center x = r)
        = (Finset.univ.filter (fun i => dist center (L.points i) = r)).image L.points := by
    ext x
    constructor
    · intro hx
      rcases Finset.mem_filter.mp hx with ⟨hx_support, hx_dist⟩
      rcases (mem_support_iff.mp hx_support) with ⟨i, rfl⟩
      exact Finset.mem_image.mpr ⟨i, Finset.mem_filter.mpr ⟨Finset.mem_univ _, hx_dist⟩, rfl⟩
    · intro hx
      rcases Finset.mem_image.mp hx with ⟨i, hi, rfl⟩
      exact Finset.mem_filter.mpr ⟨mem_support_iff.mpr ⟨i, rfl⟩, (Finset.mem_filter.mp hi).2⟩
  rw [hrepr]
  rw [Finset.card_image_of_injective _ L.injective]
  exact b3n9m044_card_filter_eqDist_le_one center L hmono r
theorem card_le_one_of_subset_sameRadius
    (center : ℝ²) (L : OrderedSideChain m)
    (hmono : ∀ {i j : Fin m}, i < j → dist center (L.points i) < dist center (L.points j))
    {T : Finset ℝ²} (r : ℝ)
    (hsub : T ⊆ L.support)
    (hrad : ∀ x ∈ T, dist center x = r) :
    T.card ≤ 1 := by
  have hsub' : T ⊆ L.support.filter (fun x => dist center x = r) := by
    intro x hx
    exact Finset.mem_filter.mpr ⟨hsub hx, hrad x hx⟩
  exact le_trans (Finset.card_le_card hsub') (card_support_filter_eqDist_le_one center L hmono r)
end OrderedSideChain
noncomputable def OrderedSideChain.ofOrderedCap {m : ℕ}
    (L : Problem97.CGN.OrderedCap m) : OrderedSideChain m where
  points := L.points
  injective := L.injective
@[simp] theorem OrderedSideChain.ofOrderedCap_points {m : ℕ}
    (L : Problem97.CGN.OrderedCap m) (i : Fin m) :
    (OrderedSideChain.ofOrderedCap L).points i = L.points i := rfl
noncomputable def OrderedSideChain.ofOrderedCapRev {m : ℕ}
    (L : Problem97.CGN.OrderedCap m) : OrderedSideChain m where
  points := fun i => L.points i.rev
  injective := by
    intro i j hij
    apply Fin.rev_injective
    exact L.injective hij
@[simp] theorem OrderedSideChain.ofOrderedCapRev_points {m : ℕ}
    (L : Problem97.CGN.OrderedCap m) (i : Fin m) :
    (OrderedSideChain.ofOrderedCapRev L).points i = L.points i.rev := rfl
@[simp] theorem OrderedSideChain.mem_support_ofOrderedCapRev_iff {m : ℕ}
    (L : Problem97.CGN.OrderedCap m) {x : ℝ²} :
    x ∈ (OrderedSideChain.ofOrderedCapRev L).support ↔ ∃ i : Fin m, L.points i = x := by
  constructor
  · intro hx
    rcases OrderedSideChain.mem_support_iff.mp hx with ⟨i, hi⟩
    refine ⟨i.rev, ?_⟩
    simpa using hi
  · intro hx
    rcases hx with ⟨i, hi⟩
    refine OrderedSideChain.mem_support_iff.mpr ⟨i.rev, ?_⟩
    simpa using hi
@[simp] theorem OrderedSideChain.support_ofOrderedCapRev {m : ℕ}
    (L : Problem97.CGN.OrderedCap m) :
    (OrderedSideChain.ofOrderedCapRev L).support = Finset.univ.image L.points := by
  ext x
  constructor
  · intro hx
    rcases (OrderedSideChain.mem_support_ofOrderedCapRev_iff (L := L)).1 hx with ⟨i, hi⟩
    exact Finset.mem_image.mpr ⟨i, Finset.mem_univ _, hi⟩
  · intro hx
    rcases Finset.mem_image.mp hx with ⟨i, -, hi⟩
    exact (OrderedSideChain.mem_support_ofOrderedCapRev_iff (L := L)).2 ⟨i, hi⟩
abbrev E3L20a_leftEndpoint_capDistance_strict
    (center : ℝ²) {m : ℕ} (L : OrderedSideChain m) : Prop :=
  ∀ {i j : Fin m}, i < j → dist center (L.points i) < dist center (L.points j)
abbrev E3L20b_rightEndpoint_capDistance_strict
    (center : ℝ²) {m : ℕ} (L : OrderedSideChain m) : Prop :=
  ∀ {i j : Fin m}, i < j → dist center (L.points i) < dist center (L.points j)
theorem b3n9m044_strict_from_first_of_cgnCapData
    {A : Finset ℝ²} {m : ℕ} {L : Problem97.CGN.OrderedCap m}
    (Packet : Problem97.CGN.MecCapPacket A L)
    (Hside : Problem97.CGN.MinorCapSideHypotheses Packet)
    (Hord : Problem97.CGN.StrictCapOrder A L) :
    E3L20a_leftEndpoint_capDistance_strict
      (L.points (Problem97.CGN.firstIndex Packet.hm))
      (OrderedSideChain.ofOrderedCap L) := by
  classical
  obtain ⟨T, hT, tau, hModelT⟩ :=
    Problem97.CGN.CGN6norm_minorCapChainModel_of_mecCapPacket Packet Hside Hord
  let LT : Problem97.CGN.OrderedCap m := L.map T hT
  let ModelT : Problem97.CGN.MinorCapChainModel LT := Classical.choice hModelT
  intro i j hij
  by_cases hi0 : i = Problem97.CGN.firstIndex Packet.hm
  · subst hi0
    have hne : L.points (Problem97.CGN.firstIndex Packet.hm) ≠ L.points j := by
      intro h
      exact (ne_of_lt hij) (L.injective h)
    have hdist_pos : 0 < dist (L.points (Problem97.CGN.firstIndex Packet.hm)) (L.points j) :=
      dist_pos.mpr hne
    simpa [OrderedSideChain.ofOrderedCap] using hdist_pos
  · have hi_val_ne_zero : i.val ≠ 0 := by
      intro hi_val_zero
      apply hi0
      ext
      simpa [Problem97.CGN.firstIndex, Problem97.CGN.finIndex] using hi_val_zero
    have h0i_val : 0 < i.val := Nat.pos_of_ne_zero hi_val_ne_zero
    have h0i : Problem97.CGN.firstIndex Packet.hm < i := by
      exact Fin.lt_def.mpr (by
        simpa [Problem97.CGN.firstIndex, Problem97.CGN.finIndex] using h0i_val)
    have hi0eq : Problem97.CGN.firstIndex Packet.hm =
        Problem97.CGN.finIndex m 0 (by
          have hm : 2 ≤ m := ModelT.coords.hm
          omega) := by
      ext
      simp [Problem97.CGN.firstIndex, Problem97.CGN.finIndex]
    have himg :
        dist (T (L.points (Problem97.CGN.firstIndex Packet.hm))) (T (L.points i)) <
          dist (T (L.points (Problem97.CGN.firstIndex Packet.hm))) (T (L.points j)) := by
      simpa [LT, Problem97.CGN.OrderedCap.map_points] using
        (Problem97.CGN.CGN6c_dist_strict_from_first
          (M := ModelT) (i0 := Problem97.CGN.firstIndex Packet.hm) hi0eq
          (r := i) (s := j) h0i hij)
    have horig :
        dist (L.points (Problem97.CGN.firstIndex Packet.hm)) (L.points i) <
          dist (L.points (Problem97.CGN.firstIndex Packet.hm)) (L.points j) := by
      rw [tau.dist_image, tau.dist_image] at himg
      nlinarith only [himg, tau.scale_pos]
    simpa [OrderedSideChain.ofOrderedCap] using horig
theorem b3n9m044_strict_from_last_of_cgnCapData
    {A : Finset ℝ²} {m : ℕ} {L : Problem97.CGN.OrderedCap m}
    (Packet : Problem97.CGN.MecCapPacket A L)
    (Hside : Problem97.CGN.MinorCapSideHypotheses Packet)
    (Hord : Problem97.CGN.StrictCapOrder A L) :
    E3L20b_rightEndpoint_capDistance_strict
      (L.points (Problem97.CGN.lastIndex Packet.hm))
      (OrderedSideChain.ofOrderedCapRev L) := by
  classical
  obtain ⟨T, hT, tau, hModelT⟩ :=
    Problem97.CGN.CGN6norm_minorCapChainModel_of_mecCapPacket Packet Hside Hord
  let LT : Problem97.CGN.OrderedCap m := L.map T hT
  let ModelT : Problem97.CGN.MinorCapChainModel LT := Classical.choice hModelT
  intro i j hij
  by_cases hi0 : i = Problem97.CGN.firstIndex Packet.hm
  · subst hi0
    have hj0 : j ≠ Problem97.CGN.firstIndex Packet.hm := ne_of_gt hij
    have hj_val_ne_zero : j.val ≠ 0 := by
      intro hj_val_zero
      apply hj0
      ext
      simpa [Problem97.CGN.firstIndex] using hj_val_zero
    have hrev_last : (Problem97.CGN.firstIndex Packet.hm).rev =
        Problem97.CGN.lastIndex Packet.hm := by
      ext
      simp [Problem97.CGN.firstIndex, Problem97.CGN.lastIndex, Fin.val_rev]
    have hne : L.points (Problem97.CGN.lastIndex Packet.hm) ≠ L.points j.rev := by
      intro h
      have hidx : j.rev = Problem97.CGN.lastIndex Packet.hm := L.injective h.symm
      have hidx_val : (j.rev).val = (Problem97.CGN.lastIndex Packet.hm).val := congrArg Fin.val hidx
      rw [Fin.val_rev, Problem97.CGN.lastIndex_val] at hidx_val
      have hj_val_zero : j.val = 0 := by omega
      exact hj_val_ne_zero hj_val_zero
    have hdist_pos : 0 < dist (L.points (Problem97.CGN.lastIndex Packet.hm)) (L.points j.rev) :=
      dist_pos.mpr hne
    rw [show (OrderedSideChain.ofOrderedCapRev L).points (Problem97.CGN.firstIndex Packet.hm) =
        L.points (Problem97.CGN.lastIndex Packet.hm) by
          simpa [OrderedSideChain.ofOrderedCapRev_points] using congrArg L.points hrev_last]
    simpa [OrderedSideChain.ofOrderedCapRev_points] using hdist_pos
  · have hi_val_ne_zero : i.val ≠ 0 := by
      intro hi_val_zero
      apply hi0
      ext
      simpa [Problem97.CGN.firstIndex] using hi_val_zero
    have hrev_lt : j.rev < i.rev := by
      apply Fin.lt_def.mpr
      have hij_val : i.val < j.val := Fin.lt_def.mp hij
      rw [Fin.val_rev, Fin.val_rev]
      omega
    have hi_rev_lt_last : i.rev < Problem97.CGN.lastIndex Packet.hm := by
      apply Fin.lt_def.mpr
      rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
      omega
    have hjmeq : Problem97.CGN.lastIndex Packet.hm =
        Problem97.CGN.finIndex m (m - 1) (by
          have hm : 2 ≤ m := ModelT.coords.hm
          omega) := by
      ext
      simp [Problem97.CGN.lastIndex, Problem97.CGN.finIndex]
    have himg :
        dist (T (L.points (Problem97.CGN.lastIndex Packet.hm))) (T (L.points i.rev)) <
          dist (T (L.points (Problem97.CGN.lastIndex Packet.hm))) (T (L.points j.rev)) := by
      simpa [LT, Problem97.CGN.OrderedCap.map_points] using
        (Problem97.CGN.CGN6c_dist_strict_from_last
          (M := ModelT) (jm := Problem97.CGN.lastIndex Packet.hm) hjmeq
          (r := j.rev) (s := i.rev) hrev_lt hi_rev_lt_last)
    have horig :
        dist (L.points (Problem97.CGN.lastIndex Packet.hm)) (L.points i.rev) <
          dist (L.points (Problem97.CGN.lastIndex Packet.hm)) (L.points j.rev) := by
      rw [tau.dist_image, tau.dist_image] at himg
      nlinarith only [himg, tau.scale_pos]
    simpa [OrderedSideChain.ofOrderedCapRev_points] using horig
theorem E3L20a_of_cgnCapData
    {A : Finset ℝ²} {m : ℕ} {L : Problem97.CGN.OrderedCap m}
    (Packet : Problem97.CGN.MecCapPacket A L)
    (Hside : Problem97.CGN.MinorCapSideHypotheses Packet)
    (Hord : Problem97.CGN.StrictCapOrder A L) :
    E3L20a_leftEndpoint_capDistance_strict
      (L.points (Problem97.CGN.firstIndex Packet.hm))
      (OrderedSideChain.ofOrderedCap L) :=
  b3n9m044_strict_from_first_of_cgnCapData Packet Hside Hord
theorem E3L20b_of_cgnCapData
    {A : Finset ℝ²} {m : ℕ} {L : Problem97.CGN.OrderedCap m}
    (Packet : Problem97.CGN.MecCapPacket A L)
    (Hside : Problem97.CGN.MinorCapSideHypotheses Packet)
    (Hord : Problem97.CGN.StrictCapOrder A L) :
    E3L20b_rightEndpoint_capDistance_strict
      (L.points (Problem97.CGN.lastIndex Packet.hm))
      (OrderedSideChain.ofOrderedCapRev L) :=
  b3n9m044_strict_from_last_of_cgnCapData Packet Hside Hord
theorem one_hit_sameRadius_at_v2_of_supportCap
    {A C : Finset ℝ²} {M : Problem97.MoserTriangle A}
    (hA : Problem97.ConvexIndep A)
    (hnoncoll : ¬ Collinear ℝ (A : Set ℝ²))
    (hC_subset : C ⊆ A)
    (hC_arc : ∀ x ∈ A, x ∈ C ↔ Problem97.OnArcOpposite M.v1 M.v2 M.v3 x)
    (hv_mem : M.v2 ∈ C)
    (hw_mem : M.v3 ∈ C)
    (P : Problem97.CircumscribedMECPacket A M)
    (hacute : 0 ≤ ⟪M.v2 - M.v1, M.v3 - M.v1⟫_ℝ)
    {S : Finset ℝ²} {r : ℝ}
    (hsub : S ⊆ C)
    (hrad : ∀ x ∈ S, dist M.v2 x = r) :
    S.card ≤ 1 := by
  classical
  rcases Problem97.CGN.CGN4g_capData_of_supportCap_oriented
      (A := A) (C := C) (M := M) hA hnoncoll hC_subset hC_arc hv_mem hw_mem P hacute with
    ⟨m, L, Packet, Hside, Hord, hLC, hEnds⟩
  rcases hEnds with hFirstLast | hLastFirst
  · have hmono :
        E3L20a_leftEndpoint_capDistance_strict
          (L.points (Problem97.CGN.firstIndex Packet.hm))
          (OrderedSideChain.ofOrderedCap L) := by
      intro i j hij
      exact E3L20a_of_cgnCapData Packet Hside Hord hij
    have hsubL : S ⊆ (OrderedSideChain.ofOrderedCap L).support := by
      intro x hx
      simpa [OrderedSideChain.support, OrderedSideChain.ofOrderedCap, hLC] using hsub hx
    have hradL : ∀ x ∈ S, dist (L.points (Problem97.CGN.firstIndex Packet.hm)) x = r := by
      intro x hx
      simpa [hFirstLast.1] using hrad x hx
    exact OrderedSideChain.card_le_one_of_subset_sameRadius
      (L.points (Problem97.CGN.firstIndex Packet.hm))
      (OrderedSideChain.ofOrderedCap L) hmono r hsubL hradL
  · have hmono :
        E3L20b_rightEndpoint_capDistance_strict
          (L.points (Problem97.CGN.lastIndex Packet.hm))
          (OrderedSideChain.ofOrderedCapRev L) := by
      intro i j hij
      exact E3L20b_of_cgnCapData Packet Hside Hord hij
    have hsubL : S ⊆ (OrderedSideChain.ofOrderedCapRev L).support := by
      intro x hx
      rw [OrderedSideChain.support_ofOrderedCapRev, hLC]
      exact hsub hx
    have hradL : ∀ x ∈ S, dist (L.points (Problem97.CGN.lastIndex Packet.hm)) x = r := by
      intro x hx
      simpa [hLastFirst.2] using hrad x hx
    exact OrderedSideChain.card_le_one_of_subset_sameRadius
      (L.points (Problem97.CGN.lastIndex Packet.hm))
      (OrderedSideChain.ofOrderedCapRev L) hmono r hsubL hradL
theorem one_hit_sameRadius_at_v3_of_supportCap
    {A C : Finset ℝ²} {M : Problem97.MoserTriangle A}
    (hA : Problem97.ConvexIndep A)
    (hnoncoll : ¬ Collinear ℝ (A : Set ℝ²))
    (hC_subset : C ⊆ A)
    (hC_arc : ∀ x ∈ A, x ∈ C ↔ Problem97.OnArcOpposite M.v1 M.v2 M.v3 x)
    (hv_mem : M.v2 ∈ C)
    (hw_mem : M.v3 ∈ C)
    (P : Problem97.CircumscribedMECPacket A M)
    (hacute : 0 ≤ ⟪M.v2 - M.v1, M.v3 - M.v1⟫_ℝ)
    {S : Finset ℝ²} {r : ℝ}
    (hsub : S ⊆ C)
    (hrad : ∀ x ∈ S, dist M.v3 x = r) :
    S.card ≤ 1 := by
  classical
  rcases Problem97.CGN.CGN4g_capData_of_supportCap_oriented
      (A := A) (C := C) (M := M) hA hnoncoll hC_subset hC_arc hv_mem hw_mem P hacute with
    ⟨m, L, Packet, Hside, Hord, hLC, hEnds⟩
  rcases hEnds with hFirstLast | hLastFirst
  · have hmono :
        E3L20b_rightEndpoint_capDistance_strict
          (L.points (Problem97.CGN.lastIndex Packet.hm))
          (OrderedSideChain.ofOrderedCapRev L) := by
      intro i j hij
      exact E3L20b_of_cgnCapData Packet Hside Hord hij
    have hsubL : S ⊆ (OrderedSideChain.ofOrderedCapRev L).support := by
      intro x hx
      rw [OrderedSideChain.support_ofOrderedCapRev, hLC]
      exact hsub hx
    have hradL : ∀ x ∈ S, dist (L.points (Problem97.CGN.lastIndex Packet.hm)) x = r := by
      intro x hx
      simpa [hFirstLast.2] using hrad x hx
    exact OrderedSideChain.card_le_one_of_subset_sameRadius
      (L.points (Problem97.CGN.lastIndex Packet.hm))
      (OrderedSideChain.ofOrderedCapRev L) hmono r hsubL hradL
  · have hmono :
        E3L20a_leftEndpoint_capDistance_strict
          (L.points (Problem97.CGN.firstIndex Packet.hm))
          (OrderedSideChain.ofOrderedCap L) := by
      intro i j hij
      exact E3L20a_of_cgnCapData Packet Hside Hord hij
    have hsubL : S ⊆ (OrderedSideChain.ofOrderedCap L).support := by
      intro x hx
      simpa [OrderedSideChain.support, OrderedSideChain.ofOrderedCap, hLC] using hsub hx
    have hradL : ∀ x ∈ S, dist (L.points (Problem97.CGN.firstIndex Packet.hm)) x = r := by
      intro x hx
      simpa [hLastFirst.1] using hrad x hx
    exact OrderedSideChain.card_le_one_of_subset_sameRadius
      (L.points (Problem97.CGN.firstIndex Packet.hm))
      (OrderedSideChain.ofOrderedCap L) hmono r hsubL hradL
end FiniteEndpoint
end Problem97
end Batch3N9
end Batch3N9Unit044

-- Original module: Solutions.Batch3N9.N9Endpoint.Shell
section Batch3N9Unit045
set_option backward.isDefEq.respectTransparency false
namespace Batch3N9
open scoped EuclideanGeometry
open scoped InnerProductSpace
open Finset
namespace Problem97
namespace FiniteEndpointShell
theorem hcapSum
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.CP.C1.card + S.CP.C2.card + S.CP.C3.card = A.card + 3 := by
  rw [S.hcard9]
  norm_num [S.hcapSum12]
theorem k4_at_v1
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    HasNEquidistantPointsAt 4 A S.MT.toMoserTriangle.v1 :=
  S.hK4 _ S.MT.toMoserTriangle.v1_mem
theorem k4_at_v2
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    HasNEquidistantPointsAt 4 A S.MT.toMoserTriangle.v2 :=
  S.hK4 _ S.MT.toMoserTriangle.v2_mem
theorem k4_at_v3
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    HasNEquidistantPointsAt 4 A S.MT.toMoserTriangle.v3 :=
  S.hK4 _ S.MT.toMoserTriangle.v3_mem
theorem I1_card_ge_two
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    2 ≤ S.I1.card := by
  classical
  rcases S.k4_at_v1 with ⟨r, hrpos, hTcard⟩
  let T : Finset ℝ² := A.filter (fun x => dist S.triangle.v1 x = r)
  have hv1_not_mem_T : S.triangle.v1 ∉ T := by
    intro hv1T
    have hv1eq : dist S.triangle.v1 S.triangle.v1 = r := (Finset.mem_filter.mp hv1T).2
    have h0r : (0 : ℝ) = r := by simpa using hv1eq
    nlinarith only [hrpos, h0r]
  have hC2_one : (T ∩ S.CP.C2).card ≤ 1 := by
    apply Problem97.FiniteEndpoint.one_hit_sameRadius_at_v3_of_supportCap
      (A := A) (C := S.CP.C2) (M := S.triangle2)
      S.hconv S.hnoncol S.CP.C2_subset
      (fun x hxA => (S.CP.arc_membership x hxA).2.1)
      S.CP.v3_mem_C2 S.CP.v1_mem_C2 S.packet2 S.packet2.inner_at_v1
      (S := T ∩ S.CP.C2) (r := r)
    · exact Finset.inter_subset_right
    · intro x hx
      exact (Finset.mem_filter.mp (Finset.mem_of_mem_inter_left hx)).2
  have hC3_one : (T ∩ S.CP.C3).card ≤ 1 := by
    apply Problem97.FiniteEndpoint.one_hit_sameRadius_at_v2_of_supportCap
      (A := A) (C := S.CP.C3) (M := S.triangle3)
      S.hconv S.hnoncol S.CP.C3_subset
      (fun x hxA => (S.CP.arc_membership x hxA).2.2)
      S.CP.v1_mem_C3 S.CP.v2_mem_C3 S.packet3 S.packet3.inner_at_v1
      (S := T ∩ S.CP.C3) (r := r)
    · exact Finset.inter_subset_right
    · intro x hx
      exact (Finset.mem_filter.mp (Finset.mem_of_mem_inter_left hx)).2
  have hcover :
      T \ S.I1 ⊆ (T ∩ S.CP.C2) ∪ (T ∩ S.CP.C3) := by
    intro x hx
    rcases Finset.mem_sdiff.mp hx with ⟨hxT, hxnotI1⟩
    have hxA : x ∈ A := (Finset.mem_filter.mp hxT).1
    by_cases hxv3 : x = S.triangle.v3
    · apply Finset.mem_union_left
      exact Finset.mem_inter.mpr ⟨hxT, by simpa [hxv3] using S.CP.v3_mem_C2⟩
    by_cases hxv2 : x = S.triangle.v2
    · apply Finset.mem_union_right
      exact Finset.mem_inter.mpr ⟨hxT, by simpa [hxv2] using S.CP.v2_mem_C3⟩
    by_cases hxv1 : x = S.triangle.v1
    · exact False.elim (hv1_not_mem_T (hxv1 ▸ hxT))
    have hxnonmoser : x ∉ S.triangle.verts := by
      simp [Problem97.MoserTriangle.verts, hxv1, hxv2, hxv3]
    have hxnotC1 : x ∉ S.CP.C1 := by
      intro hxC1
      have hxI1 : x ∈ S.I1 := by
        unfold I1
        exact Finset.mem_erase.mpr ⟨hxv3, Finset.mem_erase.mpr ⟨hxv2, hxC1⟩⟩
      exact hxnotI1 hxI1
    have hone := S.CP.nonmoser_in_one x hxA hxnonmoser
    by_cases hxC2 : x ∈ S.CP.C2
    · apply Finset.mem_union_left
      exact Finset.mem_inter.mpr ⟨hxT, hxC2⟩
    · have hxC3 : x ∈ S.CP.C3 := by
        by_cases hxC3 : x ∈ S.CP.C3
        · exact hxC3
        · have : (0 : ℕ) = 1 := by
            simpa [hxnotC1, hxC2, hxC3] using hone
          omega
      apply Finset.mem_union_right
      exact Finset.mem_inter.mpr ⟨hxT, hxC3⟩
  have houtside_le :
      (T \ S.I1).card ≤ 2 := by
    calc
      (T \ S.I1).card ≤ ((T ∩ S.CP.C2) ∪ (T ∩ S.CP.C3)).card := Finset.card_le_card hcover
      _ ≤ (T ∩ S.CP.C2).card + (T ∩ S.CP.C3).card := Finset.card_union_le _ _
      _ ≤ 1 + 1 := by omega
      _ = 2 := by norm_num
  have hsplit : (T \ S.I1).card + (T ∩ S.I1).card = T.card := by
    simpa [Finset.inter_comm] using Finset.card_sdiff_add_card_inter T S.I1
  have hinter_le : (T ∩ S.I1).card ≤ S.I1.card := Finset.card_le_card Finset.inter_subset_right
  have hTfour : 4 ≤ T.card := by
    show 4 ≤ (A.filter (fun q => dist S.MT.toMoserTriangle.v1 q = r)).card
    exact hTcard
  omega
theorem I2_card_ge_two
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    2 ≤ S.I2.card := by
  classical
  rcases S.k4_at_v2 with ⟨r, hrpos, hTcard⟩
  let T : Finset ℝ² := A.filter (fun x => dist S.triangle.v2 x = r)
  have hv2_not_mem_T : S.triangle.v2 ∉ T := by
    intro hv2T
    have hv2eq : dist S.triangle.v2 S.triangle.v2 = r := (Finset.mem_filter.mp hv2T).2
    have h0r : (0 : ℝ) = r := by simpa using hv2eq
    nlinarith only [hrpos, h0r]
  have hC1_one : (T ∩ S.CP.C1).card ≤ 1 := by
    apply Problem97.FiniteEndpoint.one_hit_sameRadius_at_v2_of_supportCap
      (A := A) (C := S.CP.C1) (M := S.triangle)
      S.hconv S.hnoncol S.CP.C1_subset
      (fun x hxA => (S.CP.arc_membership x hxA).1)
      S.CP.v2_mem_C1 S.CP.v3_mem_C1 S.Packet S.Packet.inner_at_v1
      (S := T ∩ S.CP.C1) (r := r)
    · exact Finset.inter_subset_right
    · intro x hx
      simpa using (Finset.mem_filter.mp (Finset.mem_of_mem_inter_left hx)).2
  have hC3_one : (T ∩ S.CP.C3).card ≤ 1 := by
    apply Problem97.FiniteEndpoint.one_hit_sameRadius_at_v3_of_supportCap
      (A := A) (C := S.CP.C3) (M := S.triangle3)
      S.hconv S.hnoncol S.CP.C3_subset
      (fun x hxA => (S.CP.arc_membership x hxA).2.2)
      S.CP.v1_mem_C3 S.CP.v2_mem_C3 S.packet3 S.packet3.inner_at_v1
      (S := T ∩ S.CP.C3) (r := r)
    · exact Finset.inter_subset_right
    · intro x hx
      exact (Finset.mem_filter.mp (Finset.mem_of_mem_inter_left hx)).2
  have hcover :
      T \ S.I2 ⊆ (T ∩ S.CP.C1) ∪ (T ∩ S.CP.C3) := by
    intro x hx
    rcases Finset.mem_sdiff.mp hx with ⟨hxT, hxnotI2⟩
    have hxA : x ∈ A := (Finset.mem_filter.mp hxT).1
    by_cases hxv1 : x = S.triangle.v1
    · apply Finset.mem_union_right
      exact Finset.mem_inter.mpr ⟨hxT, by simpa [hxv1] using S.CP.v1_mem_C3⟩
    by_cases hxv3 : x = S.triangle.v3
    · apply Finset.mem_union_left
      exact Finset.mem_inter.mpr ⟨hxT, by simpa [hxv3] using S.CP.v3_mem_C1⟩
    by_cases hxv2 : x = S.triangle.v2
    · exact False.elim (hv2_not_mem_T (hxv2 ▸ hxT))
    have hxnonmoser : x ∉ S.triangle.verts := by
      simp [Problem97.MoserTriangle.verts, hxv1, hxv2, hxv3]
    have hxnotC2 : x ∉ S.CP.C2 := by
      intro hxC2
      have hxI2 : x ∈ S.I2 := by
        unfold I2
        exact Finset.mem_erase.mpr ⟨hxv1, Finset.mem_erase.mpr ⟨hxv3, hxC2⟩⟩
      exact hxnotI2 hxI2
    have hone := S.CP.nonmoser_in_one x hxA hxnonmoser
    by_cases hxC1 : x ∈ S.CP.C1
    · apply Finset.mem_union_left
      exact Finset.mem_inter.mpr ⟨hxT, hxC1⟩
    · have hxC3 : x ∈ S.CP.C3 := by
        by_cases hxC3 : x ∈ S.CP.C3
        · exact hxC3
        · have : (0 : ℕ) = 1 := by
            simpa [hxC1, hxnotC2, hxC3] using hone
          omega
      apply Finset.mem_union_right
      exact Finset.mem_inter.mpr ⟨hxT, hxC3⟩
  have houtside_le :
      (T \ S.I2).card ≤ 2 := by
    calc
      (T \ S.I2).card ≤ ((T ∩ S.CP.C1) ∪ (T ∩ S.CP.C3)).card := Finset.card_le_card hcover
      _ ≤ (T ∩ S.CP.C1).card + (T ∩ S.CP.C3).card := Finset.card_union_le _ _
      _ ≤ 1 + 1 := by omega
      _ = 2 := by norm_num
  have hsplit : (T \ S.I2).card + (T ∩ S.I2).card = T.card := by
    simpa [Finset.inter_comm] using Finset.card_sdiff_add_card_inter T S.I2
  have hinter_le : (T ∩ S.I2).card ≤ S.I2.card := Finset.card_le_card Finset.inter_subset_right
  have hTfour : 4 ≤ T.card := by
    show 4 ≤ (A.filter (fun q => dist S.MT.toMoserTriangle.v2 q = r)).card
    exact hTcard
  omega
theorem I3_card_ge_two
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    2 ≤ S.I3.card := by
  classical
  rcases S.k4_at_v3 with ⟨r, hrpos, hTcard⟩
  let T : Finset ℝ² := A.filter (fun x => dist S.triangle.v3 x = r)
  have hv3_not_mem_T : S.triangle.v3 ∉ T := by
    intro hv3T
    have hv3eq : dist S.triangle.v3 S.triangle.v3 = r := (Finset.mem_filter.mp hv3T).2
    have h0r : (0 : ℝ) = r := by simpa using hv3eq
    nlinarith only [hrpos, h0r]
  have hC1_one : (T ∩ S.CP.C1).card ≤ 1 := by
    apply Problem97.FiniteEndpoint.one_hit_sameRadius_at_v3_of_supportCap
      (A := A) (C := S.CP.C1) (M := S.triangle)
      S.hconv S.hnoncol S.CP.C1_subset
      (fun x hxA => (S.CP.arc_membership x hxA).1)
      S.CP.v2_mem_C1 S.CP.v3_mem_C1 S.Packet S.Packet.inner_at_v1
      (S := T ∩ S.CP.C1) (r := r)
    · exact Finset.inter_subset_right
    · intro x hx
      simpa using (Finset.mem_filter.mp (Finset.mem_of_mem_inter_left hx)).2
  have hC2_one : (T ∩ S.CP.C2).card ≤ 1 := by
    apply Problem97.FiniteEndpoint.one_hit_sameRadius_at_v2_of_supportCap
      (A := A) (C := S.CP.C2) (M := S.triangle2)
      S.hconv S.hnoncol S.CP.C2_subset
      (fun x hxA => (S.CP.arc_membership x hxA).2.1)
      S.CP.v3_mem_C2 S.CP.v1_mem_C2 S.packet2 S.packet2.inner_at_v1
      (S := T ∩ S.CP.C2) (r := r)
    · exact Finset.inter_subset_right
    · intro x hx
      exact (Finset.mem_filter.mp (Finset.mem_of_mem_inter_left hx)).2
  have hcover :
      T \ S.I3 ⊆ (T ∩ S.CP.C1) ∪ (T ∩ S.CP.C2) := by
    intro x hx
    rcases Finset.mem_sdiff.mp hx with ⟨hxT, hxnotI3⟩
    have hxA : x ∈ A := (Finset.mem_filter.mp hxT).1
    by_cases hxv2 : x = S.triangle.v2
    · apply Finset.mem_union_left
      exact Finset.mem_inter.mpr ⟨hxT, by simpa [hxv2] using S.CP.v2_mem_C1⟩
    by_cases hxv1 : x = S.triangle.v1
    · apply Finset.mem_union_right
      exact Finset.mem_inter.mpr ⟨hxT, by simpa [hxv1] using S.CP.v1_mem_C2⟩
    by_cases hxv3 : x = S.triangle.v3
    · exact False.elim (hv3_not_mem_T (hxv3 ▸ hxT))
    have hxnonmoser : x ∉ S.triangle.verts := by
      simp [Problem97.MoserTriangle.verts, hxv1, hxv2, hxv3]
    have hxnotC3 : x ∉ S.CP.C3 := by
      intro hxC3
      have hxI3 : x ∈ S.I3 := by
        unfold I3
        exact Finset.mem_erase.mpr ⟨hxv2, Finset.mem_erase.mpr ⟨hxv1, hxC3⟩⟩
      exact hxnotI3 hxI3
    have hone := S.CP.nonmoser_in_one x hxA hxnonmoser
    by_cases hxC1 : x ∈ S.CP.C1
    · apply Finset.mem_union_left
      exact Finset.mem_inter.mpr ⟨hxT, hxC1⟩
    · have hxC2 : x ∈ S.CP.C2 := by
        by_cases hxC2 : x ∈ S.CP.C2
        · exact hxC2
        · have : (0 : ℕ) = 1 := by
            simpa [hxC1, hxC2, hxnotC3] using hone
          omega
      apply Finset.mem_union_right
      exact Finset.mem_inter.mpr ⟨hxT, hxC2⟩
  have houtside_le :
      (T \ S.I3).card ≤ 2 := by
    calc
      (T \ S.I3).card ≤ ((T ∩ S.CP.C1) ∪ (T ∩ S.CP.C2)).card := Finset.card_le_card hcover
      _ ≤ (T ∩ S.CP.C1).card + (T ∩ S.CP.C2).card := Finset.card_union_le _ _
      _ ≤ 1 + 1 := by omega
      _ = 2 := by norm_num
  have hsplit : (T \ S.I3).card + (T ∩ S.I3).card = T.card := by
    simpa [Finset.inter_comm] using Finset.card_sdiff_add_card_inter T S.I3
  have hinter_le : (T ∩ S.I3).card ≤ S.I3.card := Finset.card_le_card Finset.inter_subset_right
  have hTfour : 4 ≤ T.card := by
    show 4 ≤ (A.filter (fun q => dist S.MT.toMoserTriangle.v3 q = r)).card
    exact hTcard
  omega
theorem I1_card
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.I1.card + 2 = S.CP.C1.card := by
  classical
  obtain ⟨h12, h23, h13, _⟩ := S.hCirc
  have hv3 :
      S.MT.toMoserTriangle.v3 ∈ S.CP.C1.erase S.MT.toMoserTriangle.v2 := by
    exact Finset.mem_erase.mpr ⟨by intro h; exact h23 h.symm, S.CP.v3_mem_C1⟩
  have hC1erase :
      (S.CP.C1.erase S.MT.toMoserTriangle.v2).card = S.CP.C1.card - 1 :=
    Finset.card_erase_of_mem S.CP.v2_mem_C1
  have hI1 :
      S.I1.card = (S.CP.C1.erase S.MT.toMoserTriangle.v2).card - 1 := by
    unfold I1
    exact Finset.card_erase_of_mem hv3
  have hC1_ge_two : 2 ≤ S.CP.C1.card := by
    have hsubset :
        ({S.MT.toMoserTriangle.v2, S.MT.toMoserTriangle.v3} : Finset ℝ²) ⊆ S.CP.C1 := by
      intro x hx
      simp at hx
      rcases hx with rfl | rfl
      · exact S.CP.v2_mem_C1
      · exact S.CP.v3_mem_C1
    have hcard_le := Finset.card_le_card hsubset
    simpa [h23] using hcard_le
  rw [hI1, hC1erase]
  omega
theorem I2_card
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.I2.card + 2 = S.CP.C2.card := by
  classical
  obtain ⟨h12, h23, h13, _⟩ := S.hCirc
  have hv1 :
      S.MT.toMoserTriangle.v1 ∈ S.CP.C2.erase S.MT.toMoserTriangle.v3 := by
    exact Finset.mem_erase.mpr ⟨h13, S.CP.v1_mem_C2⟩
  have hC2erase :
      (S.CP.C2.erase S.MT.toMoserTriangle.v3).card = S.CP.C2.card - 1 :=
    Finset.card_erase_of_mem S.CP.v3_mem_C2
  have hI2 :
      S.I2.card = (S.CP.C2.erase S.MT.toMoserTriangle.v3).card - 1 := by
    unfold I2
    exact Finset.card_erase_of_mem hv1
  have hC2_ge_two : 2 ≤ S.CP.C2.card := by
    have hsubset :
        ({S.MT.toMoserTriangle.v3, S.MT.toMoserTriangle.v1} : Finset ℝ²) ⊆ S.CP.C2 := by
      intro x hx
      simp at hx
      rcases hx with rfl | rfl
      · exact S.CP.v3_mem_C2
      · exact S.CP.v1_mem_C2
    have h31 : S.MT.toMoserTriangle.v3 ≠ S.MT.toMoserTriangle.v1 := by
      intro h
      exact h13 h.symm
    have hpair :
        ({S.MT.toMoserTriangle.v3, S.MT.toMoserTriangle.v1} : Finset ℝ²).card = 2 := by
      simp [h31]
    have hcard_le := Finset.card_le_card hsubset
    rw [hpair] at hcard_le
    exact hcard_le
  rw [hI2, hC2erase]
  omega
theorem I3_card
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.I3.card + 2 = S.CP.C3.card := by
  classical
  obtain ⟨h12, h23, h13, _⟩ := S.hCirc
  have hv2 :
      S.MT.toMoserTriangle.v2 ∈ S.CP.C3.erase S.MT.toMoserTriangle.v1 := by
    exact Finset.mem_erase.mpr ⟨by intro h; exact h12 h.symm, S.CP.v2_mem_C3⟩
  have hC3erase :
      (S.CP.C3.erase S.MT.toMoserTriangle.v1).card = S.CP.C3.card - 1 :=
    Finset.card_erase_of_mem S.CP.v1_mem_C3
  have hI3 :
      S.I3.card = (S.CP.C3.erase S.MT.toMoserTriangle.v1).card - 1 := by
    unfold I3
    exact Finset.card_erase_of_mem hv2
  have hC3_ge_two : 2 ≤ S.CP.C3.card := by
    have hsubset :
        ({S.MT.toMoserTriangle.v1, S.MT.toMoserTriangle.v2} : Finset ℝ²) ⊆ S.CP.C3 := by
      intro x hx
      simp at hx
      rcases hx with rfl | rfl
      · exact S.CP.v1_mem_C3
      · exact S.CP.v2_mem_C3
    have hcard_le := Finset.card_le_card hsubset
    simpa [h12] using hcard_le
  rw [hI3, hC3erase]
  omega
theorem cap1_card_ge_four_of_I1_card_ge_two
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (hI1 : 2 ≤ S.I1.card) :
    4 ≤ S.CP.C1.card := by
  have hcard := S.I1_card
  omega
theorem cap2_card_ge_four_of_I2_card_ge_two
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (hI2 : 2 ≤ S.I2.card) :
    4 ≤ S.CP.C2.card := by
  have hcard := S.I2_card
  omega
theorem cap3_card_ge_four_of_I3_card_ge_two
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (hI3 : 2 ≤ S.I3.card) :
    4 ≤ S.CP.C3.card := by
  have hcard := S.I3_card
  omega
theorem n4b_n5_exact_cap_vector_of_interior_lower_bounds
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (hI1 : 2 ≤ S.I1.card) (hI2 : 2 ≤ S.I2.card) (hI3 : 2 ≤ S.I3.card) :
    S.CP.C1.card = 4 ∧ S.CP.C2.card = 4 ∧ S.CP.C3.card = 4
      ∧ S.I1.card = 2 ∧ S.I2.card = 2 ∧ S.I3.card = 2 := by
  have hC1_ge : 4 ≤ S.CP.C1.card := S.cap1_card_ge_four_of_I1_card_ge_two hI1
  have hC2_ge : 4 ≤ S.CP.C2.card := S.cap2_card_ge_four_of_I2_card_ge_two hI2
  have hC3_ge : 4 ≤ S.CP.C3.card := S.cap3_card_ge_four_of_I3_card_ge_two hI3
  have hsum := S.hcapSum12
  have hC1_eq : S.CP.C1.card = 4 := by
    omega
  have hC2_eq : S.CP.C2.card = 4 := by
    omega
  have hC3_eq : S.CP.C3.card = 4 := by
    omega
  have hI1_eq : S.I1.card = 2 := by
    have hcard := S.I1_card
    omega
  have hI2_eq : S.I2.card = 2 := by
    have hcard := S.I2_card
    omega
  have hI3_eq : S.I3.card = 2 := by
    have hcard := S.I3_card
    omega
  exact ⟨hC1_eq, hC2_eq, hC3_eq, hI1_eq, hI2_eq, hI3_eq⟩
theorem n5_forced_m44_of_interior_lower_bounds
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (hI1 : 2 ≤ S.I1.card) (hI2 : 2 ≤ S.I2.card) (hI3 : 2 ≤ S.I3.card) :
    S.CP.C1.card = 4 ∧ S.CP.C2.card = 4 ∧ S.CP.C3.card = 4 := by
  rcases S.n4b_n5_exact_cap_vector_of_interior_lower_bounds hI1 hI2 hI3 with
    ⟨hC1, hC2, hC3, -, -, -⟩
  exact ⟨hC1, hC2, hC3⟩
theorem n5_forced_m44
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.CP.C1.card = 4 ∧ S.CP.C2.card = 4 ∧ S.CP.C3.card = 4 := by
  exact S.n5_forced_m44_of_interior_lower_bounds
    S.I1_card_ge_two S.I2_card_ge_two S.I3_card_ge_two
end FiniteEndpointShell
end Problem97
end Batch3N9
end Batch3N9Unit045

-- Original module: Solutions.Batch3N9.TwoCircleCrossing
section Batch3N9Unit047
namespace Batch3N9
open scoped EuclideanGeometry
open EuclideanGeometry
namespace Problem97
theorem two_circle_common_point_eq_endpoint
    {s₁ s₂ : Sphere ℝ²} (hs : s₁ ≠ s₂) {p₁ p₂ q : ℝ²} (hp : p₁ ≠ p₂)
    (hp₁s₁ : p₁ ∈ s₁) (hp₂s₁ : p₂ ∈ s₁) (hp₁s₂ : p₁ ∈ s₂) (hp₂s₂ : p₂ ∈ s₂)
    (hqs₁ : q ∈ s₁) (hqs₂ : q ∈ s₂) : q = p₁ ∨ q = p₂ :=
  eq_of_mem_sphere_of_mem_sphere_of_finrank_eq_two
    finrank_euclideanSpace_fin hs hp hp₁s₁ hp₂s₁ hqs₁ hp₁s₂ hp₂s₂ hqs₂
end Problem97
end Batch3N9
end Batch3N9Unit047

-- Original module: Solutions.Batch3N9.ArcBlockContiguity
section Batch3N9Unit048
namespace Batch3N9
open scoped EuclideanGeometry
namespace Problem97
end Problem97
end Batch3N9
end Batch3N9Unit048

-- Original module: Solutions.Batch3N9.U2.WitnessReflectionKernel
section Batch3N9Unit049
namespace Batch3N9
open scoped EuclideanGeometry InnerProductSpace
open EuclideanGeometry
namespace Problem97
theorem inner_sub_centers_eq_zero
    {a b u y : ℝ²} (hua : dist u a = dist y a) (hub : dist u b = dist y b) :
    ⟪u - y, a - b⟫_ℝ = 0 := by
  have h := EuclideanGeometry.inner_vsub_vsub_of_dist_eq_of_dist_eq
    (c₁ := b) (c₂ := a) (p₁ := y) (p₂ := u) (by rw [hub]) (by rw [hua])
  simpa only [vsub_eq_sub, real_inner_comm] using h
theorem twoCircle_midpoint_collinear {q v2 u y : ℝ²} {rq rv : ℝ}
    (huq : dist u q = rq) (hyq : dist y q = rq)
    (huv : dist u v2 = rv) (hyv : dist y v2 = rv)
    (hne : u ≠ y) :
    signedArea2 (midpoint ℝ y u) q v2 = 0 := by
  have huqyq : dist u q = dist y q := huq.trans hyq.symm
  have huvyv : dist u v2 = dist y v2 := huv.trans hyv.symm
  have hum : dist u (midpoint ℝ y u) = dist y (midpoint ℝ y u) := by
    rw [dist_comm u, dist_comm y]; rw [dist_midpoint_left, dist_midpoint_right]
  have hperp1 : ⟪u - y, q - v2⟫_ℝ = 0 := inner_sub_centers_eq_zero huqyq huvyv
  have hperp2 : ⟪u - y, q - midpoint ℝ y u⟫_ℝ = 0 :=
    inner_sub_centers_eq_zero huqyq hum
  have h1 : (u 0 - y 0) * (q 0 - v2 0) + (u 1 - y 1) * (q 1 - v2 1) = 0 := by
    simp [EuclideanSpace.inner_eq_star_dotProduct] at hperp1; linarith
  have h2 : (u 0 - y 0) * (q 0 - (y 0 + u 0) / 2) +
            (u 1 - y 1) * (q 1 - (y 1 + u 1) / 2) = 0 := by
    simp [EuclideanSpace.inner_eq_star_dotProduct, midpoint, AffineMap.lineMap_apply] at hperp2
    linarith
  have hw : u 0 ≠ y 0 ∨ u 1 ≠ y 1 := by
    by_contra hc; push_neg at hc
    exact hne (by ext i; fin_cases i <;> [exact hc.1; exact hc.2])
  set w0 := u 0 - y 0; set w1 := u 1 - y 1
  set p0 := q 0 - v2 0; set p1 := q 1 - v2 1
  set p'0 := q 0 - (y 0 + u 0) / 2; set p'1 := q 1 - (y 1 + u 1) / 2
  have key2 : w0 * (p0 * p'1 - p1 * p'0) = 0 := by linear_combination p'1 * h1 - p1 * h2
  have key1 : w1 * (p0 * p'1 - p1 * p'0) = 0 := by linear_combination p0 * h2 - p'0 * h1
  have hcross : p0 * p'1 - p1 * p'0 = 0 := by
    rcases hw with h | h
    · exact (mul_eq_zero.mp key2).resolve_left (sub_ne_zero.mpr h)
    · exact (mul_eq_zero.mp key1).resolve_left (sub_ne_zero.mpr h)
  have hm0 : (midpoint ℝ y u) 0 = (y 0 + u 0) / 2 := by
    simp [midpoint, AffineMap.lineMap_apply]; ring
  have hm1 : (midpoint ℝ y u) 1 = (y 1 + u 1) / 2 := by
    simp [midpoint, AffineMap.lineMap_apply]; ring
  simp only [signedArea2, hm0, hm1]
  simp only [p0, p1, p'0, p'1] at hcross
  linarith
theorem signedArea2_apex_midpoint (q v2 y u : ℝ²) :
    2 * signedArea2 (midpoint ℝ y u) q v2 = signedArea2 y q v2 + signedArea2 u q v2 := by
  have hm0 : (midpoint ℝ y u) 0 = (y 0 + u 0) / 2 := by
    rw [midpoint_eq_smul_add]; simp; ring
  have hm1 : (midpoint ℝ y u) 1 = (y 1 + u 1) / 2 := by
    rw [midpoint_eq_smul_add]; simp; ring
  simp only [signedArea2, hm0, hm1]; ring
theorem signedArea2_reflection_neg {q v2 y u : ℝ²}
    (hmid : signedArea2 (midpoint ℝ y u) q v2 = 0) :
    signedArea2 u q v2 = - signedArea2 y q v2 := by
  have h := signedArea2_apex_midpoint q v2 y u
  rw [hmid] at h; linarith
end Problem97
end Batch3N9
end Batch3N9Unit049

-- Original module: Solutions.Batch3N9.N4d.TrackBPilotSupport
section Batch3N9Unit050
namespace Batch3N9
open scoped EuclideanGeometry
open EuclideanGeometry
namespace Problem97
end Problem97
end Batch3N9
end Batch3N9Unit050

-- Original module: Solutions.Batch3N9.N9Endpoint.N4e
section Batch3N9Unit051
namespace Batch3N9
open scoped EuclideanGeometry
open Finset
namespace Problem97
namespace FiniteEndpointShell
inductive EscapedForm where
  | a
  | b
  | c
  deriving DecidableEq, Repr
structure ZeroDefectCapLayout {A : Finset ℝ²} (S : FiniteEndpointShell A) where
  a1 : ℝ²
  b1 : ℝ²
  a2 : ℝ²
  b2 : ℝ²
  a3 : ℝ²
  b3 : ℝ²
  hI1 : S.I1 = ({a1, b1} : Finset ℝ²)
  hI2 : S.I2 = ({a2, b2} : Finset ℝ²)
  hI3 : S.I3 = ({a3, b3} : Finset ℝ²)
theorem I1_card_eq_two
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.I1.card = 2 := by
  have hI1 : S.I1.card + 2 = S.CP.C1.card := S.I1_card
  have hC1 : S.CP.C1.card = 4 := (S.n5_forced_m44).1
  omega
theorem I2_card_eq_two
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.I2.card = 2 := by
  have hI2 : S.I2.card + 2 = S.CP.C2.card := S.I2_card
  have hC2 : S.CP.C2.card = 4 := (S.n5_forced_m44).2.1
  omega
theorem I3_card_eq_two
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.I3.card = 2 := by
  have hI3 : S.I3.card + 2 = S.CP.C3.card := S.I3_card
  have hC3 : S.CP.C3.card = 4 := (S.n5_forced_m44).2.2
  omega
noncomputable def zeroDefectCapLayout
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    ZeroDefectCapLayout (S := S) := by
  classical
  have hI1 : ∃ x y : ℝ², x ≠ y ∧ S.I1 = ({x, y} : Finset ℝ²) := by
    simpa [Finset.card_eq_two] using S.I1_card_eq_two
  have hI2 : ∃ x y : ℝ², x ≠ y ∧ S.I2 = ({x, y} : Finset ℝ²) := by
    simpa [Finset.card_eq_two] using S.I2_card_eq_two
  have hI3 : ∃ x y : ℝ², x ≠ y ∧ S.I3 = ({x, y} : Finset ℝ²) := by
    simpa [Finset.card_eq_two] using S.I3_card_eq_two
  choose a1 b1 hab1 hI1eq using hI1
  choose a2 b2 hab2 hI2eq using hI2
  choose a3 b3 hab3 hI3eq using hI3
  exact ⟨a1, b1, a2, b2, a3, b3, hI1eq, hI2eq, hI3eq⟩
theorem b3n9m051_witnessClassAt_v1_sideBounds
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {r : ℝ} :
    ((S.witnessClassAt_v1 r) ∩ S.CP.C2).card ≤ 1
      ∧ ((S.witnessClassAt_v1 r) ∩ S.CP.C3).card ≤ 1 := by
  classical
  constructor
  · apply Problem97.FiniteEndpoint.one_hit_sameRadius_at_v3_of_supportCap
      (A := A) (C := S.CP.C2) (M := S.triangle2)
      S.hconv S.hnoncol S.CP.C2_subset
      (fun x hxA => (S.CP.arc_membership x hxA).2.1)
      S.CP.v3_mem_C2 S.CP.v1_mem_C2 S.packet2 S.packet2.inner_at_v1
      (S := (S.witnessClassAt_v1 r) ∩ S.CP.C2) (r := r)
    · exact Finset.inter_subset_right
    · intro x hx
      exact (Finset.mem_filter.mp (Finset.mem_of_mem_inter_left hx)).2
  · apply Problem97.FiniteEndpoint.one_hit_sameRadius_at_v2_of_supportCap
      (A := A) (C := S.CP.C3) (M := S.triangle3)
      S.hconv S.hnoncol S.CP.C3_subset
      (fun x hxA => (S.CP.arc_membership x hxA).2.2)
      S.CP.v1_mem_C3 S.CP.v2_mem_C3 S.packet3 S.packet3.inner_at_v1
      (S := (S.witnessClassAt_v1 r) ∩ S.CP.C3) (r := r)
    · exact Finset.inter_subset_right
    · intro x hx
      exact (Finset.mem_filter.mp (Finset.mem_of_mem_inter_left hx)).2
theorem b3n9m051_witnessClassAt_v2_sideBounds
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {r : ℝ} :
    ((S.witnessClassAt_v2 r) ∩ S.CP.C1).card ≤ 1
      ∧ ((S.witnessClassAt_v2 r) ∩ S.CP.C3).card ≤ 1 := by
  classical
  constructor
  · apply Problem97.FiniteEndpoint.one_hit_sameRadius_at_v2_of_supportCap
      (A := A) (C := S.CP.C1) (M := S.triangle)
      S.hconv S.hnoncol S.CP.C1_subset
      (fun x hxA => (S.CP.arc_membership x hxA).1)
      S.CP.v2_mem_C1 S.CP.v3_mem_C1 S.Packet S.Packet.inner_at_v1
      (S := (S.witnessClassAt_v2 r) ∩ S.CP.C1) (r := r)
    · exact Finset.inter_subset_right
    · intro x hx
      exact (Finset.mem_filter.mp (Finset.mem_of_mem_inter_left hx)).2
  · apply Problem97.FiniteEndpoint.one_hit_sameRadius_at_v3_of_supportCap
      (A := A) (C := S.CP.C3) (M := S.triangle3)
      S.hconv S.hnoncol S.CP.C3_subset
      (fun x hxA => (S.CP.arc_membership x hxA).2.2)
      S.CP.v1_mem_C3 S.CP.v2_mem_C3 S.packet3 S.packet3.inner_at_v1
      (S := (S.witnessClassAt_v2 r) ∩ S.CP.C3) (r := r)
    · exact Finset.inter_subset_right
    · intro x hx
      exact (Finset.mem_filter.mp (Finset.mem_of_mem_inter_left hx)).2
theorem b3n9m051_witnessClassAt_v3_sideBounds
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {r : ℝ} :
    ((S.witnessClassAt_v3 r) ∩ S.CP.C1).card ≤ 1
      ∧ ((S.witnessClassAt_v3 r) ∩ S.CP.C2).card ≤ 1 := by
  classical
  constructor
  · apply Problem97.FiniteEndpoint.one_hit_sameRadius_at_v3_of_supportCap
      (A := A) (C := S.CP.C1) (M := S.triangle)
      S.hconv S.hnoncol S.CP.C1_subset
      (fun x hxA => (S.CP.arc_membership x hxA).1)
      S.CP.v2_mem_C1 S.CP.v3_mem_C1 S.Packet S.Packet.inner_at_v1
      (S := (S.witnessClassAt_v3 r) ∩ S.CP.C1) (r := r)
    · exact Finset.inter_subset_right
    · intro x hx
      exact (Finset.mem_filter.mp (Finset.mem_of_mem_inter_left hx)).2
  · apply Problem97.FiniteEndpoint.one_hit_sameRadius_at_v2_of_supportCap
      (A := A) (C := S.CP.C2) (M := S.triangle2)
      S.hconv S.hnoncol S.CP.C2_subset
      (fun x hxA => (S.CP.arc_membership x hxA).2.1)
      S.CP.v3_mem_C2 S.CP.v1_mem_C2 S.packet2 S.packet2.inner_at_v1
      (S := (S.witnessClassAt_v3 r) ∩ S.CP.C2) (r := r)
    · exact Finset.inter_subset_right
    · intro x hx
      exact (Finset.mem_filter.mp (Finset.mem_of_mem_inter_left hx)).2
theorem coreSelector_v1
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {r : ℝ}
    (hr : 0 < r) (hcard : 4 ≤ (S.witnessClassAt_v1 r).card) :
    (S.witnessClassAt_v1 r).card = 4 ∧
      S.I1 ⊆ S.witnessClassAt_v1 r ∧
      ((S.witnessClassAt_v1 r) ∩ S.CP.C2).card ≤ 1 ∧
      ((S.witnessClassAt_v1 r) ∩ S.CP.C3).card ≤ 1 := by
  classical
  let T : Finset ℝ² := S.witnessClassAt_v1 r
  have hside := S.b3n9m051_witnessClassAt_v1_sideBounds (r := r)
  rcases hside with ⟨hC2_one, hC3_one⟩
  have hcardT : 4 ≤ T.card := by simpa [T] using hcard
  have hC2_oneT : (T ∩ S.CP.C2).card ≤ 1 := by simpa [T] using hC2_one
  have hC3_oneT : (T ∩ S.CP.C3).card ≤ 1 := by simpa [T] using hC3_one
  have hv1_not_mem_T : S.triangle.v1 ∉ T := by
    intro hv1T
    have hv1eq : dist S.triangle.v1 S.triangle.v1 = r := (Finset.mem_filter.mp hv1T).2
    have h0r : (0 : ℝ) = r := by simpa using hv1eq
    nlinarith only [hr, h0r]
  have hcover :
      T \ S.I1 ⊆ (T ∩ S.CP.C2) ∪ (T ∩ S.CP.C3) := by
    intro x hx
    rcases Finset.mem_sdiff.mp hx with ⟨hxT, hxnotI1⟩
    have hxA : x ∈ A := (Finset.mem_filter.mp hxT).1
    by_cases hxv3 : x = S.triangle.v3
    · apply Finset.mem_union_left
      exact Finset.mem_inter.mpr ⟨hxT, by simpa [hxv3] using S.CP.v3_mem_C2⟩
    by_cases hxv2 : x = S.triangle.v2
    · apply Finset.mem_union_right
      exact Finset.mem_inter.mpr ⟨hxT, by simpa [hxv2] using S.CP.v2_mem_C3⟩
    by_cases hxv1 : x = S.triangle.v1
    · exact False.elim (hv1_not_mem_T (hxv1 ▸ hxT))
    have hxnonmoser : x ∉ S.triangle.verts := by
      simp [Problem97.MoserTriangle.verts, hxv1, hxv2, hxv3]
    have hxnotC1 : x ∉ S.CP.C1 := by
      intro hxC1
      have hxI1 : x ∈ S.I1 := by
        unfold I1
        exact Finset.mem_erase.mpr ⟨hxv3, Finset.mem_erase.mpr ⟨hxv2, hxC1⟩⟩
      exact hxnotI1 hxI1
    have hone := S.CP.nonmoser_in_one x hxA hxnonmoser
    by_cases hxC2 : x ∈ S.CP.C2
    · apply Finset.mem_union_left
      exact Finset.mem_inter.mpr ⟨hxT, hxC2⟩
    · have hxC3 : x ∈ S.CP.C3 := by
        by_cases hxC3 : x ∈ S.CP.C3
        · exact hxC3
        · have : (0 : ℕ) = 1 := by
            simpa [hxnotC1, hxC2, hxC3] using hone
          omega
      apply Finset.mem_union_right
      exact Finset.mem_inter.mpr ⟨hxT, hxC3⟩
  have houtside_le :
      (T \ S.I1).card ≤ 2 := by
    calc
      (T \ S.I1).card ≤ ((T ∩ S.CP.C2) ∪ (T ∩ S.CP.C3)).card := Finset.card_le_card hcover
      _ ≤ (T ∩ S.CP.C2).card + (T ∩ S.CP.C3).card := Finset.card_union_le _ _
      _ ≤ 1 + 1 := by omega
      _ = 2 := by norm_num
  have hsplit : (T \ S.I1).card + (T ∩ S.I1).card = T.card := by
    simpa [T, Finset.inter_comm] using Finset.card_sdiff_add_card_inter T S.I1
  have hinter_le : (T ∩ S.I1).card ≤ S.I1.card := Finset.card_le_card Finset.inter_subset_right
  have hI1_two : S.I1.card = 2 := S.I1_card_eq_two
  have hT_le_four : T.card ≤ 4 := by
    omega
  have hT_eq_four : T.card = 4 := by
    omega
  have hinter_ge : S.I1.card ≤ (T ∩ S.I1).card := by
    omega
  have hI1eq : T ∩ S.I1 = S.I1 := Finset.eq_of_subset_of_card_le Finset.inter_subset_right hinter_ge
  have hI1sub : S.I1 ⊆ T := by
    intro x hx
    have : x ∈ T ∩ S.I1 := by simpa [hI1eq] using hx
    exact Finset.mem_of_mem_inter_left this
  exact ⟨hT_eq_four, hI1sub, hC2_oneT, hC3_oneT⟩
theorem coreSelector_v2
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {r : ℝ}
    (hr : 0 < r) (hcard : 4 ≤ (S.witnessClassAt_v2 r).card) :
    (S.witnessClassAt_v2 r).card = 4 ∧
      S.I2 ⊆ S.witnessClassAt_v2 r ∧
      ((S.witnessClassAt_v2 r) ∩ S.CP.C1).card ≤ 1 ∧
      ((S.witnessClassAt_v2 r) ∩ S.CP.C3).card ≤ 1 := by
  classical
  let T : Finset ℝ² := S.witnessClassAt_v2 r
  have hside := S.b3n9m051_witnessClassAt_v2_sideBounds (r := r)
  rcases hside with ⟨hC1_one, hC3_one⟩
  have hcardT : 4 ≤ T.card := by simpa [T] using hcard
  have hC1_oneT : (T ∩ S.CP.C1).card ≤ 1 := by simpa [T] using hC1_one
  have hC3_oneT : (T ∩ S.CP.C3).card ≤ 1 := by simpa [T] using hC3_one
  have hv2_not_mem_T : S.triangle.v2 ∉ T := by
    intro hv2T
    have hv2eq : dist S.triangle.v2 S.triangle.v2 = r := (Finset.mem_filter.mp hv2T).2
    have h0r : (0 : ℝ) = r := by simpa using hv2eq
    nlinarith only [hr, h0r]
  have hcover :
      T \ S.I2 ⊆ (T ∩ S.CP.C1) ∪ (T ∩ S.CP.C3) := by
    intro x hx
    rcases Finset.mem_sdiff.mp hx with ⟨hxT, hxnotI2⟩
    have hxA : x ∈ A := (Finset.mem_filter.mp hxT).1
    by_cases hxv1 : x = S.triangle.v1
    · apply Finset.mem_union_right
      exact Finset.mem_inter.mpr ⟨hxT, by simpa [hxv1] using S.CP.v1_mem_C3⟩
    by_cases hxv3 : x = S.triangle.v3
    · apply Finset.mem_union_left
      exact Finset.mem_inter.mpr ⟨hxT, by simpa [hxv3] using S.CP.v3_mem_C1⟩
    by_cases hxv2 : x = S.triangle.v2
    · exact False.elim (hv2_not_mem_T (hxv2 ▸ hxT))
    have hxnonmoser : x ∉ S.triangle.verts := by
      simp [Problem97.MoserTriangle.verts, hxv1, hxv2, hxv3]
    have hxnotC2 : x ∉ S.CP.C2 := by
      intro hxC2
      have hxI2 : x ∈ S.I2 := by
        unfold I2
        exact Finset.mem_erase.mpr ⟨hxv1, Finset.mem_erase.mpr ⟨hxv3, hxC2⟩⟩
      exact hxnotI2 hxI2
    have hone := S.CP.nonmoser_in_one x hxA hxnonmoser
    by_cases hxC1 : x ∈ S.CP.C1
    · apply Finset.mem_union_left
      exact Finset.mem_inter.mpr ⟨hxT, hxC1⟩
    · have hxC3 : x ∈ S.CP.C3 := by
        by_cases hxC3 : x ∈ S.CP.C3
        · exact hxC3
        · have : (0 : ℕ) = 1 := by
            simpa [hxC1, hxnotC2, hxC3] using hone
          omega
      apply Finset.mem_union_right
      exact Finset.mem_inter.mpr ⟨hxT, hxC3⟩
  have houtside_le :
      (T \ S.I2).card ≤ 2 := by
    calc
      (T \ S.I2).card ≤ ((T ∩ S.CP.C1) ∪ (T ∩ S.CP.C3)).card := Finset.card_le_card hcover
      _ ≤ (T ∩ S.CP.C1).card + (T ∩ S.CP.C3).card := Finset.card_union_le _ _
      _ ≤ 1 + 1 := by omega
      _ = 2 := by norm_num
  have hsplit : (T \ S.I2).card + (T ∩ S.I2).card = T.card := by
    simpa [T, Finset.inter_comm] using Finset.card_sdiff_add_card_inter T S.I2
  have hinter_le : (T ∩ S.I2).card ≤ S.I2.card := Finset.card_le_card Finset.inter_subset_right
  have hI2_two : S.I2.card = 2 := S.I2_card_eq_two
  have hT_eq_four : T.card = 4 := by
    omega
  have hinter_ge : S.I2.card ≤ (T ∩ S.I2).card := by
    omega
  have hI2eq : T ∩ S.I2 = S.I2 := Finset.eq_of_subset_of_card_le Finset.inter_subset_right hinter_ge
  have hI2sub : S.I2 ⊆ T := by
    intro x hx
    have : x ∈ T ∩ S.I2 := by simpa [hI2eq] using hx
    exact Finset.mem_of_mem_inter_left this
  exact ⟨hT_eq_four, hI2sub, hC1_oneT, hC3_oneT⟩
theorem coreSelector_v3
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {r : ℝ}
    (hr : 0 < r) (hcard : 4 ≤ (S.witnessClassAt_v3 r).card) :
    (S.witnessClassAt_v3 r).card = 4 ∧
      S.I3 ⊆ S.witnessClassAt_v3 r ∧
      ((S.witnessClassAt_v3 r) ∩ S.CP.C1).card ≤ 1 ∧
      ((S.witnessClassAt_v3 r) ∩ S.CP.C2).card ≤ 1 := by
  classical
  let T : Finset ℝ² := S.witnessClassAt_v3 r
  have hside := S.b3n9m051_witnessClassAt_v3_sideBounds (r := r)
  rcases hside with ⟨hC1_one, hC2_one⟩
  have hcardT : 4 ≤ T.card := by simpa [T] using hcard
  have hC1_oneT : (T ∩ S.CP.C1).card ≤ 1 := by simpa [T] using hC1_one
  have hC2_oneT : (T ∩ S.CP.C2).card ≤ 1 := by simpa [T] using hC2_one
  have hv3_not_mem_T : S.triangle.v3 ∉ T := by
    intro hv3T
    have hv3eq : dist S.triangle.v3 S.triangle.v3 = r := (Finset.mem_filter.mp hv3T).2
    have h0r : (0 : ℝ) = r := by simpa using hv3eq
    nlinarith only [hr, h0r]
  have hcover :
      T \ S.I3 ⊆ (T ∩ S.CP.C1) ∪ (T ∩ S.CP.C2) := by
    intro x hx
    rcases Finset.mem_sdiff.mp hx with ⟨hxT, hxnotI3⟩
    have hxA : x ∈ A := (Finset.mem_filter.mp hxT).1
    by_cases hxv2 : x = S.triangle.v2
    · apply Finset.mem_union_left
      exact Finset.mem_inter.mpr ⟨hxT, by simpa [hxv2] using S.CP.v2_mem_C1⟩
    by_cases hxv1 : x = S.triangle.v1
    · apply Finset.mem_union_right
      exact Finset.mem_inter.mpr ⟨hxT, by simpa [hxv1] using S.CP.v1_mem_C2⟩
    by_cases hxv3 : x = S.triangle.v3
    · exact False.elim (hv3_not_mem_T (hxv3 ▸ hxT))
    have hxnonmoser : x ∉ S.triangle.verts := by
      simp [Problem97.MoserTriangle.verts, hxv1, hxv2, hxv3]
    have hxnotC3 : x ∉ S.CP.C3 := by
      intro hxC3
      have hxI3 : x ∈ S.I3 := by
        unfold I3
        exact Finset.mem_erase.mpr ⟨hxv2, Finset.mem_erase.mpr ⟨hxv1, hxC3⟩⟩
      exact hxnotI3 hxI3
    have hone := S.CP.nonmoser_in_one x hxA hxnonmoser
    by_cases hxC1 : x ∈ S.CP.C1
    · apply Finset.mem_union_left
      exact Finset.mem_inter.mpr ⟨hxT, hxC1⟩
    · have hxC2 : x ∈ S.CP.C2 := by
        by_cases hxC2 : x ∈ S.CP.C2
        · exact hxC2
        · have : (0 : ℕ) = 1 := by
            simpa [hxC1, hxC2, hxnotC3] using hone
          omega
      apply Finset.mem_union_right
      exact Finset.mem_inter.mpr ⟨hxT, hxC2⟩
  have houtside_le :
      (T \ S.I3).card ≤ 2 := by
    calc
      (T \ S.I3).card ≤ ((T ∩ S.CP.C1) ∪ (T ∩ S.CP.C2)).card := Finset.card_le_card hcover
      _ ≤ (T ∩ S.CP.C1).card + (T ∩ S.CP.C2).card := Finset.card_union_le _ _
      _ ≤ 1 + 1 := by omega
      _ = 2 := by norm_num
  have hsplit : (T \ S.I3).card + (T ∩ S.I3).card = T.card := by
    simpa [T, Finset.inter_comm] using Finset.card_sdiff_add_card_inter T S.I3
  have hinter_le : (T ∩ S.I3).card ≤ S.I3.card := Finset.card_le_card Finset.inter_subset_right
  have hI3_two : S.I3.card = 2 := S.I3_card_eq_two
  have hT_eq_four : T.card = 4 := by
    omega
  have hinter_ge : S.I3.card ≤ (T ∩ S.I3).card := by
    omega
  have hI3eq : T ∩ S.I3 = S.I3 := Finset.eq_of_subset_of_card_le Finset.inter_subset_right hinter_ge
  have hI3sub : S.I3 ⊆ T := by
    intro x hx
    have : x ∈ T ∩ S.I3 := by simpa [hI3eq] using hx
    exact Finset.mem_of_mem_inter_left this
  exact ⟨hT_eq_four, hI3sub, hC1_oneT, hC2_oneT⟩
theorem formB_v1_split
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r : ℝ}
    (hB : S.IsFormB_v1 r) :
    (∃ h : (Z.a2 : ℝ²) ∈ S.I2,
        S.witnessClassAt_v1 r ∩ S.CP.C2 = ({Z.a2} : Finset ℝ²)) ∨
      (∃ h : (Z.b2 : ℝ²) ∈ S.I2,
        S.witnessClassAt_v1 r ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²)) := by
  rcases hB with ⟨x, hxI2, hxeq, -⟩
  have hxmem : x ∈ ({Z.a2, Z.b2} : Finset ℝ²) := by
    rw [← Z.hI2]
    simpa using hxI2
  rcases Finset.mem_insert.mp hxmem with rfl | hx
  · exact Or.inl ⟨by simpa [Z.hI2] using hxI2, hxeq⟩
  · have : x = Z.b2 := by simpa using hx
    subst this
    exact Or.inr ⟨by simpa [Z.hI2] using hxI2, hxeq⟩
theorem formC_v1_split
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r : ℝ}
    (hC : S.IsFormC_v1 r) :
    (∃ h : (Z.a3 : ℝ²) ∈ S.I3,
        S.witnessClassAt_v1 r ∩ S.CP.C3 = ({Z.a3} : Finset ℝ²)) ∨
      (∃ h : (Z.b3 : ℝ²) ∈ S.I3,
        S.witnessClassAt_v1 r ∩ S.CP.C3 = ({Z.b3} : Finset ℝ²)) := by
  rcases hC with ⟨y, hyI3, -, hyeq⟩
  have hymem : y ∈ ({Z.a3, Z.b3} : Finset ℝ²) := by
    rw [← Z.hI3]
    simpa using hyI3
  rcases Finset.mem_insert.mp hymem with rfl | hy
  · exact Or.inl ⟨by simpa [Z.hI3] using hyI3, hyeq⟩
  · have : y = Z.b3 := by simpa using hy
    subst this
    exact Or.inr ⟨by simpa [Z.hI3] using hyI3, hyeq⟩
theorem selectorShape_v2
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) :
    ∃ r : ℝ, 0 < r ∧
      let T := S.witnessClassAt_v2 r
      T.card = 4 ∧
      S.I2 ⊆ T ∧
      ∃ p q : ℝ²,
        p ∈ ({Z.a1, Z.b1, S.triangle.v3} : Finset ℝ²) ∧
        q ∈ ({Z.a3, Z.b3, S.triangle.v1} : Finset ℝ²) ∧
        T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
        T ∩ S.CP.C3 = ({q} : Finset ℝ²) := by
  classical
  rcases S.k4_at_v2 with ⟨r, hr, hcard⟩
  let T : Finset ℝ² := S.witnessClassAt_v2 r
  have hcore := S.coreSelector_v2 hr hcard
  rcases hcore with ⟨hTcard, hI2sub, hC1le, hC3le⟩
  have hTcard' : T.card = 4 := by simpa [T] using hTcard
  have hC1le' : (T ∩ S.CP.C1).card ≤ 1 := by simpa [T] using hC1le
  have hC3le' : (T ∩ S.CP.C3).card ≤ 1 := by simpa [T] using hC3le
  have hv2notT : S.triangle.v2 ∉ T := by
    intro hv2T
    have hv2eq : dist S.triangle.v2 S.triangle.v2 = r := (Finset.mem_filter.mp hv2T).2
    have h0r : (0 : ℝ) = r := by simpa using hv2eq
    nlinarith only [hr, h0r]
  have hI2two : S.I2.card = 2 := S.I2_card_eq_two
  have hI2sub' : S.I2 ⊆ T ∩ S.I2 := by
    intro z hz
    exact Finset.mem_inter.mpr ⟨hI2sub hz, hz⟩
  have hTminus_eq_two : (T \ S.I2).card = 2 := by
    have hsplit : (T \ S.I2).card + (T ∩ S.I2).card = T.card := by
      simpa [T, Finset.inter_comm] using Finset.card_sdiff_add_card_inter T S.I2
    have hI2ge : S.I2.card ≤ (T ∩ S.I2).card := Finset.card_le_card hI2sub'
    have hI2le : (T ∩ S.I2).card ≤ S.I2.card := Finset.card_le_card Finset.inter_subset_right
    omega
  have hcover :
      T \ S.I2 ⊆ (T ∩ S.CP.C1) ∪ (T ∩ S.CP.C3) := by
    intro x hx
    rcases Finset.mem_sdiff.mp hx with ⟨hxT, hxnotI2⟩
    have hxA : x ∈ A := (Finset.mem_filter.mp hxT).1
    by_cases hxv1 : x = S.triangle.v1
    · apply Finset.mem_union_right
      exact Finset.mem_inter.mpr ⟨hxT, by simpa [hxv1] using S.CP.v1_mem_C3⟩
    by_cases hxv3 : x = S.triangle.v3
    · apply Finset.mem_union_left
      exact Finset.mem_inter.mpr ⟨hxT, by simpa [hxv3] using S.CP.v3_mem_C1⟩
    by_cases hxv2 : x = S.triangle.v2
    · exact False.elim (hv2notT (hxv2 ▸ hxT))
    have hxnonmoser : x ∉ S.triangle.verts := by
      simp [Problem97.MoserTriangle.verts, hxv1, hxv2, hxv3]
    have hxnotC2 : x ∉ S.CP.C2 := by
      intro hxC2
      have hxI2 : x ∈ S.I2 := by
        unfold I2
        exact Finset.mem_erase.mpr ⟨hxv1, Finset.mem_erase.mpr ⟨hxv3, hxC2⟩⟩
      exact hxnotI2 hxI2
    have hone := S.CP.nonmoser_in_one x hxA hxnonmoser
    by_cases hxC1 : x ∈ S.CP.C1
    · exact Finset.mem_union.mpr (Or.inl (Finset.mem_inter.mpr ⟨hxT, hxC1⟩))
    · have hxC3 : x ∈ S.CP.C3 := by
        by_cases hxC3 : x ∈ S.CP.C3
        · exact hxC3
        · have : (0 : ℕ) = 1 := by
            simpa [hxC1, hxnotC2, hxC3] using hone
          omega
      exact Finset.mem_union.mpr (Or.inr (Finset.mem_inter.mpr ⟨hxT, hxC3⟩))
  have hUnion_eq_two :
      ((T ∩ S.CP.C1) ∪ (T ∩ S.CP.C3)).card = 2 := by
    have hTminus_le : (T \ S.I2).card ≤ ((T ∩ S.CP.C1) ∪ (T ∩ S.CP.C3)).card :=
      Finset.card_le_card hcover
    have hUnion_le :
        ((T ∩ S.CP.C1) ∪ (T ∩ S.CP.C3)).card ≤ 2 := by
      calc
        ((T ∩ S.CP.C1) ∪ (T ∩ S.CP.C3)).card
            ≤ (T ∩ S.CP.C1).card + (T ∩ S.CP.C3).card := Finset.card_union_le _ _
        _ ≤ 1 + 1 := by omega
        _ = 2 := by norm_num
    omega
  have hsum_eq_two : (T ∩ S.CP.C1).card + (T ∩ S.CP.C3).card = 2 := by
    have hUnion_le_sum : ((T ∩ S.CP.C1) ∪ (T ∩ S.CP.C3)).card ≤
        (T ∩ S.CP.C1).card + (T ∩ S.CP.C3).card := Finset.card_union_le _ _
    omega
  have hC1eq1 : (T ∩ S.CP.C1).card = 1 := by omega
  have hC3eq1 : (T ∩ S.CP.C3).card = 1 := by omega
  obtain ⟨p, hpeq⟩ := Finset.card_eq_one.mp hC1eq1
  obtain ⟨q, hqeq⟩ := Finset.card_eq_one.mp hC3eq1
  have hpT : p ∈ T := by
    have hpmem : p ∈ ({p} : Finset ℝ²) := by simp
    rw [← hpeq] at hpmem
    exact (Finset.mem_inter.mp hpmem).1
  have hqT : q ∈ T := by
    have hqmem : q ∈ ({q} : Finset ℝ²) := by simp
    rw [← hqeq] at hqmem
    exact (Finset.mem_inter.mp hqmem).1
  have hpC1 : p ∈ S.CP.C1 := by
    have hpmem : p ∈ ({p} : Finset ℝ²) := by simp
    rw [← hpeq] at hpmem
    exact (Finset.mem_inter.mp hpmem).2
  have hqC3 : q ∈ S.CP.C3 := by
    have hqmem : q ∈ ({q} : Finset ℝ²) := by simp
    rw [← hqeq] at hqmem
    exact (Finset.mem_inter.mp hqmem).2
  have hp_ne_v2 : p ≠ S.triangle.v2 := by
    intro h
    exact hv2notT (h ▸ hpT)
  have hq_ne_v2 : q ≠ S.triangle.v2 := by
    intro h
    exact hv2notT (h ▸ hqT)
  have hp_named : p ∈ ({Z.a1, Z.b1, S.triangle.v3} : Finset ℝ²) := by
    by_cases hpv3 : p = S.triangle.v3
    · simp [hpv3]
    · have hpI1 : p ∈ S.I1 := by
        unfold I1
        exact Finset.mem_erase.mpr ⟨hpv3, Finset.mem_erase.mpr ⟨hp_ne_v2, hpC1⟩⟩
      have hpI1' : p ∈ ({Z.a1, Z.b1} : Finset ℝ²) := by
        have : p ∈ S.I1 := hpI1
        rw [Z.hI1] at this
        exact this
      rcases Finset.mem_insert.mp hpI1' with hpa1 | hpb1
      · simp [hpa1]
      · have hpb1' : p = Z.b1 := by simpa using hpb1
        exact Finset.mem_insert.mpr (Or.inr (Finset.mem_insert.mpr (Or.inl hpb1')))
  have hq_named : q ∈ ({Z.a3, Z.b3, S.triangle.v1} : Finset ℝ²) := by
    by_cases hqv1 : q = S.triangle.v1
    · simp [hqv1]
    · have hqI3 : q ∈ S.I3 := by
        unfold I3
        exact Finset.mem_erase.mpr ⟨hq_ne_v2, Finset.mem_erase.mpr ⟨hqv1, hqC3⟩⟩
      have hqI3' : q ∈ ({Z.a3, Z.b3} : Finset ℝ²) := by
        have : q ∈ S.I3 := hqI3
        rw [Z.hI3] at this
        exact this
      rcases Finset.mem_insert.mp hqI3' with hqa3 | hqb3
      · simp [hqa3]
      · have hqb3' : q = Z.b3 := by simpa using hqb3
        exact Finset.mem_insert.mpr (Or.inr (Finset.mem_insert.mpr (Or.inl hqb3')))
  refine ⟨r, hr, ?_⟩
  dsimp [T]
  exact ⟨hTcard, hI2sub, p, q, hp_named, hq_named, hpeq, hqeq⟩
theorem selectorShape_v3
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) :
    ∃ r : ℝ, 0 < r ∧
      let T := S.witnessClassAt_v3 r
      T.card = 4 ∧
      S.I3 ⊆ T ∧
      ∃ p q : ℝ²,
        p ∈ ({Z.a1, Z.b1, S.triangle.v2} : Finset ℝ²) ∧
        q ∈ ({Z.a2, Z.b2, S.triangle.v1} : Finset ℝ²) ∧
        T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
        T ∩ S.CP.C2 = ({q} : Finset ℝ²) := by
  classical
  rcases S.k4_at_v3 with ⟨r, hr, hcard⟩
  let T : Finset ℝ² := S.witnessClassAt_v3 r
  have hcore := S.coreSelector_v3 hr hcard
  rcases hcore with ⟨hTcard, hI3sub, hC1le, hC2le⟩
  have hTcard' : T.card = 4 := by simpa [T] using hTcard
  have hC1le' : (T ∩ S.CP.C1).card ≤ 1 := by simpa [T] using hC1le
  have hC2le' : (T ∩ S.CP.C2).card ≤ 1 := by simpa [T] using hC2le
  have hv3notT : S.triangle.v3 ∉ T := by
    intro hv3T
    have hv3eq : dist S.triangle.v3 S.triangle.v3 = r := (Finset.mem_filter.mp hv3T).2
    have h0r : (0 : ℝ) = r := by simpa using hv3eq
    nlinarith only [hr, h0r]
  have hI3sub' : S.I3 ⊆ T ∩ S.I3 := by
    intro z hz
    exact Finset.mem_inter.mpr ⟨hI3sub hz, hz⟩
  have hTminus_eq_two : (T \ S.I3).card = 2 := by
    have hsplit : (T \ S.I3).card + (T ∩ S.I3).card = T.card := by
      simpa [T, Finset.inter_comm] using Finset.card_sdiff_add_card_inter T S.I3
    have hI3ge : S.I3.card ≤ (T ∩ S.I3).card := Finset.card_le_card hI3sub'
    have hI3le : (T ∩ S.I3).card ≤ S.I3.card := Finset.card_le_card Finset.inter_subset_right
    have hI3two : S.I3.card = 2 := S.I3_card_eq_two
    omega
  have hcover :
      T \ S.I3 ⊆ (T ∩ S.CP.C1) ∪ (T ∩ S.CP.C2) := by
    intro x hx
    rcases Finset.mem_sdiff.mp hx with ⟨hxT, hxnotI3⟩
    have hxA : x ∈ A := (Finset.mem_filter.mp hxT).1
    by_cases hxv2 : x = S.triangle.v2
    · apply Finset.mem_union_left
      exact Finset.mem_inter.mpr ⟨hxT, by simpa [hxv2] using S.CP.v2_mem_C1⟩
    by_cases hxv1 : x = S.triangle.v1
    · apply Finset.mem_union_right
      exact Finset.mem_inter.mpr ⟨hxT, by simpa [hxv1] using S.CP.v1_mem_C2⟩
    by_cases hxv3 : x = S.triangle.v3
    · exact False.elim (hv3notT (hxv3 ▸ hxT))
    have hxnonmoser : x ∉ S.triangle.verts := by
      simp [Problem97.MoserTriangle.verts, hxv1, hxv2, hxv3]
    have hxnotC3 : x ∉ S.CP.C3 := by
      intro hxC3
      have hxI3 : x ∈ S.I3 := by
        unfold I3
        exact Finset.mem_erase.mpr ⟨hxv2, Finset.mem_erase.mpr ⟨hxv1, hxC3⟩⟩
      exact hxnotI3 hxI3
    have hone := S.CP.nonmoser_in_one x hxA hxnonmoser
    by_cases hxC1 : x ∈ S.CP.C1
    · exact Finset.mem_union.mpr (Or.inl (Finset.mem_inter.mpr ⟨hxT, hxC1⟩))
    · have hxC2 : x ∈ S.CP.C2 := by
        by_cases hxC2 : x ∈ S.CP.C2
        · exact hxC2
        · have : (0 : ℕ) = 1 := by
            simpa [hxC1, hxC2, hxnotC3] using hone
          omega
      exact Finset.mem_union.mpr (Or.inr (Finset.mem_inter.mpr ⟨hxT, hxC2⟩))
  have hUnion_eq_two :
      ((T ∩ S.CP.C1) ∪ (T ∩ S.CP.C2)).card = 2 := by
    have hTminus_le : (T \ S.I3).card ≤ ((T ∩ S.CP.C1) ∪ (T ∩ S.CP.C2)).card :=
      Finset.card_le_card hcover
    have hUnion_le :
        ((T ∩ S.CP.C1) ∪ (T ∩ S.CP.C2)).card ≤ 2 := by
      calc
        ((T ∩ S.CP.C1) ∪ (T ∩ S.CP.C2)).card
            ≤ (T ∩ S.CP.C1).card + (T ∩ S.CP.C2).card := Finset.card_union_le _ _
        _ ≤ 1 + 1 := by omega
        _ = 2 := by norm_num
    omega
  have hsum_eq_two : (T ∩ S.CP.C1).card + (T ∩ S.CP.C2).card = 2 := by
    have hUnion_le_sum : ((T ∩ S.CP.C1) ∪ (T ∩ S.CP.C2)).card ≤
        (T ∩ S.CP.C1).card + (T ∩ S.CP.C2).card := Finset.card_union_le _ _
    omega
  have hC1eq1 : (T ∩ S.CP.C1).card = 1 := by omega
  have hC2eq1 : (T ∩ S.CP.C2).card = 1 := by omega
  obtain ⟨p, hpeq⟩ := Finset.card_eq_one.mp hC1eq1
  obtain ⟨q, hqeq⟩ := Finset.card_eq_one.mp hC2eq1
  have hpT : p ∈ T := by
    have hpmem : p ∈ ({p} : Finset ℝ²) := by simp
    rw [← hpeq] at hpmem
    exact (Finset.mem_inter.mp hpmem).1
  have hqT : q ∈ T := by
    have hqmem : q ∈ ({q} : Finset ℝ²) := by simp
    rw [← hqeq] at hqmem
    exact (Finset.mem_inter.mp hqmem).1
  have hpC1 : p ∈ S.CP.C1 := by
    have hpmem : p ∈ ({p} : Finset ℝ²) := by simp
    rw [← hpeq] at hpmem
    exact (Finset.mem_inter.mp hpmem).2
  have hqC2 : q ∈ S.CP.C2 := by
    have hqmem : q ∈ ({q} : Finset ℝ²) := by simp
    rw [← hqeq] at hqmem
    exact (Finset.mem_inter.mp hqmem).2
  have hp_ne_v3 : p ≠ S.triangle.v3 := by
    intro h
    exact hv3notT (h ▸ hpT)
  have hq_ne_v3 : q ≠ S.triangle.v3 := by
    intro h
    exact hv3notT (h ▸ hqT)
  have hp_named : p ∈ ({Z.a1, Z.b1, S.triangle.v2} : Finset ℝ²) := by
    by_cases hpv2 : p = S.triangle.v2
    · simp [hpv2]
    · have hpI1 : p ∈ S.I1 := by
        unfold I1
        exact Finset.mem_erase.mpr ⟨hp_ne_v3, Finset.mem_erase.mpr ⟨hpv2, hpC1⟩⟩
      have hpI1' : p ∈ ({Z.a1, Z.b1} : Finset ℝ²) := by
        have : p ∈ S.I1 := hpI1
        rw [Z.hI1] at this
        exact this
      rcases Finset.mem_insert.mp hpI1' with hpa1 | hpb1
      · simp [hpa1]
      · have hpb1' : p = Z.b1 := by simpa using hpb1
        exact Finset.mem_insert.mpr (Or.inr (Finset.mem_insert.mpr (Or.inl hpb1')))
  have hq_named : q ∈ ({Z.a2, Z.b2, S.triangle.v1} : Finset ℝ²) := by
    by_cases hqv1 : q = S.triangle.v1
    · simp [hqv1]
    · have hqI2 : q ∈ S.I2 := by
        unfold I2
        exact Finset.mem_erase.mpr ⟨hqv1, Finset.mem_erase.mpr ⟨hq_ne_v3, hqC2⟩⟩
      have hqI2' : q ∈ ({Z.a2, Z.b2} : Finset ℝ²) := by
        have : q ∈ S.I2 := hqI2
        rw [Z.hI2] at this
        exact this
      rcases Finset.mem_insert.mp hqI2' with hqa2 | hqb2
      · simp [hqa2]
      · have hqb2' : q = Z.b2 := by simpa using hqb2
        exact Finset.mem_insert.mpr (Or.inr (Finset.mem_insert.mpr (Or.inl hqb2')))
  refine ⟨r, hr, ?_⟩
  dsimp [T]
  exact ⟨hTcard, hI3sub, p, q, hp_named, hq_named, hpeq, hqeq⟩
theorem selectorShape_v2_split
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) :
    ∃ r : ℝ, 0 < r ∧
      let T := S.witnessClassAt_v2 r
      T.card = 4 ∧
      S.I2 ⊆ T ∧
      ((∃ p : ℝ²,
          p ∈ ({Z.a1, Z.b1, S.triangle.v3} : Finset ℝ²) ∧
          T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
          T ∩ S.CP.C3 = ({S.triangle.v1} : Finset ℝ²)) ∨
       (∃ p : ℝ²,
          p ∈ ({Z.a1, Z.b1, S.triangle.v3} : Finset ℝ²) ∧
          T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
          T ∩ S.CP.C3 = ({Z.a3} : Finset ℝ²)) ∨
       (∃ p : ℝ²,
          p ∈ ({Z.a1, Z.b1, S.triangle.v3} : Finset ℝ²) ∧
          T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
          T ∩ S.CP.C3 = ({Z.b3} : Finset ℝ²))) := by
  classical
  rcases S.selectorShape_v2 Z with ⟨r, hr, hshape⟩
  dsimp at hshape
  rcases hshape with ⟨hTcard, hI2sub, p, q, hp, hq, hpeq, hqeq⟩
  rcases Finset.mem_insert.mp hq with hqa3 | hq
  · refine ⟨r, hr, ?_⟩
    dsimp
    exact ⟨hTcard, hI2sub, Or.inr (Or.inl ⟨p, hp, hpeq, by simpa [hqa3] using hqeq⟩)⟩
  rcases Finset.mem_insert.mp hq with hqb3 | hq
  · have hqb3' : q = Z.b3 := by simpa using hqb3
    refine ⟨r, hr, ?_⟩
    dsimp
    exact ⟨hTcard, hI2sub, Or.inr (Or.inr ⟨p, hp, hpeq, by simpa [hqb3'] using hqeq⟩)⟩
  have hqv1 : q = S.triangle.v1 := by simpa using hq
  refine ⟨r, hr, ?_⟩
  dsimp
  exact ⟨hTcard, hI2sub, Or.inl ⟨p, hp, hpeq, by simpa [hqv1] using hqeq⟩⟩
theorem selectorShape_v3_split
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) :
    ∃ r : ℝ, 0 < r ∧
      let T := S.witnessClassAt_v3 r
      T.card = 4 ∧
      S.I3 ⊆ T ∧
      ((∃ p : ℝ²,
          p ∈ ({Z.a1, Z.b1, S.triangle.v2} : Finset ℝ²) ∧
          T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
          T ∩ S.CP.C2 = ({S.triangle.v1} : Finset ℝ²)) ∨
       (∃ p : ℝ²,
          p ∈ ({Z.a1, Z.b1, S.triangle.v2} : Finset ℝ²) ∧
          T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
          T ∩ S.CP.C2 = ({Z.a2} : Finset ℝ²)) ∨
       (∃ p : ℝ²,
          p ∈ ({Z.a1, Z.b1, S.triangle.v2} : Finset ℝ²) ∧
          T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
          T ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²))) := by
  classical
  rcases S.selectorShape_v3 Z with ⟨r, hr, hshape⟩
  dsimp at hshape
  rcases hshape with ⟨hTcard, hI3sub, p, q, hp, hq, hpeq, hqeq⟩
  rcases Finset.mem_insert.mp hq with hqa2 | hq
  · refine ⟨r, hr, ?_⟩
    dsimp
    exact ⟨hTcard, hI3sub, Or.inr (Or.inl ⟨p, hp, hpeq, by simpa [hqa2] using hqeq⟩)⟩
  rcases Finset.mem_insert.mp hq with hqb2 | hq
  · have hqb2' : q = Z.b2 := by simpa using hqb2
    refine ⟨r, hr, ?_⟩
    dsimp
    exact ⟨hTcard, hI3sub, Or.inr (Or.inr ⟨p, hp, hpeq, by simpa [hqb2'] using hqeq⟩)⟩
  have hqv1 : q = S.triangle.v1 := by simpa using hq
  refine ⟨r, hr, ?_⟩
  dsimp
  exact ⟨hTcard, hI3sub, Or.inl ⟨p, hp, hpeq, by simpa [hqv1] using hqeq⟩⟩
theorem I1_v3_distance_chain
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    ∃ near far : ℝ²,
      ({near, far} : Finset ℝ²) = S.I1 ∧
      dist S.triangle.v3 near < dist S.triangle.v3 far ∧
      dist S.triangle.v3 far < dist S.triangle.v3 S.triangle.v2 := by
  classical
  have hC1four : S.CP.C1.card = 4 := (S.n5_forced_m44).1
  rcases Problem97.CGN.CGN4g_capData_of_supportCap_oriented
      (A := A) (C := S.CP.C1) (M := S.triangle)
      S.hconv S.hnoncol S.CP.C1_subset
      (fun x hxA => (S.CP.arc_membership x hxA).1)
      S.CP.v2_mem_C1 S.CP.v3_mem_C1 S.Packet S.Packet.inner_at_v1 with
    ⟨m, L, Packet, Hside, Hord, hLC, hEnds⟩
  have hm4 : m = 4 := by
    calc
      m = (Finset.univ.image L.points).card := by
        symm
        simpa using Finset.card_image_of_injective (s := Finset.univ) (f := L.points) L.injective
      _ = S.CP.C1.card := by rw [hLC]
      _ = 4 := hC1four
  subst m
  let i0 : Fin 4 := ⟨0, by decide⟩
  let i1 : Fin 4 := ⟨1, by decide⟩
  let i2 : Fin 4 := ⟨2, by decide⟩
  let i3 : Fin 4 := ⟨3, by decide⟩
  have hi12 : i1 < i2 := by decide
  have hi23 : i2 < i3 := by decide
  have hidx0 : (Problem97.CGN.firstIndex Packet.hm : Fin 4) = i0 := by
    ext
    simp [Problem97.CGN.firstIndex, i0]
  have hidx3 : (Problem97.CGN.lastIndex Packet.hm : Fin 4) = i3 := by
    ext
    simp [Problem97.CGN.lastIndex, i3]
  rcases hEnds with hFirstLast | hLastFirst
  · have hmono :
        Problem97.FiniteEndpoint.E3L20b_rightEndpoint_capDistance_strict
          (L.points (Problem97.CGN.lastIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev L) := by
      intro i j hij
      exact Problem97.FiniteEndpoint.E3L20b_of_cgnCapData Packet Hside Hord hij
    have hfirst0 : L.points i0 = S.triangle.v2 := by
      simpa [hidx0, i0] using hFirstLast.1
    have hlast3 : L.points i3 = S.triangle.v3 := by
      simpa [hidx3, i3] using hFirstLast.2
    have hi1rev : i1.rev = i2 := by decide
    have hi2rev : i2.rev = i1 := by decide
    have hi3rev : i3.rev = i0 := by decide
    have hnearfar : dist S.triangle.v3 (L.points i2) < dist S.triangle.v3 (L.points i1) := by
      have htmp :
          dist (L.points i3) (L.points i2) < dist (L.points i3) (L.points i1) := by
        simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev_points, hidx3,
            hi1rev, hi2rev] using hmono hi12
      simpa [hlast3] using htmp
    have hfarv2 : dist S.triangle.v3 (L.points i1) < dist S.triangle.v3 S.triangle.v2 := by
      have htmp :
          dist (L.points i3) (L.points i1) < dist (L.points i3) (L.points i0) := by
        simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev_points, hidx3,
            hi2rev, hi3rev] using hmono hi23
      simpa [hlast3, hfirst0] using htmp
    have hnearC1 : L.points i2 ∈ S.CP.C1 := by
      rw [← hLC]
      exact Finset.mem_image.mpr ⟨i2, by simp [i2]⟩
    have hfarC1 : L.points i1 ∈ S.CP.C1 := by
      rw [← hLC]
      exact Finset.mem_image.mpr ⟨i1, by simp [i1]⟩
    have hnear_ne_v2 : L.points i2 ≠ S.triangle.v2 := by
      intro h
      have : i2 = i0 := L.injective (by simpa [hfirst0] using h)
      simpa [i0, i2] using this
    have hnear_ne_v3 : L.points i2 ≠ S.triangle.v3 := by
      intro h
      have : i2 = i3 := L.injective (by simpa [hlast3] using h)
      simpa [i2, i3] using this
    have hfar_ne_v2 : L.points i1 ≠ S.triangle.v2 := by
      intro h
      have : i1 = i0 := L.injective (by simpa [hfirst0] using h)
      simpa [i0, i1] using this
    have hfar_ne_v3 : L.points i1 ≠ S.triangle.v3 := by
      intro h
      have : i1 = i3 := L.injective (by simpa [hlast3] using h)
      simpa [i1, i3] using this
    have hnearI1 : L.points i2 ∈ S.I1 := by
      unfold Problem97.FiniteEndpointShell.I1
      exact Finset.mem_erase.mpr ⟨hnear_ne_v3, Finset.mem_erase.mpr ⟨hnear_ne_v2, hnearC1⟩⟩
    have hfarI1 : L.points i1 ∈ S.I1 := by
      unfold Problem97.FiniteEndpointShell.I1
      exact Finset.mem_erase.mpr ⟨hfar_ne_v3, Finset.mem_erase.mpr ⟨hfar_ne_v2, hfarC1⟩⟩
    have hpair_sub : ({L.points i2, L.points i1} : Finset ℝ²) ⊆ S.I1 := by
      intro x hx
      rcases Finset.mem_insert.mp hx with hx | hx
      · simpa [hx] using hnearI1
      · have hx' : x = L.points i1 := by simpa using hx
        simpa [hx'] using hfarI1
    have hpair_card : ({L.points i2, L.points i1} : Finset ℝ²).card = 2 := by
      have hne : L.points i2 ≠ L.points i1 := by
        intro h
        have : i2 = i1 := L.injective h
        simpa [i1, i2] using this
      simp [hne]
    have hI1le : S.I1.card ≤ ({L.points i2, L.points i1} : Finset ℝ²).card := by
      rw [S.I1_card_eq_two, hpair_card]
    refine ⟨L.points i2, L.points i1, ?_, hnearfar, hfarv2⟩
    exact Finset.eq_of_subset_of_card_le hpair_sub hI1le
  · have hmono :
        Problem97.FiniteEndpoint.E3L20a_leftEndpoint_capDistance_strict
          (L.points (Problem97.CGN.firstIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap L) := by
      intro i j hij
      exact Problem97.FiniteEndpoint.E3L20a_of_cgnCapData Packet Hside Hord hij
    have hfirst0 : L.points i0 = S.triangle.v3 := by
      simpa [hidx0, i0] using hLastFirst.1
    have hlast3 : L.points i3 = S.triangle.v2 := by
      simpa [hidx3, i3] using hLastFirst.2
    have hnearfar : dist S.triangle.v3 (L.points i1) < dist S.triangle.v3 (L.points i2) := by
      have htmp :
          dist (L.points i0) (L.points i1) < dist (L.points i0) (L.points i2) := by
        simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap_points, hidx0] using hmono hi12
      simpa [hfirst0] using htmp
    have hfarv2 : dist S.triangle.v3 (L.points i2) < dist S.triangle.v3 S.triangle.v2 := by
      have htmp :
          dist (L.points i0) (L.points i2) < dist (L.points i0) (L.points i3) := by
        simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap_points, hidx0, hidx3]
          using hmono hi23
      simpa [hfirst0, hlast3] using htmp
    have hnearC1 : L.points i1 ∈ S.CP.C1 := by
      rw [← hLC]
      exact Finset.mem_image.mpr ⟨i1, by simp [i1]⟩
    have hfarC1 : L.points i2 ∈ S.CP.C1 := by
      rw [← hLC]
      exact Finset.mem_image.mpr ⟨i2, by simp [i2]⟩
    have hnear_ne_v2 : L.points i1 ≠ S.triangle.v2 := by
      intro h
      have : i1 = i3 := L.injective (by simpa [hlast3] using h)
      simpa [i1, i3] using this
    have hnear_ne_v3 : L.points i1 ≠ S.triangle.v3 := by
      intro h
      have : i1 = i0 := L.injective (by simpa [hfirst0] using h)
      simpa [i0, i1] using this
    have hfar_ne_v2 : L.points i2 ≠ S.triangle.v2 := by
      intro h
      have : i2 = i3 := L.injective (by simpa [hlast3] using h)
      simpa [i2, i3] using this
    have hfar_ne_v3 : L.points i2 ≠ S.triangle.v3 := by
      intro h
      have : i2 = i0 := L.injective (by simpa [hfirst0] using h)
      simpa [i0, i2] using this
    have hnearI1 : L.points i1 ∈ S.I1 := by
      unfold Problem97.FiniteEndpointShell.I1
      exact Finset.mem_erase.mpr ⟨hnear_ne_v3, Finset.mem_erase.mpr ⟨hnear_ne_v2, hnearC1⟩⟩
    have hfarI1 : L.points i2 ∈ S.I1 := by
      unfold Problem97.FiniteEndpointShell.I1
      exact Finset.mem_erase.mpr ⟨hfar_ne_v3, Finset.mem_erase.mpr ⟨hfar_ne_v2, hfarC1⟩⟩
    have hpair_sub : ({L.points i1, L.points i2} : Finset ℝ²) ⊆ S.I1 := by
      intro x hx
      rcases Finset.mem_insert.mp hx with hx | hx
      · simpa [hx] using hnearI1
      · have hx' : x = L.points i2 := by simpa using hx
        simpa [hx'] using hfarI1
    have hpair_card : ({L.points i1, L.points i2} : Finset ℝ²).card = 2 := by
      have hne : L.points i1 ≠ L.points i2 := by
        intro h
        have : i1 = i2 := L.injective h
        simpa [i1, i2] using this
      simp [hne]
    have hI1le : S.I1.card ≤ ({L.points i1, L.points i2} : Finset ℝ²).card := by
      rw [S.I1_card_eq_two, hpair_card]
    refine ⟨L.points i1, L.points i2, ?_, hnearfar, hfarv2⟩
    exact Finset.eq_of_subset_of_card_le hpair_sub hI1le
theorem I3_cap_order_chain
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    ∃ near far : ℝ²,
      ({near, far} : Finset ℝ²) = S.I3 ∧
      dist S.triangle.v1 near < dist S.triangle.v1 far ∧
      dist S.triangle.v2 far < dist S.triangle.v2 near := by
  classical
  have hC3four : S.CP.C3.card = 4 := (S.n5_forced_m44).2.2
  rcases Problem97.CGN.CGN4g_capData_of_supportCap_oriented
      (A := A) (C := S.CP.C3) (M := S.triangle3)
      S.hconv S.hnoncol S.CP.C3_subset
      (fun x hxA => (S.CP.arc_membership x hxA).2.2)
      S.CP.v1_mem_C3 S.CP.v2_mem_C3 S.packet3 S.packet3.inner_at_v1 with
    ⟨m, L, Packet, Hside, Hord, hLC, hEnds⟩
  have hm4 : m = 4 := by
    calc
      m = (Finset.univ.image L.points).card := by
        symm
        simpa using Finset.card_image_of_injective (s := Finset.univ) (f := L.points) L.injective
      _ = S.CP.C3.card := by rw [hLC]
      _ = 4 := hC3four
  subst m
  let i0 : Fin 4 := ⟨0, by decide⟩
  let i1 : Fin 4 := ⟨1, by decide⟩
  let i2 : Fin 4 := ⟨2, by decide⟩
  let i3 : Fin 4 := ⟨3, by decide⟩
  have hi12 : i1 < i2 := by decide
  have hi23 : i2 < i3 := by decide
  have hidx0 : (Problem97.CGN.firstIndex Packet.hm : Fin 4) = i0 := by
    ext
    simp [Problem97.CGN.firstIndex, i0]
  have hidx3 : (Problem97.CGN.lastIndex Packet.hm : Fin 4) = i3 := by
    ext
    simp [Problem97.CGN.lastIndex, i3]
  have hi1rev : i1.rev = i2 := by decide
  have hi2rev : i2.rev = i1 := by decide
  have hmonoA :
      Problem97.FiniteEndpoint.E3L20a_leftEndpoint_capDistance_strict
        (L.points (Problem97.CGN.firstIndex Packet.hm))
        (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap L) := by
    intro i j hij
    exact Problem97.FiniteEndpoint.E3L20a_of_cgnCapData Packet Hside Hord hij
  have hmonoB :
      Problem97.FiniteEndpoint.E3L20b_rightEndpoint_capDistance_strict
        (L.points (Problem97.CGN.lastIndex Packet.hm))
        (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev L) := by
    intro i j hij
    exact Problem97.FiniteEndpoint.E3L20b_of_cgnCapData Packet Hside Hord hij
  have hL_i1_C3 : L.points i1 ∈ S.CP.C3 := by
    rw [← hLC]; exact Finset.mem_image.mpr ⟨i1, by simp [i1]⟩
  have hL_i2_C3 : L.points i2 ∈ S.CP.C3 := by
    rw [← hLC]; exact Finset.mem_image.mpr ⟨i2, by simp [i2]⟩
  have hne12 : L.points i1 ≠ L.points i2 := by
    intro h; have : i1 = i2 := L.injective h; simpa [i1, i2] using this
  rcases hEnds with hFirstLast | hLastFirst
  ·
    have hfirst0 : L.points i0 = S.triangle.v1 := by
      simpa [hidx0, i0] using hFirstLast.1
    have hlast3 : L.points i3 = S.triangle.v2 := by
      simpa [hidx3, i3] using hFirstLast.2
    have hv1order : dist S.triangle.v1 (L.points i1) < dist S.triangle.v1 (L.points i2) := by
      have htmp :
          dist (L.points i0) (L.points i1) < dist (L.points i0) (L.points i2) := by
        simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap_points, hidx0]
          using hmonoA hi12
      simpa [hfirst0] using htmp
    have hv2order : dist S.triangle.v2 (L.points i2) < dist S.triangle.v2 (L.points i1) := by
      have htmp :
          dist (L.points i3) (L.points i2) < dist (L.points i3) (L.points i1) := by
        simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev_points, hidx3,
            hi1rev, hi2rev] using hmonoB hi12
      simpa [hlast3] using htmp
    have hnear_ne_v1 : L.points i1 ≠ S.triangle.v1 := by
      intro h; have : i1 = i0 := L.injective (by simpa [hfirst0] using h); simpa [i0, i1] using this
    have hnear_ne_v2 : L.points i1 ≠ S.triangle.v2 := by
      intro h; have : i1 = i3 := L.injective (by simpa [hlast3] using h); simpa [i1, i3] using this
    have hfar_ne_v1 : L.points i2 ≠ S.triangle.v1 := by
      intro h; have : i2 = i0 := L.injective (by simpa [hfirst0] using h); simpa [i0, i2] using this
    have hfar_ne_v2 : L.points i2 ≠ S.triangle.v2 := by
      intro h; have : i2 = i3 := L.injective (by simpa [hlast3] using h); simpa [i2, i3] using this
    have hnearI3 : L.points i1 ∈ S.I3 := by
      unfold Problem97.FiniteEndpointShell.I3
      exact Finset.mem_erase.mpr ⟨hnear_ne_v2, Finset.mem_erase.mpr ⟨hnear_ne_v1, hL_i1_C3⟩⟩
    have hfarI3 : L.points i2 ∈ S.I3 := by
      unfold Problem97.FiniteEndpointShell.I3
      exact Finset.mem_erase.mpr ⟨hfar_ne_v2, Finset.mem_erase.mpr ⟨hfar_ne_v1, hL_i2_C3⟩⟩
    have hpair_sub : ({L.points i1, L.points i2} : Finset ℝ²) ⊆ S.I3 := by
      intro x hx
      rcases Finset.mem_insert.mp hx with hx | hx
      · simpa [hx] using hnearI3
      · have hx' : x = L.points i2 := by simpa using hx
        simpa [hx'] using hfarI3
    have hpair_card : ({L.points i1, L.points i2} : Finset ℝ²).card = 2 := by
      simp [hne12]
    have hI3le : S.I3.card ≤ ({L.points i1, L.points i2} : Finset ℝ²).card := by
      rw [S.I3_card_eq_two, hpair_card]
    refine ⟨L.points i1, L.points i2, ?_, hv1order, hv2order⟩
    exact Finset.eq_of_subset_of_card_le hpair_sub hI3le
  ·
    have hfirst0 : L.points i0 = S.triangle.v2 := by
      simpa [hidx0, i0] using hLastFirst.1
    have hlast3 : L.points i3 = S.triangle.v1 := by
      simpa [hidx3, i3] using hLastFirst.2
    have hv2order : dist S.triangle.v2 (L.points i1) < dist S.triangle.v2 (L.points i2) := by
      have htmp :
          dist (L.points i0) (L.points i1) < dist (L.points i0) (L.points i2) := by
        simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap_points, hidx0]
          using hmonoA hi12
      simpa [hfirst0] using htmp
    have hv1order : dist S.triangle.v1 (L.points i2) < dist S.triangle.v1 (L.points i1) := by
      have htmp :
          dist (L.points i3) (L.points i2) < dist (L.points i3) (L.points i1) := by
        simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev_points, hidx3,
            hi1rev, hi2rev] using hmonoB hi12
      simpa [hlast3] using htmp
    have hnear_ne_v2 : L.points i2 ≠ S.triangle.v2 := by
      intro h; have : i2 = i0 := L.injective (by simpa [hfirst0] using h); simpa [i0, i2] using this
    have hnear_ne_v1 : L.points i2 ≠ S.triangle.v1 := by
      intro h; have : i2 = i3 := L.injective (by simpa [hlast3] using h); simpa [i2, i3] using this
    have hfar_ne_v2 : L.points i1 ≠ S.triangle.v2 := by
      intro h; have : i1 = i0 := L.injective (by simpa [hfirst0] using h); simpa [i0, i1] using this
    have hfar_ne_v1 : L.points i1 ≠ S.triangle.v1 := by
      intro h; have : i1 = i3 := L.injective (by simpa [hlast3] using h); simpa [i1, i3] using this
    have hnearI3 : L.points i2 ∈ S.I3 := by
      unfold Problem97.FiniteEndpointShell.I3
      exact Finset.mem_erase.mpr ⟨hnear_ne_v2, Finset.mem_erase.mpr ⟨hnear_ne_v1, hL_i2_C3⟩⟩
    have hfarI3 : L.points i1 ∈ S.I3 := by
      unfold Problem97.FiniteEndpointShell.I3
      exact Finset.mem_erase.mpr ⟨hfar_ne_v2, Finset.mem_erase.mpr ⟨hfar_ne_v1, hL_i1_C3⟩⟩
    have hpair_sub : ({L.points i2, L.points i1} : Finset ℝ²) ⊆ S.I3 := by
      intro x hx
      rcases Finset.mem_insert.mp hx with hx | hx
      · simpa [hx] using hnearI3
      · have hx' : x = L.points i1 := by simpa using hx
        simpa [hx'] using hfarI3
    have hpair_card : ({L.points i2, L.points i1} : Finset ℝ²).card = 2 := by
      simp [hne12.symm]
    have hI3le : S.I3.card ≤ ({L.points i2, L.points i1} : Finset ℝ²).card := by
      rw [S.I3_card_eq_two, hpair_card]
    refine ⟨L.points i2, L.points i1, ?_, hv1order, hv2order⟩
    exact Finset.eq_of_subset_of_card_le hpair_sub hI3le
theorem qEqE_capOrder_opposite
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {q qs : ℝ²}
    (hqI3 : q ∈ S.I3) (hqsI3 : qs ∈ S.I3) (hne : q ≠ qs) :
    (dist S.triangle.v2 qs ^ 2 - dist S.triangle.v2 q ^ 2)
      * (dist S.triangle.v1 qs ^ 2 - dist S.triangle.v1 q ^ 2) < 0 := by
  classical
  obtain ⟨near, far, hset, h1, h2⟩ := S.I3_cap_order_chain
  rw [← hset] at hqI3 hqsI3
  simp only [Finset.mem_insert, Finset.mem_singleton] at hqI3 hqsI3
  rcases hqI3 with hq | hq <;> rcases hqsI3 with hqs | hqs <;> subst hq <;> subst hqs
  · exact absurd rfl hne
  ·
    have hA : dist S.triangle.v2 qs ^ 2 - dist S.triangle.v2 q ^ 2 < 0 := by
      nlinarith only [h2, (dist_nonneg : (0 : ℝ) ≤ dist S.triangle.v2 q), (dist_nonneg : (0 : ℝ) ≤ dist S.triangle.v2 qs)]
    have hB : 0 < dist S.triangle.v1 qs ^ 2 - dist S.triangle.v1 q ^ 2 := by
      nlinarith only [h1, (dist_nonneg : (0 : ℝ) ≤ dist S.triangle.v1 q), (dist_nonneg : (0 : ℝ) ≤ dist S.triangle.v1 qs)]
    exact mul_neg_of_neg_of_pos hA hB
  ·
    have hA : 0 < dist S.triangle.v2 qs ^ 2 - dist S.triangle.v2 q ^ 2 := by
      nlinarith only [h2, (dist_nonneg : (0 : ℝ) ≤ dist S.triangle.v2 q), (dist_nonneg : (0 : ℝ) ≤ dist S.triangle.v2 qs)]
    have hB : dist S.triangle.v1 qs ^ 2 - dist S.triangle.v1 q ^ 2 < 0 := by
      nlinarith only [h1, (dist_nonneg : (0 : ℝ) ≤ dist S.triangle.v1 q), (dist_nonneg : (0 : ℝ) ≤ dist S.triangle.v1 qs)]
    exact mul_neg_of_pos_of_neg hA hB
  · exact absurd rfl hne
def SelectorV2Qv1Packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r : ℝ) : Prop :=
  let T := S.witnessClassAt_v2 r
  T.card = 4 ∧
  S.I2 ⊆ T ∧
  ∃ p : ℝ²,
    p ∈ ({Z.a1, Z.b1, S.triangle.v3} : Finset ℝ²) ∧
    T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
    T ∩ S.CP.C3 = ({S.triangle.v1} : Finset ℝ²)
def SelectorV3SplitPacket
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r : ℝ) : Prop :=
  let T := S.witnessClassAt_v3 r
  T.card = 4 ∧
  S.I3 ⊆ T ∧
  ((∃ p : ℝ²,
      p ∈ ({Z.a1, Z.b1, S.triangle.v2} : Finset ℝ²) ∧
      T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
      T ∩ S.CP.C2 = ({S.triangle.v1} : Finset ℝ²)) ∨
   (∃ p : ℝ²,
      p ∈ ({Z.a1, Z.b1, S.triangle.v2} : Finset ℝ²) ∧
      T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
      T ∩ S.CP.C2 = ({Z.a2} : Finset ℝ²)) ∨
   (∃ p : ℝ²,
      p ∈ ({Z.a1, Z.b1, S.triangle.v2} : Finset ℝ²) ∧
      T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
      T ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²)))
def SelectorV3Qv1Packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r : ℝ) : Prop :=
  let T := S.witnessClassAt_v3 r
  ∃ p : ℝ²,
    p ∈ ({Z.a1, Z.b1, S.triangle.v2} : Finset ℝ²) ∧
    T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
    T ∩ S.CP.C2 = ({S.triangle.v1} : Finset ℝ²)
def SelectorV3Qa2Packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r : ℝ) : Prop :=
  let T := S.witnessClassAt_v3 r
  S.I3 ⊆ T ∧
  ∃ p : ℝ²,
    p ∈ ({Z.a1, Z.b1, S.triangle.v2} : Finset ℝ²) ∧
    T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
    T ∩ S.CP.C2 = ({Z.a2} : Finset ℝ²)
def SelectorV3Pv2Packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r : ℝ) : Prop :=
  let T := S.witnessClassAt_v3 r
  S.I3 ⊆ T ∧
  T ∩ S.CP.C1 = ({S.triangle.v2} : Finset ℝ²) ∧
  ((T ∩ S.CP.C2 = ({Z.a2} : Finset ℝ²)) ∨
   (T ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²)))
abbrev I3OnV3RadiusAtA2CardLeOne
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) : Prop :=
  (S.I3.filter (fun x => dist S.triangle.v3 x = dist S.triangle.v3 Z.a2)).card ≤ 1
abbrev I3NoPointOnV3RadiusAtA2
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) : Prop :=
  ∀ x ∈ S.I3, dist S.triangle.v3 x ≠ dist S.triangle.v3 Z.a2
abbrev I3V3A2NormalizedHeightGap
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) : Prop :=
  ∃ T : ℝ² → ℝ², ∃ tau : Problem97.CGN.SimilarityTransportData T,
    dist (T S.triangle.v3) (T Z.a2) < (T S.triangle.v3) 1 ∧
    ∀ x ∈ S.I3, (T x) 1 < 0
abbrev I3V3A2DeltaNormalization
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) : Prop :=
  ∃ T : ℝ² → ℝ², ∃ tau : Problem97.CGN.SimilarityTransportData T, ∃ δ : ℝ,
    T S.triangle.v1 = Problem97.CGN.vec2 0 0 ∧
    T S.triangle.v2 = Problem97.CGN.vec2 1 0 ∧
    T Z.a2 = Problem97.CGN.vec2 ((1 : ℝ) / 2) (Real.sqrt 3 / 2) ∧
    T S.triangle.v3 =
      Problem97.CGN.vec2
        (2 * Real.cos δ * Real.cos δ)
        (2 * Real.cos δ * Real.sin δ) ∧
    Real.pi / 4 ≤ δ ∧ δ < Real.pi / 3 ∧
    ∀ x ∈ S.I3, (T x) 1 < 0
theorem b3n9m051_dist_sq_eq_coord_sq_add_coord_sq (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 :=
  Problem97.dist_sq_coord x y
theorem b3n9m051_qEqE_f1_sinusoid (r δ ε t S : ℝ) (hS : S ^ 2 = 2 - 2 * Real.cos (δ - ε)) :
    ((((1 + r * Real.cos δ) + r * S * Real.cos t) - (1 + r * Real.cos (2 * δ - ε)))
          * ((1 + r * Real.cos δ) - 1)
        + (((r * Real.sin δ) + r * S * Real.sin t) - r * Real.sin (2 * δ - ε))
          * ((r * Real.sin δ) - 0))
      = r ^ 2 * S * (Real.cos (t - δ) + S / 2) := by
  have e1 :
      Real.cos (2 * δ - ε)
        = (2 * Real.cos δ ^ 2 - 1) * Real.cos ε + (2 * Real.sin δ * Real.cos δ) * Real.sin ε := by
    rw [show (2 * δ - ε) = 2 * δ + (-ε) by ring, Real.cos_add, Real.cos_two_mul,
        Real.sin_two_mul, Real.cos_neg, Real.sin_neg]; ring
  have e2 :
      Real.sin (2 * δ - ε)
        = (2 * Real.sin δ * Real.cos δ) * Real.cos ε - (2 * Real.cos δ ^ 2 - 1) * Real.sin ε := by
    rw [show (2 * δ - ε) = 2 * δ + (-ε) by ring, Real.sin_add, Real.cos_two_mul,
        Real.sin_two_mul, Real.cos_neg, Real.sin_neg]; ring
  have e3 : Real.cos (t - δ) = Real.cos t * Real.cos δ + Real.sin t * Real.sin δ :=
    Real.cos_sub t δ
  have hSe : S ^ 2 = 2 - 2 * (Real.cos δ * Real.cos ε + Real.sin δ * Real.sin ε) := by
    rw [hS, Real.cos_sub]
  have hp : Real.sin δ ^ 2 + Real.cos δ ^ 2 = 1 := Real.sin_sq_add_cos_sq δ
  rw [e1, e2, e3]
  linear_combination (-r ^ 2 * (2 * Real.cos δ * Real.cos ε - 1)) * hp + (-r ^ 2 / 2) * hSe
theorem b3n9m051_qEqE_f2_sinusoid (r δ ε t S : ℝ) :
    ((((1 + r * Real.cos δ) + r * S * Real.cos t) - (1 + r * Real.cos (2 * δ - ε)))
          * (1 + r * Real.cos δ)
        + (((r * Real.sin δ) + r * S * Real.sin t) - r * Real.sin (2 * δ - ε))
          * (r * Real.sin δ))
      = r * S * ((1 + r * Real.cos δ) * Real.cos t + r * Real.sin δ * Real.sin t)
        + r * (r - r * (Real.cos δ * Real.cos ε + Real.sin δ * Real.sin ε) + Real.cos δ
               - ((2 * Real.cos δ ^ 2 - 1) * Real.cos ε
                  + (2 * Real.sin δ * Real.cos δ) * Real.sin ε)) := by
  have e1 :
      Real.cos (2 * δ - ε)
        = (2 * Real.cos δ ^ 2 - 1) * Real.cos ε + (2 * Real.sin δ * Real.cos δ) * Real.sin ε := by
    rw [show (2 * δ - ε) = 2 * δ + (-ε) by ring, Real.cos_add, Real.cos_two_mul,
        Real.sin_two_mul, Real.cos_neg, Real.sin_neg]; ring
  have e2 :
      Real.sin (2 * δ - ε)
        = (2 * Real.sin δ * Real.cos δ) * Real.cos ε - (2 * Real.cos δ ^ 2 - 1) * Real.sin ε := by
    rw [show (2 * δ - ε) = 2 * δ + (-ε) by ring, Real.sin_add, Real.cos_two_mul,
        Real.sin_two_mul, Real.cos_neg, Real.sin_neg]; ring
  have hp : Real.sin δ ^ 2 + Real.cos δ ^ 2 = 1 := Real.sin_sq_add_cos_sq δ
  rw [e1, e2]
  linear_combination (-r ^ 2 * (2 * Real.cos δ * Real.cos ε - 1)) * hp
theorem b3n9m051_qEqE_signblock_reduction (r δ ε t S : ℝ) (hr : 0 < r) (hS : 0 < S)
    (hS2 : S ^ 2 = 2 - 2 * Real.cos (δ - ε))
    (hUwxb : 0 ≤ (Real.cos (t - δ) + S / 2)
              * (S * Real.cos t + Real.cos δ - Real.cos (2 * δ - ε))) :
    0 ≤ (r ^ 2 * S * (Real.cos (t - δ) + S / 2))
        * (r * S * ((1 + r * Real.cos δ) * Real.cos t
              + r * Real.sin δ * Real.sin t)
           + r * (r - r * (Real.cos δ * Real.cos ε + Real.sin δ * Real.sin ε)
                + Real.cos δ
                - ((2 * Real.cos δ ^ 2 - 1) * Real.cos ε
                   + (2 * Real.sin δ * Real.cos δ) * Real.sin ε))) := by
  have hcsub : Real.cos (t - δ)
      = Real.cos t * Real.cos δ + Real.sin t * Real.sin δ := Real.cos_sub t δ
  have he1 : Real.cos (2 * δ - ε)
      = (2 * Real.cos δ ^ 2 - 1) * Real.cos ε
        + (2 * Real.sin δ * Real.cos δ) * Real.sin ε := by
    rw [show (2 * δ - ε) = 2 * δ + (-ε) by ring, Real.cos_add, Real.cos_two_mul,
        Real.sin_two_mul, Real.cos_neg, Real.sin_neg]; ring
  have hcsd : Real.cos (δ - ε)
      = Real.cos δ * Real.cos ε + Real.sin δ * Real.sin ε := Real.cos_sub δ ε
  have hSe : S ^ 2 = 2 - 2 * (Real.cos δ * Real.cos ε + Real.sin δ * Real.sin ε) := by
    rw [hS2, hcsd]
  set U := Real.cos (t - δ) + S / 2 with hU
  have key : (r ^ 2 * S * U)
        * (r * S * ((1 + r * Real.cos δ) * Real.cos t
              + r * Real.sin δ * Real.sin t)
           + r * (r - r * (Real.cos δ * Real.cos ε + Real.sin δ * Real.sin ε)
                + Real.cos δ
                - ((2 * Real.cos δ ^ 2 - 1) * Real.cos ε
                   + (2 * Real.sin δ * Real.cos δ) * Real.sin ε)))
      = r ^ 3 * S * (r * S * U ^ 2
          + U * (S * Real.cos t + Real.cos δ - Real.cos (2 * δ - ε))) := by
    rw [he1, hU, hcsub]
    linear_combination
      (-(S * r ^ 4 * (Real.cos t * Real.cos δ + Real.sin t * Real.sin δ + S / 2)) / 2) * hSe
  rw [show (r ^ 2 * S * (Real.cos (t - δ) + S / 2)) = (r ^ 2 * S * U) by rw [hU], key]
  have h3 : 0 ≤ r * S * U ^ 2
        + U * (S * Real.cos t + Real.cos δ - Real.cos (2 * δ - ε)) := by
    have h2 : 0 ≤ r * S * U ^ 2 := by positivity
    have hb : 0 ≤ U * (S * Real.cos t + Real.cos δ - Real.cos (2 * δ - ε)) := hUwxb
    linarith
  exact mul_nonneg (by positivity) h3
namespace QEqEOneCosine
lemma b3n9m051_cs_bound (ct st nx ny : ℝ) (hpt : ct ^ 2 + st ^ 2 = 1)
    (hn1 : nx ^ 2 + ny ^ 2 = 1) : ct * nx + st * ny ≤ 1 := by
  have h : 0 ≤ (ct - nx) ^ 2 + (st - ny) ^ 2 := by positivity
  nlinarith only [hpt, hn1, h]
lemma b3n9m051_cd_nonneg (r cd sd ce se : ℝ) (hr : 0 < r)
    (hpd : cd ^ 2 + sd ^ 2 = 1) (hpe : ce ^ 2 + se ^ 2 = 1)
    (hsd : 0 < sd) (hse : 0 < se) (hce : ce < -(r / 2)) (hcd : -(r / 2) < cd)
    (hs2de' : 2 * sd * cd * ce - (2 * cd ^ 2 - 1) * se < 0)
    (hc2de' : (2 * cd ^ 2 - 1) * ce + 2 * sd * cd * se < -(r / 2)) : 0 ≤ cd := by
  nlinarith only [hpe, hr, hcd, hc2de', hse, hs2de', hce, hpd, hsd, mul_pos hsd hse, sq_nonneg sd, mul_pos hr hse, mul_pos hsd hsd]
lemma b3n9m051_sz_eq (S Z cd sd ce se : ℝ) (hS : 0 < S) (hZ : 0 ≤ Z)
    (hZsq : Z ^ 2 = 1 - S ^ 2 / 4) (hS2 : S ^ 2 = 2 - 2 * (cd * ce + sd * se))
    (hpd : cd ^ 2 + sd ^ 2 = 1) (hpe : ce ^ 2 + se ^ 2 = 1)
    (hsed : 0 ≤ se * cd - ce * sd) : S * Z = se * cd - ce * sd := by
  have hSZsq : (S * Z) ^ 2 = (se * cd - ce * sd) ^ 2 := by
    have hexp : (S * Z) ^ 2 = S ^ 2 * (Z ^ 2) := by ring
    rw [hexp, hZsq]
    linear_combination (-(S ^ 2 - 2 * cd * ce - 2 * sd * se - 2) / 4) * hS2
      + (-ce ^ 2 - se ^ 2) * hpd + (-1 : ℝ) * hpe
  have hSZnn : 0 ≤ S * Z := mul_nonneg (le_of_lt hS) hZ
  nlinarith only [hSZsq, hSZnn, hsed, sq_nonneg (S * Z - (se * cd - ce * sd))]
lemma b3n9m051_E_nonneg (S Z cd sd ce se st : ℝ)
    (hsd : 0 < sd) (hse : 0 < se) (hcd0 : 0 ≤ cd) (hZ : 0 ≤ Z) (hS : 0 < S)
    (hst_le : S * st + sd ≤ 0) (hSZ : S * Z = se * cd - ce * sd)
    (hS2 : S ^ 2 = 2 - 2 * (cd * ce + sd * se))
    (hpd : cd ^ 2 + sd ^ 2 = 1) (hpe : ce ^ 2 + se ^ 2 = 1)
    (hs2de' : 2 * sd * cd * ce - (2 * cd ^ 2 - 1) * se < 0) :
    0 ≤ cd ^ 2 + st ^ 2 - S ^ 2 / 4 - 2 * Z * cd * st := by
  have hS2pos : 0 < S ^ 2 := by positivity
  have hT : 0 ≤ se * (2 * sd - (2 * sd * cd * ce - (2 * cd ^ 2 - 1) * se)) :=
    mul_nonneg (le_of_lt hse) (by linarith)
  set EsmaxS2 := -S ^ 4 / 4 + S ^ 2 * cd ^ 2 + 2 * S * Z * cd * sd + sd ^ 2 with hEs
  have hEsT : EsmaxS2 = se * (2 * sd - (2 * sd * cd * ce - (2 * cd ^ 2 - 1) * se)) := by
    rw [hEs]
    linear_combination (2 * cd * sd) * hSZ
      + (-(S ^ 2 - 4 * cd ^ 2 - 2 * cd * ce - 2 * sd * se + 2) / 4) * hS2
      + (-2 * cd * ce - ce ^ 2 - 2 * se ^ 2 + 2) * hpd + ((sd - 1) * (sd + 1)) * hpe
  have hEsmax : 0 ≤ EsmaxS2 := hEsT ▸ hT
  have hSZcd : 0 ≤ 2 * S * Z * cd := by positivity
  have hfac2 : S * st - sd - 2 * S * Z * cd ≤ 0 := by nlinarith only [hsd, hst_le, hSZcd]
  have hprod : 0 ≤ (S * st + sd) * (S * st - sd - 2 * S * Z * cd) := by
    have h := mul_nonneg (neg_nonneg.mpr hst_le) (neg_nonneg.mpr hfac2); nlinarith only [h]
  have hES2 : (cd ^ 2 + st ^ 2 - S ^ 2 / 4 - 2 * Z * cd * st) * S ^ 2
      = EsmaxS2 + (S * st + sd) * (S * st - sd - 2 * S * Z * cd) := by rw [hEs]; ring
  nlinarith only [hEs, hEsT, hprod, hsd, hse, hs2de', hES2, hEsmax, hS2pos]
lemma b3n9m051_one_cosine (S Z cd ct st : ℝ)
    (hS : 0 < S) (hZ : 0 ≤ Z) (hZsq : Z ^ 2 = 1 - S ^ 2 / 4)
    (hpt : ct ^ 2 + st ^ 2 = 1) (hcd0 : 0 ≤ cd) (hstneg : st < 0)
    (hE : 0 ≤ cd ^ 2 + st ^ 2 - S ^ 2 / 4 - 2 * Z * cd * st) :
    -(S / 2) * ct + Z * st ≤ cd := by
  have hZst : Z * st ≤ 0 := mul_nonpos_of_nonneg_of_nonpos hZ (le_of_lt hstneg)
  have hrhs : 0 ≤ cd - Z * st := by linarith
  have hsq : (S / 2 * |ct|) ^ 2 ≤ (cd - Z * st) ^ 2 := by
    have hct2 : ct ^ 2 = 1 - st ^ 2 := by linarith [hpt]
    have heq : (S / 2 * |ct|) ^ 2 = S ^ 2 / 4 * (1 - st ^ 2) := by rw [mul_pow, sq_abs, hct2]; ring
    rw [heq]; nlinarith only [hE, hZsq]
  have habs : S / 2 * |ct| ≤ cd - Z * st := by
    have h1 : (0:ℝ) ≤ S / 2 * |ct| := by positivity
    nlinarith only [hsq, hcd0, hZst, h1, hrhs]
  have hnct : -ct ≤ |ct| := neg_le_abs ct
  have hmul : (S / 2) * (-ct) ≤ S / 2 * |ct| := mul_le_mul_of_nonneg_left hnct (by positivity)
  nlinarith only [habs, hmul]
end QEqEOneCosine
set_option maxHeartbeats 400000 in
theorem qEqE_oneCosine_crux_of_signs (r δ ε t S : ℝ)
    (hr : 0 < r) (hS : 0 < S)
    (hS2eq : S ^ 2 = 2 - 2 * Real.cos (δ - ε))
    (hsd : 0 < Real.sin δ) (hse : 0 < Real.sin ε)
    (hcd0 : 0 ≤ Real.cos δ)
    (hsed : 0 ≤ Real.sin ε * Real.cos δ - Real.cos ε * Real.sin δ)
    (hs2de : Real.sin (2 * δ - ε) < 0)
    (hlower : r * Real.sin δ + r * S * Real.sin t < 0) :
    0 ≤ (Real.cos (t - δ) + S / 2)
        * (S * Real.cos t + Real.cos δ - Real.cos (2 * δ - ε)) := by
  set cd := Real.cos δ with hcd_def
  set sd := Real.sin δ with hsd_def
  set ce := Real.cos ε with hce_def
  set se := Real.sin ε with hse_def
  set ct := Real.cos t with hct_def
  set st := Real.sin t with hst_def
  have hpd : cd ^ 2 + sd ^ 2 = 1 := by rw [hcd_def, hsd_def, add_comm]; exact Real.sin_sq_add_cos_sq δ
  have hpe : ce ^ 2 + se ^ 2 = 1 := by rw [hce_def, hse_def, add_comm]; exact Real.sin_sq_add_cos_sq ε
  have hpt : ct ^ 2 + st ^ 2 = 1 := by rw [hct_def, hst_def, add_comm]; exact Real.sin_sq_add_cos_sq t
  have hc2de_eq : Real.cos (2 * δ - ε) = (2 * cd ^ 2 - 1) * ce + 2 * sd * cd * se := by
    rw [hcd_def, hce_def, hsd_def, hse_def,
        show (2 * δ - ε) = 2 * δ + (-ε) by ring, Real.cos_add, Real.cos_two_mul,
        Real.sin_two_mul, Real.cos_neg, Real.sin_neg]; ring
  have hs2de_eq : Real.sin (2 * δ - ε) = 2 * sd * cd * ce - (2 * cd ^ 2 - 1) * se := by
    rw [hcd_def, hce_def, hsd_def, hse_def,
        show (2 * δ - ε) = 2 * δ + (-ε) by ring, Real.sin_add, Real.cos_two_mul,
        Real.sin_two_mul, Real.cos_neg, Real.sin_neg]; ring
  have hcde_eq : Real.cos (δ - ε) = cd * ce + sd * se := by
    rw [hcd_def, hce_def, hsd_def, hse_def, Real.cos_sub]
  have hctd_eq : Real.cos (t - δ) = ct * cd + st * sd := by
    rw [hct_def, hcd_def, hst_def, hsd_def, Real.cos_sub]
  have hS2 : S ^ 2 = 2 - 2 * (cd * ce + sd * se) := by rw [hS2eq, hcde_eq]
  have hs2de' : 2 * sd * cd * ce - (2 * cd ^ 2 - 1) * se < 0 := by rw [← hs2de_eq]; exact hs2de
  have hcd0_cd : 0 ≤ cd := by simpa [hcd_def] using hcd0
  have hsed_cd : 0 ≤ se * cd - ce * sd := by
    simpa [hse_def, hcd_def, hce_def, hsd_def] using hsed
  have hcde_gt : -1 < cd * ce + sd * se := by
    nlinarith only [hpd, hpe, hsd, hse, mul_pos hsd hse, sq_nonneg (cd - ce), sq_nonneg (sd - se)]
  have h14 : (0:ℝ) ≤ 1 - S ^ 2 / 4 := by rw [hS2]; linarith
  set Z := Real.sqrt (1 - S ^ 2 / 4) with hZ_def
  have hZ : 0 ≤ Z := Real.sqrt_nonneg _
  have hZsq : Z ^ 2 = 1 - S ^ 2 / 4 := by rw [hZ_def, Real.sq_sqrt h14]
  have hSZ : S * Z = se * cd - ce * sd :=
    QEqEOneCosine.b3n9m051_sz_eq S Z cd sd ce se hS hZ hZsq hS2 hpd hpe hsed_cd
  have hst_le : S * st + sd ≤ 0 := by nlinarith only [hlower, hr]
  have hstneg : st < 0 := by nlinarith only [hS, hsd, hst_le]
  set nx := -(S/2) * cd + Z * sd with hnx_def
  set ny := -(S/2) * sd - Z * cd with hny_def
  set ctb := -(S/2) * ct + Z * st with hctb_def
  have hn1 : nx ^ 2 + ny ^ 2 = 1 := by
    rw [hnx_def, hny_def]; linear_combination ((S ^ 2 + 4 * Z ^ 2) / 4) * hpd + hZsq
  have hwxbA : S * ct + cd - Real.cos (2 * δ - ε) = S * (ct - nx) := by
    rw [hc2de_eq, hnx_def]; linear_combination (-ce) * hpd + sd * hSZ + (-cd / 2) * hS2
  have hU_def : Real.cos (t - δ) + S / 2 = ct * cd + st * sd + S / 2 := by rw [hctd_eq]
  have hwxbB : (ct * cd + st * sd + S / 2) * (S * (ct - nx))
      = S * (1 - (ct * nx + st * ny)) * (cd - ctb) := by
    rw [hnx_def, hny_def, hctb_def]
    linear_combination (-S * Z * st) * hpd
      + (-S * (S ^ 2 * cd - 2 * S * Z * sd - 4 * cd) / 4) * hpt
      + (S * st * (cd * st - ct * sd)) * hZsq
  have hmaster : (Real.cos (t - δ) + S / 2) * (S * Real.cos t + Real.cos δ - Real.cos (2 * δ - ε))
      = S * (1 - (ct * nx + st * ny)) * (cd - ctb) := by
    rw [hU_def, ← hct_def, ← hcd_def, hwxbA, hwxbB]
  rw [hmaster]
  have hmn : ct * nx + st * ny ≤ 1 := QEqEOneCosine.b3n9m051_cs_bound ct st nx ny hpt hn1
  have hfac1 : 0 ≤ S * (1 - (ct * nx + st * ny)) := mul_nonneg (le_of_lt hS) (by linarith [hmn])
  have hE : 0 ≤ cd ^ 2 + st ^ 2 - S ^ 2 / 4 - 2 * Z * cd * st :=
    QEqEOneCosine.b3n9m051_E_nonneg S Z cd sd ce se st hsd hse hcd0_cd hZ hS hst_le hSZ hS2 hpd hpe hs2de'
  have hone : ctb ≤ cd := by
    rw [hctb_def]; exact QEqEOneCosine.b3n9m051_one_cosine S Z cd ct st hS hZ hZsq hpt hcd0_cd hstneg hE
  have hfac3 : 0 ≤ cd - ctb := by linarith [hone]
  exact mul_nonneg hfac1 hfac3
set_option maxHeartbeats 400000 in
theorem qEqE_oneCosine_crux (r δ ε t S : ℝ)
    (hr : 0 < r) (hr1 : r < 1) (hS : 0 < S)
    (hS2eq : S ^ 2 = 2 - 2 * Real.cos (δ - ε))
    (hsd : 0 < Real.sin δ) (hcd : -(r / 2) < Real.cos δ)
    (hse : 0 < Real.sin ε) (hce : Real.cos ε < -(r / 2))
    (hs2de : Real.sin (2 * δ - ε) < 0) (hc2de : Real.cos (2 * δ - ε) < -(r / 2))
    (hlower : r * Real.sin δ + r * S * Real.sin t < 0) :
    0 ≤ (Real.cos (t - δ) + S / 2)
        * (S * Real.cos t + Real.cos δ - Real.cos (2 * δ - ε)) := by
  have hpd : Real.cos δ ^ 2 + Real.sin δ ^ 2 = 1 := by
    rw [add_comm]
    exact Real.sin_sq_add_cos_sq δ
  have hpe : Real.cos ε ^ 2 + Real.sin ε ^ 2 = 1 := by
    rw [add_comm]
    exact Real.sin_sq_add_cos_sq ε
  have hc2de_eq :
      Real.cos (2 * δ - ε) =
        (2 * Real.cos δ ^ 2 - 1) * Real.cos ε
          + 2 * Real.sin δ * Real.cos δ * Real.sin ε := by
    rw [show (2 * δ - ε) = 2 * δ + (-ε) by ring, Real.cos_add,
      Real.cos_two_mul, Real.sin_two_mul, Real.cos_neg, Real.sin_neg]
    ring
  have hs2de_eq :
      Real.sin (2 * δ - ε) =
        2 * Real.sin δ * Real.cos δ * Real.cos ε
          - (2 * Real.cos δ ^ 2 - 1) * Real.sin ε := by
    rw [show (2 * δ - ε) = 2 * δ + (-ε) by ring, Real.sin_add,
      Real.cos_two_mul, Real.sin_two_mul, Real.cos_neg, Real.sin_neg]
    ring
  have hs2de' :
      2 * Real.sin δ * Real.cos δ * Real.cos ε
          - (2 * Real.cos δ ^ 2 - 1) * Real.sin ε < 0 := by
    rw [← hs2de_eq]
    exact hs2de
  have hc2de' :
      (2 * Real.cos δ ^ 2 - 1) * Real.cos ε
          + 2 * Real.sin δ * Real.cos δ * Real.sin ε < -(r / 2) := by
    rw [← hc2de_eq]
    exact hc2de
  have hcd0 : 0 ≤ Real.cos δ :=
    QEqEOneCosine.b3n9m051_cd_nonneg r (Real.cos δ) (Real.sin δ) (Real.cos ε) (Real.sin ε)
      hr hpd hpe hsd hse hce hcd hs2de' hc2de'
  have hsed : 0 ≤ Real.sin ε * Real.cos δ - Real.cos ε * Real.sin δ := by
    have h1 : 0 ≤ Real.sin ε * Real.cos δ := mul_nonneg (le_of_lt hse) hcd0
    have h2 : Real.cos ε * Real.sin δ < 0 := mul_neg_of_neg_of_pos (by linarith) hsd
    linarith
  exact qEqE_oneCosine_crux_of_signs r δ ε t S hr hS hS2eq hsd hse hcd0 hsed hs2de hlower
set_option maxHeartbeats 400000 in
theorem qEqE_lowerArc_sameSign (r δ ε t S : ℝ)
    (hr : 0 < r) (hr1 : r < 1) (hS : 0 < S)
    (hS2eq : S ^ 2 = 2 - 2 * Real.cos (δ - ε))
    (hsd : 0 < Real.sin δ) (hcd : -(r / 2) < Real.cos δ)
    (hse : 0 < Real.sin ε) (hce : Real.cos ε < -(r / 2))
    (hs2de : Real.sin (2 * δ - ε) < 0) (hc2de : Real.cos (2 * δ - ε) < -(r / 2))
    (hlower : r * Real.sin δ + r * S * Real.sin t < 0) :
    0 ≤ (r ^ 2 * S * (Real.cos (t - δ) + S / 2))
        * (r * S * ((1 + r * Real.cos δ) * Real.cos t
              + r * Real.sin δ * Real.sin t)
           + r * (r - r * (Real.cos δ * Real.cos ε + Real.sin δ * Real.sin ε)
                + Real.cos δ
                - ((2 * Real.cos δ ^ 2 - 1) * Real.cos ε
                   + (2 * Real.sin δ * Real.cos δ) * Real.sin ε))) :=
  b3n9m051_qEqE_signblock_reduction r δ ε t S hr hS hS2eq
    (qEqE_oneCosine_crux r δ ε t S hr hr1 hS hS2eq hsd hcd hse hce hs2de hc2de hlower)
theorem qEqE_lowerArc_sameSign_flipped_of_signs (r δ ε t S : ℝ)
    (hr : 0 < r) (hS : 0 < S)
    (hS2eq : S ^ 2 = 2 - 2 * Real.cos (δ - ε))
    (hsd : 0 < Real.sin δ) (hse : 0 < Real.sin ε)
    (hcd0 : 0 ≤ Real.cos δ)
    (hsed : 0 ≤ Real.sin ε * Real.cos δ - Real.cos ε * Real.sin δ)
    (hs2de : Real.sin (2 * δ - ε) < 0)
    (hlower : r * Real.sin δ + r * S * Real.sin t < 0) :
    0 ≤ (r ^ 2 * S * (Real.cos (t - δ) + S / 2))
        * (r * S * ((1 + r * Real.cos δ) * Real.cos t
              + r * Real.sin δ * Real.sin t)
           + r * (r - r * (Real.cos δ * Real.cos ε + Real.sin δ * Real.sin ε)
                + Real.cos δ
                - ((2 * Real.cos δ ^ 2 - 1) * Real.cos ε
                   + (2 * Real.sin δ * Real.cos δ) * Real.sin ε))) :=
  b3n9m051_qEqE_signblock_reduction r δ ε t S hr hS hS2eq
    (qEqE_oneCosine_crux_of_signs r δ ε t S hr hS hS2eq hsd hse hcd0 hsed hs2de hlower)
theorem b3n9m051_qEqE_noWrap_of_c2Side (r δ ε : ℝ)
    (hr : 0 < r) (hδπ : δ ≤ Real.pi) (hε0 : 0 ≤ ε)
    (hsd : 0 < Real.sin δ) (hse : 0 < Real.sin ε)
    (hcd : -(r / 2) < Real.cos δ)
    (hs2de : Real.sin (2 * δ - ε) < 0)
    (hside :
      Real.sin δ - Real.sin ε
        - r * (Real.sin ε * Real.cos δ - Real.cos ε * Real.sin δ) ≤ 0) :
    2 * δ < ε := by
  by_contra hnot
  push_neg at hnot
  set w : ℝ := 2 * δ - ε with hw_def
  have hw_nonneg : 0 ≤ w := by
    rw [hw_def]
    linarith
  have hδ_lt_pi : δ < Real.pi := by
    rcases lt_or_eq_of_le hδπ with h | h
    · exact h
    · exfalso
      rw [h, Real.sin_pi] at hsd
      exact lt_irrefl _ hsd
  have hπ_lt_w : Real.pi < w := by
    by_contra hnotπ
    push_neg at hnotπ
    have hsin_nonneg : 0 ≤ Real.sin w :=
      Real.sin_nonneg_of_nonneg_of_le_pi hw_nonneg hnotπ
    rw [hw_def] at hsin_nonneg
    exact (not_le_of_gt hs2de) hsin_nonneg
  have hε_lt_δ : ε < δ := by
    rw [hw_def] at hπ_lt_w
    linarith [hδ_lt_pi]
  have hε_pos : 0 < ε := by
    rcases lt_or_eq_of_le hε0 with h | h
    · exact h
    · exfalso
      rw [← h, Real.sin_zero] at hse
      exact lt_irrefl _ hse
  set u : ℝ := δ - ε with hu_def
  have hu_pos : 0 < u := by
    rw [hu_def]
    linarith
  have hu_lt_pi : u < Real.pi := by
    rw [hu_def]
    linarith [hδπ, hε_pos]
  have hsin_u_pos : 0 < Real.sin u :=
    Real.sin_pos_of_pos_of_lt_pi hu_pos hu_lt_pi
  have hsd_nonneg : 0 ≤ Real.sin δ := le_of_lt hsd
  have hone_minus_cos_nonneg : 0 ≤ 1 - Real.cos u := by
    nlinarith only [Real.cos_le_one u]
  have hr_cos_pos : 0 < r + Real.cos δ := by
    linarith
  have hpos :
      0 < Real.sin δ * (1 - Real.cos u) + (r + Real.cos δ) * Real.sin u := by
    have hfirst : 0 ≤ Real.sin δ * (1 - Real.cos u) :=
      mul_nonneg hsd_nonneg hone_minus_cos_nonneg
    have hsecond : 0 < (r + Real.cos δ) * Real.sin u :=
      mul_pos hr_cos_pos hsin_u_pos
    linarith
  have hrewrite :
      Real.sin δ - Real.sin ε
          - r * (Real.sin ε * Real.cos δ - Real.cos ε * Real.sin δ)
        = Real.sin δ * (1 - Real.cos u) + (r + Real.cos δ) * Real.sin u := by
    rw [show Real.sin ε * Real.cos δ - Real.cos ε * Real.sin δ =
        Real.sin (ε - δ) by rw [Real.sin_sub]]
    rw [show ε - δ = -u by rw [hu_def]; ring, Real.sin_neg]
    rw [show ε = δ - u by rw [hu_def]; ring, Real.sin_sub]
    ring
  rw [hrewrite] at hside
  linarith
theorem qEqE_lowerArc_sameSign_flipped_of_noWrap (r δ ε t S : ℝ)
    (hr : 0 < r) (hS : 0 < S)
    (hS2eq : S ^ 2 = 2 - 2 * Real.cos (δ - ε))
    (hsd : 0 < Real.sin δ) (hse : 0 < Real.sin ε)
    (hδ0 : 0 ≤ δ) (hεπ : ε ≤ Real.pi)
    (h2δε : 2 * δ < ε)
    (hs2de : Real.sin (2 * δ - ε) < 0)
    (hlower : r * Real.sin δ + r * S * Real.sin t < 0) :
    0 ≤ (r ^ 2 * S * (Real.cos (t - δ) + S / 2))
        * (r * S * ((1 + r * Real.cos δ) * Real.cos t
              + r * Real.sin δ * Real.sin t)
           + r * (r - r * (Real.cos δ * Real.cos ε + Real.sin δ * Real.sin ε)
                + Real.cos δ
                - ((2 * Real.cos δ ^ 2 - 1) * Real.cos ε
                   + (2 * Real.sin δ * Real.cos δ) * Real.sin ε))) := by
  have hδlt : δ < Real.pi / 2 := by
    nlinarith only [hεπ, h2δε]
  have hcd0 : 0 ≤ Real.cos δ := by
    exact le_of_lt (Real.cos_pos_of_mem_Ioo ⟨by linarith [Real.pi_pos], hδlt⟩)
  have hsed : 0 ≤ Real.sin ε * Real.cos δ - Real.cos ε * Real.sin δ := by
    have hdiff_nonneg : 0 ≤ ε - δ := by
      nlinarith only [hδ0, h2δε]
    have hdiff_le_pi : ε - δ ≤ Real.pi := by
      linarith [hεπ, hδ0]
    have hsin : 0 ≤ Real.sin (ε - δ) :=
      Real.sin_nonneg_of_nonneg_of_le_pi hdiff_nonneg hdiff_le_pi
    rwa [Real.sin_sub] at hsin
  exact qEqE_lowerArc_sameSign_flipped_of_signs r δ ε t S hr hS hS2eq hsd hse
    hcd0 hsed hs2de hlower
theorem qEqE_lowerArc_sameSign_flipped_of_c2Side (r δ ε t S : ℝ)
    (hr : 0 < r) (hS : 0 < S)
    (hS2eq : S ^ 2 = 2 - 2 * Real.cos (δ - ε))
    (hsd : 0 < Real.sin δ) (hcd : -(r / 2) < Real.cos δ)
    (hse : 0 < Real.sin ε)
    (hδ0 : 0 ≤ δ) (hδπ : δ ≤ Real.pi)
    (hε0 : 0 ≤ ε) (hεπ : ε ≤ Real.pi)
    (hs2de : Real.sin (2 * δ - ε) < 0)
    (hside :
      Real.sin δ - Real.sin ε
        - r * (Real.sin ε * Real.cos δ - Real.cos ε * Real.sin δ) ≤ 0)
    (hlower : r * Real.sin δ + r * S * Real.sin t < 0) :
    0 ≤ (r ^ 2 * S * (Real.cos (t - δ) + S / 2))
        * (r * S * ((1 + r * Real.cos δ) * Real.cos t
              + r * Real.sin δ * Real.sin t)
           + r * (r - r * (Real.cos δ * Real.cos ε + Real.sin δ * Real.sin ε)
                + Real.cos δ
                - ((2 * Real.cos δ ^ 2 - 1) * Real.cos ε
                   + (2 * Real.sin δ * Real.cos δ) * Real.sin ε))) := by
  have h2δε : 2 * δ < ε :=
    b3n9m051_qEqE_noWrap_of_c2Side r δ ε hr hδπ hε0 hsd hse hcd hs2de hside
  exact qEqE_lowerArc_sameSign_flipped_of_noWrap r δ ε t S hr hS hS2eq hsd hse
    hδ0 hεπ h2δε hs2de hlower
theorem b3n9m051_secondCoord_pos_of_dist_lt_centerHeight
    {c p : ℝ²}
    (hr : dist c p < c 1)
    (hpneg : p 1 < 0) :
    False := by
  have hcy : 0 < c 1 := by
    exact lt_of_le_of_lt dist_nonneg hr
  have hsquare :
      dist c p ^ 2 = (c 0 - p 0) ^ 2 + (c 1 - p 1) ^ 2 := by
    rw [b3n9m051_dist_sq_eq_coord_sq_add_coord_sq]
  have hygap : c 1 < c 1 - p 1 := by
    linarith
  have hygap_sq : (c 1) ^ 2 < (c 1 - p 1) ^ 2 := by
    have hpos : 0 < c 1 - p 1 := by linarith
    nlinarith only [hpneg, hcy]
  have hlt_sq : (c 1) ^ 2 < dist c p ^ 2 := by
    rw [hsquare]
    nlinarith only [hygap_sq, sq_nonneg (c 0 - p 0)]
  have hdist_nonneg : 0 ≤ dist c p := dist_nonneg
  have hdist_sq_lt : dist c p ^ 2 < (c 1) ^ 2 := by
    nlinarith only [hsquare, hygap_sq, hr, hcy, hdist_nonneg]
  nlinarith only [hsquare, hygap_sq, hdist_sq_lt]
theorem i3_v3_a2_normalized_height_gap_of_delta_normalization
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S)
    (hnorm : S.I3V3A2DeltaNormalization Z) :
    S.I3V3A2NormalizedHeightGap Z := by
  rcases hnorm with ⟨T, tau, δ, hv1, hv2, ha2, hv3, hδlo, hδhi, hbelow⟩
  refine ⟨T, tau, ?_, hbelow⟩
  have htwoδ_lo : Real.pi / 2 ≤ 2 * δ := by
    linarith
  have htwoδ_hi : 2 * δ < 2 * Real.pi / 3 := by
    linarith
  have hsin_lb :
      Real.sqrt 3 / 2 < Real.sin (2 * δ) := by
    have hpi_sub_lo : Real.pi / 3 < Real.pi - 2 * δ := by
      linarith
    have hpi_sub_hi : Real.pi - 2 * δ ≤ Real.pi / 2 := by
      linarith
    have hsin :
        Real.sin (Real.pi / 3) < Real.sin (Real.pi - 2 * δ) := by
      apply Real.sin_lt_sin_of_lt_of_le_pi_div_two
      · linarith [Real.pi_pos]
      · exact hpi_sub_hi
      · exact hpi_sub_lo
    rw [Real.sin_pi_sub] at hsin
    simpa [Real.sin_pi_div_three] using hsin
  have hcos_nonpos : Real.cos (2 * δ) ≤ 0 := by
    apply Real.cos_nonpos_of_pi_div_two_le_of_le
    · exact htwoδ_lo
    · linarith [Real.pi_pos, hδhi]
  have hdist_sq :
      dist (T S.triangle.v3) (T Z.a2) ^ 2 =
        2 + Real.cos (2 * δ) - Real.sqrt 3 * Real.sin (2 * δ) := by
    have hsqrt3_sq : Real.sqrt 3 ^ 2 = 3 := by
      exact Real.sq_sqrt (show (0 : ℝ) ≤ 3 by positivity)
    have hsin_sq_add_cos_sq : Real.sin δ ^ 2 + Real.cos δ ^ 2 = 1 := by
      simpa using Real.sin_sq_add_cos_sq δ
    rw [hv3, ha2, b3n9m051_dist_sq_eq_coord_sq_add_coord_sq]
    simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    rw [Real.sin_two_mul, Real.cos_two_mul]
    nlinarith only [hsqrt3_sq, hsin_sq_add_cos_sq]
  have hsqrt3_sq : Real.sqrt 3 ^ 2 = 3 := by
    exact Real.sq_sqrt (show (0 : ℝ) ≤ 3 by positivity)
  have hsqrt3_pos : 0 < Real.sqrt 3 := by
    positivity
  have hs3mul : 3 / 2 < Real.sqrt 3 * Real.sin (2 * δ) := by
    nlinarith only [hsqrt3_sq, hsin_lb, hsqrt3_pos]
  have hdist_sq_lt_half : dist (T S.triangle.v3) (T Z.a2) ^ 2 < 1 / 2 := by
    rw [hdist_sq]
    linarith [hcos_nonpos, hs3mul]
  have hdist_nonneg : 0 ≤ dist (T S.triangle.v3) (T Z.a2) := dist_nonneg
  have hsqrt_nonneg : 0 ≤ Real.sqrt 3 / 2 := by
    positivity
  have hdist_lt_sqrt3 :
      dist (T S.triangle.v3) (T Z.a2) < Real.sqrt 3 / 2 := by
    have hsqrt_sq : (Real.sqrt 3 / 2) ^ 2 = 3 / 4 := by
      nlinarith only [hsqrt3_sq]
    set d : ℝ := dist (T S.triangle.v3) (T Z.a2)
    set s : ℝ := Real.sqrt 3 / 2
    have hd : 0 ≤ d := by
      dsimp [d]
      exact hdist_nonneg
    have hs : 0 ≤ s := by
      dsimp [s]
      exact hsqrt_nonneg
    have hdsq : d ^ 2 < s ^ 2 := by
      dsimp [d, s]
      rw [hsqrt_sq]
      linarith [hdist_sq_lt_half]
    by_contra h
    have hsle : s ≤ d := le_of_not_gt h
    have hsq_ge : s ^ 2 ≤ d ^ 2 := by
      gcongr
    linarith
  have hv3_y : (T S.triangle.v3) 1 = Real.sin (2 * δ) := by
    rw [hv3]
    simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    rw [Real.sin_two_mul]
    ring_nf
  calc
    dist (T S.triangle.v3) (T Z.a2) < Real.sqrt 3 / 2 := hdist_lt_sqrt3
    _ < Real.sin (2 * δ) := hsin_lb
    _ = (T S.triangle.v3) 1 := hv3_y.symm
theorem i3_no_point_on_v3_radius_at_a2_of_normalized_height_gap
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S)
    (hgap : S.I3V3A2NormalizedHeightGap Z) :
    S.I3NoPointOnV3RadiusAtA2 Z := by
  rcases hgap with ⟨T, tau, hradius, hbelow⟩
  intro x hxI3 hEq
  have hEqT :
      dist (T S.triangle.v3) (T x) = dist (T S.triangle.v3) (T Z.a2) := by
    exact (tau.dist_eq_iff S.triangle.v3 x Z.a2).2 hEq
  have hradius' : dist (T S.triangle.v3) (T x) < (T S.triangle.v3) 1 := by
    rw [hEqT]
    exact hradius
  exact b3n9m051_secondCoord_pos_of_dist_lt_centerHeight hradius' (hbelow x hxI3)
theorem i3_on_v3_radius_at_a2_card_le_one_of_no_hit
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S)
    (hnohit : S.I3NoPointOnV3RadiusAtA2 Z) :
    S.I3OnV3RadiusAtA2CardLeOne Z := by
  classical
  unfold I3OnV3RadiusAtA2CardLeOne
  have hfilter_empty :
      S.I3.filter (fun x => dist S.triangle.v3 x = dist S.triangle.v3 Z.a2) = ∅ := by
    ext x
    constructor
    · intro hx
      exact False.elim ((hnohit x (Finset.mem_filter.mp hx).1) ((Finset.mem_filter.mp hx).2))
    · intro hx
      exact False.elim (by simpa using hx)
  have hfilter_card :
      (S.I3.filter (fun x => dist S.triangle.v3 x = dist S.triangle.v3 Z.a2)).card = 0 := by
    simpa [hfilter_empty]
  omega
def ZeroDefectCapLayout.b3n9m051_swapI1
    {A : Finset ℝ²} {S : FiniteEndpointShell A}
    (Z : ZeroDefectCapLayout S) : ZeroDefectCapLayout S where
  a1 := Z.b1
  b1 := Z.a1
  a2 := Z.a2
  b2 := Z.b2
  a3 := Z.a3
  b3 := Z.b3
  hI1 := by simpa [Finset.pair_comm] using Z.hI1
  hI2 := Z.hI2
  hI3 := Z.hI3
def ZeroDefectCapLayout.swapI2
    {A : Finset ℝ²} {S : FiniteEndpointShell A}
    (Z : ZeroDefectCapLayout S) : ZeroDefectCapLayout S where
  a1 := Z.a1
  b1 := Z.b1
  a2 := Z.b2
  b2 := Z.a2
  a3 := Z.a3
  b3 := Z.b3
  hI1 := Z.hI1
  hI2 := by
    ext x
    constructor <;> intro hx <;> simpa [Z.hI2, or_comm] using hx
  hI3 := Z.hI3
theorem selectorShape_v3_q_eq_v1_impossible_of_distance_chain
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r : ℝ}
    (hpacket : SelectorV3Qv1Packet S Z r)
    (hb1a1 : dist S.triangle.v3 Z.b1 < dist S.triangle.v3 Z.a1)
    (ha1v2 : dist S.triangle.v3 Z.a1 < dist S.triangle.v3 S.triangle.v2)
    (hv2v1 : dist S.triangle.v3 S.triangle.v2 < dist S.triangle.v3 S.triangle.v1) :
    False := by
  classical
  let T := S.witnessClassAt_v3 r
  rcases hpacket with ⟨p, hp, hpeq, hqeq⟩
  have hpT : p ∈ T := by
    have hpmem : p ∈ ({p} : Finset ℝ²) := by simp
    rw [← hpeq] at hpmem
    exact (Finset.mem_inter.mp hpmem).1
  have hv1T : S.triangle.v1 ∈ T := by
    have hv1mem : S.triangle.v1 ∈ ({S.triangle.v1} : Finset ℝ²) := by simp
    rw [← hqeq] at hv1mem
    exact (Finset.mem_inter.mp hv1mem).1
  have hpeqd : dist S.triangle.v3 p = dist S.triangle.v3 S.triangle.v1 := by
    exact (Finset.mem_filter.mp hpT).2.trans ((Finset.mem_filter.mp hv1T).2.symm)
  rcases Finset.mem_insert.mp hp with hpa1 | hp
  · subst hpa1
    linarith
  rcases Finset.mem_insert.mp hp with hpb1 | hpv2
  · have hpb1' : p = Z.b1 := by simpa using hpb1
    subst hpb1'
    linarith
  have hpv2' : p = S.triangle.v2 := by simpa using hpv2
  subst hpv2'
  linarith
theorem selectorShape_v3_q_eq_v1_impossible
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r : ℝ}
    (hpacket : SelectorV3Qv1Packet S Z r)
    (hv2v1 : dist S.triangle.v3 S.triangle.v2 < dist S.triangle.v3 S.triangle.v1) :
    False := by
  classical
  rcases S.I1_v3_distance_chain with ⟨near, far, hI1eq, hnearfar, hfarv2⟩
  have hI1card : ({Z.a1, Z.b1} : Finset ℝ²).card = 2 := by
    simpa [Z.hI1] using S.I1_card_eq_two
  have hab_ne : Z.a1 ≠ Z.b1 := by
    intro h
    simp [h] at hI1card
  have haI1 : Z.a1 ∈ S.I1 := by
    rw [Z.hI1]
    simp
  have hbI1 : Z.b1 ∈ S.I1 := by
    rw [Z.hI1]
    simp
  rw [← hI1eq] at haI1 hbI1
  rcases Finset.mem_insert.mp haI1 with haNear | haFar
  · have hbFar : Z.b1 = far := by
      rcases Finset.mem_insert.mp hbI1 with hbNear | hbFar
      · exfalso
        exact hab_ne (haNear.trans hbNear.symm)
      · simpa using hbFar
    have hpacket' : SelectorV3Qv1Packet S (Z.b3n9m051_swapI1) r := by
      simpa [SelectorV3Qv1Packet, ZeroDefectCapLayout.b3n9m051_swapI1, Finset.insert_comm] using hpacket
    apply selectorShape_v3_q_eq_v1_impossible_of_distance_chain
      (S := S) (Z := Z.b3n9m051_swapI1) (r := r) hpacket'
    · simpa [ZeroDefectCapLayout.b3n9m051_swapI1, haNear, hbFar] using hnearfar
    · simpa [ZeroDefectCapLayout.b3n9m051_swapI1, hbFar] using hfarv2
    · exact hv2v1
  · have haFar' : Z.a1 = far := by
      simpa using haFar
    have hbNear : Z.b1 = near := by
      rcases Finset.mem_insert.mp hbI1 with hbNear | hbFar
      · simpa using hbNear
      · exfalso
        have hbFar' : Z.b1 = far := by simpa using hbFar
        exact hab_ne (haFar'.trans hbFar'.symm)
    apply selectorShape_v3_q_eq_v1_impossible_of_distance_chain
      (S := S) (Z := Z) (r := r) hpacket
    · simpa [hbNear, haFar'] using hnearfar
    · simpa [haFar'] using hfarv2
    · exact hv2v1
theorem selectorShape_v3_q_eq_a2_impossible
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r : ℝ}
    (hpacket : SelectorV3Qa2Packet S Z r)
    (hbound : S.I3OnV3RadiusAtA2CardLeOne Z) :
    False := by
  classical
  let T := S.witnessClassAt_v3 r
  rcases hpacket with ⟨hI3sub, p, hp, hpeq, hqeq⟩
  have ha2T : Z.a2 ∈ T := by
    have ha2mem : Z.a2 ∈ ({Z.a2} : Finset ℝ²) := by simp
    rw [← hqeq] at ha2mem
    exact (Finset.mem_inter.mp ha2mem).1
  have hra2 : dist S.triangle.v3 Z.a2 = r := by
    exact (Finset.mem_filter.mp ha2T).2
  have hsub :
      S.I3 ⊆ S.I3.filter (fun x => dist S.triangle.v3 x = dist S.triangle.v3 Z.a2) := by
    intro x hxI3
    have hxT : x ∈ T := hI3sub hxI3
    have hxr : dist S.triangle.v3 x = r := (Finset.mem_filter.mp hxT).2
    exact Finset.mem_filter.mpr ⟨hxI3, by simpa [hra2] using hxr⟩
  have hfiltered_ge :
      2 ≤ (S.I3.filter (fun x => dist S.triangle.v3 x = dist S.triangle.v3 Z.a2)).card := by
    have hI3two : S.I3.card = 2 := S.I3_card_eq_two
    have hcard_le := Finset.card_le_card hsub
    omega
  omega
def FormBv1A2Packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r : ℝ) : Prop :=
  (Z.a2 : ℝ²) ∈ S.I2 ∧
  S.witnessClassAt_v1 r ∩ S.CP.C2 = ({Z.a2} : Finset ℝ²) ∧
  S.witnessClassAt_v1 r ∩ S.CP.C3 = ({S.triangle.v2} : Finset ℝ²)
def FormBv1A2SelectorV2Qv1Packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r s : ℝ) : Prop :=
  FormBv1A2Packet S Z r ∧ 0 < s ∧ SelectorV2Qv1Packet S Z s
def FormBv1B2Packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r : ℝ) : Prop :=
  (Z.b2 : ℝ²) ∈ S.I2 ∧
  S.witnessClassAt_v1 r ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²) ∧
  S.witnessClassAt_v1 r ∩ S.CP.C3 = ({S.triangle.v2} : Finset ℝ²)
def FormBv1B2SelectorV2Qv1Packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r s : ℝ) : Prop :=
  FormBv1B2Packet S Z r ∧ 0 < s ∧ SelectorV2Qv1Packet S Z s
abbrev I3V3A2DeltaNormalizationOfExactPacket
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) : Prop :=
  ∀ {r s : ℝ},
    FormBv1A2SelectorV2Qv1Packet S Z r s →
    S.witnessClassAt_v2 s =
      insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²)) →
    S.I3V3A2DeltaNormalization Z
set_option maxHeartbeats 2000000 in
theorem C2_same_open_side_of_base_chord_as_v3
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s : ℝ}
    (hbranch : FormBv1A2SelectorV2Qv1Packet S Z r s)
    (hexact : S.witnessClassAt_v2 s =
      insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²))) :
    ∀ y ∈ ({Z.a2, S.triangle.v3} : Finset ℝ²),
      signedArea2 y S.triangle.v1 S.triangle.v2 *
        signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 > 0 := by
  classical
  intro y hy
  rcases Finset.mem_insert.mp hy with hya2 | hyv3
  · subst hya2
    rcases hbranch with ⟨⟨hA2, h_a2eq, h_v2eq⟩, _, _⟩
    let q1 : ℝ² := S.triangle.v1
    let q2 : ℝ² := S.triangle.v2
    let q3 : ℝ² := S.triangle.v3
    let a : ℝ² := Z.a2
    let center : ℝ² := S.Packet.center
    have haT1 : a ∈ S.witnessClassAt_v1 r := by
      have hamem : a ∈ ({a} : Finset ℝ²) := by simp
      rw [← h_a2eq] at hamem
      exact (Finset.mem_inter.mp hamem).1
    have hv2T1 : q2 ∈ S.witnessClassAt_v1 r := by
      have hv2mem : q2 ∈ ({q2} : Finset ℝ²) := by simp [q2]
      rw [← h_v2eq] at hv2mem
      exact (Finset.mem_inter.mp hv2mem).1
    have haT2 : a ∈ S.witnessClassAt_v2 s := by
      have hamem : a ∈ insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²)) := by
        simp [a]
      rw [← hexact] at hamem
      exact hamem
    have hv1T2 : q1 ∈ S.witnessClassAt_v2 s := by
      have hv1mem : q1 ∈ insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²)) := by
        simp [q1]
      rw [← hexact] at hv1mem
      exact hv1mem
    have hv3T2 : q3 ∈ S.witnessClassAt_v2 s := by
      have hv3mem : q3 ∈ insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²)) := by
        simp [q3]
      rw [← hexact] at hv3mem
      exact hv3mem
    have haC2 : a ∈ S.CP.C2 := by
      unfold Problem97.FiniteEndpointShell.I2 at hA2
      exact (Finset.mem_erase.mp (Finset.mem_erase.mp hA2).2).2
    have haA : a ∈ A := S.CP.C2_subset haC2
    have hr_q1q2 : dist q1 q2 = r := by
      simpa [q1, q2] using (Finset.mem_filter.mp hv2T1).2
    have hr_q1a : dist q1 a = r := by
      simpa [q1, a] using (Finset.mem_filter.mp haT1).2
    have hs_q2q1 : dist q2 q1 = s := by
      simpa [q1, q2] using (Finset.mem_filter.mp hv1T2).2
    have hs_q2a : dist q2 a = s := by
      simpa [q2, a] using (Finset.mem_filter.mp haT2).2
    have hs_q2q3 : dist q2 q3 = s := by
      simpa [q2, q3] using (Finset.mem_filter.mp hv3T2).2
    have ha_q1 : dist q1 a = dist q1 q2 := by
      rw [hr_q1a, hr_q1q2]
    have ha_q2 : dist q2 a = dist q1 q2 := by
      rw [hs_q2a, dist_comm q1 q2, hs_q2q1]
    have hq3_q2 : dist q2 q3 = dist q1 q2 := by
      rw [hs_q2q3, dist_comm q1 q2, hs_q2q1]
    have hu : q2 - q1 ≠ 0 := by
      exact sub_ne_zero.mpr S.triangle.v12_ne.symm
    let u : ℝ² := q2 - q1
    let nvec : ℝ² := Problem97.stdOrientation.rightAngleRotation u
    let β := Problem97.stdOrientation.basisRightAngleRotation u hu
    let M : ℝ² := midpoint ℝ q1 q2
    let X : ℝ² → ℝ := fun z => β.repr (z - M) 0
    let Y : ℝ² → ℝ := fun z => β.repr (z - M) 1
    let yc : ℝ := Y center
    have hsum_pt : ∀ z : ℝ², z - M = X z • u + Y z • nvec := by
      intro z
      simpa [β, X, Y, nvec] using (β.sum_repr (z - M)).symm
    have hnorm_nvec : ‖nvec‖ = ‖u‖ := by
      simpa [nvec] using Problem97.stdOrientation.rightAngleRotation.norm_map u
    have hβu : β.repr u = Finsupp.single 0 (1 : ℝ) := by
      simpa [β, nvec] using (β.repr_self 0)
    have horth : inner ℝ u nvec = 0 := by
      simpa [nvec] using Problem97.stdOrientation.inner_rightAngleRotation_self u
    have harea_u_left : ∀ t : ℝ, Problem97.stdOrientation.areaForm u (t • u) = 0 := by
      intro t
      rw [map_smul]
      simp
    have harea_u_right : ∀ t : ℝ,
        Problem97.stdOrientation.areaForm u (t • nvec) = t * ‖u‖ ^ 2 := by
      intro t
      rw [map_smul]
      simp [nvec, Orientation.areaForm_rightAngleRotation_right]
    have hu_sq_pos : 0 < ‖u‖ ^ 2 := by
      exact sq_pos_of_ne_zero (norm_ne_zero_iff.mpr hu)
    have hq1mid : q1 - M = (-(1 / 2 : ℝ)) • u := by
      calc
        q1 - M = (1 / 2 : ℝ) • (q1 - q2) := by
          simpa [M] using (left_sub_midpoint ℝ q1 q2)
        _ = (-(1 / 2 : ℝ)) • u := by
          rw [show q1 - q2 = -u by
            dsimp [u]
            abel_nf]
          simp [smul_neg]
    have hq2mid : q2 - M = (1 / 2 : ℝ) • u := by
      simpa [M, u] using (right_sub_midpoint ℝ q1 q2)
    have hX_q1 : X q1 = -(1 / 2 : ℝ) := by
      have h := congrArg (fun v : ℝ² => β.repr v 0) hq1mid
      change X q1 = (β.repr ((-(1 / 2 : ℝ)) • u)) 0 at h
      rw [map_smul, hβu] at h
      simpa using h
    have hY_q1 : Y q1 = 0 := by
      have h := congrArg (fun v : ℝ² => β.repr v 1) hq1mid
      change Y q1 = (β.repr ((-(1 / 2 : ℝ)) • u)) 1 at h
      rw [map_smul, hβu] at h
      simpa using h
    have hpt_minus_q1 : ∀ z : ℝ²,
        z - q1 = (X z + 1 / 2) • u + Y z • nvec := by
      intro z
      calc
        z - q1 = (z - M) - (q1 - M) := by
          rw [sub_eq_add_neg, sub_eq_add_neg, sub_eq_add_neg]
          abel_nf
        _ = (X z • u + Y z • nvec) - ((-(1 / 2 : ℝ)) • u) := by
          rw [hsum_pt z, hq1mid]
        _ = (X z • u + (1 / 2 : ℝ) • u) + Y z • nvec := by
          rw [sub_eq_add_neg, neg_smul]
          abel_nf
        _ = (X z + 1 / 2) • u + Y z • nvec := by
          rw [← add_smul]
    have hpt_minus_q2 : ∀ z : ℝ²,
        z - q2 = (X z - 1 / 2) • u + Y z • nvec := by
      intro z
      calc
        z - q2 = (z - M) - (q2 - M) := by
          rw [sub_eq_add_neg, sub_eq_add_neg, sub_eq_add_neg]
          abel_nf
        _ = (X z • u + Y z • nvec) - ((1 / 2 : ℝ) • u) := by
          rw [hsum_pt z, hq2mid]
        _ = (X z • u + (-(1 / 2 : ℝ)) • u) + Y z • nvec := by
          rw [sub_eq_add_neg, neg_smul]
          abel_nf
        _ = (X z - 1 / 2) • u + Y z • nvec := by
          rw [← add_smul]
          simp [sub_eq_add_neg]
    have hpt_minus_center : ∀ z : ℝ²,
        z - center = X z • u + (Y z - yc) • nvec := by
      intro z
      have hcenter_perp : inner ℝ (center - M) u = 0 := by
        have hdist_eq : dist center q1 = dist center q2 := by
          rw [dist_comm center q1, dist_comm center q2, dist_eq_norm, dist_eq_norm]
          exact S.Packet.moser_on_boundary_1.trans S.Packet.moser_on_boundary_2.symm
        have hperp : center ∈ AffineSubspace.perpBisector q1 q2 := by
          rw [AffineSubspace.mem_perpBisector_iff_dist_eq]
          simpa using hdist_eq
        have h :=
          (AffineSubspace.mem_perpBisector_iff_inner_eq_zero
            (c := center) (p₁ := q1) (p₂ := q2)).mp hperp
        simpa [M] using h
      have hxc_zero : X center = 0 := by
        have hinner : inner ℝ (center - M) u = X center * ‖u‖ ^ 2 := by
          have horth_rev : inner ℝ nvec u = 0 := by simpa [real_inner_comm] using horth
          calc
            inner ℝ (center - M) u = inner ℝ (X center • u + Y center • nvec) u := by
              rw [hsum_pt center]
            _ = inner ℝ (X center • u) u + inner ℝ (Y center • nvec) u := by
              rw [inner_add_left]
            _ = X center * ‖u‖ ^ 2 + Y center * 0 := by
              rw [inner_smul_left, inner_smul_left, real_inner_self_eq_norm_sq, horth_rev]
              simp
            _ = X center * ‖u‖ ^ 2 := by ring
        have hsqpos : 0 < ‖u‖ ^ 2 := by
          exact sq_pos_of_ne_zero (norm_ne_zero_iff.mpr hu)
        nlinarith only [hcenter_perp, hinner, hu_sq_pos]
      calc
        z - center = (z - M) - (center - M) := by
          rw [sub_eq_add_neg, sub_eq_add_neg, sub_eq_add_neg]
          abel_nf
        _ = (X z • u + Y z • nvec) - (Y center • nvec) := by
          rw [hsum_pt z, hsum_pt center, hxc_zero, zero_smul, zero_add]
        _ = X z • u + (Y z • nvec + (-Y center) • nvec) := by
          rw [sub_eq_add_neg, neg_smul]
          abel_nf
        _ = X z • u + (Y z - yc) • nvec := by
          rw [← add_smul]
          rfl
    have hdist_sq_coeff :
        ∀ x y : ℝ, ‖x • u + y • nvec‖ ^ 2 = (x ^ 2 + y ^ 2) * ‖u‖ ^ 2 := by
      intro x y
      have horth' : inner ℝ (x • u) (y • nvec) = 0 := by
        rw [inner_smul_left, inner_smul_right, horth]
        ring
      have hnorm :
          ‖x • u + y • nvec‖ ^ 2 = ‖x • u‖ ^ 2 + ‖y • nvec‖ ^ 2 := by
        simpa [pow_two] using
          norm_add_sq_eq_norm_sq_add_norm_sq_of_inner_eq_zero (x • u) (y • nvec) horth'
      have hu_part : ‖x • u‖ ^ 2 = x ^ 2 * ‖u‖ ^ 2 := by
        calc
          ‖x • u‖ ^ 2 = (|x| * ‖u‖) ^ 2 := by rw [norm_smul, Real.norm_eq_abs]
          _ = |x| ^ 2 * ‖u‖ ^ 2 := by ring
          _ = x ^ 2 * ‖u‖ ^ 2 := by rw [sq_abs]
      have hn_part : ‖y • nvec‖ ^ 2 = y ^ 2 * ‖u‖ ^ 2 := by
        calc
          ‖y • nvec‖ ^ 2 = (|y| * ‖u‖) ^ 2 := by
            rw [norm_smul, Real.norm_eq_abs, hnorm_nvec]
          _ = |y| ^ 2 * ‖u‖ ^ 2 := by ring
          _ = y ^ 2 * ‖u‖ ^ 2 := by rw [sq_abs]
      rw [hnorm, hu_part, hn_part]
      ring
    have hdist_center_sq :
        ∀ z : ℝ², dist center z ^ 2 = (X z ^ 2 + (Y z - yc) ^ 2) * ‖u‖ ^ 2 := by
      intro z
      rw [dist_comm, dist_eq_norm, hpt_minus_center, hdist_sq_coeff]
    have hdist_q1_sq :
        ∀ z : ℝ², dist q1 z ^ 2 = ((X z + 1 / 2) ^ 2 + Y z ^ 2) * ‖u‖ ^ 2 := by
      intro z
      rw [dist_comm, dist_eq_norm, hpt_minus_q1, hdist_sq_coeff]
    have hdist_q2_sq :
        ∀ z : ℝ², dist q2 z ^ 2 = ((X z - 1 / 2) ^ 2 + Y z ^ 2) * ‖u‖ ^ 2 := by
      intro z
      rw [dist_comm, dist_eq_norm, hpt_minus_q2, hdist_sq_coeff]
    have hcommon_coords :
        ∀ z : ℝ²,
          dist q1 z = dist q1 q2 →
          dist q2 z = dist q1 q2 →
          X z = 0 ∧ Y z ^ 2 = (3 : ℝ) / 4 := by
      intro z hz1 hz2
      have hu_sq_ne : ‖u‖ ^ 2 ≠ 0 := ne_of_gt hu_sq_pos
      have h1 : ((X z + 1 / 2) ^ 2 + Y z ^ 2) * ‖u‖ ^ 2 = ‖u‖ ^ 2 := by
        rw [← hdist_q1_sq z, hz1, dist_eq_norm]
        simpa [u, norm_sub_rev]
      have h2 : ((X z - 1 / 2) ^ 2 + Y z ^ 2) * ‖u‖ ^ 2 = ‖u‖ ^ 2 := by
        rw [← hdist_q2_sq z, hz2, dist_eq_norm]
        simpa [u, norm_sub_rev]
      have h1' : (X z + 1 / 2) ^ 2 + Y z ^ 2 = 1 := by
        have h1'' : ((X z + 1 / 2) ^ 2 + Y z ^ 2) * ‖u‖ ^ 2 = 1 * ‖u‖ ^ 2 := by
          simpa using h1
        exact mul_right_cancel₀ hu_sq_ne h1''
      have h2' : (X z - 1 / 2) ^ 2 + Y z ^ 2 = 1 := by
        have h2'' : ((X z - 1 / 2) ^ 2 + Y z ^ 2) * ‖u‖ ^ 2 = 1 * ‖u‖ ^ 2 := by
          simpa using h2
        exact mul_right_cancel₀ hu_sq_ne h2''
      have hx : X z = 0 := by
        have h1r := h1'
        have h2r := h2'
        ring_nf at h1r h2r
        linarith
      have hy : Y z ^ 2 = (3 : ℝ) / 4 := by
        have h1r := h1'
        rw [hx] at h1r
        norm_num at h1r
        linarith
      exact ⟨hx, hy⟩
    have haXhY := hcommon_coords a ha_q1 ha_q2
    rcases haXhY with ⟨haX, haYsq⟩
    have hyc_pos : 0 < Y a * yc := by
      have hdisk_a' : ‖a - center‖ ≤ S.Packet.radius := by
        simpa [center] using S.Packet.disk_contains_A a haA
      have hdisk_a : dist center a ≤ S.Packet.radius := by
        rw [dist_eq_norm, norm_sub_rev]
        exact hdisk_a'
      have hradius : dist center q1 = S.Packet.radius := by
        rw [dist_comm, dist_eq_norm]
        exact S.Packet.moser_on_boundary_1
      have hdist_sq : dist center a ^ 2 ≤ dist center q1 ^ 2 := by
        have hnonneg_a : 0 ≤ dist center a := dist_nonneg
        have hnonneg_q1 : 0 ≤ dist center q1 := dist_nonneg
        nlinarith only [hdisk_a, hradius, hnonneg_a, hnonneg_q1]
      rw [hdist_center_sq a, hdist_center_sq q1, haX, hX_q1, hY_q1] at hdist_sq
      have hdist_sq' : (Y a - yc) ^ 2 ≤ ((1 / 2 : ℝ) ^ 2) + yc ^ 2 := by
        have htmp :
            (Y a - yc) ^ 2 * ‖u‖ ^ 2 ≤
              (((1 / 2 : ℝ) ^ 2) + yc ^ 2) * ‖u‖ ^ 2 := by
          simpa [pow_two] using hdist_sq
        exact le_of_mul_le_mul_right htmp hu_sq_pos
      have hquarter : ((1 / 2 : ℝ) ^ 2) ≤ Y a * yc := by
        have hsq := hdist_sq'
        ring_nf at hsq
        nlinarith only [haYsq, hdist_sq', hsq]
      linarith
    have harea_q1q2 : ∀ z : ℝ², signedArea2 q1 q2 z = Y z * ‖u‖ ^ 2 := by
      intro z
      calc
        signedArea2 q1 q2 z = Problem97.stdOrientation.areaForm u (z - q1) := by
          rw [Problem97.signedArea2_eq_stdOrientation_areaForm]
        _ = Problem97.stdOrientation.areaForm u ((X z + 1 / 2) • u + Y z • nvec) := by
          rw [hpt_minus_q1]
        _ = Y z * ‖u‖ ^ 2 := by
          rw [map_add, harea_u_left (X z + 1 / 2), harea_u_right (Y z)]
          simp
    have hprod_a_center :
        signedArea2 a q1 q2 * signedArea2 center q1 q2 > 0 := by
      have hcyc_a : signedArea2 a q1 q2 = signedArea2 q1 q2 a := by
        unfold signedArea2
        ring
      have hcyc_c : signedArea2 center q1 q2 = signedArea2 q1 q2 center := by
        unfold signedArea2
        ring
      rw [hcyc_a, hcyc_c, harea_q1q2 a, harea_q1q2 center]
      have hu_sq_sq_pos : 0 < ‖u‖ ^ 2 * ‖u‖ ^ 2 := mul_pos hu_sq_pos hu_sq_pos
      have hrew :
          Y a * ‖u‖ ^ 2 * (Y center * ‖u‖ ^ 2) =
            (Y a * yc) * (‖u‖ ^ 2 * ‖u‖ ^ 2) := by
        dsimp [yc]
        ring
      rw [hrew]
      exact mul_pos hyc_pos hu_sq_sq_pos
    have hq1O : ‖q1 - center‖ = S.Packet.radius := by
      simpa [q1, center] using S.Packet.moser_on_boundary_1
    have hq2O : ‖q2 - center‖ = S.Packet.radius := by
      simpa [q2, center] using S.Packet.moser_on_boundary_2
    have hq3O : ‖q3 - center‖ = S.Packet.radius := by
      simpa [q3, center] using S.Packet.moser_on_boundary_3
    have hinner_v3_pos : 0 < inner ℝ (q1 - q3) (q2 - q3) := by
      have hnn : 0 ≤ inner ℝ (q1 - q3) (q2 - q3) := by
        simpa [q1, q2, q3] using S.Packet.inner_at_v3
      by_contra hnot
      have hzero : inner ℝ (q1 - q3) (q2 - q3) = 0 := by linarith
      have hpyth :
          dist q1 q2 ^ 2 = dist q1 q3 ^ 2 + dist q2 q3 ^ 2 := by
        have hvec : q1 - q2 = (q1 - q3) - (q2 - q3) := by
          dsimp [q1, q2, q3]
          abel_nf
        rw [dist_eq_norm, dist_eq_norm, dist_eq_norm, hvec, norm_sub_sq_real]
        nlinarith only [hnot, hnn, hzero]
      have hq3q1_sq : dist q1 q3 ^ 2 = 0 := by
        rw [hq3_q2] at hpyth
        nlinarith only [hpyth]
      have hq3q1_zero : dist q1 q3 = 0 := by
        have hnn' : 0 ≤ dist q1 q3 := dist_nonneg
        nlinarith only [hnn', hq3q1_sq]
      exact S.triangle.v13_ne (dist_eq_zero.mp hq3q1_zero)
    have hcenter_q3 :
        signedArea2 center q1 q2 * signedArea2 q3 q1 q2 > 0 := by
      have hmid_pos : 0 < inner ℝ (midpoint ℝ q1 q2 - center) (midpoint ℝ q1 q2 - q3) := by
        have hq1q3 : ‖q1 - center‖ = ‖q3 - center‖ := by rw [hq1O, hq3O]
        have hq2q3 : ‖q2 - center‖ = ‖q3 - center‖ := by rw [hq2O, hq3O]
        have hchord := inner_chord_eq_two_mul_inner_midpoint hq1q3 hq2q3
        nlinarith only [hinner_v3_pos, hchord]
      have hperp : ‖q1 - center‖ ^ 2 = ‖q2 - center‖ ^ 2 := by
        rw [hq1O, hq2O]
      rw [Problem97.signedArea_prod_eq_inner_mul_dist_sq center q1 q2 q3 hperp]
      have hchord_sq_pos : 0 < ‖q1 - q2‖ ^ 2 := by
        exact sq_pos_of_ne_zero (norm_ne_zero_iff.mpr (sub_ne_zero.mpr S.triangle.v12_ne))
      nlinarith only [hmid_pos, hchord_sq_pos]
    have hcenter_ne :
        signedArea2 center q1 q2 ≠ 0 := by
      have : signedArea2 center q1 q2 * signedArea2 q3 q1 q2 ≠ 0 := by
        exact ne_of_gt hcenter_q3
      exact left_ne_zero_of_mul this
    have hprod_av3 :
        signedArea2 a q1 q2 * signedArea2 q3 q1 q2 > 0 := by
      have hcombo :
          0 < (signedArea2 a q1 q2 * signedArea2 center q1 q2) *
            (signedArea2 center q1 q2 * signedArea2 q3 q1 q2) := by
        exact mul_pos hprod_a_center hcenter_q3
      have hrew :
          (signedArea2 a q1 q2 * signedArea2 center q1 q2) *
              (signedArea2 center q1 q2 * signedArea2 q3 q1 q2) =
            (signedArea2 a q1 q2 * signedArea2 q3 q1 q2) *
              (signedArea2 center q1 q2) ^ 2 := by
        ring
      rw [hrew] at hcombo
      have hcenter_sq_pos : 0 < (signedArea2 center q1 q2) ^ 2 := by
        exact sq_pos_of_ne_zero hcenter_ne
      nlinarith only [hcombo, hcenter_sq_pos]
    simpa [a, q1, q2, q3] using hprod_av3
  · have hyv3' : y = S.triangle.v3 := by simpa using hyv3
    subst y
    have hnd :
        signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 ≠ 0 := by
      have hv1O : ‖S.triangle.v1 - S.Packet.center‖ = S.Packet.radius :=
        S.Packet.moser_on_boundary_1
      have hv2O : ‖S.triangle.v2 - S.Packet.center‖ = S.Packet.radius :=
        S.Packet.moser_on_boundary_2
      have hv3O : ‖S.triangle.v3 - S.Packet.center‖ = S.Packet.radius :=
        S.Packet.moser_on_boundary_3
      exact MEC.signedArea2_ne_zero_of_three_dist_eq
        (by simpa [dist_eq_norm] using hv3O)
        (by simpa [dist_eq_norm] using hv1O)
        (by simpa [dist_eq_norm] using hv2O)
        S.triangle.v13_ne.symm S.triangle.v12_ne S.triangle.v23_ne.symm
    have hsqpos :
        0 < signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 *
          signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 := by
      exact mul_self_pos.mpr hnd
    simpa [mul_comm] using hsqpos
theorem b3n9m051_c2_sameSide_core (p q s t c : ℝ)
    (hCT : 0 ≤ c * t)
    (hARC : t * (2 * p * t - 2 * q * s - q + t) < 0)
    (hD : p ^ 2 + q ^ 2 ≤ 1 / 4 + 2 * c * q)
    (hC : 8 * c * t = 4 * s ^ 2 + 4 * t ^ 2 - 1) :
    0 < q * t := by
  rcases lt_trichotomy t 0 with ht | ht | ht
  · have hc : c ≤ 0 := by nlinarith only [hCT, ht]
    have hARC' : 0 < 2 * p * t - 2 * q * s - q + t := by
      by_contra h; push_neg at h
      nlinarith only [hARC, h, ht, mul_nonpos_of_nonpos_of_nonneg (by linarith : (2 * p * t - 2 * q * s - q + t) ≤ 0) (by linarith : (0 : ℝ) ≤ -t)]
    by_contra hcon; push_neg at hcon
    have hcon' : 0 ≤ q := by nlinarith only [hcon, ht]
    nlinarith only [hARC, hC, hcon, hD, hARC', hcon', ht, hc, mul_nonneg (neg_nonneg.mpr ht.le) (neg_nonneg.mpr hc), sq_nonneg (p - s), mul_nonneg hcon' (neg_nonneg.mpr ht.le), mul_nonneg hcon' (neg_nonneg.mpr hc), sq_nonneg (p * t - q * s), sq_nonneg (q - c), sq_nonneg p, sq_nonneg q]
  · exfalso; rw [ht] at hARC; simp at hARC
  · have hc : 0 ≤ c := by nlinarith only [hCT, ht]
    have hARC' : 2 * p * t - 2 * q * s - q + t < 0 := by
      by_contra h; push_neg at h
      nlinarith only [hARC, h, ht, mul_nonneg h (le_of_lt ht)]
    by_contra hcon; push_neg at hcon
    have hcon' : q ≤ 0 := by nlinarith only [hcon, ht]
    nlinarith only [hARC, hC, hcon, hD, hARC', hcon', ht, hc, mul_nonneg ht.le hc, sq_nonneg (p - s), mul_nonneg (neg_nonneg.mpr hcon') (le_of_lt ht), mul_nonneg (neg_nonneg.mpr hcon') hc, sq_nonneg (p * t - q * s), sq_nonneg (q - c), sq_nonneg p, sq_nonneg q]
set_option maxHeartbeats 4000000 in
theorem c2_vertex_same_open_side_as_v3
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {a₂ : ℝ²}
    (ha2 : a₂ ∈ S.I2) :
    0 < signedArea2 a₂ S.triangle.v1 S.triangle.v2 *
      signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 := by
  classical
  let q1 : ℝ² := S.triangle.v1
  let q2 : ℝ² := S.triangle.v2
  let q3 : ℝ² := S.triangle.v3
  let a : ℝ² := a₂
  let center : ℝ² := S.Packet.center
  have haC2 : a ∈ S.CP.C2 :=
    (Finset.mem_erase.mp (Finset.mem_erase.mp ha2).2).2
  have ha_ne_v1 : a ≠ q1 := (Finset.mem_erase.mp ha2).1
  have ha_ne_v3 : a ≠ q3 := (Finset.mem_erase.mp (Finset.mem_erase.mp ha2).2).1
  have haA : a ∈ A := S.CP.C2_subset haC2
  have harc_le :
      signedArea2 a q3 q1 * signedArea2 q2 q3 q1 ≤ 0 := by
    have h := ((S.CP.arc_membership a haA).2.1).mp haC2
    simpa [Problem97.OnArcOpposite, q1, q2, q3, a] using h
  have hav3v1_ne : signedArea2 a q3 q1 ≠ 0 := by
    intro hΔ
    have hcol : Collinear ℝ ({a, q3, q1} : Set ℝ²) :=
      Problem97.collinear_of_signedArea2_eq_zero a q3 q1 hΔ
    have hconv : ConvexIndep A := S.hconv
    have h3A : q3 ∈ A := S.triangle.v3_mem
    have h1A : q1 ∈ A := S.triangle.v1_mem
    rcases hcol.wbtw_or_wbtw_or_wbtw with hw | hw | hw
    ·
      apply hconv q3 (by exact_mod_cast h3A)
      have hseg : q3 ∈ segment ℝ a q1 := hw.mem_segment
      rw [← convexHull_pair] at hseg
      refine convexHull_mono ?_ hseg
      intro x hx
      rcases hx with rfl | hx
      · exact ⟨by exact_mod_cast haA, by
          simp only [Set.mem_singleton_iff]; exact fun h => ha_ne_v3 h⟩
      · rcases hx with rfl
        exact ⟨by exact_mod_cast h1A, by
          simp only [Set.mem_singleton_iff]; exact fun h => S.triangle.v13_ne h⟩
    ·
      apply hconv q1 (by exact_mod_cast h1A)
      have hseg : q1 ∈ segment ℝ q3 a := hw.mem_segment
      rw [← convexHull_pair] at hseg
      refine convexHull_mono ?_ hseg
      intro x hx
      rcases hx with rfl | hx
      · exact ⟨by exact_mod_cast h3A, by
          simp only [Set.mem_singleton_iff]; exact fun h => S.triangle.v13_ne h.symm⟩
      · rcases hx with rfl
        exact ⟨by exact_mod_cast haA, by
          simp only [Set.mem_singleton_iff]; exact fun h => ha_ne_v1 h⟩
    ·
      apply hconv a (by exact_mod_cast haA)
      have hseg : a ∈ segment ℝ q1 q3 := hw.mem_segment
      rw [← convexHull_pair] at hseg
      refine convexHull_mono ?_ hseg
      intro x hx
      rcases hx with rfl | hx
      · exact ⟨by exact_mod_cast h1A, by
          simp only [Set.mem_singleton_iff]; exact fun h => ha_ne_v1 h.symm⟩
      · rcases hx with rfl
        exact ⟨by exact_mod_cast h3A, by
          simp only [Set.mem_singleton_iff]; exact fun h => ha_ne_v3 h.symm⟩
  have hv2v3v1_ne : signedArea2 q2 q3 q1 ≠ 0 := by
    have hv1O : ‖q1 - S.Packet.center‖ = S.Packet.radius := S.Packet.moser_on_boundary_1
    have hv2O : ‖q2 - S.Packet.center‖ = S.Packet.radius := S.Packet.moser_on_boundary_2
    have hv3O : ‖q3 - S.Packet.center‖ = S.Packet.radius := S.Packet.moser_on_boundary_3
    exact MEC.signedArea2_ne_zero_of_three_dist_eq
      (by simpa [dist_eq_norm] using hv2O)
      (by simpa [dist_eq_norm] using hv3O)
      (by simpa [dist_eq_norm] using hv1O)
      S.triangle.v23_ne S.triangle.v13_ne.symm S.triangle.v12_ne.symm
  have harc : signedArea2 a q3 q1 * signedArea2 q2 q3 q1 < 0 :=
    lt_of_le_of_ne harc_le (mul_ne_zero hav3v1_ne hv2v3v1_ne)
  have hu : q2 - q1 ≠ 0 := sub_ne_zero.mpr S.triangle.v12_ne.symm
  let u : ℝ² := q2 - q1
  let nvec : ℝ² := Problem97.stdOrientation.rightAngleRotation u
  let β := Problem97.stdOrientation.basisRightAngleRotation u hu
  let M : ℝ² := midpoint ℝ q1 q2
  let X : ℝ² → ℝ := fun z => β.repr (z - M) 0
  let Y : ℝ² → ℝ := fun z => β.repr (z - M) 1
  let yc : ℝ := Y center
  have hsum_pt : ∀ z : ℝ², z - M = X z • u + Y z • nvec := by
    intro z
    simpa [β, X, Y, nvec] using (β.sum_repr (z - M)).symm
  have hnorm_nvec : ‖nvec‖ = ‖u‖ := by
    simpa [nvec] using Problem97.stdOrientation.rightAngleRotation.norm_map u
  have horth : inner ℝ u nvec = 0 := by
    simpa [nvec] using Problem97.stdOrientation.inner_rightAngleRotation_self u
  have harea_u_left : ∀ r : ℝ, Problem97.stdOrientation.areaForm u (r • u) = 0 := by
    intro r; rw [map_smul]; simp
  have harea_u_right : ∀ r : ℝ,
      Problem97.stdOrientation.areaForm u (r • nvec) = r * ‖u‖ ^ 2 := by
    intro r; rw [map_smul]
    simp [nvec, Orientation.areaForm_rightAngleRotation_right]
  have hu_sq_pos : 0 < ‖u‖ ^ 2 := sq_pos_of_ne_zero (norm_ne_zero_iff.mpr hu)
  have hdiff : ∀ z w : ℝ², z - w = (X z - X w) • u + (Y z - Y w) • nvec := by
    intro z w
    have : (z - M) - (w - M) = z - w := by abel
    rw [← this, hsum_pt z, hsum_pt w, sub_smul, sub_smul]; abel
  have hun : Problem97.stdOrientation.areaForm u nvec = ‖u‖ ^ 2 := by
    simpa using harea_u_right 1
  have hnu : Problem97.stdOrientation.areaForm nvec u = -‖u‖ ^ 2 := by
    rw [Problem97.stdOrientation.areaForm_swap, hun]
  have huu : Problem97.stdOrientation.areaForm u u = 0 := by
    simpa using harea_u_left 1
  have hnn : Problem97.stdOrientation.areaForm nvec nvec = 0 := by simp
  have harea_bilin : ∀ xa ya xb yb : ℝ,
      Problem97.stdOrientation.areaForm (xa • u + ya • nvec) (xb • u + yb • nvec)
        = (xa * yb - ya * xb) * ‖u‖ ^ 2 := by
    intro xa ya xb yb
    simp only [map_add, LinearMap.add_apply, map_smul, LinearMap.smul_apply,
      smul_eq_mul, huu, hun, hnu, hnn]
    ring
  have harea_gen : ∀ z w x : ℝ²,
      signedArea2 z w x =
        ((X w - X z) * (Y x - Y z) - (Y w - Y z) * (X x - X z)) * ‖u‖ ^ 2 := by
    intro z w x
    rw [Problem97.signedArea2_eq_stdOrientation_areaForm, hdiff w z, hdiff x z,
        harea_bilin]
  have hXc : X center = 0 := by
    have hdist_eq : dist center q1 = dist center q2 := by
      rw [dist_comm center q1, dist_comm center q2, dist_eq_norm, dist_eq_norm]
      exact S.Packet.moser_on_boundary_1.trans S.Packet.moser_on_boundary_2.symm
    have hperp : center ∈ AffineSubspace.perpBisector q1 q2 := by
      rw [AffineSubspace.mem_perpBisector_iff_dist_eq]; simpa using hdist_eq
    have hcenter_perp : inner ℝ (center - M) u = 0 := by
      have h := (AffineSubspace.mem_perpBisector_iff_inner_eq_zero
        (c := center) (p₁ := q1) (p₂ := q2)).mp hperp
      simpa [M] using h
    have horth_rev : inner ℝ nvec u = 0 := by simpa [real_inner_comm] using horth
    have hinner : inner ℝ (center - M) u = X center * ‖u‖ ^ 2 := by
      calc
        inner ℝ (center - M) u
            = inner ℝ (X center • u + Y center • nvec) u := by rw [hsum_pt center]
        _ = X center * ‖u‖ ^ 2 + Y center * 0 := by
              rw [inner_add_left, inner_smul_left, inner_smul_left,
                real_inner_self_eq_norm_sq, horth_rev]; simp
        _ = X center * ‖u‖ ^ 2 := by ring
    rw [hcenter_perp] at hinner
    have hprod : X center * ‖u‖ ^ 2 = 0 := hinner.symm
    rcases mul_eq_zero.mp hprod with h | h
    · exact h
    · exact absurd h (ne_of_gt hu_sq_pos)
  have hq1mid : q1 - M = (-(1 / 2 : ℝ)) • u := by
    calc
      q1 - M = (1 / 2 : ℝ) • (q1 - q2) := by
        simpa [M] using (left_sub_midpoint ℝ q1 q2)
      _ = (-(1 / 2 : ℝ)) • u := by
        rw [show q1 - q2 = -u by dsimp [u]; abel_nf]; simp [smul_neg]
  have hq2mid : q2 - M = (1 / 2 : ℝ) • u := by
    simpa [M, u] using (right_sub_midpoint ℝ q1 q2)
  have hβu : β.repr u = Finsupp.single 0 (1 : ℝ) := by
    simpa [β, nvec] using (β.repr_self 0)
  have hX_q1 : X q1 = -(1 / 2 : ℝ) := by
    have h := congrArg (fun v : ℝ² => β.repr v 0) hq1mid
    change X q1 = (β.repr ((-(1 / 2 : ℝ)) • u)) 0 at h
    rw [map_smul, hβu] at h; simpa using h
  have hY_q1 : Y q1 = 0 := by
    have h := congrArg (fun v : ℝ² => β.repr v 1) hq1mid
    change Y q1 = (β.repr ((-(1 / 2 : ℝ)) • u)) 1 at h
    rw [map_smul, hβu] at h; simpa using h
  have hX_q2 : X q2 = (1 / 2 : ℝ) := by
    have h := congrArg (fun v : ℝ² => β.repr v 0) hq2mid
    change X q2 = (β.repr ((1 / 2 : ℝ) • u)) 0 at h
    rw [map_smul, hβu] at h; simpa using h
  have hY_q2 : Y q2 = 0 := by
    have h := congrArg (fun v : ℝ² => β.repr v 1) hq2mid
    change Y q2 = (β.repr ((1 / 2 : ℝ) • u)) 1 at h
    rw [map_smul, hβu] at h; simpa using h
  have hpt_minus_center : ∀ z : ℝ²,
      z - center = X z • u + (Y z - yc) • nvec := by
    intro z
    rw [hdiff z center, hXc]; simp [yc]
  have hdist_sq_coeff :
      ∀ x y : ℝ, ‖x • u + y • nvec‖ ^ 2 = (x ^ 2 + y ^ 2) * ‖u‖ ^ 2 := by
    intro x y
    have horth' : inner ℝ (x • u) (y • nvec) = 0 := by
      rw [inner_smul_left, inner_smul_right, horth]; ring
    have hnorm : ‖x • u + y • nvec‖ ^ 2 = ‖x • u‖ ^ 2 + ‖y • nvec‖ ^ 2 := by
      simpa [pow_two] using
        norm_add_sq_eq_norm_sq_add_norm_sq_of_inner_eq_zero (x • u) (y • nvec) horth'
    have hu_part : ‖x • u‖ ^ 2 = x ^ 2 * ‖u‖ ^ 2 := by
      rw [norm_smul, Real.norm_eq_abs, mul_pow, sq_abs]
    have hn_part : ‖y • nvec‖ ^ 2 = y ^ 2 * ‖u‖ ^ 2 := by
      rw [norm_smul, Real.norm_eq_abs, hnorm_nvec, mul_pow, sq_abs]
    rw [hnorm, hu_part, hn_part]; ring
  have hdist_center_sq :
      ∀ z : ℝ², dist center z ^ 2 = (X z ^ 2 + (Y z - yc) ^ 2) * ‖u‖ ^ 2 := by
    intro z
    rw [dist_comm, dist_eq_norm, hpt_minus_center, hdist_sq_coeff]
  have hradius_sq : S.Packet.radius ^ 2 = ((1 / 4 : ℝ) + yc ^ 2) * ‖u‖ ^ 2 := by
    have hr : dist center q1 = S.Packet.radius := by
      rw [dist_comm]; simpa [q1, center, dist_eq_norm, triangle, Problem97.MEC.MoserTriangle.toStructural] using S.Packet.moser_on_boundary_1
    have := hdist_center_sq q1
    rw [hr, hX_q1, hY_q1] at this
    rw [this]; ring
  have hC1 : 8 * yc * Y q3 = 4 * (X q3) ^ 2 + 4 * (Y q3) ^ 2 - 1 := by
    have hr : dist center q3 = S.Packet.radius := by
      rw [dist_comm, dist_eq_norm]; exact S.Packet.moser_on_boundary_3
    have h := hdist_center_sq q3
    rw [hr, hradius_sq] at h
    have hcancel : (X q3) ^ 2 + (Y q3 - yc) ^ 2 = (1 / 4 : ℝ) + yc ^ 2 :=
      (mul_right_cancel₀ (ne_of_gt hu_sq_pos) h).symm
    nlinarith only [hcancel]
  have hD : (X a) ^ 2 + (Y a) ^ 2 ≤ 1 / 4 + 2 * yc * Y a := by
    have hdisk_a' : ‖a - center‖ ≤ S.Packet.radius := by
      simpa [center] using S.Packet.disk_contains_A a haA
    have hdisk_a : dist center a ≤ S.Packet.radius := by
      rw [dist_eq_norm, norm_sub_rev]; exact hdisk_a'
    have hsq : dist center a ^ 2 ≤ S.Packet.radius ^ 2 := by
      have h0 : 0 ≤ dist center a := dist_nonneg
      have h1 : 0 ≤ S.Packet.radius := le_of_lt S.Packet.radius_pos
      nlinarith only [hdisk_a, h0, h1]
    rw [hdist_center_sq a, hradius_sq] at hsq
    have hsq' : (X a) ^ 2 + (Y a - yc) ^ 2 ≤ (1 / 4 : ℝ) + yc ^ 2 :=
      le_of_mul_le_mul_right (by linarith [hsq]) hu_sq_pos
    nlinarith only [hsq']
  have hca : signedArea2 center q1 q2 = yc * ‖u‖ ^ 2 := by
    have hyc : Y center = yc := rfl
    rw [harea_gen center q1 q2, hX_q1, hY_q1, hX_q2, hY_q2, hXc, hyc]; ring
  have hc3 : signedArea2 q3 q1 q2 = Y q3 * ‖u‖ ^ 2 := by
    rw [harea_gen q3 q1 q2, hX_q1, hY_q1, hX_q2, hY_q2]; ring
  have hcenter_q3 : 0 ≤ yc * Y q3 := by
    have hq1O : ‖q1 - center‖ = S.Packet.radius := by
      simpa [q1, center] using S.Packet.moser_on_boundary_1
    have hq2O : ‖q2 - center‖ = S.Packet.radius := by
      simpa [q2, center] using S.Packet.moser_on_boundary_2
    have hq3O : ‖q3 - center‖ = S.Packet.radius := by
      simpa [q3, center] using S.Packet.moser_on_boundary_3
    have hinn : inner ℝ (q1 - q3) (q2 - q3) ≥ 0 := by
      simpa [q1, q2, q3] using S.Packet.inner_at_v3
    have hprod :
        signedArea2 center q1 q2 * signedArea2 q3 q1 q2 ≥ 0 :=
      center_same_side_as_apex_of_nonobtuse hq1O hq2O hq3O hinn
    rw [hca, hc3] at hprod
    have hpos : 0 < ‖u‖ ^ 2 * ‖u‖ ^ 2 := mul_pos hu_sq_pos hu_sq_pos
    nlinarith only [hprod, hpos]
  have hARC : Y q3 * (2 * X a * Y q3 - 2 * Y a * X q3 - Y a + Y q3) < 0 := by
    have hf1 : signedArea2 a q3 q1 =
        ((X q3 - X a) * (Y q1 - Y a) - (Y q3 - Y a) * (X q1 - X a)) * ‖u‖ ^ 2 :=
      harea_gen a q3 q1
    have hf2 : signedArea2 q2 q3 q1 =
        ((X q3 - X q2) * (Y q1 - Y q2) - (Y q3 - Y q2) * (X q1 - X q2)) * ‖u‖ ^ 2 :=
      harea_gen q2 q3 q1
    rw [hf1, hf2, hX_q1, hY_q1, hX_q2, hY_q2] at harc
    have hexpand :
        ((X q3 - X a) * (0 - Y a) - (Y q3 - Y a) * (-(1 / 2) - X a)) * ‖u‖ ^ 2 *
          (((X q3 - (1 / 2)) * (0 - 0) - (Y q3 - 0) * (-(1 / 2) - (1 / 2))) * ‖u‖ ^ 2)
        = (Y q3 * (2 * X a * Y q3 - 2 * Y a * X q3 - Y a + Y q3)) *
            ((1 / 2) * (‖u‖ ^ 2 * ‖u‖ ^ 2)) := by ring
    rw [hexpand] at harc
    have hpos : 0 < (1 / 2 : ℝ) * (‖u‖ ^ 2 * ‖u‖ ^ 2) := by positivity
    nlinarith only [harc, hpos]
  have hcore : 0 < Y a * Y q3 :=
    b3n9m051_c2_sameSide_core (X a) (Y a) (X q3) (Y q3) yc hcenter_q3 hARC hD hC1
  have hsa_a : signedArea2 a q1 q2 = Y a * ‖u‖ ^ 2 := by
    rw [harea_gen a q1 q2, hX_q1, hY_q1, hX_q2, hY_q2]; ring
  have hsa_3 : signedArea2 q3 q1 q2 = Y q3 * ‖u‖ ^ 2 := by
    rw [harea_gen q3 q1 q2, hX_q1, hY_q1, hX_q2, hY_q2]; ring
  change 0 < signedArea2 a q1 q2 * signedArea2 q3 q1 q2
  rw [hsa_a, hsa_3]
  have : Y a * ‖u‖ ^ 2 * (Y q3 * ‖u‖ ^ 2) = (Y a * Y q3) * (‖u‖ ^ 2 * ‖u‖ ^ 2) := by ring
  rw [this]
  exact mul_pos hcore (mul_pos hu_sq_pos hu_sq_pos)
theorem b3n9m051_signedArea2_baseChord_vec2 (p : ℝ²) :
    signedArea2 p (Problem97.CGN.vec2 (-1) 0) (Problem97.CGN.vec2 1 0) = 2 * p 1 := by
  simp [Problem97.signedArea2, Problem97.CGN.vec2, EuclideanSpace.single_apply]
  ring
noncomputable def b3n9m051_similarityTransportComp
    {T1 T2 : ℝ² → ℝ²}
    (tau1 : Problem97.CGN.SimilarityTransportData T1)
    (tau2 : Problem97.CGN.SimilarityTransportData T2) :
    Problem97.CGN.SimilarityTransportData (fun x => T2 (T1 x)) := by
  classical
  refine
    { scale := tau2.scale * tau1.scale
      scale_pos := mul_pos tau2.scale_pos tau1.scale_pos
      dist_image := ?_
      dist_eq_iff := ?_
      convexHull_mem_iff := ?_
      orientation := tau2.orientation * tau1.orientation
      orientation_sq := ?_
      halfplane_sign := ?_ }
  · intro a b
    rw [tau2.dist_image, tau1.dist_image]
    ring
  · intro a b c
    constructor
    · intro h
      exact (tau1.dist_eq_iff a b c).1 ((tau2.dist_eq_iff (T1 a) (T1 b) (T1 c)).1 h)
    · intro h
      exact (tau2.dist_eq_iff (T1 a) (T1 b) (T1 c)).2 ((tau1.dist_eq_iff a b c).2 h)
  · intro S a
    have himage :
        (fun x => T2 (T1 x)) '' S = T2 '' (T1 '' S) := by
      ext y
      constructor
      · intro hy
        rcases hy with ⟨x, hxS, rfl⟩
        exact ⟨T1 x, ⟨x, hxS, rfl⟩, rfl⟩
      · intro hy
        rcases hy with ⟨z, ⟨x, hxS, rfl⟩, rfl⟩
        exact ⟨x, hxS, rfl⟩
    rw [himage]
    exact Iff.trans
      (tau2.convexHull_mem_iff (S := T1 '' S) (a := T1 a))
      (tau1.convexHull_mem_iff (S := S) (a := a))
  · have h1 := tau2.orientation_sq
    have h2 := tau1.orientation_sq
    ring_nf
    nlinarith only [h1, h2]
  · intro a b c
    rw [tau2.halfplane_sign, tau1.halfplane_sign]
    ring
noncomputable def b3n9m051_halfShift (p : ℝ²) : ℝ² :=
  Problem97.CGN.vec2 ((p 0 + 1) / 2) (p 1 / 2)
theorem b3n9m051_halfShift_injective : Function.Injective b3n9m051_halfShift := by
  intro p q hpq
  ext i <;> fin_cases i
  · have h := congrArg (fun z : ℝ² => z 0) hpq
    simpa [b3n9m051_halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply] using h
  · have h := congrArg (fun z : ℝ² => z 1) hpq
    simpa [b3n9m051_halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply] using h
noncomputable def b3n9m051_halfShiftSimilarityTransportData :
    Problem97.CGN.SimilarityTransportData b3n9m051_halfShift := by
  classical
  let F : ℝ² →ₗ[ℝ] ℝ² := (1 / 2 : ℝ) • LinearMap.id
  let c : ℝ² := Problem97.CGN.vec2 ((1 : ℝ) / 2) 0
  let Taff : ℝ² →ᵃ[ℝ] ℝ² := AffineMap.mk' b3n9m051_halfShift F c (by
    intro p
    ext i <;> fin_cases i <;>
      simp [b3n9m051_halfShift, F, c, Problem97.CGN.vec2, EuclideanSpace.single_apply, Pi.add_apply]
    · ring
    · ring
    )
  have hdist0 : ∀ a b : ℝ², dist (b3n9m051_halfShift a) (b3n9m051_halfShift b) = ((1 : ℝ) / 2) * dist a b := by
    intro a b
    have hcoord :
        b3n9m051_halfShift a - b3n9m051_halfShift b =
          (1 / 2 : ℝ) • (a - b) := by
      ext i <;> fin_cases i <;>
        simp [b3n9m051_halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply, sub_eq_add_neg]
        <;> ring
    rw [dist_eq_norm, hcoord, norm_smul, Real.norm_of_nonneg (by positivity), dist_eq_norm]
  refine
    { scale := (1 : ℝ) / 2
      scale_pos := by positivity
      dist_image := ?_
      dist_eq_iff := ?_
      convexHull_mem_iff := ?_
      orientation := 1
      orientation_sq := by norm_num
      halfplane_sign := ?_ }
  · intro a b
    exact hdist0 a b
  · intro a b c
    constructor
    · intro h
      rw [hdist0 a b, hdist0 a c] at h
      nlinarith only [h]
    · intro h
      rw [hdist0 a b, hdist0 a c]
      nlinarith only [h]
  · intro S a
    have hmap : b3n9m051_halfShift '' convexHull ℝ S = convexHull ℝ (b3n9m051_halfShift '' S) := by
      simpa [Taff] using (AffineMap.image_convexHull Taff S)
    constructor
    · intro ha
      rw [← hmap] at ha
      rcases ha with ⟨b, hb, hTb⟩
      have hba : b = a := b3n9m051_halfShift_injective hTb
      simpa [hba] using hb
    · intro ha
      simpa [hmap] using (show b3n9m051_halfShift a ∈ b3n9m051_halfShift '' convexHull ℝ S from ⟨a, ha, rfl⟩)
  · intro a b c
    unfold b3n9m051_halfShift
    simp [Problem97.signedArea2, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    ring
noncomputable def b3n9m051_flipY (p : ℝ²) : ℝ² :=
  Problem97.CGN.vec2 (p 0) (-p 1)
theorem b3n9m051_flipY_injective : Function.Injective b3n9m051_flipY := by
  intro p q hpq
  ext i <;> fin_cases i
  · have h := congrArg (fun z : ℝ² => z 0) hpq
    simpa [b3n9m051_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply] using h
  · have h := congrArg (fun z : ℝ² => z 1) hpq
    simpa [b3n9m051_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply] using h
noncomputable def b3n9m051_flipYSimilarityTransportData :
    Problem97.CGN.SimilarityTransportData b3n9m051_flipY := by
  classical
  let F : ℝ² →ₗ[ℝ] ℝ² :=
    { toFun := b3n9m051_flipY
      map_add' := by
        intro x y
        ext i <;> fin_cases i <;>
          simp [b3n9m051_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
        · ring
      map_smul' := by
        intro r x
        ext i <;> fin_cases i <;>
          simp [b3n9m051_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      }
  let Taff : ℝ² →ᵃ[ℝ] ℝ² := AffineMap.mk' b3n9m051_flipY F 0 (by
    intro p
    ext i <;> fin_cases i <;>
      simp [b3n9m051_flipY, F, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    )
  have hdist0 : ∀ a b : ℝ², dist (b3n9m051_flipY a) (b3n9m051_flipY b) = dist a b := by
    intro a b
    have hsq :
        ‖b3n9m051_flipY a - b3n9m051_flipY b‖ ^ 2 = ‖a - b‖ ^ 2 := by
      rw [EuclideanSpace.norm_sq_eq, EuclideanSpace.norm_sq_eq]
      simp [b3n9m051_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply, Fin.sum_univ_two, sq_abs,
        Real.norm_eq_abs, PiLp.sub_apply]
      ring
    have hnonneg1 : 0 ≤ ‖b3n9m051_flipY a - b3n9m051_flipY b‖ := norm_nonneg _
    have hnonneg2 : 0 ≤ ‖a - b‖ := norm_nonneg _
    rw [dist_eq_norm, dist_eq_norm]
    nlinarith only [hsq, hnonneg1, hnonneg2]
  refine
    { scale := 1
      scale_pos := by norm_num
      dist_image := ?_
      dist_eq_iff := ?_
      convexHull_mem_iff := ?_
      orientation := -1
      orientation_sq := by norm_num
      halfplane_sign := ?_ }
  · intro a b
    simpa using hdist0 a b
  · intro a b c
    simpa [hdist0 a b, hdist0 a c]
  · intro S a
    have hmap : b3n9m051_flipY '' convexHull ℝ S = convexHull ℝ (b3n9m051_flipY '' S) := by
      simpa [Taff] using (AffineMap.image_convexHull Taff S)
    constructor
    · intro ha
      rw [← hmap] at ha
      rcases ha with ⟨b, hb, hTb⟩
      have hba : b = a := b3n9m051_flipY_injective hTb
      simpa [hba] using hb
    · intro ha
      simpa [hmap] using (show b3n9m051_flipY a ∈ b3n9m051_flipY '' convexHull ℝ S from ⟨a, ha, rfl⟩)
  · intro a b c
    unfold b3n9m051_flipY
    simp [Problem97.signedArea2, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    ring
theorem b3n9m051_exists_base_transportData
    (q1 q2 : ℝ²) (hqne : q1 ≠ q2) :
    ∃ T0, ∃ tau0 : Problem97.CGN.SimilarityTransportData T0,
      T0 q1 = Problem97.CGN.vec2 (-1) 0 ∧
      T0 q2 = Problem97.CGN.vec2 1 0 := by
  classical
  let A2 : Finset ℝ² := ({q1, q2} : Finset ℝ²)
  let L2 : Problem97.CGN.OrderedCap 2 :=
    { points := ![q1, q2]
      injective := by
        intro i j hij
        fin_cases i <;> fin_cases j
        · rfl
        · exfalso
          exact hqne hij
        · exfalso
          exact hqne hij.symm
        · rfl }
  let P2 : Problem97.CGN.MecCapPacket A2 L2 :=
    { hm := by decide
      center := midpoint ℝ q1 q2
      radius := dist q1 q2 / 2
      radius_nonneg := by positivity
      mem_A := by
        intro t
        fin_cases t <;> simp [A2, L2]
      disk_mem := by
        intro t
        fin_cases t
        · simpa [L2, div_eq_mul_inv, mul_comm, mul_left_comm, mul_assoc] using
            (le_of_eq (by
              simpa [div_eq_mul_inv, mul_comm, mul_left_comm, mul_assoc] using
                (dist_midpoint_left (𝕜 := ℝ) q1 q2)))
        · simpa [L2, dist_comm, div_eq_mul_inv, mul_comm, mul_left_comm, mul_assoc] using
            (le_of_eq (by
              simpa [div_eq_mul_inv, mul_comm, mul_left_comm, mul_assoc] using
                (dist_midpoint_right (𝕜 := ℝ) q1 q2)))
      first_on_circle := by
        simpa [L2, Problem97.CGN.firstIndex, div_eq_mul_inv, mul_comm, mul_left_comm, mul_assoc] using
          (dist_left_midpoint (𝕜 := ℝ) q1 q2)
      last_on_circle := by
        simpa [L2, Problem97.CGN.lastIndex, div_eq_mul_inv, mul_comm, mul_left_comm, mul_assoc] using
          (dist_right_midpoint (𝕜 := ℝ) q1 q2) }
  let Hside2 : Problem97.CGN.MinorCapSideHypotheses P2 :=
    { cap_side_nonneg := by
        intro t
        fin_cases t <;> simp [L2, Problem97.CGN.firstIndex, Problem97.CGN.lastIndex, Problem97.signedArea2]
      center_side_nonpos := by
        simp [P2, L2, Problem97.CGN.firstIndex, Problem97.CGN.lastIndex, Problem97.signedArea2, midpoint_eq_smul_add]
        linarith }
  let Hord2 : Problem97.CGN.StrictCapOrder A2 L2 :=
    { hm := by decide
      consecutive_turn_nonpos := by
        intro t ht
        omega
      chord_projection_strict := by
        intro i j hij
        have hijval : i.val < j.val := Fin.lt_def.mp hij
        fin_cases i <;> fin_cases j
        · exfalso
          exact Nat.lt_irrefl 0 hijval
        · simpa [L2, Problem97.CGN.firstIndex, Problem97.CGN.lastIndex, real_inner_self_eq_norm_sq] using
            sq_pos_of_ne_zero (norm_ne_zero_iff.mpr (sub_ne_zero.mpr hqne.symm))
        · exfalso
          exact Nat.not_lt_zero 1 hijval
        · exfalso
          exact Nat.lt_irrefl 1 hijval
      subchord_open_side_iff_A := by
        intro r s hrs x hxA
        have hrsval : r.val < s.val := Fin.lt_def.mp hrs
        fin_cases r <;> fin_cases s
        · exfalso
          exact Nat.lt_irrefl 0 hrsval
        · constructor
          · intro hx
            exfalso
            simp [A2] at hxA
            rcases hxA with rfl | rfl
            · simp [L2, Problem97.signedArea2] at hx
            · simp [L2, Problem97.signedArea2] at hx
          · intro hx
            rcases hx with ⟨j, hrj, hjs, _⟩
            fin_cases j <;> omega
        · exfalso
          exact Nat.not_lt_zero 1 hrsval
        · exfalso
          exact Nat.lt_irrefl 1 hrsval }
  rcases Problem97.CGN.CGN6norm_minorCapChainModel_of_mecCapPacket P2 Hside2 Hord2 with
    ⟨T0, hT0, tau0, hModel⟩
  let LT0 : Problem97.CGN.OrderedCap 2 := L2.map T0 hT0
  let M0 : Problem97.CGN.MinorCapChainModel LT0 := Classical.choice hModel
  refine ⟨T0, tau0, ?_, ?_⟩
  · have hpt := M0.points_eq (Problem97.CGN.firstIndex (by decide : 2 ≤ 2))
    ext i <;> fin_cases i
    · calc
        (T0 q1) 0 = M0.coords.X (Problem97.CGN.firstIndex (by decide : 2 ≤ 2)) := by
          simpa [LT0, L2, Problem97.CGN.OrderedCap.map_points, Problem97.CGN.firstIndex,
            Problem97.CGN.point, Problem97.CGN.vec2, EuclideanSpace.single_apply]
            using congrArg (fun z : ℝ² => z 0) hpt
        _ = -1 := M0.coords.X_first
        _ = (Problem97.CGN.vec2 (-1) 0) 0 := by
          simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    · calc
        (T0 q1) 1 = M0.coords.Y (Problem97.CGN.firstIndex (by decide : 2 ≤ 2)) := by
          simpa [LT0, L2, Problem97.CGN.OrderedCap.map_points, Problem97.CGN.firstIndex,
            Problem97.CGN.point, Problem97.CGN.vec2, EuclideanSpace.single_apply]
            using congrArg (fun z : ℝ² => z 1) hpt
        _ = 0 := M0.coords.Y_first
        _ = (Problem97.CGN.vec2 (-1) 0) 1 := by
          simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
  · have hpt := M0.points_eq (Problem97.CGN.lastIndex (by decide : 2 ≤ 2))
    ext i <;> fin_cases i
    · calc
        (T0 q2) 0 = M0.coords.X (Problem97.CGN.lastIndex (by decide : 2 ≤ 2)) := by
          simpa [LT0, L2, Problem97.CGN.OrderedCap.map_points, Problem97.CGN.lastIndex,
            Problem97.CGN.point, Problem97.CGN.vec2, EuclideanSpace.single_apply]
            using congrArg (fun z : ℝ² => z 0) hpt
        _ = 1 := M0.coords.X_last
        _ = (Problem97.CGN.vec2 1 0) 0 := by
          simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    · calc
        (T0 q2) 1 = M0.coords.Y (Problem97.CGN.lastIndex (by decide : 2 ≤ 2)) := by
          simpa [LT0, L2, Problem97.CGN.OrderedCap.map_points, Problem97.CGN.lastIndex,
            Problem97.CGN.point, Problem97.CGN.vec2, EuclideanSpace.single_apply]
            using congrArg (fun z : ℝ² => z 1) hpt
        _ = 0 := M0.coords.Y_last
        _ = (Problem97.CGN.vec2 1 0) 1 := by
          simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
theorem i3_v3_a2_base_chord_side_signs_of_exact_packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s : ℝ}
    (hbranch : FormBv1A2SelectorV2Qv1Packet S Z r s)
    (hexact : S.witnessClassAt_v2 s =
      insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²)))
    {T0 : ℝ² → ℝ²} (tau : Problem97.CGN.SimilarityTransportData T0)
    (hv1 : T0 S.triangle.v1 = Problem97.CGN.vec2 (-1) 0)
    (hv2 : T0 S.triangle.v2 = Problem97.CGN.vec2 1 0)
    (ha2 : T0 Z.a2 = Problem97.CGN.vec2 0 (Real.sqrt 3)) :
    0 < (T0 S.triangle.v3) 1 ∧ ∀ x ∈ S.I3, (T0 x) 1 < 0 := by
  let q1 : ℝ² := S.triangle.v1
  let q2 : ℝ² := S.triangle.v2
  let q3 : ℝ² := S.triangle.v3
  let a : ℝ² := Z.a2
  have hside_a :
      signedArea2 a q1 q2 * signedArea2 q3 q1 q2 > 0 := by
    exact S.C2_same_open_side_of_base_chord_as_v3 (Z := Z) hbranch hexact a (by simp [a, q3])
  have ha_img_pos :
      0 < signedArea2 (T0 a) (T0 q1) (T0 q2) := by
    rw [ha2, hv1, hv2, b3n9m051_signedArea2_baseChord_vec2]
    simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
  have himg_prod :
      0 < signedArea2 (T0 a) (T0 q1) (T0 q2) *
        signedArea2 (T0 q3) (T0 q1) (T0 q2) := by
    rw [tau.halfplane_sign a q1 q2, tau.halfplane_sign q3 q1 q2]
    have hscale_sq_pos : 0 < tau.scale ^ 2 := sq_pos_of_ne_zero (ne_of_gt tau.scale_pos)
    have hrew :
        (tau.orientation * (tau.scale ^ 2) * signedArea2 a q1 q2) *
            (tau.orientation * (tau.scale ^ 2) * signedArea2 q3 q1 q2) =
          (tau.orientation ^ 2) * (tau.scale ^ 2 * tau.scale ^ 2) *
            (signedArea2 a q1 q2 * signedArea2 q3 q1 q2) := by
      ring
    rw [hrew]
    rw [tau.orientation_sq]
    exact mul_pos (mul_pos (by positivity) (mul_pos hscale_sq_pos hscale_sq_pos)) hside_a
  have hq3_img_pos :
      0 < signedArea2 (T0 q3) (T0 q1) (T0 q2) := by
    have hle : 0 < signedArea2 (T0 q3) (T0 q1) (T0 q2) := by
      by_contra hnot
      have hnonpos : signedArea2 (T0 q3) (T0 q1) (T0 q2) ≤ 0 := by linarith
      have : signedArea2 (T0 a) (T0 q1) (T0 q2) *
          signedArea2 (T0 q3) (T0 q1) (T0 q2) ≤ 0 :=
        mul_nonpos_of_nonneg_of_nonpos (le_of_lt ha_img_pos) hnonpos
      linarith
    exact hle
  have hq3_y_pos : 0 < (T0 q3) 1 := by
    rw [hv1, hv2] at hq3_img_pos
    rw [b3n9m051_signedArea2_baseChord_vec2] at hq3_img_pos
    linarith
  refine ⟨by simpa [q3] using hq3_y_pos, ?_⟩
  intro x hxI3
  have hxA : x ∈ A := S.CP.C3_subset (by
    unfold Problem97.FiniteEndpointShell.I3 at hxI3
    exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hxI3))
  have hxC3 : x ∈ S.CP.C3 := by
    unfold Problem97.FiniteEndpointShell.I3 at hxI3
    exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hxI3)
  have hx_ne_v1 : x ≠ q1 := by
    unfold Problem97.FiniteEndpointShell.I3 at hxI3
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hxI3).2).1
  have hx_ne_v2 : x ≠ q2 := by
    unfold Problem97.FiniteEndpointShell.I3 at hxI3
    exact (Finset.mem_erase.mp hxI3).1
  have hq3_base_ne : signedArea2 q3 q1 q2 ≠ 0 := by
    have hv1O : dist q3 S.Packet.center = S.Packet.radius := by
      simpa [q3, dist_eq_norm] using S.Packet.moser_on_boundary_3
    have hv2O : dist q1 S.Packet.center = S.Packet.radius := by
      simpa [q1, dist_eq_norm] using S.Packet.moser_on_boundary_1
    have hv3O : dist q2 S.Packet.center = S.Packet.radius := by
      simpa [q2, dist_eq_norm] using S.Packet.moser_on_boundary_2
    exact MEC.signedArea2_ne_zero_of_three_dist_eq
      hv1O hv2O hv3O
      S.triangle.v13_ne.symm S.triangle.v12_ne S.triangle.v23_ne.symm
  have hx_arc :
      signedArea2 x q1 q2 * signedArea2 q3 q1 q2 ≤ 0 := by
    exact (S.CP.arc_membership x hxA).2.2.1 hxC3
  have hx_base_ne : signedArea2 x q1 q2 ≠ 0 := by
    intro hz
    have hcol : Collinear ℝ ({x, q1, q2} : Set ℝ²) :=
      (Problem97.signedArea2_eq_zero_iff_collinear x q1 q2).1 hz
    exact False.elim <|
      (_root_.Batch3N9.Problem97.ConvexIndep.not_three_collinear S.hconv) hxA S.triangle.v1_mem S.triangle.v2_mem
        hx_ne_v1 hx_ne_v2 S.triangle.v12_ne hcol
  have himg_nonpos :
      signedArea2 (T0 x) (T0 q1) (T0 q2) *
        signedArea2 (T0 q3) (T0 q1) (T0 q2) ≤ 0 := by
    rw [tau.halfplane_sign x q1 q2, tau.halfplane_sign q3 q1 q2]
    have hrew :
        (tau.orientation * (tau.scale ^ 2) * signedArea2 x q1 q2) *
            (tau.orientation * (tau.scale ^ 2) * signedArea2 q3 q1 q2) =
          (tau.orientation ^ 2) * (tau.scale ^ 2 * tau.scale ^ 2) *
            (signedArea2 x q1 q2 * signedArea2 q3 q1 q2) := by
      ring
    rw [hrew, tau.orientation_sq]
    have hscale_nonneg : 0 ≤ tau.scale ^ 2 * tau.scale ^ 2 := by positivity
    simpa using mul_nonpos_of_nonneg_of_nonpos hscale_nonneg hx_arc
  have hx_img_lt :
      signedArea2 (T0 x) (T0 q1) (T0 q2) < 0 := by
    have hx_img_le : signedArea2 (T0 x) (T0 q1) (T0 q2) ≤ 0 := by
      by_contra hx_pos
      have : 0 < signedArea2 (T0 x) (T0 q1) (T0 q2) *
          signedArea2 (T0 q3) (T0 q1) (T0 q2) :=
        mul_pos (by linarith) hq3_img_pos
      linarith
    have hx_img_ne : signedArea2 (T0 x) (T0 q1) (T0 q2) ≠ 0 := by
      rw [tau.halfplane_sign x q1 q2]
      have horient_ne : tau.orientation ≠ 0 := by
        intro h0
        have : (0 : ℝ) ^ 2 = 1 := by simpa [h0] using tau.orientation_sq
        norm_num at this
      exact mul_ne_zero (mul_ne_zero horient_ne (pow_ne_zero 2 (ne_of_gt tau.scale_pos))) hx_base_ne
    exact lt_of_le_of_ne hx_img_le hx_img_ne
  rw [hv1, hv2] at hx_img_lt
  rw [b3n9m051_signedArea2_baseChord_vec2] at hx_img_lt
  linarith
theorem v1v3_longer_than_base_of_exact_packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s : ℝ}
    (hbranch : FormBv1A2SelectorV2Qv1Packet S Z r s)
    (_hexact : S.witnessClassAt_v2 s =
      insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²))) :
    dist S.triangle.v1 S.triangle.v2 < dist S.triangle.v1 S.triangle.v3 := by
  classical
  rcases hbranch with ⟨⟨hA2, h_a2eq, h_v2eq⟩, _, _⟩
  have ha2T1 : Z.a2 ∈ S.witnessClassAt_v1 r := by
    have ha2mem : Z.a2 ∈ ({Z.a2} : Finset ℝ²) := by simp
    rw [← h_a2eq] at ha2mem
    exact (Finset.mem_inter.mp ha2mem).1
  have hv2T1 : S.triangle.v2 ∈ S.witnessClassAt_v1 r := by
    have hv2mem : S.triangle.v2 ∈ ({S.triangle.v2} : Finset ℝ²) := by simp
    rw [← h_v2eq] at hv2mem
    exact (Finset.mem_inter.mp hv2mem).1
  have hbase_eq : dist S.triangle.v1 S.triangle.v2 = dist S.triangle.v1 Z.a2 := by
    have hv2dist : dist S.triangle.v1 S.triangle.v2 = r := by
      simpa using (Finset.mem_filter.mp hv2T1).2
    have ha2dist : dist S.triangle.v1 Z.a2 = r := by
      simpa using (Finset.mem_filter.mp ha2T1).2
    rw [hv2dist, ha2dist]
  have ha2C2 : Z.a2 ∈ S.CP.C2 := by
    unfold Problem97.FiniteEndpointShell.I2 at hA2
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hA2).2).2
  have ha2_ne_v3 : Z.a2 ≠ S.triangle.v3 := by
    unfold Problem97.FiniteEndpointShell.I2 at hA2
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hA2).2).1
  have ha2_ne_v1 : Z.a2 ≠ S.triangle.v1 := by
    unfold Problem97.FiniteEndpointShell.I2 at hA2
    exact (Finset.mem_erase.mp hA2).1
  rcases Problem97.CGN.CGN4g_capData_of_supportCap_oriented
      (A := A) (C := S.CP.C2) (M := S.triangle2)
      S.hconv S.hnoncol S.CP.C2_subset
      (fun x hxA => (S.CP.arc_membership x hxA).2.1)
      S.CP.v3_mem_C2 S.CP.v1_mem_C2 S.packet2 S.packet2.inner_at_v1 with
    ⟨m, L, Packet, Hside, Hord, hLC, hEnds⟩
  have ha2L : Z.a2 ∈ Finset.univ.image L.points := by
    rw [hLC]
    exact ha2C2
  rcases Finset.mem_image.mp ha2L with ⟨i, -, hi⟩
  rcases hEnds with hFirstLast | hLastFirst
  · have hi_ne_first : i ≠ Problem97.CGN.firstIndex Packet.hm := by
      intro hi_first
      apply ha2_ne_v3
      calc
        Z.a2 = L.points i := hi.symm
        _ = L.points (Problem97.CGN.firstIndex Packet.hm) := by simpa [hi_first]
        _ = S.triangle.v3 := hFirstLast.1
    have hi_rev_lt_last : i.rev < Problem97.CGN.lastIndex Packet.hm := by
      apply Fin.lt_def.mpr
      rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
      have hi_pos : 0 < i.val := by
        apply Nat.pos_of_ne_zero
        intro hi_zero
        apply hi_ne_first
        ext
        simpa [Problem97.CGN.firstIndex] using hi_zero
      omega
    have hmono :
        Problem97.FiniteEndpoint.E3L20b_rightEndpoint_capDistance_strict
          (L.points (Problem97.CGN.lastIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev L) :=
      Problem97.FiniteEndpoint.E3L20b_of_cgnCapData Packet Hside Hord
    have hlt :=
      hmono (i := i.rev) (j := Problem97.CGN.lastIndex Packet.hm) hi_rev_lt_last
    have hlast_rev_first : (Problem97.CGN.lastIndex Packet.hm).rev =
        Problem97.CGN.firstIndex Packet.hm := by
      ext
      rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
      simp [Problem97.CGN.firstIndex]
      omega
    have hlt' : dist S.triangle.v1 Z.a2 < dist S.triangle.v1 S.triangle.v3 := by
      simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev_points,
        hi, hFirstLast.1, hFirstLast.2, hlast_rev_first] using hlt
    simpa [hbase_eq] using hlt'
  · have hi_lt_last : i < Problem97.CGN.lastIndex Packet.hm := by
      apply Fin.lt_def.mpr
      rw [Problem97.CGN.lastIndex_val]
      have hi_ne_last : i ≠ Problem97.CGN.lastIndex Packet.hm := by
        intro hi_last
        apply ha2_ne_v3
        calc
          Z.a2 = L.points i := hi.symm
          _ = L.points (Problem97.CGN.lastIndex Packet.hm) := by simpa [hi_last]
          _ = S.triangle.v3 := hLastFirst.2
      have hi_lt_top : i.val < m := i.is_lt
      have hi_ne_top : i.val ≠ m - 1 := by
        intro hi_top
        apply hi_ne_last
        ext
        simpa [Problem97.CGN.lastIndex, Problem97.CGN.finIndex] using hi_top
      omega
    have hmono :
        Problem97.FiniteEndpoint.E3L20a_leftEndpoint_capDistance_strict
          (L.points (Problem97.CGN.firstIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap L) :=
      Problem97.FiniteEndpoint.E3L20a_of_cgnCapData Packet Hside Hord
    have hlt :=
      hmono (i := i) (j := Problem97.CGN.lastIndex Packet.hm) hi_lt_last
    have hlt' : dist S.triangle.v1 Z.a2 < dist S.triangle.v1 S.triangle.v3 := by
      simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap_points,
        hi, hLastFirst.1, hLastFirst.2] using hlt
    simpa [hbase_eq] using hlt'
theorem b3n9m051_v1b2_lt_v1v3_of_formB_v1_b2
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r : ℝ}
    (hB : S.IsFormB_v1 r)
    (hxb2 : ∃ h : (Z.b2 : ℝ²) ∈ S.I2,
      S.witnessClassAt_v1 r ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²)) :
    dist S.triangle.v1 Z.b2 < dist S.triangle.v1 S.triangle.v3 := by
  classical
  rcases hxb2 with ⟨hB2, h_b2eq⟩
  rcases hB with ⟨x, hxI2, hxeq, hv2eq⟩
  have hb2T1 : Z.b2 ∈ S.witnessClassAt_v1 r := by
    have hb2mem : Z.b2 ∈ ({Z.b2} : Finset ℝ²) := by simp
    rw [← h_b2eq] at hb2mem
    exact (Finset.mem_inter.mp hb2mem).1
  have hv2T1 : S.triangle.v2 ∈ S.witnessClassAt_v1 r := by
    have hv2mem : S.triangle.v2 ∈ ({S.triangle.v2} : Finset ℝ²) := by simp
    rw [← hv2eq] at hv2mem
    exact (Finset.mem_inter.mp hv2mem).1
  have hbase_eq : dist S.triangle.v1 Z.b2 = dist S.triangle.v1 S.triangle.v2 := by
    have hv2dist : dist S.triangle.v1 S.triangle.v2 = r := by
      simpa using (Finset.mem_filter.mp hv2T1).2
    have hb2dist : dist S.triangle.v1 Z.b2 = r := by
      simpa using (Finset.mem_filter.mp hb2T1).2
    rw [hb2dist, hv2dist]
  have hb2C2 : Z.b2 ∈ S.CP.C2 := by
    unfold Problem97.FiniteEndpointShell.I2 at hB2
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hB2).2).2
  have hb2_ne_v3 : Z.b2 ≠ S.triangle.v3 := by
    unfold Problem97.FiniteEndpointShell.I2 at hB2
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hB2).2).1
  have hb2_ne_v1 : Z.b2 ≠ S.triangle.v1 := by
    unfold Problem97.FiniteEndpointShell.I2 at hB2
    exact (Finset.mem_erase.mp hB2).1
  rcases Problem97.CGN.CGN4g_capData_of_supportCap_oriented
      (A := A) (C := S.CP.C2) (M := S.triangle2)
      S.hconv S.hnoncol S.CP.C2_subset
      (fun x hxA => (S.CP.arc_membership x hxA).2.1)
      S.CP.v3_mem_C2 S.CP.v1_mem_C2 S.packet2 S.packet2.inner_at_v1 with
    ⟨m, L, Packet, Hside, Hord, hLC, hEnds⟩
  have hb2L : Z.b2 ∈ Finset.univ.image L.points := by
    rw [hLC]
    exact hb2C2
  rcases Finset.mem_image.mp hb2L with ⟨i, -, hi⟩
  rcases hEnds with hFirstLast | hLastFirst
  · have hi_ne_first : i ≠ Problem97.CGN.firstIndex Packet.hm := by
      intro hi_first
      apply hb2_ne_v3
      calc
        Z.b2 = L.points i := hi.symm
        _ = L.points (Problem97.CGN.firstIndex Packet.hm) := by simpa [hi_first]
        _ = S.triangle.v3 := hFirstLast.1
    have hi_rev_lt_last : i.rev < Problem97.CGN.lastIndex Packet.hm := by
      apply Fin.lt_def.mpr
      rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
      have hi_pos : 0 < i.val := by
        apply Nat.pos_of_ne_zero
        intro hi_zero
        apply hi_ne_first
        ext
        simpa [Problem97.CGN.firstIndex] using hi_zero
      omega
    have hmono :
        Problem97.FiniteEndpoint.E3L20b_rightEndpoint_capDistance_strict
          (L.points (Problem97.CGN.lastIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev L) :=
      Problem97.FiniteEndpoint.E3L20b_of_cgnCapData Packet Hside Hord
    have hlt :=
      hmono (i := i.rev) (j := Problem97.CGN.lastIndex Packet.hm) hi_rev_lt_last
    have hlast_rev_first : (Problem97.CGN.lastIndex Packet.hm).rev =
        Problem97.CGN.firstIndex Packet.hm := by
      ext
      rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
      simp [Problem97.CGN.firstIndex]
      omega
    simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev_points,
      hi, hFirstLast.1, hFirstLast.2, hlast_rev_first] using hlt
  · have hi_lt_last : i < Problem97.CGN.lastIndex Packet.hm := by
      apply Fin.lt_def.mpr
      rw [Problem97.CGN.lastIndex_val]
      have hi_ne_last : i ≠ Problem97.CGN.lastIndex Packet.hm := by
        intro hi_last
        apply hb2_ne_v3
        calc
          Z.b2 = L.points i := hi.symm
          _ = L.points (Problem97.CGN.lastIndex Packet.hm) := by simpa [hi_last]
          _ = S.triangle.v3 := hLastFirst.2
      have hi_lt_top : i.val < m := i.is_lt
      have hi_ne_top : i.val ≠ m - 1 := by
        intro hi_top
        apply hi_ne_last
        ext
        simpa [Problem97.CGN.lastIndex, Problem97.CGN.finIndex] using hi_top
      omega
    have hmono :
        Problem97.FiniteEndpoint.E3L20a_leftEndpoint_capDistance_strict
          (L.points (Problem97.CGN.firstIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap L) :=
      Problem97.FiniteEndpoint.E3L20a_of_cgnCapData Packet Hside Hord
    have hlt :=
      hmono (i := i) (j := Problem97.CGN.lastIndex Packet.hm) hi_lt_last
    simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap_points,
      hi, hLastFirst.1, hLastFirst.2] using hlt
theorem b3n9m051_base_transport_a2_eq_upper
    {q1 q2 a : ℝ²} {T0 : ℝ² → ℝ²}
    (tau0 : Problem97.CGN.SimilarityTransportData T0)
    (hq1 : T0 q1 = Problem97.CGN.vec2 (-1) 0)
    (hq2 : T0 q2 = Problem97.CGN.vec2 1 0)
    (hleft : dist q1 a = dist q1 q2)
    (hright : dist q2 a = dist q2 q1)
    (hypos : 0 < (T0 a) 1) :
    T0 a = Problem97.CGN.vec2 0 (Real.sqrt 3) := by
  have hleft_img : dist (T0 q1) (T0 a) = dist (T0 q1) (T0 q2) := by
    exact (tau0.dist_eq_iff q1 a q2).2 hleft
  have hright_img : dist (T0 q2) (T0 a) = dist (T0 q2) (T0 q1) := by
    exact (tau0.dist_eq_iff q2 a q1).2 hright
  have hdist_left : dist (T0 a) (Problem97.CGN.vec2 (-1) 0) = 2 := by
    calc
      dist (T0 a) (Problem97.CGN.vec2 (-1) 0) = dist (T0 q1) (T0 a) := by
        rw [hq1, dist_comm]
      _ = dist (T0 q1) (T0 q2) := hleft_img
      _ = 2 := by
        rw [hq1, hq2]
        rw [dist_eq_norm]
        have hvec :
            Problem97.CGN.vec2 (-1) 0 - Problem97.CGN.vec2 1 0 =
              Problem97.CGN.vec2 (-2) 0 := by
          ext i <;> fin_cases i <;>
            simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
          · norm_num
        rw [hvec]
        rw [EuclideanSpace.norm_eq]
        norm_num [Problem97.CGN.vec2, EuclideanSpace.single_apply]
  have hdist_right : dist (T0 a) (Problem97.CGN.vec2 1 0) = 2 := by
    calc
      dist (T0 a) (Problem97.CGN.vec2 1 0) = dist (T0 q2) (T0 a) := by
        rw [hq2, dist_comm]
      _ = dist (T0 q2) (T0 q1) := hright_img
      _ = 2 := by
        rw [hq1, hq2]
        rw [dist_eq_norm]
        have hvec :
            Problem97.CGN.vec2 1 0 - Problem97.CGN.vec2 (-1) 0 =
              Problem97.CGN.vec2 2 0 := by
          ext i <;> fin_cases i <;>
            simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
          · norm_num
        rw [hvec]
        rw [EuclideanSpace.norm_eq]
        norm_num [Problem97.CGN.vec2, EuclideanSpace.single_apply]
  have hsq_left :
      ((T0 a) 0 + 1) ^ 2 + ((T0 a) 1) ^ 2 = 4 := by
    have hsq :
        ((T0 a) 0 + 1) ^ 2 + ((T0 a) 1) ^ 2 = dist (T0 a) (Problem97.CGN.vec2 (-1) 0) ^ 2 := by
      symm
      simpa [Problem97.CGN.vec2, EuclideanSpace.single_apply, add_comm, add_left_comm, add_assoc,
        sub_eq_add_neg] using
        (b3n9m051_dist_sq_eq_coord_sq_add_coord_sq (T0 a) (Problem97.CGN.vec2 (-1) 0))
    nlinarith only [hdist_left, hsq]
  have hsq_right :
      ((T0 a) 0 - 1) ^ 2 + ((T0 a) 1) ^ 2 = 4 := by
    have hsq :
        ((T0 a) 0 - 1) ^ 2 + ((T0 a) 1) ^ 2 = dist (T0 a) (Problem97.CGN.vec2 1 0) ^ 2 := by
      symm
      simpa [Problem97.CGN.vec2, EuclideanSpace.single_apply, add_comm, add_left_comm, add_assoc,
        sub_eq_add_neg] using
        (b3n9m051_dist_sq_eq_coord_sq_add_coord_sq (T0 a) (Problem97.CGN.vec2 1 0))
    nlinarith only [hdist_right, hsq]
  have hx0 : (T0 a) 0 = 0 := by
    nlinarith only [hsq_left, hsq_right]
  have hy_sq : ((T0 a) 1) ^ 2 = 3 := by
    nlinarith only [hsq_left, hsq_right, hx0]
  have hy_eq : (T0 a) 1 = Real.sqrt 3 := by
    have hsqeq : ((T0 a) 1) ^ 2 = (Real.sqrt 3) ^ 2 := by
      rw [Real.sq_sqrt (show (0 : ℝ) ≤ 3 by positivity)]
      exact hy_sq
    rcases sq_eq_sq_iff_eq_or_eq_neg.mp hsqeq with h | h
    · exact h
    · exfalso
      have hsqrt_nonneg : 0 ≤ Real.sqrt 3 := by positivity
      have hy_nonneg : 0 ≤ (T0 a) 1 := le_of_lt hypos
      linarith
  ext i <;> fin_cases i
  · simpa [Problem97.CGN.vec2, EuclideanSpace.single_apply] using hx0
  · calc
      (T0 a) 1 = Real.sqrt 3 := hy_eq
      _ = (Problem97.CGN.vec2 0 (Real.sqrt 3)) 1 := by
        simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
theorem b3n9m051_delta_parameterization_of_normalized_apex
    (p : ℝ²)
    (hunit : dist p (Problem97.CGN.vec2 1 0) = 1)
    (hupper : 0 < p 1)
    (horigin_sq_le_two : dist (Problem97.CGN.vec2 0 0) p ^ 2 ≤ 2)
    (horigin_gt_one : 1 < dist (Problem97.CGN.vec2 0 0) p) :
    ∃ δ : ℝ,
      p =
        Problem97.CGN.vec2
          (2 * Real.cos δ * Real.cos δ)
          (2 * Real.cos δ * Real.sin δ) ∧
      Real.pi / 4 ≤ δ ∧
      δ < Real.pi / 3 := by
  let x : ℝ := p 0
  let y : ℝ := p 1
  let u : ℝ := x - 1
  have hcircle :
      u ^ 2 + y ^ 2 = 1 := by
    have hdist_sq : dist p (Problem97.CGN.vec2 1 0) ^ 2 = 1 := by
      have hnonneg : 0 ≤ dist p (Problem97.CGN.vec2 1 0) := dist_nonneg
      nlinarith only [hunit, hnonneg]
    have hcoord :
        dist p (Problem97.CGN.vec2 1 0) ^ 2 = u ^ 2 + y ^ 2 := by
      dsimp [u, x, y]
      rw [b3n9m051_dist_sq_eq_coord_sq_add_coord_sq]
      simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    linarith
  have horigin_sq :
      dist (Problem97.CGN.vec2 0 0) p ^ 2 = x ^ 2 + y ^ 2 := by
    dsimp [x, y]
    rw [b3n9m051_dist_sq_eq_coord_sq_add_coord_sq]
    simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
  have hx2y2_eq_twox : x ^ 2 + y ^ 2 = 2 * x := by
    dsimp [u] at hcircle
    nlinarith only [hcircle]
  have hx_le_one : x ≤ 1 := by
    rw [horigin_sq] at horigin_sq_le_two
    nlinarith only [horigin_sq_le_two, hcircle, hx2y2_eq_twox]
  have horigin_sq_gt_one : 1 < x ^ 2 + y ^ 2 := by
    rw [← horigin_sq]
    have hnonneg : 0 ≤ dist (Problem97.CGN.vec2 0 0) p := dist_nonneg
    nlinarith only [horigin_gt_one]
  have hx_gt_half : (1 : ℝ) / 2 < x := by
    nlinarith only [hcircle, horigin_sq_gt_one, hx2y2_eq_twox]
  have hu_le_zero : u ≤ 0 := by
    dsimp [u]
    linarith
  have hu_gt_neg_half : -(1 : ℝ) / 2 < u := by
    dsimp [u]
    linarith
  have hu_sq_lt_one : u ^ 2 < 1 := by
    have hy_sq_pos : 0 < y ^ 2 := sq_pos_of_pos (by simpa [y] using hupper)
    nlinarith only [hcircle, hy_sq_pos]
  have hu_bounds : -1 ≤ u ∧ u ≤ 1 := by
    constructor
    · nlinarith only [hu_sq_lt_one]
    · linarith
  let δ : ℝ := Real.arccos u / 2
  have hδ_lo : Real.pi / 4 ≤ δ := by
    have hhalf : Real.pi / 2 ≤ Real.arccos u := by
      by_contra hlt
      have hupos : 0 < u := by
        exact (Real.arccos_lt_pi_div_two).1 (lt_of_not_ge hlt)
      linarith
    dsimp [δ]
    linarith
  have harccos_neg_half :
      Real.arccos (-(1 / 2 : ℝ)) = 2 * Real.pi / 3 := by
    have harccos_half : Real.arccos ((1 : ℝ) / 2) = Real.pi / 3 := by
      have hlo : 0 ≤ Real.pi / 3 := by positivity
      have hhi : Real.pi / 3 ≤ Real.pi := by
        have hpi : 0 < Real.pi := Real.pi_pos
        linarith
      simpa [Real.cos_pi_div_three] using (Real.arccos_cos hlo hhi)
    rw [Real.arccos_neg, harccos_half]
    nlinarith only [Real.pi_pos]
  have hδ_hi : δ < Real.pi / 3 := by
    have hu_gt_neg_half' : (-(1 / 2 : ℝ)) < u := by
      have htmp := hu_gt_neg_half
      norm_num at htmp ⊢
      exact htmp
    have harccos_lt :
        Real.arccos u < 2 * Real.pi / 3 := by
      have hlt :=
        Real.arccos_lt_arccos (x := (-(1 / 2 : ℝ))) (y := u)
          (by norm_num) hu_gt_neg_half' hu_bounds.2
      rwa [harccos_neg_half] at hlt
    change Real.arccos u / 2 < Real.pi / 3
    linarith
  have hcos2δ : Real.cos (2 * δ) = u := by
    dsimp [δ]
    have htwo : 2 * (Real.arccos u / 2) = Real.arccos u := by ring
    rw [htwo, Real.cos_arccos hu_bounds.1 hu_bounds.2]
  have hy_sq :
      y ^ 2 = 1 - u ^ 2 := by
    nlinarith only [hcircle]
  have hy_eq_sqrt :
      y = Real.sqrt (1 - u ^ 2) := by
    have hnonneg : 0 ≤ 1 - u ^ 2 := by
      nlinarith only [hcircle, sq_nonneg y]
    have hsqeq : y ^ 2 = (Real.sqrt (1 - u ^ 2)) ^ 2 := by
      rw [Real.sq_sqrt hnonneg]
      exact hy_sq
    rcases sq_eq_sq_iff_eq_or_eq_neg.mp hsqeq with hy' | hy'
    · exact hy'
    · exfalso
      have hsqrt_nonneg : 0 ≤ Real.sqrt (1 - u ^ 2) := by positivity
      have hy_nonneg : 0 ≤ y := le_of_lt (by simpa [y] using hupper)
      linarith
  have hsin2δ : Real.sin (2 * δ) = y := by
    dsimp [δ]
    have htwo : 2 * (Real.arccos u / 2) = Real.arccos u := by ring
    rw [htwo, Real.sin_arccos]
    exact hy_eq_sqrt.symm
  have hx_formula : x = 2 * Real.cos δ * Real.cos δ := by
    calc
      x = 1 + u := by
        dsimp [u]
        ring
      _ = 1 + Real.cos (2 * δ) := by rw [hcos2δ]
      _ = 2 * Real.cos δ * Real.cos δ := by
        rw [Real.cos_two_mul]
        nlinarith only [Real.sin_sq_add_cos_sq δ]
  have hy_formula : y = 2 * Real.cos δ * Real.sin δ := by
    calc
      y = Real.sin (2 * δ) := hsin2δ.symm
      _ = 2 * Real.sin δ * Real.cos δ := by rw [Real.sin_two_mul]
      _ = 2 * Real.cos δ * Real.sin δ := by ring
  refine ⟨δ, ?_, hδ_lo, hδ_hi⟩
  ext i <;> fin_cases i
  · simpa [x, Problem97.CGN.vec2, EuclideanSpace.single_apply] using hx_formula
  · simpa [y, Problem97.CGN.vec2, EuclideanSpace.single_apply] using hy_formula
set_option maxHeartbeats 8000000 in
theorem i3_v3_a2_delta_normalization_of_exact_packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) :
    S.I3V3A2DeltaNormalizationOfExactPacket Z := by
  classical
  intro r s hbranch hexact
  have hbranch0 := hbranch
  let q1 : ℝ² := S.triangle.v1
  let q2 : ℝ² := S.triangle.v2
  let q3 : ℝ² := S.triangle.v3
  let a : ℝ² := Z.a2
  rcases hbranch with ⟨⟨hA2, h_a2eq, h_v2eq⟩, hs_pos, hpacket⟩
  have haT1 : a ∈ S.witnessClassAt_v1 r := by
    have hamem : a ∈ ({a} : Finset ℝ²) := by simp
    rw [← h_a2eq] at hamem
    exact (Finset.mem_inter.mp hamem).1
  have hv2T1 : q2 ∈ S.witnessClassAt_v1 r := by
    have hv2mem : q2 ∈ ({q2} : Finset ℝ²) := by simp [q2]
    rw [← h_v2eq] at hv2mem
    exact (Finset.mem_inter.mp hv2mem).1
  have haT2 : a ∈ S.witnessClassAt_v2 s := by
    have hamem : a ∈ insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²)) := by
      simp [a]
    rw [← hexact] at hamem
    exact hamem
  have hv1T2 : q1 ∈ S.witnessClassAt_v2 s := by
    have hv1mem : q1 ∈ insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²)) := by
      simp [q1]
    rw [← hexact] at hv1mem
    exact hv1mem
  have hv3T2 : q3 ∈ S.witnessClassAt_v2 s := by
    have hv3mem : q3 ∈ insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²)) := by
      simp [q3]
    rw [← hexact] at hv3mem
    exact hv3mem
  have hleft : dist q1 a = dist q1 q2 := by
    have hr_q1a : dist q1 a = r := by
      simpa [q1, a] using (Finset.mem_filter.mp haT1).2
    have hr_q1q2 : dist q1 q2 = r := by
      simpa [q1, q2] using (Finset.mem_filter.mp hv2T1).2
    rw [hr_q1a, hr_q1q2]
  have hright : dist q2 a = dist q2 q1 := by
    have hs_q2a : dist q2 a = s := by
      simpa [q2, a] using (Finset.mem_filter.mp haT2).2
    have hs_q2q1 : dist q2 q1 = s := by
      simpa [q1, q2] using (Finset.mem_filter.mp hv1T2).2
    rw [hs_q2a, hs_q2q1]
  have hq2q3_eq : dist q2 q3 = dist q2 q1 := by
    have hs_q2q3 : dist q2 q3 = s := by
      simpa [q2, q3] using (Finset.mem_filter.mp hv3T2).2
    have hs_q2q1 : dist q2 q1 = s := by
      simpa [q1, q2] using (Finset.mem_filter.mp hv1T2).2
    rw [hs_q2q3, hs_q2q1]
  have hinner_dist :
      dist q1 q3 ^ 2 ≤ dist q1 q2 ^ 2 + dist q2 q3 ^ 2 := by
    have hvec : q1 - q3 = (q1 - q2) - (q3 - q2) := by
      dsimp [q1, q2, q3]
      abel_nf
    have hinner : 0 ≤ inner ℝ (q3 - q2) (q1 - q2) := by
      simpa [q1, q2, q3] using S.Packet.inner_at_v2
    have hinner' : 0 ≤ inner ℝ (q1 - q2) (q3 - q2) := by
      simpa [real_inner_comm] using hinner
    calc
      dist q1 q3 ^ 2 = ‖q1 - q3‖ ^ 2 := by rw [dist_eq_norm]
      _ = ‖q1 - q2‖ ^ 2 - 2 * inner ℝ (q1 - q2) (q3 - q2) + ‖q3 - q2‖ ^ 2 := by
        rw [hvec, norm_sub_sq_real]
      _ ≤ ‖q1 - q2‖ ^ 2 + ‖q3 - q2‖ ^ 2 := by
        nlinarith only [hinner']
      _ = dist q1 q2 ^ 2 + dist q2 q3 ^ 2 := by
        rw [dist_eq_norm, dist_eq_norm]
        congr 1
        rw [norm_sub_rev]
  have hlong : dist q1 q2 < dist q1 q3 :=
    S.v1v3_longer_than_base_of_exact_packet (Z := Z) hbranch0 hexact
  have hq1ne : q1 ≠ q2 := by
    simpa [q1, q2] using S.triangle.v12_ne
  rcases b3n9m051_exists_base_transportData q1 q2 hq1ne with
    ⟨Tbase, tauBase, hv1Base, hv2Base⟩
  have horientBase_ne : tauBase.orientation ≠ 0 := by
    intro h0
    have : (0 : ℝ) ^ 2 = 1 := by simpa [h0] using tauBase.orientation_sq
    norm_num at this
  have hq3_base_nonzero : (Tbase q3) 1 ≠ 0 := by
    have hq3_sa_ne :
        signedArea2 q3 q1 q2 ≠ 0 := by
      have hv1O : ‖q1 - S.Packet.center‖ = S.Packet.radius := by
        simpa [q1] using S.Packet.moser_on_boundary_1
      have hv2O : ‖q2 - S.Packet.center‖ = S.Packet.radius := by
        simpa [q2] using S.Packet.moser_on_boundary_2
      have hv3O : ‖q3 - S.Packet.center‖ = S.Packet.radius := by
        simpa [q3] using S.Packet.moser_on_boundary_3
      exact MEC.signedArea2_ne_zero_of_three_dist_eq
        hv3O hv1O hv2O
        S.triangle.v13_ne.symm S.triangle.v12_ne S.triangle.v23_ne.symm
    have himg_ne :
        signedArea2 (Tbase q3) (Tbase q1) (Tbase q2) ≠ 0 := by
      rw [tauBase.halfplane_sign q3 q1 q2]
      exact mul_ne_zero
        (mul_ne_zero horientBase_ne (pow_ne_zero 2 (ne_of_gt tauBase.scale_pos)))
        hq3_sa_ne
    intro h0
    apply himg_ne
    rw [hv1Base, hv2Base, b3n9m051_signedArea2_baseChord_vec2]
    linarith
  have build_from :
      ∀ {T0 : ℝ² → ℝ²},
        (tau0 : Problem97.CGN.SimilarityTransportData T0) →
        T0 q1 = Problem97.CGN.vec2 (-1) 0 →
        T0 q2 = Problem97.CGN.vec2 1 0 →
        0 < (T0 q3) 1 →
        S.I3V3A2DeltaNormalization Z := by
    intro T0 tau0 hv1 hv2 hq3y_pos
    have hside_a :
        signedArea2 a q1 q2 * signedArea2 q3 q1 q2 > 0 := by
      exact S.C2_same_open_side_of_base_chord_as_v3 (Z := Z) hbranch0 hexact a (by simp [a, q3])
    have hq3_img_pos :
        0 < signedArea2 (T0 q3) (T0 q1) (T0 q2) := by
      rw [hv1, hv2, b3n9m051_signedArea2_baseChord_vec2]
      linarith
    have hprod_img :
        0 < signedArea2 (T0 a) (T0 q1) (T0 q2) *
          signedArea2 (T0 q3) (T0 q1) (T0 q2) := by
      rw [tau0.halfplane_sign a q1 q2, tau0.halfplane_sign q3 q1 q2]
      have hscale_sq_pos : 0 < tau0.scale ^ 2 := sq_pos_of_ne_zero (ne_of_gt tau0.scale_pos)
      have hrew :
          (tau0.orientation * (tau0.scale ^ 2) * signedArea2 a q1 q2) *
              (tau0.orientation * (tau0.scale ^ 2) * signedArea2 q3 q1 q2) =
            (tau0.orientation ^ 2) * (tau0.scale ^ 2 * tau0.scale ^ 2) *
              (signedArea2 a q1 q2 * signedArea2 q3 q1 q2) := by
        ring
      rw [hrew, tau0.orientation_sq]
      exact mul_pos (mul_pos (by positivity) (mul_pos hscale_sq_pos hscale_sq_pos)) hside_a
    have ha_img_pos :
        0 < signedArea2 (T0 a) (T0 q1) (T0 q2) := by
      by_contra hnot
      have hnonpos : signedArea2 (T0 a) (T0 q1) (T0 q2) ≤ 0 := by linarith
      have : signedArea2 (T0 a) (T0 q1) (T0 q2) *
          signedArea2 (T0 q3) (T0 q1) (T0 q2) ≤ 0 :=
        mul_nonpos_of_nonpos_of_nonneg hnonpos (le_of_lt hq3_img_pos)
      linarith
    have ha_y_pos : 0 < (T0 a) 1 := by
      rw [hv1, hv2, b3n9m051_signedArea2_baseChord_vec2] at ha_img_pos
      linarith
    have ha2T0 : T0 a = Problem97.CGN.vec2 0 (Real.sqrt 3) := by
      exact b3n9m051_base_transport_a2_eq_upper tau0 hv1 hv2 hleft hright ha_y_pos
    rcases S.i3_v3_a2_base_chord_side_signs_of_exact_packet
        (Z := Z) hbranch0 hexact tau0 hv1 hv2 ha2T0 with
      ⟨hq3y_pos0, hbelow0⟩
    let T : ℝ² → ℝ² := fun x => b3n9m051_halfShift (T0 x)
    let tau : Problem97.CGN.SimilarityTransportData T :=
      b3n9m051_similarityTransportComp tau0 b3n9m051_halfShiftSimilarityTransportData
    have hv1T : T q1 = Problem97.CGN.vec2 0 0 := by
      dsimp [T]
      rw [hv1]
      ext i <;> fin_cases i <;>
        simp [b3n9m051_halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hv2T : T q2 = Problem97.CGN.vec2 1 0 := by
      dsimp [T]
      rw [hv2]
      ext i <;> fin_cases i <;>
        simp [b3n9m051_halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have ha2T : T a = Problem97.CGN.vec2 ((1 : ℝ) / 2) (Real.sqrt 3 / 2) := by
      dsimp [T]
      rw [ha2T0]
      ext i <;> fin_cases i <;>
        simp [b3n9m051_halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hbelow :
        ∀ x ∈ S.I3, (T x) 1 < 0 := by
      intro x hxI3
      dsimp [T]
      have hxlt := hbelow0 x hxI3
      simp [b3n9m051_halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      linarith
    have hq3y_T : 0 < (T q3) 1 := by
      dsimp [T]
      simp [b3n9m051_halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      linarith
    have hdist_q2q3 :
        dist (T q2) (T q3) = dist (T q2) (T q1) := by
      exact (tau.dist_eq_iff q2 q3 q1).2 hq2q3_eq
    have hbase_dist :
        dist (T q2) (T q1) = 1 := by
      rw [hv2T, hv1T, dist_eq_norm]
      have hvec :
          Problem97.CGN.vec2 1 0 - Problem97.CGN.vec2 0 0 =
            Problem97.CGN.vec2 1 0 := by
        ext i <;> fin_cases i <;>
          simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
      rw [hvec, EuclideanSpace.norm_eq]
      norm_num [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hdist_q2q3_one : dist (T q2) (T q3) = 1 := by
      rw [hdist_q2q3, hbase_dist]
    have hnonobtuse_T :
        dist (T q1) (T q3) ^ 2 ≤ dist (T q1) (T q2) ^ 2 + dist (T q2) (T q3) ^ 2 := by
      have hmul :
          tau.scale ^ 2 * dist q1 q3 ^ 2 ≤
            tau.scale ^ 2 * (dist q1 q2 ^ 2 + dist q2 q3 ^ 2) := by
        exact mul_le_mul_of_nonneg_left hinner_dist (sq_nonneg tau.scale)
      have hscaled :
          (tau.scale * dist q1 q3) ^ 2 ≤
            (tau.scale * dist q1 q2) ^ 2 + (tau.scale * dist q2 q3) ^ 2 := by
        nlinarith only [hmul]
      simpa [tau.dist_image] using hscaled
    have hlong_T : dist (T q1) (T q2) < dist (T q1) (T q3) := by
      rw [tau.dist_image, tau.dist_image]
      nlinarith only [hlong, tau.scale_pos]
    have horigin_sq_le_two :
        dist (Problem97.CGN.vec2 0 0) (T q3) ^ 2 ≤ 2 := by
      have hdist_q1q2_sq :
          dist (T q1) (T q2) ^ 2 = 1 := by
        have hdist : dist (T q1) (T q2) = 1 := by
          rw [dist_comm]
          exact hbase_dist
        have hnonneg : 0 ≤ dist (T q1) (T q2) := dist_nonneg
        nlinarith only [hdist, hnonneg]
      have hdist_q2q3_sq :
          dist (T q2) (T q3) ^ 2 = 1 := by
        have hnonneg : 0 ≤ dist (T q2) (T q3) := dist_nonneg
        nlinarith only [hdist_q2q3, hbase_dist, hdist_q2q3_one, hnonneg]
      have htmp := hnonobtuse_T
      rw [hdist_q1q2_sq, hdist_q2q3_sq] at htmp
      have : dist (Problem97.CGN.vec2 0 0) (T q3) ^ 2 ≤ 2 := by
        have htmp' : dist (Problem97.CGN.vec2 0 0) (T q3) ^ 2 ≤ 1 + 1 := by
          simpa [hv1T, dist_comm] using htmp
        nlinarith only [htmp']
      exact this
    have horigin_gt_one :
        1 < dist (Problem97.CGN.vec2 0 0) (T q3) := by
      have h01 : dist (Problem97.CGN.vec2 0 0) (Problem97.CGN.vec2 1 0) = 1 := by
        rw [dist_eq_norm]
        have hvec :
            Problem97.CGN.vec2 0 0 - Problem97.CGN.vec2 1 0 =
              Problem97.CGN.vec2 (-1) 0 := by
          ext i <;> fin_cases i <;>
            simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
        rw [hvec, EuclideanSpace.norm_eq]
        norm_num [Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have hlong_T' := hlong_T
      rw [hv1T, hv2T] at hlong_T'
      simpa [h01] using hlong_T'
    have hunit_T :
        dist (T q3) (Problem97.CGN.vec2 1 0) = 1 := by
      simpa [hv2T, dist_comm] using hdist_q2q3_one
    rcases b3n9m051_delta_parameterization_of_normalized_apex
        (p := T q3) hunit_T hq3y_T horigin_sq_le_two horigin_gt_one with
      ⟨δ, hv3T, hδ_lo, hδ_hi⟩
    refine ⟨T, tau, δ, hv1T, hv2T, ha2T, hv3T, hδ_lo, hδ_hi, hbelow⟩
  by_cases hq3pos : 0 < (Tbase q3) 1
  · exact build_from tauBase hv1Base hv2Base hq3pos
  · let Tflip : ℝ² → ℝ² := fun x => b3n9m051_flipY (Tbase x)
    let tauFlip : Problem97.CGN.SimilarityTransportData Tflip :=
      b3n9m051_similarityTransportComp tauBase b3n9m051_flipYSimilarityTransportData
    have hv1Flip : Tflip q1 = Problem97.CGN.vec2 (-1) 0 := by
      dsimp [Tflip]
      rw [hv1Base]
      ext i <;> fin_cases i <;>
        simp [b3n9m051_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hv2Flip : Tflip q2 = Problem97.CGN.vec2 1 0 := by
      dsimp [Tflip]
      rw [hv2Base]
      ext i <;> fin_cases i <;>
        simp [b3n9m051_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hq3Flip : 0 < (Tflip q3) 1 := by
      dsimp [Tflip]
      simp [b3n9m051_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have hq3neg : (Tbase q3) 1 < 0 := by
        have hle : (Tbase q3) 1 ≤ 0 := le_of_not_gt hq3pos
        exact lt_of_le_of_ne hle hq3_base_nonzero
      linarith
    exact build_from tauFlip hv1Flip hv2Flip hq3Flip
theorem i3_v3_a2_normalized_height_gap_of_exact_packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s : ℝ}
    (hbranch : FormBv1A2SelectorV2Qv1Packet S Z r s)
    (hexact : S.witnessClassAt_v2 s =
      insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²))) :
    S.I3V3A2NormalizedHeightGap Z := by
  have hdelta : S.I3V3A2DeltaNormalizationOfExactPacket Z :=
    S.i3_v3_a2_delta_normalization_of_exact_packet Z
  exact S.i3_v3_a2_normalized_height_gap_of_delta_normalization Z
    (hdelta hbranch hexact)
theorem i3_no_point_on_v3_radius_at_a2_of_exact_packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s : ℝ}
    (hbranch : FormBv1A2SelectorV2Qv1Packet S Z r s)
    (hexact : S.witnessClassAt_v2 s =
      insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²))) :
    S.I3NoPointOnV3RadiusAtA2 Z := by
  exact S.i3_no_point_on_v3_radius_at_a2_of_normalized_height_gap Z
    (S.i3_v3_a2_normalized_height_gap_of_exact_packet Z hbranch hexact)
theorem i3_on_v3_radius_at_a2_card_le_one_of_exact_packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s : ℝ}
    (hbranch : FormBv1A2SelectorV2Qv1Packet S Z r s)
    (hexact : S.witnessClassAt_v2 s =
      insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²))) :
    S.I3OnV3RadiusAtA2CardLeOne Z := by
  exact S.i3_on_v3_radius_at_a2_card_le_one_of_no_hit Z
    (S.i3_no_point_on_v3_radius_at_a2_of_exact_packet Z hbranch hexact)
theorem selectorShape_v3_q_eq_a2_impossible_of_exact_packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s t : ℝ}
    (hbranch : FormBv1A2SelectorV2Qv1Packet S Z r s)
    (hexact : S.witnessClassAt_v2 s =
      insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²)))
    (hpacket : SelectorV3Qa2Packet S Z t) :
    False := by
  exact S.selectorShape_v3_q_eq_a2_impossible Z hpacket
    (S.i3_on_v3_radius_at_a2_card_le_one_of_exact_packet Z hbranch hexact)
abbrev SharedCirclePointForcesV3
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r s : ℝ) : Prop :=
  ∀ p : ℝ²,
    p ∈ ({Z.a1, Z.b1, S.triangle.v3} : Finset ℝ²) →
    p ∈ S.witnessClassAt_v2 s →
    p ∈ S.witnessClassAt_v1 r →
    p = S.triangle.v3
def b3n9m051_FormBv1B2SelectorV2LowerPacket
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r s : ℝ) : Prop :=
  let T := S.witnessClassAt_v2 s
  (Z.b2 : ℝ²) ∈ S.I2 ∧
  S.witnessClassAt_v1 r ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²) ∧
  T.card = 4 ∧
  S.I2 ⊆ T ∧
  T ∩ S.CP.C1 = ({S.triangle.v3} : Finset ℝ²) ∧
  ((T ∩ S.CP.C3 = ({Z.a3} : Finset ℝ²)) ∨
   (T ∩ S.CP.C3 = ({Z.b3} : Finset ℝ²)))
theorem n4d_bB_2_q_eq_v1_impossible
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s t : ℝ}
    (hB : S.IsFormB_v1 r)
    (hlower : b3n9m051_FormBv1B2SelectorV2LowerPacket S Z r s)
    (hpacket3 : SelectorV3Qv1Packet S Z t) :
    False := by
  classical
  rcases hlower with ⟨hB2, hb2eq, hTcard, hI2sub, hC1eq, hC3eq⟩
  let T := S.witnessClassAt_v2 s
  have hv3T : S.triangle.v3 ∈ T := by
    have hmem : S.triangle.v3 ∈ ({S.triangle.v3} : Finset ℝ²) := by simp
    rw [← hC1eq] at hmem
    exact (Finset.mem_inter.mp hmem).1
  have hq :
      (Z.a3 : ℝ²) ∈ T ∩ S.CP.C3 ∨ (Z.b3 : ℝ²) ∈ T ∩ S.CP.C3 := by
    rcases hC3eq with hqa3 | hqb3
    · left
      have hmem : Z.a3 ∈ ({Z.a3} : Finset ℝ²) := by simp
      rw [← hqa3] at hmem
      exact hmem
    · right
      have hmem : Z.b3 ∈ ({Z.b3} : Finset ℝ²) := by simp
      rw [← hqb3] at hmem
      exact hmem
  obtain ⟨q, hqI3, hqT2⟩ : ∃ q : ℝ², q ∈ S.I3 ∧ q ∈ T := by
    rcases hq with hqa3 | hqb3
    · refine ⟨Z.a3, ?_, ?_⟩
      · rw [Z.hI3]
        simp
      · exact (Finset.mem_inter.mp hqa3).1
    · refine ⟨Z.b3, ?_, ?_⟩
      · rw [Z.hI3]
        simp
      · exact (Finset.mem_inter.mp hqb3).1
  have hv3rad : dist S.triangle.v2 S.triangle.v3 = s := by
    simpa using (Finset.mem_filter.mp hv3T).2
  have hqrad : dist S.triangle.v2 q = s := by
    simpa using (Finset.mem_filter.mp hqT2).2
  have hq_lt_base : dist S.triangle.v2 q < dist S.triangle.v2 S.triangle.v1 := by
    rcases Problem97.CGN.CGN4g_capData_of_supportCap_oriented
        (A := A) (C := S.CP.C3) (M := S.triangle3)
        S.hconv S.hnoncol S.CP.C3_subset
        (fun x hxA => (S.CP.arc_membership x hxA).2.2)
        S.CP.v1_mem_C3 S.CP.v2_mem_C3 S.packet3 S.packet3.inner_at_v1 with
      ⟨m, L, Packet, Hside, Hord, hLC, hEnds⟩
    have hqC3 : q ∈ S.CP.C3 := by
      unfold Problem97.FiniteEndpointShell.I3 at hqI3
      exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hqI3)
    have hqL : q ∈ Finset.univ.image L.points := by
      rw [hLC]
      exact hqC3
    rcases Finset.mem_image.mp hqL with ⟨i, -, hi⟩
    have hq_ne_v2 : q ≠ S.triangle.v2 := by
      unfold Problem97.FiniteEndpointShell.I3 at hqI3
      exact (Finset.mem_erase.mp hqI3).1
    have hq_ne_v1 : q ≠ S.triangle.v1 := by
      unfold Problem97.FiniteEndpointShell.I3 at hqI3
      exact (Finset.mem_erase.mp (Finset.mem_erase.mp hqI3).2).1
    rcases hEnds with hFirstLast | hLastFirst
    · have hi_ne_last : i ≠ Problem97.CGN.lastIndex Packet.hm := by
        intro hi_last
        apply hq_ne_v2
        calc
          q = L.points i := hi.symm
          _ = L.points (Problem97.CGN.lastIndex Packet.hm) := by simpa [hi_last]
          _ = S.triangle.v2 := hFirstLast.2
      have hi_rev_lt_last : i.rev < Problem97.CGN.lastIndex Packet.hm := by
        apply Fin.lt_def.mpr
        rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
        have hi_lt_top : i.val < m := i.is_lt
        have hi_ne_zero : i.val ≠ 0 := by
          intro hi_zero
          have hi_first : i = Problem97.CGN.firstIndex Packet.hm := by
            ext
            simpa [Problem97.CGN.firstIndex] using hi_zero
          apply hq_ne_v1
          calc
            q = L.points i := hi.symm
            _ = L.points (Problem97.CGN.firstIndex Packet.hm) := by simpa [hi_first]
            _ = S.triangle.v1 := hFirstLast.1
        omega
      have hmono :
          Problem97.FiniteEndpoint.E3L20b_rightEndpoint_capDistance_strict
            (L.points (Problem97.CGN.lastIndex Packet.hm))
            (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev L) :=
        Problem97.FiniteEndpoint.E3L20b_of_cgnCapData Packet Hside Hord
      have hlt :=
        hmono (i := i.rev) (j := Problem97.CGN.lastIndex Packet.hm) hi_rev_lt_last
      have hlast_rev_first :
          (Problem97.CGN.lastIndex Packet.hm).rev = Problem97.CGN.firstIndex Packet.hm := by
        ext
        rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
        simp [Problem97.CGN.firstIndex]
        omega
      simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev_points,
        hi, hFirstLast.1, hFirstLast.2, hlast_rev_first] using hlt
    · have hi_lt_last : i < Problem97.CGN.lastIndex Packet.hm := by
        apply Fin.lt_def.mpr
        rw [Problem97.CGN.lastIndex_val]
        have hi_lt_top : i.val < m := i.is_lt
        have hi_ne_last : i ≠ Problem97.CGN.lastIndex Packet.hm := by
          intro hi_last
          apply hq_ne_v1
          calc
            q = L.points i := hi.symm
            _ = L.points (Problem97.CGN.lastIndex Packet.hm) := by simpa [hi_last]
            _ = S.triangle.v1 := hLastFirst.2
        have hi_ne_top : i.val ≠ m - 1 := by
          intro hi_top
          apply hi_ne_last
          ext
          simpa [Problem97.CGN.lastIndex, Problem97.CGN.finIndex] using hi_top
        omega
      have hmono :
          Problem97.FiniteEndpoint.E3L20a_leftEndpoint_capDistance_strict
            (L.points (Problem97.CGN.firstIndex Packet.hm))
            (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap L) :=
        Problem97.FiniteEndpoint.E3L20a_of_cgnCapData Packet Hside Hord
      have hlt :=
        hmono (i := i) (j := Problem97.CGN.lastIndex Packet.hm) hi_lt_last
      simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap_points,
        hi, hLastFirst.1, hLastFirst.2] using hlt
  have hbase_lt_long : dist S.triangle.v2 S.triangle.v1 < dist S.triangle.v3 S.triangle.v1 := by
    have hb2T1 : Z.b2 ∈ S.witnessClassAt_v1 r := by
      have hb2mem : Z.b2 ∈ ({Z.b2} : Finset ℝ²) := by simp
      rw [← hb2eq] at hb2mem
      exact (Finset.mem_inter.mp hb2mem).1
    have hv2T1 : S.triangle.v2 ∈ S.witnessClassAt_v1 r := by
      rcases hB with ⟨x, hxI2, hxeq, hv2eq⟩
      have hv2mem : S.triangle.v2 ∈ ({S.triangle.v2} : Finset ℝ²) := by simp
      rw [← hv2eq] at hv2mem
      exact (Finset.mem_inter.mp hv2mem).1
    have hbase_eq : dist S.triangle.v1 S.triangle.v2 = dist S.triangle.v1 Z.b2 := by
      have hv2dist : dist S.triangle.v1 S.triangle.v2 = r := by
        simpa using (Finset.mem_filter.mp hv2T1).2
      have hb2dist : dist S.triangle.v1 Z.b2 = r := by
        simpa using (Finset.mem_filter.mp hb2T1).2
      rw [hv2dist, hb2dist]
    have h := S.b3n9m051_v1b2_lt_v1v3_of_formB_v1_b2 Z hB ⟨hB2, hb2eq⟩
    simpa [hbase_eq, dist_comm] using h
  have hv2v1 : dist S.triangle.v3 S.triangle.v2 < dist S.triangle.v3 S.triangle.v1 := by
    calc
      dist S.triangle.v3 S.triangle.v2 = dist S.triangle.v2 S.triangle.v3 := by rw [dist_comm]
      _ = dist S.triangle.v2 q := by rw [hqrad, hv3rad]
      _ < dist S.triangle.v2 S.triangle.v1 := hq_lt_base
      _ < dist S.triangle.v3 S.triangle.v1 := hbase_lt_long
  exact S.selectorShape_v3_q_eq_v1_impossible Z hpacket3 hv2v1
theorem b3n9m051_v1_lt_v1v3_of_mem_I2
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {p : ℝ²}
    (hpI2 : p ∈ S.I2) :
    dist S.triangle.v1 p < dist S.triangle.v1 S.triangle.v3 := by
  classical
  have hpC2 : p ∈ S.CP.C2 := by
    unfold Problem97.FiniteEndpointShell.I2 at hpI2
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hpI2).2).2
  have hp_ne_v3 : p ≠ S.triangle.v3 := by
    unfold Problem97.FiniteEndpointShell.I2 at hpI2
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hpI2).2).1
  have hp_ne_v1 : p ≠ S.triangle.v1 := by
    unfold Problem97.FiniteEndpointShell.I2 at hpI2
    exact (Finset.mem_erase.mp hpI2).1
  rcases Problem97.CGN.CGN4g_capData_of_supportCap_oriented
      (A := A) (C := S.CP.C2) (M := S.triangle2)
      S.hconv S.hnoncol S.CP.C2_subset
      (fun x hxA => (S.CP.arc_membership x hxA).2.1)
      S.CP.v3_mem_C2 S.CP.v1_mem_C2 S.packet2 S.packet2.inner_at_v1 with
    ⟨m, L, Packet, Hside, Hord, hLC, hEnds⟩
  have hpL : p ∈ Finset.univ.image L.points := by
    rw [hLC]
    exact hpC2
  rcases Finset.mem_image.mp hpL with ⟨i, -, hi⟩
  rcases hEnds with hFirstLast | hLastFirst
  · have hi_ne_first : i ≠ Problem97.CGN.firstIndex Packet.hm := by
      intro hi_first
      apply hp_ne_v3
      calc
        p = L.points i := hi.symm
        _ = L.points (Problem97.CGN.firstIndex Packet.hm) := by simpa [hi_first]
        _ = S.triangle.v3 := hFirstLast.1
    have hi_rev_lt_last : i.rev < Problem97.CGN.lastIndex Packet.hm := by
      apply Fin.lt_def.mpr
      rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
      have hi_pos : 0 < i.val := by
        apply Nat.pos_of_ne_zero
        intro hi_zero
        apply hi_ne_first
        ext
        simpa [Problem97.CGN.firstIndex] using hi_zero
      omega
    have hmono :
        Problem97.FiniteEndpoint.E3L20b_rightEndpoint_capDistance_strict
          (L.points (Problem97.CGN.lastIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev L) :=
      Problem97.FiniteEndpoint.E3L20b_of_cgnCapData Packet Hside Hord
    have hlt :=
      hmono (i := i.rev) (j := Problem97.CGN.lastIndex Packet.hm) hi_rev_lt_last
    have hlast_rev_first : (Problem97.CGN.lastIndex Packet.hm).rev =
        Problem97.CGN.firstIndex Packet.hm := by
      ext
      rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
      simp [Problem97.CGN.firstIndex]
      omega
    simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev_points,
      hi, hFirstLast.1, hFirstLast.2, hlast_rev_first] using hlt
  · have hi_lt_last : i < Problem97.CGN.lastIndex Packet.hm := by
      apply Fin.lt_def.mpr
      rw [Problem97.CGN.lastIndex_val]
      have hi_ne_last : i ≠ Problem97.CGN.lastIndex Packet.hm := by
        intro hi_last
        apply hp_ne_v3
        calc
          p = L.points i := hi.symm
          _ = L.points (Problem97.CGN.lastIndex Packet.hm) := by simpa [hi_last]
          _ = S.triangle.v3 := hLastFirst.2
      have hi_lt_top : i.val < m := i.is_lt
      have hi_ne_top : i.val ≠ m - 1 := by
        intro hi_top
        apply hi_ne_last
        ext
        simpa [Problem97.CGN.lastIndex, Problem97.CGN.finIndex] using hi_top
      omega
    have hmono :
        Problem97.FiniteEndpoint.E3L20a_leftEndpoint_capDistance_strict
          (L.points (Problem97.CGN.firstIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap L) :=
      Problem97.FiniteEndpoint.E3L20a_of_cgnCapData Packet Hside Hord
    have hlt :=
      hmono (i := i) (j := Problem97.CGN.lastIndex Packet.hm) hi_lt_last
    simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap_points,
      hi, hLastFirst.1, hLastFirst.2] using hlt
def FormBv1A2SelectorV2LowerPacket
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r s : ℝ) : Prop :=
  let T := S.witnessClassAt_v2 s
  (Z.a2 : ℝ²) ∈ S.I2 ∧
  S.witnessClassAt_v1 r ∩ S.CP.C2 = ({Z.a2} : Finset ℝ²) ∧
  T.card = 4 ∧
  S.I2 ⊆ T ∧
  T ∩ S.CP.C1 = ({S.triangle.v3} : Finset ℝ²) ∧
  ((T ∩ S.CP.C3 = ({Z.a3} : Finset ℝ²)) ∨
   (T ∩ S.CP.C3 = ({Z.b3} : Finset ℝ²)))
theorem n4d_bA_2_q_eq_v1_impossible
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s t : ℝ}
    (hB : S.IsFormB_v1 r)
    (hlower : FormBv1A2SelectorV2LowerPacket S Z r s)
    (hpacket3 : SelectorV3Qv1Packet S Z t) :
    False := by
  classical
  rcases hlower with ⟨hA2, ha2eq, hTcard, hI2sub, hC1eq, hC3eq⟩
  let T := S.witnessClassAt_v2 s
  have hv3T : S.triangle.v3 ∈ T := by
    have hmem : S.triangle.v3 ∈ ({S.triangle.v3} : Finset ℝ²) := by simp
    rw [← hC1eq] at hmem
    exact (Finset.mem_inter.mp hmem).1
  have hq :
      (Z.a3 : ℝ²) ∈ T ∩ S.CP.C3 ∨ (Z.b3 : ℝ²) ∈ T ∩ S.CP.C3 := by
    rcases hC3eq with hqa3 | hqb3
    · left
      have hmem : Z.a3 ∈ ({Z.a3} : Finset ℝ²) := by simp
      rw [← hqa3] at hmem
      exact hmem
    · right
      have hmem : Z.b3 ∈ ({Z.b3} : Finset ℝ²) := by simp
      rw [← hqb3] at hmem
      exact hmem
  obtain ⟨q, hqI3, hqT2⟩ : ∃ q : ℝ², q ∈ S.I3 ∧ q ∈ T := by
    rcases hq with hqa3 | hqb3
    · refine ⟨Z.a3, ?_, ?_⟩
      · rw [Z.hI3]
        simp
      · exact (Finset.mem_inter.mp hqa3).1
    · refine ⟨Z.b3, ?_, ?_⟩
      · rw [Z.hI3]
        simp
      · exact (Finset.mem_inter.mp hqb3).1
  have hv3rad : dist S.triangle.v2 S.triangle.v3 = s := by
    simpa using (Finset.mem_filter.mp hv3T).2
  have hqrad : dist S.triangle.v2 q = s := by
    simpa using (Finset.mem_filter.mp hqT2).2
  have hq_lt_base : dist S.triangle.v2 q < dist S.triangle.v2 S.triangle.v1 := by
    rcases Problem97.CGN.CGN4g_capData_of_supportCap_oriented
        (A := A) (C := S.CP.C3) (M := S.triangle3)
        S.hconv S.hnoncol S.CP.C3_subset
        (fun x hxA => (S.CP.arc_membership x hxA).2.2)
        S.CP.v1_mem_C3 S.CP.v2_mem_C3 S.packet3 S.packet3.inner_at_v1 with
      ⟨m, L, Packet, Hside, Hord, hLC, hEnds⟩
    have hqC3 : q ∈ S.CP.C3 := by
      unfold Problem97.FiniteEndpointShell.I3 at hqI3
      exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hqI3)
    have hqL : q ∈ Finset.univ.image L.points := by
      rw [hLC]
      exact hqC3
    rcases Finset.mem_image.mp hqL with ⟨i, -, hi⟩
    have hq_ne_v2 : q ≠ S.triangle.v2 := by
      unfold Problem97.FiniteEndpointShell.I3 at hqI3
      exact (Finset.mem_erase.mp hqI3).1
    have hq_ne_v1 : q ≠ S.triangle.v1 := by
      unfold Problem97.FiniteEndpointShell.I3 at hqI3
      exact (Finset.mem_erase.mp (Finset.mem_erase.mp hqI3).2).1
    rcases hEnds with hFirstLast | hLastFirst
    · have hi_ne_last : i ≠ Problem97.CGN.lastIndex Packet.hm := by
        intro hi_last
        apply hq_ne_v2
        calc
          q = L.points i := hi.symm
          _ = L.points (Problem97.CGN.lastIndex Packet.hm) := by simpa [hi_last]
          _ = S.triangle.v2 := hFirstLast.2
      have hi_rev_lt_last : i.rev < Problem97.CGN.lastIndex Packet.hm := by
        apply Fin.lt_def.mpr
        rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
        have hi_lt_top : i.val < m := i.is_lt
        have hi_ne_zero : i.val ≠ 0 := by
          intro hi_zero
          have hi_first : i = Problem97.CGN.firstIndex Packet.hm := by
            ext
            simpa [Problem97.CGN.firstIndex] using hi_zero
          apply hq_ne_v1
          calc
            q = L.points i := hi.symm
            _ = L.points (Problem97.CGN.firstIndex Packet.hm) := by simpa [hi_first]
            _ = S.triangle.v1 := hFirstLast.1
        omega
      have hmono :
          Problem97.FiniteEndpoint.E3L20b_rightEndpoint_capDistance_strict
            (L.points (Problem97.CGN.lastIndex Packet.hm))
            (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev L) :=
        Problem97.FiniteEndpoint.E3L20b_of_cgnCapData Packet Hside Hord
      have hlt :=
        hmono (i := i.rev) (j := Problem97.CGN.lastIndex Packet.hm) hi_rev_lt_last
      have hlast_rev_first :
          (Problem97.CGN.lastIndex Packet.hm).rev = Problem97.CGN.firstIndex Packet.hm := by
        ext
        rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
        simp [Problem97.CGN.firstIndex]
        omega
      simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev_points,
        hi, hFirstLast.1, hFirstLast.2, hlast_rev_first] using hlt
    · have hi_lt_last : i < Problem97.CGN.lastIndex Packet.hm := by
        apply Fin.lt_def.mpr
        rw [Problem97.CGN.lastIndex_val]
        have hi_lt_top : i.val < m := i.is_lt
        have hi_ne_last : i ≠ Problem97.CGN.lastIndex Packet.hm := by
          intro hi_last
          apply hq_ne_v1
          calc
            q = L.points i := hi.symm
            _ = L.points (Problem97.CGN.lastIndex Packet.hm) := by simpa [hi_last]
            _ = S.triangle.v1 := hLastFirst.2
        have hi_ne_top : i.val ≠ m - 1 := by
          intro hi_top
          apply hi_ne_last
          ext
          simpa [Problem97.CGN.lastIndex, Problem97.CGN.finIndex] using hi_top
        omega
      have hmono :
          Problem97.FiniteEndpoint.E3L20a_leftEndpoint_capDistance_strict
            (L.points (Problem97.CGN.firstIndex Packet.hm))
            (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap L) :=
        Problem97.FiniteEndpoint.E3L20a_of_cgnCapData Packet Hside Hord
      have hlt :=
        hmono (i := i) (j := Problem97.CGN.lastIndex Packet.hm) hi_lt_last
      simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap_points,
        hi, hLastFirst.1, hLastFirst.2] using hlt
  have hbase_lt_long : dist S.triangle.v2 S.triangle.v1 < dist S.triangle.v3 S.triangle.v1 := by
    have ha2T1 : Z.a2 ∈ S.witnessClassAt_v1 r := by
      have ha2mem : Z.a2 ∈ ({Z.a2} : Finset ℝ²) := by simp
      rw [← ha2eq] at ha2mem
      exact (Finset.mem_inter.mp ha2mem).1
    have hv2T1 : S.triangle.v2 ∈ S.witnessClassAt_v1 r := by
      rcases hB with ⟨x, hxI2, hxeq, hv2eq⟩
      have hv2mem : S.triangle.v2 ∈ ({S.triangle.v2} : Finset ℝ²) := by simp
      rw [← hv2eq] at hv2mem
      exact (Finset.mem_inter.mp hv2mem).1
    have hbase_eq : dist S.triangle.v1 S.triangle.v2 = dist S.triangle.v1 Z.a2 := by
      have hv2dist : dist S.triangle.v1 S.triangle.v2 = r := by
        simpa using (Finset.mem_filter.mp hv2T1).2
      have ha2dist : dist S.triangle.v1 Z.a2 = r := by
        simpa using (Finset.mem_filter.mp ha2T1).2
      rw [hv2dist, ha2dist]
    have h := S.b3n9m051_v1_lt_v1v3_of_mem_I2 (p := Z.a2) hA2
    simpa [hbase_eq, dist_comm] using h
  have hv2v1 : dist S.triangle.v3 S.triangle.v2 < dist S.triangle.v3 S.triangle.v1 := by
    calc
      dist S.triangle.v3 S.triangle.v2 = dist S.triangle.v2 S.triangle.v3 := by rw [dist_comm]
      _ = dist S.triangle.v2 q := by rw [hqrad, hv3rad]
      _ < dist S.triangle.v2 S.triangle.v1 := hq_lt_base
      _ < dist S.triangle.v3 S.triangle.v1 := hbase_lt_long
  exact S.selectorShape_v3_q_eq_v1_impossible Z hpacket3 hv2v1
theorem b3n9m051_v1_lt_v1v2_of_mem_I3
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {q : ℝ²}
    (hqI3 : q ∈ S.I3) :
    dist S.triangle.v1 q < dist S.triangle.v1 S.triangle.v2 := by
  classical
  have hqC3 : q ∈ S.CP.C3 := by
    unfold Problem97.FiniteEndpointShell.I3 at hqI3
    exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hqI3)
  have hq_ne_v2 : q ≠ S.triangle.v2 := by
    unfold Problem97.FiniteEndpointShell.I3 at hqI3
    exact (Finset.mem_erase.mp hqI3).1
  have hq_ne_v1 : q ≠ S.triangle.v1 := by
    unfold Problem97.FiniteEndpointShell.I3 at hqI3
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hqI3).2).1
  rcases Problem97.CGN.CGN4g_capData_of_supportCap_oriented
      (A := A) (C := S.CP.C3) (M := S.triangle3)
      S.hconv S.hnoncol S.CP.C3_subset
      (fun x hxA => (S.CP.arc_membership x hxA).2.2)
      S.CP.v1_mem_C3 S.CP.v2_mem_C3 S.packet3 S.packet3.inner_at_v1 with
    ⟨m, L, Packet, Hside, Hord, hLC, hEnds⟩
  have hqL : q ∈ Finset.univ.image L.points := by
    rw [hLC]
    exact hqC3
  rcases Finset.mem_image.mp hqL with ⟨i, -, hi⟩
  rcases hEnds with hFirstLast | hLastFirst
  ·
    have hi_ne_last : i ≠ Problem97.CGN.lastIndex Packet.hm := by
      intro hi_last
      apply hq_ne_v2
      calc
        q = L.points i := hi.symm
        _ = L.points (Problem97.CGN.lastIndex Packet.hm) := by simpa [hi_last]
        _ = S.triangle.v2 := hFirstLast.2
    have hi_lt_last : i < Problem97.CGN.lastIndex Packet.hm := by
      apply Fin.lt_def.mpr
      rw [Problem97.CGN.lastIndex_val]
      have hi_lt_top : i.val < m := i.is_lt
      have hi_ne_top : i.val ≠ m - 1 := by
        intro hi_top
        apply hi_ne_last
        ext
        simpa [Problem97.CGN.lastIndex, Problem97.CGN.finIndex] using hi_top
      omega
    have hmono :
        Problem97.FiniteEndpoint.E3L20a_leftEndpoint_capDistance_strict
          (L.points (Problem97.CGN.firstIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap L) :=
      Problem97.FiniteEndpoint.E3L20a_of_cgnCapData Packet Hside Hord
    have hlt :=
      hmono (i := i) (j := Problem97.CGN.lastIndex Packet.hm) hi_lt_last
    simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap_points,
      hi, hFirstLast.1, hFirstLast.2] using hlt
  ·
    have hi_ne_first : i ≠ Problem97.CGN.firstIndex Packet.hm := by
      intro hi_first
      apply hq_ne_v2
      calc
        q = L.points i := hi.symm
        _ = L.points (Problem97.CGN.firstIndex Packet.hm) := by simpa [hi_first]
        _ = S.triangle.v2 := hLastFirst.1
    have hi_rev_lt_last : i.rev < Problem97.CGN.lastIndex Packet.hm := by
      apply Fin.lt_def.mpr
      rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
      have hi_pos : 0 < i.val := by
        apply Nat.pos_of_ne_zero
        intro hi_zero
        apply hi_ne_first
        ext
        simpa [Problem97.CGN.firstIndex] using hi_zero
      omega
    have hmono :
        Problem97.FiniteEndpoint.E3L20b_rightEndpoint_capDistance_strict
          (L.points (Problem97.CGN.lastIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev L) :=
      Problem97.FiniteEndpoint.E3L20b_of_cgnCapData Packet Hside Hord
    have hlt :=
      hmono (i := i.rev) (j := Problem97.CGN.lastIndex Packet.hm) hi_rev_lt_last
    have hlast_rev_first : (Problem97.CGN.lastIndex Packet.hm).rev =
        Problem97.CGN.firstIndex Packet.hm := by
      ext
      rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
      simp [Problem97.CGN.firstIndex]
      omega
    simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev_points,
      hi, hLastFirst.1, hLastFirst.2, hlast_rev_first] using hlt
theorem b3n9m051_pEqB_lower_apex_dist_contradiction
    (A B q : ℝ²) (r δ a b : ℝ) (hr : 0 < r)
    (hA : A = Problem97.CGN.vec2 0 0) (hB : B = Problem97.CGN.vec2 1 0)
    (hq : q = Problem97.CGN.vec2 (1 + a) b)
    (hcirc : a ^ 2 + b ^ 2 = r ^ 2)
    (hdot : a * Real.cos δ + b * Real.sin δ = r / 2)
    (hblo : b < 0) (hδlo : 0 < δ) (hδhi : δ < Real.pi / 3)
    (hcap : dist A q < dist A B) : False := by
  have hsin : 0 < Real.sin δ := by
    apply Real.sin_pos_of_pos_of_lt_pi hδlo
    have := Real.pi_pos; linarith
  have hcos : 0 < Real.cos δ := by
    apply Real.cos_pos_of_mem_Ioo
    constructor
    · have := Real.pi_pos; linarith
    · have := Real.pi_pos; linarith
  have ha_pos : 0 < a := by
    have h1 : 0 < a * Real.cos δ := by nlinarith only [hr, hdot, hblo, hsin]
    rcases lt_trichotomy a 0 with h | h | h
    · nlinarith only [hr, hdot, hblo, hsin, hcos, h]
    · simp [h] at h1
    · exact h
  have hAB_sq : dist A B ^ 2 = 1 := by
    rw [hA, hB, b3n9m051_dist_sq_eq_coord_sq_add_coord_sq]
    simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
  have hAq_sq : dist A q ^ 2 = 1 + 2 * a + r ^ 2 := by
    rw [hA, hq, b3n9m051_dist_sq_eq_coord_sq_add_coord_sq]
    simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    nlinarith only [hcirc]
  have h1 : 0 ≤ dist A q := dist_nonneg
  have h2 : 0 ≤ dist A B := dist_nonneg
  nlinarith only [ha_pos, hAB_sq, hAq_sq, hr, hcap, h1, h2]
abbrev PEqBLowerApexConfig
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (q : ℝ²) (r : ℝ) : Prop :=
  ∃ T : ℝ² → ℝ², ∃ _tau : Problem97.CGN.SimilarityTransportData T, ∃ δ a b : ℝ,
    T S.triangle.v1 = Problem97.CGN.vec2 0 0 ∧
    T S.triangle.v2 = Problem97.CGN.vec2 1 0 ∧
    T q = Problem97.CGN.vec2 (1 + a) b ∧
    0 < r ∧
    a ^ 2 + b ^ 2 = r ^ 2 ∧
    a * Real.cos δ + b * Real.sin δ = r / 2 ∧
    b < 0 ∧ 0 < δ ∧ δ < Real.pi / 3
theorem pEqB_row_impossible_of_normalized_config
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {q : ℝ²} {r : ℝ}
    (hconfig : S.PEqBLowerApexConfig q r)
    (hcap : dist S.triangle.v1 q < dist S.triangle.v1 S.triangle.v2) :
    False := by
  rcases hconfig with ⟨T, tau, δ, a, b, hv1, hv2, hqT, hr, hcirc, hdot, hblo, hδlo, hδhi⟩
  have hcapT :
      dist (T S.triangle.v1) (T q) < dist (T S.triangle.v1) (T S.triangle.v2) := by
    rw [tau.dist_image, tau.dist_image]
    have hscale : 0 < tau.scale := tau.scale_pos
    nlinarith only [hcap, hscale, dist_nonneg (x := S.triangle.v1) (y := q), dist_nonneg (x := S.triangle.v1) (y := S.triangle.v2)]
  exact b3n9m051_pEqB_lower_apex_dist_contradiction
    (T S.triangle.v1) (T S.triangle.v2) (T q) r δ a b hr
    hv1 hv2 hqT hcirc hdot hblo hδlo hδhi hcapT
theorem pEqB_row_impossible_of_lower_witness
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {q : ℝ²} {r : ℝ}
    (hqI3 : q ∈ S.I3)
    (hconfig : S.PEqBLowerApexConfig q r) :
    False :=
  S.pEqB_row_impossible_of_normalized_config hconfig (S.b3n9m051_v1_lt_v1v2_of_mem_I3 hqI3)
set_option maxHeartbeats 8000000 in
theorem pEqB_lower_apex_config_of_equilateral
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {q : ℝ²}
    (hqI3 : q ∈ S.I3)
    (hBq : dist S.triangle.v2 q = dist S.triangle.v2 S.triangle.v3)
    (hDq : dist S.triangle.v3 q = dist S.triangle.v2 S.triangle.v3)
    (hsmall : dist S.triangle.v2 S.triangle.v3 < dist S.triangle.v1 S.triangle.v2)
    (hlong : dist S.triangle.v1 S.triangle.v2 < dist S.triangle.v1 S.triangle.v3) :
    ∃ r : ℝ, S.PEqBLowerApexConfig q r := by
  classical
  let q1 : ℝ² := S.triangle.v1
  let q2 : ℝ² := S.triangle.v2
  let q3 : ℝ² := S.triangle.v3
  have hq1ne : q1 ≠ q2 := by simpa [q1, q2] using S.triangle.v12_ne
  rcases b3n9m051_exists_base_transportData q1 q2 hq1ne with
    ⟨Tbase, tauBase, hv1Base, hv2Base⟩
  have horientBase_ne : tauBase.orientation ≠ 0 := by
    intro h0
    have : (0 : ℝ) ^ 2 = 1 := by simpa [h0] using tauBase.orientation_sq
    norm_num at this
  have hq3_base_nonzero : (Tbase q3) 1 ≠ 0 := by
    have hq3_sa_ne : signedArea2 q3 q1 q2 ≠ 0 := by
      have hv1O : ‖q1 - S.Packet.center‖ = S.Packet.radius := by
        simpa [q1] using S.Packet.moser_on_boundary_1
      have hv2O : ‖q2 - S.Packet.center‖ = S.Packet.radius := by
        simpa [q2] using S.Packet.moser_on_boundary_2
      have hv3O : ‖q3 - S.Packet.center‖ = S.Packet.radius := by
        simpa [q3] using S.Packet.moser_on_boundary_3
      exact MEC.signedArea2_ne_zero_of_three_dist_eq
        hv3O hv1O hv2O
        S.triangle.v13_ne.symm S.triangle.v12_ne S.triangle.v23_ne.symm
    have himg_ne : signedArea2 (Tbase q3) (Tbase q1) (Tbase q2) ≠ 0 := by
      rw [tauBase.halfplane_sign q3 q1 q2]
      exact mul_ne_zero
        (mul_ne_zero horientBase_ne (pow_ne_zero 2 (ne_of_gt tauBase.scale_pos)))
        hq3_sa_ne
    intro h0
    apply himg_ne
    rw [hv1Base, hv2Base, b3n9m051_signedArea2_baseChord_vec2]
    linarith
  have build_from :
      ∀ {T0 : ℝ² → ℝ²},
        (tau0 : Problem97.CGN.SimilarityTransportData T0) →
        T0 q1 = Problem97.CGN.vec2 (-1) 0 →
        T0 q2 = Problem97.CGN.vec2 1 0 →
        0 < (T0 q3) 1 →
        ∃ r : ℝ, S.PEqBLowerApexConfig q r := by
    intro T0 tau0 hv1 hv2 hq3y_pos
    let T : ℝ² → ℝ² := fun x => b3n9m051_halfShift (T0 x)
    let tau : Problem97.CGN.SimilarityTransportData T :=
      b3n9m051_similarityTransportComp tau0 b3n9m051_halfShiftSimilarityTransportData
    have hv1T : T q1 = Problem97.CGN.vec2 0 0 := by
      dsimp [T]; rw [hv1]
      ext i <;> fin_cases i <;>
        simp [b3n9m051_halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hv2T : T q2 = Problem97.CGN.vec2 1 0 := by
      dsimp [T]; rw [hv2]
      ext i <;> fin_cases i <;>
        simp [b3n9m051_halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hq3y_T : 0 < (T q3) 1 := by
      dsimp [T]
      simp only [b3n9m051_halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have : (0 : ℝ) < (T0 q3) 1 / 2 := by linarith
      simpa using this
    have hqy_T : (T q) 1 < 0 := by
      have hxA : q ∈ A := S.CP.C3_subset (by
        unfold Problem97.FiniteEndpointShell.I3 at hqI3
        exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hqI3))
      have hqC3 : q ∈ S.CP.C3 := by
        unfold Problem97.FiniteEndpointShell.I3 at hqI3
        exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hqI3)
      have hq_ne_v1 : q ≠ q1 := by
        unfold Problem97.FiniteEndpointShell.I3 at hqI3
        exact (Finset.mem_erase.mp (Finset.mem_erase.mp hqI3).2).1
      have hq_ne_v2 : q ≠ q2 := by
        unfold Problem97.FiniteEndpointShell.I3 at hqI3
        exact (Finset.mem_erase.mp hqI3).1
      have hq3_base_ne : signedArea2 q3 q1 q2 ≠ 0 := by
        have hv1O : dist q3 S.Packet.center = S.Packet.radius := by
          simpa [q3, dist_eq_norm] using S.Packet.moser_on_boundary_3
        have hv2O : dist q1 S.Packet.center = S.Packet.radius := by
          simpa [q1, dist_eq_norm] using S.Packet.moser_on_boundary_1
        have hv3O : dist q2 S.Packet.center = S.Packet.radius := by
          simpa [q2, dist_eq_norm] using S.Packet.moser_on_boundary_2
        exact MEC.signedArea2_ne_zero_of_three_dist_eq
          hv1O hv2O hv3O
          S.triangle.v13_ne.symm S.triangle.v12_ne S.triangle.v23_ne.symm
      have hq_arc :
          signedArea2 q q1 q2 * signedArea2 q3 q1 q2 ≤ 0 := by
        exact (S.CP.arc_membership q hxA).2.2.1 hqC3
      have hq_base_ne : signedArea2 q q1 q2 ≠ 0 := by
        intro hz
        have hcol : Collinear ℝ ({q, q1, q2} : Set ℝ²) :=
          (Problem97.signedArea2_eq_zero_iff_collinear q q1 q2).1 hz
        exact False.elim <|
          (_root_.Batch3N9.Problem97.ConvexIndep.not_three_collinear S.hconv) hxA S.triangle.v1_mem S.triangle.v2_mem
            hq_ne_v1 hq_ne_v2 S.triangle.v12_ne hcol
      have hq3_img_pos : 0 < signedArea2 (T0 q3) (T0 q1) (T0 q2) := by
        rw [hv1, hv2, b3n9m051_signedArea2_baseChord_vec2]; linarith
      have himg_nonpos :
          signedArea2 (T0 q) (T0 q1) (T0 q2) *
            signedArea2 (T0 q3) (T0 q1) (T0 q2) ≤ 0 := by
        rw [tau0.halfplane_sign q q1 q2, tau0.halfplane_sign q3 q1 q2]
        have hrew :
            (tau0.orientation * (tau0.scale ^ 2) * signedArea2 q q1 q2) *
                (tau0.orientation * (tau0.scale ^ 2) * signedArea2 q3 q1 q2) =
              (tau0.orientation ^ 2) * (tau0.scale ^ 2 * tau0.scale ^ 2) *
                (signedArea2 q q1 q2 * signedArea2 q3 q1 q2) := by ring
        rw [hrew, tau0.orientation_sq]
        have hscale_nonneg : 0 ≤ tau0.scale ^ 2 * tau0.scale ^ 2 := by positivity
        simpa using mul_nonpos_of_nonneg_of_nonpos hscale_nonneg hq_arc
      have hq_img_lt : signedArea2 (T0 q) (T0 q1) (T0 q2) < 0 := by
        have hq_img_le : signedArea2 (T0 q) (T0 q1) (T0 q2) ≤ 0 := by
          by_contra hq_pos
          have : 0 < signedArea2 (T0 q) (T0 q1) (T0 q2) *
              signedArea2 (T0 q3) (T0 q1) (T0 q2) :=
            mul_pos (by linarith) hq3_img_pos
          linarith
        have hq_img_ne : signedArea2 (T0 q) (T0 q1) (T0 q2) ≠ 0 := by
          rw [tau0.halfplane_sign q q1 q2]
          have horient_ne : tau0.orientation ≠ 0 := by
            intro h0
            have : (0 : ℝ) ^ 2 = 1 := by simpa [h0] using tau0.orientation_sq
            norm_num at this
          exact mul_ne_zero
            (mul_ne_zero horient_ne (pow_ne_zero 2 (ne_of_gt tau0.scale_pos))) hq_base_ne
        exact lt_of_le_of_ne hq_img_le hq_img_ne
      rw [hv1, hv2, b3n9m051_signedArea2_baseChord_vec2] at hq_img_lt
      dsimp [T]
      simp only [b3n9m051_halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have : (T0 q) 1 / 2 < 0 := by linarith
      simpa using this
    have hq_ne_v2 : q ≠ q2 := by
      unfold Problem97.FiniteEndpointShell.I3 at hqI3
      exact (Finset.mem_erase.mp hqI3).1
    have hv3_ne_v2 : q3 ≠ q2 := by simpa [q2, q3] using S.triangle.v23_ne.symm
    set r : ℝ := dist (T q2) (T q) with hr_def
    have hd_q : 0 < dist q2 q := by
      rw [dist_pos]; exact fun h => hq_ne_v2 h.symm
    have hr_pos : 0 < r := by
      rw [hr_def, tau.dist_image]
      exact mul_pos tau.scale_pos hd_q
    have hBq_T : dist (T q2) (T q) = r := hr_def.symm
    have hBD_T : dist (T q2) (T q3) = r := by
      rw [hr_def, tau.dist_image, tau.dist_image]
      congr 1
      simpa [q2, q3] using hBq.symm
    have hDq_T : dist (T q3) (T q) = r := by
      rw [hr_def, tau.dist_image, tau.dist_image]
      congr 1
      calc dist q3 q = dist q2 q3 := by simpa [q2, q3] using hDq
        _ = dist q2 q := by simpa [q2, q3] using hBq.symm
    have hv2c0 : (T q2) 0 = 1 := by rw [hv2T]; simp [Problem97.CGN.vec2]
    have hv2c1 : (T q2) 1 = 0 := by rw [hv2T]; simp [Problem97.CGN.vec2]
    have hv1c0 : (T q1) 0 = 0 := by rw [hv1T]; simp [Problem97.CGN.vec2]
    have hv1c1 : (T q1) 1 = 0 := by rw [hv1T]; simp [Problem97.CGN.vec2]
    set dx : ℝ := (T q3) 0 - 1 with hdx_def
    set dy : ℝ := (T q3) 1 with hdy_def
    set a : ℝ := (T q) 0 - 1 with ha_def
    set b : ℝ := (T q) 1 with hb_def
    have hdy_pos : 0 < dy := by rw [hdy_def]; exact hq3y_T
    have hb_neg : b < 0 := by rw [hb_def]; exact hqy_T
    have hcircD : dx ^ 2 + dy ^ 2 = r ^ 2 := by
      have hsq := b3n9m051_dist_sq_eq_coord_sq_add_coord_sq (T q2) (T q3)
      rw [hBD_T, hv2c0, hv2c1] at hsq
      rw [hdx_def, hdy_def]; nlinarith only [hsq]
    have hcircQ : a ^ 2 + b ^ 2 = r ^ 2 := by
      have hsq := b3n9m051_dist_sq_eq_coord_sq_add_coord_sq (T q2) (T q)
      rw [hBq_T, hv2c0, hv2c1] at hsq
      rw [ha_def, hb_def]; nlinarith only [hsq]
    have hdot_raw : a * dx + b * dy = r ^ 2 / 2 := by
      have hsq := b3n9m051_dist_sq_eq_coord_sq_add_coord_sq (T q3) (T q)
      rw [hDq_T] at hsq
      rw [ha_def, hb_def, hdx_def, hdy_def]
      nlinarith only [hcircD, hcircQ, hsq]
    have hlong_T : (1 : ℝ) < 1 + 2 * dx + r ^ 2 := by
      have hAB_T : dist (T q1) (T q2) = r * 0 + 1 := by
        rw [hv1T, hv2T, dist_eq_norm]
        have hvec :
            Problem97.CGN.vec2 0 0 - Problem97.CGN.vec2 1 0 =
              Problem97.CGN.vec2 (-1) 0 := by
          ext i <;> fin_cases i <;>
            simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
        rw [hvec, EuclideanSpace.norm_eq]
        norm_num [Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have hAD :
          dist (T q1) (T q2) < dist (T q1) (T q3) := by
        rw [tau.dist_image, tau.dist_image]
        have hscale : 0 < tau.scale := tau.scale_pos
        have : dist q1 q2 < dist q1 q3 := by simpa [q1, q2, q3] using hlong
        nlinarith only [hlong, hscale, this, dist_nonneg (x := q1) (y := q2)]
      have hAB1 : dist (T q1) (T q2) = 1 := by rw [hAB_T]; ring
      have hAD_sq := b3n9m051_dist_sq_eq_coord_sq_add_coord_sq (T q1) (T q3)
      rw [hv1c0, hv1c1] at hAD_sq
      have hAD_sq' : dist (T q1) (T q3) ^ 2 = 1 + 2 * dx + r ^ 2 := by
        rw [hAD_sq]; nlinarith only [hcircD, hdx_def, hdy_def]
      have hAD' : (1 : ℝ) < dist (T q1) (T q3) := by rw [hAB1] at hAD; exact hAD
      nlinarith only [hcircD, hAB_T, hAD, hAD_sq, hAD', hAD_sq', dist_nonneg (x := T q1) (y := T q3)]
    have hr_lt_one : r < 1 := by
      have hBD : dist (T q2) (T q3) < dist (T q1) (T q2) := by
        rw [tau.dist_image, tau.dist_image]
        have hscale : 0 < tau.scale := tau.scale_pos
        have : dist q2 q3 < dist q1 q2 := by simpa [q1, q2, q3] using hsmall
        nlinarith only [hsmall, hscale, this, dist_nonneg (x := q1) (y := q2)]
      have hAB1 : dist (T q1) (T q2) = 1 := by
        rw [hv1T, hv2T, dist_eq_norm]
        have hvec :
            Problem97.CGN.vec2 0 0 - Problem97.CGN.vec2 1 0 =
              Problem97.CGN.vec2 (-1) 0 := by
          ext i <;> fin_cases i <;>
            simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
        rw [hvec, EuclideanSpace.norm_eq]
        norm_num [Problem97.CGN.vec2, EuclideanSpace.single_apply]
      rw [hBD_T, hAB1] at hBD; exact hBD
    have hadx_big : r ^ 2 / 2 < a * dx := by
      have hbdy_neg : b * dy < 0 := mul_neg_of_neg_of_pos hb_neg hdy_pos
      linarith [hdot_raw]
    have ha_le : a ≤ r := by nlinarith only [hcircQ, hr_pos, sq_nonneg b]
    have ha_ge : -r ≤ a := by nlinarith only [hcircQ, hqy_T, ha_le, sq_nonneg b, hr_pos]
    have hdx_lb : -(r ^ 2) / 2 < dx := by nlinarith only [hlong_T]
    have hdx_gt : r / 2 < dx := by
      have ha_pos : 0 < a := by
        by_contra hanot
        have ha0 : a ≤ 0 := le_of_not_gt hanot
        have hdx_neg : dx < 0 := by
          rcases lt_trichotomy dx 0 with h | h | h
          · exact h
          · exfalso; rw [h, mul_zero] at hadx_big; nlinarith only [hadx_big, hr_pos, mul_pos hr_pos hr_pos]
          · exfalso
            have : a * dx ≤ 0 := mul_nonpos_of_nonpos_of_nonneg ha0 (le_of_lt h)
            nlinarith only [hadx_big, this, mul_pos hr_pos hr_pos]
        have hbound : a * dx ≤ -r * dx := by nlinarith only [hdot_raw, hr_lt_one, ha_ge, hq3y_T, hqy_T, hlong_T, hanot, hdx_neg]
        have hdx_lt : dx < -(r / 2) := by
          have : r ^ 2 / 2 < -r * dx := lt_of_lt_of_le hadx_big hbound
          nlinarith only [hadx_big, hbound, hr_lt_one, hr_pos, hlong_T, this]
        nlinarith only [hadx_big, hbound, hr_lt_one, hr_pos, hlong_T, hdx_lt, hdx_lb, mul_pos hr_pos hr_pos]
      have hdx_pos : 0 < dx := by
        by_contra hdxnot
        have hdx0 : dx ≤ 0 := le_of_not_gt hdxnot
        have : a * dx ≤ 0 := mul_nonpos_of_nonneg_of_nonpos (le_of_lt ha_pos) hdx0
        nlinarith only [hlong_T, hadx_big, hdxnot, this, mul_pos hr_pos hr_pos]
      have hrdx : a * dx ≤ r * dx := by nlinarith only [hr_pos, hr_lt_one, ha_le, hdx_pos]
      nlinarith only [hr_pos, hadx_big, hrdx]
    have hcos_le : dx / r ≤ 1 := by
      rw [div_le_one hr_pos]
      nlinarith only [hcircD, hr_pos, hdy_pos, sq_nonneg (dx - r), mul_pos hr_pos hr_pos]
    have hcos_ge : -1 ≤ dx / r := by
      rw [le_div_iff₀ hr_pos]
      nlinarith only [hr_pos, hdx_gt, hcircD, hdy_pos, sq_nonneg (dx + r), mul_pos hr_pos hr_pos]
    set δ : ℝ := Real.arccos (dx / r) with hδ_def
    have hcosδ : Real.cos δ = dx / r := by
      rw [hδ_def, Real.cos_arccos hcos_ge hcos_le]
    have hsinδ : Real.sin δ = dy / r := by
      rw [hδ_def, Real.sin_arccos]
      have hsq : 1 - (dx / r) ^ 2 = (dy / r) ^ 2 := by
        field_simp
        nlinarith only [hcircD]
      rw [hsq, Real.sqrt_sq (by positivity)]
    have hδ_lo : 0 < δ := by
      rw [hδ_def]
      apply Real.arccos_pos.mpr
      rw [div_lt_one hr_pos]
      nlinarith only [hcircD, hr_pos, hq3y_T, hdx_gt, hdy_pos]
    have hδ_hi : δ < Real.pi / 3 := by
      have hcos_gt_half : (1 : ℝ) / 2 < Real.cos δ := by
        rw [hcosδ, lt_div_iff₀ hr_pos]; linarith [hdx_gt]
      have hcos_third : Real.cos (Real.pi / 3) = 1 / 2 := by
        rw [Real.cos_pi_div_three]
      by_contra hnot
      have hge : Real.pi / 3 ≤ δ := le_of_not_gt hnot
      have hδ_le_pi : δ ≤ Real.pi := by
        rw [hδ_def]; exact Real.arccos_le_pi _
      have hmono : Real.cos δ ≤ Real.cos (Real.pi / 3) := by
        apply Real.cos_le_cos_of_nonneg_of_le_pi
        · positivity
        · exact hδ_le_pi
        · exact hge
      rw [hcos_third] at hmono
      linarith [hcos_gt_half, hmono]
    have hdot : a * Real.cos δ + b * Real.sin δ = r / 2 := by
      rw [hcosδ, hsinδ]
      have heq : a * (dx / r) + b * (dy / r) = (a * dx + b * dy) / r := by ring
      rw [heq, hdot_raw]
      field_simp
    have hqT : T q = Problem97.CGN.vec2 (1 + a) b := by
      rw [ha_def, hb_def]
      ext i <;> fin_cases i <;>
        simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    refine ⟨r, T, tau, δ, a, b, hv1T, hv2T, hqT, hr_pos, hcircQ, hdot, hb_neg, hδ_lo, hδ_hi⟩
  by_cases hq3pos : 0 < (Tbase q3) 1
  · exact build_from tauBase hv1Base hv2Base hq3pos
  · let Tflip : ℝ² → ℝ² := fun x => b3n9m051_flipY (Tbase x)
    let tauFlip : Problem97.CGN.SimilarityTransportData Tflip :=
      b3n9m051_similarityTransportComp tauBase b3n9m051_flipYSimilarityTransportData
    have hv1Flip : Tflip q1 = Problem97.CGN.vec2 (-1) 0 := by
      dsimp [Tflip]; rw [hv1Base]
      ext i <;> fin_cases i <;>
        simp [b3n9m051_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hv2Flip : Tflip q2 = Problem97.CGN.vec2 1 0 := by
      dsimp [Tflip]; rw [hv2Base]
      ext i <;> fin_cases i <;>
        simp [b3n9m051_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hq3Flip : 0 < (Tflip q3) 1 := by
      dsimp [Tflip]
      simp only [b3n9m051_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have hq3neg : (Tbase q3) 1 < 0 := by
        have hle : (Tbase q3) 1 ≤ 0 := le_of_not_gt hq3pos
        exact lt_of_le_of_ne hle hq3_base_nonzero
      simpa using hq3neg
    exact build_from tauFlip hv1Flip hv2Flip hq3Flip
theorem pEqB_row_impossible_of_equilateral
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {q : ℝ²}
    (hqI3 : q ∈ S.I3)
    (hBq : dist S.triangle.v2 q = dist S.triangle.v2 S.triangle.v3)
    (hDq : dist S.triangle.v3 q = dist S.triangle.v2 S.triangle.v3)
    (hsmall : dist S.triangle.v2 S.triangle.v3 < dist S.triangle.v1 S.triangle.v2)
    (hlong : dist S.triangle.v1 S.triangle.v2 < dist S.triangle.v1 S.triangle.v3) :
    False := by
  obtain ⟨r, hconfig⟩ :=
    S.pEqB_lower_apex_config_of_equilateral hqI3 hBq hDq hsmall hlong
  exact S.pEqB_row_impossible_of_lower_witness hqI3 hconfig
theorem b3n9m051_qEqC_reflection_below_contradiction
    (r θ δ : ℝ) (hr : 0 < r)
    (hcosθ : Real.cos θ = -(r / 2)) (hsinθ : 0 < Real.sin θ)
    (hθ0 : 0 ≤ θ) (hθπ : θ ≤ Real.pi)
    (hcosδ : -(r / 2) < Real.cos δ) (hsinδ : 0 < Real.sin δ)
    (hδ0 : 0 ≤ δ) (hδπ : δ ≤ Real.pi)
    (hqbelow : Real.sin (2 * δ - θ) < 0)
    (hAq : Real.cos (2 * δ - θ) < -(r / 2)) : False := by
  have hδpos : 0 < δ := by
    rcases lt_or_eq_of_le hδ0 with h | h
    · exact h
    · exfalso; rw [← h, Real.sin_zero] at hsinδ; exact lt_irrefl _ hsinδ
  have hδ_lt_θ : δ < θ := by
    rcases lt_trichotomy δ θ with hlt | heq | hgt
    · exact hlt
    · exfalso; rw [heq, hcosθ] at hcosδ; exact lt_irrefl _ hcosδ
    · exfalso
      have hcc := Real.cos_lt_cos_of_nonneg_of_le_pi hθ0 hδπ hgt
      rw [hcosθ] at hcc
      linarith [hcc, hcosδ]
  set w : ℝ := 2 * δ - θ with hw_def
  have hw_lo : -Real.pi < w := by rw [hw_def]; linarith [hδpos, hθπ]
  have hw_hi : w < Real.pi := by rw [hw_def]; linarith [hδ_lt_θ, hθπ]
  have hw_neg : w < 0 := by
    by_contra hge
    push_neg at hge
    exact absurd (Real.sin_nonneg_of_nonneg_of_le_pi hge (le_of_lt hw_hi))
      (not_le.mpr hqbelow)
  have hneg_w_lo : 0 ≤ -w := by linarith [hw_neg]
  have hneg_w_lt : -w < θ := by rw [hw_def]; linarith [hδpos]
  have hcos_gt : Real.cos θ < Real.cos (-w) :=
    Real.cos_lt_cos_of_nonneg_of_le_pi hneg_w_lo hθπ hneg_w_lt
  rw [Real.cos_neg] at hcos_gt
  rw [hcosθ] at hcos_gt
  linarith [hAq, hcos_gt]
abbrev QEqCReflectionConfig
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (q : ℝ²) (r : ℝ) : Prop :=
  ∃ T : ℝ² → ℝ², ∃ _tau : Problem97.CGN.SimilarityTransportData T, ∃ θ δ : ℝ,
    T S.triangle.v1 = Problem97.CGN.vec2 0 0 ∧
    T S.triangle.v2 = Problem97.CGN.vec2 1 0 ∧
    0 < r ∧
    Real.cos θ = -(r / 2) ∧ 0 < Real.sin θ ∧ 0 ≤ θ ∧ θ ≤ Real.pi ∧
    -(r / 2) < Real.cos δ ∧ 0 < Real.sin δ ∧ 0 ≤ δ ∧ δ ≤ Real.pi ∧
    T q =
      Problem97.CGN.vec2
        (1 + r * Real.cos (2 * δ - θ)) (r * Real.sin (2 * δ - θ)) ∧
    Real.sin (2 * δ - θ) < 0
theorem qEqC_row_impossible_of_normalized_config
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {q : ℝ²} {r : ℝ}
    (hconfig : S.QEqCReflectionConfig q r)
    (hcap : dist S.triangle.v1 q < dist S.triangle.v1 S.triangle.v2) :
    False := by
  rcases hconfig with
    ⟨T, tau, θ, δ, hv1, hv2, hr, hcosθ, hsinθ, hθ0, hθπ,
      hcosδ, hsinδ, hδ0, hδπ, hqT, hqbelow⟩
  have hcapT : dist (T S.triangle.v1) (T q) < dist (T S.triangle.v1) (T S.triangle.v2) := by
    rw [tau.dist_image, tau.dist_image]
    have hscale : 0 < tau.scale := tau.scale_pos
    nlinarith only [hcap, hscale, dist_nonneg (x := S.triangle.v1) (y := q), dist_nonneg (x := S.triangle.v1) (y := S.triangle.v2)]
  have hAB1 : dist (T S.triangle.v1) (T S.triangle.v2) = 1 := by
    rw [hv1, hv2, dist_eq_norm]
    have hvec :
        Problem97.CGN.vec2 0 0 - Problem97.CGN.vec2 1 0 = Problem97.CGN.vec2 (-1) 0 := by
      ext i <;> fin_cases i <;>
        simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    rw [hvec, EuclideanSpace.norm_eq]
    norm_num [Problem97.CGN.vec2, EuclideanSpace.single_apply]
  have hAq_sq : dist (T S.triangle.v1) (T q) ^ 2
      = 1 + 2 * r * Real.cos (2 * δ - θ) + r ^ 2 := by
    rw [hv1, hqT, b3n9m051_dist_sq_eq_coord_sq_add_coord_sq]
    simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    nlinarith only [Real.sin_sq_add_cos_sq (2 * δ - θ)]
  have hAq : Real.cos (2 * δ - θ) < -(r / 2) := by
    rw [hAB1] at hcapT
    have hAq_nonneg : 0 ≤ dist (T S.triangle.v1) (T q) := dist_nonneg
    nlinarith only [hcapT, hAq_sq, hr, hAq_nonneg]
  exact b3n9m051_qEqC_reflection_below_contradiction r θ δ hr hcosθ hsinθ hθ0 hθπ
    hcosδ hsinδ hδ0 hδπ hqbelow hAq
theorem qEqC_row_impossible_of_lower_witness
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {q : ℝ²} {r : ℝ}
    (hqI3 : q ∈ S.I3)
    (hconfig : S.QEqCReflectionConfig q r) :
    False :=
  S.qEqC_row_impossible_of_normalized_config hconfig (S.b3n9m051_v1_lt_v1v2_of_mem_I3 hqI3)
theorem b3n9m051_qEqC_reflection_coords
    (r cθ sθ cδ sδ cη sη : ℝ) (hr : 0 < r)
    (hcθ : cθ = -(r / 2)) (hsθ : 0 < sθ) (hθpyth : cθ ^ 2 + sθ ^ 2 = 1)
    (hcδ : -(r / 2) < cδ) (hsδ : 0 < sδ) (hδpyth : cδ ^ 2 + sδ ^ 2 = 1)
    (hηpyth : cη ^ 2 + sη ^ 2 = 1) (hsη : sη < 0)
    (hradical : cη * cδ + sη * sδ = cθ * cδ + sθ * sδ)
    (hne : ¬ (cη = cθ ∧ sη = sθ)) :
    ∃ θ δ : ℝ,
      Real.cos θ = cθ ∧ Real.sin θ = sθ ∧ 0 ≤ θ ∧ θ ≤ Real.pi ∧
      Real.cos δ = cδ ∧ Real.sin δ = sδ ∧ 0 ≤ δ ∧ δ ≤ Real.pi ∧
      cη = Real.cos (2 * δ - θ) ∧ sη = Real.sin (2 * δ - θ) := by
  have hcθ_mem : -1 ≤ cθ ∧ cθ ≤ 1 := by
    constructor <;> nlinarith [hθpyth, sq_nonneg sθ, sq_nonneg cθ]
  have hcδ_mem : -1 ≤ cδ ∧ cδ ≤ 1 := by
    constructor <;> nlinarith [hδpyth, sq_nonneg sδ, sq_nonneg cδ]
  have hcη_mem : -1 ≤ cη ∧ cη ≤ 1 := by
    constructor <;> nlinarith only [hηpyth, hsη, sq_nonneg sη, sq_nonneg cη]
  set θ : ℝ := Real.arccos cθ with hθ_def
  set δ : ℝ := Real.arccos cδ with hδ_def
  set η : ℝ := -Real.arccos cη with hη_def
  have hcosθ : Real.cos θ = cθ := Real.cos_arccos hcθ_mem.1 hcθ_mem.2
  have hsinθ : Real.sin θ = sθ := by
    rw [hθ_def, Real.sin_arccos]
    have : Real.sqrt (1 - cθ ^ 2) = Real.sqrt (sθ ^ 2) := by congr 1; nlinarith only [hθpyth]
    rw [this, Real.sqrt_sq (le_of_lt hsθ)]
  have hcosδ : Real.cos δ = cδ := Real.cos_arccos hcδ_mem.1 hcδ_mem.2
  have hsinδ : Real.sin δ = sδ := by
    rw [hδ_def, Real.sin_arccos]
    have : Real.sqrt (1 - cδ ^ 2) = Real.sqrt (sδ ^ 2) := by congr 1; nlinarith only [hδpyth]
    rw [this, Real.sqrt_sq (le_of_lt hsδ)]
  have hcosη : Real.cos η = cη := by
    rw [hη_def, Real.cos_neg]; exact Real.cos_arccos hcη_mem.1 hcη_mem.2
  have hsinη : Real.sin η = sη := by
    rw [hη_def, Real.sin_neg, Real.sin_arccos]
    have hsqrt : Real.sqrt (1 - cη ^ 2) = Real.sqrt (sη ^ 2) := by congr 1; nlinarith only [hηpyth]
    rw [hsqrt, Real.sqrt_sq_eq_abs, abs_of_neg hsη]; ring
  have hcoseq : Real.cos (η - δ) = Real.cos (θ - δ) := by
    rw [Real.cos_sub, Real.cos_sub, hcosη, hsinη, hcosθ, hsinθ, hcosδ, hsinδ]
    linarith [hradical]
  have hcoords : ¬ (Real.cos η = Real.cos θ ∧ Real.sin η = Real.sin θ) := by
    rw [hcosη, hsinη, hcosθ, hsinθ]; exact hne
  have hrefl : Real.cos η = Real.cos (2 * δ - θ) ∧ Real.sin η = Real.sin (2 * δ - θ) := by
    rw [Real.cos_eq_cos_iff] at hcoseq
    obtain ⟨k, hk | hk⟩ := hcoseq
    · exfalso; apply hcoords
      have he : η = θ + ((-k : ℤ) : ℝ) * (2 * Real.pi) := by push_cast; linarith
      rw [he, Real.cos_add_int_mul_two_pi, Real.sin_add_int_mul_two_pi]; exact ⟨rfl, rfl⟩
    · have he : η = (2 * δ - θ) + ((k : ℤ) : ℝ) * (2 * Real.pi) := by linarith
      rw [he, Real.cos_add_int_mul_two_pi, Real.sin_add_int_mul_two_pi]; exact ⟨rfl, rfl⟩
  refine ⟨θ, δ, hcosθ, hsinθ, Real.arccos_nonneg cθ, Real.arccos_le_pi cθ,
    hcosδ, hsinδ, Real.arccos_nonneg cδ, Real.arccos_le_pi cδ, ?_, ?_⟩
  · rw [← hcosη, hrefl.1]
  · rw [← hsinη, hrefl.2]
set_option maxHeartbeats 8000000 in
theorem qEqC_reflection_config_of_shell
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {q C : ℝ²}
    (hqI3 : q ∈ S.I3)
    (hAC : dist S.triangle.v1 C = dist S.triangle.v1 S.triangle.v2)
    (hBD : dist S.triangle.v2 S.triangle.v3 = dist S.triangle.v2 C)
    (hBq : dist S.triangle.v2 q = dist S.triangle.v2 C)
    (hDq : dist S.triangle.v3 q = dist S.triangle.v3 C)
    (hlong : dist S.triangle.v1 S.triangle.v2 < dist S.triangle.v1 S.triangle.v3)
    (hCside :
      0 < signedArea2 C S.triangle.v1 S.triangle.v2 *
        signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2)
    (hqC : q ≠ C) :
    ∃ r : ℝ, S.QEqCReflectionConfig q r := by
  classical
  let q1 : ℝ² := S.triangle.v1
  let q2 : ℝ² := S.triangle.v2
  let q3 : ℝ² := S.triangle.v3
  have hq1ne : q1 ≠ q2 := by simpa [q1, q2] using S.triangle.v12_ne
  rcases b3n9m051_exists_base_transportData q1 q2 hq1ne with
    ⟨Tbase, tauBase, hv1Base, hv2Base⟩
  have horientBase_ne : tauBase.orientation ≠ 0 := by
    intro h0
    have : (0 : ℝ) ^ 2 = 1 := by simpa [h0] using tauBase.orientation_sq
    norm_num at this
  have hq3_base_nonzero : (Tbase q3) 1 ≠ 0 := by
    have hq3_sa_ne : signedArea2 q3 q1 q2 ≠ 0 := by
      have hv1O : ‖q1 - S.Packet.center‖ = S.Packet.radius := by
        simpa [q1] using S.Packet.moser_on_boundary_1
      have hv2O : ‖q2 - S.Packet.center‖ = S.Packet.radius := by
        simpa [q2] using S.Packet.moser_on_boundary_2
      have hv3O : ‖q3 - S.Packet.center‖ = S.Packet.radius := by
        simpa [q3] using S.Packet.moser_on_boundary_3
      exact MEC.signedArea2_ne_zero_of_three_dist_eq
        hv3O hv1O hv2O
        S.triangle.v13_ne.symm S.triangle.v12_ne S.triangle.v23_ne.symm
    have himg_ne : signedArea2 (Tbase q3) (Tbase q1) (Tbase q2) ≠ 0 := by
      rw [tauBase.halfplane_sign q3 q1 q2]
      exact mul_ne_zero
        (mul_ne_zero horientBase_ne (pow_ne_zero 2 (ne_of_gt tauBase.scale_pos)))
        hq3_sa_ne
    intro h0
    apply himg_ne
    rw [hv1Base, hv2Base, b3n9m051_signedArea2_baseChord_vec2]
    linarith
  have build_from :
      ∀ {T0 : ℝ² → ℝ²},
        (tau0 : Problem97.CGN.SimilarityTransportData T0) →
        T0 q1 = Problem97.CGN.vec2 (-1) 0 →
        T0 q2 = Problem97.CGN.vec2 1 0 →
        0 < (T0 q3) 1 →
        ∃ r : ℝ, S.QEqCReflectionConfig q r := by
    intro T0 tau0 hv1 hv2 hq3y_pos
    let T : ℝ² → ℝ² := fun x => b3n9m051_halfShift (T0 x)
    let tau : Problem97.CGN.SimilarityTransportData T :=
      b3n9m051_similarityTransportComp tau0 b3n9m051_halfShiftSimilarityTransportData
    have hv1T : T q1 = Problem97.CGN.vec2 0 0 := by
      dsimp [T]; rw [hv1]
      ext i <;> fin_cases i <;>
        simp [b3n9m051_halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hv2T : T q2 = Problem97.CGN.vec2 1 0 := by
      dsimp [T]; rw [hv2]
      ext i <;> fin_cases i <;>
        simp [b3n9m051_halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hq3y_T : 0 < (T q3) 1 := by
      dsimp [T]
      simp only [b3n9m051_halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have : (0 : ℝ) < (T0 q3) 1 / 2 := by linarith
      simpa using this
    have hv2c0 : (T q2) 0 = 1 := by rw [hv2T]; simp [Problem97.CGN.vec2]
    have hv2c1 : (T q2) 1 = 0 := by rw [hv2T]; simp [Problem97.CGN.vec2]
    have hv1c0 : (T q1) 0 = 0 := by rw [hv1T]; simp [Problem97.CGN.vec2]
    have hv1c1 : (T q1) 1 = 0 := by rw [hv1T]; simp [Problem97.CGN.vec2]
    have hxA : q ∈ A := S.CP.C3_subset (by
      unfold Problem97.FiniteEndpointShell.I3 at hqI3
      exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hqI3))
    have hqC3 : q ∈ S.CP.C3 := by
      unfold Problem97.FiniteEndpointShell.I3 at hqI3
      exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hqI3)
    have hq_ne_v1 : q ≠ q1 := by
      unfold Problem97.FiniteEndpointShell.I3 at hqI3
      exact (Finset.mem_erase.mp (Finset.mem_erase.mp hqI3).2).1
    have hq_ne_v2 : q ≠ q2 := by
      unfold Problem97.FiniteEndpointShell.I3 at hqI3
      exact (Finset.mem_erase.mp hqI3).1
    have hq3_base_ne : signedArea2 q3 q1 q2 ≠ 0 := by
      have hv1O : dist q3 S.Packet.center = S.Packet.radius := by
        simpa [q3, dist_eq_norm] using S.Packet.moser_on_boundary_3
      have hv2O : dist q1 S.Packet.center = S.Packet.radius := by
        simpa [q1, dist_eq_norm] using S.Packet.moser_on_boundary_1
      have hv3O : dist q2 S.Packet.center = S.Packet.radius := by
        simpa [q2, dist_eq_norm] using S.Packet.moser_on_boundary_2
      exact MEC.signedArea2_ne_zero_of_three_dist_eq
        hv1O hv2O hv3O
        S.triangle.v13_ne.symm S.triangle.v12_ne S.triangle.v23_ne.symm
    have hq_arc : signedArea2 q q1 q2 * signedArea2 q3 q1 q2 ≤ 0 :=
      (S.CP.arc_membership q hxA).2.2.1 hqC3
    have hq_base_ne : signedArea2 q q1 q2 ≠ 0 := by
      intro hz
      have hcol : Collinear ℝ ({q, q1, q2} : Set ℝ²) :=
        (Problem97.signedArea2_eq_zero_iff_collinear q q1 q2).1 hz
      exact False.elim <|
        (_root_.Batch3N9.Problem97.ConvexIndep.not_three_collinear S.hconv) hxA S.triangle.v1_mem S.triangle.v2_mem
          hq_ne_v1 hq_ne_v2 S.triangle.v12_ne hcol
    have hq3_img_pos : 0 < signedArea2 (T0 q3) (T0 q1) (T0 q2) := by
      rw [hv1, hv2, b3n9m051_signedArea2_baseChord_vec2]; linarith
    have hqy_T : (T q) 1 < 0 := by
      have himg_nonpos :
          signedArea2 (T0 q) (T0 q1) (T0 q2) * signedArea2 (T0 q3) (T0 q1) (T0 q2) ≤ 0 := by
        rw [tau0.halfplane_sign q q1 q2, tau0.halfplane_sign q3 q1 q2]
        have hrew :
            (tau0.orientation * (tau0.scale ^ 2) * signedArea2 q q1 q2) *
                (tau0.orientation * (tau0.scale ^ 2) * signedArea2 q3 q1 q2) =
              (tau0.orientation ^ 2) * (tau0.scale ^ 2 * tau0.scale ^ 2) *
                (signedArea2 q q1 q2 * signedArea2 q3 q1 q2) := by ring
        rw [hrew, tau0.orientation_sq]
        have hscale_nonneg : 0 ≤ tau0.scale ^ 2 * tau0.scale ^ 2 := by positivity
        simpa using mul_nonpos_of_nonneg_of_nonpos hscale_nonneg hq_arc
      have hq_img_lt : signedArea2 (T0 q) (T0 q1) (T0 q2) < 0 := by
        have hq_img_le : signedArea2 (T0 q) (T0 q1) (T0 q2) ≤ 0 := by
          by_contra hq_pos
          have : 0 < signedArea2 (T0 q) (T0 q1) (T0 q2) *
              signedArea2 (T0 q3) (T0 q1) (T0 q2) := mul_pos (by linarith) hq3_img_pos
          linarith
        have hq_img_ne : signedArea2 (T0 q) (T0 q1) (T0 q2) ≠ 0 := by
          rw [tau0.halfplane_sign q q1 q2]
          have horient_ne : tau0.orientation ≠ 0 := by
            intro h0
            have : (0 : ℝ) ^ 2 = 1 := by simpa [h0] using tau0.orientation_sq
            norm_num at this
          exact mul_ne_zero
            (mul_ne_zero horient_ne (pow_ne_zero 2 (ne_of_gt tau0.scale_pos))) hq_base_ne
        exact lt_of_le_of_ne hq_img_le hq_img_ne
      rw [hv1, hv2, b3n9m051_signedArea2_baseChord_vec2] at hq_img_lt
      dsimp [T]
      simp only [b3n9m051_halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have : (T0 q) 1 / 2 < 0 := by linarith
      simpa using this
    have hC_base_ne : signedArea2 C q1 q2 ≠ 0 := by
      intro hz; rw [hz, zero_mul] at hCside; exact lt_irrefl _ hCside
    have hCy_T : 0 < (T C) 1 := by
      have hC_img_prod :
          0 < signedArea2 (T0 C) (T0 q1) (T0 q2) * signedArea2 (T0 q3) (T0 q1) (T0 q2) := by
        rw [tau0.halfplane_sign C q1 q2, tau0.halfplane_sign q3 q1 q2]
        have hrew :
            (tau0.orientation * (tau0.scale ^ 2) * signedArea2 C q1 q2) *
                (tau0.orientation * (tau0.scale ^ 2) * signedArea2 q3 q1 q2) =
              (tau0.orientation ^ 2) * (tau0.scale ^ 2 * tau0.scale ^ 2) *
                (signedArea2 C q1 q2 * signedArea2 q3 q1 q2) := by ring
        rw [hrew, tau0.orientation_sq]
        have hscale_pos : 0 < tau0.scale ^ 2 * tau0.scale ^ 2 := by
          have := tau0.scale_pos; positivity
        have hprod : 0 < signedArea2 C q1 q2 * signedArea2 q3 q1 q2 := by
          simpa [q1, q2, q3] using hCside
        have : 0 < tau0.scale ^ 2 * tau0.scale ^ 2 *
            (signedArea2 C q1 q2 * signedArea2 q3 q1 q2) := mul_pos hscale_pos hprod
        linarith [this]
      have hC_img_pos : 0 < signedArea2 (T0 C) (T0 q1) (T0 q2) := by
        by_contra hle
        push_neg at hle
        have : signedArea2 (T0 C) (T0 q1) (T0 q2) *
            signedArea2 (T0 q3) (T0 q1) (T0 q2) ≤ 0 :=
          mul_nonpos_of_nonpos_of_nonneg hle (le_of_lt hq3_img_pos)
        linarith
      rw [hv1, hv2, b3n9m051_signedArea2_baseChord_vec2] at hC_img_pos
      dsimp [T]
      simp only [b3n9m051_halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have : (0 : ℝ) < (T0 C) 1 / 2 := by linarith
      simpa using this
    have hv3_ne_v2 : q3 ≠ q2 := by simpa [q2, q3] using S.triangle.v23_ne.symm
    set r : ℝ := dist (T q2) (T C) with hr_def
    have hC_ne_v2 : C ≠ q2 := by
      intro h; rw [h] at hC_base_ne
      exact hC_base_ne (by
        have : signedArea2 q2 q1 q2 = 0 := by
          simp [signedArea2]
        simpa [q1, q2] using this)
    have hd_C : 0 < dist q2 C := by rw [dist_pos]; exact fun h => hC_ne_v2 h.symm
    have hr_pos : 0 < r := by
      rw [hr_def, tau.dist_image]; exact mul_pos tau.scale_pos hd_C
    have hBC_T : dist (T q2) (T C) = r := hr_def.symm
    have hBq_T : dist (T q2) (T q) = r := by
      rw [hr_def, tau.dist_image, tau.dist_image]
      have : dist q2 q = dist q2 C := by simpa [q2] using hBq
      rw [this]
    have hBD_T : dist (T q2) (T q3) = r := by
      rw [hr_def, tau.dist_image, tau.dist_image]
      have : dist q2 q3 = dist q2 C := by simpa [q2, q3] using hBD
      rw [this]
    have hDq_T : dist (T q3) (T q) = dist (T q3) (T C) := by
      rw [tau.dist_image, tau.dist_image]
      have : dist q3 q = dist q3 C := by simpa [q3] using hDq
      rw [this]
    set cθ : ℝ := ((T C) 0 - 1) / r with hcθ_def
    set sθ : ℝ := (T C) 1 / r with hsθ_def
    set cδ : ℝ := ((T q3) 0 - 1) / r with hcδ_def
    set sδ : ℝ := (T q3) 1 / r with hsδ_def
    set cη : ℝ := ((T q) 0 - 1) / r with hcη_def
    set sη : ℝ := (T q) 1 / r with hsη_def
    have hθpyth : cθ ^ 2 + sθ ^ 2 = 1 := by
      have hsq := b3n9m051_dist_sq_eq_coord_sq_add_coord_sq (T q2) (T C)
      rw [hBC_T, hv2c0, hv2c1] at hsq
      rw [hcθ_def, hsθ_def]; field_simp; nlinarith only [hsq]
    have hδpyth : cδ ^ 2 + sδ ^ 2 = 1 := by
      have hsq := b3n9m051_dist_sq_eq_coord_sq_add_coord_sq (T q2) (T q3)
      rw [hBD_T, hv2c0, hv2c1] at hsq
      rw [hcδ_def, hsδ_def]; field_simp; nlinarith only [hsq]
    have hηpyth : cη ^ 2 + sη ^ 2 = 1 := by
      have hsq := b3n9m051_dist_sq_eq_coord_sq_add_coord_sq (T q2) (T q)
      rw [hBq_T, hv2c0, hv2c1] at hsq
      rw [hcη_def, hsη_def]; field_simp; nlinarith only [hsq]
    have hsθ_pos : 0 < sθ := by rw [hsθ_def]; positivity
    have hsδ_pos : 0 < sδ := by rw [hsδ_def]; positivity
    have hsη_neg : sη < 0 := by
      rw [hsη_def]; exact div_neg_of_neg_of_pos hqy_T hr_pos
    have hAB1 : dist (T q1) (T q2) = 1 := by
      rw [hv1T, hv2T, dist_eq_norm]
      have hvec :
          Problem97.CGN.vec2 0 0 - Problem97.CGN.vec2 1 0 = Problem97.CGN.vec2 (-1) 0 := by
        ext i <;> fin_cases i <;>
          simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
      rw [hvec, EuclideanSpace.norm_eq]
      norm_num [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hAC_T : dist (T q1) (T C) = 1 := by
      rw [tau.dist_image]
      have : dist (T q1) (T q2) = tau.scale * dist q1 q2 := tau.dist_image q1 q2
      rw [hAB1] at this
      have hAC' : dist q1 C = dist q1 q2 := by simpa [q1, q2] using hAC
      rw [hAC']; linarith [this]
    have hcθ_eq : cθ = -(r / 2) := by
      have hACsq : (T C) 0 ^ 2 + (T C) 1 ^ 2 = 1 := by
        have h := b3n9m051_dist_sq_eq_coord_sq_add_coord_sq (T q1) (T C)
        rw [hAC_T, hv1c0, hv1c1] at h
        nlinarith only [h]
      have hcirc : ((T C) 0 - 1) ^ 2 + (T C) 1 ^ 2 = r ^ 2 := by
        have h := hθpyth
        rw [hcθ_def, hsθ_def] at h
        field_simp at h
        nlinarith only [h]
      have hTC0 : (T C) 0 = 1 - r ^ 2 / 2 := by nlinarith only [hACsq, hcirc]
      rw [hcθ_def, hTC0]; field_simp; ring
    have hcδ_gt : -(r / 2) < cδ := by
      have hAD : 1 < dist (T q1) (T q3) := by
        rw [tau.dist_image]
        have hsc : dist (T q1) (T q2) = tau.scale * dist q1 q2 := tau.dist_image q1 q2
        rw [hAB1] at hsc
        have hlong' : dist q1 q2 < dist q1 q3 := by simpa [q1, q2, q3] using hlong
        nlinarith only [hsc, hlong, hlong', tau.scale_pos, dist_nonneg (x := q1) (y := q2)]
      have hADsq : 1 < (T q3) 0 ^ 2 + (T q3) 1 ^ 2 := by
        have h := b3n9m051_dist_sq_eq_coord_sq_add_coord_sq (T q1) (T q3)
        rw [hv1c0, hv1c1] at h
        nlinarith only [hAD, h, dist_nonneg (x := T q1) (y := T q3)]
      have hBDsq : ((T q3) 0 - 1) ^ 2 + (T q3) 1 ^ 2 = r ^ 2 := by
        have h := hδpyth
        rw [hcδ_def, hsδ_def] at h
        field_simp at h
        nlinarith only [h]
      rw [hcδ_def, lt_div_iff₀ hr_pos]
      nlinarith only [hADsq, hBDsq]
    have hrne : r ≠ 0 := ne_of_gt hr_pos
    have hTC0 : (T C) 0 = 1 + r * cθ := by rw [hcθ_def]; field_simp; ring
    have hTC1 : (T C) 1 = r * sθ := by rw [hsθ_def]; field_simp
    have hTD0 : (T q3) 0 = 1 + r * cδ := by rw [hcδ_def]; field_simp; ring
    have hTD1 : (T q3) 1 = r * sδ := by rw [hsδ_def]; field_simp
    have hTq0 : (T q) 0 = 1 + r * cη := by rw [hcη_def]; field_simp; ring
    have hTq1 : (T q) 1 = r * sη := by rw [hsη_def]; field_simp
    have hradical : cη * cδ + sη * sδ = cθ * cδ + sθ * sδ := by
      have hsqeq : dist (T q3) (T q) ^ 2 = dist (T q3) (T C) ^ 2 := by rw [hDq_T]
      rw [b3n9m051_dist_sq_eq_coord_sq_add_coord_sq, b3n9m051_dist_sq_eq_coord_sq_add_coord_sq] at hsqeq
      rw [hTC0, hTC1, hTD0, hTD1, hTq0, hTq1] at hsqeq
      have hrne : r ≠ 0 := ne_of_gt hr_pos
      have hkey : (cη * cδ + sη * sδ) * r ^ 2 = (cθ * cδ + sθ * sδ) * r ^ 2 := by
        nlinarith only [hsqeq, hθpyth, hηpyth, hδpyth]
      have hr2pos : (0 : ℝ) < r ^ 2 := by positivity
      exact mul_right_cancel₀ (ne_of_gt hr2pos) hkey
    have hne : ¬ (cη = cθ ∧ sη = sθ) := by
      rintro ⟨hc, hs⟩
      apply hqC
      have h0 : (T q) 0 = (T C) 0 := by rw [hTq0, hTC0, hc]
      have h1 : (T q) 1 = (T C) 1 := by rw [hTq1, hTC1, hs]
      have hTqC : T q = T C := by
        ext i; fin_cases i
        · exact h0
        · exact h1
      have hd0 : dist (T q) (T C) = 0 := by rw [hTqC]; simp
      rw [tau.dist_image] at hd0
      have : dist q C = 0 := by
        rcases mul_eq_zero.mp hd0 with h | h
        · exact absurd h (ne_of_gt tau.scale_pos)
        · exact h
      exact dist_eq_zero.mp this
    obtain ⟨θ, δ, hcosθ, hsinθ, hθ0, hθπ, hcosδ, hsinδ, hδ0, hδπ, hcη_eq, hsη_eq⟩ :=
      b3n9m051_qEqC_reflection_coords r cθ sθ cδ sδ cη sη hr_pos hcθ_eq hsθ_pos hθpyth
        hcδ_gt hsδ_pos hδpyth hηpyth hsη_neg hradical hne
    have hcosθ' : Real.cos θ = -(r / 2) := by rw [hcosθ]; exact hcθ_eq
    have hsinθ' : 0 < Real.sin θ := by rw [hsinθ]; exact hsθ_pos
    have hcosδ' : -(r / 2) < Real.cos δ := by rw [hcosδ]; exact hcδ_gt
    have hsinδ' : 0 < Real.sin δ := by rw [hsinδ]; exact hsδ_pos
    have hqbelow' : Real.sin (2 * δ - θ) < 0 := by rw [← hsη_eq]; exact hsη_neg
    have hTq0' : (T q) 0 = 1 + r * Real.cos (2 * δ - θ) := by rw [hTq0, hcη_eq]
    have hTq1' : (T q) 1 = r * Real.sin (2 * δ - θ) := by rw [hTq1, hsη_eq]
    have hqcoord : T q =
        Problem97.CGN.vec2 (1 + r * Real.cos (2 * δ - θ)) (r * Real.sin (2 * δ - θ)) := by
      ext i; fin_cases i
      · change (T q) 0 = _
        rw [hTq0']; simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
      · change (T q) 1 = _
        rw [hTq1']; simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    exact ⟨r, T, tau, θ, δ, hv1T, hv2T, hr_pos,
      hcosθ', hsinθ', hθ0, hθπ, hcosδ', hsinδ', hδ0, hδπ, hqcoord, hqbelow'⟩
  by_cases hq3pos : 0 < (Tbase q3) 1
  · exact build_from tauBase hv1Base hv2Base hq3pos
  · let Tflip : ℝ² → ℝ² := fun x => b3n9m051_flipY (Tbase x)
    let tauFlip : Problem97.CGN.SimilarityTransportData Tflip :=
      b3n9m051_similarityTransportComp tauBase b3n9m051_flipYSimilarityTransportData
    have hv1Flip : Tflip q1 = Problem97.CGN.vec2 (-1) 0 := by
      dsimp [Tflip]; rw [hv1Base]
      ext i <;> fin_cases i <;>
        simp [b3n9m051_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hv2Flip : Tflip q2 = Problem97.CGN.vec2 1 0 := by
      dsimp [Tflip]; rw [hv2Base]
      ext i <;> fin_cases i <;>
        simp [b3n9m051_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hq3Flip : 0 < (Tflip q3) 1 := by
      dsimp [Tflip]
      simp only [b3n9m051_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have hq3neg : (Tbase q3) 1 < 0 := by
        have hle : (Tbase q3) 1 ≤ 0 := le_of_not_gt hq3pos
        exact lt_of_le_of_ne hle hq3_base_nonzero
      simpa using hq3neg
    exact build_from tauFlip hv1Flip hv2Flip hq3Flip
theorem qEqC_row_impossible_of_reflection
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {q C : ℝ²}
    (hqI3 : q ∈ S.I3)
    (hAC : dist S.triangle.v1 C = dist S.triangle.v1 S.triangle.v2)
    (hBD : dist S.triangle.v2 S.triangle.v3 = dist S.triangle.v2 C)
    (hBq : dist S.triangle.v2 q = dist S.triangle.v2 C)
    (hDq : dist S.triangle.v3 q = dist S.triangle.v3 C)
    (hlong : dist S.triangle.v1 S.triangle.v2 < dist S.triangle.v1 S.triangle.v3)
    (hCside :
      0 < signedArea2 C S.triangle.v1 S.triangle.v2 *
        signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2)
    (hqC : q ≠ C) :
    False := by
  obtain ⟨r, hconfig⟩ :=
    S.qEqC_reflection_config_of_shell hqI3 hAC hBD hBq hDq hlong hCside hqC
  exact S.qEqC_row_impossible_of_lower_witness hqI3 hconfig
theorem n4d_bA_2_q_eq_C_impossible
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s t : ℝ}
    (hB : S.IsFormB_v1 r)
    (hlower : FormBv1A2SelectorV2LowerPacket S Z r s)
    (hpacket3 : SelectorV3Qa2Packet S Z t) :
    False := by
  classical
  rcases hlower with ⟨hA2, ha2eq, hTcard, hI2sub, hC1eq, hC3eq⟩
  rcases hpacket3 with ⟨hI3sub, p, hp, hpeq, hqeqC2⟩
  let T := S.witnessClassAt_v2 s
  have hv3T : S.triangle.v3 ∈ T := by
    have hmem : S.triangle.v3 ∈ ({S.triangle.v3} : Finset ℝ²) := by simp
    rw [← hC1eq] at hmem
    exact (Finset.mem_inter.mp hmem).1
  have hq :
      (Z.a3 : ℝ²) ∈ T ∩ S.CP.C3 ∨ (Z.b3 : ℝ²) ∈ T ∩ S.CP.C3 := by
    rcases hC3eq with hqa3 | hqb3
    · left
      have hmem : Z.a3 ∈ ({Z.a3} : Finset ℝ²) := by simp
      rw [← hqa3] at hmem
      exact hmem
    · right
      have hmem : Z.b3 ∈ ({Z.b3} : Finset ℝ²) := by simp
      rw [← hqb3] at hmem
      exact hmem
  obtain ⟨q, hqI3, hqT2⟩ : ∃ q : ℝ², q ∈ S.I3 ∧ q ∈ T := by
    rcases hq with hqa3 | hqb3
    · refine ⟨Z.a3, ?_, ?_⟩
      · rw [Z.hI3]; simp
      · exact (Finset.mem_inter.mp hqa3).1
    · refine ⟨Z.b3, ?_, ?_⟩
      · rw [Z.hI3]; simp
      · exact (Finset.mem_inter.mp hqb3).1
  have hAC : dist S.triangle.v1 Z.a2 = dist S.triangle.v1 S.triangle.v2 := by
    have ha2T1 : Z.a2 ∈ S.witnessClassAt_v1 r := by
      have ha2mem : Z.a2 ∈ ({Z.a2} : Finset ℝ²) := by simp
      rw [← ha2eq] at ha2mem
      exact (Finset.mem_inter.mp ha2mem).1
    have hv2T1 : S.triangle.v2 ∈ S.witnessClassAt_v1 r := by
      rcases hB with ⟨x, hxI2, hxeq, hv2eq⟩
      have hv2mem : S.triangle.v2 ∈ ({S.triangle.v2} : Finset ℝ²) := by simp
      rw [← hv2eq] at hv2mem
      exact (Finset.mem_inter.mp hv2mem).1
    have ha2dist : dist S.triangle.v1 Z.a2 = r := by
      simpa using (Finset.mem_filter.mp ha2T1).2
    have hv2dist : dist S.triangle.v1 S.triangle.v2 = r := by
      simpa using (Finset.mem_filter.mp hv2T1).2
    rw [ha2dist, hv2dist]
  have ha2T2 : Z.a2 ∈ T := hI2sub hA2
  have hv3rad : dist S.triangle.v2 S.triangle.v3 = s := by
    simpa using (Finset.mem_filter.mp hv3T).2
  have ha2rad2 : dist S.triangle.v2 Z.a2 = s := by
    simpa using (Finset.mem_filter.mp ha2T2).2
  have hBD : dist S.triangle.v2 S.triangle.v3 = dist S.triangle.v2 Z.a2 := by
    rw [hv3rad, ha2rad2]
  have hqrad2 : dist S.triangle.v2 q = s := by
    simpa using (Finset.mem_filter.mp hqT2).2
  have hBq : dist S.triangle.v2 q = dist S.triangle.v2 Z.a2 := by
    rw [hqrad2, ha2rad2]
  have ha2T3 : Z.a2 ∈ S.witnessClassAt_v3 t := by
    have ha2mem : Z.a2 ∈ ({Z.a2} : Finset ℝ²) := by simp
    rw [← hqeqC2] at ha2mem
    exact (Finset.mem_inter.mp ha2mem).1
  have hqT3 : q ∈ S.witnessClassAt_v3 t := hI3sub hqI3
  have ha2rad3 : dist S.triangle.v3 Z.a2 = t := by
    simpa using (Finset.mem_filter.mp ha2T3).2
  have hqrad3 : dist S.triangle.v3 q = t := by
    simpa using (Finset.mem_filter.mp hqT3).2
  have hDq : dist S.triangle.v3 q = dist S.triangle.v3 Z.a2 := by
    rw [hqrad3, ha2rad3]
  have hlong : dist S.triangle.v1 S.triangle.v2 < dist S.triangle.v1 S.triangle.v3 := by
    have h := S.b3n9m051_v1_lt_v1v3_of_mem_I2 (p := Z.a2) hA2
    rwa [hAC] at h
  have hCside :
      0 < signedArea2 Z.a2 S.triangle.v1 S.triangle.v2 *
        signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 :=
    S.c2_vertex_same_open_side_as_v3 hA2
  have hqC : q ≠ Z.a2 := by
    intro hqa2
    have hlt := S.b3n9m051_v1_lt_v1v2_of_mem_I3 hqI3
    rw [hqa2, ← hAC] at hlt
    exact lt_irrefl _ hlt
  exact S.qEqC_row_impossible_of_reflection hqI3 hAC hBD hBq hDq hlong hCside hqC
theorem qEqE_row_impossible_of_reflection
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {q E : ℝ²}
    (hqI3 : q ∈ S.I3)
    (hAE : dist S.triangle.v1 E = dist S.triangle.v1 S.triangle.v2)
    (hBD : dist S.triangle.v2 S.triangle.v3 = dist S.triangle.v2 E)
    (hBq : dist S.triangle.v2 q = dist S.triangle.v2 E)
    (hDq : dist S.triangle.v3 q = dist S.triangle.v3 E)
    (hlong : dist S.triangle.v1 S.triangle.v2 < dist S.triangle.v1 S.triangle.v3)
    (hEside :
      0 < signedArea2 E S.triangle.v1 S.triangle.v2 *
        signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2)
    (hqE : q ≠ E) :
    False :=
  S.qEqC_row_impossible_of_reflection hqI3 hAE hBD hBq hDq hlong hEside hqE
theorem b3n9m051_qEqE_reflection_coords
    (r cε sε cδ sδ cη sη : ℝ)
    (hsε : 0 < sε) (hεpyth : cε ^ 2 + sε ^ 2 = 1)
    (hsδ : 0 < sδ) (hδpyth : cδ ^ 2 + sδ ^ 2 = 1)
    (hηpyth : cη ^ 2 + sη ^ 2 = 1) (hsη : sη < 0)
    (hradical : cη * cδ + sη * sδ = cε * cδ + sε * sδ)
    (hne : ¬ (cη = cε ∧ sη = sε)) :
    ∃ ε δ : ℝ,
      Real.cos ε = cε ∧ Real.sin ε = sε ∧ 0 ≤ ε ∧ ε ≤ Real.pi ∧
      Real.cos δ = cδ ∧ Real.sin δ = sδ ∧ 0 ≤ δ ∧ δ ≤ Real.pi ∧
      cη = Real.cos (2 * δ - ε) ∧ sη = Real.sin (2 * δ - ε) := by
  have hcε_mem : -1 ≤ cε ∧ cε ≤ 1 := by
    constructor <;> nlinarith only [hεpyth, hsε, sq_nonneg sε, sq_nonneg cε]
  have hcδ_mem : -1 ≤ cδ ∧ cδ ≤ 1 := by
    constructor <;> nlinarith only [hδpyth, hsδ, sq_nonneg sδ, sq_nonneg cδ]
  have hcη_mem : -1 ≤ cη ∧ cη ≤ 1 := by
    constructor <;> nlinarith only [hηpyth, hsη, sq_nonneg sη, sq_nonneg cη]
  set ε : ℝ := Real.arccos cε with hε_def
  set δ : ℝ := Real.arccos cδ with hδ_def
  set η : ℝ := -Real.arccos cη with hη_def
  have hcosε : Real.cos ε = cε := Real.cos_arccos hcε_mem.1 hcε_mem.2
  have hsinε : Real.sin ε = sε := by
    rw [hε_def, Real.sin_arccos]
    have : Real.sqrt (1 - cε ^ 2) = Real.sqrt (sε ^ 2) := by congr 1; nlinarith only [hεpyth]
    rw [this, Real.sqrt_sq (le_of_lt hsε)]
  have hcosδ : Real.cos δ = cδ := Real.cos_arccos hcδ_mem.1 hcδ_mem.2
  have hsinδ : Real.sin δ = sδ := by
    rw [hδ_def, Real.sin_arccos]
    have : Real.sqrt (1 - cδ ^ 2) = Real.sqrt (sδ ^ 2) := by congr 1; nlinarith only [hδpyth]
    rw [this, Real.sqrt_sq (le_of_lt hsδ)]
  have hcosη : Real.cos η = cη := by
    rw [hη_def, Real.cos_neg]; exact Real.cos_arccos hcη_mem.1 hcη_mem.2
  have hsinη : Real.sin η = sη := by
    rw [hη_def, Real.sin_neg, Real.sin_arccos]
    have hsqrt : Real.sqrt (1 - cη ^ 2) = Real.sqrt (sη ^ 2) := by congr 1; nlinarith only [hηpyth]
    rw [hsqrt, Real.sqrt_sq_eq_abs, abs_of_neg hsη]; ring
  have hcoseq : Real.cos (η - δ) = Real.cos (ε - δ) := by
    rw [Real.cos_sub, Real.cos_sub, hcosη, hsinη, hcosε, hsinε, hcosδ, hsinδ]
    linarith [hradical]
  have hcoords : ¬ (Real.cos η = Real.cos ε ∧ Real.sin η = Real.sin ε) := by
    rw [hcosη, hsinη, hcosε, hsinε]; exact hne
  have hrefl : Real.cos η = Real.cos (2 * δ - ε) ∧ Real.sin η = Real.sin (2 * δ - ε) := by
    rw [Real.cos_eq_cos_iff] at hcoseq
    obtain ⟨k, hk | hk⟩ := hcoseq
    · exfalso; apply hcoords
      have he : η = ε + ((-k : ℤ) : ℝ) * (2 * Real.pi) := by push_cast; linarith
      rw [he, Real.cos_add_int_mul_two_pi, Real.sin_add_int_mul_two_pi]; exact ⟨rfl, rfl⟩
    · have he : η = (2 * δ - ε) + ((k : ℤ) : ℝ) * (2 * Real.pi) := by linarith
      rw [he, Real.cos_add_int_mul_two_pi, Real.sin_add_int_mul_two_pi]; exact ⟨rfl, rfl⟩
  refine ⟨ε, δ, hcosε, hsinε, Real.arccos_nonneg cε, Real.arccos_le_pi cε,
    hcosδ, hsinδ, Real.arccos_nonneg cδ, Real.arccos_le_pi cδ, ?_, ?_⟩
  · rw [← hcosη, hrefl.1]
  · rw [← hsinη, hrefl.2]
theorem b3n9m051_qEqE_param_t (r S cd sd Sx Sy : ℝ) (hr : 0 < r) (hS : 0 < S)
    (hcirc : (Sx - (1 + r * cd)) ^ 2 + (Sy - r * sd) ^ 2 = (r * S) ^ 2) :
    ∃ t : ℝ, Sx = 1 + r * cd + r * S * Real.cos t ∧ Sy = r * sd + r * S * Real.sin t := by
  set ct := (Sx - (1 + r * cd)) / (r * S) with hct
  set st := (Sy - r * sd) / (r * S) with hst
  have hrS : 0 < r * S := mul_pos hr hS
  have hrSne : r * S ≠ 0 := ne_of_gt hrS
  have hpyth : ct ^ 2 + st ^ 2 = 1 := by rw [hct, hst]; field_simp; nlinarith only [hcirc]
  have hcx : r * S * ct = Sx - (1 + r * cd) := by rw [hct]; field_simp
  have hsy : r * S * st = Sy - r * sd := by rw [hst]; field_simp
  by_cases hsnn : 0 ≤ st
  · refine ⟨Real.arccos ct, ?_, ?_⟩
    · rw [Real.cos_arccos (by nlinarith only [hpyth, sq_nonneg st]) (by nlinarith only [hpyth, sq_nonneg st])]
      linarith [hcx]
    · rw [Real.sin_arccos]
      have : Real.sqrt (1 - ct ^ 2) = Real.sqrt (st ^ 2) := by congr 1; nlinarith only [hpyth]
      rw [this, Real.sqrt_sq hsnn]; linarith [hsy]
  · push_neg at hsnn
    refine ⟨-Real.arccos ct, ?_, ?_⟩
    · rw [Real.cos_neg, Real.cos_arccos (by nlinarith only [hpyth, sq_nonneg st]) (by nlinarith only [hpyth, sq_nonneg st])]
      linarith [hcx]
    · rw [Real.sin_neg, Real.sin_arccos]
      have : Real.sqrt (1 - ct ^ 2) = Real.sqrt (st ^ 2) := by congr 1; nlinarith only [hpyth]
      rw [this, Real.sqrt_sq_eq_abs, abs_of_neg hsnn]
      have hneg : r * S * (-st) = -(Sy - r * sd) := by rw [← hsy]; ring
      linarith [hneg]
set_option maxHeartbeats 800000 in
lemma b3n9m051_sign_pin_lower_bound (r x0 x1 : ℝ) (hr : 0 < r)
    (hpyth : ((x0 - 1) / r) ^ 2 + (x1 / r) ^ 2 = 1)
    (hbig : 1 < x0 ^ 2 + x1 ^ 2) :
    -(r / 2) < (x0 - 1) / r := by
  have hcirc : (x0 - 1) ^ 2 + x1 ^ 2 = r ^ 2 := by
    field_simp at hpyth; nlinarith only [hpyth]
  rw [lt_div_iff₀ hr]
  nlinarith only [hbig, hcirc, sq_nonneg x1]
set_option maxHeartbeats 800000 in
lemma b3n9m051_sign_pin_upper_bound (r x0 x1 : ℝ) (hr : 0 < r)
    (hpyth : ((x0 - 1) / r) ^ 2 + (x1 / r) ^ 2 = 1)
    (hsmall : x0 ^ 2 + x1 ^ 2 < 1) :
    (x0 - 1) / r < -(r / 2) := by
  have hcirc : (x0 - 1) ^ 2 + x1 ^ 2 = r ^ 2 := by
    field_simp at hpyth; nlinarith only [hpyth]
  rw [div_lt_iff₀ hr]
  nlinarith only [hsmall, hcirc, sq_nonneg x1]
set_option maxHeartbeats 800000 in
lemma b3n9m051_chord_sq_formula (r : ℝ) (hr : 0 < r) (δ ε : ℝ) :
    (2 - 2 * Real.cos (δ - ε)) =
        ((1 + r * Real.cos δ - (1 + r * Real.cos ε)) ^ 2
          + (r * Real.sin δ - r * Real.sin ε) ^ 2) / r ^ 2 := by
  rw [Real.cos_sub]
  have hpd : Real.sin δ ^ 2 + Real.cos δ ^ 2 = 1 := Real.sin_sq_add_cos_sq δ
  have hpe : Real.sin ε ^ 2 + Real.cos ε ^ 2 = 1 := Real.sin_sq_add_cos_sq ε
  field_simp
  nlinarith only [hpd, hpe]
set_option maxHeartbeats 400000 in
lemma b3n9m051_circle_pyth (p q2 : ℝ²) (r : ℝ) (hrne : r ≠ 0)
    (hq20 : q2 0 = 1) (hq21 : q2 1 = 0)
    (hdist : dist q2 p = r) :
    ((p 0 - 1) / r) ^ 2 + (p 1 / r) ^ 2 = 1 := by
  have hsq := b3n9m051_dist_sq_eq_coord_sq_add_coord_sq q2 p
  rw [hq20, hq21, hdist] at hsq
  field_simp
  nlinarith only [hsq]
set_option maxHeartbeats 400000 in
lemma b3n9m051_normsq_lt_of_origin_dist_lt (p q1 : ℝ²)
    (hq10 : q1 0 = 0) (hq11 : q1 1 = 0)
    (h : dist q1 p < 1) :
    p 0 ^ 2 + p 1 ^ 2 < 1 := by
  have hh := b3n9m051_dist_sq_eq_coord_sq_add_coord_sq q1 p
  rw [hq10, hq11] at hh; simp only [zero_sub, neg_sq] at hh
  nlinarith only [h, hh, dist_nonneg (x := q1) (y := p)]
set_option maxHeartbeats 400000 in
lemma b3n9m051_normsq_gt_of_origin_dist_gt (p q1 : ℝ²)
    (hq10 : q1 0 = 0) (hq11 : q1 1 = 0)
    (h : 1 < dist q1 p) :
    1 < p 0 ^ 2 + p 1 ^ 2 := by
  have hh := b3n9m051_dist_sq_eq_coord_sq_add_coord_sq q1 p
  rw [hq10, hq11] at hh; simp only [zero_sub, neg_sq] at hh
  nlinarith only [h, hh, dist_nonneg (x := q1) (y := p)]
set_option maxHeartbeats 400000 in
lemma b3n9m051_dist_eq_r_sqrt_of_sq (distDq r : ℝ) (hr : 0 < r) (δ ε : ℝ)
    (hgeq : 0 ≤ distDq)
    (heqsq : distDq ^ 2 = r ^ 2 * (2 - 2 * Real.cos (δ - ε))) :
    distDq = r * Real.sqrt (2 - 2 * Real.cos (δ - ε)) := by
  have hnn : 0 ≤ 2 - 2 * Real.cos (δ - ε) := by nlinarith only [Real.cos_le_one (δ - ε)]
  have hrS_nn : 0 ≤ r * Real.sqrt (2 - 2 * Real.cos (δ - ε)) :=
    mul_nonneg (le_of_lt hr) (Real.sqrt_nonneg _)
  have heqsq2 : distDq ^ 2 = (r * Real.sqrt (2 - 2 * Real.cos (δ - ε))) ^ 2 := by
    rw [heqsq, mul_pow, Real.sq_sqrt hnn]
  nlinarith only [heqsq2, hgeq, hrS_nn, sq_nonneg (distDq - r * Real.sqrt (2 - 2 * Real.cos (δ - ε)))]
set_option maxHeartbeats 8000000 in
theorem qEqE_lowerArc_sameSign_of_shell
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {q qs E : ℝ²}
    (hqI3 : q ∈ S.I3) (hqsI3 : qs ∈ S.I3)
    (hDqs : dist S.triangle.v3 qs = dist S.triangle.v3 q)
    (hBq : dist S.triangle.v2 q = dist S.triangle.v2 S.triangle.v3)
    (hBE : dist S.triangle.v2 E = dist S.triangle.v2 S.triangle.v3)
    (hDE : dist S.triangle.v3 E = dist S.triangle.v3 q)
    (hsmall : dist S.triangle.v2 S.triangle.v3 < dist S.triangle.v1 S.triangle.v2)
    (hlong : dist S.triangle.v1 S.triangle.v2 < dist S.triangle.v1 S.triangle.v3)
    (hAElt : dist S.triangle.v1 E < dist S.triangle.v1 S.triangle.v2)
    (hEside :
      0 < signedArea2 E S.triangle.v1 S.triangle.v2 *
        signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2)
    (hqE : q ≠ E) :
    0 ≤ (dist S.triangle.v2 qs ^ 2 - dist S.triangle.v2 q ^ 2)
        * (dist S.triangle.v1 qs ^ 2 - dist S.triangle.v1 q ^ 2) := by
  classical
  let q1 : ℝ² := S.triangle.v1
  let q2 : ℝ² := S.triangle.v2
  let q3 : ℝ² := S.triangle.v3
  have hq1ne : q1 ≠ q2 := by simpa [q1, q2] using S.triangle.v12_ne
  rcases b3n9m051_exists_base_transportData q1 q2 hq1ne with
    ⟨Tbase, tauBase, hv1Base, hv2Base⟩
  have horientBase_ne : tauBase.orientation ≠ 0 := by
    intro h0
    have : (0 : ℝ) ^ 2 = 1 := by simpa [h0] using tauBase.orientation_sq
    norm_num at this
  have hq3_base_nonzero : (Tbase q3) 1 ≠ 0 := by
    have hq3_sa_ne : signedArea2 q3 q1 q2 ≠ 0 := by
      have hv1O : ‖q1 - S.Packet.center‖ = S.Packet.radius := by
        simpa [q1] using S.Packet.moser_on_boundary_1
      have hv2O : ‖q2 - S.Packet.center‖ = S.Packet.radius := by
        simpa [q2] using S.Packet.moser_on_boundary_2
      have hv3O : ‖q3 - S.Packet.center‖ = S.Packet.radius := by
        simpa [q3] using S.Packet.moser_on_boundary_3
      exact MEC.signedArea2_ne_zero_of_three_dist_eq
        hv3O hv1O hv2O
        S.triangle.v13_ne.symm S.triangle.v12_ne S.triangle.v23_ne.symm
    have himg_ne : signedArea2 (Tbase q3) (Tbase q1) (Tbase q2) ≠ 0 := by
      rw [tauBase.halfplane_sign q3 q1 q2]
      exact mul_ne_zero
        (mul_ne_zero horientBase_ne (pow_ne_zero 2 (ne_of_gt tauBase.scale_pos)))
        hq3_sa_ne
    intro h0
    apply himg_ne
    rw [hv1Base, hv2Base, b3n9m051_signedArea2_baseChord_vec2]
    linarith
  have build_from :
      ∀ {T0 : ℝ² → ℝ²},
        (tau0 : Problem97.CGN.SimilarityTransportData T0) →
        T0 q1 = Problem97.CGN.vec2 (-1) 0 →
        T0 q2 = Problem97.CGN.vec2 1 0 →
        0 < (T0 q3) 1 →
        0 ≤ (dist S.triangle.v2 qs ^ 2 - dist S.triangle.v2 q ^ 2)
            * (dist S.triangle.v1 qs ^ 2 - dist S.triangle.v1 q ^ 2) := by
    intro T0 tau0 hv1 hv2 hq3y_pos
    let T : ℝ² → ℝ² := fun x => b3n9m051_halfShift (T0 x)
    let tau : Problem97.CGN.SimilarityTransportData T :=
      b3n9m051_similarityTransportComp tau0 b3n9m051_halfShiftSimilarityTransportData
    have hv1T : T q1 = Problem97.CGN.vec2 0 0 := by
      dsimp [T]; rw [hv1]
      ext i <;> fin_cases i <;>
        simp [b3n9m051_halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hv2T : T q2 = Problem97.CGN.vec2 1 0 := by
      dsimp [T]; rw [hv2]
      ext i <;> fin_cases i <;>
        simp [b3n9m051_halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hq3y_T : 0 < (T q3) 1 := by
      dsimp [T]
      simp only [b3n9m051_halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have : (0 : ℝ) < (T0 q3) 1 / 2 := by linarith
      simpa using this
    have hv2c0 : (T q2) 0 = 1 := by rw [hv2T]; simp [Problem97.CGN.vec2]
    have hv2c1 : (T q2) 1 = 0 := by rw [hv2T]; simp [Problem97.CGN.vec2]
    have hv1c0 : (T q1) 0 = 0 := by rw [hv1T]; simp [Problem97.CGN.vec2]
    have hv1c1 : (T q1) 1 = 0 := by rw [hv1T]; simp [Problem97.CGN.vec2]
    have hxAq : q ∈ A := S.CP.C3_subset (by
      unfold Problem97.FiniteEndpointShell.I3 at hqI3
      exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hqI3))
    have hqC3 : q ∈ S.CP.C3 := by
      unfold Problem97.FiniteEndpointShell.I3 at hqI3
      exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hqI3)
    have hq_ne_v1 : q ≠ q1 := by
      unfold Problem97.FiniteEndpointShell.I3 at hqI3
      exact (Finset.mem_erase.mp (Finset.mem_erase.mp hqI3).2).1
    have hq_ne_v2 : q ≠ q2 := by
      unfold Problem97.FiniteEndpointShell.I3 at hqI3
      exact (Finset.mem_erase.mp hqI3).1
    have hxAqs : qs ∈ A := S.CP.C3_subset (by
      unfold Problem97.FiniteEndpointShell.I3 at hqsI3
      exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hqsI3))
    have hqsC3 : qs ∈ S.CP.C3 := by
      unfold Problem97.FiniteEndpointShell.I3 at hqsI3
      exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hqsI3)
    have hqs_ne_v1 : qs ≠ q1 := by
      unfold Problem97.FiniteEndpointShell.I3 at hqsI3
      exact (Finset.mem_erase.mp (Finset.mem_erase.mp hqsI3).2).1
    have hqs_ne_v2 : qs ≠ q2 := by
      unfold Problem97.FiniteEndpointShell.I3 at hqsI3
      exact (Finset.mem_erase.mp hqsI3).1
    have hq3_base_ne : signedArea2 q3 q1 q2 ≠ 0 := by
      have hv1O : dist q3 S.Packet.center = S.Packet.radius := by
        simpa [q3, dist_eq_norm] using S.Packet.moser_on_boundary_3
      have hv2O : dist q1 S.Packet.center = S.Packet.radius := by
        simpa [q1, dist_eq_norm] using S.Packet.moser_on_boundary_1
      have hv3O : dist q2 S.Packet.center = S.Packet.radius := by
        simpa [q2, dist_eq_norm] using S.Packet.moser_on_boundary_2
      exact MEC.signedArea2_ne_zero_of_three_dist_eq
        hv1O hv2O hv3O
        S.triangle.v13_ne.symm S.triangle.v12_ne S.triangle.v23_ne.symm
    have hq3_img_pos : 0 < signedArea2 (T0 q3) (T0 q1) (T0 q2) := by
      rw [hv1, hv2, b3n9m051_signedArea2_baseChord_vec2]; linarith
    have hbelow : ∀ {x : ℝ²}, x ∈ A → x ∈ S.CP.C3 → x ≠ q1 → x ≠ q2 →
        (T x) 1 < 0 := by
      intro x hxA hxC3 hx_ne_v1 hx_ne_v2
      have hx_arc : signedArea2 x q1 q2 * signedArea2 q3 q1 q2 ≤ 0 :=
        (S.CP.arc_membership x hxA).2.2.1 hxC3
      have hx_base_ne : signedArea2 x q1 q2 ≠ 0 := by
        intro hz
        have hcol : Collinear ℝ ({x, q1, q2} : Set ℝ²) :=
          (Problem97.signedArea2_eq_zero_iff_collinear x q1 q2).1 hz
        exact False.elim <|
          (_root_.Batch3N9.Problem97.ConvexIndep.not_three_collinear S.hconv) hxA S.triangle.v1_mem S.triangle.v2_mem
            hx_ne_v1 hx_ne_v2 S.triangle.v12_ne hcol
      have himg_nonpos :
          signedArea2 (T0 x) (T0 q1) (T0 q2) * signedArea2 (T0 q3) (T0 q1) (T0 q2) ≤ 0 := by
        rw [tau0.halfplane_sign x q1 q2, tau0.halfplane_sign q3 q1 q2]
        have hrew :
            (tau0.orientation * (tau0.scale ^ 2) * signedArea2 x q1 q2) *
                (tau0.orientation * (tau0.scale ^ 2) * signedArea2 q3 q1 q2) =
              (tau0.orientation ^ 2) * (tau0.scale ^ 2 * tau0.scale ^ 2) *
                (signedArea2 x q1 q2 * signedArea2 q3 q1 q2) := by ring
        rw [hrew, tau0.orientation_sq]
        have hscale_nonneg : 0 ≤ tau0.scale ^ 2 * tau0.scale ^ 2 := by positivity
        simpa using mul_nonpos_of_nonneg_of_nonpos hscale_nonneg hx_arc
      have hx_img_lt : signedArea2 (T0 x) (T0 q1) (T0 q2) < 0 := by
        have hx_img_le : signedArea2 (T0 x) (T0 q1) (T0 q2) ≤ 0 := by
          by_contra hx_pos
          have : 0 < signedArea2 (T0 x) (T0 q1) (T0 q2) *
              signedArea2 (T0 q3) (T0 q1) (T0 q2) := mul_pos (by linarith) hq3_img_pos
          linarith
        have hx_img_ne : signedArea2 (T0 x) (T0 q1) (T0 q2) ≠ 0 := by
          rw [tau0.halfplane_sign x q1 q2]
          have horient_ne : tau0.orientation ≠ 0 := by
            intro h0
            have : (0 : ℝ) ^ 2 = 1 := by simpa [h0] using tau0.orientation_sq
            norm_num at this
          exact mul_ne_zero
            (mul_ne_zero horient_ne (pow_ne_zero 2 (ne_of_gt tau0.scale_pos))) hx_base_ne
        exact lt_of_le_of_ne hx_img_le hx_img_ne
      rw [hv1, hv2, b3n9m051_signedArea2_baseChord_vec2] at hx_img_lt
      dsimp [T]
      simp only [b3n9m051_halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have : (T0 x) 1 / 2 < 0 := by linarith
      simpa using this
    have hqy_T : (T q) 1 < 0 := hbelow hxAq hqC3 hq_ne_v1 hq_ne_v2
    have hqsy_T : (T qs) 1 < 0 := hbelow hxAqs hqsC3 hqs_ne_v1 hqs_ne_v2
    have hE_base_ne : signedArea2 E q1 q2 ≠ 0 := by
      intro hz; rw [hz, zero_mul] at hEside; exact lt_irrefl _ hEside
    have hEy_T : 0 < (T E) 1 := by
      have hE_img_prod :
          0 < signedArea2 (T0 E) (T0 q1) (T0 q2) * signedArea2 (T0 q3) (T0 q1) (T0 q2) := by
        rw [tau0.halfplane_sign E q1 q2, tau0.halfplane_sign q3 q1 q2]
        have hrew :
            (tau0.orientation * (tau0.scale ^ 2) * signedArea2 E q1 q2) *
                (tau0.orientation * (tau0.scale ^ 2) * signedArea2 q3 q1 q2) =
              (tau0.orientation ^ 2) * (tau0.scale ^ 2 * tau0.scale ^ 2) *
                (signedArea2 E q1 q2 * signedArea2 q3 q1 q2) := by ring
        rw [hrew, tau0.orientation_sq]
        have hscale_pos : 0 < tau0.scale ^ 2 * tau0.scale ^ 2 := by
          have := tau0.scale_pos; positivity
        have hprod : 0 < signedArea2 E q1 q2 * signedArea2 q3 q1 q2 := by
          simpa [q1, q2, q3] using hEside
        have : 0 < tau0.scale ^ 2 * tau0.scale ^ 2 *
            (signedArea2 E q1 q2 * signedArea2 q3 q1 q2) := mul_pos hscale_pos hprod
        linarith [this]
      have hE_img_pos : 0 < signedArea2 (T0 E) (T0 q1) (T0 q2) := by
        by_contra hle
        push_neg at hle
        have : signedArea2 (T0 E) (T0 q1) (T0 q2) *
            signedArea2 (T0 q3) (T0 q1) (T0 q2) ≤ 0 :=
          mul_nonpos_of_nonpos_of_nonneg hle (le_of_lt hq3_img_pos)
        linarith
      rw [hv1, hv2, b3n9m051_signedArea2_baseChord_vec2] at hE_img_pos
      dsimp [T]
      simp only [b3n9m051_halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have : (0 : ℝ) < (T0 E) 1 / 2 := by linarith
      simpa using this
    have hv3_ne_v2 : q3 ≠ q2 := by simpa [q2, q3] using S.triangle.v23_ne.symm
    set r : ℝ := dist (T q2) (T q3) with hr_def
    have hd_BD : 0 < dist q2 q3 := by rw [dist_pos]; exact fun h => hv3_ne_v2 h.symm
    have hr_pos : 0 < r := by
      rw [hr_def, tau.dist_image]; exact mul_pos tau.scale_pos hd_BD
    have hBD_T : dist (T q2) (T q3) = r := hr_def.symm
    have hBq_T : dist (T q2) (T q) = r := by
      rw [hr_def, tau.dist_image, tau.dist_image]
      have : dist q2 q = dist q2 q3 := by
        have := hBq; simp only [q2, q3] at this ⊢; rw [this]
      rw [this]
    have hBE_T : dist (T q2) (T E) = r := by
      rw [hr_def, tau.dist_image, tau.dist_image]
      have : dist q2 E = dist q2 q3 := by
        have := hBE; simp only [q2, q3] at this ⊢; rw [this]
      rw [this]
    have hDE_T : dist (T q3) (T E) = dist (T q3) (T q) := by
      rw [tau.dist_image, tau.dist_image]
      have : dist q3 E = dist q3 q := by
        have := hDE; simp only [q3] at this ⊢; rw [this]
      rw [this]
    have hDqs_T : dist (T q3) (T qs) = dist (T q3) (T q) := by
      rw [tau.dist_image, tau.dist_image]
      have : dist q3 qs = dist q3 q := by
        have := hDqs; simp only [q3] at this ⊢; rw [this]
      rw [this]
    set cδ : ℝ := ((T q3) 0 - 1) / r with hcδ_def
    set sδ : ℝ := (T q3) 1 / r with hsδ_def
    set cε : ℝ := ((T E) 0 - 1) / r with hcε_def
    set sε : ℝ := (T E) 1 / r with hsε_def
    set cη : ℝ := ((T q) 0 - 1) / r with hcη_def
    set sη : ℝ := (T q) 1 / r with hsη_def
    have hrne : r ≠ 0 := ne_of_gt hr_pos
    have hδpyth : cδ ^ 2 + sδ ^ 2 = 1 :=
      b3n9m051_circle_pyth (T q3) (T q2) r hrne hv2c0 hv2c1 hBD_T
    have hεpyth : cε ^ 2 + sε ^ 2 = 1 :=
      b3n9m051_circle_pyth (T E) (T q2) r hrne hv2c0 hv2c1 hBE_T
    have hηpyth : cη ^ 2 + sη ^ 2 = 1 :=
      b3n9m051_circle_pyth (T q) (T q2) r hrne hv2c0 hv2c1 hBq_T
    have hsδ_pos : 0 < sδ := by rw [hsδ_def]; positivity
    have hsε_pos : 0 < sε := by rw [hsε_def]; exact div_pos hEy_T hr_pos
    have hsη_neg : sη < 0 := by rw [hsη_def]; exact div_neg_of_neg_of_pos hqy_T hr_pos
    have hTD0 : (T q3) 0 = 1 + r * cδ := by rw [hcδ_def]; field_simp; ring
    have hTD1 : (T q3) 1 = r * sδ := by rw [hsδ_def]; field_simp
    have hTE0 : (T E) 0 = 1 + r * cε := by rw [hcε_def]; field_simp; ring
    have hTE1 : (T E) 1 = r * sε := by rw [hsε_def]; field_simp
    have hTq0 : (T q) 0 = 1 + r * cη := by rw [hcη_def]; field_simp; ring
    have hTq1 : (T q) 1 = r * sη := by rw [hsη_def]; field_simp
    have hradical : cη * cδ + sη * sδ = cε * cδ + sε * sδ := by
      have hsqeq : dist (T q3) (T E) ^ 2 = dist (T q3) (T q) ^ 2 := by rw [hDE_T]
      rw [b3n9m051_dist_sq_eq_coord_sq_add_coord_sq, b3n9m051_dist_sq_eq_coord_sq_add_coord_sq] at hsqeq
      rw [hTD0, hTD1, hTE0, hTE1, hTq0, hTq1] at hsqeq
      have hkey : (cε * cδ + sε * sδ) * r ^ 2 = (cη * cδ + sη * sδ) * r ^ 2 := by
        nlinarith only [hsqeq, hεpyth, hηpyth, hδpyth]
      have hr2pos : (0 : ℝ) < r ^ 2 := by positivity
      exact (mul_right_cancel₀ (ne_of_gt hr2pos) hkey).symm
    have hne : ¬ (cη = cε ∧ sη = sε) := by
      rintro ⟨hc, hs⟩
      apply hqE
      have h0 : (T q) 0 = (T E) 0 := by rw [hTq0, hTE0, hc]
      have h1 : (T q) 1 = (T E) 1 := by rw [hTq1, hTE1, hs]
      have hTqE : T q = T E := by ext i; fin_cases i
                                  · exact h0
                                  · exact h1
      have hd0 : dist (T q) (T E) = 0 := by rw [hTqE]; simp
      rw [tau.dist_image] at hd0
      have hdqE : dist q E = 0 := by
        rcases mul_eq_zero.mp hd0 with h | h
        · exact absurd h (ne_of_gt tau.scale_pos)
        · exact h
      exact dist_eq_zero.mp hdqE
    obtain ⟨ε, δ, hcosε, hsinε, _hε0, _hεπ, hcosδ, hsinδ, _hδ0, _hδπ, hcη_eq, hsη_eq⟩ :=
      b3n9m051_qEqE_reflection_coords r cε sε cδ sδ cη sη hsε_pos hεpyth hsδ_pos hδpyth hηpyth
        hsη_neg hradical hne
    have hsd : 0 < Real.sin δ := by rw [hsinδ]; exact hsδ_pos
    have hse : 0 < Real.sin ε := by rw [hsinε]; exact hsε_pos
    have hTD0' : (T q3) 0 = 1 + r * Real.cos δ := by rw [hTD0, ← hcosδ]
    have hTD1' : (T q3) 1 = r * Real.sin δ := by rw [hTD1, ← hsinδ]
    have hAB1 : dist (T q1) (T q2) = 1 := by
      rw [hv1T, hv2T, dist_eq_norm]
      have hvec :
          Problem97.CGN.vec2 0 0 - Problem97.CGN.vec2 1 0 = Problem97.CGN.vec2 (-1) 0 := by
        ext i <;> fin_cases i <;>
          simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
      rw [hvec, EuclideanSpace.norm_eq]
      norm_num [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hcd : -(r / 2) < Real.cos δ := by
      rw [hcosδ, hcδ_def]
      have hAD : 1 < dist (T q1) (T q3) := by
        rw [tau.dist_image]
        have hsc : dist (T q1) (T q2) = tau.scale * dist q1 q2 := tau.dist_image q1 q2
        rw [hAB1] at hsc
        have hlong' : dist q1 q2 < dist q1 q3 := by simpa [q1, q2, q3] using hlong
        nlinarith only [hsc, hlong, hlong', tau.scale_pos, dist_nonneg (x := q1) (y := q2)]
      have hADsq : 1 < (T q3) 0 ^ 2 + (T q3) 1 ^ 2 :=
        b3n9m051_normsq_gt_of_origin_dist_gt (T q3) (T q1) hv1c0 hv1c1 hAD
      exact b3n9m051_sign_pin_lower_bound r _ _ hr_pos (by rwa [← hcδ_def, ← hsδ_def]) hADsq
    have hce : Real.cos ε < -(r / 2) := by
      rw [hcosε, hcε_def]
      have hAE : dist (T q1) (T E) < 1 := by
        rw [tau.dist_image]
        have hsc : dist (T q1) (T q2) = tau.scale * dist q1 q2 := tau.dist_image q1 q2
        rw [hAB1] at hsc
        have hAElt' : dist q1 E < dist q1 q2 := by simpa [q1, q2] using hAElt
        nlinarith only [hsc, hAElt, hAElt', tau.scale_pos, dist_nonneg (x := q1) (y := q2)]
      have hAEsq : (T E) 0 ^ 2 + (T E) 1 ^ 2 < 1 :=
        b3n9m051_normsq_lt_of_origin_dist_lt (T E) (T q1) hv1c0 hv1c1 hAE
      exact b3n9m051_sign_pin_upper_bound r _ _ hr_pos (by rwa [← hcε_def, ← hsε_def]) hAEsq
    have hc2de : Real.cos (2 * δ - ε) < -(r / 2) := by
      rw [← hcη_eq, hcη_def]
      have hAq : dist (T q1) (T q) < 1 := by
        rw [tau.dist_image]
        have hsc : dist (T q1) (T q2) = tau.scale * dist q1 q2 := tau.dist_image q1 q2
        rw [hAB1] at hsc
        have hAqlt' : dist q1 q < dist q1 q2 := by
          simpa [q1, q2] using S.b3n9m051_v1_lt_v1v2_of_mem_I3 hqI3
        nlinarith only [hAqlt', hsmall, hsc, hd_BD, tau.scale_pos, dist_nonneg (x := q1) (y := q2)]
      have hAqsq : (T q) 0 ^ 2 + (T q) 1 ^ 2 < 1 :=
        b3n9m051_normsq_lt_of_origin_dist_lt (T q) (T q1) hv1c0 hv1c1 hAq
      exact b3n9m051_sign_pin_upper_bound r _ _ hr_pos (by rwa [← hcη_def, ← hsη_def]) hAqsq
    have hs2de : Real.sin (2 * δ - ε) < 0 := by rw [← hsη_eq]; exact hsη_neg
    have hDq_T_eq : dist (T q3) (T q) = r * Real.sqrt (2 - 2 * Real.cos (δ - ε)) := by
      have hDEdist : dist (T q3) (T E) ^ 2 = r ^ 2 * (2 - 2 * Real.cos (δ - ε)) := by
        rw [b3n9m051_dist_sq_eq_coord_sq_add_coord_sq, hTD0', hTD1', hTE0, hTE1, ← hcosε, ← hsinε,
            b3n9m051_chord_sq_formula r hr_pos δ ε]
        field_simp
      rw [hDE_T] at hDEdist
      exact b3n9m051_dist_eq_r_sqrt_of_sq _ r hr_pos δ ε dist_nonneg hDEdist
    set Sr : ℝ := Real.sqrt (2 - 2 * Real.cos (δ - ε)) with hSr_def
    have hS2eq : Sr ^ 2 = 2 - 2 * Real.cos (δ - ε) := by
      rw [hSr_def, Real.sq_sqrt]; nlinarith only [Real.cos_le_one (δ - ε)]
    have hq_ne_v3 : q ≠ q3 := by
      intro h; exact S.CP.v3_notin_C3 (by simpa [q3, h] using hqC3)
    have hSr_pos : 0 < Sr := by
      have hDq_pos : 0 < dist (T q3) (T q) := by
        rw [tau.dist_image]; apply mul_pos tau.scale_pos
        rw [dist_pos]; exact fun h => hq_ne_v3 h.symm
      show 0 < Real.sqrt (2 - 2 * Real.cos (δ - ε))
      have hh : Real.sqrt (2 - 2 * Real.cos (δ - ε)) = dist (T q3) (T q) / r := by
        rw [hDq_T_eq, mul_div_cancel_left₀ _ (ne_of_gt hr_pos)]
      rw [hh]; exact div_pos hDq_pos hr_pos
    have hDqsdist :
        ((T qs) 0 - (1 + r * Real.cos δ)) ^ 2 + ((T qs) 1 - r * Real.sin δ) ^ 2
          = (r * Sr) ^ 2 := by
      have h_coord : dist (T q3) (T qs) ^ 2 =
          ((T qs) 0 - (1 + r * Real.cos δ)) ^ 2 + ((T qs) 1 - r * Real.sin δ) ^ 2 := by
        rw [b3n9m051_dist_sq_eq_coord_sq_add_coord_sq, hTD0', hTD1']; ring
      rw [← h_coord, hDqs_T, hDq_T_eq]
    obtain ⟨t, hqsx, hqsy⟩ :=
      b3n9m051_qEqE_param_t r Sr (Real.cos δ) (Real.sin δ) ((T qs) 0) ((T qs) 1) hr_pos hSr_pos
        hDqsdist
    have hlower : r * Real.sin δ + r * Sr * Real.sin t < 0 := by
      rw [← hqsy]; exact hqsy_T
    have hr_lt_one : r < 1 := by
      have hBD : dist (T q2) (T q3) < dist (T q1) (T q2) := by
        rw [tau.dist_image, tau.dist_image]
        have hsc : 0 < tau.scale := tau.scale_pos
        have hlt : dist q2 q3 < dist q1 q2 := by simpa [q1, q2, q3] using hsmall
        nlinarith only [hsmall, hsc, hlt, dist_nonneg (x := q1) (y := q2)]
      rw [hBD_T, hAB1] at hBD; exact hBD
    have hB := qEqE_lowerArc_sameSign r δ ε t Sr hr_pos hr_lt_one
      hSr_pos hS2eq hsd hcd hse hce hs2de hc2de hlower
    rw [← b3n9m051_qEqE_f1_sinusoid r δ ε t Sr hS2eq, ← b3n9m051_qEqE_f2_sinusoid r δ ε t Sr] at hB
    have hqsx' : (T qs) 0 = (1 + r * Real.cos δ) + r * Sr * Real.cos t := by
      rw [hqsx]
    have hqsy' : (T qs) 1 = r * Real.sin δ + r * Sr * Real.sin t := hqsy
    have hTq0' : (T q) 0 = 1 + r * Real.cos (2 * δ - ε) := by rw [hTq0, hcη_eq]
    have hTq1' : (T q) 1 = r * Real.sin (2 * δ - ε) := by rw [hTq1, hsη_eq]
    have hGparam :
        (((1 + r * Real.cos δ) + r * Sr * Real.cos t) - (1 + r * Real.cos δ)) ^ 2
            + ((r * Real.sin δ + r * Sr * Real.sin t) - r * Real.sin δ) ^ 2
          = ((1 + r * Real.cos (2 * δ - ε)) - (1 + r * Real.cos δ)) ^ 2
            + (r * Real.sin (2 * δ - ε) - r * Real.sin δ) ^ 2 := by
      have hsq : dist (T q3) (T qs) ^ 2 = dist (T q3) (T q) ^ 2 := by rw [hDqs_T]
      rw [b3n9m051_dist_sq_eq_coord_sq_add_coord_sq, b3n9m051_dist_sq_eq_coord_sq_add_coord_sq,
        hTD0', hTD1', hqsx', hqsy', hTq0', hTq1'] at hsq
      linarith [hsq]
    have hbridge2 :
        (((1 + r * Real.cos δ) + r * Sr * Real.cos t) - (1 + r * Real.cos (2 * δ - ε)))
              * ((1 + r * Real.cos δ) - 1)
            + (((r * Real.sin δ) + r * Sr * Real.sin t) - r * Real.sin (2 * δ - ε))
              * ((r * Real.sin δ) - 0)
          = (dist (T q2) (T qs) ^ 2 - dist (T q2) (T q) ^ 2) / 2 := by
      rw [b3n9m051_dist_sq_eq_coord_sq_add_coord_sq, b3n9m051_dist_sq_eq_coord_sq_add_coord_sq,
        hv2c0, hv2c1, hqsx', hqsy', hTq0', hTq1']
      linear_combination (-(1 : ℝ) / 2) * hGparam
    have hbridge1 :
        (((1 + r * Real.cos δ) + r * Sr * Real.cos t) - (1 + r * Real.cos (2 * δ - ε)))
              * (1 + r * Real.cos δ)
            + (((r * Real.sin δ) + r * Sr * Real.sin t) - r * Real.sin (2 * δ - ε))
              * (r * Real.sin δ)
          = (dist (T q1) (T qs) ^ 2 - dist (T q1) (T q) ^ 2) / 2 := by
      rw [b3n9m051_dist_sq_eq_coord_sq_add_coord_sq, b3n9m051_dist_sq_eq_coord_sq_add_coord_sq,
        hv1c0, hv1c1, hqsx', hqsy', hTq0', hTq1']
      linear_combination (-(1 : ℝ) / 2) * hGparam
    rw [hbridge2, hbridge1] at hB
    have hsc_pos : 0 < tau.scale := tau.scale_pos
    have hTB2qs : dist (T q2) (T qs) ^ 2 = tau.scale ^ 2 * dist q2 qs ^ 2 := by
      rw [tau.dist_image]; ring
    have hTB2q : dist (T q2) (T q) ^ 2 = tau.scale ^ 2 * dist q2 q ^ 2 := by
      rw [tau.dist_image]; ring
    have hTA2qs : dist (T q1) (T qs) ^ 2 = tau.scale ^ 2 * dist q1 qs ^ 2 := by
      rw [tau.dist_image]; ring
    have hTA2q : dist (T q1) (T q) ^ 2 = tau.scale ^ 2 * dist q1 q ^ 2 := by
      rw [tau.dist_image]; ring
    rw [hTB2qs, hTB2q, hTA2qs, hTA2q] at hB
    have hsc4 : 0 < tau.scale ^ 2 * tau.scale ^ 2 / 4 := by positivity
    have hfac :
        (tau.scale ^ 2 * dist q2 qs ^ 2 - tau.scale ^ 2 * dist q2 q ^ 2) / 2
            * ((tau.scale ^ 2 * dist q1 qs ^ 2 - tau.scale ^ 2 * dist q1 q ^ 2) / 2)
          = (dist q2 qs ^ 2 - dist q2 q ^ 2) * (dist q1 qs ^ 2 - dist q1 q ^ 2)
            * (tau.scale ^ 2 * tau.scale ^ 2 / 4) := by
      ring
    rw [hfac] at hB
    have hgoal :
        0 ≤ (dist q2 qs ^ 2 - dist q2 q ^ 2) * (dist q1 qs ^ 2 - dist q1 q ^ 2) :=
      nonneg_of_mul_nonneg_left hB hsc4
    simpa [q1, q2] using hgoal
  by_cases hq3pos : 0 < (Tbase q3) 1
  · exact build_from tauBase hv1Base hv2Base hq3pos
  · let Tflip : ℝ² → ℝ² := fun x => b3n9m051_flipY (Tbase x)
    let tauFlip : Problem97.CGN.SimilarityTransportData Tflip :=
      b3n9m051_similarityTransportComp tauBase b3n9m051_flipYSimilarityTransportData
    have hv1Flip : Tflip q1 = Problem97.CGN.vec2 (-1) 0 := by
      dsimp [Tflip]; rw [hv1Base]
      ext i <;> fin_cases i <;>
        simp [b3n9m051_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hv2Flip : Tflip q2 = Problem97.CGN.vec2 1 0 := by
      dsimp [Tflip]; rw [hv2Base]
      ext i <;> fin_cases i <;>
        simp [b3n9m051_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hq3Flip : 0 < (Tflip q3) 1 := by
      dsimp [Tflip]
      simp only [b3n9m051_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have hq3neg : (Tbase q3) 1 < 0 := by
        have hle : (Tbase q3) 1 ≤ 0 := le_of_not_gt hq3pos
        exact lt_of_le_of_ne hle hq3_base_nonzero
      simpa using hq3neg
    exact build_from tauFlip hv1Flip hv2Flip hq3Flip
set_option maxHeartbeats 8000000 in
theorem qEqE_lowerArc_sameSign_of_shell_flipped
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {q qs E : ℝ²}
    (hqI3 : q ∈ S.I3) (hqsI3 : qs ∈ S.I3)
    (hDqs : dist S.triangle.v3 qs = dist S.triangle.v3 q)
    (hBq : dist S.triangle.v2 q = dist S.triangle.v2 S.triangle.v3)
    (hBE : dist S.triangle.v2 E = dist S.triangle.v2 S.triangle.v3)
    (hDE : dist S.triangle.v3 E = dist S.triangle.v3 q)
    (hsmall : dist S.triangle.v2 S.triangle.v3 < dist S.triangle.v1 S.triangle.v2)
    (hlong : dist S.triangle.v1 S.triangle.v2 < dist S.triangle.v1 S.triangle.v3)
    (hAEgt : dist S.triangle.v1 S.triangle.v2 < dist S.triangle.v1 E)
    (hEC2 : E ∈ S.CP.C2)
    (hEside :
      0 < signedArea2 E S.triangle.v1 S.triangle.v2 *
        signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2)
    (hqE : q ≠ E) :
    0 ≤ (dist S.triangle.v2 qs ^ 2 - dist S.triangle.v2 q ^ 2)
        * (dist S.triangle.v1 qs ^ 2 - dist S.triangle.v1 q ^ 2) := by
  classical
  let q1 : ℝ² := S.triangle.v1
  let q2 : ℝ² := S.triangle.v2
  let q3 : ℝ² := S.triangle.v3
  have hq1ne : q1 ≠ q2 := by simpa [q1, q2] using S.triangle.v12_ne
  rcases b3n9m051_exists_base_transportData q1 q2 hq1ne with
    ⟨Tbase, tauBase, hv1Base, hv2Base⟩
  have horientBase_ne : tauBase.orientation ≠ 0 := by
    intro h0
    have : (0 : ℝ) ^ 2 = 1 := by simpa [h0] using tauBase.orientation_sq
    norm_num at this
  have hq3_base_nonzero : (Tbase q3) 1 ≠ 0 := by
    have hq3_sa_ne : signedArea2 q3 q1 q2 ≠ 0 := by
      have hv1O : ‖q1 - S.Packet.center‖ = S.Packet.radius := by
        simpa [q1] using S.Packet.moser_on_boundary_1
      have hv2O : ‖q2 - S.Packet.center‖ = S.Packet.radius := by
        simpa [q2] using S.Packet.moser_on_boundary_2
      have hv3O : ‖q3 - S.Packet.center‖ = S.Packet.radius := by
        simpa [q3] using S.Packet.moser_on_boundary_3
      exact MEC.signedArea2_ne_zero_of_three_dist_eq
        hv3O hv1O hv2O
        S.triangle.v13_ne.symm S.triangle.v12_ne S.triangle.v23_ne.symm
    have himg_ne : signedArea2 (Tbase q3) (Tbase q1) (Tbase q2) ≠ 0 := by
      rw [tauBase.halfplane_sign q3 q1 q2]
      exact mul_ne_zero
        (mul_ne_zero horientBase_ne (pow_ne_zero 2 (ne_of_gt tauBase.scale_pos)))
        hq3_sa_ne
    intro h0
    apply himg_ne
    rw [hv1Base, hv2Base, b3n9m051_signedArea2_baseChord_vec2]
    linarith
  have build_from :
      ∀ {T0 : ℝ² → ℝ²},
        (tau0 : Problem97.CGN.SimilarityTransportData T0) →
        T0 q1 = Problem97.CGN.vec2 (-1) 0 →
        T0 q2 = Problem97.CGN.vec2 1 0 →
        0 < (T0 q3) 1 →
        0 ≤ (dist S.triangle.v2 qs ^ 2 - dist S.triangle.v2 q ^ 2)
            * (dist S.triangle.v1 qs ^ 2 - dist S.triangle.v1 q ^ 2) := by
    intro T0 tau0 hv1 hv2 hq3y_pos
    let T : ℝ² → ℝ² := fun x => b3n9m051_halfShift (T0 x)
    let tau : Problem97.CGN.SimilarityTransportData T :=
      b3n9m051_similarityTransportComp tau0 b3n9m051_halfShiftSimilarityTransportData
    have hv1T : T q1 = Problem97.CGN.vec2 0 0 := by
      dsimp [T]; rw [hv1]
      ext i <;> fin_cases i <;>
        simp [b3n9m051_halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hv2T : T q2 = Problem97.CGN.vec2 1 0 := by
      dsimp [T]; rw [hv2]
      ext i <;> fin_cases i <;>
        simp [b3n9m051_halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hq3y_T : 0 < (T q3) 1 := by
      dsimp [T]
      simp only [b3n9m051_halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have : (0 : ℝ) < (T0 q3) 1 / 2 := by linarith
      simpa using this
    have hv2c0 : (T q2) 0 = 1 := by rw [hv2T]; simp [Problem97.CGN.vec2]
    have hv2c1 : (T q2) 1 = 0 := by rw [hv2T]; simp [Problem97.CGN.vec2]
    have hv1c0 : (T q1) 0 = 0 := by rw [hv1T]; simp [Problem97.CGN.vec2]
    have hv1c1 : (T q1) 1 = 0 := by rw [hv1T]; simp [Problem97.CGN.vec2]
    have hxAq : q ∈ A := S.CP.C3_subset (by
      unfold Problem97.FiniteEndpointShell.I3 at hqI3
      exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hqI3))
    have hqC3 : q ∈ S.CP.C3 := by
      unfold Problem97.FiniteEndpointShell.I3 at hqI3
      exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hqI3)
    have hq_ne_v1 : q ≠ q1 := by
      unfold Problem97.FiniteEndpointShell.I3 at hqI3
      exact (Finset.mem_erase.mp (Finset.mem_erase.mp hqI3).2).1
    have hq_ne_v2 : q ≠ q2 := by
      unfold Problem97.FiniteEndpointShell.I3 at hqI3
      exact (Finset.mem_erase.mp hqI3).1
    have hxAqs : qs ∈ A := S.CP.C3_subset (by
      unfold Problem97.FiniteEndpointShell.I3 at hqsI3
      exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hqsI3))
    have hqsC3 : qs ∈ S.CP.C3 := by
      unfold Problem97.FiniteEndpointShell.I3 at hqsI3
      exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hqsI3)
    have hqs_ne_v1 : qs ≠ q1 := by
      unfold Problem97.FiniteEndpointShell.I3 at hqsI3
      exact (Finset.mem_erase.mp (Finset.mem_erase.mp hqsI3).2).1
    have hqs_ne_v2 : qs ≠ q2 := by
      unfold Problem97.FiniteEndpointShell.I3 at hqsI3
      exact (Finset.mem_erase.mp hqsI3).1
    have hq3_base_ne : signedArea2 q3 q1 q2 ≠ 0 := by
      have hv1O : dist q3 S.Packet.center = S.Packet.radius := by
        simpa [q3, dist_eq_norm] using S.Packet.moser_on_boundary_3
      have hv2O : dist q1 S.Packet.center = S.Packet.radius := by
        simpa [q1, dist_eq_norm] using S.Packet.moser_on_boundary_1
      have hv3O : dist q2 S.Packet.center = S.Packet.radius := by
        simpa [q2, dist_eq_norm] using S.Packet.moser_on_boundary_2
      exact MEC.signedArea2_ne_zero_of_three_dist_eq
        hv1O hv2O hv3O
        S.triangle.v13_ne.symm S.triangle.v12_ne S.triangle.v23_ne.symm
    have hq3_img_pos : 0 < signedArea2 (T0 q3) (T0 q1) (T0 q2) := by
      rw [hv1, hv2, b3n9m051_signedArea2_baseChord_vec2]; linarith
    have hbelow : ∀ {x : ℝ²}, x ∈ A → x ∈ S.CP.C3 → x ≠ q1 → x ≠ q2 →
        (T x) 1 < 0 := by
      intro x hxA hxC3 hx_ne_v1 hx_ne_v2
      have hx_arc : signedArea2 x q1 q2 * signedArea2 q3 q1 q2 ≤ 0 :=
        (S.CP.arc_membership x hxA).2.2.1 hxC3
      have hx_base_ne : signedArea2 x q1 q2 ≠ 0 := by
        intro hz
        have hcol : Collinear ℝ ({x, q1, q2} : Set ℝ²) :=
          (Problem97.signedArea2_eq_zero_iff_collinear x q1 q2).1 hz
        exact False.elim <|
          (_root_.Batch3N9.Problem97.ConvexIndep.not_three_collinear S.hconv) hxA S.triangle.v1_mem S.triangle.v2_mem
            hx_ne_v1 hx_ne_v2 S.triangle.v12_ne hcol
      have himg_nonpos :
          signedArea2 (T0 x) (T0 q1) (T0 q2) * signedArea2 (T0 q3) (T0 q1) (T0 q2) ≤ 0 := by
        rw [tau0.halfplane_sign x q1 q2, tau0.halfplane_sign q3 q1 q2]
        have hrew :
            (tau0.orientation * (tau0.scale ^ 2) * signedArea2 x q1 q2) *
                (tau0.orientation * (tau0.scale ^ 2) * signedArea2 q3 q1 q2) =
              (tau0.orientation ^ 2) * (tau0.scale ^ 2 * tau0.scale ^ 2) *
                (signedArea2 x q1 q2 * signedArea2 q3 q1 q2) := by ring
        rw [hrew, tau0.orientation_sq]
        have hscale_nonneg : 0 ≤ tau0.scale ^ 2 * tau0.scale ^ 2 := by positivity
        simpa using mul_nonpos_of_nonneg_of_nonpos hscale_nonneg hx_arc
      have hx_img_lt : signedArea2 (T0 x) (T0 q1) (T0 q2) < 0 := by
        have hx_img_le : signedArea2 (T0 x) (T0 q1) (T0 q2) ≤ 0 := by
          by_contra hx_pos
          have : 0 < signedArea2 (T0 x) (T0 q1) (T0 q2) *
              signedArea2 (T0 q3) (T0 q1) (T0 q2) := mul_pos (by linarith) hq3_img_pos
          linarith
        have hx_img_ne : signedArea2 (T0 x) (T0 q1) (T0 q2) ≠ 0 := by
          rw [tau0.halfplane_sign x q1 q2]
          have horient_ne : tau0.orientation ≠ 0 := by
            intro h0
            have : (0 : ℝ) ^ 2 = 1 := by simpa [h0] using tau0.orientation_sq
            norm_num at this
          exact mul_ne_zero
            (mul_ne_zero horient_ne (pow_ne_zero 2 (ne_of_gt tau0.scale_pos))) hx_base_ne
        exact lt_of_le_of_ne hx_img_le hx_img_ne
      rw [hv1, hv2, b3n9m051_signedArea2_baseChord_vec2] at hx_img_lt
      dsimp [T]
      simp only [b3n9m051_halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have : (T0 x) 1 / 2 < 0 := by linarith
      simpa using this
    have hqy_T : (T q) 1 < 0 := hbelow hxAq hqC3 hq_ne_v1 hq_ne_v2
    have hqsy_T : (T qs) 1 < 0 := hbelow hxAqs hqsC3 hqs_ne_v1 hqs_ne_v2
    have hE_base_ne : signedArea2 E q1 q2 ≠ 0 := by
      intro hz; rw [hz, zero_mul] at hEside; exact lt_irrefl _ hEside
    have hEy_T : 0 < (T E) 1 := by
      have hE_img_prod :
          0 < signedArea2 (T0 E) (T0 q1) (T0 q2) * signedArea2 (T0 q3) (T0 q1) (T0 q2) := by
        rw [tau0.halfplane_sign E q1 q2, tau0.halfplane_sign q3 q1 q2]
        have hrew :
            (tau0.orientation * (tau0.scale ^ 2) * signedArea2 E q1 q2) *
                (tau0.orientation * (tau0.scale ^ 2) * signedArea2 q3 q1 q2) =
              (tau0.orientation ^ 2) * (tau0.scale ^ 2 * tau0.scale ^ 2) *
                (signedArea2 E q1 q2 * signedArea2 q3 q1 q2) := by ring
        rw [hrew, tau0.orientation_sq]
        have hscale_pos : 0 < tau0.scale ^ 2 * tau0.scale ^ 2 := by
          have := tau0.scale_pos; positivity
        have hprod : 0 < signedArea2 E q1 q2 * signedArea2 q3 q1 q2 := by
          simpa [q1, q2, q3] using hEside
        have : 0 < tau0.scale ^ 2 * tau0.scale ^ 2 *
            (signedArea2 E q1 q2 * signedArea2 q3 q1 q2) := mul_pos hscale_pos hprod
        linarith [this]
      have hE_img_pos : 0 < signedArea2 (T0 E) (T0 q1) (T0 q2) := by
        by_contra hle
        push_neg at hle
        have : signedArea2 (T0 E) (T0 q1) (T0 q2) *
            signedArea2 (T0 q3) (T0 q1) (T0 q2) ≤ 0 :=
          mul_nonpos_of_nonpos_of_nonneg hle (le_of_lt hq3_img_pos)
        linarith
      rw [hv1, hv2, b3n9m051_signedArea2_baseChord_vec2] at hE_img_pos
      dsimp [T]
      simp only [b3n9m051_halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have : (0 : ℝ) < (T0 E) 1 / 2 := by linarith
      simpa using this
    have hv3_ne_v2 : q3 ≠ q2 := by simpa [q2, q3] using S.triangle.v23_ne.symm
    set r : ℝ := dist (T q2) (T q3) with hr_def
    have hd_BD : 0 < dist q2 q3 := by rw [dist_pos]; exact fun h => hv3_ne_v2 h.symm
    have hr_pos : 0 < r := by
      rw [hr_def, tau.dist_image]; exact mul_pos tau.scale_pos hd_BD
    have hBD_T : dist (T q2) (T q3) = r := hr_def.symm
    have hBq_T : dist (T q2) (T q) = r := by
      rw [hr_def, tau.dist_image, tau.dist_image]
      have : dist q2 q = dist q2 q3 := by
        have := hBq; simp only [q2, q3] at this ⊢; rw [this]
      rw [this]
    have hBE_T : dist (T q2) (T E) = r := by
      rw [hr_def, tau.dist_image, tau.dist_image]
      have : dist q2 E = dist q2 q3 := by
        have := hBE; simp only [q2, q3] at this ⊢; rw [this]
      rw [this]
    have hDE_T : dist (T q3) (T E) = dist (T q3) (T q) := by
      rw [tau.dist_image, tau.dist_image]
      have : dist q3 E = dist q3 q := by
        have := hDE; simp only [q3] at this ⊢; rw [this]
      rw [this]
    have hDqs_T : dist (T q3) (T qs) = dist (T q3) (T q) := by
      rw [tau.dist_image, tau.dist_image]
      have : dist q3 qs = dist q3 q := by
        have := hDqs; simp only [q3] at this ⊢; rw [this]
      rw [this]
    set cδ : ℝ := ((T q3) 0 - 1) / r with hcδ_def
    set sδ : ℝ := (T q3) 1 / r with hsδ_def
    set cε : ℝ := ((T E) 0 - 1) / r with hcε_def
    set sε : ℝ := (T E) 1 / r with hsε_def
    set cη : ℝ := ((T q) 0 - 1) / r with hcη_def
    set sη : ℝ := (T q) 1 / r with hsη_def
    have hrne : r ≠ 0 := ne_of_gt hr_pos
    have hδpyth : cδ ^ 2 + sδ ^ 2 = 1 :=
      b3n9m051_circle_pyth (T q3) (T q2) r hrne hv2c0 hv2c1 hBD_T
    have hεpyth : cε ^ 2 + sε ^ 2 = 1 :=
      b3n9m051_circle_pyth (T E) (T q2) r hrne hv2c0 hv2c1 hBE_T
    have hηpyth : cη ^ 2 + sη ^ 2 = 1 :=
      b3n9m051_circle_pyth (T q) (T q2) r hrne hv2c0 hv2c1 hBq_T
    have hsδ_pos : 0 < sδ := by rw [hsδ_def]; exact div_pos hq3y_T hr_pos
    have hsε_pos : 0 < sε := by rw [hsε_def]; exact div_pos hEy_T hr_pos
    have hsη_neg : sη < 0 := by rw [hsη_def]; exact div_neg_of_neg_of_pos hqy_T hr_pos
    have hTD0 : (T q3) 0 = 1 + r * cδ := by rw [hcδ_def]; field_simp; ring
    have hTD1 : (T q3) 1 = r * sδ := by rw [hsδ_def]; field_simp
    have hTE0 : (T E) 0 = 1 + r * cε := by rw [hcε_def]; field_simp; ring
    have hTE1 : (T E) 1 = r * sε := by rw [hsε_def]; field_simp
    have hTq0 : (T q) 0 = 1 + r * cη := by rw [hcη_def]; field_simp; ring
    have hTq1 : (T q) 1 = r * sη := by rw [hsη_def]; field_simp
    have hradical : cη * cδ + sη * sδ = cε * cδ + sε * sδ := by
      have hsqeq : dist (T q3) (T E) ^ 2 = dist (T q3) (T q) ^ 2 := by rw [hDE_T]
      rw [b3n9m051_dist_sq_eq_coord_sq_add_coord_sq, b3n9m051_dist_sq_eq_coord_sq_add_coord_sq] at hsqeq
      rw [hTD0, hTD1, hTE0, hTE1, hTq0, hTq1] at hsqeq
      have hkey : (cε * cδ + sε * sδ) * r ^ 2 = (cη * cδ + sη * sδ) * r ^ 2 := by
        nlinarith only [hsqeq, hεpyth, hηpyth, hδpyth]
      have hr2pos : (0 : ℝ) < r ^ 2 := by positivity
      exact (mul_right_cancel₀ (ne_of_gt hr2pos) hkey).symm
    have hne : ¬ (cη = cε ∧ sη = sε) := by
      rintro ⟨hc, hs⟩
      apply hqE
      have h0 : (T q) 0 = (T E) 0 := by rw [hTq0, hTE0, hc]
      have h1 : (T q) 1 = (T E) 1 := by rw [hTq1, hTE1, hs]
      have hTqE : T q = T E := by ext i; fin_cases i
                                  · exact h0
                                  · exact h1
      have hd0 : dist (T q) (T E) = 0 := by rw [hTqE]; simp
      rw [tau.dist_image] at hd0
      have hdqE : dist q E = 0 := by
        rcases mul_eq_zero.mp hd0 with h | h
        · exact absurd h (ne_of_gt tau.scale_pos)
        · exact h
      exact dist_eq_zero.mp hdqE
    obtain ⟨ε, δ, hcosε, hsinε, hε0, hεπ, hcosδ, hsinδ, hδ0, hδπ, hcη_eq, hsη_eq⟩ :=
      b3n9m051_qEqE_reflection_coords r cε sε cδ sδ cη sη hsε_pos hεpyth hsδ_pos hδpyth hηpyth
        hsη_neg hradical hne
    have hsd : 0 < Real.sin δ := by rw [hsinδ]; exact hsδ_pos
    have hse : 0 < Real.sin ε := by rw [hsinε]; exact hsε_pos
    have hTD0' : (T q3) 0 = 1 + r * Real.cos δ := by rw [hTD0, ← hcosδ]
    have hTD1' : (T q3) 1 = r * Real.sin δ := by rw [hTD1, ← hsinδ]
    have hTE0' : (T E) 0 = 1 + r * Real.cos ε := by rw [hTE0, ← hcosε]
    have hTE1' : (T E) 1 = r * Real.sin ε := by rw [hTE1, ← hsinε]
    have hEC2_arc :
        signedArea2 E q3 q1 * signedArea2 q2 q3 q1 ≤ 0 := by
      have hEA : E ∈ A := S.CP.C2_subset hEC2
      have h := ((S.CP.arc_membership E hEA).2.1).mp hEC2
      simpa [Problem97.OnArcOpposite, q1, q2, q3] using h
    have hEC2_img :
        signedArea2 (T E) (T q3) (T q1) *
            signedArea2 (T q2) (T q3) (T q1) ≤ 0 := by
      rw [tau.halfplane_sign E q3 q1, tau.halfplane_sign q2 q3 q1]
      have hrew :
          (tau.orientation * (tau.scale ^ 2) * signedArea2 E q3 q1) *
              (tau.orientation * (tau.scale ^ 2) * signedArea2 q2 q3 q1) =
            (tau.orientation ^ 2) * (tau.scale ^ 2 * tau.scale ^ 2) *
              (signedArea2 E q3 q1 * signedArea2 q2 q3 q1) := by ring
      rw [hrew, tau.orientation_sq]
      have hscale_nonneg : 0 ≤ tau.scale ^ 2 * tau.scale ^ 2 := by positivity
      simpa using mul_nonpos_of_nonneg_of_nonpos hscale_nonneg hEC2_arc
    set side : ℝ :=
      Real.sin δ - Real.sin ε
        - r * (Real.sin ε * Real.cos δ - Real.cos ε * Real.sin δ) with hside_def
    have hE_c2_area : signedArea2 (T E) (T q3) (T q1) = r * side := by
      rw [Problem97.signedArea2, hTE0', hTE1', hTD0', hTD1', hv1T, hside_def]
      simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
      ring
    have hq2_c2_area : signedArea2 (T q2) (T q3) (T q1) = r * Real.sin δ := by
      rw [Problem97.signedArea2, hv2T, hTD0', hTD1', hv1T]
      simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hside_scaled : r * side ≤ 0 := by
      have hprod : (r * side) * (r * Real.sin δ) ≤ 0 := by
        simpa [hE_c2_area, hq2_c2_area] using hEC2_img
      have hfactor_pos : 0 < r * Real.sin δ := mul_pos hr_pos hsd
      by_contra hpos
      push_neg at hpos
      have : 0 < (r * side) * (r * Real.sin δ) := mul_pos hpos hfactor_pos
      linarith
    have hside : Real.sin δ - Real.sin ε
        - r * (Real.sin ε * Real.cos δ - Real.cos ε * Real.sin δ) ≤ 0 := by
      have hside_le : side ≤ 0 := by
        by_contra hpos
        push_neg at hpos
        have : 0 < r * side := mul_pos hr_pos hpos
        linarith
      simpa [hside_def] using hside_le
    have hAB1 : dist (T q1) (T q2) = 1 := by
      rw [hv1T, hv2T, dist_eq_norm]
      have hvec :
          Problem97.CGN.vec2 0 0 - Problem97.CGN.vec2 1 0 = Problem97.CGN.vec2 (-1) 0 := by
        ext i <;> fin_cases i <;>
          simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
      rw [hvec, EuclideanSpace.norm_eq]
      norm_num [Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hcd : -(r / 2) < Real.cos δ := by
      rw [hcosδ, hcδ_def]
      have hAD : 1 < dist (T q1) (T q3) := by
        rw [tau.dist_image]
        have hsc : dist (T q1) (T q2) = tau.scale * dist q1 q2 := tau.dist_image q1 q2
        rw [hAB1] at hsc
        have hlong' : dist q1 q2 < dist q1 q3 := by simpa [q1, q2, q3] using hlong
        nlinarith only [hsc, hlong, hlong', tau.scale_pos, dist_nonneg (x := q1) (y := q2)]
      have hADsq : 1 < (T q3) 0 ^ 2 + (T q3) 1 ^ 2 :=
        b3n9m051_normsq_gt_of_origin_dist_gt (T q3) (T q1) hv1c0 hv1c1 hAD
      exact b3n9m051_sign_pin_lower_bound r _ _ hr_pos (by rwa [← hcδ_def, ← hsδ_def]) hADsq
    have hs2de : Real.sin (2 * δ - ε) < 0 := by rw [← hsη_eq]; exact hsη_neg
    have hDq_T_eq : dist (T q3) (T q) = r * Real.sqrt (2 - 2 * Real.cos (δ - ε)) := by
      have hDEdist : dist (T q3) (T E) ^ 2 = r ^ 2 * (2 - 2 * Real.cos (δ - ε)) := by
        rw [b3n9m051_dist_sq_eq_coord_sq_add_coord_sq, hTD0', hTD1', hTE0, hTE1, ← hcosε, ← hsinε,
            b3n9m051_chord_sq_formula r hr_pos δ ε]
        field_simp
      rw [hDE_T] at hDEdist
      exact b3n9m051_dist_eq_r_sqrt_of_sq _ r hr_pos δ ε dist_nonneg hDEdist
    set Sr : ℝ := Real.sqrt (2 - 2 * Real.cos (δ - ε)) with hSr_def
    have hS2eq : Sr ^ 2 = 2 - 2 * Real.cos (δ - ε) := by
      rw [hSr_def, Real.sq_sqrt]; nlinarith only [Real.cos_le_one (δ - ε)]
    have hq_ne_v3 : q ≠ q3 := by
      intro h; exact S.CP.v3_notin_C3 (by simpa [q3, h] using hqC3)
    have hSr_pos : 0 < Sr := by
      have hDq_pos : 0 < dist (T q3) (T q) := by
        rw [tau.dist_image]; apply mul_pos tau.scale_pos
        rw [dist_pos]; exact fun h => hq_ne_v3 h.symm
      show 0 < Real.sqrt (2 - 2 * Real.cos (δ - ε))
      have hh : Real.sqrt (2 - 2 * Real.cos (δ - ε)) = dist (T q3) (T q) / r := by
        rw [hDq_T_eq, mul_div_cancel_left₀ _ (ne_of_gt hr_pos)]
      rw [hh]; exact div_pos hDq_pos hr_pos
    have hDqsdist :
        ((T qs) 0 - (1 + r * Real.cos δ)) ^ 2 + ((T qs) 1 - r * Real.sin δ) ^ 2
          = (r * Sr) ^ 2 := by
      have h_coord : dist (T q3) (T qs) ^ 2 =
          ((T qs) 0 - (1 + r * Real.cos δ)) ^ 2 + ((T qs) 1 - r * Real.sin δ) ^ 2 := by
        rw [b3n9m051_dist_sq_eq_coord_sq_add_coord_sq, hTD0', hTD1']; ring
      rw [← h_coord, hDqs_T, hDq_T_eq]
    obtain ⟨t, hqsx, hqsy⟩ :=
      b3n9m051_qEqE_param_t r Sr (Real.cos δ) (Real.sin δ) ((T qs) 0) ((T qs) 1) hr_pos hSr_pos
        hDqsdist
    have hlower : r * Real.sin δ + r * Sr * Real.sin t < 0 := by
      rw [← hqsy]; exact hqsy_T
    have hB := qEqE_lowerArc_sameSign_flipped_of_c2Side r δ ε t Sr hr_pos
      hSr_pos hS2eq hsd hcd hse hδ0 hδπ hε0 hεπ hs2de hside hlower
    rw [← b3n9m051_qEqE_f1_sinusoid r δ ε t Sr hS2eq, ← b3n9m051_qEqE_f2_sinusoid r δ ε t Sr] at hB
    have hqsx' : (T qs) 0 = (1 + r * Real.cos δ) + r * Sr * Real.cos t := by
      rw [hqsx]
    have hqsy' : (T qs) 1 = r * Real.sin δ + r * Sr * Real.sin t := hqsy
    have hTq0' : (T q) 0 = 1 + r * Real.cos (2 * δ - ε) := by rw [hTq0, hcη_eq]
    have hTq1' : (T q) 1 = r * Real.sin (2 * δ - ε) := by rw [hTq1, hsη_eq]
    have hGparam :
        (((1 + r * Real.cos δ) + r * Sr * Real.cos t) - (1 + r * Real.cos δ)) ^ 2
            + ((r * Real.sin δ + r * Sr * Real.sin t) - r * Real.sin δ) ^ 2
          = ((1 + r * Real.cos (2 * δ - ε)) - (1 + r * Real.cos δ)) ^ 2
            + (r * Real.sin (2 * δ - ε) - r * Real.sin δ) ^ 2 := by
      have hsq : dist (T q3) (T qs) ^ 2 = dist (T q3) (T q) ^ 2 := by rw [hDqs_T]
      rw [b3n9m051_dist_sq_eq_coord_sq_add_coord_sq, b3n9m051_dist_sq_eq_coord_sq_add_coord_sq,
        hTD0', hTD1', hqsx', hqsy', hTq0', hTq1'] at hsq
      linarith [hsq]
    have hbridge2 :
        (((1 + r * Real.cos δ) + r * Sr * Real.cos t) - (1 + r * Real.cos (2 * δ - ε)))
              * ((1 + r * Real.cos δ) - 1)
            + (((r * Real.sin δ) + r * Sr * Real.sin t) - r * Real.sin (2 * δ - ε))
              * ((r * Real.sin δ) - 0)
          = (dist (T q2) (T qs) ^ 2 - dist (T q2) (T q) ^ 2) / 2 := by
      rw [b3n9m051_dist_sq_eq_coord_sq_add_coord_sq, b3n9m051_dist_sq_eq_coord_sq_add_coord_sq,
        hv2c0, hv2c1, hqsx', hqsy', hTq0', hTq1']
      linear_combination (-(1 : ℝ) / 2) * hGparam
    have hbridge1 :
        (((1 + r * Real.cos δ) + r * Sr * Real.cos t) - (1 + r * Real.cos (2 * δ - ε)))
              * (1 + r * Real.cos δ)
            + (((r * Real.sin δ) + r * Sr * Real.sin t) - r * Real.sin (2 * δ - ε))
              * (r * Real.sin δ)
          = (dist (T q1) (T qs) ^ 2 - dist (T q1) (T q) ^ 2) / 2 := by
      rw [b3n9m051_dist_sq_eq_coord_sq_add_coord_sq, b3n9m051_dist_sq_eq_coord_sq_add_coord_sq,
        hv1c0, hv1c1, hqsx', hqsy', hTq0', hTq1']
      linear_combination (-(1 : ℝ) / 2) * hGparam
    rw [hbridge2, hbridge1] at hB
    have hsc_pos : 0 < tau.scale := tau.scale_pos
    have hTB2qs : dist (T q2) (T qs) ^ 2 = tau.scale ^ 2 * dist q2 qs ^ 2 := by
      rw [tau.dist_image]; ring
    have hTB2q : dist (T q2) (T q) ^ 2 = tau.scale ^ 2 * dist q2 q ^ 2 := by
      rw [tau.dist_image]; ring
    have hTA2qs : dist (T q1) (T qs) ^ 2 = tau.scale ^ 2 * dist q1 qs ^ 2 := by
      rw [tau.dist_image]; ring
    have hTA2q : dist (T q1) (T q) ^ 2 = tau.scale ^ 2 * dist q1 q ^ 2 := by
      rw [tau.dist_image]; ring
    rw [hTB2qs, hTB2q, hTA2qs, hTA2q] at hB
    have hsc4 : 0 < tau.scale ^ 2 * tau.scale ^ 2 / 4 := by positivity
    have hfac :
        (tau.scale ^ 2 * dist q2 qs ^ 2 - tau.scale ^ 2 * dist q2 q ^ 2) / 2
            * ((tau.scale ^ 2 * dist q1 qs ^ 2 - tau.scale ^ 2 * dist q1 q ^ 2) / 2)
          = (dist q2 qs ^ 2 - dist q2 q ^ 2) * (dist q1 qs ^ 2 - dist q1 q ^ 2)
            * (tau.scale ^ 2 * tau.scale ^ 2 / 4) := by
      ring
    rw [hfac] at hB
    have hgoal :
        0 ≤ (dist q2 qs ^ 2 - dist q2 q ^ 2) * (dist q1 qs ^ 2 - dist q1 q ^ 2) :=
      nonneg_of_mul_nonneg_left hB hsc4
    simpa [q1, q2] using hgoal
  by_cases hq3pos : 0 < (Tbase q3) 1
  · exact build_from tauBase hv1Base hv2Base hq3pos
  · let Tflip : ℝ² → ℝ² := fun x => b3n9m051_flipY (Tbase x)
    let tauFlip : Problem97.CGN.SimilarityTransportData Tflip :=
      b3n9m051_similarityTransportComp tauBase b3n9m051_flipYSimilarityTransportData
    have hv1Flip : Tflip q1 = Problem97.CGN.vec2 (-1) 0 := by
      dsimp [Tflip]; rw [hv1Base]
      ext i <;> fin_cases i <;>
        simp [b3n9m051_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hv2Flip : Tflip q2 = Problem97.CGN.vec2 1 0 := by
      dsimp [Tflip]; rw [hv2Base]
      ext i <;> fin_cases i <;>
        simp [b3n9m051_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hq3Flip : 0 < (Tflip q3) 1 := by
      dsimp [Tflip]
      simp only [b3n9m051_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      have hq3neg : (Tbase q3) 1 < 0 := by
        have hle : (Tbase q3) 1 ≤ 0 := le_of_not_gt hq3pos
        exact lt_of_le_of_ne hle hq3_base_nonzero
      simpa using hq3neg
    exact build_from tauFlip hv1Flip hv2Flip hq3Flip
theorem qEqE_lowerArc_impossible
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {q qs E : ℝ²}
    (hqI3 : q ∈ S.I3) (hqsI3 : qs ∈ S.I3)
    (hDqs : dist S.triangle.v3 qs = dist S.triangle.v3 q)
    (hBq : dist S.triangle.v2 q = dist S.triangle.v2 S.triangle.v3)
    (hBE : dist S.triangle.v2 E = dist S.triangle.v2 S.triangle.v3)
    (hDE : dist S.triangle.v3 E = dist S.triangle.v3 q)
    (hsmall : dist S.triangle.v2 S.triangle.v3 < dist S.triangle.v1 S.triangle.v2)
    (hlong : dist S.triangle.v1 S.triangle.v2 < dist S.triangle.v1 S.triangle.v3)
    (hAElt : dist S.triangle.v1 E < dist S.triangle.v1 S.triangle.v2)
    (hEside :
      0 < signedArea2 E S.triangle.v1 S.triangle.v2 *
        signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2)
    (hqE : q ≠ E)
    (hcap_opp :
      (dist S.triangle.v2 qs ^ 2 - dist S.triangle.v2 q ^ 2)
        * (dist S.triangle.v1 qs ^ 2 - dist S.triangle.v1 q ^ 2) < 0) :
    False := by
  have hsign := S.qEqE_lowerArc_sameSign_of_shell hqI3 hqsI3 hDqs hBq hBE hDE
    hsmall hlong hAElt hEside hqE
  linarith [hsign, hcap_opp]
theorem qEqE_lowerArc_impossible_flipped
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {q qs E : ℝ²}
    (hqI3 : q ∈ S.I3) (hqsI3 : qs ∈ S.I3)
    (hDqs : dist S.triangle.v3 qs = dist S.triangle.v3 q)
    (hBq : dist S.triangle.v2 q = dist S.triangle.v2 S.triangle.v3)
    (hBE : dist S.triangle.v2 E = dist S.triangle.v2 S.triangle.v3)
    (hDE : dist S.triangle.v3 E = dist S.triangle.v3 q)
    (hsmall : dist S.triangle.v2 S.triangle.v3 < dist S.triangle.v1 S.triangle.v2)
    (hlong : dist S.triangle.v1 S.triangle.v2 < dist S.triangle.v1 S.triangle.v3)
    (hAEgt : dist S.triangle.v1 S.triangle.v2 < dist S.triangle.v1 E)
    (hEC2 : E ∈ S.CP.C2)
    (hEside :
      0 < signedArea2 E S.triangle.v1 S.triangle.v2 *
        signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2)
    (hqE : q ≠ E)
    (hcap_opp :
      (dist S.triangle.v2 qs ^ 2 - dist S.triangle.v2 q ^ 2)
        * (dist S.triangle.v1 qs ^ 2 - dist S.triangle.v1 q ^ 2) < 0) :
    False := by
  have hsign := S.qEqE_lowerArc_sameSign_of_shell_flipped hqI3 hqsI3 hDqs hBq hBE hDE
    hsmall hlong hAEgt hEC2 hEside hqE
  linarith [hsign, hcap_opp]
set_option maxHeartbeats 2000000 in
theorem selectorShape_v2_q_eq_v1_forces_v3
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s : ℝ}
    (hr : 0 < r)
    (hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
    (hbranch : FormBv1A2SelectorV2Qv1Packet S Z r s) :
    S.witnessClassAt_v2 s ∩ S.CP.C1 = ({S.triangle.v3} : Finset ℝ²) := by
  classical
  rcases hbranch with ⟨⟨hA2, h_a2eq, h_v2eq⟩, -, hpacket⟩
  rcases hpacket with ⟨hTcard_packet, hI2sub_packet, p, hp, hpeq, hqeq⟩
  have hforce : S.SharedCirclePointForcesV3 Z r s := by
    intro q hqnamed hqT2 hqT1
    let q1 : ℝ² := S.triangle.v1
    let q2 : ℝ² := S.triangle.v2
    let a : ℝ² := Z.a2
    let center : ℝ² := S.Packet.center
    have hqA : q ∈ A := (Finset.mem_filter.mp hqT1).1
    have haC2 : a ∈ S.CP.C2 := by
      unfold Problem97.FiniteEndpointShell.I2 at hA2
      exact (Finset.mem_erase.mp (Finset.mem_erase.mp hA2).2).2
    have haA : a ∈ A := S.CP.C2_subset haC2
    have haT1 : a ∈ S.witnessClassAt_v1 r := by
      have hamem : a ∈ ({a} : Finset ℝ²) := by simp
      rw [← h_a2eq] at hamem
      exact (Finset.mem_inter.mp hamem).1
    have haT2 : a ∈ S.witnessClassAt_v2 s := by
      exact hI2sub_packet hA2
    have hv2T1 : q2 ∈ S.witnessClassAt_v1 r := by
      have hv2mem : q2 ∈ ({q2} : Finset ℝ²) := by simp [q2]
      rw [← h_v2eq] at hv2mem
      exact (Finset.mem_inter.mp hv2mem).1
    have hv1T2 : q1 ∈ S.witnessClassAt_v2 s := by
      have hv1mem : q1 ∈ ({q1} : Finset ℝ²) := by simp [q1]
      rw [← hqeq] at hv1mem
      exact (Finset.mem_inter.mp hv1mem).1
    have hr_q1q2 : dist q1 q2 = r := by
      simpa [q1, q2] using (Finset.mem_filter.mp hv2T1).2
    have hr_q1a : dist q1 a = r := by
      simpa [q1, a] using (Finset.mem_filter.mp haT1).2
    have hr_q1q : dist q1 q = r := by
      simpa [q1] using (Finset.mem_filter.mp hqT1).2
    have hs_q2q1 : dist q2 q1 = s := by
      simpa [q1, q2] using (Finset.mem_filter.mp hv1T2).2
    have hs_q2a : dist q2 a = s := by
      simpa [q2, a] using (Finset.mem_filter.mp haT2).2
    have hs_q2q : dist q2 q = s := by
      simpa [q2] using (Finset.mem_filter.mp hqT2).2
    have ha_q1 : dist q1 a = dist q1 q2 := by
      rw [hr_q1a, hr_q1q2]
    have ha_q2 : dist q2 a = dist q1 q2 := by
      rw [hs_q2a, dist_comm q1 q2, hs_q2q1]
    have hq_q1 : dist q1 q = dist q1 q2 := by
      rw [hr_q1q, hr_q1q2]
    have hq_q2 : dist q2 q = dist q1 q2 := by
      rw [hs_q2q, dist_comm q1 q2, hs_q2q1]
    have hu : q2 - q1 ≠ 0 := by
      exact sub_ne_zero.mpr S.triangle.v12_ne.symm
    let u : ℝ² := q2 - q1
    let nvec : ℝ² := Problem97.stdOrientation.rightAngleRotation u
    let β := Problem97.stdOrientation.basisRightAngleRotation u hu
    let M : ℝ² := midpoint ℝ q1 q2
    let X : ℝ² → ℝ := fun z => β.repr (z - M) 0
    let Y : ℝ² → ℝ := fun z => β.repr (z - M) 1
    let yc : ℝ := Y center
    have hsum_pt : ∀ z : ℝ², z - M = X z • u + Y z • nvec := by
      intro z
      simpa [β, X, Y, nvec] using (β.sum_repr (z - M)).symm
    have hnorm_nvec : ‖nvec‖ = ‖u‖ := by
      simpa [nvec] using Problem97.stdOrientation.rightAngleRotation.norm_map u
    have hβu : β.repr u = Finsupp.single 0 (1 : ℝ) := by
      simpa [β, nvec] using (β.repr_self 0)
    have hβu0 : β.repr u 0 = 1 := by simp [hβu]
    have horth : inner ℝ u nvec = 0 := by
      simpa [nvec] using Problem97.stdOrientation.inner_rightAngleRotation_self u
    have hq1mid : q1 - M = (-(1 / 2 : ℝ)) • u := by
      calc
        q1 - M = (1 / 2 : ℝ) • (q1 - q2) := by
          simpa [M] using (left_sub_midpoint ℝ q1 q2)
        _ = (-(1 / 2 : ℝ)) • u := by
          rw [show q1 - q2 = -u by
            dsimp [u]
            abel_nf]
          simp [smul_neg]
    have hq2mid : q2 - M = (1 / 2 : ℝ) • u := by
      simpa [M, u] using (right_sub_midpoint ℝ q1 q2)
    have hX_q1 : X q1 = -(1 / 2 : ℝ) := by
      have h := congrArg (fun v : ℝ² => β.repr v 0) hq1mid
      change X q1 = (β.repr ((-(1 / 2 : ℝ)) • u)) 0 at h
      rw [map_smul, hβu] at h
      simpa using h
    have hY_q1 : Y q1 = 0 := by
      have h := congrArg (fun v : ℝ² => β.repr v 1) hq1mid
      change Y q1 = (β.repr ((-(1 / 2 : ℝ)) • u)) 1 at h
      rw [map_smul, hβu] at h
      simpa using h
    have hX_q2 : X q2 = (1 / 2 : ℝ) := by
      have h := congrArg (fun v : ℝ² => β.repr v 0) hq2mid
      change X q2 = (β.repr ((1 / 2 : ℝ) • u)) 0 at h
      rw [map_smul, hβu] at h
      simpa using h
    have hY_q2 : Y q2 = 0 := by
      have h := congrArg (fun v : ℝ² => β.repr v 1) hq2mid
      change Y q2 = (β.repr ((1 / 2 : ℝ) • u)) 1 at h
      rw [map_smul, hβu] at h
      simpa using h
    have hdist_sq_coeff :
        ∀ a b : ℝ, ‖a • u + b • nvec‖ ^ 2 = (a ^ 2 + b ^ 2) * ‖u‖ ^ 2 := by
      intro a b
      have horth' : inner ℝ (a • u) (b • nvec) = 0 := by
        rw [inner_smul_left, inner_smul_right, horth]
        ring
      have hnorm :
          ‖a • u + b • nvec‖ ^ 2 = ‖a • u‖ ^ 2 + ‖b • nvec‖ ^ 2 := by
        simpa [pow_two] using
          norm_add_sq_eq_norm_sq_add_norm_sq_of_inner_eq_zero (a • u) (b • nvec) horth'
      have hu_part : ‖a • u‖ ^ 2 = a ^ 2 * ‖u‖ ^ 2 := by
        calc
          ‖a • u‖ ^ 2 = (|a| * ‖u‖) ^ 2 := by rw [norm_smul, Real.norm_eq_abs]
          _ = |a| ^ 2 * ‖u‖ ^ 2 := by ring
          _ = a ^ 2 * ‖u‖ ^ 2 := by rw [sq_abs]
      have hn_part : ‖b • nvec‖ ^ 2 = b ^ 2 * ‖u‖ ^ 2 := by
        calc
          ‖b • nvec‖ ^ 2 = (|b| * ‖u‖) ^ 2 := by
            rw [norm_smul, Real.norm_eq_abs, hnorm_nvec]
          _ = |b| ^ 2 * ‖u‖ ^ 2 := by ring
          _ = b ^ 2 * ‖u‖ ^ 2 := by rw [sq_abs]
      rw [hnorm, hu_part, hn_part]
      ring
    have hpt_minus_q1 : ∀ z : ℝ²,
        z - q1 = (X z + 1 / 2) • u + Y z • nvec := by
      intro z
      calc
        z - q1 = (z - M) - (q1 - M) := by
          rw [sub_eq_add_neg, sub_eq_add_neg, sub_eq_add_neg]
          abel_nf
        _ = (X z • u + Y z • nvec) - ((-(1 / 2 : ℝ)) • u) := by
          rw [hsum_pt z, hq1mid]
        _ = (X z • u + (1 / 2 : ℝ) • u) + Y z • nvec := by
          rw [sub_eq_add_neg, neg_smul]
          abel_nf
        _ = (X z + 1 / 2) • u + Y z • nvec := by
          rw [← add_smul]
    have hpt_minus_q2 : ∀ z : ℝ²,
        z - q2 = (X z - 1 / 2) • u + Y z • nvec := by
      intro z
      calc
        z - q2 = (z - M) - (q2 - M) := by
          rw [sub_eq_add_neg, sub_eq_add_neg, sub_eq_add_neg]
          abel_nf
        _ = (X z • u + Y z • nvec) - ((1 / 2 : ℝ) • u) := by
          rw [hsum_pt z, hq2mid]
        _ = (X z • u + (-(1 / 2 : ℝ)) • u) + Y z • nvec := by
          rw [sub_eq_add_neg, neg_smul]
          abel_nf
        _ = (X z - 1 / 2) • u + Y z • nvec := by
          rw [← add_smul]
          simp [sub_eq_add_neg]
    have hpt_minus_center : ∀ z : ℝ²,
        z - center = X z • u + (Y z - yc) • nvec := by
      intro z
      have hcenter_perp : inner ℝ (center - M) u = 0 := by
        have hdist_eq : dist center q1 = dist center q2 := by
          rw [dist_comm center q1, dist_comm center q2, dist_eq_norm, dist_eq_norm]
          exact S.Packet.moser_on_boundary_1.trans S.Packet.moser_on_boundary_2.symm
        have hperp : center ∈ AffineSubspace.perpBisector q1 q2 := by
          rw [AffineSubspace.mem_perpBisector_iff_dist_eq]
          simpa using hdist_eq
        have h :=
          (AffineSubspace.mem_perpBisector_iff_inner_eq_zero
            (c := center) (p₁ := q1) (p₂ := q2)).mp hperp
        simpa [M] using h
      have hxc_zero : X center = 0 := by
        have hinner : inner ℝ (center - M) u = X center * ‖u‖ ^ 2 := by
          have horth_rev : inner ℝ nvec u = 0 := by simpa [real_inner_comm] using horth
          calc
            inner ℝ (center - M) u = inner ℝ (X center • u + Y center • nvec) u := by
              rw [hsum_pt center]
            _ = inner ℝ (X center • u) u + inner ℝ (Y center • nvec) u := by
              rw [inner_add_left]
            _ = X center * ‖u‖ ^ 2 + Y center * 0 := by
              rw [inner_smul_left, inner_smul_left, real_inner_self_eq_norm_sq, horth_rev]
              simp
            _ = X center * ‖u‖ ^ 2 := by ring
        have hsqpos : 0 < ‖u‖ ^ 2 := by
          exact sq_pos_of_ne_zero (norm_ne_zero_iff.mpr hu)
        nlinarith only [hcenter_perp, hinner, hsqpos]
      calc
        z - center = (z - M) - (center - M) := by
          rw [sub_eq_add_neg, sub_eq_add_neg, sub_eq_add_neg]
          abel_nf
        _ = (X z • u + Y z • nvec) - (Y center • nvec) := by
          rw [hsum_pt z, hsum_pt center, hxc_zero, zero_smul, zero_add]
        _ = X z • u + (Y z • nvec + (-Y center) • nvec) := by
          rw [sub_eq_add_neg, neg_smul]
          abel_nf
        _ = X z • u + (Y z - yc) • nvec := by
          rw [← add_smul]
          rfl
    have hdist_q1_sq :
        ∀ z : ℝ², dist q1 z ^ 2 = ((X z + 1 / 2) ^ 2 + Y z ^ 2) * ‖u‖ ^ 2 := by
      intro z
      rw [dist_comm, dist_eq_norm, hpt_minus_q1, hdist_sq_coeff]
    have hdist_q2_sq :
        ∀ z : ℝ², dist q2 z ^ 2 = ((X z - 1 / 2) ^ 2 + Y z ^ 2) * ‖u‖ ^ 2 := by
      intro z
      rw [dist_comm, dist_eq_norm, hpt_minus_q2, hdist_sq_coeff]
    have hdist_center_sq :
        ∀ z : ℝ², dist center z ^ 2 = (X z ^ 2 + (Y z - yc) ^ 2) * ‖u‖ ^ 2 := by
      intro z
      rw [dist_comm, dist_eq_norm, hpt_minus_center, hdist_sq_coeff]
    have hu_sq_pos : 0 < ‖u‖ ^ 2 := by
      exact sq_pos_of_ne_zero (norm_ne_zero_iff.mpr hu)
    have hcommon_coords :
        ∀ z : ℝ²,
          dist q1 z = dist q1 q2 →
          dist q2 z = dist q1 q2 →
          X z = 0 ∧ Y z ^ 2 = (3 : ℝ) / 4 := by
      intro z hz1 hz2
      have h1 : ((X z + 1 / 2) ^ 2 + Y z ^ 2) * ‖u‖ ^ 2 = ‖u‖ ^ 2 := by
        rw [← hdist_q1_sq z, hz1, dist_eq_norm]
        simpa [u, norm_sub_rev]
      have h2 : ((X z - 1 / 2) ^ 2 + Y z ^ 2) * ‖u‖ ^ 2 = ‖u‖ ^ 2 := by
        rw [← hdist_q2_sq z, hz2, dist_eq_norm]
        simpa [u, norm_sub_rev]
      have hx : X z = 0 := by
        nlinarith only [h1, h2, hu_sq_pos]
      have hy : Y z ^ 2 = (3 : ℝ) / 4 := by
        nlinarith only [h1, h2, hu_sq_pos, hx]
      exact ⟨hx, hy⟩
    have haXhY := hcommon_coords a ha_q1 ha_q2
    have hqXhY := hcommon_coords q hq_q1 hq_q2
    rcases haXhY with ⟨haX, haYsq⟩
    rcases hqXhY with ⟨hqX, hqYsq⟩
    have hy_cases : Y q = Y a ∨ Y q = -Y a := by
      apply sq_eq_sq_iff_eq_or_eq_neg.mp
      rw [hqYsq, haYsq]
    rcases Finset.mem_insert.mp hqnamed with hqa1 | hqrest
    · have hq_a1 : q = Z.a1 := by simpa using hqa1
      rcases hy_cases with hsame | hopp
      · have hqa2 : q = a := by
          have hsub : q - M = a - M := by
            calc
              q - M = X q • u + Y q • nvec := by rw [hsum_pt q]
              _ = 0 • u + Y a • nvec := by simpa [hqX, hsame]
              _ = X a • u + Y a • nvec := by simpa [haX]
              _ = a - M := by rw [hsum_pt a]
          have hadd := congrArg (fun t : ℝ² => t + M) hsub
          simpa [sub_eq_add_neg, add_assoc, add_left_comm, add_comm] using hadd
        have hqI1 : q ∈ S.I1 := by
          rw [hq_a1, Z.hI1]
          simp
        have ha_not_verts : a ∉ S.triangle.verts := by
          have ha_ne_v1 : a ≠ q1 := by
            unfold Problem97.FiniteEndpointShell.I2 at hA2
            exact (Finset.mem_erase.mp hA2).1
          have ha_ne_v3 : a ≠ S.triangle.v3 := by
            unfold Problem97.FiniteEndpointShell.I2 at hA2
            exact (Finset.mem_erase.mp (Finset.mem_erase.mp hA2).2).1
          have ha_ne_v2 : a ≠ q2 := by
            intro h
            have : q2 ∈ S.CP.C2 := by simpa [h] using haC2
            exact S.CP.v2_notin_C2 this
          simp [Problem97.MoserTriangle.verts, q1, q2, ha_ne_v1, ha_ne_v2, ha_ne_v3]
        have hone_a := S.CP.nonmoser_in_one a haA ha_not_verts
        have haI1 : a ∈ S.I1 := by simpa [hqa2] using hqI1
        have haC1 : a ∈ S.CP.C1 := by
          unfold Problem97.FiniteEndpointShell.I1 at haI1
          exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase haI1)
        have : False := by
          have hone_a' : (2 + if a ∈ S.CP.C3 then 1 else 0) = 1 := by
            simpa [haC1, haC2] using hone_a
          by_cases haC3 : a ∈ S.CP.C3 <;> simp [haC3] at hone_a'
        exact False.elim this
      · have hyc_pos : 0 < Y a * yc := by
          have hdisk_a' : ‖a - center‖ ≤ S.Packet.radius := by
            simpa [center] using S.Packet.disk_contains_A a haA
          have hdisk_a : dist center a ≤ S.Packet.radius := by
            rw [dist_eq_norm, norm_sub_rev]
            exact hdisk_a'
          have hradius : dist center q1 = S.Packet.radius := by
            rw [dist_comm, dist_eq_norm]
            exact S.Packet.moser_on_boundary_1
          have hdist_sq : dist center a ^ 2 ≤ dist center q1 ^ 2 := by
            have hnonneg_a : 0 ≤ dist center a := dist_nonneg
            have hnonneg_q1 : 0 ≤ dist center q1 := dist_nonneg
            nlinarith only [hdisk_a, hradius, hnonneg_a, hnonneg_q1]
          rw [hdist_center_sq a, hdist_center_sq q1, haX, hX_q1, hY_q1] at hdist_sq
          nlinarith only [hu_sq_pos, hdist_sq, haYsq]
        have hq_out : dist center q > S.Packet.radius := by
          have hradius : dist center q1 = S.Packet.radius := by
            rw [dist_comm, dist_eq_norm]
            exact S.Packet.moser_on_boundary_1
          have hdist_sq_q :
              dist center q ^ 2 > S.Packet.radius ^ 2 := by
            rw [hdist_center_sq q]
            have hradius_sq :
                S.Packet.radius ^ 2 = ((1 / 2 : ℝ) ^ 2 + yc ^ 2) * ‖u‖ ^ 2 := by
              have hq1sq := hdist_center_sq q1
              rw [hradius, hX_q1, hY_q1] at hq1sq
              nlinarith only [hq1sq]
            rw [hradius_sq]
            have hqY : Y q = -Y a := by
              exact hopp
            rw [hqX, hqY]
            nlinarith only [hu_sq_pos, haYsq, hyc_pos]
          have hrad_nn : 0 ≤ S.Packet.radius := le_of_lt S.Packet.radius_pos
          have hdist_nn : 0 ≤ dist center q := dist_nonneg
          nlinarith only [hdist_sq_q, hrad_nn, hdist_nn]
        have hdisk_q' : ‖q - center‖ ≤ S.Packet.radius := by
          simpa [center] using S.Packet.disk_contains_A q hqA
        have hdisk_q : dist center q ≤ S.Packet.radius := by
          rw [dist_eq_norm, norm_sub_rev]
          exact hdisk_q'
        exact False.elim (not_le_of_gt hq_out hdisk_q)
    rcases Finset.mem_insert.mp hqrest with hqb1 | hqv3
    · have hq_b1 : q = Z.b1 := by simpa using hqb1
      rcases hy_cases with hsame | hopp
      · have hqb2 : q = a := by
          have hsub : q - M = a - M := by
            calc
              q - M = X q • u + Y q • nvec := by rw [hsum_pt q]
              _ = 0 • u + Y a • nvec := by simpa [hqX, hsame]
              _ = X a • u + Y a • nvec := by simpa [haX]
              _ = a - M := by rw [hsum_pt a]
          have hadd := congrArg (fun t : ℝ² => t + M) hsub
          simpa [sub_eq_add_neg, add_assoc, add_left_comm, add_comm] using hadd
        have hqI1 : q ∈ S.I1 := by
          rw [hq_b1, Z.hI1]
          simp
        have ha_not_verts : a ∉ S.triangle.verts := by
          have ha_ne_v1 : a ≠ q1 := by
            unfold Problem97.FiniteEndpointShell.I2 at hA2
            exact (Finset.mem_erase.mp hA2).1
          have ha_ne_v3 : a ≠ S.triangle.v3 := by
            unfold Problem97.FiniteEndpointShell.I2 at hA2
            exact (Finset.mem_erase.mp (Finset.mem_erase.mp hA2).2).1
          have ha_ne_v2 : a ≠ q2 := by
            intro h
            have : q2 ∈ S.CP.C2 := by simpa [h] using haC2
            exact S.CP.v2_notin_C2 this
          simp [Problem97.MoserTriangle.verts, q1, q2, ha_ne_v1, ha_ne_v2, ha_ne_v3]
        have hone_a := S.CP.nonmoser_in_one a haA ha_not_verts
        have haI1 : a ∈ S.I1 := by simpa [hqb2] using hqI1
        have haC1 : a ∈ S.CP.C1 := by
          unfold Problem97.FiniteEndpointShell.I1 at haI1
          exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase haI1)
        have : False := by
          have hone_a' : (2 + if a ∈ S.CP.C3 then 1 else 0) = 1 := by
            simpa [haC1, haC2] using hone_a
          by_cases haC3 : a ∈ S.CP.C3 <;> simp [haC3] at hone_a'
        exact False.elim this
      · have hyc_pos : 0 < Y a * yc := by
          have hdisk_a' : ‖a - center‖ ≤ S.Packet.radius := by
            simpa [center] using S.Packet.disk_contains_A a haA
          have hdisk_a : dist center a ≤ S.Packet.radius := by
            rw [dist_eq_norm, norm_sub_rev]
            exact hdisk_a'
          have hradius : dist center q1 = S.Packet.radius := by
            rw [dist_comm, dist_eq_norm]
            exact S.Packet.moser_on_boundary_1
          have hdist_sq : dist center a ^ 2 ≤ dist center q1 ^ 2 := by
            have hnonneg_a : 0 ≤ dist center a := dist_nonneg
            have hnonneg_q1 : 0 ≤ dist center q1 := dist_nonneg
            nlinarith only [hdisk_a, hradius, hnonneg_a, hnonneg_q1]
          rw [hdist_center_sq a, hdist_center_sq q1, haX, hX_q1, hY_q1] at hdist_sq
          nlinarith only [hu_sq_pos, hdist_sq, haYsq]
        have hq_out : dist center q > S.Packet.radius := by
          have hradius : dist center q1 = S.Packet.radius := by
            rw [dist_comm, dist_eq_norm]
            exact S.Packet.moser_on_boundary_1
          have hdist_sq_q :
              dist center q ^ 2 > S.Packet.radius ^ 2 := by
            rw [hdist_center_sq q]
            have hradius_sq :
                S.Packet.radius ^ 2 = ((1 / 2 : ℝ) ^ 2 + yc ^ 2) * ‖u‖ ^ 2 := by
              have hq1sq := hdist_center_sq q1
              rw [hradius, hX_q1, hY_q1] at hq1sq
              nlinarith only [hq1sq]
            rw [hqX, hopp, hradius_sq]
            nlinarith only [hu_sq_pos, haYsq, hyc_pos]
          have hrad_nn : 0 ≤ S.Packet.radius := le_of_lt S.Packet.radius_pos
          have hdist_nn : 0 ≤ dist center q := dist_nonneg
          nlinarith only [hdist_sq_q, hrad_nn, hdist_nn]
        have hdisk_q' : ‖q - center‖ ≤ S.Packet.radius := by
          simpa [center] using S.Packet.disk_contains_A q hqA
        have hdisk_q : dist center q ≤ S.Packet.radius := by
          rw [dist_eq_norm, norm_sub_rev]
          exact hdisk_q'
        exact False.elim (not_le_of_gt hq_out hdisk_q)
    simpa using hqv3
  have hcore := S.coreSelector_v1 hr hcard
  rcases hcore with ⟨-, hI1sub, -, -⟩
  have hpT2 : p ∈ S.witnessClassAt_v2 s := by
    have hpmem : p ∈ ({p} : Finset ℝ²) := by simp
    rw [← hpeq] at hpmem
    exact (Finset.mem_inter.mp hpmem).1
  rcases Finset.mem_insert.mp hp with hpa1 | hp
  · have hpa1' : p = Z.a1 := by simpa using hpa1
    have ha1I1 : Z.a1 ∈ S.I1 := by
      rw [Z.hI1]
      simp
    have ha1T1 : Z.a1 ∈ S.witnessClassAt_v1 r := hI1sub ha1I1
    have hpv3 : p = S.triangle.v3 := hforce p hp hpT2 (by simpa [hpa1'] using ha1T1)
    simpa [hpv3] using hpeq
  rcases Finset.mem_insert.mp hp with hpb1 | hpv3
  · have hpb1' : p = Z.b1 := by simpa using hpb1
    have hb1I1 : Z.b1 ∈ S.I1 := by
      rw [Z.hI1]
      simp
    have hb1T1 : Z.b1 ∈ S.witnessClassAt_v1 r := hI1sub hb1I1
    have hp123 : p ∈ ({Z.a1, Z.b1, S.triangle.v3} : Finset ℝ²) := by
      simp [hpb1']
    have hpv3 : p = S.triangle.v3 := hforce p hp123 hpT2 (by simpa [hpb1'] using hb1T1)
    simpa [hpv3] using hpeq
  have hpv3' : p = S.triangle.v3 := by simpa using hpv3
  simpa [hpv3'] using hpeq
theorem selectorShape_v2_q_eq_v1_exact_packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s : ℝ}
    (hr : 0 < r)
    (hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
    (hbranch : FormBv1A2SelectorV2Qv1Packet S Z r s) :
    S.witnessClassAt_v2 s =
      insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²)) := by
  classical
  let T := S.witnessClassAt_v2 s
  have hC1eq :
      T ∩ S.CP.C1 = ({S.triangle.v3} : Finset ℝ²) :=
    S.selectorShape_v2_q_eq_v1_forces_v3 (Z := Z) (r := r) (s := s) hr hcard hbranch
  rcases hbranch with ⟨⟨-, _, _⟩, _, hpacket⟩
  rcases hpacket with ⟨hTcard, hI2sub, _, _, _, hqeq⟩
  have ha2I2 : Z.a2 ∈ S.I2 := by
    rw [Z.hI2]
    simp
  have hb2I2 : Z.b2 ∈ S.I2 := by
    rw [Z.hI2]
    simp
  have ha2T : Z.a2 ∈ T := hI2sub ha2I2
  have hb2T : Z.b2 ∈ T := hI2sub hb2I2
  have hv3T : S.triangle.v3 ∈ T := by
    have hv3mem : S.triangle.v3 ∈ ({S.triangle.v3} : Finset ℝ²) := by simp
    rw [← hC1eq] at hv3mem
    exact (Finset.mem_inter.mp hv3mem).1
  have hv1T : S.triangle.v1 ∈ T := by
    have hv1mem : S.triangle.v1 ∈ ({S.triangle.v1} : Finset ℝ²) := by simp
    rw [← hqeq] at hv1mem
    exact (Finset.mem_inter.mp hv1mem).1
  have ha2_ne_b2 : Z.a2 ≠ Z.b2 := by
    have hI2card : ({Z.a2, Z.b2} : Finset ℝ²).card = 2 := by
      simpa [Z.hI2] using S.I2_card_eq_two
    intro h
    simp [h] at hI2card
  have ha2_ne_v1 : Z.a2 ≠ S.triangle.v1 := by
    unfold Problem97.FiniteEndpointShell.I2 at ha2I2
    exact (Finset.mem_erase.mp ha2I2).1
  have hb2_ne_v1 : Z.b2 ≠ S.triangle.v1 := by
    unfold Problem97.FiniteEndpointShell.I2 at hb2I2
    exact (Finset.mem_erase.mp hb2I2).1
  have ha2_ne_v3 : Z.a2 ≠ S.triangle.v3 := by
    unfold Problem97.FiniteEndpointShell.I2 at ha2I2
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp ha2I2).2).1
  have hb2_ne_v3 : Z.b2 ≠ S.triangle.v3 := by
    unfold Problem97.FiniteEndpointShell.I2 at hb2I2
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hb2I2).2).1
  have hUsub :
      insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²)) ⊆ T := by
    intro x hx
    simp at hx
    rcases hx with rfl | rfl | rfl | rfl
    · exact ha2T
    · exact hb2T
    · exact hv3T
    · exact hv1T
  have hUcard :
      (insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²))).card = 4 := by
    simp [ha2_ne_b2, ha2_ne_v1, hb2_ne_v1, ha2_ne_v3, hb2_ne_v3, S.triangle.v13_ne,
      S.triangle.v13_ne.symm]
  have hTle :
      T.card ≤ (insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²))).card := by
    rw [hTcard, hUcard]
  exact (Finset.eq_of_subset_of_card_le hUsub hTle).symm
theorem selectorShape_v2_q_eq_v1_exact_packet_of_b2
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s : ℝ}
    (hr : 0 < r)
    (hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
    (hbranch : FormBv1B2SelectorV2Qv1Packet S Z r s) :
    S.witnessClassAt_v2 s =
      insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²)) := by
  rcases hbranch with ⟨⟨hb2I2, hb2eq, hv2eq⟩, hs, hpacket⟩
  have hbranch' : FormBv1A2SelectorV2Qv1Packet S (Z.swapI2) r s := by
    refine ⟨?_, hs, ?_⟩
    · refine ⟨?_, ?_, ?_⟩
      · simpa [ZeroDefectCapLayout.swapI2] using hb2I2
      · simpa [FormBv1A2Packet, ZeroDefectCapLayout.swapI2] using hb2eq
      · simpa [FormBv1A2Packet, ZeroDefectCapLayout.swapI2] using hv2eq
    · simpa [SelectorV2Qv1Packet, ZeroDefectCapLayout.swapI2] using hpacket
  have hswap :=
    S.selectorShape_v2_q_eq_v1_exact_packet (Z := Z.swapI2) (r := r) (s := s) hr hcard hbranch'
  ext x
  simpa [ZeroDefectCapLayout.swapI2, hswap, Finset.mem_insert, Finset.mem_singleton,
    or_left_comm, or_assoc]
theorem v1v3_longer_than_base_of_exact_packet_of_b2
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s : ℝ}
    (hbranch : FormBv1B2SelectorV2Qv1Packet S Z r s)
    (hexact : S.witnessClassAt_v2 s =
      insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²))) :
    dist S.triangle.v1 S.triangle.v2 < dist S.triangle.v1 S.triangle.v3 := by
  rcases hbranch with ⟨⟨hb2I2, hb2eq, hv2eq⟩, hs, hpacket⟩
  have hbranch' : FormBv1A2SelectorV2Qv1Packet S (Z.swapI2) r s := by
    refine ⟨?_, hs, ?_⟩
    · refine ⟨?_, ?_, ?_⟩
      · simpa [ZeroDefectCapLayout.swapI2] using hb2I2
      · simpa [FormBv1A2Packet, ZeroDefectCapLayout.swapI2] using hb2eq
      · simpa [FormBv1A2Packet, ZeroDefectCapLayout.swapI2] using hv2eq
    · simpa [SelectorV2Qv1Packet, ZeroDefectCapLayout.swapI2] using hpacket
  have hswap :
      S.witnessClassAt_v2 s =
        insert (Z.swapI2).a2
          (insert (Z.swapI2).b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²)) := by
    ext x
    simpa [ZeroDefectCapLayout.swapI2, hexact, Finset.mem_insert, Finset.mem_singleton,
      or_left_comm, or_assoc]
  simpa [ZeroDefectCapLayout.swapI2] using
    (S.v1v3_longer_than_base_of_exact_packet (Z := Z.swapI2) hbranch' hswap)
theorem selectorShape_v3_q_eq_v1_impossible_of_b2_exact_packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s t : ℝ}
    (hbranch : FormBv1B2SelectorV2Qv1Packet S Z r s)
    (hexact : S.witnessClassAt_v2 s =
      insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²)))
    (hpacket3 : SelectorV3Qv1Packet S Z t) :
    False := by
  have hlong := S.v1v3_longer_than_base_of_exact_packet_of_b2 Z hbranch hexact
  have hv3T : S.triangle.v3 ∈ S.witnessClassAt_v2 s := by
    have hv3mem : S.triangle.v3 ∈ ({S.triangle.v3} : Finset ℝ²) := by simp
    simpa [hexact] using hv3mem
  have hv1T : S.triangle.v1 ∈ S.witnessClassAt_v2 s := by
    have hv1mem : S.triangle.v1 ∈ ({S.triangle.v1} : Finset ℝ²) := by simp
    simpa [hexact] using hv1mem
  have hv3dist : dist S.triangle.v2 S.triangle.v3 = s := by
    simpa using (Finset.mem_filter.mp hv3T).2
  have hv1dist : dist S.triangle.v2 S.triangle.v1 = s := by
    simpa using (Finset.mem_filter.mp hv1T).2
  have hv2v1 : dist S.triangle.v3 S.triangle.v2 < dist S.triangle.v3 S.triangle.v1 := by
    calc
      dist S.triangle.v3 S.triangle.v2 = dist S.triangle.v2 S.triangle.v3 := by rw [dist_comm]
      _ = dist S.triangle.v2 S.triangle.v1 := by rw [hv3dist, hv1dist]
      _ = dist S.triangle.v1 S.triangle.v2 := by rw [dist_comm]
      _ < dist S.triangle.v1 S.triangle.v3 := hlong
      _ = dist S.triangle.v3 S.triangle.v1 := by rw [dist_comm]
  exact S.selectorShape_v3_q_eq_v1_impossible Z hpacket3 hv2v1
theorem n4c_forms_v1
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {r : ℝ}
    (hr : 0 < r) (hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
    (hesc : ¬ S.witnessClassAt_v1 r ⊆ S.CP.C1) :
    S.IsFormA_v1 r ∨ S.IsFormB_v1 r ∨ S.IsFormC_v1 r := by
  classical
  let T : Finset ℝ² := S.witnessClassAt_v1 r
  have hcore := S.coreSelector_v1 hr hcard
  rcases hcore with ⟨hTcard, hI1sub, hC2le, hC3le⟩
  have hTcard' : T.card = 4 := by simpa [T] using hTcard
  have hC2le' : (T ∩ S.CP.C2).card ≤ 1 := by simpa [T] using hC2le
  have hC3le' : (T ∩ S.CP.C3).card ≤ 1 := by simpa [T] using hC3le
  have hI1two : S.I1.card = 2 := S.I1_card_eq_two
  have hI1sub' : S.I1 ⊆ T ∩ S.I1 := by
    intro z hz
    exact Finset.mem_inter.mpr ⟨hI1sub hz, hz⟩
  have hTminus_eq_two : (T \ S.I1).card = 2 := by
    have hsplit : (T \ S.I1).card + (T ∩ S.I1).card = T.card := by
      simpa [T, Finset.inter_comm] using Finset.card_sdiff_add_card_inter T S.I1
    have hI1ge : S.I1.card ≤ (T ∩ S.I1).card := Finset.card_le_card hI1sub'
    have hI1le : (T ∩ S.I1).card ≤ S.I1.card := Finset.card_le_card Finset.inter_subset_right
    omega
  have hcover :
      T \ S.I1 ⊆ (T ∩ S.CP.C2) ∪ (T ∩ S.CP.C3) := by
    intro x hx
    rcases Finset.mem_sdiff.mp hx with ⟨hxT, hxnotI1⟩
    have hxA : x ∈ A := (Finset.mem_filter.mp hxT).1
    by_cases hxv3 : x = S.triangle.v3
    · apply Finset.mem_union_left
      exact Finset.mem_inter.mpr ⟨hxT, by simpa [hxv3] using S.CP.v3_mem_C2⟩
    by_cases hxv2 : x = S.triangle.v2
    · apply Finset.mem_union_right
      exact Finset.mem_inter.mpr ⟨hxT, by simpa [hxv2] using S.CP.v2_mem_C3⟩
    by_cases hxv1 : x = S.triangle.v1
    · have hv1not : S.triangle.v1 ∉ T := by
        intro hv1T
        have hv1eq : dist S.triangle.v1 S.triangle.v1 = r :=
          (Finset.mem_filter.mp hv1T).2
        have h0r : (0 : ℝ) = r := by simpa using hv1eq
        nlinarith only [hr, h0r]
      exact False.elim (hv1not (hxv1 ▸ hxT))
    have hxnonmoser : x ∉ S.triangle.verts := by
      simp [Problem97.MoserTriangle.verts, hxv1, hxv2, hxv3]
    have hxnotC1 : x ∉ S.CP.C1 := by
      intro hxC1
      have hxI1 : x ∈ S.I1 := by
        unfold I1
        exact Finset.mem_erase.mpr ⟨hxv3, Finset.mem_erase.mpr ⟨hxv2, hxC1⟩⟩
      exact hxnotI1 hxI1
    have hone := S.CP.nonmoser_in_one x hxA hxnonmoser
    by_cases hxC2 : x ∈ S.CP.C2
    · exact Finset.mem_union.mpr (Or.inl (Finset.mem_inter.mpr ⟨hxT, hxC2⟩))
    · have hxC3 : x ∈ S.CP.C3 := by
        by_cases hxC3 : x ∈ S.CP.C3
        · exact hxC3
        · have : (0 : ℕ) = 1 := by
            simpa [hxnotC1, hxC2, hxC3] using hone
          omega
      exact Finset.mem_union.mpr (Or.inr (Finset.mem_inter.mpr ⟨hxT, hxC3⟩))
  have hUnion_le :
      ((T ∩ S.CP.C2) ∪ (T ∩ S.CP.C3)).card ≤ 2 := by
    calc
      ((T ∩ S.CP.C2) ∪ (T ∩ S.CP.C3)).card
          ≤ (T ∩ S.CP.C2).card + (T ∩ S.CP.C3).card := Finset.card_union_le _ _
      _ ≤ 1 + 1 := by omega
      _ = 2 := by norm_num
  have hUnion_eq_two :
      ((T ∩ S.CP.C2) ∪ (T ∩ S.CP.C3)).card = 2 := by
    have hTminus_le : (T \ S.I1).card ≤ ((T ∩ S.CP.C2) ∪ (T ∩ S.CP.C3)).card :=
      Finset.card_le_card hcover
    omega
  have hsum_eq_two : (T ∩ S.CP.C2).card + (T ∩ S.CP.C3).card = 2 := by
    have hUnion_le_sum : ((T ∩ S.CP.C2) ∪ (T ∩ S.CP.C3)).card ≤
        (T ∩ S.CP.C2).card + (T ∩ S.CP.C3).card := Finset.card_union_le _ _
    omega
  have hC2eq1 : (T ∩ S.CP.C2).card = 1 := by
    omega
  have hC3eq1 : (T ∩ S.CP.C3).card = 1 := by
    omega
  obtain ⟨x, hxeq⟩ := Finset.card_eq_one.mp hC2eq1
  obtain ⟨y, hyeq⟩ := Finset.card_eq_one.mp hC3eq1
  have hxT : x ∈ T := by
    have hxmem : x ∈ ({x} : Finset ℝ²) := by simp
    rw [← hxeq] at hxmem
    exact (Finset.mem_inter.mp hxmem).1
  have hyT : y ∈ T := by
    have hymem : y ∈ ({y} : Finset ℝ²) := by simp
    rw [← hyeq] at hymem
    exact (Finset.mem_inter.mp hymem).1
  have hxC2 : x ∈ S.CP.C2 := by
    have hxmem : x ∈ ({x} : Finset ℝ²) := by simp
    rw [← hxeq] at hxmem
    exact (Finset.mem_inter.mp hxmem).2
  have hyC3 : y ∈ S.CP.C3 := by
    have hymem : y ∈ ({y} : Finset ℝ²) := by simp
    rw [← hyeq] at hymem
    exact (Finset.mem_inter.mp hymem).2
  have hv1notT : S.triangle.v1 ∉ T := by
    intro hv1T
    have hv1eq : dist S.triangle.v1 S.triangle.v1 = r := (Finset.mem_filter.mp hv1T).2
    have h0r : (0 : ℝ) = r := by simpa using hv1eq
    nlinarith only [hr, h0r]
  have hx_ne_v1 : x ≠ S.triangle.v1 := by
    intro h
    exact hv1notT (h ▸ hxT)
  have hy_ne_v1 : y ≠ S.triangle.v1 := by
    intro h
    exact hv1notT (h ▸ hyT)
  by_cases hxv3 : x = S.triangle.v3
  · by_cases hyv2 : y = S.triangle.v2
    · have hsubC1 : T ⊆ S.CP.C1 := by
        intro z hz
        by_cases hzI1 : z ∈ S.I1
        · unfold I1 at hzI1
          exact (Finset.mem_erase.mp (Finset.mem_erase.mp hzI1).2).2
        · have hzout : z ∈ T \ S.I1 := Finset.mem_sdiff.mpr ⟨hz, hzI1⟩
          have hzcover := hcover hzout
          rcases Finset.mem_union.mp hzcover with hzC2 | hzC3
          · have : z = x := by
              rw [hxeq] at hzC2
              simpa using hzC2
            simpa [this, hxv3] using S.CP.v3_mem_C1
          · have : z = y := by
              rw [hyeq] at hzC3
              simpa using hzC3
            simpa [this, hyv2] using S.CP.v2_mem_C1
      exact False.elim (hesc hsubC1)
    · have hyI3 : y ∈ S.I3 := by
        unfold I3
        exact Finset.mem_erase.mpr ⟨hyv2, Finset.mem_erase.mpr ⟨hy_ne_v1, hyC3⟩⟩
      exact Or.inr (Or.inr ⟨y, hyI3, by simpa [T, hxv3] using hxeq, by simpa [T] using hyeq⟩)
  · by_cases hyv2 : y = S.triangle.v2
    · have hxI2 : x ∈ S.I2 := by
        unfold I2
        exact Finset.mem_erase.mpr ⟨hx_ne_v1, Finset.mem_erase.mpr ⟨hxv3, hxC2⟩⟩
      exact Or.inr (Or.inl ⟨x, hxI2, by simpa [T] using hxeq, by simpa [T, hyv2] using hyeq⟩)
    · have hxI2 : x ∈ S.I2 := by
        unfold I2
        exact Finset.mem_erase.mpr ⟨hx_ne_v1, Finset.mem_erase.mpr ⟨hxv3, hxC2⟩⟩
      have hyI3 : y ∈ S.I3 := by
        unfold I3
        exact Finset.mem_erase.mpr ⟨hyv2, Finset.mem_erase.mpr ⟨hy_ne_v1, hyC3⟩⟩
      exact Or.inl ⟨x, y, hxI2, hyI3, by simpa [T] using hxeq, by simpa [T] using hyeq⟩
theorem n4c_forms_v2
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {r : ℝ}
    (hr : 0 < r) (hcard : 4 ≤ (S.witnessClassAt_v2 r).card)
    (hesc : ¬ S.witnessClassAt_v2 r ⊆ S.CP.C2) :
    S.IsFormA_v2 r ∨ S.IsFormB_v2 r ∨ S.IsFormC_v2 r := by
  classical
  let T : Finset ℝ² := S.witnessClassAt_v2 r
  have hcore := S.coreSelector_v2 hr hcard
  rcases hcore with ⟨hTcard, hI2sub, hC1le, hC3le⟩
  have hTcard' : T.card = 4 := by simpa [T] using hTcard
  have hC1le' : (T ∩ S.CP.C1).card ≤ 1 := by simpa [T] using hC1le
  have hC3le' : (T ∩ S.CP.C3).card ≤ 1 := by simpa [T] using hC3le
  have hI2two : S.I2.card = 2 := S.I2_card_eq_two
  have hI2sub' : S.I2 ⊆ T ∩ S.I2 := by
    intro z hz
    exact Finset.mem_inter.mpr ⟨hI2sub hz, hz⟩
  have hTminus_eq_two : (T \ S.I2).card = 2 := by
    have hsplit : (T \ S.I2).card + (T ∩ S.I2).card = T.card := by
      simpa [T, Finset.inter_comm] using Finset.card_sdiff_add_card_inter T S.I2
    have hI2ge : S.I2.card ≤ (T ∩ S.I2).card := Finset.card_le_card hI2sub'
    have hI2le : (T ∩ S.I2).card ≤ S.I2.card := Finset.card_le_card Finset.inter_subset_right
    omega
  have hcover :
      T \ S.I2 ⊆ (T ∩ S.CP.C1) ∪ (T ∩ S.CP.C3) := by
    intro x hx
    rcases Finset.mem_sdiff.mp hx with ⟨hxT, hxnotI2⟩
    have hxA : x ∈ A := (Finset.mem_filter.mp hxT).1
    by_cases hxv1 : x = S.triangle.v1
    · apply Finset.mem_union_right
      exact Finset.mem_inter.mpr ⟨hxT, by simpa [hxv1] using S.CP.v1_mem_C3⟩
    by_cases hxv3 : x = S.triangle.v3
    · apply Finset.mem_union_left
      exact Finset.mem_inter.mpr ⟨hxT, by simpa [hxv3] using S.CP.v3_mem_C1⟩
    by_cases hxv2 : x = S.triangle.v2
    · have hv2not : S.triangle.v2 ∉ T := by
        intro hv2T
        have hv2eq : dist S.triangle.v2 S.triangle.v2 = r :=
          (Finset.mem_filter.mp hv2T).2
        have h0r : (0 : ℝ) = r := by simpa using hv2eq
        nlinarith only [hr, h0r]
      exact False.elim (hv2not (hxv2 ▸ hxT))
    have hxnonmoser : x ∉ S.triangle.verts := by
      simp [Problem97.MoserTriangle.verts, hxv1, hxv2, hxv3]
    have hxnotC2 : x ∉ S.CP.C2 := by
      intro hxC2
      have hxI2 : x ∈ S.I2 := by
        unfold I2
        exact Finset.mem_erase.mpr ⟨hxv1, Finset.mem_erase.mpr ⟨hxv3, hxC2⟩⟩
      exact hxnotI2 hxI2
    have hone := S.CP.nonmoser_in_one x hxA hxnonmoser
    by_cases hxC1 : x ∈ S.CP.C1
    · exact Finset.mem_union.mpr (Or.inl (Finset.mem_inter.mpr ⟨hxT, hxC1⟩))
    · have hxC3 : x ∈ S.CP.C3 := by
        by_cases hxC3 : x ∈ S.CP.C3
        · exact hxC3
        · have : (0 : ℕ) = 1 := by
            simpa [hxC1, hxnotC2, hxC3] using hone
          omega
      exact Finset.mem_union.mpr (Or.inr (Finset.mem_inter.mpr ⟨hxT, hxC3⟩))
  have hUnion_le :
      ((T ∩ S.CP.C1) ∪ (T ∩ S.CP.C3)).card ≤ 2 := by
    calc
      ((T ∩ S.CP.C1) ∪ (T ∩ S.CP.C3)).card
          ≤ (T ∩ S.CP.C1).card + (T ∩ S.CP.C3).card := Finset.card_union_le _ _
      _ ≤ 1 + 1 := by omega
      _ = 2 := by norm_num
  have hUnion_eq_two :
      ((T ∩ S.CP.C1) ∪ (T ∩ S.CP.C3)).card = 2 := by
    have hTminus_le : (T \ S.I2).card ≤ ((T ∩ S.CP.C1) ∪ (T ∩ S.CP.C3)).card :=
      Finset.card_le_card hcover
    omega
  have hsum_eq_two : (T ∩ S.CP.C1).card + (T ∩ S.CP.C3).card = 2 := by
    have hUnion_le_sum : ((T ∩ S.CP.C1) ∪ (T ∩ S.CP.C3)).card ≤
        (T ∩ S.CP.C1).card + (T ∩ S.CP.C3).card := Finset.card_union_le _ _
    omega
  have hC1eq1 : (T ∩ S.CP.C1).card = 1 := by omega
  have hC3eq1 : (T ∩ S.CP.C3).card = 1 := by omega
  obtain ⟨y, hyeq⟩ := Finset.card_eq_one.mp hC1eq1
  obtain ⟨x, hxeq⟩ := Finset.card_eq_one.mp hC3eq1
  have hxT : x ∈ T := by
    have hxmem : x ∈ ({x} : Finset ℝ²) := by simp
    rw [← hxeq] at hxmem
    exact (Finset.mem_inter.mp hxmem).1
  have hyT : y ∈ T := by
    have hymem : y ∈ ({y} : Finset ℝ²) := by simp
    rw [← hyeq] at hymem
    exact (Finset.mem_inter.mp hymem).1
  have hxC3 : x ∈ S.CP.C3 := by
    have hxmem : x ∈ ({x} : Finset ℝ²) := by simp
    rw [← hxeq] at hxmem
    exact (Finset.mem_inter.mp hxmem).2
  have hyC1 : y ∈ S.CP.C1 := by
    have hymem : y ∈ ({y} : Finset ℝ²) := by simp
    rw [← hyeq] at hymem
    exact (Finset.mem_inter.mp hymem).2
  have hv2notT : S.triangle.v2 ∉ T := by
    intro hv2T
    have hv2eq : dist S.triangle.v2 S.triangle.v2 = r := (Finset.mem_filter.mp hv2T).2
    have h0r : (0 : ℝ) = r := by simpa using hv2eq
    nlinarith only [hr, h0r]
  have hx_ne_v2 : x ≠ S.triangle.v2 := by
    intro h
    exact hv2notT (h ▸ hxT)
  have hy_ne_v2 : y ≠ S.triangle.v2 := by
    intro h
    exact hv2notT (h ▸ hyT)
  by_cases hxv1 : x = S.triangle.v1
  · by_cases hyv3 : y = S.triangle.v3
    · have hsubC2 : T ⊆ S.CP.C2 := by
        intro z hz
        by_cases hzI2 : z ∈ S.I2
        · unfold I2 at hzI2
          exact (Finset.mem_erase.mp (Finset.mem_erase.mp hzI2).2).2
        · have hzout : z ∈ T \ S.I2 := Finset.mem_sdiff.mpr ⟨hz, hzI2⟩
          have hzcover := hcover hzout
          rcases Finset.mem_union.mp hzcover with hzC1 | hzC3
          · have : z = y := by
              rw [hyeq] at hzC1
              simpa using hzC1
            simpa [this, hyv3] using S.CP.v3_mem_C2
          · have : z = x := by
              rw [hxeq] at hzC3
              simpa using hzC3
            simpa [this, hxv1] using S.CP.v1_mem_C2
      exact False.elim (hesc hsubC2)
    · have hyI1 : y ∈ S.I1 := by
        unfold I1
        exact Finset.mem_erase.mpr ⟨hyv3, Finset.mem_erase.mpr ⟨hy_ne_v2, hyC1⟩⟩
      exact Or.inr (Or.inr ⟨y, hyI1, by simpa [T, hxv1] using hxeq, by simpa [T] using hyeq⟩)
  · by_cases hyv3 : y = S.triangle.v3
    · have hxI3 : x ∈ S.I3 := by
        unfold I3
        exact Finset.mem_erase.mpr ⟨hx_ne_v2, Finset.mem_erase.mpr ⟨hxv1, hxC3⟩⟩
      exact Or.inr (Or.inl ⟨x, hxI3, by simpa [T] using hxeq, by simpa [T, hyv3] using hyeq⟩)
    · have hxI3 : x ∈ S.I3 := by
        unfold I3
        exact Finset.mem_erase.mpr ⟨hx_ne_v2, Finset.mem_erase.mpr ⟨hxv1, hxC3⟩⟩
      have hyI1 : y ∈ S.I1 := by
        unfold I1
        exact Finset.mem_erase.mpr ⟨hyv3, Finset.mem_erase.mpr ⟨hy_ne_v2, hyC1⟩⟩
      exact Or.inl ⟨x, y, hxI3, hyI1, by simpa [T] using hxeq, by simpa [T] using hyeq⟩
theorem n4c_forms_v3
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {r : ℝ}
    (hr : 0 < r) (hcard : 4 ≤ (S.witnessClassAt_v3 r).card)
    (hesc : ¬ S.witnessClassAt_v3 r ⊆ S.CP.C3) :
    S.IsFormA_v3 r ∨ S.IsFormB_v3 r ∨ S.IsFormC_v3 r := by
  classical
  let T : Finset ℝ² := S.witnessClassAt_v3 r
  have hcore := S.coreSelector_v3 hr hcard
  rcases hcore with ⟨hTcard, hI3sub, hC1le, hC2le⟩
  have hTcard' : T.card = 4 := by simpa [T] using hTcard
  have hC1le' : (T ∩ S.CP.C1).card ≤ 1 := by simpa [T] using hC1le
  have hC2le' : (T ∩ S.CP.C2).card ≤ 1 := by simpa [T] using hC2le
  have hI3two : S.I3.card = 2 := S.I3_card_eq_two
  have hI3sub' : S.I3 ⊆ T ∩ S.I3 := by
    intro z hz
    exact Finset.mem_inter.mpr ⟨hI3sub hz, hz⟩
  have hTminus_eq_two : (T \ S.I3).card = 2 := by
    have hsplit : (T \ S.I3).card + (T ∩ S.I3).card = T.card := by
      simpa [T, Finset.inter_comm] using Finset.card_sdiff_add_card_inter T S.I3
    have hI3ge : S.I3.card ≤ (T ∩ S.I3).card := Finset.card_le_card hI3sub'
    have hI3le : (T ∩ S.I3).card ≤ S.I3.card := Finset.card_le_card Finset.inter_subset_right
    omega
  have hcover :
      T \ S.I3 ⊆ (T ∩ S.CP.C1) ∪ (T ∩ S.CP.C2) := by
    intro x hx
    rcases Finset.mem_sdiff.mp hx with ⟨hxT, hxnotI3⟩
    have hxA : x ∈ A := (Finset.mem_filter.mp hxT).1
    by_cases hxv2 : x = S.triangle.v2
    · apply Finset.mem_union_left
      exact Finset.mem_inter.mpr ⟨hxT, by simpa [hxv2] using S.CP.v2_mem_C1⟩
    by_cases hxv1 : x = S.triangle.v1
    · apply Finset.mem_union_right
      exact Finset.mem_inter.mpr ⟨hxT, by simpa [hxv1] using S.CP.v1_mem_C2⟩
    by_cases hxv3 : x = S.triangle.v3
    · have hv3not : S.triangle.v3 ∉ T := by
        intro hv3T
        have hv3eq : dist S.triangle.v3 S.triangle.v3 = r :=
          (Finset.mem_filter.mp hv3T).2
        have h0r : (0 : ℝ) = r := by simpa using hv3eq
        nlinarith only [hr, h0r]
      exact False.elim (hv3not (hxv3 ▸ hxT))
    have hxnonmoser : x ∉ S.triangle.verts := by
      simp [Problem97.MoserTriangle.verts, hxv1, hxv2, hxv3]
    have hxnotC3 : x ∉ S.CP.C3 := by
      intro hxC3
      have hxI3 : x ∈ S.I3 := by
        unfold I3
        exact Finset.mem_erase.mpr ⟨hxv2, Finset.mem_erase.mpr ⟨hxv1, hxC3⟩⟩
      exact hxnotI3 hxI3
    have hone := S.CP.nonmoser_in_one x hxA hxnonmoser
    by_cases hxC1 : x ∈ S.CP.C1
    · exact Finset.mem_union.mpr (Or.inl (Finset.mem_inter.mpr ⟨hxT, hxC1⟩))
    · have hxC2 : x ∈ S.CP.C2 := by
        by_cases hxC2 : x ∈ S.CP.C2
        · exact hxC2
        · have : (0 : ℕ) = 1 := by
            simpa [hxC1, hxC2, hxnotC3] using hone
          omega
      exact Finset.mem_union.mpr (Or.inr (Finset.mem_inter.mpr ⟨hxT, hxC2⟩))
  have hUnion_le :
      ((T ∩ S.CP.C1) ∪ (T ∩ S.CP.C2)).card ≤ 2 := by
    calc
      ((T ∩ S.CP.C1) ∪ (T ∩ S.CP.C2)).card
          ≤ (T ∩ S.CP.C1).card + (T ∩ S.CP.C2).card := Finset.card_union_le _ _
      _ ≤ 1 + 1 := by omega
      _ = 2 := by norm_num
  have hUnion_eq_two :
      ((T ∩ S.CP.C1) ∪ (T ∩ S.CP.C2)).card = 2 := by
    have hTminus_le : (T \ S.I3).card ≤ ((T ∩ S.CP.C1) ∪ (T ∩ S.CP.C2)).card :=
      Finset.card_le_card hcover
    omega
  have hsum_eq_two : (T ∩ S.CP.C1).card + (T ∩ S.CP.C2).card = 2 := by
    have hUnion_le_sum : ((T ∩ S.CP.C1) ∪ (T ∩ S.CP.C2)).card ≤
        (T ∩ S.CP.C1).card + (T ∩ S.CP.C2).card := Finset.card_union_le _ _
    omega
  have hC1eq1 : (T ∩ S.CP.C1).card = 1 := by omega
  have hC2eq1 : (T ∩ S.CP.C2).card = 1 := by omega
  obtain ⟨x, hxeq⟩ := Finset.card_eq_one.mp hC1eq1
  obtain ⟨y, hyeq⟩ := Finset.card_eq_one.mp hC2eq1
  have hxT : x ∈ T := by
    have hxmem : x ∈ ({x} : Finset ℝ²) := by simp
    rw [← hxeq] at hxmem
    exact (Finset.mem_inter.mp hxmem).1
  have hyT : y ∈ T := by
    have hymem : y ∈ ({y} : Finset ℝ²) := by simp
    rw [← hyeq] at hymem
    exact (Finset.mem_inter.mp hymem).1
  have hxC1 : x ∈ S.CP.C1 := by
    have hxmem : x ∈ ({x} : Finset ℝ²) := by simp
    rw [← hxeq] at hxmem
    exact (Finset.mem_inter.mp hxmem).2
  have hyC2 : y ∈ S.CP.C2 := by
    have hymem : y ∈ ({y} : Finset ℝ²) := by simp
    rw [← hyeq] at hymem
    exact (Finset.mem_inter.mp hymem).2
  have hv3notT : S.triangle.v3 ∉ T := by
    intro hv3T
    have hv3eq : dist S.triangle.v3 S.triangle.v3 = r := (Finset.mem_filter.mp hv3T).2
    have h0r : (0 : ℝ) = r := by simpa using hv3eq
    nlinarith only [hr, h0r]
  have hx_ne_v3 : x ≠ S.triangle.v3 := by
    intro h
    exact hv3notT (h ▸ hxT)
  have hy_ne_v3 : y ≠ S.triangle.v3 := by
    intro h
    exact hv3notT (h ▸ hyT)
  by_cases hxv2 : x = S.triangle.v2
  · by_cases hyv1 : y = S.triangle.v1
    · have hsubC3 : T ⊆ S.CP.C3 := by
        intro z hz
        by_cases hzI3 : z ∈ S.I3
        · unfold I3 at hzI3
          exact (Finset.mem_erase.mp (Finset.mem_erase.mp hzI3).2).2
        · have hzout : z ∈ T \ S.I3 := Finset.mem_sdiff.mpr ⟨hz, hzI3⟩
          have hzcover := hcover hzout
          rcases Finset.mem_union.mp hzcover with hzC1 | hzC2
          · have : z = x := by
              rw [hxeq] at hzC1
              simpa using hzC1
            simpa [this, hxv2] using S.CP.v2_mem_C3
          · have : z = y := by
              rw [hyeq] at hzC2
              simpa using hzC2
            simpa [this, hyv1] using S.CP.v1_mem_C3
      exact False.elim (hesc hsubC3)
    · have hyI2 : y ∈ S.I2 := by
        unfold I2
        exact Finset.mem_erase.mpr ⟨hyv1, Finset.mem_erase.mpr ⟨hy_ne_v3, hyC2⟩⟩
      exact Or.inr (Or.inr ⟨y, hyI2, by simpa [T, hxv2] using hxeq, by simpa [T] using hyeq⟩)
  · by_cases hyv1 : y = S.triangle.v1
    · have hxI1 : x ∈ S.I1 := by
        unfold I1
        exact Finset.mem_erase.mpr ⟨hx_ne_v3, Finset.mem_erase.mpr ⟨hxv2, hxC1⟩⟩
      exact Or.inr (Or.inl ⟨x, hxI1, by simpa [T] using hxeq, by simpa [T, hyv1] using hyeq⟩)
    · have hxI1 : x ∈ S.I1 := by
        unfold I1
        exact Finset.mem_erase.mpr ⟨hx_ne_v3, Finset.mem_erase.mpr ⟨hxv2, hxC1⟩⟩
      have hyI2 : y ∈ S.I2 := by
        unfold I2
        exact Finset.mem_erase.mpr ⟨hyv1, Finset.mem_erase.mpr ⟨hy_ne_v3, hyC2⟩⟩
      exact Or.inl ⟨x, y, hxI1, hyI2, by simpa [T] using hxeq, by simpa [T] using hyeq⟩
abbrev N4cClassifies_v1 {A : Finset ℝ²} (S : FiniteEndpointShell A) : Type :=
  ∀ {r : ℝ}, 0 < r →
    4 ≤ (S.witnessClassAt_v1 r).card →
    ¬ S.witnessClassAt_v1 r ⊆ S.CP.C1 →
    EscapedForm
abbrev N4cClassifies_v2 {A : Finset ℝ²} (S : FiniteEndpointShell A) : Type :=
  ∀ {r : ℝ}, 0 < r →
    4 ≤ (S.witnessClassAt_v2 r).card →
    ¬ S.witnessClassAt_v2 r ⊆ S.CP.C2 →
    EscapedForm
abbrev N4cClassifies_v3 {A : Finset ℝ²} (S : FiniteEndpointShell A) : Type :=
  ∀ {r : ℝ}, 0 < r →
    4 ≤ (S.witnessClassAt_v3 r).card →
    ¬ S.witnessClassAt_v3 r ⊆ S.CP.C3 →
    EscapedForm
noncomputable def n4cClassifies_v1
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.N4cClassifies_v1 := by
  classical
  intro r hr hcard hesc
  by_cases hA : S.IsFormA_v1 r
  · exact EscapedForm.a
  · by_cases hB : S.IsFormB_v1 r
    · exact EscapedForm.b
    · have hC : S.IsFormC_v1 r := by
        rcases S.n4c_forms_v1 hr hcard hesc with hA' | hB' | hC'
        · exact False.elim (hA hA')
        · exact False.elim (hB hB')
        · exact hC'
      exact EscapedForm.c
noncomputable def n4cClassifies_v2
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.N4cClassifies_v2 := by
  classical
  intro r hr hcard hesc
  by_cases hA : S.IsFormA_v2 r
  · exact EscapedForm.a
  · by_cases hB : S.IsFormB_v2 r
    · exact EscapedForm.b
    · have hC : S.IsFormC_v2 r := by
        rcases S.n4c_forms_v2 hr hcard hesc with hA' | hB' | hC'
        · exact False.elim (hA hA')
        · exact False.elim (hB hB')
        · exact hC'
      exact EscapedForm.c
noncomputable def n4cClassifies_v3
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.N4cClassifies_v3 := by
  classical
  intro r hr hcard hesc
  by_cases hA : S.IsFormA_v3 r
  · exact EscapedForm.a
  · by_cases hB : S.IsFormB_v3 r
    · exact EscapedForm.b
    · have hC : S.IsFormC_v3 r := by
        rcases S.n4c_forms_v3 hr hcard hesc with hA' | hB' | hC'
        · exact False.elim (hA hA')
        · exact False.elim (hB hB')
        · exact hC'
      exact EscapedForm.c
abbrev N4dExcludes_v1 {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (classify : S.N4cClassifies_v1) : Prop :=
  ∀ {r : ℝ} (hr : 0 < r) (hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
      (hesc : ¬ S.witnessClassAt_v1 r ⊆ S.CP.C1),
    False
abbrev N4dExcludes_v2 {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (classify : S.N4cClassifies_v2) : Prop :=
  ∀ {r : ℝ} (hr : 0 < r) (hcard : 4 ≤ (S.witnessClassAt_v2 r).card)
      (hesc : ¬ S.witnessClassAt_v2 r ⊆ S.CP.C2),
    False
abbrev N4dExcludes_v3 {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (classify : S.N4cClassifies_v3) : Prop :=
  ∀ {r : ℝ} (hr : 0 < r) (hcard : 4 ≤ (S.witnessClassAt_v3 r).card)
      (hesc : ¬ S.witnessClassAt_v3 r ⊆ S.CP.C3),
    False
abbrev b3n9m051_N4dExcludesFormA_v1Pred {A : Finset ℝ²} (S : FiniteEndpointShell A) : Prop :=
  ∀ {r : ℝ} (hr : 0 < r) (hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
      (hesc : ¬ S.witnessClassAt_v1 r ⊆ S.CP.C1),
    S.IsFormA_v1 r → False
abbrev b3n9m051_N4dExcludesFormB_v1Pred {A : Finset ℝ²} (S : FiniteEndpointShell A) : Prop :=
  ∀ {r : ℝ} (hr : 0 < r) (hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
      (hesc : ¬ S.witnessClassAt_v1 r ⊆ S.CP.C1),
    S.IsFormB_v1 r → False
abbrev b3n9m051_N4dExcludesFormC_v1Pred {A : Finset ℝ²} (S : FiniteEndpointShell A) : Prop :=
  ∀ {r : ℝ} (hr : 0 < r) (hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
      (hesc : ¬ S.witnessClassAt_v1 r ⊆ S.CP.C1),
    S.IsFormC_v1 r → False
abbrev b3n9m051_N4dExcludesFormA_v2Pred {A : Finset ℝ²} (S : FiniteEndpointShell A) : Prop :=
  ∀ {r : ℝ} (hr : 0 < r) (hcard : 4 ≤ (S.witnessClassAt_v2 r).card)
      (hesc : ¬ S.witnessClassAt_v2 r ⊆ S.CP.C2),
    S.IsFormA_v2 r → False
abbrev b3n9m051_N4dExcludesFormB_v2Pred {A : Finset ℝ²} (S : FiniteEndpointShell A) : Prop :=
  ∀ {r : ℝ} (hr : 0 < r) (hcard : 4 ≤ (S.witnessClassAt_v2 r).card)
      (hesc : ¬ S.witnessClassAt_v2 r ⊆ S.CP.C2),
    S.IsFormB_v2 r → False
abbrev b3n9m051_N4dExcludesFormC_v2Pred {A : Finset ℝ²} (S : FiniteEndpointShell A) : Prop :=
  ∀ {r : ℝ} (hr : 0 < r) (hcard : 4 ≤ (S.witnessClassAt_v2 r).card)
      (hesc : ¬ S.witnessClassAt_v2 r ⊆ S.CP.C2),
    S.IsFormC_v2 r → False
abbrev b3n9m051_N4dExcludesFormA_v3Pred {A : Finset ℝ²} (S : FiniteEndpointShell A) : Prop :=
  ∀ {r : ℝ} (hr : 0 < r) (hcard : 4 ≤ (S.witnessClassAt_v3 r).card)
      (hesc : ¬ S.witnessClassAt_v3 r ⊆ S.CP.C3),
    S.IsFormA_v3 r → False
abbrev b3n9m051_N4dExcludesFormB_v3Pred {A : Finset ℝ²} (S : FiniteEndpointShell A) : Prop :=
  ∀ {r : ℝ} (hr : 0 < r) (hcard : 4 ≤ (S.witnessClassAt_v3 r).card)
      (hesc : ¬ S.witnessClassAt_v3 r ⊆ S.CP.C3),
    S.IsFormB_v3 r → False
abbrev b3n9m051_N4dExcludesFormC_v3Pred {A : Finset ℝ²} (S : FiniteEndpointShell A) : Prop :=
  ∀ {r : ℝ} (hr : 0 < r) (hcard : 4 ≤ (S.witnessClassAt_v3 r).card)
      (hesc : ¬ S.witnessClassAt_v3 r ⊆ S.CP.C3),
    S.IsFormC_v3 r → False
theorem n4dExcludes_v1_of_forms
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (hA : S.N4dExcludesFormA_v1)
    (hB : S.N4dExcludesFormB_v1)
    (hC : S.N4dExcludesFormC_v1) :
    S.N4dExcludes_v1 S.n4cClassifies_v1 := by
  intro r hr hcard hesc
  rcases S.n4c_forms_v1 hr hcard hesc with hform | hform | hform
  · exact hA hr hcard hesc hform
  · exact hB hr hcard hesc hform
  · exact hC hr hcard hesc hform
theorem n4dExcludes_v2_of_forms
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (hA : S.N4dExcludesFormA_v2)
    (hB : S.N4dExcludesFormB_v2)
    (hC : S.N4dExcludesFormC_v2) :
    S.N4dExcludes_v2 S.n4cClassifies_v2 := by
  intro r hr hcard hesc
  rcases S.n4c_forms_v2 hr hcard hesc with hform | hform | hform
  · exact hA hr hcard hesc hform
  · exact hB hr hcard hesc hform
  · exact hC hr hcard hesc hform
theorem n4dExcludes_v3_of_forms
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (hA : S.N4dExcludesFormA_v3)
    (hB : S.N4dExcludesFormB_v3)
    (hC : S.N4dExcludesFormC_v3) :
    S.N4dExcludes_v3 S.n4cClassifies_v3 := by
  intro r hr hcard hesc
  rcases S.n4c_forms_v3 hr hcard hesc with hform | hform | hform
  · exact hA hr hcard hesc hform
  · exact hB hr hcard hesc hform
  · exact hC hr hcard hesc hform
theorem n4eCapContainment_of_n4c_n4d
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (hClass1 : S.N4cClassifies_v1) (hClass2 : S.N4cClassifies_v2)
    (hClass3 : S.N4cClassifies_v3)
    (hExcl1 : S.N4dExcludes_v1 hClass1)
    (hExcl2 : S.N4dExcludes_v2 hClass2)
    (hExcl3 : S.N4dExcludes_v3 hClass3) :
    S.N4eCapContainment := by
  constructor
  · intro r hr hcard
    by_contra hsub
    exact hExcl1 hr hcard hsub
  constructor
  · intro r hr hcard
    by_contra hsub
    exact hExcl2 hr hcard hsub
  · intro r hr hcard
    by_contra hsub
    exact hExcl3 hr hcard hsub
end FiniteEndpointShell
end Problem97
end Batch3N9
end Batch3N9Unit051

-- Original module: Solutions.Batch3N9.N4d.TrackBRows
section Batch3N9Unit052
namespace Batch3N9
open scoped EuclideanGeometry
namespace Problem97
namespace N4dTrackBRows
end N4dTrackBRows
end Problem97
end Batch3N9
end Batch3N9Unit052

-- Original module: Solutions.Batch3N9.N4d.FormBLowerForcesV3
section Batch3N9Unit055
namespace Batch3N9
open scoped EuclideanGeometry
open Finset
namespace Problem97
namespace FiniteEndpointShell
set_option maxHeartbeats 2000000 in
theorem sharedCirclePointForcesV3_of_formB_lower
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s : ℝ}
    (hs : 0 < s)
    (hB : S.IsFormB_v1 r)
    (hA2 : (Z.a2 : ℝ²) ∈ S.I2)
    (h_a2eq : S.witnessClassAt_v1 r ∩ S.CP.C2 = ({Z.a2} : Finset ℝ²))
    (hI2sub : S.I2 ⊆ S.witnessClassAt_v2 s) :
    S.SharedCirclePointForcesV3 Z r s := by
  classical
  obtain ⟨-, -, -, h_v2eq⟩ := hB
  intro q hqnamed hqT2 hqT1
  by_cases hqv3 : q = S.triangle.v3
  · exact hqv3
  exfalso
  have hqI1 : q ∈ S.I1 := by
    rw [Z.hI1]
    rcases Finset.mem_insert.mp hqnamed with h | hrest
    · simp [h]
    · rcases Finset.mem_insert.mp hrest with h | h
      · simp [h]
      · exact absurd (by simpa using h) hqv3
  let q1 : ℝ² := S.triangle.v1
  let q2 : ℝ² := S.triangle.v2
  let a : ℝ² := Z.a2
  let center : ℝ² := S.Packet.center
  have hqA : q ∈ A := (Finset.mem_filter.mp hqT1).1
  have haC2 : a ∈ S.CP.C2 := by
    unfold Problem97.FiniteEndpointShell.I2 at hA2
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hA2).2).2
  have haA : a ∈ A := S.CP.C2_subset haC2
  have haT1 : a ∈ S.witnessClassAt_v1 r := by
    have hamem : a ∈ ({a} : Finset ℝ²) := by simp
    rw [← h_a2eq] at hamem
    exact (Finset.mem_inter.mp hamem).1
  have haT2 : a ∈ S.witnessClassAt_v2 s := hI2sub hA2
  have hv2T1 : q2 ∈ S.witnessClassAt_v1 r := by
    have hv2mem : q2 ∈ ({q2} : Finset ℝ²) := by simp [q2]
    rw [← h_v2eq] at hv2mem
    exact (Finset.mem_inter.mp hv2mem).1
  have hr_q1q2 : dist q1 q2 = r := by
    simpa [q1, q2] using (Finset.mem_filter.mp hv2T1).2
  have hr_q1a : dist q1 a = r := by
    simpa [q1, a] using (Finset.mem_filter.mp haT1).2
  have hr_q1q : dist q1 q = r := by
    simpa [q1] using (Finset.mem_filter.mp hqT1).2
  have hs_q2a : dist q2 a = s := by
    simpa [q2, a] using (Finset.mem_filter.mp haT2).2
  have hs_q2q : dist q2 q = s := by
    simpa [q2] using (Finset.mem_filter.mp hqT2).2
  have hu : q2 - q1 ≠ 0 := sub_ne_zero.mpr S.triangle.v12_ne.symm
  let u : ℝ² := q2 - q1
  let nvec : ℝ² := Problem97.stdOrientation.rightAngleRotation u
  let β := Problem97.stdOrientation.basisRightAngleRotation u hu
  let M : ℝ² := midpoint ℝ q1 q2
  let X : ℝ² → ℝ := fun z => β.repr (z - M) 0
  let Y : ℝ² → ℝ := fun z => β.repr (z - M) 1
  let yc : ℝ := Y center
  have hsum_pt : ∀ z : ℝ², z - M = X z • u + Y z • nvec := by
    intro z
    simpa [β, X, Y, nvec] using (β.sum_repr (z - M)).symm
  have hnorm_nvec : ‖nvec‖ = ‖u‖ := by
    simp [nvec]
  have hβu : β.repr u = Finsupp.single 0 (1 : ℝ) := by
    simpa [β, nvec] using (β.repr_self 0)
  have horth : inner ℝ u nvec = 0 := by
    simp [nvec]
  have hq1mid : q1 - M = (-(1 / 2 : ℝ)) • u := by
    calc
      q1 - M = (1 / 2 : ℝ) • (q1 - q2) := by
        simp [M]
      _ = (-(1 / 2 : ℝ)) • u := by
        rw [show q1 - q2 = -u by
          dsimp [u]
          abel_nf]
        simp [smul_neg]
  have hq2mid : q2 - M = (1 / 2 : ℝ) • u := by
    simp [M, u]
  have hX_q1 : X q1 = -(1 / 2 : ℝ) := by
    have h := congrArg (fun v : ℝ² => β.repr v 0) hq1mid
    change X q1 = (β.repr ((-(1 / 2 : ℝ)) • u)) 0 at h
    rw [map_smul, hβu] at h
    simpa using h
  have hY_q1 : Y q1 = 0 := by
    have h := congrArg (fun v : ℝ² => β.repr v 1) hq1mid
    change Y q1 = (β.repr ((-(1 / 2 : ℝ)) • u)) 1 at h
    rw [map_smul, hβu] at h
    simpa using h
  have hdist_sq_coeff :
      ∀ a b : ℝ, ‖a • u + b • nvec‖ ^ 2 = (a ^ 2 + b ^ 2) * ‖u‖ ^ 2 := by
    intro a b
    have horth' : inner ℝ (a • u) (b • nvec) = 0 := by
      rw [inner_smul_left, inner_smul_right, horth]
      ring
    have hnorm :
        ‖a • u + b • nvec‖ ^ 2 = ‖a • u‖ ^ 2 + ‖b • nvec‖ ^ 2 := by
      simpa [pow_two] using
        norm_add_sq_eq_norm_sq_add_norm_sq_of_inner_eq_zero (a • u) (b • nvec) horth'
    have hu_part : ‖a • u‖ ^ 2 = a ^ 2 * ‖u‖ ^ 2 := by
      calc
        ‖a • u‖ ^ 2 = (|a| * ‖u‖) ^ 2 := by rw [norm_smul, Real.norm_eq_abs]
        _ = |a| ^ 2 * ‖u‖ ^ 2 := by ring
        _ = a ^ 2 * ‖u‖ ^ 2 := by rw [sq_abs]
    have hn_part : ‖b • nvec‖ ^ 2 = b ^ 2 * ‖u‖ ^ 2 := by
      calc
        ‖b • nvec‖ ^ 2 = (|b| * ‖u‖) ^ 2 := by
          rw [norm_smul, Real.norm_eq_abs, hnorm_nvec]
        _ = |b| ^ 2 * ‖u‖ ^ 2 := by ring
        _ = b ^ 2 * ‖u‖ ^ 2 := by rw [sq_abs]
    rw [hnorm, hu_part, hn_part]
    ring
  have hpt_minus_q1 : ∀ z : ℝ²,
      z - q1 = (X z + 1 / 2) • u + Y z • nvec := by
    intro z
    calc
      z - q1 = (z - M) - (q1 - M) := by
        rw [sub_eq_add_neg, sub_eq_add_neg, sub_eq_add_neg]
        abel_nf
      _ = (X z • u + Y z • nvec) - ((-(1 / 2 : ℝ)) • u) := by
        rw [hsum_pt z, hq1mid]
      _ = (X z • u + (1 / 2 : ℝ) • u) + Y z • nvec := by
        rw [sub_eq_add_neg, neg_smul]
        abel_nf
      _ = (X z + 1 / 2) • u + Y z • nvec := by
        rw [← add_smul]
  have hpt_minus_q2 : ∀ z : ℝ²,
      z - q2 = (X z - 1 / 2) • u + Y z • nvec := by
    intro z
    calc
      z - q2 = (z - M) - (q2 - M) := by
        rw [sub_eq_add_neg, sub_eq_add_neg, sub_eq_add_neg]
        abel_nf
      _ = (X z • u + Y z • nvec) - ((1 / 2 : ℝ) • u) := by
        rw [hsum_pt z, hq2mid]
      _ = (X z • u + (-(1 / 2 : ℝ)) • u) + Y z • nvec := by
        rw [sub_eq_add_neg, neg_smul]
        abel_nf
      _ = (X z - 1 / 2) • u + Y z • nvec := by
        rw [← add_smul]
        simp [sub_eq_add_neg]
  have hpt_minus_center : ∀ z : ℝ²,
      z - center = X z • u + (Y z - yc) • nvec := by
    intro z
    have hcenter_perp : inner ℝ (center - M) u = 0 := by
      have hdist_eq : dist center q1 = dist center q2 := by
        rw [dist_comm center q1, dist_comm center q2, dist_eq_norm, dist_eq_norm]
        exact S.Packet.moser_on_boundary_1.trans S.Packet.moser_on_boundary_2.symm
      have hperp : center ∈ AffineSubspace.perpBisector q1 q2 := by
        rw [AffineSubspace.mem_perpBisector_iff_dist_eq]
        simpa using hdist_eq
      have h :=
        (AffineSubspace.mem_perpBisector_iff_inner_eq_zero
          (c := center) (p₁ := q1) (p₂ := q2)).mp hperp
      simpa [M] using h
    have hxc_zero : X center = 0 := by
      have hinner : inner ℝ (center - M) u = X center * ‖u‖ ^ 2 := by
        have horth_rev : inner ℝ nvec u = 0 := by simpa [real_inner_comm] using horth
        calc
          inner ℝ (center - M) u = inner ℝ (X center • u + Y center • nvec) u := by
            rw [hsum_pt center]
          _ = inner ℝ (X center • u) u + inner ℝ (Y center • nvec) u := by
            rw [inner_add_left]
          _ = X center * ‖u‖ ^ 2 + Y center * 0 := by
            rw [inner_smul_left, inner_smul_left, real_inner_self_eq_norm_sq, horth_rev]
            simp
          _ = X center * ‖u‖ ^ 2 := by ring
      have hsqpos : 0 < ‖u‖ ^ 2 := sq_pos_of_ne_zero (norm_ne_zero_iff.mpr hu)
      nlinarith only [hcenter_perp, hinner, hsqpos]
    calc
      z - center = (z - M) - (center - M) := by
        rw [sub_eq_add_neg, sub_eq_add_neg, sub_eq_add_neg]
        abel_nf
      _ = (X z • u + Y z • nvec) - (Y center • nvec) := by
        rw [hsum_pt z, hsum_pt center, hxc_zero, zero_smul, zero_add]
      _ = X z • u + (Y z • nvec + (-Y center) • nvec) := by
        rw [sub_eq_add_neg, neg_smul]
        abel_nf
      _ = X z • u + (Y z - yc) • nvec := by
        rw [← add_smul]
        rfl
  have hdist_q1_sq :
      ∀ z : ℝ², dist q1 z ^ 2 = ((X z + 1 / 2) ^ 2 + Y z ^ 2) * ‖u‖ ^ 2 := by
    intro z
    rw [dist_comm, dist_eq_norm, hpt_minus_q1, hdist_sq_coeff]
  have hdist_q2_sq :
      ∀ z : ℝ², dist q2 z ^ 2 = ((X z - 1 / 2) ^ 2 + Y z ^ 2) * ‖u‖ ^ 2 := by
    intro z
    rw [dist_comm, dist_eq_norm, hpt_minus_q2, hdist_sq_coeff]
  have hdist_center_sq :
      ∀ z : ℝ², dist center z ^ 2 = (X z ^ 2 + (Y z - yc) ^ 2) * ‖u‖ ^ 2 := by
    intro z
    rw [dist_comm, dist_eq_norm, hpt_minus_center, hdist_sq_coeff]
  have hu_sq_pos : 0 < ‖u‖ ^ 2 := sq_pos_of_ne_zero (norm_ne_zero_iff.mpr hu)
  have hs_sq_pos : 0 < s ^ 2 := by positivity
  have hnorm_u : ‖u‖ = r := by
    rw [← hr_q1q2, dist_eq_norm]
    simp [u, norm_sub_rev]
  have hcommon_eqs :
      ∀ z : ℝ², dist q1 z = r → dist q2 z = s →
        ((X z + 1 / 2) ^ 2 + Y z ^ 2) * ‖u‖ ^ 2 = ‖u‖ ^ 2 ∧
        ((X z - 1 / 2) ^ 2 + Y z ^ 2) * ‖u‖ ^ 2 = s ^ 2 := by
    intro z hz1 hz2
    constructor
    · rw [← hdist_q1_sq z, hz1, ← hnorm_u]
    · rw [← hdist_q2_sq z, hz2]
  obtain ⟨ha_eq1, ha_eq2⟩ := hcommon_eqs a hr_q1a hs_q2a
  obtain ⟨hq_eq1, hq_eq2⟩ := hcommon_eqs q hr_q1q hs_q2q
  have hXdiff : (X q - X a) * (2 * ‖u‖ ^ 2) = 0 := by
    linear_combination hq_eq1 - hq_eq2 - ha_eq1 + ha_eq2
  have hqX_eq : X q = X a := by
    rcases mul_eq_zero.mp hXdiff with h | h
    · exact sub_eq_zero.mp h
    · nlinarith only [hu_sq_pos, h]
  have hYdiff : (Y q ^ 2 - Y a ^ 2) * ‖u‖ ^ 2 = 0 := by
    linear_combination hq_eq1 - ha_eq1 - (X q + X a + 1) * ‖u‖ ^ 2 * hqX_eq
  have hqY_sq : Y q ^ 2 = Y a ^ 2 := by
    rcases mul_eq_zero.mp hYdiff with h | h
    · exact sub_eq_zero.mp h
    · nlinarith only [hu_sq_pos, h]
  have hy_cases : Y q = Y a ∨ Y q = -Y a :=
    sq_eq_sq_iff_eq_or_eq_neg.mp hqY_sq
  have h2XaU : 2 * X a * ‖u‖ ^ 2 = ‖u‖ ^ 2 - s ^ 2 := by
    linear_combination ha_eq1 - ha_eq2
  rcases hy_cases with hsame | hopp
  ·
    have hqa2 : q = a := by
      have hsub : q - M = a - M := by
        calc
          q - M = X q • u + Y q • nvec := hsum_pt q
          _ = X a • u + Y a • nvec := by rw [hqX_eq, hsame]
          _ = a - M := (hsum_pt a).symm
      have hadd := congrArg (fun t : ℝ² => t + M) hsub
      simpa [sub_eq_add_neg, add_assoc, add_left_comm, add_comm] using hadd
    have ha_not_verts : a ∉ S.triangle.verts := by
      have ha_ne_v1 : a ≠ q1 := by
        unfold Problem97.FiniteEndpointShell.I2 at hA2
        exact (Finset.mem_erase.mp hA2).1
      have ha_ne_v3 : a ≠ S.triangle.v3 := by
        unfold Problem97.FiniteEndpointShell.I2 at hA2
        exact (Finset.mem_erase.mp (Finset.mem_erase.mp hA2).2).1
      have ha_ne_v2 : a ≠ q2 := by
        intro h
        have : q2 ∈ S.CP.C2 := by simpa [h] using haC2
        exact S.CP.v2_notin_C2 this
      simp [Problem97.MoserTriangle.verts, q1, q2, ha_ne_v1, ha_ne_v2, ha_ne_v3]
    have hone_a := S.CP.nonmoser_in_one a haA ha_not_verts
    have haI1 : a ∈ S.I1 := by simpa [hqa2] using hqI1
    have haC1 : a ∈ S.CP.C1 := by
      unfold Problem97.FiniteEndpointShell.I1 at haI1
      exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase haI1)
    have hone_a' : (2 + if a ∈ S.CP.C3 then 1 else 0) = 1 := by
      simpa [haC1, haC2] using hone_a
    by_cases haC3 : a ∈ S.CP.C3 <;> simp [haC3] at hone_a'
  ·
    have hdisk_a : dist center a ≤ S.Packet.radius := by
      have hdisk_a' : ‖a - center‖ ≤ S.Packet.radius := by
        simpa [center] using S.Packet.disk_contains_A a haA
      rw [dist_eq_norm, norm_sub_rev]
      exact hdisk_a'
    have hradius : dist center q1 = S.Packet.radius := by
      rw [dist_comm, dist_eq_norm]
      exact S.Packet.moser_on_boundary_1
    have hdist_sq : dist center a ^ 2 ≤ dist center q1 ^ 2 := by
      have hnonneg_a : 0 ≤ dist center a := dist_nonneg
      have hnonneg_q1 : 0 ≤ dist center q1 := dist_nonneg
      nlinarith only [hdisk_a, hradius, hnonneg_a, hnonneg_q1]
    rw [hdist_center_sq a, hdist_center_sq q1, hX_q1, hY_q1] at hdist_sq
    have hyc_pos : 0 < Y a * yc := by
      nlinarith only [hs_sq_pos, ha_eq1, ha_eq2, hdist_sq, h2XaU, hu_sq_pos]
    have hq_out : dist center q > S.Packet.radius := by
      have hdist_sq_q : dist center q ^ 2 > S.Packet.radius ^ 2 := by
        rw [hdist_center_sq q]
        have hradius_sq :
            S.Packet.radius ^ 2 = ((1 / 2 : ℝ) ^ 2 + yc ^ 2) * ‖u‖ ^ 2 := by
          have hq1sq := hdist_center_sq q1
          rw [hradius, hX_q1, hY_q1] at hq1sq
          nlinarith only [hq1sq]
        rw [hqX_eq, hopp, hradius_sq]
        nlinarith only [hs_sq_pos, ha_eq1, ha_eq2, hdist_sq, h2XaU, hyc_pos, hu_sq_pos]
      have hrad_nn : 0 ≤ S.Packet.radius := le_of_lt S.Packet.radius_pos
      have hdist_nn : 0 ≤ dist center q := dist_nonneg
      nlinarith only [hdist_sq_q, hrad_nn, hdist_nn]
    have hdisk_q : dist center q ≤ S.Packet.radius := by
      have hdisk_q' : ‖q - center‖ ≤ S.Packet.radius := by
        simpa [center] using S.Packet.disk_contains_A q hqA
      rw [dist_eq_norm, norm_sub_rev]
      exact hdisk_q'
    exact absurd hdisk_q (not_le_of_gt hq_out)
theorem selectorShape_v2_lower_forces_v3
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s : ℝ}
    (hr : 0 < r) (hs : 0 < s)
    (hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
    (hB : S.IsFormB_v1 r)
    (hA2 : (Z.a2 : ℝ²) ∈ S.I2)
    (h_a2eq : S.witnessClassAt_v1 r ∩ S.CP.C2 = ({Z.a2} : Finset ℝ²))
    (hI2sub : S.I2 ⊆ S.witnessClassAt_v2 s)
    {p : ℝ²}
    (hp : p ∈ ({Z.a1, Z.b1, S.triangle.v3} : Finset ℝ²))
    (hpeq : S.witnessClassAt_v2 s ∩ S.CP.C1 = ({p} : Finset ℝ²)) :
    S.witnessClassAt_v2 s ∩ S.CP.C1 = ({S.triangle.v3} : Finset ℝ²) := by
  classical
  have hforce : S.SharedCirclePointForcesV3 Z r s :=
    S.sharedCirclePointForcesV3_of_formB_lower Z hs hB hA2 h_a2eq hI2sub
  have hcore := S.coreSelector_v1 hr hcard
  rcases hcore with ⟨-, hI1sub, -, -⟩
  have hpT2 : p ∈ S.witnessClassAt_v2 s := by
    have hpmem : p ∈ ({p} : Finset ℝ²) := by simp
    rw [← hpeq] at hpmem
    exact (Finset.mem_inter.mp hpmem).1
  rcases Finset.mem_insert.mp hp with hpa1 | hprest
  · have hpa1' : p = Z.a1 := by simpa using hpa1
    have ha1I1 : Z.a1 ∈ S.I1 := by
      rw [Z.hI1]
      simp
    have ha1T1 : Z.a1 ∈ S.witnessClassAt_v1 r := hI1sub ha1I1
    have hpv3 : p = S.triangle.v3 :=
      hforce p hp hpT2 (by simpa [hpa1'] using ha1T1)
    rwa [hpv3] at hpeq
  rcases Finset.mem_insert.mp hprest with hpb1 | hpv3
  · have hpb1' : p = Z.b1 := by simpa using hpb1
    have hb1I1 : Z.b1 ∈ S.I1 := by
      rw [Z.hI1]
      simp
    have hb1T1 : Z.b1 ∈ S.witnessClassAt_v1 r := hI1sub hb1I1
    have hpv3 : p = S.triangle.v3 :=
      hforce p hp hpT2 (by simpa [hpb1'] using hb1T1)
    rwa [hpv3] at hpeq
  · have hpv3' : p = S.triangle.v3 := by simpa using hpv3
    rwa [hpv3'] at hpeq
end FiniteEndpointShell
end Problem97
end Batch3N9
end Batch3N9Unit055

-- Original module: Solutions.Batch3N9.N4d.FormBPEqBProducer
section Batch3N9Unit056
namespace Batch3N9
open scoped EuclideanGeometry
open Finset
namespace Problem97
namespace FiniteEndpointShell
abbrev SelectorV3PeqBPacket
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r : ℝ) : Prop :=
  FiniteEndpointShell.SelectorV3Pv2Packet S Z r
theorem b3n9m056_v1_lt_v1v3_of_mem_I2
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {p : ℝ²}
    (hpI2 : p ∈ S.I2) :
    dist S.triangle.v1 p < dist S.triangle.v1 S.triangle.v3 := by
  classical
  have hpC2 : p ∈ S.CP.C2 := by
    unfold Problem97.FiniteEndpointShell.I2 at hpI2
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hpI2).2).2
  have hp_ne_v3 : p ≠ S.triangle.v3 := by
    unfold Problem97.FiniteEndpointShell.I2 at hpI2
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hpI2).2).1
  have hp_ne_v1 : p ≠ S.triangle.v1 := by
    unfold Problem97.FiniteEndpointShell.I2 at hpI2
    exact (Finset.mem_erase.mp hpI2).1
  rcases Problem97.CGN.CGN4g_capData_of_supportCap_oriented
      (A := A) (C := S.CP.C2) (M := S.triangle2)
      S.hconv S.hnoncol S.CP.C2_subset
      (fun x hxA => (S.CP.arc_membership x hxA).2.1)
      S.CP.v3_mem_C2 S.CP.v1_mem_C2 S.packet2 S.packet2.inner_at_v1 with
    ⟨m, L, Packet, Hside, Hord, hLC, hEnds⟩
  have hpL : p ∈ Finset.univ.image L.points := by
    rw [hLC]
    exact hpC2
  rcases Finset.mem_image.mp hpL with ⟨i, -, hi⟩
  rcases hEnds with hFirstLast | hLastFirst
  · have hi_ne_first : i ≠ Problem97.CGN.firstIndex Packet.hm := by
      intro hi_first
      apply hp_ne_v3
      calc
        p = L.points i := hi.symm
        _ = L.points (Problem97.CGN.firstIndex Packet.hm) := by simp [hi_first]
        _ = S.triangle.v3 := hFirstLast.1
    have hi_rev_lt_last : i.rev < Problem97.CGN.lastIndex Packet.hm := by
      apply Fin.lt_def.mpr
      rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
      have hi_pos : 0 < i.val := by
        apply Nat.pos_of_ne_zero
        intro hi_zero
        apply hi_ne_first
        ext
        simpa [Problem97.CGN.firstIndex] using hi_zero
      omega
    have hmono :
        Problem97.FiniteEndpoint.E3L20b_rightEndpoint_capDistance_strict
          (L.points (Problem97.CGN.lastIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev L) :=
      Problem97.FiniteEndpoint.E3L20b_of_cgnCapData Packet Hside Hord
    have hlt :=
      hmono (i := i.rev) (j := Problem97.CGN.lastIndex Packet.hm) hi_rev_lt_last
    have hlast_rev_first : (Problem97.CGN.lastIndex Packet.hm).rev =
        Problem97.CGN.firstIndex Packet.hm := by
      ext
      rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
      simp [Problem97.CGN.firstIndex]
      omega
    simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev_points,
      hi, hFirstLast.1, hFirstLast.2, hlast_rev_first] using hlt
  · have hi_lt_last : i < Problem97.CGN.lastIndex Packet.hm := by
      apply Fin.lt_def.mpr
      rw [Problem97.CGN.lastIndex_val]
      have hi_lt_top : i.val < m := i.is_lt
      have hi_ne_last : i ≠ Problem97.CGN.lastIndex Packet.hm := by
        intro hi_last
        apply hp_ne_v3
        calc
          p = L.points i := hi.symm
          _ = L.points (Problem97.CGN.lastIndex Packet.hm) := by simp [hi_last]
          _ = S.triangle.v3 := hLastFirst.2
      have hi_ne_top : i.val ≠ m - 1 := by
        intro hi_top
        apply hi_ne_last
        ext
        simpa [Problem97.CGN.lastIndex, Problem97.CGN.finIndex] using hi_top
      omega
    have hmono :
        Problem97.FiniteEndpoint.E3L20a_leftEndpoint_capDistance_strict
          (L.points (Problem97.CGN.firstIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap L) :=
      Problem97.FiniteEndpoint.E3L20a_of_cgnCapData Packet Hside Hord
    have hlt :=
      hmono (i := i) (j := Problem97.CGN.lastIndex Packet.hm) hi_lt_last
    simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap_points,
      hi, hLastFirst.1, hLastFirst.2] using hlt
theorem b3n9m056_v2_lt_v2v1_of_mem_I3
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {q : ℝ²}
    (hqI3 : q ∈ S.I3) :
    dist S.triangle.v2 q < dist S.triangle.v2 S.triangle.v1 := by
  classical
  rcases Problem97.CGN.CGN4g_capData_of_supportCap_oriented
      (A := A) (C := S.CP.C3) (M := S.triangle3)
      S.hconv S.hnoncol S.CP.C3_subset
      (fun x hxA => (S.CP.arc_membership x hxA).2.2)
      S.CP.v1_mem_C3 S.CP.v2_mem_C3 S.packet3 S.packet3.inner_at_v1 with
    ⟨m, L, Packet, Hside, Hord, hLC, hEnds⟩
  have hqC3 : q ∈ S.CP.C3 := by
    unfold Problem97.FiniteEndpointShell.I3 at hqI3
    exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hqI3)
  have hqL : q ∈ Finset.univ.image L.points := by
    rw [hLC]
    exact hqC3
  rcases Finset.mem_image.mp hqL with ⟨i, -, hi⟩
  have hq_ne_v2 : q ≠ S.triangle.v2 := by
    unfold Problem97.FiniteEndpointShell.I3 at hqI3
    exact (Finset.mem_erase.mp hqI3).1
  have hq_ne_v1 : q ≠ S.triangle.v1 := by
    unfold Problem97.FiniteEndpointShell.I3 at hqI3
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hqI3).2).1
  rcases hEnds with hFirstLast | hLastFirst
  · have hi_ne_last : i ≠ Problem97.CGN.lastIndex Packet.hm := by
      intro hi_last
      apply hq_ne_v2
      calc
        q = L.points i := hi.symm
        _ = L.points (Problem97.CGN.lastIndex Packet.hm) := by simp [hi_last]
        _ = S.triangle.v2 := hFirstLast.2
    have hi_rev_lt_last : i.rev < Problem97.CGN.lastIndex Packet.hm := by
      apply Fin.lt_def.mpr
      rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
      have hi_lt_top : i.val < m := i.is_lt
      have hi_ne_zero : i.val ≠ 0 := by
        intro hi_zero
        have hi_first : i = Problem97.CGN.firstIndex Packet.hm := by
          ext
          simpa [Problem97.CGN.firstIndex] using hi_zero
        apply hq_ne_v1
        calc
          q = L.points i := hi.symm
          _ = L.points (Problem97.CGN.firstIndex Packet.hm) := by simp [hi_first]
          _ = S.triangle.v1 := hFirstLast.1
      omega
    have hmono :
        Problem97.FiniteEndpoint.E3L20b_rightEndpoint_capDistance_strict
          (L.points (Problem97.CGN.lastIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev L) :=
      Problem97.FiniteEndpoint.E3L20b_of_cgnCapData Packet Hside Hord
    have hlt :=
      hmono (i := i.rev) (j := Problem97.CGN.lastIndex Packet.hm) hi_rev_lt_last
    have hlast_rev_first :
        (Problem97.CGN.lastIndex Packet.hm).rev = Problem97.CGN.firstIndex Packet.hm := by
      ext
      rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
      simp [Problem97.CGN.firstIndex]
      omega
    simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev_points,
      hi, hFirstLast.1, hFirstLast.2, hlast_rev_first] using hlt
  · have hi_lt_last : i < Problem97.CGN.lastIndex Packet.hm := by
      apply Fin.lt_def.mpr
      rw [Problem97.CGN.lastIndex_val]
      have hi_lt_top : i.val < m := i.is_lt
      have hi_ne_last : i ≠ Problem97.CGN.lastIndex Packet.hm := by
        intro hi_last
        apply hq_ne_v1
        calc
          q = L.points i := hi.symm
          _ = L.points (Problem97.CGN.lastIndex Packet.hm) := by simp [hi_last]
          _ = S.triangle.v1 := hLastFirst.2
      have hi_ne_top : i.val ≠ m - 1 := by
        intro hi_top
        apply hi_ne_last
        ext
        simpa [Problem97.CGN.lastIndex, Problem97.CGN.finIndex] using hi_top
      omega
    have hmono :
        Problem97.FiniteEndpoint.E3L20a_leftEndpoint_capDistance_strict
          (L.points (Problem97.CGN.firstIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap L) :=
      Problem97.FiniteEndpoint.E3L20a_of_cgnCapData Packet Hside Hord
    have hlt :=
      hmono (i := i) (j := Problem97.CGN.lastIndex Packet.hm) hi_lt_last
    simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap_points,
      hi, hLastFirst.1, hLastFirst.2] using hlt
theorem pEqB_column_impossible
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s t : ℝ}
    (hB : S.IsFormB_v1 r)
    (hlower : FormBv1A2SelectorV2LowerPacket S Z r s)
    (hpacket3 : SelectorV3PeqBPacket S Z t) :
    False := by
  classical
  rcases hlower with ⟨hA2, ha2eq, hTcard, hI2sub, hC1eq, hC3eq⟩
  rcases hpacket3 with ⟨hI3sub, hpBeq, hqeqC2⟩
  let T := S.witnessClassAt_v2 s
  have hv3T : S.triangle.v3 ∈ T := by
    have hmem : S.triangle.v3 ∈ ({S.triangle.v3} : Finset ℝ²) := by simp
    rw [← hC1eq] at hmem
    exact (Finset.mem_inter.mp hmem).1
  have hq :
      (Z.a3 : ℝ²) ∈ T ∩ S.CP.C3 ∨ (Z.b3 : ℝ²) ∈ T ∩ S.CP.C3 := by
    rcases hC3eq with hqa3 | hqb3
    · left
      have hmem : Z.a3 ∈ ({Z.a3} : Finset ℝ²) := by simp
      rw [← hqa3] at hmem
      exact hmem
    · right
      have hmem : Z.b3 ∈ ({Z.b3} : Finset ℝ²) := by simp
      rw [← hqb3] at hmem
      exact hmem
  obtain ⟨q, hqI3, hqT2⟩ : ∃ q : ℝ², q ∈ S.I3 ∧ q ∈ T := by
    rcases hq with hqa3 | hqb3
    · refine ⟨Z.a3, ?_, ?_⟩
      · rw [Z.hI3]
        simp
      · exact (Finset.mem_inter.mp hqa3).1
    · refine ⟨Z.b3, ?_, ?_⟩
      · rw [Z.hI3]
        simp
      · exact (Finset.mem_inter.mp hqb3).1
  have hv2T3 : S.triangle.v2 ∈ S.witnessClassAt_v3 t := by
    have hmem : S.triangle.v2 ∈ ({S.triangle.v2} : Finset ℝ²) := by simp
    rw [← hpBeq] at hmem
    exact (Finset.mem_inter.mp hmem).1
  have hqT3 : q ∈ S.witnessClassAt_v3 t := hI3sub hqI3
  have hv3rad : dist S.triangle.v2 S.triangle.v3 = s := by
    simpa using (Finset.mem_filter.mp hv3T).2
  have hqrad2 : dist S.triangle.v2 q = s := by
    simpa using (Finset.mem_filter.mp hqT2).2
  have hv2rad3 : dist S.triangle.v3 S.triangle.v2 = t := by
    simpa using (Finset.mem_filter.mp hv2T3).2
  have hqrad3 : dist S.triangle.v3 q = t := by
    simpa using (Finset.mem_filter.mp hqT3).2
  have hBq : dist S.triangle.v2 q = dist S.triangle.v2 S.triangle.v3 := by
    rw [hqrad2, hv3rad]
  have hDq : dist S.triangle.v3 q = dist S.triangle.v2 S.triangle.v3 := by
    rw [hqrad3, ← hv2rad3, dist_comm]
  have hsmall : dist S.triangle.v2 S.triangle.v3 < dist S.triangle.v1 S.triangle.v2 := by
    have hq_lt_base : dist S.triangle.v2 q < dist S.triangle.v2 S.triangle.v1 :=
      S.b3n9m056_v2_lt_v2v1_of_mem_I3 hqI3
    calc
      dist S.triangle.v2 S.triangle.v3 = dist S.triangle.v2 q := by rw [hBq]
      _ < dist S.triangle.v2 S.triangle.v1 := hq_lt_base
      _ = dist S.triangle.v1 S.triangle.v2 := by rw [dist_comm]
  have hlong : dist S.triangle.v1 S.triangle.v2 < dist S.triangle.v1 S.triangle.v3 := by
    have ha2T1 : Z.a2 ∈ S.witnessClassAt_v1 r := by
      have ha2mem : Z.a2 ∈ ({Z.a2} : Finset ℝ²) := by simp
      rw [← ha2eq] at ha2mem
      exact (Finset.mem_inter.mp ha2mem).1
    have hv2T1 : S.triangle.v2 ∈ S.witnessClassAt_v1 r := by
      rcases hB with ⟨x, hxI2, hxeq, hv2eq⟩
      have hv2mem : S.triangle.v2 ∈ ({S.triangle.v2} : Finset ℝ²) := by simp
      rw [← hv2eq] at hv2mem
      exact (Finset.mem_inter.mp hv2mem).1
    have hbase_eq : dist S.triangle.v1 S.triangle.v2 = dist S.triangle.v1 Z.a2 := by
      have hv2dist : dist S.triangle.v1 S.triangle.v2 = r := by
        simpa using (Finset.mem_filter.mp hv2T1).2
      have ha2dist : dist S.triangle.v1 Z.a2 = r := by
        simpa using (Finset.mem_filter.mp ha2T1).2
      rw [hv2dist, ha2dist]
    have h := S.b3n9m056_v1_lt_v1v3_of_mem_I2 (p := Z.a2) hA2
    rwa [← hbase_eq] at h
  exact S.pEqB_row_impossible_of_equilateral hqI3 hBq hDq hsmall hlong
end FiniteEndpointShell
end Problem97
end Batch3N9
end Batch3N9Unit056

-- Original module: Solutions.Batch3N9.N4d.BisectorKill
section Batch3N9Unit057
namespace Batch3N9
open scoped EuclideanGeometry
open Finset
namespace Problem97
theorem b3n9m057_bisectorKill_dist_sq_coords (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 :=
  Problem97.dist_sq_coord x y
theorem b3n9m057_bisectorKill_scalar (bx ox oy px py qx qy xx xy : ℝ)
    (hXperp : (xx - bx) * (px - qx) + xy * (py - qy) = 0)
    (hdperp : (px + qx - 2 * bx) * (px - qx) + (py + qy) * (py - qy) = 0)
    (hPQ : (px - qx) ^ 2 + (py - qy) ^ 2 > 0)
    (hdisk : (xx - ox) ^ 2 + (xy - oy) ^ 2 ≤ (bx - ox) ^ 2 + oy ^ 2)
    (hXy : xy ≤ 0) (hdy : 0 < py + qy)
    (hinner : (px + qx - 2 * bx) * (bx - ox) + (py + qy) * (-oy) < 0)
    (hXne : ¬ (xx = bx ∧ xy = 0)) : False := by
  set dx := px + qx - 2 * bx with hdx
  set dy := py + qy with hdy_def
  set e1 := px - qx with he1
  set e2 := py - qy with he2
  set wx := xx - bx with hwx
  have hcross : (wx * dy - xy * dx) * (e1 ^ 2 + e2 ^ 2) = 0 := by
    have h1 : wx * e1 + xy * e2 = 0 := hXperp
    have h2 : dx * e1 + dy * e2 = 0 := hdperp
    linear_combination (dy * e1 - dx * e2) * h1 + (wx * e2 - xy * e1) * h2
  have hcross' : wx * dy - xy * dx = 0 := by
    rcases mul_eq_zero.mp hcross with h | h
    · exact h
    · exfalso; nlinarith only [hPQ, h]
  have hdy_ne : dy ≠ 0 := ne_of_gt hdy
  set u := xy / dy with hu
  have hxy_eq : xy = u * dy := by rw [hu]; field_simp
  have hwx_eq : wx = u * dx := by
    rw [hu, div_mul_eq_mul_div, eq_div_iff hdy_ne]; linarith [hcross']
  have hu_le : u ≤ 0 := by
    by_contra h; push_neg at h
    have : 0 < u * dy := mul_pos h hdy
    rw [← hxy_eq] at this; linarith [hXy]
  have hu_ne : u ≠ 0 := by
    intro h0; apply hXne
    refine ⟨?_, ?_⟩
    · have : wx = 0 := by rw [hwx_eq, h0]; ring
      simp only [hwx] at this; linarith
    · have : xy = 0 := by rw [hxy_eq, h0]; ring
      linarith
  have hu_lt : u < 0 := lt_of_le_of_ne hu_le hu_ne
  have hxx : xx = bx + u * dx := by
    have := hwx_eq; simp only [hwx] at this; linarith
  have hmargin :
      (xx - ox) ^ 2 + (xy - oy) ^ 2 - ((bx - ox) ^ 2 + oy ^ 2)
        = u * (u * (dx ^ 2 + dy ^ 2) + 2 * (dx * (bx - ox) + dy * (-oy))) := by
    rw [hxx, hxy_eq]; ring
  have hsecond : u * (dx ^ 2 + dy ^ 2) + 2 * (dx * (bx - ox) + dy * (-oy)) < 0 := by
    have h1 : u * (dx ^ 2 + dy ^ 2) ≤ 0 :=
      mul_nonpos_of_nonpos_of_nonneg (le_of_lt hu_lt) (by positivity)
    nlinarith only [hinner, h1]
  have hprod : 0 < u * (u * (dx ^ 2 + dy ^ 2) + 2 * (dx * (bx - ox) + dy * (-oy))) :=
    mul_pos_of_neg_of_neg hu_lt hsecond
  linarith [hmargin, hprod, hdisk]
set_option maxHeartbeats 1000000 in
theorem bisectorKill (B O P Q X : ℝ²)
    (hXdisk : dist X O ≤ dist B O)
    (hXeq : dist X P = dist X Q)
    (hBeq : dist B P = dist B Q)
    (hBy0 : B 1 = 0)
    (hXy : X 1 ≤ 0)
    (hdy : 0 < (P 1 - B 1) + (Q 1 - B 1))
    (hinner : ((P 0 - B 0) + (Q 0 - B 0)) * (B 0 - O 0)
       + ((P 1 - B 1) + (Q 1 - B 1)) * (B 1 - O 1) < 0)
    (hPQ : P ≠ Q) (hXne : X ≠ B) : False := by
  have hXsq : dist X P ^ 2 = dist X Q ^ 2 := by rw [hXeq]
  have hBsq : dist B P ^ 2 = dist B Q ^ 2 := by rw [hBeq]
  have hdsq : dist X O ^ 2 ≤ dist B O ^ 2 := pow_le_pow_left₀ dist_nonneg hXdisk 2
  rw [b3n9m057_bisectorKill_dist_sq_coords, b3n9m057_bisectorKill_dist_sq_coords] at hXsq hBsq hdsq
  have hPQne : (P 0 - Q 0) ^ 2 + (P 1 - Q 1) ^ 2 > 0 := by
    rcases lt_or_eq_of_le
        (show (0 : ℝ) ≤ (P 0 - Q 0) ^ 2 + (P 1 - Q 1) ^ 2 by positivity) with h | h
    · exact h
    · exfalso; apply hPQ
      ext i; fin_cases i
      · change P 0 = Q 0; nlinarith only [h, sq_nonneg (P 0 - Q 0), sq_nonneg (P 1 - Q 1)]
      · change P 1 = Q 1; nlinarith only [h, sq_nonneg (P 0 - Q 0), sq_nonneg (P 1 - Q 1)]
  have hXneq : ¬ (X 0 = B 0 ∧ X 1 = 0) := by
    rintro ⟨he0, he1⟩; apply hXne
    ext i; fin_cases i
    · exact he0
    · change X 1 = B 1; rw [he1, hBy0]
  rw [hBy0] at hBsq hdsq hdy hinner
  set bx := B 0; clear_value bx
  set ox := O 0; clear_value ox
  set oy := O 1; clear_value oy
  set px := P 0; clear_value px
  set py := P 1; clear_value py
  set qx := Q 0; clear_value qx
  set qy := Q 1; clear_value qy
  set xx := X 0; clear_value xx
  set xy := X 1; clear_value xy
  apply b3n9m057_bisectorKill_scalar bx ox oy px py qx qy xx xy
  · nlinarith only [hBsq, hXsq]
  · nlinarith only [hBsq]
  · exact hPQne
  · nlinarith only [hdsq]
  · exact hXy
  · linarith [hdy]
  · nlinarith only [hinner]
  · exact hXneq
end Problem97
end Batch3N9
end Batch3N9Unit057

-- Original module: Solutions.Batch3N9.A1ContextProducers
section Batch3N9Unit058
namespace Batch3N9
open scoped EuclideanGeometry
open Finset
namespace Problem97
namespace FiniteEndpointShell
end FiniteEndpointShell
end Problem97
end Batch3N9
end Batch3N9Unit058

-- Original module: Solutions.Batch3N9.A1B2FrameNormalization
section Batch3N9Unit059
namespace Batch3N9
open scoped EuclideanGeometry
open Finset
namespace Problem97
namespace FiniteEndpointShell
end FiniteEndpointShell
end Problem97
end Batch3N9
end Batch3N9Unit059

-- Original module: Solutions.Batch3N9.N4d.ExcludesFormAv1
section Batch3N9Unit054
namespace Batch3N9
open scoped EuclideanGeometry
open Finset
namespace Problem97
namespace FiniteEndpointShell
theorem b3n9m054_hneg_of_cyclicShift_local
    {n : ℕ} {phi : Fin n → ℝ²}
    (hneg : ∀ {i j k : Fin n}, i < j → j < k →
      Problem97.signedArea2 (phi i) (phi j) (phi k) < 0)
    (cut : Fin n) :
    ∀ {i j k : Fin n}, i < j → j < k →
      Problem97.signedArea2 (phi (i + cut)) (phi (j + cut)) (phi (k + cut)) < 0 := by
  have hcyc {a b c : ℝ²} :
      Problem97.signedArea2 a b c = Problem97.signedArea2 c a b := by
    simp [Problem97.signedArea2]
    ring
  let bound : ℕ := n - cut.val
  have hval_nowrap {t : Fin n} (ht : (t : ℕ) < bound) :
      ((t + cut : Fin n) : ℕ) = t.val + cut.val := by
    rw [Fin.val_add_eq_ite]
    have hlt : ¬ n ≤ t.val + cut.val := by
      omega
    simp [hlt]
  have hval_wrap {t : Fin n} (ht : bound ≤ (t : ℕ)) :
      ((t + cut : Fin n) : ℕ) = t.val - bound := by
    rw [Fin.val_add_eq_ite]
    have hge : n ≤ t.val + cut.val := by
      omega
    simp [hge]
    omega
  intro i j k hij hjk
  by_cases hk : (k : ℕ) < bound
  · have hi : (i : ℕ) < bound := by omega
    have hj : (j : ℕ) < bound := by omega
    have hij' : i + cut < j + cut := by
      change (((i + cut : Fin n) : ℕ) < ((j + cut : Fin n) : ℕ))
      rw [hval_nowrap hi, hval_nowrap hj]
      omega
    have hjk' : j + cut < k + cut := by
      change (((j + cut : Fin n) : ℕ) < ((k + cut : Fin n) : ℕ))
      rw [hval_nowrap hj, hval_nowrap hk]
      omega
    exact hneg hij' hjk'
  · by_cases hj : (j : ℕ) < bound
    · have hi : (i : ℕ) < bound := by omega
      have hk' : bound ≤ (k : ℕ) := by omega
      have hki : k + cut < i + cut := by
        change (((k + cut : Fin n) : ℕ) < ((i + cut : Fin n) : ℕ))
        rw [hval_wrap hk', hval_nowrap hi]
        omega
      have hij' : i + cut < j + cut := by
        change (((i + cut : Fin n) : ℕ) < ((j + cut : Fin n) : ℕ))
        rw [hval_nowrap hi, hval_nowrap hj]
        omega
      have hneg' :
          Problem97.signedArea2 (phi (k + cut)) (phi (i + cut)) (phi (j + cut)) < 0 :=
        hneg hki hij'
      simpa [hcyc] using hneg'
    · by_cases hi : (i : ℕ) < bound
      · have hj' : bound ≤ (j : ℕ) := by omega
        have hk' : bound ≤ (k : ℕ) := by omega
        have hjk'' : j + cut < k + cut := by
          change (((j + cut : Fin n) : ℕ) < ((k + cut : Fin n) : ℕ))
          rw [hval_wrap hj', hval_wrap hk']
          omega
        have hki : k + cut < i + cut := by
          change (((k + cut : Fin n) : ℕ) < ((i + cut : Fin n) : ℕ))
          rw [hval_wrap hk', hval_nowrap hi]
          omega
        have hneg' :
            Problem97.signedArea2 (phi (j + cut)) (phi (k + cut)) (phi (i + cut)) < 0 :=
          hneg hjk'' hki
        simpa [hcyc] using hneg'
      · have hi' : bound ≤ (i : ℕ) := by omega
        have hj' : bound ≤ (j : ℕ) := by omega
        have hk' : bound ≤ (k : ℕ) := by omega
        have hij' : i + cut < j + cut := by
          change (((i + cut : Fin n) : ℕ) < ((j + cut : Fin n) : ℕ))
          rw [hval_wrap hi', hval_wrap hj']
          omega
        have hjk' : j + cut < k + cut := by
          change (((j + cut : Fin n) : ℕ) < ((k + cut : Fin n) : ℕ))
          rw [hval_wrap hj', hval_wrap hk']
          omega
        exact hneg hij' hjk'
theorem b3n9m054_supportCap_interval_of_oppositeFirst_local
    {A C : Finset ℝ²} {n : ℕ} {phi : Fin n → ℝ²}
    {u v w : ℝ²}
    (_hphi_inj : Function.Injective phi)
    (hphi_image : Finset.univ.image phi = A)
    (hneg : ∀ {i j k : Fin n}, i < j → j < k →
      Problem97.signedArea2 (phi i) (phi j) (phi k) < 0)
    (hC_subset : C ⊆ A)
    (hC_arc : ∀ x ∈ A, x ∈ C ↔ Problem97.OnArcOpposite u v w x)
    (hv_mem : v ∈ C)
    (hw_mem : w ∈ C)
    {u_idx v_idx w_idx : Fin n}
    (hu : phi u_idx = u)
    (hv : phi v_idx = v)
    (hw : phi w_idx = w)
    (huv : u_idx < v_idx)
    (hvw : v_idx < w_idx) :
    ∀ x : ℝ², x ∈ C ↔ ∃ q : Fin n, v_idx ≤ q ∧ q ≤ w_idx ∧ phi q = x := by
  have hu_neg : Problem97.signedArea2 u v w < 0 := by
    simpa [hu, hv, hw] using hneg huv hvw
  intro x
  constructor
  · intro hxC
    have hxA : x ∈ A := hC_subset hxC
    rw [← hphi_image] at hxA
    rcases Finset.mem_image.mp hxA with ⟨q, _, rfl⟩
    have hqA : phi q ∈ A := by
      rw [← hphi_image]
      exact Finset.mem_image_of_mem _ (Finset.mem_univ q)
    have hq_arc : Problem97.OnArcOpposite u v w (phi q) :=
      (hC_arc (phi q) hqA).1 hxC
    have hnot_lt_left : ¬ q < v_idx := by
      intro hqv
      have hq_neg : Problem97.signedArea2 (phi q) v w < 0 := by
        simpa [hv, hw] using hneg hqv hvw
      have hprod_pos :
          0 < Problem97.signedArea2 (phi q) v w * Problem97.signedArea2 u v w := by
        have h1 : 0 < -Problem97.signedArea2 (phi q) v w := by linarith
        have h2 : 0 < -Problem97.signedArea2 u v w := by linarith
        have hpos :
            0 < (-Problem97.signedArea2 (phi q) v w) *
              (-Problem97.signedArea2 u v w) := by positivity
        simpa [neg_mul_neg] using hpos
      unfold Problem97.OnArcOpposite at hq_arc
      linarith
    have hnot_lt_right : ¬ w_idx < q := by
      intro hwq
      have hq_neg_vwx : Problem97.signedArea2 v w (phi q) < 0 := by
        simpa [hv, hw] using hneg hvw hwq
      have hcyc : Problem97.signedArea2 (phi q) v w =
          Problem97.signedArea2 v w (phi q) := by
        simp [Problem97.signedArea2]
        ring
      have hq_neg : Problem97.signedArea2 (phi q) v w < 0 := by
        rw [hcyc]
        exact hq_neg_vwx
      have hprod_pos :
          0 < Problem97.signedArea2 (phi q) v w * Problem97.signedArea2 u v w := by
        have h1 : 0 < -Problem97.signedArea2 (phi q) v w := by linarith
        have h2 : 0 < -Problem97.signedArea2 u v w := by linarith
        have hpos :
            0 < (-Problem97.signedArea2 (phi q) v w) *
              (-Problem97.signedArea2 u v w) := by positivity
        simpa [neg_mul_neg] using hpos
      unfold Problem97.OnArcOpposite at hq_arc
      linarith
    exact ⟨q, le_of_not_gt hnot_lt_left, le_of_not_gt hnot_lt_right, rfl⟩
  · rintro ⟨q, hvle, hqle, rfl⟩
    have hqA : phi q ∈ A := by
      rw [← hphi_image]
      exact Finset.mem_image_of_mem _ (Finset.mem_univ q)
    rcases eq_or_lt_of_le hvle with rfl | hvq
    · simpa [hv] using hv_mem
    rcases eq_or_lt_of_le hqle with rfl | hqw
    · simpa [hw] using hw_mem
    · have hmid_neg : Problem97.signedArea2 v (phi q) w < 0 := by
        simpa [hv, hw] using hneg hvq hqw
      have hcyc : Problem97.signedArea2 (phi q) v w =
          Problem97.signedArea2 v w (phi q) := by
        simp [Problem97.signedArea2]
        ring
      have hswap : Problem97.signedArea2 v w (phi q) =
          -Problem97.signedArea2 v (phi q) w := by
        simp [Problem97.signedArea2]
      have hq_pos : 0 < Problem97.signedArea2 (phi q) v w := by
        rw [hcyc, hswap]
        linarith
      have hq_arc : Problem97.OnArcOpposite u v w (phi q) := by
        unfold Problem97.OnArcOpposite
        have hprod_nonpos :
            Problem97.signedArea2 (phi q) v w * Problem97.signedArea2 u v w ≤ 0 := by
          nlinarith only [hu_neg, hmid_neg, hcyc, hswap]
        exact hprod_nonpos
      exact (hC_arc (phi q) hqA).2 hq_arc
theorem c1_vertex_same_open_side_as_v3
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {p : ℝ²}
    (hpI1 : p ∈ S.I1) :
    0 < signedArea2 p S.triangle.v1 S.triangle.v2 *
      signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 := by
  classical
  have hp_ne_v3 : p ≠ S.triangle.v3 := (Finset.mem_erase.mp hpI1).1
  have hp_ne_v2 : p ≠ S.triangle.v2 :=
    (Finset.mem_erase.mp (Finset.mem_erase.mp hpI1).2).1
  have hpC1 : p ∈ S.CP.C1 := by
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hpI1).2).2
  obtain ⟨n, hn, phi, hphi_inj, hphi_image, hccw⟩ :=
    Problem97.CGN.CGN4g0_globalBoundaryOrder_of_convexIndep S.hconv S.hnoncol
  haveI : NeZero n := ⟨by omega⟩
  let i0 : Fin n := 0
  have hneg : ∀ {i j k : Fin n}, i < j → j < k →
      Problem97.signedArea2 (phi i) (phi j) (phi k) < 0 := by
    intro i j k hij hjk
    have hij_ne : phi i ≠ phi j := by
      intro h
      exact (ne_of_lt hij) (hphi_inj h)
    have hkj_ne : phi k ≠ phi j := by
      intro h
      exact (ne_of_gt hjk) (hphi_inj h)
    have hswap : Problem97.signedArea2 (phi j) (phi i) (phi k) =
        -Problem97.signedArea2 (phi i) (phi j) (phi k) := by
      simp [Problem97.signedArea2]
      ring
    have hsign :
        SignType.sign (Problem97.signedArea2 (phi j) (phi i) (phi k)) = 1 := by
      rw [Problem97.signedArea2_sign_eq_oangle_sign (phi j) (phi i) (phi k) hij_ne hkj_ne]
      exact hccw.sign_oangle hij hjk
    have hpos : 0 < Problem97.signedArea2 (phi j) (phi i) (phi k) :=
      (sign_eq_one_iff).mp hsign
    linarith
  have hv1A : S.triangle.v1 ∈ Finset.univ.image phi := by
    rw [hphi_image]
    exact S.triangle.v1_mem
  have hv2A : S.triangle.v2 ∈ Finset.univ.image phi := by
    rw [hphi_image]
    exact S.triangle.v2_mem
  have hv3A : S.triangle.v3 ∈ Finset.univ.image phi := by
    rw [hphi_image]
    exact S.triangle.v3_mem
  rcases Finset.mem_image.mp hv1A with ⟨i1, _, hi1⟩
  rcases Finset.mem_image.mp hv2A with ⟨i2, _, hi2⟩
  rcases Finset.mem_image.mp hv3A with ⟨i3, _, hi3⟩
  let psi : Fin n → ℝ² := fun t => phi (t + i1)
  have hpsi_inj : Function.Injective psi := by
    intro a b hab
    apply (finCycle i1).injective
    exact hphi_inj hab
  have hpsi_image : Finset.univ.image psi = A := by
    calc
      Finset.univ.image psi = Finset.univ.image (fun t : Fin n => phi (t + i1)) := rfl
      _ = Finset.univ.image phi := by
        ext x
        constructor
        · intro hx
          rcases Finset.mem_image.mp hx with ⟨t, _, rfl⟩
          exact Finset.mem_image_of_mem phi (Finset.mem_univ _)
        · intro hx
          rcases Finset.mem_image.mp hx with ⟨q, _, rfl⟩
          refine Finset.mem_image.mpr ?_
          refine ⟨q - i1, Finset.mem_univ _, ?_⟩
          simpa [psi, finCycle] using (Equiv.apply_symm_apply (finCycle i1) q)
      _ = A := hphi_image
  have hneg_shift :
      ∀ {i j k : Fin n}, i < j → j < k →
        Problem97.signedArea2 (psi i) (psi j) (psi k) < 0 := by
    intro i j k hij hjk
    simpa [psi] using
      (b3n9m054_hneg_of_cyclicShift_local (phi := phi) hneg i1 hij hjk :
        Problem97.signedArea2 (phi (i + i1)) (phi (j + i1)) (phi (k + i1)) < 0)
  have hpsi0 : psi i0 = S.triangle.v1 := by
    simpa [psi, i0, hi1]
  have hshift_i2 : (i2 - i1) + i1 = i2 := by
    simpa [finCycle] using (Equiv.apply_symm_apply (finCycle i1) i2)
  have hshift_i3 : (i3 - i1) + i1 = i3 := by
    simpa [finCycle] using (Equiv.apply_symm_apply (finCycle i1) i3)
  have hi2_ne_i1 : i2 ≠ i1 := by
    intro h
    exact S.triangle.v12_ne (by simpa [hi1, hi2] using congrArg phi h.symm)
  have hi3_ne_i1 : i3 ≠ i1 := by
    intro h
    exact S.triangle.v13_ne (by simpa [hi1, hi3] using congrArg phi h.symm)
  have hi2_ne_i3 : i2 ≠ i3 := by
    intro h
    exact S.triangle.v23_ne (by simpa [hi2, hi3] using congrArg phi h)
  have hi2_pos : i0 < i2 - i1 := by
    exact Fin.pos_iff_ne_zero.mpr (by
      intro h0
      apply hi2_ne_i1
      have h := congrArg (fun t : Fin n => t + i1) h0
      simpa [i0, hshift_i2] using h)
  have hi3_pos : i0 < i3 - i1 := by
    exact Fin.pos_iff_ne_zero.mpr (by
      intro h0
      apply hi3_ne_i1
      have h := congrArg (fun t : Fin n => t + i1) h0
      simpa [i0, hshift_i3] using h)
  have hcyc {a b c : ℝ²} :
      Problem97.signedArea2 a b c = Problem97.signedArea2 c a b := by
    simp [Problem97.signedArea2]
    ring
  have hswap {a b c : ℝ²} :
      Problem97.signedArea2 a b c = -Problem97.signedArea2 a c b := by
    simp [Problem97.signedArea2]
  by_cases h23 : i2 - i1 < i3 - i1
  · have hpsi_i2 : psi (i2 - i1) = S.triangle.v2 := by
      simpa [psi, hshift_i2] using hi2
    have hpsi_i3 : psi (i3 - i1) = S.triangle.v3 := by
      simpa [psi, hshift_i3] using hi3
    have hC1_interval :
        ∀ x : ℝ², x ∈ S.CP.C1 ↔
          ∃ q : Fin n, i2 - i1 ≤ q ∧ q ≤ i3 - i1 ∧ psi q = x := by
      simpa [psi, hshift_i2, hshift_i3] using
        b3n9m054_supportCap_interval_of_oppositeFirst_local
          (A := A) (C := S.CP.C1) (phi := psi)
          hpsi_inj hpsi_image hneg_shift S.CP.C1_subset
          (fun x hxA => (S.CP.arc_membership x hxA).1)
          S.CP.v2_mem_C1 S.CP.v3_mem_C1
          (u_idx := i0) (v_idx := i2 - i1) (w_idx := i3 - i1)
          hpsi0 hpsi_i2 hpsi_i3 hi2_pos h23
    rcases (hC1_interval p).1 hpC1 with ⟨q, hqlo, hqhi, hqeq⟩
    have hq_ne_left : q ≠ i2 - i1 := by
      intro hq
      apply hp_ne_v2
      calc
        p = psi q := hqeq.symm
        _ = psi (i2 - i1) := by simp [hq]
        _ = S.triangle.v2 := hpsi_i2
    have hq_ne_right : q ≠ i3 - i1 := by
      intro hq
      apply hp_ne_v3
      calc
        p = psi q := hqeq.symm
        _ = psi (i3 - i1) := by simp [hq]
        _ = S.triangle.v3 := hpsi_i3
    have hqgt : i2 - i1 < q := lt_of_le_of_ne hqlo hq_ne_left.symm
    have hqlt3 : q < i3 - i1 := lt_of_le_of_ne hqhi hq_ne_right
    have hp_neg :
        Problem97.signedArea2 (psi i0) (psi (i2 - i1)) (psi q) < 0 := hneg_shift hi2_pos hqgt
    have hv3_neg :
        Problem97.signedArea2 (psi i0) (psi (i2 - i1)) (psi (i3 - i1)) < 0 := hneg_shift hi2_pos h23
    have hp_side : Problem97.signedArea2 p S.triangle.v1 S.triangle.v2 < 0 := by
      rw [← hqeq, ← hpsi0, ← hpsi_i2]
      simpa [hcyc] using hp_neg
    have hv3_side :
        Problem97.signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 < 0 := by
      rw [← hpsi0, ← hpsi_i2, ← hpsi_i3]
      simpa [hcyc] using hv3_neg
    exact mul_pos_of_neg_of_neg hp_side hv3_side
  · have h32 : i3 - i1 < i2 - i1 := by
      have hle : i3 - i1 ≤ i2 - i1 := le_of_not_gt h23
      have hne : i3 - i1 ≠ i2 - i1 := by
        intro h
        apply hi2_ne_i3
        have h' := congrArg (fun t : Fin n => t + i1) h
        simpa [hshift_i2, hshift_i3] using h'.symm
      exact lt_of_le_of_ne hle hne
    have hpsi_i2 : psi (i2 - i1) = S.triangle.v2 := by
      simpa [psi, hshift_i2] using hi2
    have hpsi_i3 : psi (i3 - i1) = S.triangle.v3 := by
      simpa [psi, hshift_i3] using hi3
    have hC1_arc_swap :
        ∀ x ∈ A,
          x ∈ S.CP.C1 ↔ Problem97.OnArcOpposite S.triangle.v1 S.triangle.v3 S.triangle.v2 x := by
      intro x hxA
      have hC1_arc := (S.CP.arc_membership x hxA).1
      constructor
      · intro hx
        have hx' : Problem97.OnArcOpposite S.triangle.v1 S.triangle.v2 S.triangle.v3 x :=
          hC1_arc.mp hx
        unfold Problem97.OnArcOpposite at hx' ⊢
        have hxswap : signedArea2 x S.triangle.v3 S.triangle.v2 =
            -signedArea2 x S.triangle.v2 S.triangle.v3 := by
          simpa using (hswap (a := x) (b := S.triangle.v3) (c := S.triangle.v2))
        have hvswap : signedArea2 S.triangle.v1 S.triangle.v3 S.triangle.v2 =
            -signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3 := by
          simpa using (hswap (a := S.triangle.v1) (b := S.triangle.v3) (c := S.triangle.v2))
        calc
          signedArea2 x S.triangle.v3 S.triangle.v2 *
              signedArea2 S.triangle.v1 S.triangle.v3 S.triangle.v2
              = (-signedArea2 x S.triangle.v2 S.triangle.v3) *
                  (-signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3) := by
                    rw [hxswap, hvswap]
          _ = signedArea2 x S.triangle.v2 S.triangle.v3 *
                signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3 := by ring
          _ ≤ 0 := hx'
      · intro hx
        have hx' : Problem97.OnArcOpposite S.triangle.v1 S.triangle.v3 S.triangle.v2 x :=
          hx
        unfold Problem97.OnArcOpposite at hx'
        have hxswap : signedArea2 x S.triangle.v2 S.triangle.v3 =
            -signedArea2 x S.triangle.v3 S.triangle.v2 := by
          simpa using (hswap (a := x) (b := S.triangle.v2) (c := S.triangle.v3))
        have hvswap : signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3 =
            -signedArea2 S.triangle.v1 S.triangle.v3 S.triangle.v2 := by
          simpa using (hswap (a := S.triangle.v1) (b := S.triangle.v2) (c := S.triangle.v3))
        have : signedArea2 x S.triangle.v2 S.triangle.v3 *
            signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3 ≤ 0 := by
          calc
            signedArea2 x S.triangle.v2 S.triangle.v3 *
                signedArea2 S.triangle.v1 S.triangle.v2 S.triangle.v3
                = (-signedArea2 x S.triangle.v3 S.triangle.v2) *
                    (-signedArea2 S.triangle.v1 S.triangle.v3 S.triangle.v2) := by
                      rw [hxswap, hvswap]
            _ = signedArea2 x S.triangle.v3 S.triangle.v2 *
                  signedArea2 S.triangle.v1 S.triangle.v3 S.triangle.v2 := by ring
            _ ≤ 0 := hx'
        exact hC1_arc.mpr this
    have hC1_interval :
        ∀ x : ℝ², x ∈ S.CP.C1 ↔
          ∃ q : Fin n, i3 - i1 ≤ q ∧ q ≤ i2 - i1 ∧ psi q = x := by
      simpa [psi, hshift_i2, hshift_i3] using
        b3n9m054_supportCap_interval_of_oppositeFirst_local
          (A := A) (C := S.CP.C1) (phi := psi)
          hpsi_inj hpsi_image hneg_shift S.CP.C1_subset
          hC1_arc_swap S.CP.v3_mem_C1 S.CP.v2_mem_C1
          (u_idx := i0) (v_idx := i3 - i1) (w_idx := i2 - i1)
          hpsi0 hpsi_i3 hpsi_i2 hi3_pos h32
    rcases (hC1_interval p).1 hpC1 with ⟨q, hqlo, hqhi, hqeq⟩
    have hq_ne_left : q ≠ i3 - i1 := by
      intro hq
      apply hp_ne_v3
      calc
        p = psi q := hqeq.symm
        _ = psi (i3 - i1) := by simp [hq]
        _ = S.triangle.v3 := hpsi_i3
    have hq_ne_right : q ≠ i2 - i1 := by
      intro hq
      apply hp_ne_v2
      calc
        p = psi q := hqeq.symm
        _ = psi (i2 - i1) := by simp [hq]
        _ = S.triangle.v2 := hpsi_i2
    have hqgt : i3 - i1 < q := lt_of_le_of_ne hqlo hq_ne_left.symm
    have hqlt2 : q < i2 - i1 := lt_of_le_of_ne hqhi hq_ne_right
    have hp_mid :
        Problem97.signedArea2 (psi i0) (psi q) (psi (i2 - i1)) < 0 :=
      hneg_shift (lt_trans hi3_pos hqgt) hqlt2
    have hv3_mid :
        Problem97.signedArea2 (psi i0) (psi (i3 - i1)) (psi (i2 - i1)) < 0 :=
      hneg_shift hi3_pos h32
    have hp_side : 0 < Problem97.signedArea2 p S.triangle.v1 S.triangle.v2 := by
      rw [← hqeq, ← hpsi0, ← hpsi_i2]
      have hq_side : 0 < Problem97.signedArea2 (psi i0) (psi (i2 - i1)) (psi q) := by
        have hswap_q :
            Problem97.signedArea2 (psi i0) (psi q) (psi (i2 - i1)) =
              -Problem97.signedArea2 (psi i0) (psi (i2 - i1)) (psi q) := by
          simpa using (hswap (a := psi i0) (b := psi q) (c := psi (i2 - i1)))
        have : -Problem97.signedArea2 (psi i0) (psi (i2 - i1)) (psi q) < 0 := by
          rw [← hswap_q]
          exact hp_mid
        linarith
      simpa [hcyc] using hq_side
    have hv3_side : 0 < Problem97.signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 := by
      rw [← hpsi0, ← hpsi_i2, ← hpsi_i3]
      have hv3_side' : 0 < Problem97.signedArea2 (psi i0) (psi (i2 - i1)) (psi (i3 - i1)) := by
        have hswap_3 :
            Problem97.signedArea2 (psi i0) (psi (i3 - i1)) (psi (i2 - i1)) =
              -Problem97.signedArea2 (psi i0) (psi (i2 - i1)) (psi (i3 - i1)) := by
          simpa using (hswap (a := psi i0) (b := psi (i3 - i1)) (c := psi (i2 - i1)))
        have : -Problem97.signedArea2 (psi i0) (psi (i2 - i1)) (psi (i3 - i1)) < 0 := by
          rw [← hswap_3]
          exact hv3_mid
        linarith
      simpa [hcyc] using hv3_side'
    exact mul_pos hp_side hv3_side

end FiniteEndpointShell
end Problem97
end Batch3N9
end Batch3N9Unit054

-- Original module: Solutions.Batch3N9.N4d.FaithfulFrame
section Batch3N9Unit060
namespace Batch3N9
open scoped EuclideanGeometry
open Finset
namespace Problem97
namespace FiniteEndpointShell
theorem b3n9m060_dist_sq_eq_coord_sq_add_coord_sq (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 := by
  first
  | exact Batch3N9.Problem97.FiniteEndpointShell.b3n9m051_dist_sq_eq_coord_sq_add_coord_sq
  | apply Batch3N9.Problem97.FiniteEndpointShell.b3n9m051_dist_sq_eq_coord_sq_add_coord_sq <;> assumption
noncomputable def b3n9m060_similarityTransportComp
    {T1 T2 : ℝ² → ℝ²}
    (tau1 : Problem97.CGN.SimilarityTransportData T1)
    (tau2 : Problem97.CGN.SimilarityTransportData T2) :
    Problem97.CGN.SimilarityTransportData (fun x => T2 (T1 x)) := by
  classical
  refine
    { scale := tau2.scale * tau1.scale
      scale_pos := mul_pos tau2.scale_pos tau1.scale_pos
      dist_image := ?_
      dist_eq_iff := ?_
      convexHull_mem_iff := ?_
      orientation := tau2.orientation * tau1.orientation
      orientation_sq := ?_
      halfplane_sign := ?_ }
  · intro a b
    rw [tau2.dist_image, tau1.dist_image]
    ring
  · intro a b c
    constructor
    · intro h
      exact (tau1.dist_eq_iff a b c).1 ((tau2.dist_eq_iff (T1 a) (T1 b) (T1 c)).1 h)
    · intro h
      exact (tau2.dist_eq_iff (T1 a) (T1 b) (T1 c)).2 ((tau1.dist_eq_iff a b c).2 h)
  · intro S a
    have himage :
        (fun x => T2 (T1 x)) '' S = T2 '' (T1 '' S) := by
      ext y
      constructor
      · intro hy
        rcases hy with ⟨x, hxS, rfl⟩
        exact ⟨T1 x, ⟨x, hxS, rfl⟩, rfl⟩
      · intro hy
        rcases hy with ⟨z, ⟨x, hxS, rfl⟩, rfl⟩
        exact ⟨x, hxS, rfl⟩
    rw [himage]
    exact Iff.trans
      (tau2.convexHull_mem_iff (S := T1 '' S) (a := T1 a))
      (tau1.convexHull_mem_iff (S := S) (a := a))
  · have h1 := tau2.orientation_sq
    have h2 := tau1.orientation_sq
    ring_nf
    nlinarith only [h1, h2]
  · intro a b c
    rw [tau2.halfplane_sign, tau1.halfplane_sign]
    ring
noncomputable def b3n9m060_halfShift (p : ℝ²) : ℝ² :=
  Problem97.CGN.vec2 ((p 0 + 1) / 2) (p 1 / 2)
theorem b3n9m060_halfShift_injective : Function.Injective b3n9m060_halfShift := by
  first
  | exact Batch3N9.Problem97.FiniteEndpointShell.b3n9m051_halfShift_injective
  | apply Batch3N9.Problem97.FiniteEndpointShell.b3n9m051_halfShift_injective <;> assumption
noncomputable def b3n9m060_halfShiftSimilarityTransportData :
    Problem97.CGN.SimilarityTransportData b3n9m060_halfShift := by
  classical
  let F : ℝ² →ₗ[ℝ] ℝ² := (1 / 2 : ℝ) • LinearMap.id
  let c : ℝ² := Problem97.CGN.vec2 ((1 : ℝ) / 2) 0
  let Taff : ℝ² →ᵃ[ℝ] ℝ² := AffineMap.mk' b3n9m060_halfShift F c (by
    intro p
    ext i <;> fin_cases i <;>
      simp [b3n9m060_halfShift, F, c, Problem97.CGN.vec2, EuclideanSpace.single_apply, Pi.add_apply]
    · ring
    · ring
    )
  have hdist0 : ∀ a b : ℝ², dist (b3n9m060_halfShift a) (b3n9m060_halfShift b) = ((1 : ℝ) / 2) * dist a b := by
    intro a b
    have hcoord :
        b3n9m060_halfShift a - b3n9m060_halfShift b =
          (1 / 2 : ℝ) • (a - b) := by
      ext i <;> fin_cases i <;>
        simp [b3n9m060_halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply, sub_eq_add_neg]
        <;> ring
    rw [dist_eq_norm, hcoord, norm_smul, Real.norm_of_nonneg (by positivity), dist_eq_norm]
  refine
    { scale := (1 : ℝ) / 2
      scale_pos := by positivity
      dist_image := ?_
      dist_eq_iff := ?_
      convexHull_mem_iff := ?_
      orientation := 1
      orientation_sq := by norm_num
      halfplane_sign := ?_ }
  · intro a b
    exact hdist0 a b
  · intro a b c
    constructor
    · intro h
      rw [hdist0 a b, hdist0 a c] at h
      nlinarith only [h]
    · intro h
      rw [hdist0 a b, hdist0 a c]
      nlinarith only [h]
  · intro S a
    have hmap : b3n9m060_halfShift '' convexHull ℝ S = convexHull ℝ (b3n9m060_halfShift '' S) := by
      simpa [Taff] using (AffineMap.image_convexHull Taff S)
    constructor
    · intro ha
      rw [← hmap] at ha
      rcases ha with ⟨b, hb, hTb⟩
      have hba : b = a := b3n9m060_halfShift_injective hTb
      simpa [hba] using hb
    · intro ha
      simpa [hmap] using (show b3n9m060_halfShift a ∈ b3n9m060_halfShift '' convexHull ℝ S from ⟨a, ha, rfl⟩)
  · intro a b c
    unfold b3n9m060_halfShift
    simp [Problem97.signedArea2, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    ring
noncomputable def b3n9m060_flipY (p : ℝ²) : ℝ² :=
  Problem97.CGN.vec2 (p 0) (-p 1)
theorem b3n9m060_flipY_injective : Function.Injective b3n9m060_flipY := by
  first
  | exact Batch3N9.Problem97.FiniteEndpointShell.b3n9m051_flipY_injective
  | apply Batch3N9.Problem97.FiniteEndpointShell.b3n9m051_flipY_injective <;> assumption
noncomputable def b3n9m060_flipYSimilarityTransportData :
    Problem97.CGN.SimilarityTransportData b3n9m060_flipY := by
  classical
  let F : ℝ² →ₗ[ℝ] ℝ² :=
    { toFun := b3n9m060_flipY
      map_add' := by
        intro x y
        ext i <;> fin_cases i <;>
          simp [b3n9m060_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
        · ring
      map_smul' := by
        intro r x
        ext i <;> fin_cases i <;>
          simp [b3n9m060_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
      }
  let Taff : ℝ² →ᵃ[ℝ] ℝ² := AffineMap.mk' b3n9m060_flipY F 0 (by
    intro p
    ext i <;> fin_cases i <;>
      simp [b3n9m060_flipY, F, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    )
  have hdist0 : ∀ a b : ℝ², dist (b3n9m060_flipY a) (b3n9m060_flipY b) = dist a b := by
    intro a b
    have hsq :
        ‖b3n9m060_flipY a - b3n9m060_flipY b‖ ^ 2 = ‖a - b‖ ^ 2 := by
      rw [EuclideanSpace.norm_sq_eq, EuclideanSpace.norm_sq_eq]
      simp [b3n9m060_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply, Fin.sum_univ_two, sq_abs,
        Real.norm_eq_abs, PiLp.sub_apply]
      ring
    have hnonneg1 : 0 ≤ ‖b3n9m060_flipY a - b3n9m060_flipY b‖ := norm_nonneg _
    have hnonneg2 : 0 ≤ ‖a - b‖ := norm_nonneg _
    rw [dist_eq_norm, dist_eq_norm]
    nlinarith only [hsq, hnonneg1, hnonneg2]
  refine
    { scale := 1
      scale_pos := by norm_num
      dist_image := ?_
      dist_eq_iff := ?_
      convexHull_mem_iff := ?_
      orientation := -1
      orientation_sq := by norm_num
      halfplane_sign := ?_ }
  · intro a b
    simpa using hdist0 a b
  · intro a b c
    simpa [hdist0 a b, hdist0 a c]
  · intro S a
    have hmap : b3n9m060_flipY '' convexHull ℝ S = convexHull ℝ (b3n9m060_flipY '' S) := by
      simpa [Taff] using (AffineMap.image_convexHull Taff S)
    constructor
    · intro ha
      rw [← hmap] at ha
      rcases ha with ⟨b, hb, hTb⟩
      have hba : b = a := b3n9m060_flipY_injective hTb
      simpa [hba] using hb
    · intro ha
      simpa [hmap] using (show b3n9m060_flipY a ∈ b3n9m060_flipY '' convexHull ℝ S from ⟨a, ha, rfl⟩)
  · intro a b c
    unfold b3n9m060_flipY
    simp [Problem97.signedArea2, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    ring
theorem b3n9m060_exists_base_transportData
    (q1 q2 : ℝ²) (hqne : q1 ≠ q2) :
    ∃ T0, ∃ tau0 : Problem97.CGN.SimilarityTransportData T0,
      T0 q1 = Problem97.CGN.vec2 (-1) 0 ∧
      T0 q2 = Problem97.CGN.vec2 1 0 := by
  first
  | exact Batch3N9.Problem97.FiniteEndpointShell.b3n9m051_exists_base_transportData
  | apply Batch3N9.Problem97.FiniteEndpointShell.b3n9m051_exists_base_transportData <;> assumption
theorem b3n9m060_vec2_coord0 (x y : ℝ) : (Problem97.CGN.vec2 x y) 0 = x := by
  simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
theorem b3n9m060_vec2_coord1 (x y : ℝ) : (Problem97.CGN.vec2 x y) 1 = y := by
  simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
theorem b3n9m060_dist_vec2_00_10 :
    dist (Problem97.CGN.vec2 (0 : ℝ) 0) (Problem97.CGN.vec2 (1 : ℝ) 0) = 1 := by
  have hsq : dist (Problem97.CGN.vec2 (0 : ℝ) 0) (Problem97.CGN.vec2 (1 : ℝ) 0) ^ 2 = 1 := by
    rw [b3n9m060_dist_sq_eq_coord_sq_add_coord_sq]
    simp [b3n9m060_vec2_coord0, b3n9m060_vec2_coord1]
  have hnn : 0 ≤ dist (Problem97.CGN.vec2 (0 : ℝ) 0) (Problem97.CGN.vec2 (1 : ℝ) 0) :=
    dist_nonneg
  calc dist (Problem97.CGN.vec2 (0 : ℝ) 0) (Problem97.CGN.vec2 (1 : ℝ) 0)
      = Real.sqrt (dist (Problem97.CGN.vec2 (0 : ℝ) 0) (Problem97.CGN.vec2 (1 : ℝ) 0) ^ 2) :=
        (Real.sqrt_sq hnn).symm
    _ = Real.sqrt 1 := by rw [hsq]
    _ = 1 := Real.sqrt_one
theorem b3n9m060_signedArea2_chart_base (p : ℝ²) :
    signedArea2 p (Problem97.CGN.vec2 0 0) (Problem97.CGN.vec2 1 0) = p 1 := by
  simp [Problem97.signedArea2, Problem97.CGN.vec2, EuclideanSpace.single_apply]
  ring
theorem b3n9m060_v2v1_dist_of_hexact
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : ZeroDefectCapLayout S) {s : ℝ}
    (hexact : S.witnessClassAt_v2 s =
      insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²))) :
    dist S.triangle.v2 S.triangle.v1 = s := by
  have hmem : S.triangle.v1 ∈ S.witnessClassAt_v2 s := by
    rw [hexact]; simp
  simpa using (Finset.mem_filter.mp hmem).2
theorem b3n9m060_v2v3_dist_of_hexact
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : ZeroDefectCapLayout S) {s : ℝ}
    (hexact : S.witnessClassAt_v2 s =
      insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²))) :
    dist S.triangle.v2 S.triangle.v3 = s := by
  have hmem : S.triangle.v3 ∈ S.witnessClassAt_v2 s := by
    rw [hexact]; simp
  simpa using (Finset.mem_filter.mp hmem).2
theorem b3n9m060_v2a2_dist_of_hexact
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : ZeroDefectCapLayout S) {s : ℝ}
    (hexact : S.witnessClassAt_v2 s =
      insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²))) :
    dist S.triangle.v2 Z.a2 = s := by
  have hmem : Z.a2 ∈ S.witnessClassAt_v2 s := by
    rw [hexact]; simp
  simpa using (Finset.mem_filter.mp hmem).2
theorem b3n9m060_v2b2_dist_of_hexact
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : ZeroDefectCapLayout S) {s : ℝ}
    (hexact : S.witnessClassAt_v2 s =
      insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²))) :
    dist S.triangle.v2 Z.b2 = s := by
  have hmem : Z.b2 ∈ S.witnessClassAt_v2 s := by
    rw [hexact]; simp
  simpa using (Finset.mem_filter.mp hmem).2
structure NormBase {A : Finset ℝ²} (S : FiniteEndpointShell A) where
  T : ℝ² → ℝ²
  tau : Problem97.CGN.SimilarityTransportData T
  hv1 : T S.triangle.v1 = Problem97.CGN.vec2 0 0
  hv2 : T S.triangle.v2 = Problem97.CGN.vec2 1 0
  hv3y_pos : 0 < (T S.triangle.v3) 1
theorem b3n9m060_exists_v2_normalized_transport
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    ∃ T : ℝ² → ℝ², ∃ tau : Problem97.CGN.SimilarityTransportData T,
      T S.triangle.v1 = Problem97.CGN.vec2 0 0 ∧
      T S.triangle.v2 = Problem97.CGN.vec2 1 0 ∧
      0 < (T S.triangle.v3) 1 := by
  classical
  obtain ⟨T0, tau0, hT0v1, hT0v2⟩ :=
    b3n9m060_exists_base_transportData S.triangle.v1 S.triangle.v2 S.triangle.v12_ne
  have hhalf_neg : b3n9m060_halfShift (Problem97.CGN.vec2 (-1) 0) = Problem97.CGN.vec2 0 0 := by
    ext i <;> fin_cases i <;>
      simp [b3n9m060_halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply] <;> norm_num
  have hhalf_one : b3n9m060_halfShift (Problem97.CGN.vec2 1 0) = Problem97.CGN.vec2 1 0 := by
    ext i <;> fin_cases i <;>
      simp [b3n9m060_halfShift, Problem97.CGN.vec2, EuclideanSpace.single_apply] <;> norm_num
  let T1 : ℝ² → ℝ² := fun x => b3n9m060_halfShift (T0 x)
  let tau1 : Problem97.CGN.SimilarityTransportData T1 :=
    b3n9m060_similarityTransportComp tau0 b3n9m060_halfShiftSimilarityTransportData
  have hT1v1 : T1 S.triangle.v1 = Problem97.CGN.vec2 0 0 := by
    change b3n9m060_halfShift (T0 S.triangle.v1) = _
    rw [hT0v1, hhalf_neg]
  have hT1v2 : T1 S.triangle.v2 = Problem97.CGN.vec2 1 0 := by
    change b3n9m060_halfShift (T0 S.triangle.v2) = _
    rw [hT0v2, hhalf_one]
  have hbd1 : dist S.triangle.v1 S.Packet.center = S.Packet.radius := by
    rw [dist_eq_norm]; exact S.Packet.moser_on_boundary_1
  have hbd2 : dist S.triangle.v2 S.Packet.center = S.Packet.radius := by
    rw [dist_eq_norm]; exact S.Packet.moser_on_boundary_2
  have hbd3 : dist S.triangle.v3 S.Packet.center = S.Packet.radius := by
    rw [dist_eq_norm]; exact S.Packet.moser_on_boundary_3
  have hsa0 : signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 ≠ 0 :=
    Problem97.MEC.signedArea2_ne_zero_of_three_dist_eq hbd3 hbd1 hbd2
      S.triangle.v13_ne.symm S.triangle.v12_ne S.triangle.v23_ne.symm
  have hv3_off : (T1 S.triangle.v3) 1 ≠ 0 := by
    intro hzero
    have harea : signedArea2 (T1 S.triangle.v3) (T1 S.triangle.v1) (T1 S.triangle.v2) = 0 := by
      rw [hT1v1, hT1v2, b3n9m060_signedArea2_chart_base, hzero]
    have htrans := tau1.halfplane_sign S.triangle.v3 S.triangle.v1 S.triangle.v2
    rw [harea] at htrans
    have ho : tau1.orientation ≠ 0 := by
      intro h0
      have := tau1.orientation_sq
      rw [h0] at this; norm_num at this
    have hsc : tau1.scale ^ 2 ≠ 0 := pow_ne_zero 2 tau1.scale_pos.ne'
    have : signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 = 0 := by
      have hcoef : tau1.orientation * tau1.scale ^ 2 ≠ 0 := mul_ne_zero ho hsc
      rcases mul_eq_zero.mp htrans.symm with h | h
      · exact absurd h hcoef
      · exact h
    exact hsa0 this
  rcases lt_trichotomy ((T1 S.triangle.v3) 1) 0 with hneg | hzero | hpos
  ·
    have hflip00 : b3n9m060_flipY (Problem97.CGN.vec2 0 0) = Problem97.CGN.vec2 0 0 := by
      ext i <;> fin_cases i <;>
        simp [b3n9m060_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hflip10 : b3n9m060_flipY (Problem97.CGN.vec2 1 0) = Problem97.CGN.vec2 1 0 := by
      ext i <;> fin_cases i <;>
        simp [b3n9m060_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    have hflipy : ∀ p : ℝ², (b3n9m060_flipY p) 1 = -(p 1) := by
      intro p
      simp [b3n9m060_flipY, Problem97.CGN.vec2, EuclideanSpace.single_apply]
    let T2 : ℝ² → ℝ² := fun x => b3n9m060_flipY (T1 x)
    let tau2 : Problem97.CGN.SimilarityTransportData T2 :=
      b3n9m060_similarityTransportComp tau1 b3n9m060_flipYSimilarityTransportData
    refine ⟨T2, tau2, ?_, ?_, ?_⟩
    · change b3n9m060_flipY (T1 S.triangle.v1) = _; rw [hT1v1, hflip00]
    · change b3n9m060_flipY (T1 S.triangle.v2) = _; rw [hT1v2, hflip10]
    · change 0 < (b3n9m060_flipY (T1 S.triangle.v3)) 1; rw [hflipy]; linarith
  · exact absurd hzero hv3_off
  · exact ⟨T1, tau1, hT1v1, hT1v2, hpos⟩
noncomputable def normBase {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    NormBase S :=
  Classical.choice (by
    obtain ⟨T, tau, hv1, hv2, hv3y_pos⟩ := S.b3n9m060_exists_v2_normalized_transport
    exact ⟨⟨T, tau, hv1, hv2, hv3y_pos⟩⟩)
structure V2AnchorFrame {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) where
  T : ℝ² → ℝ²
  tau : Problem97.CGN.SimilarityTransportData T
  c : ℝ
  sg : ℝ
  Oy : ℝ
  hv1 : T S.triangle.v1 = Problem97.CGN.vec2 0 0
  hv2 : T S.triangle.v2 = Problem97.CGN.vec2 1 0
  hv3 : T S.triangle.v3 = Problem97.CGN.vec2 (1 + c) sg
  hO : T S.Packet.center = Problem97.CGN.vec2 (1 / 2) Oy
  hcsg : c ^ 2 + sg ^ 2 = 1
  hsg_pos : 0 < sg
  hc_le : c ≤ 0
  hOy_pos : 0 < Oy
  hmec : 2 * sg * Oy = 1 + c
  hcirc_v1 : dist (T S.triangle.v2) (T S.triangle.v1) = 1
  hcirc_v3 : dist (T S.triangle.v2) (T S.triangle.v3) = 1
  hcirc_a2 : dist (T S.triangle.v2) (T Z.a2) = 1
  hcirc_b2 : dist (T S.triangle.v2) (T Z.b2) = 1
  ha2_y : 0 < (T Z.a2) 1
  hb2_y : 0 < (T Z.b2) 1
  hv2_on_mec : dist (T S.triangle.v2) (T S.Packet.center) ^ 2 = 1 / 4 + Oy ^ 2
  hdisk : ∀ x ∈ A, dist (T x) (T S.Packet.center) ^ 2 ≤ 1 / 4 + Oy ^ 2
  ha3_y : (T Z.a3) 1 ≤ 0
  hb3_y : (T Z.b3) 1 ≤ 0
theorem b3n9m060_chart_signedArea_eq_coord1 {T : ℝ² → ℝ²}
    {v1 v2 p : ℝ²}
    (hv1 : T v1 = Problem97.CGN.vec2 0 0) (hv2 : T v2 = Problem97.CGN.vec2 1 0) :
    signedArea2 (T p) (T v1) (T v2) = (T p) 1 := by
  rw [hv1, hv2, b3n9m060_signedArea2_chart_base]
theorem b3n9m060_chart_y_product {T : ℝ² → ℝ²}
    (tau : Problem97.CGN.SimilarityTransportData T) {v1 v2 p q : ℝ²}
    (hv1 : T v1 = Problem97.CGN.vec2 0 0) (hv2 : T v2 = Problem97.CGN.vec2 1 0) :
    (T p) 1 * (T q) 1 =
      tau.scale ^ 4 *
        (signedArea2 p v1 v2 * signedArea2 q v1 v2) := by
  have hp := tau.halfplane_sign p v1 v2
  have hq := tau.halfplane_sign q v1 v2
  rw [b3n9m060_chart_signedArea_eq_coord1 hv1 hv2] at hp
  rw [b3n9m060_chart_signedArea_eq_coord1 hv1 hv2] at hq
  have hkey : (T p) 1 * (T q) 1
      = (tau.orientation ^ 2 * tau.scale ^ 4) *
        (signedArea2 p v1 v2 * signedArea2 q v1 v2) := by
    rw [hp, hq]; ring
  rw [hkey, tau.orientation_sq, one_mul]
theorem b3n9m060_frame_c3_lower
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {x : ℝ²}
    {T : ℝ² → ℝ²} (tau : Problem97.CGN.SimilarityTransportData T)
    (hv1 : T S.triangle.v1 = Problem97.CGN.vec2 0 0)
    (hv2 : T S.triangle.v2 = Problem97.CGN.vec2 1 0)
    (hsg_pos : 0 < (T S.triangle.v3) 1)
    (hxI3 : x ∈ S.I3) :
    (T x) 1 ≤ 0 := by
  have hxC3 : x ∈ S.CP.C3 :=
    (Finset.mem_erase.mp (Finset.mem_erase.mp hxI3).2).2
  have hxA : x ∈ A := S.CP.C3_subset hxC3
  have hopp : Problem97.OnArcOpposite S.triangle.v3 S.triangle.v1 S.triangle.v2 x :=
    ((S.CP.arc_membership x hxA).2.2.mp hxC3)
  unfold Problem97.OnArcOpposite at hopp
  have hy := b3n9m060_chart_y_product (T := T) tau (p := x) (q := S.triangle.v3) hv1 hv2
  have hle : (T x) 1 * (T S.triangle.v3) 1 ≤ 0 := by
    rw [hy]; exact mul_nonpos_of_nonneg_of_nonpos (by positivity) hopp
  nlinarith only [hle, hsg_pos]
theorem b3n9m060_frame_c2_upper
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {p : ℝ²}
    {T : ℝ² → ℝ²} (tau : Problem97.CGN.SimilarityTransportData T)
    (hv1 : T S.triangle.v1 = Problem97.CGN.vec2 0 0)
    (hv2 : T S.triangle.v2 = Problem97.CGN.vec2 1 0)
    (hsg_pos : 0 < (T S.triangle.v3) 1)
    (hpI2 : p ∈ S.I2) :
    0 < (T p) 1 := by
  have hside := S.c2_vertex_same_open_side_as_v3 hpI2
  have hy := b3n9m060_chart_y_product (T := T) tau (p := p) (q := S.triangle.v3) hv1 hv2
  have hpos : 0 < (T p) 1 * (T S.triangle.v3) 1 := by
    rw [hy]; exact mul_pos (pow_pos tau.scale_pos 4) hside
  nlinarith only [hpos, hsg_pos]
theorem b3n9m060_frame_a2_upper
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : ZeroDefectCapLayout S)
    {T : ℝ² → ℝ²} (tau : Problem97.CGN.SimilarityTransportData T)
    (hv1 : T S.triangle.v1 = Problem97.CGN.vec2 0 0)
    (hv2 : T S.triangle.v2 = Problem97.CGN.vec2 1 0)
    (hsg_pos : 0 < (T S.triangle.v3) 1) :
    0 < (T Z.a2) 1 :=
  S.b3n9m060_frame_c2_upper tau hv1 hv2 hsg_pos (by rw [Z.hI2]; simp)
theorem b3n9m060_frame_disk
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {Oy R : ℝ}
    {T : ℝ² → ℝ²} (tau : Problem97.CGN.SimilarityTransportData T)
    (hR : R = tau.scale * S.Packet.radius)
    (hRsq : R ^ 2 = 1 / 4 + Oy ^ 2) :
    ∀ x ∈ A, dist (T x) (T S.Packet.center) ^ 2 ≤ 1 / 4 + Oy ^ 2 := by
  intro x hx
  have hxdisk : dist x S.Packet.center ≤ S.Packet.radius := by
    rw [dist_eq_norm]; exact S.Packet.disk_contains_A x hx
  have hle : dist (T x) (T S.Packet.center) ≤ R := by
    rw [tau.dist_image, hR]
    exact mul_le_mul_of_nonneg_left hxdisk tau.scale_pos.le
  have hsq : dist (T x) (T S.Packet.center) ^ 2 ≤ R ^ 2 :=
    pow_le_pow_left₀ dist_nonneg hle 2
  rw [hRsq] at hsq; exact hsq
set_option maxHeartbeats 4000000 in
theorem b3n9m060_v2AnchorFrame_facts
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : ZeroDefectCapLayout S) {s : ℝ}
    (T : ℝ² → ℝ²) (tau : Problem97.CGN.SimilarityTransportData T)
    (hv1 : T S.triangle.v1 = Problem97.CGN.vec2 0 0)
    (hv2 : T S.triangle.v2 = Problem97.CGN.vec2 1 0)
    (hv3y_pos : 0 < (T S.triangle.v3) 1)
    (hv2v1 : dist S.triangle.v2 S.triangle.v1 = s)
    (hv2v3 : dist S.triangle.v2 S.triangle.v3 = s)
    (hv2a2 : dist S.triangle.v2 Z.a2 = s)
    (hv2b2 : dist S.triangle.v2 Z.b2 = s) :
    ∃ c sg Oy : ℝ,
      T S.triangle.v3 = Problem97.CGN.vec2 (1 + c) sg ∧
      T S.Packet.center = Problem97.CGN.vec2 (1 / 2) Oy ∧
      c ^ 2 + sg ^ 2 = 1 ∧ 0 < sg ∧ c ≤ 0 ∧ 0 < Oy ∧ 2 * sg * Oy = 1 + c ∧
      dist (T S.triangle.v2) (T S.triangle.v1) = 1 ∧
      dist (T S.triangle.v2) (T S.triangle.v3) = 1 ∧
      dist (T S.triangle.v2) (T Z.a2) = 1 ∧
      dist (T S.triangle.v2) (T Z.b2) = 1 ∧
      0 < (T Z.a2) 1 ∧
      0 < (T Z.b2) 1 ∧
      dist (T S.triangle.v2) (T S.Packet.center) ^ 2 = 1 / 4 + Oy ^ 2 ∧
      (∀ x ∈ A, dist (T x) (T S.Packet.center) ^ 2 ≤ 1 / 4 + Oy ^ 2) ∧
      (T Z.a3) 1 ≤ 0 ∧ (T Z.b3) 1 ≤ 0 := by
  classical
  have hs_pos : 0 < s := by
    rw [← hv2v1]; exact dist_pos.mpr S.triangle.v12_ne.symm
  have hscale : tau.scale * s = 1 := by
    have hbase : dist (T S.triangle.v2) (T S.triangle.v1) = tau.scale * s := by
      rw [tau.dist_image, hv2v1]
    have hone : dist (T S.triangle.v2) (T S.triangle.v1) = 1 := by
      rw [hv2, hv1, dist_comm, b3n9m060_dist_vec2_00_10]
    rw [← hbase, hone]
  set c := (T S.triangle.v3) 0 - 1 with hc_def
  set sg := (T S.triangle.v3) 1 with hsg_def
  set Oy := (T S.Packet.center) 1 with hOy_def
  have hv3 : T S.triangle.v3 = Problem97.CGN.vec2 (1 + c) sg := by
    ext i
    fin_cases i
    · change (T S.triangle.v3) 0 = (Problem97.CGN.vec2 (1 + c) sg) 0
      rw [b3n9m060_vec2_coord0, hc_def]; ring
    · change (T S.triangle.v3) 1 = (Problem97.CGN.vec2 (1 + c) sg) 1
      rw [b3n9m060_vec2_coord1, hsg_def]
  have hsg_pos : 0 < sg := hv3y_pos
  have hcirc_v1 : dist (T S.triangle.v2) (T S.triangle.v1) = 1 := by
    rw [tau.dist_image, hv2v1, hscale]
  have hcirc_v3 : dist (T S.triangle.v2) (T S.triangle.v3) = 1 := by
    rw [tau.dist_image, hv2v3, hscale]
  have hcirc_a2 : dist (T S.triangle.v2) (T Z.a2) = 1 := by
    rw [tau.dist_image, hv2a2, hscale]
  have hcirc_b2 : dist (T S.triangle.v2) (T Z.b2) = 1 := by
    rw [tau.dist_image, hv2b2, hscale]
  have hc3sq : dist (T S.triangle.v2) (T S.triangle.v3) ^ 2 = 1 := by
    rw [hcirc_v3]; norm_num
  set R := tau.scale * S.Packet.radius with hR_def
  have hbd1 : dist S.triangle.v1 S.Packet.center = S.Packet.radius := by
    rw [dist_eq_norm]; exact S.Packet.moser_on_boundary_1
  have hbd2 : dist S.triangle.v2 S.Packet.center = S.Packet.radius := by
    rw [dist_eq_norm]; exact S.Packet.moser_on_boundary_2
  have hbd3 : dist S.triangle.v3 S.Packet.center = S.Packet.radius := by
    rw [dist_eq_norm]; exact S.Packet.moser_on_boundary_3
  have hb1sq : dist (T S.triangle.v1) (T S.Packet.center) ^ 2 = R ^ 2 := by
    rw [tau.dist_image, hbd1, hR_def]
  have hb2sq : dist (T S.triangle.v2) (T S.Packet.center) ^ 2 = R ^ 2 := by
    rw [tau.dist_image, hbd2, hR_def]
  have hb3sq : dist (T S.triangle.v3) (T S.Packet.center) ^ 2 = R ^ 2 := by
    rw [tau.dist_image, hbd3, hR_def]
  set ox := (T S.Packet.center) 0 with hox_def
  have e1 : ox ^ 2 + Oy ^ 2 = R ^ 2 := by
    have h := hb1sq
    rw [b3n9m060_dist_sq_eq_coord_sq_add_coord_sq, hv1, b3n9m060_vec2_coord0, b3n9m060_vec2_coord1] at h
    simpa [hox_def, hOy_def] using h
  have e2 : (1 - ox) ^ 2 + Oy ^ 2 = R ^ 2 := by
    have h := hb2sq
    rw [b3n9m060_dist_sq_eq_coord_sq_add_coord_sq, hv2, b3n9m060_vec2_coord0, b3n9m060_vec2_coord1] at h
    have h' : ((1 : ℝ) - ox) ^ 2 + Oy ^ 2 = R ^ 2 := by nlinarith only [h]
    exact h'
  have e3 : (1 + c - ox) ^ 2 + (sg - Oy) ^ 2 = R ^ 2 := by
    have h := hb3sq
    rw [b3n9m060_dist_sq_eq_coord_sq_add_coord_sq, hv3, b3n9m060_vec2_coord0, b3n9m060_vec2_coord1] at h
    exact h
  have ec : c ^ 2 + sg ^ 2 = 1 := by
    have h := hc3sq
    rw [b3n9m060_dist_sq_eq_coord_sq_add_coord_sq, hv2, hv3, b3n9m060_vec2_coord0, b3n9m060_vec2_coord1,
      b3n9m060_vec2_coord0, b3n9m060_vec2_coord1] at h
    nlinarith only [h]
  clear_value c sg Oy ox R
  have hox : ox = 1 / 2 := by nlinarith only [e1, e2]
  have hcsg : c ^ 2 + sg ^ 2 = 1 := ec
  have hmec : 2 * sg * Oy = 1 + c := by nlinarith only [e1, e3, ec, e2, hox]
  have hRsq : R ^ 2 = 1 / 4 + Oy ^ 2 := by nlinarith only [e1, e2, hox]
  have hv2_on_mec : dist (T S.triangle.v2) (T S.Packet.center) ^ 2 = 1 / 4 + Oy ^ 2 := by
    rw [hb2sq, hRsq]
  have hO : T S.Packet.center = Problem97.CGN.vec2 (1 / 2) Oy := by
    ext i
    fin_cases i
    · change (T S.Packet.center) 0 = (Problem97.CGN.vec2 (1 / 2) Oy) 0
      rw [b3n9m060_vec2_coord0, ← hox_def]; exact hox
    · change (T S.Packet.center) 1 = (Problem97.CGN.vec2 (1 / 2) Oy) 1
      rw [b3n9m060_vec2_coord1, hOy_def]
  have hc_le : c ≤ 0 := by
    have hpol : dist S.triangle.v1 S.triangle.v3 ^ 2 ≤ s ^ 2 + s ^ 2 := by
      have hinner := S.Packet.inner_at_v2
      have hexp := norm_sub_sq_real (S.triangle.v3 - S.triangle.v2)
        (S.triangle.v1 - S.triangle.v2)
      have hrw : S.triangle.v3 - S.triangle.v2 - (S.triangle.v1 - S.triangle.v2)
          = S.triangle.v3 - S.triangle.v1 := by abel
      rw [hrw] at hexp
      have h1 : ‖S.triangle.v3 - S.triangle.v1‖ = dist S.triangle.v1 S.triangle.v3 := by
        rw [← dist_eq_norm, dist_comm]
      have h2 : ‖S.triangle.v3 - S.triangle.v2‖ = s := by
        rw [← dist_eq_norm, dist_comm, hv2v3]
      have h3 : ‖S.triangle.v1 - S.triangle.v2‖ = s := by
        rw [← dist_eq_norm, dist_comm, hv2v1]
      rw [h1, h2, h3] at hexp
      nlinarith only [hinner, hexp]
    have htrans : dist (T S.triangle.v1) (T S.triangle.v3) ^ 2 ≤ 2 := by
      rw [tau.dist_image]
      calc (tau.scale * dist S.triangle.v1 S.triangle.v3) ^ 2
          = tau.scale ^ 2 * dist S.triangle.v1 S.triangle.v3 ^ 2 := by ring
        _ ≤ tau.scale ^ 2 * (s ^ 2 + s ^ 2) :=
            mul_le_mul_of_nonneg_left hpol (by positivity)
        _ = (tau.scale * s) ^ 2 + (tau.scale * s) ^ 2 := by ring
        _ = 2 := by rw [hscale]; norm_num
    have hexpand : dist (T S.triangle.v1) (T S.triangle.v3) ^ 2 = (1 + c) ^ 2 + sg ^ 2 := by
      rw [b3n9m060_dist_sq_eq_coord_sq_add_coord_sq, hv1, hv3, b3n9m060_vec2_coord0, b3n9m060_vec2_coord1,
        b3n9m060_vec2_coord0, b3n9m060_vec2_coord1]
      ring
    rw [hexpand] at htrans
    nlinarith only [ec, htrans, hcsg]
  have hOy_pos : 0 < Oy := by
    have hcgt : -1 < c := by nlinarith only [e1, e2, hRsq, e3, ec, hmec, hv3y_pos, hcsg, hsg_pos]
    have h1c : 0 < 1 + c := by linarith
    have h2sg : 0 < 2 * sg := by linarith
    have hprod : 0 < 2 * sg * Oy := by rw [hmec]; exact h1c
    nlinarith only [hv3y_pos, hmec, hcgt, hprod, h2sg]
  have hv3y_pos' : 0 < (T S.triangle.v3) 1 := hsg_def ▸ hsg_pos
  have ha2_y : 0 < (T Z.a2) 1 := S.b3n9m060_frame_a2_upper Z tau hv1 hv2 hv3y_pos'
  have hb2_y : 0 < (T Z.b2) 1 :=
    S.b3n9m060_frame_c2_upper tau hv1 hv2 hv3y_pos' (by rw [Z.hI2]; simp)
  have ha3_y : (T Z.a3) 1 ≤ 0 :=
    S.b3n9m060_frame_c3_lower tau hv1 hv2 hv3y_pos' (by rw [Z.hI3]; simp)
  have hb3_y : (T Z.b3) 1 ≤ 0 :=
    S.b3n9m060_frame_c3_lower tau hv1 hv2 hv3y_pos' (by rw [Z.hI3]; simp)
  have hdisk : ∀ x ∈ A, dist (T x) (T S.Packet.center) ^ 2 ≤ 1 / 4 + Oy ^ 2 :=
    S.b3n9m060_frame_disk tau hR_def hRsq
  exact ⟨c, sg, Oy, hv3, hO, hcsg, hsg_pos, hc_le, hOy_pos, hmec, hcirc_v1, hcirc_v3,
    hcirc_a2, hcirc_b2, ha2_y, hb2_y, hv2_on_mec, hdisk, ha3_y, hb3_y⟩
noncomputable def v2AnchorFrame_of_hexact
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : ZeroDefectCapLayout S) {s : ℝ}
    (hexact : S.witnessClassAt_v2 s =
      insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²))) :
    V2AnchorFrame S Z := by
  classical
  obtain ⟨T, tau, hv1, hv2, hv3y_pos⟩ := S.normBase
  have hfacts := S.b3n9m060_v2AnchorFrame_facts Z T tau hv1 hv2 hv3y_pos
      (S.b3n9m060_v2v1_dist_of_hexact Z hexact)
      (S.b3n9m060_v2v3_dist_of_hexact Z hexact)
      (S.b3n9m060_v2a2_dist_of_hexact Z hexact)
      (S.b3n9m060_v2b2_dist_of_hexact Z hexact)
  set c := hfacts.choose with hc_eq
  set sg := hfacts.choose_spec.choose with hsg_eq
  set Oy := hfacts.choose_spec.choose_spec.choose with hOy_eq
  obtain ⟨hv3, hO, hcsg, hsg_pos, hc_le, hOy_pos, hmec, hcirc_v1, hcirc_v3,
      hcirc_a2, hcirc_b2, ha2_y, hb2_y, hv2_on_mec, hdisk, ha3_y, hb3_y⟩ :=
    hfacts.choose_spec.choose_spec.choose_spec
  exact
    { T := T
      tau := tau
      c := c
      sg := sg
      Oy := Oy
      hv1 := hv1
      hv2 := hv2
      hv3 := hv3
      hO := hO
      hcsg := hcsg
      hsg_pos := hsg_pos
      hc_le := hc_le
      hOy_pos := hOy_pos
      hmec := hmec
      hcirc_v1 := hcirc_v1
      hcirc_v3 := hcirc_v3
      hcirc_a2 := hcirc_a2
      hcirc_b2 := hcirc_b2
      ha2_y := ha2_y
      hb2_y := hb2_y
      hv2_on_mec := hv2_on_mec
      hdisk := hdisk
      ha3_y := ha3_y
      hb3_y := hb3_y }
theorem b3n9m060_v1_mem_A {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.triangle.v1 ∈ A :=
  S.triangle.v1_mem
theorem b3n9m060_v3_mem_A {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.triangle.v3 ∈ A :=
  S.triangle.v3_mem
theorem b3n9m060_a2_mem_A {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) : Z.a2 ∈ A := by
  have h : Z.a2 ∈ S.I2 := by rw [Z.hI2]; simp
  exact S.CP.C2_subset ((Finset.mem_erase.mp (Finset.mem_erase.mp h).2).2)
theorem b3n9m060_b2_mem_A {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) : Z.b2 ∈ A := by
  have h : Z.b2 ∈ S.I2 := by rw [Z.hI2]; simp
  exact S.CP.C2_subset ((Finset.mem_erase.mp (Finset.mem_erase.mp h).2).2)
namespace V2AnchorFrame
variable {A : Finset ℝ²} {S : FiniteEndpointShell A} {Z : ZeroDefectCapLayout S}
theorem T_injective (F : V2AnchorFrame S Z) : Function.Injective F.T := by
  intro a b hab
  by_contra hne
  have hd : 0 < dist a b := dist_pos.mpr hne
  have heq : dist (F.T a) (F.T b) = F.tau.scale * dist a b := F.tau.dist_image a b
  rw [hab, dist_self] at heq
  have hpos : 0 < F.tau.scale * dist a b := mul_pos F.tau.scale_pos hd
  rw [← heq] at hpos
  exact lt_irrefl 0 hpos
theorem x_dist_le_anchor (F : V2AnchorFrame S Z) {x : ℝ²} (hx : x ∈ A) :
    dist (F.T x) (F.T S.Packet.center) ≤ dist (F.T S.triangle.v2) (F.T S.Packet.center) := by
  have hX := F.hdisk x hx
  have hv2sq := F.hv2_on_mec
  have h : dist (F.T x) (F.T S.Packet.center) ^ 2
      ≤ dist (F.T S.triangle.v2) (F.T S.Packet.center) ^ 2 := by
    rw [hv2sq]; exact hX
  have hXnn : (0 : ℝ) ≤ dist (F.T x) (F.T S.Packet.center) := dist_nonneg
  have hv2nn : (0 : ℝ) ≤ dist (F.T S.triangle.v2) (F.T S.Packet.center) := dist_nonneg
  nlinarith only [hX, hv2sq, hv2nn, h, hXnn]
theorem a2_x_le_two (F : V2AnchorFrame S Z) : (F.T Z.a2) 0 ≤ 2 := by
  have h := F.hcirc_a2
  have hsq : dist (F.T S.triangle.v2) (F.T Z.a2) ^ 2 = 1 := by rw [h]; norm_num
  rw [b3n9m060_dist_sq_eq_coord_sq_add_coord_sq, F.hv2, b3n9m060_vec2_coord0, b3n9m060_vec2_coord1] at hsq
  nlinarith only [hsq, sq_nonneg ((F.T Z.a2) 1)]
theorem circ_disk_x_floor (F : V2AnchorFrame S Z) {p : ℝ²}
    (hpA : p ∈ A) (hp_circ : dist (F.T S.triangle.v2) (F.T p) = 1) :
    (F.T p) 0 ≤ 2 * F.Oy * (F.T p) 1 := by
  have hunit : ((F.T p) 0 - 1) ^ 2 + (F.T p) 1 ^ 2 = 1 := by
    have h : dist (F.T S.triangle.v2) (F.T p) ^ 2 = 1 := by rw [hp_circ]; norm_num
    rw [b3n9m060_dist_sq_eq_coord_sq_add_coord_sq, F.hv2, b3n9m060_vec2_coord0, b3n9m060_vec2_coord1] at h
    nlinarith only [h]
  have hdisk := F.hdisk p hpA
  rw [b3n9m060_dist_sq_eq_coord_sq_add_coord_sq, F.hO, b3n9m060_vec2_coord0, b3n9m060_vec2_coord1] at hdisk
  nlinarith only [hunit, hdisk]
theorem bisectorKill_args_v1a2 (F : V2AnchorFrame S Z) {x : ℝ²}
    (hxA : x ∈ A) (hxy : (F.T x) 1 ≤ 0) (hxne : x ≠ S.triangle.v2) :
    dist (F.T x) (F.T S.Packet.center) ≤ dist (F.T S.triangle.v2) (F.T S.Packet.center) ∧
    dist (F.T S.triangle.v2) (F.T S.triangle.v1) = dist (F.T S.triangle.v2) (F.T Z.a2) ∧
    (F.T S.triangle.v2) 1 = 0 ∧
    (F.T x) 1 ≤ 0 ∧
    0 < ((F.T S.triangle.v1) 1 - (F.T S.triangle.v2) 1)
        + ((F.T Z.a2) 1 - (F.T S.triangle.v2) 1) ∧
    (((F.T S.triangle.v1) 0 - (F.T S.triangle.v2) 0)
        + ((F.T Z.a2) 0 - (F.T S.triangle.v2) 0))
        * ((F.T S.triangle.v2) 0 - (F.T S.Packet.center) 0)
      + (((F.T S.triangle.v1) 1 - (F.T S.triangle.v2) 1)
        + ((F.T Z.a2) 1 - (F.T S.triangle.v2) 1))
        * ((F.T S.triangle.v2) 1 - (F.T S.Packet.center) 1)
        < 0 ∧
    F.T S.triangle.v1 ≠ F.T Z.a2 ∧
    F.T x ≠ F.T S.triangle.v2 := by
  have hv1c0 : (F.T S.triangle.v1) 0 = 0 := by rw [F.hv1, b3n9m060_vec2_coord0]
  have hv1c1 : (F.T S.triangle.v1) 1 = 0 := by rw [F.hv1, b3n9m060_vec2_coord1]
  have hv2c0 : (F.T S.triangle.v2) 0 = 1 := by rw [F.hv2, b3n9m060_vec2_coord0]
  have hv2c1 : (F.T S.triangle.v2) 1 = 0 := by rw [F.hv2, b3n9m060_vec2_coord1]
  have hOc0 : (F.T S.Packet.center) 0 = 1 / 2 := by rw [F.hO, b3n9m060_vec2_coord0]
  have hOc1 : (F.T S.Packet.center) 1 = F.Oy := by rw [F.hO, b3n9m060_vec2_coord1]
  have ha2x : (F.T Z.a2) 0 ≤ 2 := F.a2_x_le_two
  have ha2y : 0 < (F.T Z.a2) 1 := F.ha2_y
  have hOy : 0 < F.Oy := F.hOy_pos
  refine ⟨F.x_dist_le_anchor hxA, ?_, hv2c1, hxy, ?_, ?_, ?_, ?_⟩
  · rw [F.hcirc_v1, F.hcirc_a2]
  · rw [hv1c1, hv2c1]; linarith [ha2y]
  · rw [hv1c0, hv1c1, hv2c0, hv2c1, hOc0, hOc1]
    nlinarith only [ha2x, ha2y, hOy]
  ·
    intro heq
    have hcontr : (F.T S.triangle.v1) 1 = (F.T Z.a2) 1 := by rw [heq]
    rw [hv1c1] at hcontr
    linarith [ha2y, hcontr]
  ·
    intro heq
    exact hxne (F.T_injective heq)
theorem bisectorKill_args_v3a2 (F : V2AnchorFrame S Z) {x : ℝ²}
    (hxA : x ∈ A) (hxy : (F.T x) 1 ≤ 0) (hxne : x ≠ S.triangle.v2) :
    dist (F.T x) (F.T S.Packet.center) ≤ dist (F.T S.triangle.v2) (F.T S.Packet.center) ∧
    dist (F.T S.triangle.v2) (F.T S.triangle.v3) = dist (F.T S.triangle.v2) (F.T Z.a2) ∧
    (F.T S.triangle.v2) 1 = 0 ∧
    (F.T x) 1 ≤ 0 ∧
    0 < ((F.T S.triangle.v3) 1 - (F.T S.triangle.v2) 1)
        + ((F.T Z.a2) 1 - (F.T S.triangle.v2) 1) ∧
    (((F.T S.triangle.v3) 0 - (F.T S.triangle.v2) 0)
        + ((F.T Z.a2) 0 - (F.T S.triangle.v2) 0))
        * ((F.T S.triangle.v2) 0 - (F.T S.Packet.center) 0)
      + (((F.T S.triangle.v3) 1 - (F.T S.triangle.v2) 1)
        + ((F.T Z.a2) 1 - (F.T S.triangle.v2) 1))
        * ((F.T S.triangle.v2) 1 - (F.T S.Packet.center) 1)
        < 0 ∧
    F.T S.triangle.v3 ≠ F.T Z.a2 ∧
    F.T x ≠ F.T S.triangle.v2 := by
  have hv2c0 : (F.T S.triangle.v2) 0 = 1 := by rw [F.hv2, b3n9m060_vec2_coord0]
  have hv2c1 : (F.T S.triangle.v2) 1 = 0 := by rw [F.hv2, b3n9m060_vec2_coord1]
  have hv3c0 : (F.T S.triangle.v3) 0 = 1 + F.c := by rw [F.hv3, b3n9m060_vec2_coord0]
  have hv3c1 : (F.T S.triangle.v3) 1 = F.sg := by rw [F.hv3, b3n9m060_vec2_coord1]
  have hOc0 : (F.T S.Packet.center) 0 = 1 / 2 := by rw [F.hO, b3n9m060_vec2_coord0]
  have hOc1 : (F.T S.Packet.center) 1 = F.Oy := by rw [F.hO, b3n9m060_vec2_coord1]
  have ha2x : (F.T Z.a2) 0 ≤ 2 := F.a2_x_le_two
  have ha2y : 0 < (F.T Z.a2) 1 := F.ha2_y
  have hOy : 0 < F.Oy := F.hOy_pos
  have hsg : 0 < F.sg := F.hsg_pos
  have hmec : 2 * F.sg * F.Oy = 1 + F.c := F.hmec
  refine ⟨F.x_dist_le_anchor hxA, ?_, hv2c1, hxy, ?_, ?_, ?_, ?_⟩
  · rw [F.hcirc_v3, F.hcirc_a2]
  · rw [hv3c1, hv2c1]; linarith [hsg, ha2y]
  · rw [hv3c0, hv3c1, hv2c0, hv2c1, hOc0, hOc1]
    nlinarith only [ha2x, hmec, ha2y, hOy]
  ·
    intro heq
    have ha2I2 : Z.a2 ∈ S.I2 := by rw [Z.hI2]; simp
    have hne : S.triangle.v3 ≠ Z.a2 :=
      fun h => (Finset.mem_erase.mp (Finset.mem_erase.mp ha2I2).2).1 h.symm
    exact hne (F.T_injective heq)
  · intro heq
    exact hxne (F.T_injective heq)
theorem bisectorKill_args_v1b2 (F : V2AnchorFrame S Z) {x : ℝ²}
    (hxA : x ∈ A) (hxy : (F.T x) 1 ≤ 0) (hxne : x ≠ S.triangle.v2) :
    dist (F.T x) (F.T S.Packet.center) ≤ dist (F.T S.triangle.v2) (F.T S.Packet.center) ∧
    dist (F.T S.triangle.v2) (F.T S.triangle.v1) = dist (F.T S.triangle.v2) (F.T Z.b2) ∧
    (F.T S.triangle.v2) 1 = 0 ∧
    (F.T x) 1 ≤ 0 ∧
    0 < ((F.T S.triangle.v1) 1 - (F.T S.triangle.v2) 1)
        + ((F.T Z.b2) 1 - (F.T S.triangle.v2) 1) ∧
    (((F.T S.triangle.v1) 0 - (F.T S.triangle.v2) 0)
        + ((F.T Z.b2) 0 - (F.T S.triangle.v2) 0))
        * ((F.T S.triangle.v2) 0 - (F.T S.Packet.center) 0)
      + (((F.T S.triangle.v1) 1 - (F.T S.triangle.v2) 1)
        + ((F.T Z.b2) 1 - (F.T S.triangle.v2) 1))
        * ((F.T S.triangle.v2) 1 - (F.T S.Packet.center) 1)
        < 0 ∧
    F.T S.triangle.v1 ≠ F.T Z.b2 ∧
    F.T x ≠ F.T S.triangle.v2 := by
  have hv1c1 : (F.T S.triangle.v1) 1 = 0 := by rw [F.hv1, b3n9m060_vec2_coord1]
  have hv2c0 : (F.T S.triangle.v2) 0 = 1 := by rw [F.hv2, b3n9m060_vec2_coord0]
  have hv2c1 : (F.T S.triangle.v2) 1 = 0 := by rw [F.hv2, b3n9m060_vec2_coord1]
  have hOc0 : (F.T S.Packet.center) 0 = 1 / 2 := by rw [F.hO, b3n9m060_vec2_coord0]
  have hOc1 : (F.T S.Packet.center) 1 = F.Oy := by rw [F.hO, b3n9m060_vec2_coord1]
  have hb2y : 0 < (F.T Z.b2) 1 := F.hb2_y
  have hv1floor : (F.T S.triangle.v1) 0 ≤ 2 * F.Oy * (F.T S.triangle.v1) 1 :=
    F.circ_disk_x_floor (S.b3n9m060_v1_mem_A) F.hcirc_v1
  have hb2floor : (F.T Z.b2) 0 ≤ 2 * F.Oy * (F.T Z.b2) 1 :=
    F.circ_disk_x_floor (S.b3n9m060_b2_mem_A Z) F.hcirc_b2
  refine ⟨F.x_dist_le_anchor hxA, ?_, hv2c1, hxy, ?_, ?_, ?_, ?_⟩
  · rw [F.hcirc_v1, F.hcirc_b2]
  · rw [hv1c1, hv2c1]; linarith [hb2y]
  · rw [hv2c0, hv2c1, hOc0, hOc1]
    nlinarith only [hv1floor, hb2floor, hv1c1]
  ·
    intro heq
    have hcontr : (F.T S.triangle.v1) 1 = (F.T Z.b2) 1 := by rw [heq]
    rw [hv1c1] at hcontr
    linarith [hb2y, hcontr]
  · intro heq
    exact hxne (F.T_injective heq)
theorem bisectorKill_args_v3b2 (F : V2AnchorFrame S Z) {x : ℝ²}
    (hxA : x ∈ A) (hxy : (F.T x) 1 ≤ 0) (hxne : x ≠ S.triangle.v2) :
    dist (F.T x) (F.T S.Packet.center) ≤ dist (F.T S.triangle.v2) (F.T S.Packet.center) ∧
    dist (F.T S.triangle.v2) (F.T S.triangle.v3) = dist (F.T S.triangle.v2) (F.T Z.b2) ∧
    (F.T S.triangle.v2) 1 = 0 ∧
    (F.T x) 1 ≤ 0 ∧
    0 < ((F.T S.triangle.v3) 1 - (F.T S.triangle.v2) 1)
        + ((F.T Z.b2) 1 - (F.T S.triangle.v2) 1) ∧
    (((F.T S.triangle.v3) 0 - (F.T S.triangle.v2) 0)
        + ((F.T Z.b2) 0 - (F.T S.triangle.v2) 0))
        * ((F.T S.triangle.v2) 0 - (F.T S.Packet.center) 0)
      + (((F.T S.triangle.v3) 1 - (F.T S.triangle.v2) 1)
        + ((F.T Z.b2) 1 - (F.T S.triangle.v2) 1))
        * ((F.T S.triangle.v2) 1 - (F.T S.Packet.center) 1)
        < 0 ∧
    F.T S.triangle.v3 ≠ F.T Z.b2 ∧
    F.T x ≠ F.T S.triangle.v2 := by
  have hv2c0 : (F.T S.triangle.v2) 0 = 1 := by rw [F.hv2, b3n9m060_vec2_coord0]
  have hv2c1 : (F.T S.triangle.v2) 1 = 0 := by rw [F.hv2, b3n9m060_vec2_coord1]
  have hv3c1 : (F.T S.triangle.v3) 1 = F.sg := by rw [F.hv3, b3n9m060_vec2_coord1]
  have hOc0 : (F.T S.Packet.center) 0 = 1 / 2 := by rw [F.hO, b3n9m060_vec2_coord0]
  have hOc1 : (F.T S.Packet.center) 1 = F.Oy := by rw [F.hO, b3n9m060_vec2_coord1]
  have hb2y : 0 < (F.T Z.b2) 1 := F.hb2_y
  have hsg : 0 < F.sg := F.hsg_pos
  have hv3floor : (F.T S.triangle.v3) 0 ≤ 2 * F.Oy * (F.T S.triangle.v3) 1 :=
    F.circ_disk_x_floor (S.b3n9m060_v3_mem_A) F.hcirc_v3
  have hb2floor : (F.T Z.b2) 0 ≤ 2 * F.Oy * (F.T Z.b2) 1 :=
    F.circ_disk_x_floor (S.b3n9m060_b2_mem_A Z) F.hcirc_b2
  refine ⟨F.x_dist_le_anchor hxA, ?_, hv2c1, hxy, ?_, ?_, ?_, ?_⟩
  · rw [F.hcirc_v3, F.hcirc_b2]
  · rw [hv3c1, hv2c1]; linarith [hsg, hb2y]
  · rw [hv2c0, hv2c1, hOc0, hOc1]
    nlinarith only [hv3floor, hb2floor]
  ·
    intro heq
    have hb2I2 : Z.b2 ∈ S.I2 := by rw [Z.hI2]; simp
    have hne : S.triangle.v3 ≠ Z.b2 :=
      fun h => (Finset.mem_erase.mp (Finset.mem_erase.mp hb2I2).2).1 h.symm
    exact hne (F.T_injective heq)
  · intro heq
    exact hxne (F.T_injective heq)
theorem bisectorKill_args_a2b2 (F : V2AnchorFrame S Z) {x : ℝ²}
    (hxA : x ∈ A) (hxy : (F.T x) 1 ≤ 0) (hxne : x ≠ S.triangle.v2) :
    dist (F.T x) (F.T S.Packet.center) ≤ dist (F.T S.triangle.v2) (F.T S.Packet.center) ∧
    dist (F.T S.triangle.v2) (F.T Z.a2) = dist (F.T S.triangle.v2) (F.T Z.b2) ∧
    (F.T S.triangle.v2) 1 = 0 ∧
    (F.T x) 1 ≤ 0 ∧
    0 < ((F.T Z.a2) 1 - (F.T S.triangle.v2) 1)
        + ((F.T Z.b2) 1 - (F.T S.triangle.v2) 1) ∧
    (((F.T Z.a2) 0 - (F.T S.triangle.v2) 0)
        + ((F.T Z.b2) 0 - (F.T S.triangle.v2) 0))
        * ((F.T S.triangle.v2) 0 - (F.T S.Packet.center) 0)
      + (((F.T Z.a2) 1 - (F.T S.triangle.v2) 1)
        + ((F.T Z.b2) 1 - (F.T S.triangle.v2) 1))
        * ((F.T S.triangle.v2) 1 - (F.T S.Packet.center) 1)
        < 0 ∧
    F.T Z.a2 ≠ F.T Z.b2 ∧
    F.T x ≠ F.T S.triangle.v2 := by
  have hv2c0 : (F.T S.triangle.v2) 0 = 1 := by rw [F.hv2, b3n9m060_vec2_coord0]
  have hv2c1 : (F.T S.triangle.v2) 1 = 0 := by rw [F.hv2, b3n9m060_vec2_coord1]
  have hOc0 : (F.T S.Packet.center) 0 = 1 / 2 := by rw [F.hO, b3n9m060_vec2_coord0]
  have hOc1 : (F.T S.Packet.center) 1 = F.Oy := by rw [F.hO, b3n9m060_vec2_coord1]
  have ha2y : 0 < (F.T Z.a2) 1 := F.ha2_y
  have hb2y : 0 < (F.T Z.b2) 1 := F.hb2_y
  have ha2floor : (F.T Z.a2) 0 ≤ 2 * F.Oy * (F.T Z.a2) 1 :=
    F.circ_disk_x_floor (S.b3n9m060_a2_mem_A Z) F.hcirc_a2
  have hb2floor : (F.T Z.b2) 0 ≤ 2 * F.Oy * (F.T Z.b2) 1 :=
    F.circ_disk_x_floor (S.b3n9m060_b2_mem_A Z) F.hcirc_b2
  refine ⟨F.x_dist_le_anchor hxA, ?_, hv2c1, hxy, ?_, ?_, ?_, ?_⟩
  · rw [F.hcirc_a2, F.hcirc_b2]
  · rw [hv2c1]; linarith [ha2y, hb2y]
  · rw [hv2c0, hv2c1, hOc0, hOc1]
    nlinarith only [ha2floor, hb2floor]
  ·
    intro heq
    have ha2_ne_b2 : Z.a2 ≠ Z.b2 := by
      have hI2card : ({Z.a2, Z.b2} : Finset ℝ²).card = 2 := by
        simpa [Z.hI2] using S.I2_card_eq_two
      intro h; simp [h] at hI2card
    exact ha2_ne_b2 (F.T_injective heq)
  · intro heq
    exact hxne (F.T_injective heq)
theorem bisectorKill_args_v1v3 (F : V2AnchorFrame S Z) {x : ℝ²}
    (hxA : x ∈ A) (hxy : (F.T x) 1 ≤ 0) (hxne : x ≠ S.triangle.v2) :
    dist (F.T x) (F.T S.Packet.center) ≤ dist (F.T S.triangle.v2) (F.T S.Packet.center) ∧
    dist (F.T S.triangle.v2) (F.T S.triangle.v1) = dist (F.T S.triangle.v2) (F.T S.triangle.v3) ∧
    (F.T S.triangle.v2) 1 = 0 ∧
    (F.T x) 1 ≤ 0 ∧
    0 < ((F.T S.triangle.v1) 1 - (F.T S.triangle.v2) 1)
        + ((F.T S.triangle.v3) 1 - (F.T S.triangle.v2) 1) ∧
    (((F.T S.triangle.v1) 0 - (F.T S.triangle.v2) 0)
        + ((F.T S.triangle.v3) 0 - (F.T S.triangle.v2) 0))
        * ((F.T S.triangle.v2) 0 - (F.T S.Packet.center) 0)
      + (((F.T S.triangle.v1) 1 - (F.T S.triangle.v2) 1)
        + ((F.T S.triangle.v3) 1 - (F.T S.triangle.v2) 1))
        * ((F.T S.triangle.v2) 1 - (F.T S.Packet.center) 1)
        < 0 ∧
    F.T S.triangle.v1 ≠ F.T S.triangle.v3 ∧
    F.T x ≠ F.T S.triangle.v2 := by
  have hv1c1 : (F.T S.triangle.v1) 1 = 0 := by rw [F.hv1, b3n9m060_vec2_coord1]
  have hv2c0 : (F.T S.triangle.v2) 0 = 1 := by rw [F.hv2, b3n9m060_vec2_coord0]
  have hv2c1 : (F.T S.triangle.v2) 1 = 0 := by rw [F.hv2, b3n9m060_vec2_coord1]
  have hv3c1 : (F.T S.triangle.v3) 1 = F.sg := by rw [F.hv3, b3n9m060_vec2_coord1]
  have hOc0 : (F.T S.Packet.center) 0 = 1 / 2 := by rw [F.hO, b3n9m060_vec2_coord0]
  have hOc1 : (F.T S.Packet.center) 1 = F.Oy := by rw [F.hO, b3n9m060_vec2_coord1]
  have hsg : 0 < F.sg := F.hsg_pos
  have hv1floor : (F.T S.triangle.v1) 0 ≤ 2 * F.Oy * (F.T S.triangle.v1) 1 :=
    F.circ_disk_x_floor (S.b3n9m060_v1_mem_A) F.hcirc_v1
  have hv3floor : (F.T S.triangle.v3) 0 ≤ 2 * F.Oy * (F.T S.triangle.v3) 1 :=
    F.circ_disk_x_floor (S.b3n9m060_v3_mem_A) F.hcirc_v3
  refine ⟨F.x_dist_le_anchor hxA, ?_, hv2c1, hxy, ?_, ?_, ?_, ?_⟩
  · rw [F.hcirc_v1, F.hcirc_v3]
  · rw [hv1c1, hv2c1]; linarith [hsg, hv3c1]
  · rw [hv2c0, hv2c1, hOc0, hOc1]
    nlinarith only [hv1floor, hv3floor, hv1c1]
  ·
    intro heq
    exact S.triangle.v13_ne (F.T_injective heq)
  · intro heq
    exact hxne (F.T_injective heq)
end V2AnchorFrame
theorem b3n9m060_frame_c1_upper
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {p : ℝ²}
    {T : ℝ² → ℝ²} (tau : Problem97.CGN.SimilarityTransportData T)
    (hv1 : T S.triangle.v1 = Problem97.CGN.vec2 0 0)
    (hv2 : T S.triangle.v2 = Problem97.CGN.vec2 1 0)
    (hsg_pos : 0 < (T S.triangle.v3) 1)
    (hpI1 : p ∈ S.I1) :
    0 < (T p) 1 := by
  have hside := S.c1_vertex_same_open_side_as_v3 hpI1
  have hy := b3n9m060_chart_y_product (T := T) tau (p := p) (q := S.triangle.v3) hv1 hv2
  have hpos : 0 < (T p) 1 * (T S.triangle.v3) 1 := by
    rw [hy]; exact mul_pos (pow_pos tau.scale_pos 4) hside
  nlinarith only [hpos, hsg_pos]
structure V1AnchorFrame {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) where
  base : V2AnchorFrame S Z
  ha1A : Z.a1 ∈ A
  hb1A : Z.b1 ∈ A
  hcirc_a1 : dist (base.T S.triangle.v1) (base.T Z.a1) = 1
  hcirc_b1 : dist (base.T S.triangle.v1) (base.T Z.b1) = 1
  hcirc_v2 : dist (base.T S.triangle.v1) (base.T S.triangle.v2) = 1
  ha1_y : 0 < (base.T Z.a1) 1
  hb1_y : 0 < (base.T Z.b1) 1
noncomputable def v1AnchorFrame_of_hexact
    {A : Finset ℝ²} (S : FiniteEndpointShell A) (Z : ZeroDefectCapLayout S)
    {r s : ℝ}
    (hC3pin : S.witnessClassAt_v1 r ∩ S.CP.C3 = ({S.triangle.v2} : Finset ℝ²))
    (hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
    (hexact : S.witnessClassAt_v2 s =
      insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²))) :
    V1AnchorFrame S Z := by
  classical
  let base := S.v2AnchorFrame_of_hexact Z hexact
  have hv2_in : S.triangle.v2 ∈ S.witnessClassAt_v1 r := by
    have hmem : S.triangle.v2 ∈ S.witnessClassAt_v1 r ∩ S.CP.C3 := by
      rw [hC3pin]; simp
    exact (Finset.mem_inter.mp hmem).1
  have hv1v2 : dist S.triangle.v1 S.triangle.v2 = r :=
    (Finset.mem_filter.mp hv2_in).2
  have hr : 0 < r := by
    rw [← hv1v2]; exact dist_pos.mpr S.triangle.v12_ne
  have hcore := S.coreSelector_v1 hr hcard
  have hI1sub : S.I1 ⊆ S.witnessClassAt_v1 r := hcore.2.1
  have ha1I1 : Z.a1 ∈ S.I1 := by rw [Z.hI1]; simp
  have hb1I1 : Z.b1 ∈ S.I1 := by rw [Z.hI1]; simp
  have ha1_in : Z.a1 ∈ S.witnessClassAt_v1 r := hI1sub ha1I1
  have hb1_in : Z.b1 ∈ S.witnessClassAt_v1 r := hI1sub hb1I1
  have ha1A : Z.a1 ∈ A := (Finset.mem_filter.mp ha1_in).1
  have hb1A : Z.b1 ∈ A := (Finset.mem_filter.mp hb1_in).1
  have hv1a1 : dist S.triangle.v1 Z.a1 = r := (Finset.mem_filter.mp ha1_in).2
  have hv1b1 : dist S.triangle.v1 Z.b1 = r := (Finset.mem_filter.mp hb1_in).2
  have hscale : base.tau.scale * r = 1 := by
    have hbase : dist (base.T S.triangle.v1) (base.T S.triangle.v2)
        = base.tau.scale * r := by
      rw [base.tau.dist_image, hv1v2]
    have hone : dist (base.T S.triangle.v1) (base.T S.triangle.v2) = 1 := by
      rw [base.hv1, base.hv2, b3n9m060_dist_vec2_00_10]
    rw [← hbase, hone]
  have hcirc_a1 : dist (base.T S.triangle.v1) (base.T Z.a1) = 1 := by
    rw [base.tau.dist_image, hv1a1, hscale]
  have hcirc_b1 : dist (base.T S.triangle.v1) (base.T Z.b1) = 1 := by
    rw [base.tau.dist_image, hv1b1, hscale]
  have hcirc_v2 : dist (base.T S.triangle.v1) (base.T S.triangle.v2) = 1 := by
    rw [base.tau.dist_image, hv1v2, hscale]
  have hsg_pos : 0 < (base.T S.triangle.v3) 1 := by rw [base.hv3, b3n9m060_vec2_coord1]; exact base.hsg_pos
  have ha1_y : 0 < (base.T Z.a1) 1 :=
    S.b3n9m060_frame_c1_upper base.tau base.hv1 base.hv2 hsg_pos ha1I1
  have hb1_y : 0 < (base.T Z.b1) 1 :=
    S.b3n9m060_frame_c1_upper base.tau base.hv1 base.hv2 hsg_pos hb1I1
  exact
    { base := base
      ha1A := ha1A
      hb1A := hb1A
      hcirc_a1 := hcirc_a1
      hcirc_b1 := hcirc_b1
      hcirc_v2 := hcirc_v2
      ha1_y := ha1_y
      hb1_y := hb1_y }
namespace V1AnchorFrame
variable {A : Finset ℝ²} {S : FiniteEndpointShell A} {Z : ZeroDefectCapLayout S}
theorem x_dist_le_anchor (F : V1AnchorFrame S Z) {x : ℝ²} (hx : x ∈ A) :
    dist (F.base.T x) (F.base.T S.Packet.center)
      ≤ dist (F.base.T S.triangle.v1) (F.base.T S.Packet.center) := by
  have hX := F.base.hdisk x hx
  have hv1_on_mec : dist (F.base.T S.triangle.v1) (F.base.T S.Packet.center) ^ 2
      = 1 / 4 + F.base.Oy ^ 2 := by
    rw [b3n9m060_dist_sq_eq_coord_sq_add_coord_sq, F.base.hv1, F.base.hO,
      b3n9m060_vec2_coord0, b3n9m060_vec2_coord1, b3n9m060_vec2_coord0, b3n9m060_vec2_coord1]
    ring
  have h : dist (F.base.T x) (F.base.T S.Packet.center) ^ 2
      ≤ dist (F.base.T S.triangle.v1) (F.base.T S.Packet.center) ^ 2 := by
    rw [hv1_on_mec]; exact hX
  have hXnn : (0 : ℝ) ≤ dist (F.base.T x) (F.base.T S.Packet.center) := dist_nonneg
  have hv1nn : (0 : ℝ) ≤ dist (F.base.T S.triangle.v1) (F.base.T S.Packet.center) := dist_nonneg
  nlinarith only [hX, hv1_on_mec, hv1nn, h, hXnn]
theorem circ_disk_x_floor (F : V1AnchorFrame S Z) {p : ℝ²}
    (hpA : p ∈ A) (hp_circ : dist (F.base.T S.triangle.v1) (F.base.T p) = 1) :
    1 - 2 * F.base.Oy * (F.base.T p) 1 ≤ (F.base.T p) 0 := by
  have hunit : (F.base.T p) 0 ^ 2 + (F.base.T p) 1 ^ 2 = 1 := by
    have h : dist (F.base.T S.triangle.v1) (F.base.T p) ^ 2 = 1 := by rw [hp_circ]; norm_num
    rw [b3n9m060_dist_sq_eq_coord_sq_add_coord_sq, F.base.hv1, b3n9m060_vec2_coord0, b3n9m060_vec2_coord1] at h
    nlinarith only [h]
  have hdisk := F.base.hdisk p hpA
  rw [b3n9m060_dist_sq_eq_coord_sq_add_coord_sq, F.base.hO, b3n9m060_vec2_coord0, b3n9m060_vec2_coord1] at hdisk
  nlinarith only [hunit, hdisk]
theorem T_injective (F : V1AnchorFrame S Z) : Function.Injective F.base.T :=
  F.base.T_injective
theorem bisectorKill_args_a1b1 (F : V1AnchorFrame S Z) {x : ℝ²}
    (hxA : x ∈ A) (hxy : (F.base.T x) 1 ≤ 0) (hxne : x ≠ S.triangle.v1) :
    dist (F.base.T x) (F.base.T S.Packet.center)
        ≤ dist (F.base.T S.triangle.v1) (F.base.T S.Packet.center) ∧
    dist (F.base.T S.triangle.v1) (F.base.T Z.a1)
        = dist (F.base.T S.triangle.v1) (F.base.T Z.b1) ∧
    (F.base.T S.triangle.v1) 1 = 0 ∧
    (F.base.T x) 1 ≤ 0 ∧
    0 < ((F.base.T Z.a1) 1 - (F.base.T S.triangle.v1) 1)
        + ((F.base.T Z.b1) 1 - (F.base.T S.triangle.v1) 1) ∧
    (((F.base.T Z.a1) 0 - (F.base.T S.triangle.v1) 0)
        + ((F.base.T Z.b1) 0 - (F.base.T S.triangle.v1) 0))
        * ((F.base.T S.triangle.v1) 0 - (F.base.T S.Packet.center) 0)
      + (((F.base.T Z.a1) 1 - (F.base.T S.triangle.v1) 1)
        + ((F.base.T Z.b1) 1 - (F.base.T S.triangle.v1) 1))
        * ((F.base.T S.triangle.v1) 1 - (F.base.T S.Packet.center) 1)
        < 0 ∧
    F.base.T Z.a1 ≠ F.base.T Z.b1 ∧
    F.base.T x ≠ F.base.T S.triangle.v1 := by
  have hv1c0 : (F.base.T S.triangle.v1) 0 = 0 := by rw [F.base.hv1, b3n9m060_vec2_coord0]
  have hv1c1 : (F.base.T S.triangle.v1) 1 = 0 := by rw [F.base.hv1, b3n9m060_vec2_coord1]
  have hOc0 : (F.base.T S.Packet.center) 0 = 1 / 2 := by rw [F.base.hO, b3n9m060_vec2_coord0]
  have hOc1 : (F.base.T S.Packet.center) 1 = F.base.Oy := by rw [F.base.hO, b3n9m060_vec2_coord1]
  have ha1y : 0 < (F.base.T Z.a1) 1 := F.ha1_y
  have hb1y : 0 < (F.base.T Z.b1) 1 := F.hb1_y
  have hOy : 0 < F.base.Oy := F.base.hOy_pos
  have ha1floor : 1 - 2 * F.base.Oy * (F.base.T Z.a1) 1 ≤ (F.base.T Z.a1) 0 :=
    F.circ_disk_x_floor F.ha1A F.hcirc_a1
  have hb1floor : 1 - 2 * F.base.Oy * (F.base.T Z.b1) 1 ≤ (F.base.T Z.b1) 0 :=
    F.circ_disk_x_floor F.hb1A F.hcirc_b1
  refine ⟨F.x_dist_le_anchor hxA, ?_, hv1c1, hxy, ?_, ?_, ?_, ?_⟩
  · rw [F.hcirc_a1, F.hcirc_b1]
  · rw [hv1c1]; linarith [ha1y, hb1y]
  · rw [hv1c0, hv1c1, hOc0, hOc1]
    nlinarith only [ha1floor, hb1floor, ha1y, hb1y, hOy]
  ·
    intro heq
    have ha1_ne_b1 : Z.a1 ≠ Z.b1 := by
      have hI1card : ({Z.a1, Z.b1} : Finset ℝ²).card = 2 := by
        simpa [Z.hI1] using S.I1_card_eq_two
      intro h; simp [h] at hI1card
    exact ha1_ne_b1 (F.T_injective heq)
  · intro heq
    exact hxne (F.T_injective heq)
theorem bisectorKill_args_v2a1 (F : V1AnchorFrame S Z) {x : ℝ²}
    (hxA : x ∈ A) (hxy : (F.base.T x) 1 ≤ 0) (hxne : x ≠ S.triangle.v1) :
    dist (F.base.T x) (F.base.T S.Packet.center)
        ≤ dist (F.base.T S.triangle.v1) (F.base.T S.Packet.center) ∧
    dist (F.base.T S.triangle.v1) (F.base.T S.triangle.v2)
        = dist (F.base.T S.triangle.v1) (F.base.T Z.a1) ∧
    (F.base.T S.triangle.v1) 1 = 0 ∧
    (F.base.T x) 1 ≤ 0 ∧
    0 < ((F.base.T S.triangle.v2) 1 - (F.base.T S.triangle.v1) 1)
        + ((F.base.T Z.a1) 1 - (F.base.T S.triangle.v1) 1) ∧
    (((F.base.T S.triangle.v2) 0 - (F.base.T S.triangle.v1) 0)
        + ((F.base.T Z.a1) 0 - (F.base.T S.triangle.v1) 0))
        * ((F.base.T S.triangle.v1) 0 - (F.base.T S.Packet.center) 0)
      + (((F.base.T S.triangle.v2) 1 - (F.base.T S.triangle.v1) 1)
        + ((F.base.T Z.a1) 1 - (F.base.T S.triangle.v1) 1))
        * ((F.base.T S.triangle.v1) 1 - (F.base.T S.Packet.center) 1)
        < 0 ∧
    F.base.T S.triangle.v2 ≠ F.base.T Z.a1 ∧
    F.base.T x ≠ F.base.T S.triangle.v1 := by
  have hv1c0 : (F.base.T S.triangle.v1) 0 = 0 := by rw [F.base.hv1, b3n9m060_vec2_coord0]
  have hv1c1 : (F.base.T S.triangle.v1) 1 = 0 := by rw [F.base.hv1, b3n9m060_vec2_coord1]
  have hv2c0 : (F.base.T S.triangle.v2) 0 = 1 := by rw [F.base.hv2, b3n9m060_vec2_coord0]
  have hv2c1 : (F.base.T S.triangle.v2) 1 = 0 := by rw [F.base.hv2, b3n9m060_vec2_coord1]
  have hOc0 : (F.base.T S.Packet.center) 0 = 1 / 2 := by rw [F.base.hO, b3n9m060_vec2_coord0]
  have hOc1 : (F.base.T S.Packet.center) 1 = F.base.Oy := by rw [F.base.hO, b3n9m060_vec2_coord1]
  have ha1y : 0 < (F.base.T Z.a1) 1 := F.ha1_y
  have hOy : 0 < F.base.Oy := F.base.hOy_pos
  have ha1floor : 1 - 2 * F.base.Oy * (F.base.T Z.a1) 1 ≤ (F.base.T Z.a1) 0 :=
    F.circ_disk_x_floor F.ha1A F.hcirc_a1
  refine ⟨F.x_dist_le_anchor hxA, ?_, hv1c1, hxy, ?_, ?_, ?_, ?_⟩
  · rw [F.hcirc_v2, F.hcirc_a1]
  · rw [hv1c1, hv2c1]; linarith [ha1y]
  · rw [hv1c0, hv1c1, hv2c0, hv2c1, hOc0, hOc1]
    nlinarith only [ha1floor, ha1y, hOy]
  ·
    intro heq
    have ha1_ne_v2 : Z.a1 ≠ S.triangle.v2 := by
      have ha1I1 : Z.a1 ∈ S.I1 := by rw [Z.hI1]; simp
      exact (Finset.mem_erase.mp (Finset.mem_erase.mp ha1I1).2).1
    exact ha1_ne_v2 (F.T_injective heq.symm)
  · intro heq
    exact hxne (F.T_injective heq)
theorem bisectorKill_args_v2b1 (F : V1AnchorFrame S Z) {x : ℝ²}
    (hxA : x ∈ A) (hxy : (F.base.T x) 1 ≤ 0) (hxne : x ≠ S.triangle.v1) :
    dist (F.base.T x) (F.base.T S.Packet.center)
        ≤ dist (F.base.T S.triangle.v1) (F.base.T S.Packet.center) ∧
    dist (F.base.T S.triangle.v1) (F.base.T S.triangle.v2)
        = dist (F.base.T S.triangle.v1) (F.base.T Z.b1) ∧
    (F.base.T S.triangle.v1) 1 = 0 ∧
    (F.base.T x) 1 ≤ 0 ∧
    0 < ((F.base.T S.triangle.v2) 1 - (F.base.T S.triangle.v1) 1)
        + ((F.base.T Z.b1) 1 - (F.base.T S.triangle.v1) 1) ∧
    (((F.base.T S.triangle.v2) 0 - (F.base.T S.triangle.v1) 0)
        + ((F.base.T Z.b1) 0 - (F.base.T S.triangle.v1) 0))
        * ((F.base.T S.triangle.v1) 0 - (F.base.T S.Packet.center) 0)
      + (((F.base.T S.triangle.v2) 1 - (F.base.T S.triangle.v1) 1)
        + ((F.base.T Z.b1) 1 - (F.base.T S.triangle.v1) 1))
        * ((F.base.T S.triangle.v1) 1 - (F.base.T S.Packet.center) 1)
        < 0 ∧
    F.base.T S.triangle.v2 ≠ F.base.T Z.b1 ∧
    F.base.T x ≠ F.base.T S.triangle.v1 := by
  have hv1c0 : (F.base.T S.triangle.v1) 0 = 0 := by rw [F.base.hv1, b3n9m060_vec2_coord0]
  have hv1c1 : (F.base.T S.triangle.v1) 1 = 0 := by rw [F.base.hv1, b3n9m060_vec2_coord1]
  have hv2c0 : (F.base.T S.triangle.v2) 0 = 1 := by rw [F.base.hv2, b3n9m060_vec2_coord0]
  have hv2c1 : (F.base.T S.triangle.v2) 1 = 0 := by rw [F.base.hv2, b3n9m060_vec2_coord1]
  have hOc0 : (F.base.T S.Packet.center) 0 = 1 / 2 := by rw [F.base.hO, b3n9m060_vec2_coord0]
  have hOc1 : (F.base.T S.Packet.center) 1 = F.base.Oy := by rw [F.base.hO, b3n9m060_vec2_coord1]
  have hb1y : 0 < (F.base.T Z.b1) 1 := F.hb1_y
  have hOy : 0 < F.base.Oy := F.base.hOy_pos
  have hb1floor : 1 - 2 * F.base.Oy * (F.base.T Z.b1) 1 ≤ (F.base.T Z.b1) 0 :=
    F.circ_disk_x_floor F.hb1A F.hcirc_b1
  refine ⟨F.x_dist_le_anchor hxA, ?_, hv1c1, hxy, ?_, ?_, ?_, ?_⟩
  · rw [F.hcirc_v2, F.hcirc_b1]
  · rw [hv1c1, hv2c1]; linarith [hb1y]
  · rw [hv1c0, hv1c1, hv2c0, hv2c1, hOc0, hOc1]
    nlinarith only [hb1floor, hb1y, hOy]
  ·
    intro heq
    have hb1_ne_v2 : Z.b1 ≠ S.triangle.v2 := by
      have hb1I1 : Z.b1 ∈ S.I1 := by rw [Z.hI1]; simp
      exact (Finset.mem_erase.mp (Finset.mem_erase.mp hb1I1).2).1
    exact hb1_ne_v2 (F.T_injective heq.symm)
  · intro heq
    exact hxne (F.T_injective heq)
end V1AnchorFrame
end FiniteEndpointShell
end Problem97
end Batch3N9
end Batch3N9Unit060

-- Original module: Solutions.Batch3N9.N4d.Qa2Cover
section Batch3N9Unit061
namespace Batch3N9
open scoped EuclideanGeometry
open Finset
namespace Problem97
namespace FiniteEndpointShell
theorem b3n9m061_classify_I1 {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {p : ℝ²} (hp : p ∈ S.I1) :
    p ∈ A ∧ p ∈ S.CP.C1 ∧ p ∉ S.CP.C2 ∧ p ∉ S.CP.C3 := by
  have hC1 : p ∈ S.CP.C1 := (Finset.mem_erase.mp (Finset.mem_erase.mp hp).2).2
  have hne3 : p ≠ S.triangle.v3 := (Finset.mem_erase.mp hp).1
  have hne2 : p ≠ S.triangle.v2 := (Finset.mem_erase.mp (Finset.mem_erase.mp hp).2).1
  have hne1 : p ≠ S.triangle.v1 := fun h => S.CP.v1_notin_C1 (h ▸ hC1)
  have hA : p ∈ A := S.CP.C1_subset hC1
  have hnm : p ∉ S.triangle.verts := by
    simp only [Problem97.MoserTriangle.verts, Finset.mem_insert, Finset.mem_singleton]
    push_neg; exact ⟨hne1, hne2, hne3⟩
  have hone := S.CP.nonmoser_in_one p hA hnm
  refine ⟨hA, hC1, ?_, ?_⟩
  · intro hC2; simp only [hC1, hC2, if_true] at hone
    by_cases hC3 : p ∈ S.CP.C3 <;> simp [hC3] at hone
  · intro hC3; simp only [hC1, hC3, if_true] at hone
    by_cases hC2 : p ∈ S.CP.C2 <;> simp [hC2] at hone
theorem b3n9m061_classify_I2 {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {p : ℝ²} (hp : p ∈ S.I2) :
    p ∈ A ∧ p ∉ S.CP.C1 ∧ p ∈ S.CP.C2 ∧ p ∉ S.CP.C3 := by
  have hC2 : p ∈ S.CP.C2 := (Finset.mem_erase.mp (Finset.mem_erase.mp hp).2).2
  have hne1 : p ≠ S.triangle.v1 := (Finset.mem_erase.mp hp).1
  have hne3 : p ≠ S.triangle.v3 := (Finset.mem_erase.mp (Finset.mem_erase.mp hp).2).1
  have hne2 : p ≠ S.triangle.v2 := fun h => S.CP.v2_notin_C2 (h ▸ hC2)
  have hA : p ∈ A := S.CP.C2_subset hC2
  have hnm : p ∉ S.triangle.verts := by
    simp only [Problem97.MoserTriangle.verts, Finset.mem_insert, Finset.mem_singleton]
    push_neg; exact ⟨hne1, hne2, hne3⟩
  have hone := S.CP.nonmoser_in_one p hA hnm
  refine ⟨hA, ?_, hC2, ?_⟩
  · intro hC1; simp only [hC1, hC2, if_true] at hone
    by_cases hC3 : p ∈ S.CP.C3 <;> simp [hC3] at hone
  · intro hC3; simp only [hC2, hC3, if_true] at hone
    by_cases hC1 : p ∈ S.CP.C1 <;> simp [hC1] at hone
theorem b3n9m061_classify_I3 {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {p : ℝ²} (hp : p ∈ S.I3) :
    p ∈ A ∧ p ∉ S.CP.C1 ∧ p ∉ S.CP.C2 ∧ p ∈ S.CP.C3 := by
  have hC3 : p ∈ S.CP.C3 := (Finset.mem_erase.mp (Finset.mem_erase.mp hp).2).2
  have hne2 : p ≠ S.triangle.v2 := (Finset.mem_erase.mp hp).1
  have hne1 : p ≠ S.triangle.v1 := (Finset.mem_erase.mp (Finset.mem_erase.mp hp).2).1
  have hne3 : p ≠ S.triangle.v3 := fun h => S.CP.v3_notin_C3 (h ▸ hC3)
  have hA : p ∈ A := S.CP.C3_subset hC3
  have hnm : p ∉ S.triangle.verts := by
    simp only [Problem97.MoserTriangle.verts, Finset.mem_insert, Finset.mem_singleton]
    push_neg; exact ⟨hne1, hne2, hne3⟩
  have hone := S.CP.nonmoser_in_one p hA hnm
  refine ⟨hA, ?_, ?_, hC3⟩
  · intro hC1; simp only [hC1, hC3, if_true] at hone
    by_cases hC2 : p ∈ S.CP.C2 <;> simp [hC2] at hone
  · intro hC2; simp only [hC2, hC3, if_true] at hone
    by_cases hC1 : p ∈ S.CP.C1 <;> simp [hC1] at hone
theorem b3n9m061_ne_of_mem_not_mem {α : Type*} {C : Finset α} {p q : α}
    (hp : p ∈ C) (hq : q ∉ C) : p ≠ q := fun h => hq (h ▸ hp)
theorem A_eq_named {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) :
    A = ({S.triangle.v1, S.triangle.v2, S.triangle.v3, Z.a1, Z.b1, Z.a2, Z.b2, Z.a3, Z.b3}
      : Finset ℝ²) := by
  classical
  have ha1 := S.b3n9m061_classify_I1 (show Z.a1 ∈ S.I1 by rw [Z.hI1]; simp)
  have hb1 := S.b3n9m061_classify_I1 (show Z.b1 ∈ S.I1 by rw [Z.hI1]; simp)
  have ha2 := S.b3n9m061_classify_I2 (show Z.a2 ∈ S.I2 by rw [Z.hI2]; simp)
  have hb2 := S.b3n9m061_classify_I2 (show Z.b2 ∈ S.I2 by rw [Z.hI2]; simp)
  have ha3 := S.b3n9m061_classify_I3 (show Z.a3 ∈ S.I3 by rw [Z.hI3]; simp)
  have hb3 := S.b3n9m061_classify_I3 (show Z.b3 ∈ S.I3 by rw [Z.hI3]; simp)
  have v1c1 : S.triangle.v1 ∉ S.CP.C1 := S.CP.v1_notin_C1
  have v1c2 : S.triangle.v1 ∈ S.CP.C2 := S.CP.v1_mem_C2
  have v1c3 : S.triangle.v1 ∈ S.CP.C3 := S.CP.v1_mem_C3
  have v2c1 : S.triangle.v2 ∈ S.CP.C1 := S.CP.v2_mem_C1
  have v2c2 : S.triangle.v2 ∉ S.CP.C2 := S.CP.v2_notin_C2
  have v2c3 : S.triangle.v2 ∈ S.CP.C3 := S.CP.v2_mem_C3
  have v3c1 : S.triangle.v3 ∈ S.CP.C1 := S.CP.v3_mem_C1
  have v3c2 : S.triangle.v3 ∈ S.CP.C2 := S.CP.v3_mem_C2
  have v3c3 : S.triangle.v3 ∉ S.CP.C3 := S.CP.v3_notin_C3
  obtain ⟨_, a1c1, a1c2, a1c3⟩ := ha1
  obtain ⟨_, b1c1, b1c2, b1c3⟩ := hb1
  obtain ⟨_, a2c1, a2c2, a2c3⟩ := ha2
  obtain ⟨_, b2c1, b2c2, b2c3⟩ := hb2
  obtain ⟨_, a3c1, a3c2, a3c3⟩ := ha3
  obtain ⟨_, b3c1, b3c2, b3c3⟩ := hb3
  have e_a1b1 : Z.a1 ≠ Z.b1 := by
    have h : ({Z.a1, Z.b1} : Finset ℝ²).card = 2 := by simpa [Z.hI1] using S.I1_card_eq_two
    intro h'; simp [h'] at h
  have e_a2b2 : Z.a2 ≠ Z.b2 := by
    have h : ({Z.a2, Z.b2} : Finset ℝ²).card = 2 := by simpa [Z.hI2] using S.I2_card_eq_two
    intro h'; simp [h'] at h
  have e_a3b3 : Z.a3 ≠ Z.b3 := by
    have h : ({Z.a3, Z.b3} : Finset ℝ²).card = 2 := by simpa [Z.hI3] using S.I3_card_eq_two
    intro h'; simp [h'] at h
  have e_v1v2 : S.triangle.v1 ≠ S.triangle.v2 := b3n9m061_ne_of_mem_not_mem v1c2 v2c2
  have e_v1v3 : S.triangle.v1 ≠ S.triangle.v3 := b3n9m061_ne_of_mem_not_mem v1c3 v3c3
  have e_v1a1 : S.triangle.v1 ≠ Z.a1 := b3n9m061_ne_of_mem_not_mem v1c2 a1c2
  have e_v1b1 : S.triangle.v1 ≠ Z.b1 := b3n9m061_ne_of_mem_not_mem v1c2 b1c2
  have e_v1a2 : S.triangle.v1 ≠ Z.a2 := b3n9m061_ne_of_mem_not_mem v1c3 a2c3
  have e_v1b2 : S.triangle.v1 ≠ Z.b2 := b3n9m061_ne_of_mem_not_mem v1c3 b2c3
  have e_v1a3 : S.triangle.v1 ≠ Z.a3 := b3n9m061_ne_of_mem_not_mem v1c2 a3c2
  have e_v1b3 : S.triangle.v1 ≠ Z.b3 := b3n9m061_ne_of_mem_not_mem v1c2 b3c2
  have e_v2v3 : S.triangle.v2 ≠ S.triangle.v3 := b3n9m061_ne_of_mem_not_mem v2c3 v3c3
  have e_v2a1 : S.triangle.v2 ≠ Z.a1 := b3n9m061_ne_of_mem_not_mem v2c3 a1c3
  have e_v2b1 : S.triangle.v2 ≠ Z.b1 := b3n9m061_ne_of_mem_not_mem v2c3 b1c3
  have e_v2a2 : S.triangle.v2 ≠ Z.a2 := b3n9m061_ne_of_mem_not_mem v2c1 a2c1
  have e_v2b2 : S.triangle.v2 ≠ Z.b2 := b3n9m061_ne_of_mem_not_mem v2c1 b2c1
  have e_v2a3 : S.triangle.v2 ≠ Z.a3 := b3n9m061_ne_of_mem_not_mem v2c1 a3c1
  have e_v2b3 : S.triangle.v2 ≠ Z.b3 := b3n9m061_ne_of_mem_not_mem v2c1 b3c1
  have e_v3a1 : S.triangle.v3 ≠ Z.a1 := b3n9m061_ne_of_mem_not_mem v3c2 a1c2
  have e_v3b1 : S.triangle.v3 ≠ Z.b1 := b3n9m061_ne_of_mem_not_mem v3c2 b1c2
  have e_v3a2 : S.triangle.v3 ≠ Z.a2 := b3n9m061_ne_of_mem_not_mem v3c1 a2c1
  have e_v3b2 : S.triangle.v3 ≠ Z.b2 := b3n9m061_ne_of_mem_not_mem v3c1 b2c1
  have e_v3a3 : S.triangle.v3 ≠ Z.a3 := b3n9m061_ne_of_mem_not_mem v3c1 a3c1
  have e_v3b3 : S.triangle.v3 ≠ Z.b3 := b3n9m061_ne_of_mem_not_mem v3c1 b3c1
  have e_a1a2 : Z.a1 ≠ Z.a2 := b3n9m061_ne_of_mem_not_mem a1c1 a2c1
  have e_a1b2 : Z.a1 ≠ Z.b2 := b3n9m061_ne_of_mem_not_mem a1c1 b2c1
  have e_a1a3 : Z.a1 ≠ Z.a3 := b3n9m061_ne_of_mem_not_mem a1c1 a3c1
  have e_a1b3 : Z.a1 ≠ Z.b3 := b3n9m061_ne_of_mem_not_mem a1c1 b3c1
  have e_b1a2 : Z.b1 ≠ Z.a2 := b3n9m061_ne_of_mem_not_mem b1c1 a2c1
  have e_b1b2 : Z.b1 ≠ Z.b2 := b3n9m061_ne_of_mem_not_mem b1c1 b2c1
  have e_b1a3 : Z.b1 ≠ Z.a3 := b3n9m061_ne_of_mem_not_mem b1c1 a3c1
  have e_b1b3 : Z.b1 ≠ Z.b3 := b3n9m061_ne_of_mem_not_mem b1c1 b3c1
  have e_a2a3 : Z.a2 ≠ Z.a3 := b3n9m061_ne_of_mem_not_mem a2c2 a3c2
  have e_a2b3 : Z.a2 ≠ Z.b3 := b3n9m061_ne_of_mem_not_mem a2c2 b3c2
  have e_b2a3 : Z.b2 ≠ Z.a3 := b3n9m061_ne_of_mem_not_mem b2c2 a3c2
  have e_b2b3 : Z.b2 ≠ Z.b3 := b3n9m061_ne_of_mem_not_mem b2c2 b3c2
  refine (Finset.eq_of_subset_of_card_le ?_ ?_).symm
  · intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl|rfl|rfl|rfl|rfl|rfl|rfl|rfl|rfl
    · exact S.triangle.v1_mem
    · exact S.triangle.v2_mem
    · exact S.triangle.v3_mem
    · exact S.CP.C1_subset a1c1
    · exact S.CP.C1_subset b1c1
    · exact S.CP.C2_subset a2c2
    · exact S.CP.C2_subset b2c2
    · exact S.CP.C3_subset a3c3
    · exact S.CP.C3_subset b3c3
  · rw [S.hcard9]
    have hcard :
        ({S.triangle.v1, S.triangle.v2, S.triangle.v3, Z.a1, Z.b1, Z.a2, Z.b2, Z.a3, Z.b3}
          : Finset ℝ²).card = 9 := by
      rw [Finset.card_insert_of_notMem (by
            simp [e_v1v2, e_v1v3, e_v1a1, e_v1b1, e_v1a2, e_v1b2, e_v1a3, e_v1b3]),
          Finset.card_insert_of_notMem (by
            simp [e_v2v3, e_v2a1, e_v2b1, e_v2a2, e_v2b2, e_v2a3, e_v2b3]),
          Finset.card_insert_of_notMem (by
            simp [e_v3a1, e_v3b1, e_v3a2, e_v3b2, e_v3a3, e_v3b3]),
          Finset.card_insert_of_notMem (by simp [e_a1b1, e_a1a2, e_a1b2, e_a1a3, e_a1b3]),
          Finset.card_insert_of_notMem (by simp [e_b1a2, e_b1b2, e_b1a3, e_b1b3]),
          Finset.card_insert_of_notMem (by simp [e_a2b2, e_a2a3, e_a2b3]),
          Finset.card_insert_of_notMem (by simp [e_b2a3, e_b2b3]),
          Finset.card_insert_of_notMem (by simp [e_a3b3]),
          Finset.card_singleton]
    rw [hcard]
theorem b3n9m061_hXeq_transport_v2 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : V2AnchorFrame S Z) {P Q x : ℝ²} {r : ℝ}
    (hP : dist x P = r) (hQ : dist x Q = r) :
    dist (F.T x) (F.T P) = dist (F.T x) (F.T Q) := by
  rw [F.tau.dist_image, F.tau.dist_image, hP, hQ]
theorem b3n9m061_hXeq_transport_v1 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : V1AnchorFrame S Z) {P Q x : ℝ²} {r : ℝ}
    (hP : dist x P = r) (hQ : dist x Q = r) :
    dist (F.base.T x) (F.base.T P) = dist (F.base.T x) (F.base.T Q) := by
  rw [F.base.tau.dist_image, F.base.tau.dist_image, hP, hQ]
theorem b3n9m061_kill_v1a2 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : V2AnchorFrame S Z) {r : ℝ}
    (ha3A : Z.a3 ∈ A) (ha3y : (F.T Z.a3) 1 ≤ 0) (ha3v2 : Z.a3 ≠ S.triangle.v2)
    (hP : dist Z.a3 S.triangle.v1 = r) (hQ : dist Z.a3 Z.a2 = r) : False := by
  obtain ⟨hXdisk, hBeq, hBy0, hXy, hdy, hinner, hPQ, hXne⟩ :=
    F.bisectorKill_args_v1a2 ha3A ha3y ha3v2
  exact Problem97.bisectorKill (F.T S.triangle.v2) (F.T S.Packet.center)
    (F.T S.triangle.v1) (F.T Z.a2) (F.T Z.a3)
    hXdisk (b3n9m061_hXeq_transport_v2 F hP hQ) hBeq hBy0 hXy hdy hinner hPQ hXne
theorem b3n9m061_kill_v3a2 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : V2AnchorFrame S Z) {r : ℝ}
    (ha3A : Z.a3 ∈ A) (ha3y : (F.T Z.a3) 1 ≤ 0) (ha3v2 : Z.a3 ≠ S.triangle.v2)
    (hP : dist Z.a3 S.triangle.v3 = r) (hQ : dist Z.a3 Z.a2 = r) : False := by
  obtain ⟨hXdisk, hBeq, hBy0, hXy, hdy, hinner, hPQ, hXne⟩ :=
    F.bisectorKill_args_v3a2 ha3A ha3y ha3v2
  exact Problem97.bisectorKill (F.T S.triangle.v2) (F.T S.Packet.center)
    (F.T S.triangle.v3) (F.T Z.a2) (F.T Z.a3)
    hXdisk (b3n9m061_hXeq_transport_v2 F hP hQ) hBeq hBy0 hXy hdy hinner hPQ hXne
theorem b3n9m061_kill_v1b2 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : V2AnchorFrame S Z) {r : ℝ}
    (ha3A : Z.a3 ∈ A) (ha3y : (F.T Z.a3) 1 ≤ 0) (ha3v2 : Z.a3 ≠ S.triangle.v2)
    (hP : dist Z.a3 S.triangle.v1 = r) (hQ : dist Z.a3 Z.b2 = r) : False := by
  obtain ⟨hXdisk, hBeq, hBy0, hXy, hdy, hinner, hPQ, hXne⟩ :=
    F.bisectorKill_args_v1b2 ha3A ha3y ha3v2
  exact Problem97.bisectorKill (F.T S.triangle.v2) (F.T S.Packet.center)
    (F.T S.triangle.v1) (F.T Z.b2) (F.T Z.a3)
    hXdisk (b3n9m061_hXeq_transport_v2 F hP hQ) hBeq hBy0 hXy hdy hinner hPQ hXne
theorem b3n9m061_kill_v3b2 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : V2AnchorFrame S Z) {r : ℝ}
    (ha3A : Z.a3 ∈ A) (ha3y : (F.T Z.a3) 1 ≤ 0) (ha3v2 : Z.a3 ≠ S.triangle.v2)
    (hP : dist Z.a3 S.triangle.v3 = r) (hQ : dist Z.a3 Z.b2 = r) : False := by
  obtain ⟨hXdisk, hBeq, hBy0, hXy, hdy, hinner, hPQ, hXne⟩ :=
    F.bisectorKill_args_v3b2 ha3A ha3y ha3v2
  exact Problem97.bisectorKill (F.T S.triangle.v2) (F.T S.Packet.center)
    (F.T S.triangle.v3) (F.T Z.b2) (F.T Z.a3)
    hXdisk (b3n9m061_hXeq_transport_v2 F hP hQ) hBeq hBy0 hXy hdy hinner hPQ hXne
theorem b3n9m061_kill_a2b2 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : V2AnchorFrame S Z) {r : ℝ}
    (ha3A : Z.a3 ∈ A) (ha3y : (F.T Z.a3) 1 ≤ 0) (ha3v2 : Z.a3 ≠ S.triangle.v2)
    (hP : dist Z.a3 Z.a2 = r) (hQ : dist Z.a3 Z.b2 = r) : False := by
  obtain ⟨hXdisk, hBeq, hBy0, hXy, hdy, hinner, hPQ, hXne⟩ :=
    F.bisectorKill_args_a2b2 ha3A ha3y ha3v2
  exact Problem97.bisectorKill (F.T S.triangle.v2) (F.T S.Packet.center)
    (F.T Z.a2) (F.T Z.b2) (F.T Z.a3)
    hXdisk (b3n9m061_hXeq_transport_v2 F hP hQ) hBeq hBy0 hXy hdy hinner hPQ hXne
theorem b3n9m061_kill_v1v3 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : V2AnchorFrame S Z) {r : ℝ}
    (ha3A : Z.a3 ∈ A) (ha3y : (F.T Z.a3) 1 ≤ 0) (ha3v2 : Z.a3 ≠ S.triangle.v2)
    (hP : dist Z.a3 S.triangle.v1 = r) (hQ : dist Z.a3 S.triangle.v3 = r) : False := by
  obtain ⟨hXdisk, hBeq, hBy0, hXy, hdy, hinner, hPQ, hXne⟩ :=
    F.bisectorKill_args_v1v3 ha3A ha3y ha3v2
  exact Problem97.bisectorKill (F.T S.triangle.v2) (F.T S.Packet.center)
    (F.T S.triangle.v1) (F.T S.triangle.v3) (F.T Z.a3)
    hXdisk (b3n9m061_hXeq_transport_v2 F hP hQ) hBeq hBy0 hXy hdy hinner hPQ hXne
theorem b3n9m061_kill_a1b1 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : V1AnchorFrame S Z) {r : ℝ}
    (ha3A : Z.a3 ∈ A) (ha3y : (F.base.T Z.a3) 1 ≤ 0) (ha3v1 : Z.a3 ≠ S.triangle.v1)
    (hP : dist Z.a3 Z.a1 = r) (hQ : dist Z.a3 Z.b1 = r) : False := by
  obtain ⟨hXdisk, hBeq, hBy0, hXy, hdy, hinner, hPQ, hXne⟩ :=
    F.bisectorKill_args_a1b1 ha3A ha3y ha3v1
  exact Problem97.bisectorKill (F.base.T S.triangle.v1) (F.base.T S.Packet.center)
    (F.base.T Z.a1) (F.base.T Z.b1) (F.base.T Z.a3)
    hXdisk (b3n9m061_hXeq_transport_v1 F hP hQ) hBeq hBy0 hXy hdy hinner hPQ hXne
theorem b3n9m061_kill_v2a1 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : V1AnchorFrame S Z) {r : ℝ}
    (ha3A : Z.a3 ∈ A) (ha3y : (F.base.T Z.a3) 1 ≤ 0) (ha3v1 : Z.a3 ≠ S.triangle.v1)
    (hP : dist Z.a3 S.triangle.v2 = r) (hQ : dist Z.a3 Z.a1 = r) : False := by
  obtain ⟨hXdisk, hBeq, hBy0, hXy, hdy, hinner, hPQ, hXne⟩ :=
    F.bisectorKill_args_v2a1 ha3A ha3y ha3v1
  exact Problem97.bisectorKill (F.base.T S.triangle.v1) (F.base.T S.Packet.center)
    (F.base.T S.triangle.v2) (F.base.T Z.a1) (F.base.T Z.a3)
    hXdisk (b3n9m061_hXeq_transport_v1 F hP hQ) hBeq hBy0 hXy hdy hinner hPQ hXne
theorem b3n9m061_kill_v2b1 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : V1AnchorFrame S Z) {r : ℝ}
    (ha3A : Z.a3 ∈ A) (ha3y : (F.base.T Z.a3) 1 ≤ 0) (ha3v1 : Z.a3 ≠ S.triangle.v1)
    (hP : dist Z.a3 S.triangle.v2 = r) (hQ : dist Z.a3 Z.b1 = r) : False := by
  obtain ⟨hXdisk, hBeq, hBy0, hXy, hdy, hinner, hPQ, hXne⟩ :=
    F.bisectorKill_args_v2b1 ha3A ha3y ha3v1
  exact Problem97.bisectorKill (F.base.T S.triangle.v1) (F.base.T S.Packet.center)
    (F.base.T S.triangle.v2) (F.base.T Z.b1) (F.base.T Z.a3)
    hXdisk (b3n9m061_hXeq_transport_v1 F hP hQ) hBeq hBy0 hXy hdy hinner hPQ hXne
theorem b3n9m061_kill_KA {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : V2AnchorFrame S Z) {r : ℝ}
    (ha3A : Z.a3 ∈ A) (ha3y : (F.T Z.a3) 1 ≤ 0) (ha3v2 : Z.a3 ≠ S.triangle.v2)
    {p q : ℝ²}
    (hp : p ∈ ({S.triangle.v1, S.triangle.v3, Z.a2, Z.b2} : Finset ℝ²))
    (hq : q ∈ ({S.triangle.v1, S.triangle.v3, Z.a2, Z.b2} : Finset ℝ²))
    (hpq : p ≠ q) (hpr : dist Z.a3 p = r) (hqr : dist Z.a3 q = r) : False := by
  simp only [Finset.mem_insert, Finset.mem_singleton] at hp hq
  rcases hp with rfl | rfl | rfl | rfl <;> rcases hq with rfl | rfl | rfl | rfl
  · exact hpq rfl
  · exact b3n9m061_kill_v1v3 F ha3A ha3y ha3v2 hpr hqr
  · exact b3n9m061_kill_v1a2 F ha3A ha3y ha3v2 hpr hqr
  · exact b3n9m061_kill_v1b2 F ha3A ha3y ha3v2 hpr hqr
  · exact b3n9m061_kill_v1v3 F ha3A ha3y ha3v2 hqr hpr
  · exact hpq rfl
  · exact b3n9m061_kill_v3a2 F ha3A ha3y ha3v2 hpr hqr
  · exact b3n9m061_kill_v3b2 F ha3A ha3y ha3v2 hpr hqr
  · exact b3n9m061_kill_v1a2 F ha3A ha3y ha3v2 hqr hpr
  · exact b3n9m061_kill_v3a2 F ha3A ha3y ha3v2 hqr hpr
  · exact hpq rfl
  · exact b3n9m061_kill_a2b2 F ha3A ha3y ha3v2 hpr hqr
  · exact b3n9m061_kill_v1b2 F ha3A ha3y ha3v2 hqr hpr
  · exact b3n9m061_kill_v3b2 F ha3A ha3y ha3v2 hqr hpr
  · exact b3n9m061_kill_a2b2 F ha3A ha3y ha3v2 hqr hpr
  · exact hpq rfl
theorem b3n9m061_kill_KB {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {Z : ZeroDefectCapLayout S} (F : V1AnchorFrame S Z) {r : ℝ}
    (ha3A : Z.a3 ∈ A) (ha3y : (F.base.T Z.a3) 1 ≤ 0) (ha3v1 : Z.a3 ≠ S.triangle.v1)
    {p q : ℝ²}
    (hp : p ∈ ({Z.a1, Z.b1, S.triangle.v2} : Finset ℝ²))
    (hq : q ∈ ({Z.a1, Z.b1, S.triangle.v2} : Finset ℝ²))
    (hpq : p ≠ q) (hpr : dist Z.a3 p = r) (hqr : dist Z.a3 q = r) : False := by
  simp only [Finset.mem_insert, Finset.mem_singleton] at hp hq
  rcases hp with rfl | rfl | rfl <;> rcases hq with rfl | rfl | rfl
  · exact hpq rfl
  · exact b3n9m061_kill_a1b1 F ha3A ha3y ha3v1 hpr hqr
  · exact b3n9m061_kill_v2a1 F ha3A ha3y ha3v1 hqr hpr
  · exact b3n9m061_kill_a1b1 F ha3A ha3y ha3v1 hqr hpr
  · exact hpq rfl
  · exact b3n9m061_kill_v2b1 F ha3A ha3y ha3v1 hqr hpr
  · exact b3n9m061_kill_v2a1 F ha3A ha3y ha3v1 hpr hqr
  · exact b3n9m061_kill_v2b1 F ha3A ha3y ha3v1 hpr hqr
  · exact hpq rfl
theorem a3_k4_cover {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s : ℝ}
    (hC3pin : S.witnessClassAt_v1 r ∩ S.CP.C3 = ({S.triangle.v2} : Finset ℝ²))
    (hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
    (hexact : S.witnessClassAt_v2 s =
      insert Z.a2 (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²))) :
    False := by
  classical
  let F2 := S.v2AnchorFrame_of_hexact Z hexact
  let F1 := S.v1AnchorFrame_of_hexact Z hC3pin hcard hexact
  have ha3I3 : Z.a3 ∈ S.I3 := by rw [Z.hI3]; simp
  obtain ⟨ha3A, _, _, _⟩ := S.b3n9m061_classify_I3 ha3I3
  have ha3ne : Z.a3 ≠ S.triangle.v1 ∧ Z.a3 ≠ S.triangle.v2 := by
    have hne1 : Z.a3 ≠ S.triangle.v1 := (Finset.mem_erase.mp (Finset.mem_erase.mp ha3I3).2).1
    have hne2 : Z.a3 ≠ S.triangle.v2 := (Finset.mem_erase.mp ha3I3).1
    exact ⟨hne1, hne2⟩
  obtain ⟨r2, hr2pos, hTcard⟩ := S.hK4 Z.a3 ha3A
  set T : Finset ℝ² := A.filter (fun x => dist Z.a3 x = r2) with hTdef
  have hT4 : 4 ≤ T.card := hTcard
  have ha3notT : Z.a3 ∉ T := by
    rw [hTdef]; simp only [Finset.mem_filter]
    rintro ⟨_, hd⟩; rw [dist_self] at hd; exact absurd hd.symm (ne_of_gt hr2pos)
  have hTsub : T ⊆ ({S.triangle.v1, S.triangle.v2, S.triangle.v3, Z.a1, Z.b1, Z.a2, Z.b2, Z.b3}
      : Finset ℝ²) := by
    intro x hxT
    have hxA : x ∈ A := (Finset.mem_filter.mp hxT).1
    have hxne_a3 : x ≠ Z.a3 := fun h => ha3notT (h ▸ hxT)
    have hx9 : x ∈ ({S.triangle.v1, S.triangle.v2, S.triangle.v3, Z.a1, Z.b1, Z.a2, Z.b2,
        Z.a3, Z.b3} : Finset ℝ²) := by rw [← S.A_eq_named Z]; exact hxA
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx9 ⊢
    rcases hx9 with h|h|h|h|h|h|h|h|h
    · exact Or.inl h
    · exact Or.inr (Or.inl h)
    · exact Or.inr (Or.inr (Or.inl h))
    · exact Or.inr (Or.inr (Or.inr (Or.inl h)))
    · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inl h))))
    · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl h)))))
    · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inl h))))))
    · exact absurd h hxne_a3
    · exact Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr (Or.inr h))))))
  set KA : Finset ℝ² := {S.triangle.v1, S.triangle.v3, Z.a2, Z.b2} with hKA
  set KB : Finset ℝ² := {Z.a1, Z.b1, S.triangle.v2} with hKB
  have hpigeon : 2 ≤ (T ∩ KA).card ∨ 2 ≤ (T ∩ KB).card := by
    by_contra h
    push_neg at h
    obtain ⟨hAlt, hBlt⟩ := h
    have hsub : T ⊆ KA ∪ KB ∪ {Z.b3} := by
      intro x hx
      have := hTsub hx
      simp only [hKA, hKB, Finset.mem_union, Finset.mem_insert, Finset.mem_singleton] at this ⊢
      tauto
    have h1 : T ⊆ (T ∩ KA) ∪ (T ∩ KB) ∪ (T ∩ {Z.b3}) := by
      intro x hx
      have := hsub hx
      simp only [Finset.mem_union, Finset.mem_inter] at this ⊢
      tauto
    have hb : (T ∩ {Z.b3}).card ≤ 1 := by
      calc (T ∩ {Z.b3}).card ≤ ({Z.b3} : Finset ℝ²).card :=
            Finset.card_le_card Finset.inter_subset_right
        _ = 1 := Finset.card_singleton _
    have hle3 : T.card ≤ 3 := by
      calc T.card ≤ ((T ∩ KA) ∪ (T ∩ KB) ∪ (T ∩ {Z.b3})).card := Finset.card_le_card h1
        _ ≤ (T ∩ KA).card + (T ∩ KB).card + (T ∩ {Z.b3}).card := by
            refine le_trans (Finset.card_union_le _ _) ?_
            exact Nat.add_le_add_right (Finset.card_union_le _ _) _
        _ ≤ 3 := by omega
    omega
  have ha3yF2 : (F2.T Z.a3) 1 ≤ 0 := F2.ha3_y
  have ha3yF1 : (F1.base.T Z.a3) 1 ≤ 0 := F1.base.ha3_y
  rcases hpigeon with hKA2 | hKB2
  · obtain ⟨p, hpKA, q, hqKA, hpq⟩ :=
      Finset.one_lt_card.mp (by omega : 1 < (T ∩ KA).card)
    have hpT := Finset.mem_of_mem_inter_left hpKA
    have hqT := Finset.mem_of_mem_inter_left hqKA
    have hpKA' := Finset.mem_of_mem_inter_right hpKA
    have hqKA' := Finset.mem_of_mem_inter_right hqKA
    have hpr : dist Z.a3 p = r2 := (Finset.mem_filter.mp hpT).2
    have hqr : dist Z.a3 q = r2 := (Finset.mem_filter.mp hqT).2
    exact b3n9m061_kill_KA F2 ha3A ha3yF2 ha3ne.2 hpKA' hqKA' hpq hpr hqr
  · obtain ⟨p, hpKB, q, hqKB, hpq⟩ :=
      Finset.one_lt_card.mp (by omega : 1 < (T ∩ KB).card)
    have hpT := Finset.mem_of_mem_inter_left hpKB
    have hqT := Finset.mem_of_mem_inter_left hqKB
    have hpKB' := Finset.mem_of_mem_inter_right hpKB
    have hqKB' := Finset.mem_of_mem_inter_right hqKB
    have hpr : dist Z.a3 p = r2 := (Finset.mem_filter.mp hpT).2
    have hqr : dist Z.a3 q = r2 := (Finset.mem_filter.mp hqT).2
    exact b3n9m061_kill_KB F1 ha3A ha3yF1 ha3ne.1 hpKB' hqKB' hpq hpr hqr
end FiniteEndpointShell
end Problem97
end Batch3N9
end Batch3N9Unit061

-- Original module: Solutions.Batch3N9.N4d.FormBXb2UpperArc
section Batch3N9Unit062
namespace Batch3N9
open scoped EuclideanGeometry
open Finset
namespace Problem97
namespace FiniteEndpointShell
def SelectorV3Qb2Packet
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (t : ℝ) : Prop :=
  let T := S.witnessClassAt_v3 t
  S.I3 ⊆ T ∧
    ∃ p : ℝ²,
      p ∈ ({Z.a1, Z.b1, S.triangle.v2} : Finset ℝ²) ∧
        T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
          T ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²)
def Xb2Pin
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r : ℝ) : Prop :=
  ∃ _ : (Z.b2 : ℝ²) ∈ S.I2,
    S.witnessClassAt_v1 r ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²)
def AInSBPin
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (s : ℝ) : Prop :=
  0 < s ∧ SelectorV2Qv1Packet S Z s
theorem b3n9m062_witnessClassAt_v1_radius_pos_of_card_ge_four
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {r : ℝ}
    (hcard : 4 ≤ (S.witnessClassAt_v1 r).card) :
    0 < r := by
  have hpos : 0 < (S.witnessClassAt_v1 r).card := by
    omega
  obtain ⟨x, hx⟩ := Finset.card_pos.mp hpos
  have hr_nonneg : 0 ≤ r := by
    have hxdist : dist S.triangle.v1 x = r := (Finset.mem_filter.mp hx).2
    have : 0 ≤ dist S.triangle.v1 x := dist_nonneg
    linarith
  by_contra hnot
  have hr0 : r = 0 := by
    linarith
  have hsubset :
      S.witnessClassAt_v1 r ⊆ ({S.triangle.v1} : Finset ℝ²) := by
    intro y hy
    have hydist : dist S.triangle.v1 y = r := (Finset.mem_filter.mp hy).2
    have hy0 : dist S.triangle.v1 y = 0 := by
      simpa [hr0] using hydist
    have hy_eq : y = S.triangle.v1 := by
      have : S.triangle.v1 = y := dist_eq_zero.mp hy0
      simpa using this.symm
    simp [hy_eq]
  have hcard_le :
      (S.witnessClassAt_v1 r).card ≤ ({S.triangle.v1} : Finset ℝ²).card :=
    Finset.card_le_card hsubset
  have : (S.witnessClassAt_v1 r).card ≤ 1 := by
    simpa using hcard_le
  omega
theorem b3n9m062_formBv1B2Packet_of_pins
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r : ℝ}
    (hB : S.IsFormB_v1 r) (hxb2 : Xb2Pin S Z r) :
    FormBv1B2Packet S Z r := by
  rcases hB with ⟨_, _, _, hv2eq⟩
  rcases hxb2 with ⟨hb2I2, hb2eq⟩
  exact ⟨hb2I2, hb2eq, hv2eq⟩
theorem b3n9m062_formBv1B2SelectorV2Qv1Packet_of_pins
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s : ℝ}
    (hB : S.IsFormB_v1 r) (hxb2 : Xb2Pin S Z r)
    (hAinSB : AInSBPin S Z s) :
    FormBv1B2SelectorV2Qv1Packet S Z r s := by
  rcases hAinSB with ⟨hs, hselector⟩
  exact ⟨S.b3n9m062_formBv1B2Packet_of_pins Z hB hxb2, hs, hselector⟩
theorem b3n9m062_selectorShape_v2_q_eq_v1_exact_packet_of_pins
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s : ℝ}
    (hB : S.IsFormB_v1 r)
    (hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
    (hxb2 : Xb2Pin S Z r) (hAinSB : AInSBPin S Z s) :
    S.witnessClassAt_v2 s =
      insert Z.a2
        (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²)) := by
  have hr := S.b3n9m062_witnessClassAt_v1_radius_pos_of_card_ge_four hcard
  have hbranch := S.b3n9m062_formBv1B2SelectorV2Qv1Packet_of_pins Z hB hxb2 hAinSB
  have hlocal :
      FormBv1B2SelectorV2Qv1Packet S Z r s →
        S.witnessClassAt_v2 s =
          insert Z.a2
            (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²)) := by
    dsimp [FormBv1B2SelectorV2Qv1Packet, FormBv1B2Packet, SelectorV2Qv1Packet]
    exact S.selectorShape_v2_q_eq_v1_exact_packet_of_b2
      (Z := Z) (r := r) (s := s) hr hcard
  exact hlocal hbranch
theorem b3n9m062_selectorShape_v3_q_eq_v1_impossible_of_pins
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s t : ℝ}
    (hB : S.IsFormB_v1 r)
    (hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
    (hxb2 : Xb2Pin S Z r) (hAinSB : AInSBPin S Z s)
    (hpacket : SelectorV3Qv1Packet S Z t) :
    False := by
  have hbranch := S.b3n9m062_formBv1B2SelectorV2Qv1Packet_of_pins Z hB hxb2 hAinSB
  have hexact := S.b3n9m062_selectorShape_v2_q_eq_v1_exact_packet_of_pins
    Z hB hcard hxb2 hAinSB
  have hlocal :
      FormBv1B2SelectorV2Qv1Packet S Z r s →
        S.witnessClassAt_v2 s =
          insert Z.a2
            (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²)) →
          SelectorV3Qv1Packet S Z t →
            False := by
    dsimp [FormBv1B2SelectorV2Qv1Packet, FormBv1B2Packet]
    dsimp [SelectorV2Qv1Packet, SelectorV3Qv1Packet]
    exact S.selectorShape_v3_q_eq_v1_impossible_of_b2_exact_packet
      (Z := Z) (r := r) (s := s) (t := t)
  exact hlocal hbranch hexact hpacket
theorem b3n9m062_selectorShape_v3_q_eq_a2_nonwitness_upperArc_impossible
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s t : ℝ}
    (hbranch : FormBv1B2SelectorV2Qv1Packet S Z r s)
    (hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
    (hexact : S.witnessClassAt_v2 s =
      insert Z.a2
        (insert Z.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²)))
    (hpacket : SelectorV3Qa2Packet S Z t) :
    False := by
  let _ := hpacket
  exact S.a3_k4_cover Z hbranch.1.2.2 hcard hexact
theorem b3n9m062_selectorShape_v3_q_eq_a2_impossible_of_pins
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s t : ℝ}
    (hB : S.IsFormB_v1 r)
    (hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
    (hxb2 : Xb2Pin S Z r) (hAinSB : AInSBPin S Z s)
    (hpacket : SelectorV3Qa2Packet S Z t) :
    False := by
  have hbranch := S.b3n9m062_formBv1B2SelectorV2Qv1Packet_of_pins Z hB hxb2 hAinSB
  have hexact := S.b3n9m062_selectorShape_v2_q_eq_v1_exact_packet_of_pins
    Z hB hcard hxb2 hAinSB
  exact S.b3n9m062_selectorShape_v3_q_eq_a2_nonwitness_upperArc_impossible
    Z hbranch hcard hexact hpacket
theorem b3n9m062_selectorShape_v3_q_eq_b2_impossible_of_pins
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s t : ℝ}
    (hB : S.IsFormB_v1 r)
    (hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
    (hxb2 : Xb2Pin S Z r) (hAinSB : AInSBPin S Z s)
    (hpacket : SelectorV3Qb2Packet S Z t) :
    False := by
  have hbranch0 := S.b3n9m062_formBv1B2SelectorV2Qv1Packet_of_pins Z hB hxb2 hAinSB
  rcases hbranch0 with ⟨⟨hb2I2, hb2eq, hv2eq⟩, hs, hselector⟩
  have hbranch' : FormBv1A2SelectorV2Qv1Packet S Z.swapI2 r s := by
    refine ⟨?_, hs, ?_⟩
    · refine ⟨?_, ?_, ?_⟩
      · simpa [ZeroDefectCapLayout.swapI2] using hb2I2
      · simpa [FormBv1A2Packet, ZeroDefectCapLayout.swapI2] using hb2eq
      · simpa [FormBv1A2Packet, ZeroDefectCapLayout.swapI2] using hv2eq
    · simpa [SelectorV2Qv1Packet, ZeroDefectCapLayout.swapI2] using hselector
  have hexact := S.b3n9m062_selectorShape_v2_q_eq_v1_exact_packet_of_pins
    Z hB hcard hxb2 hAinSB
  have hswap :
      S.witnessClassAt_v2 s =
        insert Z.swapI2.a2
          (insert Z.swapI2.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²)) := by
    ext x
    simp [ZeroDefectCapLayout.swapI2, hexact, Finset.mem_insert]
    simp [or_left_comm]
  have hpacket' : SelectorV3Qa2Packet S Z.swapI2 t := by
    simpa [SelectorV3Qa2Packet, SelectorV3Qb2Packet, ZeroDefectCapLayout.swapI2]
      using hpacket
  have hlocal :
      FormBv1A2SelectorV2Qv1Packet S Z.swapI2 r s →
        S.witnessClassAt_v2 s =
          insert Z.swapI2.a2
            (insert Z.swapI2.b2 ({S.triangle.v3, S.triangle.v1} : Finset ℝ²)) →
          SelectorV3Qa2Packet S Z.swapI2 t →
            False := by
    dsimp [FormBv1A2SelectorV2Qv1Packet, FormBv1A2Packet]
    dsimp [SelectorV2Qv1Packet, SelectorV3Qa2Packet]
    exact S.selectorShape_v3_q_eq_a2_impossible_of_exact_packet
      (Z := Z.swapI2) (r := r) (s := s) (t := t)
  exact hlocal hbranch' hswap hpacket'
theorem b3n9m062_selectorShape_v3_split_local
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) :
    ∃ t : ℝ, 0 < t ∧ SelectorV3SplitPacket S Z t := by
  rcases S.selectorShape_v3_split Z with ⟨t, ht, hsplit⟩
  exact ⟨t, ht, by simpa [SelectorV3SplitPacket] using hsplit⟩
theorem n4d_bB1_impossible
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s : ℝ}
    (hB : S.IsFormB_v1 r)
    (hcard : 4 ≤ (S.witnessClassAt_v1 r).card)
    (hxb2 : Xb2Pin S Z r)
    (hAinSB : AInSBPin S Z s) :
    False := by
  rcases S.b3n9m062_selectorShape_v3_split_local Z with ⟨t, _, hsplit⟩
  rcases hsplit with ⟨_, hI3sub, hcases⟩
  rcases hcases with hqv1 | hrest
  · have hpacket : SelectorV3Qv1Packet S Z t := by
      dsimp [SelectorV3Qv1Packet]
      exact hqv1
    exact S.b3n9m062_selectorShape_v3_q_eq_v1_impossible_of_pins
      Z hB hcard hxb2 hAinSB hpacket
  rcases hrest with hqa2 | hqb2
  · have hpacket : SelectorV3Qa2Packet S Z t := by
      dsimp [SelectorV3Qa2Packet]
      exact ⟨hI3sub, hqa2⟩
    exact S.b3n9m062_selectorShape_v3_q_eq_a2_impossible_of_pins
      Z hB hcard hxb2 hAinSB hpacket
  have hpacket : SelectorV3Qb2Packet S Z t := by
    dsimp [SelectorV3Qb2Packet]
    exact ⟨hI3sub, hqb2⟩
  exact S.b3n9m062_selectorShape_v3_q_eq_b2_impossible_of_pins
    Z hB hcard hxb2 hAinSB hpacket
end FiniteEndpointShell
end Problem97
end Batch3N9
end Batch3N9Unit062

-- Original module: Solutions.Batch3N9.Bridge.A1SpineWiring
section Batch3N9Unit063
namespace Batch3N9
open Finset Problem97
open scoped EuclideanGeometry
namespace Problem97
namespace FiniteEndpointShell
theorem mem_C2_of_mem_I2 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {x : ℝ²} (hx : x ∈ S.I2) :
    x ∈ S.CP.C2 :=
  Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hx)
theorem mem_C3_of_mem_I3 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {x : ℝ²} (hx : x ∈ S.I3) :
    x ∈ S.CP.C3 :=
  Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hx)
theorem mem_A_of_mem_I2 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {x : ℝ²} (hx : x ∈ S.I2) :
    x ∈ A :=
  S.CP.C2_subset (mem_C2_of_mem_I2 hx)
theorem not_triangle_of_mem_I2 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {x : ℝ²} (hx : x ∈ S.I2) :
    x ∉ S.triangle.verts := by
  have hxv1 : x ≠ S.triangle.v1 := (Finset.mem_erase.mp hx).1
  have hxv3 : x ≠ S.triangle.v3 := (Finset.mem_erase.mp (Finset.mem_erase.mp hx).2).1
  have hxC2 : x ∈ S.CP.C2 := mem_C2_of_mem_I2 hx
  have hxv2 : x ≠ S.triangle.v2 := by
    intro h
    exact S.CP.v2_notin_C2 (h ▸ hxC2)
  simp [Problem97.MoserTriangle.verts, hxv1, hxv2, hxv3]
theorem ne_of_mem_I2_of_mem_I3 {A : Finset ℝ²} {S : FiniteEndpointShell A}
    {x y : ℝ²} (hx : x ∈ S.I2) (hy : y ∈ S.I3) :
    x ≠ y := by
  intro hxy
  have hxA : x ∈ A := mem_A_of_mem_I2 hx
  have hxnon : x ∉ S.triangle.verts := not_triangle_of_mem_I2 hx
  have hxC2 : x ∈ S.CP.C2 := mem_C2_of_mem_I2 hx
  have hxC3 : x ∈ S.CP.C3 := by simpa [hxy] using mem_C3_of_mem_I3 hy
  have hone := S.CP.nonmoser_in_one x hxA hxnon
  by_cases hxC1 : x ∈ S.CP.C1
  · simp [hxC1, hxC2, hxC3] at hone
  · simp [hxC1, hxC2, hxC3] at hone
def FormBv1A2SelectorV2LowerPacketPublic
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (r s : ℝ) : Prop :=
  let T := S.witnessClassAt_v2 s
  (Z.a2 : ℝ²) ∈ S.I2 ∧
  S.witnessClassAt_v1 r ∩ S.CP.C2 = ({Z.a2} : Finset ℝ²) ∧
  T.card = 4 ∧
  S.I2 ⊆ T ∧
  T ∩ S.CP.C1 = ({S.triangle.v3} : Finset ℝ²) ∧
  ((T ∩ S.CP.C3 = ({Z.a3} : Finset ℝ²)) ∨
   (T ∩ S.CP.C3 = ({Z.b3} : Finset ℝ²)))
def SelectorV3Qb2PacketPublic
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) (t : ℝ) : Prop :=
  let T := S.witnessClassAt_v3 t
  S.I3 ⊆ T ∧
  ∃ p : ℝ²,
    p ∈ ({Z.a1, Z.b1} : Finset ℝ²) ∧
    T ∩ S.CP.C1 = ({p} : Finset ℝ²) ∧
    T ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²)
end FiniteEndpointShell
end Problem97
end Batch3N9
end Batch3N9Unit063

-- Original module: Solutions.Batch3N9.N4d.SmallSReductions
section Batch3N9Unit064
namespace Batch3N9
open scoped EuclideanGeometry InnerProductSpace
open EuclideanGeometry
namespace Problem97
theorem nonobtuse_v₃_numerator_nonneg (v₁ v₂ v₃ : ℝ²)
    (h1x : v₁ 0 = 0) (h1y : v₁ 1 = 0) (h2x : v₂ 0 = 1) (h2y : v₂ 1 = 0)
    (hno : 0 ≤ (inner ℝ (v₁ - v₃) (v₂ - v₃) : ℝ)) :
    0 ≤ v₃ 0 ^ 2 - v₃ 0 + v₃ 1 ^ 2 := by
  rw [PiLp.inner_apply] at hno
  simp only [Fin.sum_univ_two, PiLp.sub_apply, h1x, h1y, h2x, h2y,
    RCLike.inner_apply, conj_trivial] at hno
  nlinarith only [hno]
end Problem97
end Batch3N9
end Batch3N9Unit064

-- Original module: Solutions.Batch3N9.N4d.QeqEb2PinClash
section Batch3N9Unit065
namespace Batch3N9
open scoped EuclideanGeometry InnerProductSpace
open Finset
namespace Problem97
theorem b3n9m065_dist_sq_coords (x y : ℝ²) :
    dist x y ^ 2 = (x 0 - y 0) ^ 2 + (x 1 - y 1) ^ 2 :=
  Problem97.dist_sq_coord x y
theorem b3n9m065_vec2_c0 (a b : ℝ) : (Problem97.CGN.vec2 a b) 0 = a := by
  simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
theorem b3n9m065_vec2_c1 (a b : ℝ) : (Problem97.CGN.vec2 a b) 1 = b := by
  simp [Problem97.CGN.vec2, EuclideanSpace.single_apply]
theorem b3n9m065_sa2_chart_base_local (p : ℝ²) :
    signedArea2 p (Problem97.CGN.vec2 0 0) (Problem97.CGN.vec2 1 0) = p 1 := by
  simp [Problem97.signedArea2, Problem97.CGN.vec2, EuclideanSpace.single_apply]
  ring
theorem b3n9m065_v3_lt_v3v2_of_mem_I1
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {q : ℝ²}
    (hqI1 : q ∈ S.I1) :
    dist S.triangle.v3 q < dist S.triangle.v3 S.triangle.v2 := by
  classical
  have hqC1 : q ∈ S.CP.C1 :=
    Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hqI1)
  have hq_ne_v3 : q ≠ S.triangle.v3 :=
    (Finset.mem_erase.mp hqI1).1
  have hq_ne_v2 : q ≠ S.triangle.v2 :=
    (Finset.mem_erase.mp (Finset.mem_erase.mp hqI1).2).1
  rcases Problem97.CGN.CGN4g_capData_of_supportCap_oriented
      (A := A) (C := S.CP.C1) (M := S.triangle)
      S.hconv S.hnoncol S.CP.C1_subset
      (fun x hxA => (S.CP.arc_membership x hxA).1)
      S.CP.v2_mem_C1 S.CP.v3_mem_C1 S.Packet S.Packet.inner_at_v1 with
    ⟨m, L, Packet, Hside, Hord, hLC, hEnds⟩
  have hqL : q ∈ Finset.univ.image L.points := by
    rw [hLC]
    exact hqC1
  rcases Finset.mem_image.mp hqL with ⟨i, -, hi⟩
  rcases hEnds with hFirstLast | hLastFirst
  · have hi_ne_last : i ≠ Problem97.CGN.lastIndex Packet.hm := by
      intro hi_last
      apply hq_ne_v3
      calc
        q = L.points i := hi.symm
        _ = L.points (Problem97.CGN.lastIndex Packet.hm) := by simp [hi_last]
        _ = S.triangle.v3 := hFirstLast.2
    have hi_rev_lt_last : i.rev < Problem97.CGN.lastIndex Packet.hm := by
      have hi_ne_zero : i.val ≠ 0 := by
        intro hi_zero
        have hi_first : i = Problem97.CGN.firstIndex Packet.hm := by
          ext
          simpa [Problem97.CGN.firstIndex] using hi_zero
        apply hq_ne_v2
        calc
          q = L.points i := hi.symm
          _ = L.points (Problem97.CGN.firstIndex Packet.hm) := by simp [hi_first]
          _ = S.triangle.v2 := hFirstLast.1
      have hi_pos : 0 < i.val := Nat.pos_of_ne_zero hi_ne_zero
      have hfirst_lt_i : Problem97.CGN.firstIndex Packet.hm < i := by
        rw [Fin.lt_def]
        simpa [Problem97.CGN.firstIndex] using hi_pos
      have hlast_rev_first' :
          (Problem97.CGN.lastIndex Packet.hm).rev = Problem97.CGN.firstIndex Packet.hm := by
        ext
        rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
        simp [Problem97.CGN.firstIndex]
        omega
      rw [Fin.rev_lt_iff]
      simpa [hlast_rev_first'] using hfirst_lt_i
    have hmono :
        Problem97.FiniteEndpoint.E3L20b_rightEndpoint_capDistance_strict
          (L.points (Problem97.CGN.lastIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev L) :=
      Problem97.FiniteEndpoint.E3L20b_of_cgnCapData Packet Hside Hord
    have hlt :=
      hmono (i := i.rev) (j := Problem97.CGN.lastIndex Packet.hm) hi_rev_lt_last
    have hlast_rev_first :
        (Problem97.CGN.lastIndex Packet.hm).rev = Problem97.CGN.firstIndex Packet.hm := by
      ext
      rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
      simp [Problem97.CGN.firstIndex]
      omega
    simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev_points,
      hi, hFirstLast.1, hFirstLast.2, hlast_rev_first] using hlt
  · have hi_lt_last : i < Problem97.CGN.lastIndex Packet.hm := by
      apply Fin.lt_def.mpr
      rw [Problem97.CGN.lastIndex_val]
      have hi_lt_top : i.val < m := i.is_lt
      have hi_ne_last : i ≠ Problem97.CGN.lastIndex Packet.hm := by
        intro hi_last
        apply hq_ne_v2
        calc
          q = L.points i := hi.symm
          _ = L.points (Problem97.CGN.lastIndex Packet.hm) := by simp [hi_last]
          _ = S.triangle.v2 := hLastFirst.2
      have hi_ne_top : i.val ≠ m - 1 := by
        intro hi_top
        apply hi_ne_last
        ext
        simpa [Problem97.CGN.lastIndex, Problem97.CGN.finIndex] using hi_top
      omega
    have hmono :
        Problem97.FiniteEndpoint.E3L20a_leftEndpoint_capDistance_strict
          (L.points (Problem97.CGN.firstIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap L) :=
      Problem97.FiniteEndpoint.E3L20a_of_cgnCapData Packet Hside Hord
    have hlt :=
      hmono (i := i) (j := Problem97.CGN.lastIndex Packet.hm) hi_lt_last
    simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap_points,
      hi, hLastFirst.1, hLastFirst.2] using hlt
theorem b3n9m065_v1_lt_v1v3_of_mem_I2
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {p : ℝ²}
    (hpI2 : p ∈ S.I2) :
    dist S.triangle.v1 p < dist S.triangle.v1 S.triangle.v3 := by
  first
  | exact Batch3N9.Problem97.FiniteEndpointShell.b3n9m056_v1_lt_v1v3_of_mem_I2
  | apply Batch3N9.Problem97.FiniteEndpointShell.b3n9m056_v1_lt_v1v3_of_mem_I2 <;> assumption
theorem b3n9m065_v2_lt_v2v1_of_mem_I3
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {q : ℝ²}
    (hqI3 : q ∈ S.I3) :
    dist S.triangle.v2 q < dist S.triangle.v2 S.triangle.v1 := by
  classical
  have hqC3 : q ∈ S.CP.C3 := by
    unfold Problem97.FiniteEndpointShell.I3 at hqI3
    exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hqI3)
  have hq_ne_v2 : q ≠ S.triangle.v2 := by
    unfold Problem97.FiniteEndpointShell.I3 at hqI3
    exact (Finset.mem_erase.mp hqI3).1
  have hq_ne_v1 : q ≠ S.triangle.v1 := by
    unfold Problem97.FiniteEndpointShell.I3 at hqI3
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hqI3).2).1
  rcases Problem97.CGN.CGN4g_capData_of_supportCap_oriented
      (A := A) (C := S.CP.C3) (M := S.triangle3)
      S.hconv S.hnoncol S.CP.C3_subset
      (fun x hxA => (S.CP.arc_membership x hxA).2.2)
      S.CP.v1_mem_C3 S.CP.v2_mem_C3 S.packet3 S.packet3.inner_at_v1 with
    ⟨m, L, Packet, Hside, Hord, hLC, hEnds⟩
  have hqL : q ∈ Finset.univ.image L.points := by
    rw [hLC]
    exact hqC3
  rcases Finset.mem_image.mp hqL with ⟨i, -, hi⟩
  rcases hEnds with hFirstLast | hLastFirst
  · have hi_ne_last : i ≠ Problem97.CGN.lastIndex Packet.hm := by
      intro hi_last
      apply hq_ne_v2
      calc
        q = L.points i := hi.symm
        _ = L.points (Problem97.CGN.lastIndex Packet.hm) := by simp [hi_last]
        _ = S.triangle.v2 := hFirstLast.2
    have hi_rev_lt_last : i.rev < Problem97.CGN.lastIndex Packet.hm := by
      have hi_ne_zero : i.val ≠ 0 := by
        intro hi_zero
        have hi_first : i = Problem97.CGN.firstIndex Packet.hm := by
          ext
          simpa [Problem97.CGN.firstIndex] using hi_zero
        apply hq_ne_v1
        calc
          q = L.points i := hi.symm
          _ = L.points (Problem97.CGN.firstIndex Packet.hm) := by simp [hi_first]
          _ = S.triangle.v1 := hFirstLast.1
      have hi_pos : 0 < i.val := Nat.pos_of_ne_zero hi_ne_zero
      have hfirst_lt_i : Problem97.CGN.firstIndex Packet.hm < i := by
        rw [Fin.lt_def]
        simpa [Problem97.CGN.firstIndex] using hi_pos
      have hlast_rev_first' :
          (Problem97.CGN.lastIndex Packet.hm).rev = Problem97.CGN.firstIndex Packet.hm := by
        ext
        rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
        simp [Problem97.CGN.firstIndex]
        omega
      rw [Fin.rev_lt_iff]
      simpa [hlast_rev_first'] using hfirst_lt_i
    have hmono :
        Problem97.FiniteEndpoint.E3L20b_rightEndpoint_capDistance_strict
          (L.points (Problem97.CGN.lastIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev L) :=
      Problem97.FiniteEndpoint.E3L20b_of_cgnCapData Packet Hside Hord
    have hlt :=
      hmono (i := i.rev) (j := Problem97.CGN.lastIndex Packet.hm) hi_rev_lt_last
    have hlast_rev_first :
        (Problem97.CGN.lastIndex Packet.hm).rev = Problem97.CGN.firstIndex Packet.hm := by
      ext
      rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
      simp [Problem97.CGN.firstIndex]
      omega
    simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev_points,
      hi, hFirstLast.1, hFirstLast.2, hlast_rev_first] using hlt
  · have hi_lt_last : i < Problem97.CGN.lastIndex Packet.hm := by
      apply Fin.lt_def.mpr
      rw [Problem97.CGN.lastIndex_val]
      have hi_lt_top : i.val < m := i.is_lt
      have hi_ne_last : i ≠ Problem97.CGN.lastIndex Packet.hm := by
        intro hi_last
        apply hq_ne_v1
        calc
          q = L.points i := hi.symm
          _ = L.points (Problem97.CGN.lastIndex Packet.hm) := by simp [hi_last]
          _ = S.triangle.v1 := hLastFirst.2
      have hi_ne_top : i.val ≠ m - 1 := by
        intro hi_top
        apply hi_ne_last
        ext
        simpa [Problem97.CGN.lastIndex, Problem97.CGN.finIndex] using hi_top
      omega
    have hmono :
        Problem97.FiniteEndpoint.E3L20a_leftEndpoint_capDistance_strict
          (L.points (Problem97.CGN.firstIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap L) :=
      Problem97.FiniteEndpoint.E3L20a_of_cgnCapData Packet Hside Hord
    have hlt :=
      hmono (i := i) (j := Problem97.CGN.lastIndex Packet.hm) hi_lt_last
    simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap_points,
      hi, hLastFirst.1, hLastFirst.2] using hlt
set_option maxHeartbeats 4000000 in
theorem b3n9m065_frame_circumcenter_facts
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    {T : ℝ² → ℝ²} (tau : Problem97.CGN.SimilarityTransportData T)
    (hv1 : T S.triangle.v1 = Problem97.CGN.vec2 0 0)
    (hv2 : T S.triangle.v2 = Problem97.CGN.vec2 1 0)
    (hv3y_pos : 0 < (T S.triangle.v3) 1) :
    (T S.Packet.center) 0 = 1 / 2 ∧ 0 ≤ (T S.Packet.center) 1 ∧
      (tau.scale * S.Packet.radius) ^ 2 = 1 / 4 + (T S.Packet.center) 1 ^ 2 := by
  classical
  have hinner_frame : 0 ≤ (inner ℝ (T S.triangle.v1 - T S.triangle.v3)
      (T S.triangle.v2 - T S.triangle.v3) : ℝ) := by
    have hexp := norm_sub_sq_real (T S.triangle.v1 - T S.triangle.v3)
      (T S.triangle.v2 - T S.triangle.v3)
    have hrw : (T S.triangle.v1 - T S.triangle.v3) - (T S.triangle.v2 - T S.triangle.v3)
        = T S.triangle.v1 - T S.triangle.v2 := by abel
    rw [hrw] at hexp
    have n13 : ‖T S.triangle.v1 - T S.triangle.v3‖
        = tau.scale * dist S.triangle.v1 S.triangle.v3 := by rw [← dist_eq_norm, tau.dist_image]
    have n23 : ‖T S.triangle.v2 - T S.triangle.v3‖
        = tau.scale * dist S.triangle.v2 S.triangle.v3 := by rw [← dist_eq_norm, tau.dist_image]
    have n12 : ‖T S.triangle.v1 - T S.triangle.v2‖
        = tau.scale * dist S.triangle.v1 S.triangle.v2 := by rw [← dist_eq_norm, tau.dist_image]
    rw [n13, n23, n12] at hexp
    have horig := norm_sub_sq_real (S.triangle.v1 - S.triangle.v3)
      (S.triangle.v2 - S.triangle.v3)
    have hrw2 : (S.triangle.v1 - S.triangle.v3) - (S.triangle.v2 - S.triangle.v3)
        = S.triangle.v1 - S.triangle.v2 := by abel
    rw [hrw2] at horig
    have hinner0 : 0 ≤ (inner ℝ (S.triangle.v1 - S.triangle.v3)
        (S.triangle.v2 - S.triangle.v3) : ℝ) := S.Packet.inner_at_v3
    have m13 : ‖S.triangle.v1 - S.triangle.v3‖ = dist S.triangle.v1 S.triangle.v3 :=
      (dist_eq_norm _ _).symm
    have m23 : ‖S.triangle.v2 - S.triangle.v3‖ = dist S.triangle.v2 S.triangle.v3 :=
      (dist_eq_norm _ _).symm
    have m12 : ‖S.triangle.v1 - S.triangle.v2‖ = dist S.triangle.v1 S.triangle.v2 :=
      (dist_eq_norm _ _).symm
    rw [m13, m23, m12] at horig
    have hsc : 0 ≤ tau.scale ^ 2 := sq_nonneg _
    nlinarith only [hexp, hsc, hinner0, horig, mul_nonneg hsc hinner0]
  have h1x : (T S.triangle.v1) 0 = 0 := by rw [hv1, b3n9m065_vec2_c0]
  have h1y : (T S.triangle.v1) 1 = 0 := by rw [hv1, b3n9m065_vec2_c1]
  have h2x : (T S.triangle.v2) 0 = 1 := by rw [hv2, b3n9m065_vec2_c0]
  have h2y : (T S.triangle.v2) 1 = 0 := by rw [hv2, b3n9m065_vec2_c1]
  have hnum : 0 ≤ (T S.triangle.v3) 0 ^ 2 - (T S.triangle.v3) 0 + (T S.triangle.v3) 1 ^ 2 :=
    nonobtuse_v₃_numerator_nonneg _ _ _ h1x h1y h2x h2y hinner_frame
  have hbd1 : dist S.triangle.v1 S.Packet.center = S.Packet.radius := by
    rw [dist_eq_norm]; exact S.Packet.moser_on_boundary_1
  have hbd2 : dist S.triangle.v2 S.Packet.center = S.Packet.radius := by
    rw [dist_eq_norm]; exact S.Packet.moser_on_boundary_2
  have hbd3 : dist S.triangle.v3 S.Packet.center = S.Packet.radius := by
    rw [dist_eq_norm]; exact S.Packet.moser_on_boundary_3
  set R := tau.scale * S.Packet.radius with hR_def
  have hb1sq : dist (T S.triangle.v1) (T S.Packet.center) ^ 2 = R ^ 2 := by
    rw [tau.dist_image, hbd1, hR_def]
  have hb2sq : dist (T S.triangle.v2) (T S.Packet.center) ^ 2 = R ^ 2 := by
    rw [tau.dist_image, hbd2, hR_def]
  have hb3sq : dist (T S.triangle.v3) (T S.Packet.center) ^ 2 = R ^ 2 := by
    rw [tau.dist_image, hbd3, hR_def]
  set Vx := (T S.triangle.v3) 0 with hVx_def
  set Vy := (T S.triangle.v3) 1 with hVy_def
  set ox := (T S.Packet.center) 0 with hox_def
  set Oy := (T S.Packet.center) 1 with hOy_def
  have hVy_pos : 0 < Vy := hv3y_pos
  have e1 : ox ^ 2 + Oy ^ 2 = R ^ 2 := by
    have h := hb1sq
    rw [b3n9m065_dist_sq_coords, h1x, h1y] at h
    simpa [hox_def, hOy_def] using h
  have e2 : (1 - ox) ^ 2 + Oy ^ 2 = R ^ 2 := by
    have h := hb2sq
    rw [b3n9m065_dist_sq_coords, h2x, h2y] at h
    nlinarith only [h]
  have e3 : (Vx - ox) ^ 2 + (Vy - Oy) ^ 2 = R ^ 2 := by
    have h := hb3sq
    rw [b3n9m065_dist_sq_coords] at h
    simpa [hVx_def, hVy_def, hox_def, hOy_def] using h
  clear_value Vx Vy ox Oy R
  have hox : ox = 1 / 2 := by nlinarith only [e1, e2]
  have hOy_nonneg : 0 ≤ Oy := by
    have hmecnum : 2 * Vy * Oy = Vx ^ 2 - Vx + Vy ^ 2 := by nlinarith only [e1, e3, e2, hnum, hox]
    nlinarith only [hnum, hmecnum, hv3y_pos, hVy_pos]
  have hRsq : R ^ 2 = 1 / 4 + Oy ^ 2 := by nlinarith only [e1, e2, hox]
  exact ⟨hox, hOy_nonneg, hRsq⟩
theorem b3n9m065_frame_below_chord
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {x : ℝ²}
    {T : ℝ² → ℝ²} (tau : Problem97.CGN.SimilarityTransportData T)
    (hv1 : T S.triangle.v1 = Problem97.CGN.vec2 0 0)
    (hv2 : T S.triangle.v2 = Problem97.CGN.vec2 1 0)
    (hv3y_pos : 0 < (T S.triangle.v3) 1)
    (hxI3 : x ∈ S.I3) :
    (T x) 1 ≤ 0 := by
  have hxC3 : x ∈ S.CP.C3 :=
    (Finset.mem_erase.mp (Finset.mem_erase.mp hxI3).2).2
  have hxA : x ∈ A := S.CP.C3_subset hxC3
  have hopp : Problem97.OnArcOpposite S.triangle.v3 S.triangle.v1 S.triangle.v2 x :=
    ((S.CP.arc_membership x hxA).2.2.mp hxC3)
  unfold Problem97.OnArcOpposite at hopp
  have hp := tau.halfplane_sign x S.triangle.v1 S.triangle.v2
  have hq := tau.halfplane_sign S.triangle.v3 S.triangle.v1 S.triangle.v2
  rw [hv1, hv2, b3n9m065_sa2_chart_base_local] at hp hq
  have hprod : (T x) 1 * (T S.triangle.v3) 1
      = tau.scale ^ 4 *
        (signedArea2 x S.triangle.v1 S.triangle.v2
          * signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2) := by
    have hkey : (T x) 1 * (T S.triangle.v3) 1
        = (tau.orientation ^ 2 * tau.scale ^ 4) *
          (signedArea2 x S.triangle.v1 S.triangle.v2
            * signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2) := by
      rw [hp, hq]; ring
    rw [hkey, tau.orientation_sq, one_mul]
  have hle : (T x) 1 * (T S.triangle.v3) 1 ≤ 0 := by
    rw [hprod]; exact mul_nonpos_of_nonneg_of_nonpos (by positivity) hopp
  nlinarith only [hle, hv3y_pos]
theorem b3n9m065_frame_disk_pt
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {x : ℝ²}
    {T : ℝ² → ℝ²} (tau : Problem97.CGN.SimilarityTransportData T)
    (hxA : x ∈ A) :
    dist (T x) (T S.Packet.center) ^ 2 ≤ (tau.scale * S.Packet.radius) ^ 2 := by
  have hxdisk : dist x S.Packet.center ≤ S.Packet.radius := by
    rw [dist_eq_norm]; exact S.Packet.disk_contains_A x hxA
  have hle : dist (T x) (T S.Packet.center) ≤ tau.scale * S.Packet.radius := by
    rw [tau.dist_image]
    exact mul_le_mul_of_nonneg_left hxdisk tau.scale_pos.le
  exact pow_le_pow_left₀ dist_nonneg hle 2
set_option maxHeartbeats 1000000 in
theorem pinclash_scalar (s X Y x y Oy : ℝ)
    (hs0 : 0 < s) (hs1 : s < 1)
    (hsdef : (X - 1) ^ 2 + Y ^ 2 = s ^ 2)
    (hcirc : (x - 1) ^ 2 + y ^ 2 = s ^ 2)
    (hY : 0 < Y) (hy : y ≤ 0) (hOy : 0 ≤ Oy)
    (hdisk : (x - 1 / 2) ^ 2 + (y - Oy) ^ 2 ≤ 1 / 4 + Oy ^ 2)
    (hl : 1 < X ^ 2 + Y ^ 2) :
    s ^ 2 < (X - x) ^ 2 + (Y - y) ^ 2 := by
  have hOyy : Oy * y ≤ 0 := mul_nonpos_of_nonneg_of_nonpos hOy hy
  have hband : x ≤ 1 - s ^ 2 := by nlinarith only [hcirc, hdisk, hOyy]
  have h1x_nonneg : 0 ≤ 1 - x := by nlinarith only [hdisk, hOyy, hband, sq_nonneg s]
  have hsq : (1 - x) ^ 2 ≤ s ^ 2 := by nlinarith only [hcirc, sq_nonneg y]
  have h1x_le_s : 1 - x ≤ s := by nlinarith only [hcirc, hs1, hdisk, hOyy, hs0, hsq, h1x_nonneg]
  have hS2 : 1 - X < s ^ 2 / 2 := by nlinarith only [hsdef, hl]
  have hYy : Y * y ≤ 0 := mul_nonpos_of_nonneg_of_nonpos (le_of_lt hY) hy
  have hip : (X - 1) * (x - 1) + Y * y < s ^ 2 / 2 := by
    rcases le_or_gt X 1 with hX | hX
    · have h1X : 0 ≤ 1 - X := by linarith
      have hb : (1 - X) * (1 - x) ≤ (1 - X) * s :=
        mul_le_mul_of_nonneg_left h1x_le_s h1X
      have hb2 : (1 - X) * s < s ^ 2 / 2 * s := mul_lt_mul_of_pos_right hS2 hs0
      nlinarith only [hYy, hb, hb2, hs0, hs1, mul_pos (mul_pos hs0 hs0) (show (0:ℝ) < 1 - s by linarith)]

    · have hnp : (X - 1) * (x - 1) ≤ 0 :=
        mul_nonpos_of_nonneg_of_nonpos (by linarith) (by linarith)
      nlinarith only [hYy, hnp, hs0]
  nlinarith only [hsdef, hcirc, hip]
set_option maxHeartbeats 2000000 in
theorem b3n9m065_pinclash_core
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {x₃ : ℝ²}
    (hx3I3 : x₃ ∈ S.I3) (hx3A : x₃ ∈ A)
    (hv2pin : dist S.triangle.v2 x₃ = dist S.triangle.v2 S.triangle.v3)
    (hclash : dist S.triangle.v3 x₃ < dist S.triangle.v3 S.triangle.v2)
    (hell : dist S.triangle.v1 S.triangle.v2 < dist S.triangle.v1 S.triangle.v3)
    (hs1orig : dist S.triangle.v2 S.triangle.v3 < dist S.triangle.v2 S.triangle.v1) :
    False := by
  classical
  obtain ⟨T, tau, hv1, hv2, hv3y_pos⟩ := S.normBase
  obtain ⟨hOx, hOy_nonneg, hRsq⟩ := b3n9m065_frame_circumcenter_facts S tau hv1 hv2 hv3y_pos
  have hyy_le : (T x₃) 1 ≤ 0 := b3n9m065_frame_below_chord S tau hv1 hv2 hv3y_pos hx3I3
  have hdisk_x3 := b3n9m065_frame_disk_pt S tau hx3A
  rw [hRsq] at hdisk_x3
  have h2x : (T S.triangle.v2) 0 = 1 := by rw [hv2, b3n9m065_vec2_c0]
  have h2y : (T S.triangle.v2) 1 = 0 := by rw [hv2, b3n9m065_vec2_c1]
  have h1x : (T S.triangle.v1) 0 = 0 := by rw [hv1, b3n9m065_vec2_c0]
  have h1y : (T S.triangle.v1) 1 = 0 := by rw [hv1, b3n9m065_vec2_c1]
  have hsc_pos : 0 < tau.scale := tau.scale_pos
  have hbase_sq : dist (T S.triangle.v2) (T S.triangle.v1) ^ 2 = 1 := by
    rw [b3n9m065_dist_sq_coords, h2x, h2y, h1x, h1y]; norm_num
  have hbase_one : dist (T S.triangle.v2) (T S.triangle.v1) = 1 := by
    nlinarith only [hbase_sq, dist_nonneg (x := T S.triangle.v2) (y := T S.triangle.v1)]
  have hscale_pin : tau.scale * dist S.triangle.v2 S.triangle.v1 = 1 := by
    rw [← tau.dist_image]; exact hbase_one
  have hd_v2v3 : dist (T S.triangle.v2) (T S.triangle.v3)
      = tau.scale * dist S.triangle.v2 S.triangle.v3 := tau.dist_image _ _
  have hd_v3x3 : dist (T S.triangle.v3) (T x₃)
      = tau.scale * dist S.triangle.v3 x₃ := tau.dist_image _ _
  have hd_v2x3 : dist (T S.triangle.v2) (T x₃)
      = tau.scale * dist S.triangle.v2 x₃ := tau.dist_image _ _
  have hd_v1v3 : dist (T S.triangle.v1) (T S.triangle.v3)
      = tau.scale * dist S.triangle.v1 S.triangle.v3 := tau.dist_image _ _
  have hv23_pos : 0 < dist S.triangle.v2 S.triangle.v3 := dist_pos.mpr S.triangle.v23_ne
  have hsh_pos : 0 < dist (T S.triangle.v2) (T S.triangle.v3) := by
    rw [hd_v2v3]; exact mul_pos hsc_pos hv23_pos
  have hs1 : dist (T S.triangle.v2) (T S.triangle.v3) < 1 := by
    rw [hd_v2v3, ← hscale_pin]; exact mul_lt_mul_of_pos_left hs1orig hsc_pos
  have hpin_frame : dist (T S.triangle.v2) (T x₃) = dist (T S.triangle.v2) (T S.triangle.v3) := by
    rw [hd_v2x3, hv2pin, ← hd_v2v3]
  have hclash_frame : dist (T S.triangle.v3) (T x₃) < dist (T S.triangle.v2) (T S.triangle.v3) := by
    rw [hd_v3x3, hd_v2v3]
    have hd : dist S.triangle.v3 x₃ < dist S.triangle.v2 S.triangle.v3 := by
      rw [dist_comm S.triangle.v2 S.triangle.v3]; exact hclash
    exact mul_lt_mul_of_pos_left hd hsc_pos
  have hv13_gt : (1 : ℝ) < dist (T S.triangle.v1) (T S.triangle.v3) := by
    have hv12 : dist S.triangle.v2 S.triangle.v1 = dist S.triangle.v1 S.triangle.v2 := dist_comm _ _
    rw [hd_v1v3, ← hscale_pin, hv12]; exact mul_lt_mul_of_pos_left hell hsc_pos
  have hsh_lt1_sq : dist (T S.triangle.v2) (T S.triangle.v3) ^ 2 < 1 := by
    nlinarith only [hs1, hsh_pos]
  have hv13_gt_sq : (1 : ℝ) < dist (T S.triangle.v1) (T S.triangle.v3) ^ 2 := by
    nlinarith only [hsh_pos, hv13_gt, hs1]
  have hclash_lt_sq :
      dist (T S.triangle.v3) (T x₃) ^ 2 < dist (T S.triangle.v2) (T S.triangle.v3) ^ 2 := by
    nlinarith only [hsh_pos, hclash_frame, dist_nonneg (x := T S.triangle.v3) (y := T x₃)]
  have hsq_v2v3 := b3n9m065_dist_sq_coords (T S.triangle.v2) (T S.triangle.v3)
  have hsq_v2x3 := b3n9m065_dist_sq_coords (T S.triangle.v2) (T x₃)
  have hsq_v1v3 := b3n9m065_dist_sq_coords (T S.triangle.v1) (T S.triangle.v3)
  have hsq_v3x3 := b3n9m065_dist_sq_coords (T S.triangle.v3) (T x₃)
  have hsq_x3O := b3n9m065_dist_sq_coords (T x₃) (T S.Packet.center)
  rw [h2x, h2y] at hsq_v2v3 hsq_v2x3
  rw [h1x, h1y] at hsq_v1v3
  rw [hOx] at hsq_x3O
  rw [hpin_frame] at hsq_v2x3
  set X := (T S.triangle.v3) 0
  set Y := (T S.triangle.v3) 1
  set xx := (T x₃) 0
  set yy := (T x₃) 1
  set Oy := (T S.Packet.center) 1
  set sh := dist (T S.triangle.v2) (T S.triangle.v3)
  set dv3x3 := dist (T S.triangle.v3) (T x₃)
  set dv1v3 := dist (T S.triangle.v1) (T S.triangle.v3)
  have hsdef : (X - 1) ^ 2 + Y ^ 2 = sh ^ 2 := by linarith [hsq_v2v3]
  have hcirc : (xx - 1) ^ 2 + yy ^ 2 = sh ^ 2 := by linarith [hsq_v2x3]
  have hl : 1 < X ^ 2 + Y ^ 2 := by rw [hsq_v1v3] at hv13_gt_sq; linarith [hv13_gt_sq]
  have hdisk : (xx - 1 / 2) ^ 2 + (yy - Oy) ^ 2 ≤ 1 / 4 + Oy ^ 2 := by
    rw [hsq_x3O] at hdisk_x3; linarith [hdisk_x3]
  have hconc : sh ^ 2 < (X - xx) ^ 2 + (Y - yy) ^ 2 :=
    pinclash_scalar sh X Y xx yy Oy hsh_pos hs1 hsdef hcirc hv3y_pos hyy_le hOy_nonneg hdisk hl
  rw [← hsq_v3x3] at hconc
  linarith [hconc, hclash_lt_sq]
namespace FiniteEndpointShell
theorem b3n9m065_pinclash_from_reps
    {A : Finset ℝ²} {S : FiniteEndpointShell A}
    (Z : ZeroDefectCapLayout S) {r s t : ℝ}
    (hB : S.IsFormB_v1 r)
    (hA2 : (Z.a2 : ℝ²) ∈ S.I2)
    (hA2eq : S.witnessClassAt_v1 r ∩ S.CP.C2 = ({Z.a2} : Finset ℝ²))
    (hv3C1 : S.witnessClassAt_v2 s ∩ S.CP.C1 = ({S.triangle.v3} : Finset ℝ²))
    (hI3sub : S.I3 ⊆ S.witnessClassAt_v3 t)
    {x₃ : ℝ²} (hx3I3 : x₃ ∈ S.I3) (hx3T2 : x₃ ∈ S.witnessClassAt_v2 s)
    {p : ℝ²} (hpI1 : p ∈ S.I1) (hpT3 : p ∈ S.witnessClassAt_v3 t) :
    False := by
  classical
  have hx3A : x₃ ∈ A :=
    S.CP.C3_subset ((Finset.mem_erase.mp (Finset.mem_erase.mp hx3I3).2).2)
  have hv3T2 : S.triangle.v3 ∈ S.witnessClassAt_v2 s := by
    have hmem : S.triangle.v3 ∈ ({S.triangle.v3} : Finset ℝ²) := by simp
    rw [← hv3C1] at hmem
    exact (Finset.mem_inter.mp hmem).1
  have hd_v2v3 : dist S.triangle.v2 S.triangle.v3 = s := (Finset.mem_filter.mp hv3T2).2
  have hd_v2x3 : dist S.triangle.v2 x₃ = s := (Finset.mem_filter.mp hx3T2).2
  have hv2pin : dist S.triangle.v2 x₃ = dist S.triangle.v2 S.triangle.v3 := by
    rw [hd_v2x3, hd_v2v3]
  have hx3T3 : x₃ ∈ S.witnessClassAt_v3 t := hI3sub hx3I3
  have hd_v3x3 : dist S.triangle.v3 x₃ = t := (Finset.mem_filter.mp hx3T3).2
  have hd_v3p : dist S.triangle.v3 p = t := (Finset.mem_filter.mp hpT3).2
  have hclash : dist S.triangle.v3 x₃ < dist S.triangle.v3 S.triangle.v2 := by
    rw [hd_v3x3, ← hd_v3p]
    exact b3n9m065_v3_lt_v3v2_of_mem_I1 S hpI1
  have hd_v1a2 : dist S.triangle.v1 Z.a2 = r := by
    have ha2T1 : Z.a2 ∈ S.witnessClassAt_v1 r := by
      have hmem : Z.a2 ∈ ({Z.a2} : Finset ℝ²) := by simp
      rw [← hA2eq] at hmem
      exact (Finset.mem_inter.mp hmem).1
    exact (Finset.mem_filter.mp ha2T1).2
  have hd_v1v2 : dist S.triangle.v1 S.triangle.v2 = r := by
    rcases hB with ⟨y, hyI2, hyC2, hv2eq⟩
    have hv2T1 : S.triangle.v2 ∈ S.witnessClassAt_v1 r := by
      have hmem : S.triangle.v2 ∈ ({S.triangle.v2} : Finset ℝ²) := by simp
      rw [← hv2eq] at hmem
      exact (Finset.mem_inter.mp hmem).1
    exact (Finset.mem_filter.mp hv2T1).2
  have hell : dist S.triangle.v1 S.triangle.v2 < dist S.triangle.v1 S.triangle.v3 := by
    rw [hd_v1v2, ← hd_v1a2]
    exact b3n9m065_v1_lt_v1v3_of_mem_I2 S hA2
  have hs1orig : dist S.triangle.v2 S.triangle.v3 < dist S.triangle.v2 S.triangle.v1 := by
    rw [← hv2pin]
    exact b3n9m065_v2_lt_v2v1_of_mem_I3 S hx3I3
  exact b3n9m065_pinclash_core S hx3I3 hx3A hv2pin hclash hell hs1orig
end FiniteEndpointShell
theorem qEqE_b2_column_pinclash_false
    {A : Finset ℝ²} {S : FiniteEndpointShell A}
    (Z : FiniteEndpointShell.ZeroDefectCapLayout S)
    {r s t : ℝ}
    (hB : S.IsFormB_v1 r)
    (hlower : FiniteEndpointShell.FormBv1A2SelectorV2LowerPacketPublic S Z r s)
    (hpacket3 : FiniteEndpointShell.SelectorV3Qb2PacketPublic S Z t) :
    False := by
  classical
  rcases hlower with ⟨hA2, hA2eq, -, -, hv3C1, hC3choice⟩
  rcases hpacket3 with ⟨hI3sub, p, hp, hpC1, -⟩
  have hpI1 : p ∈ S.I1 := by rw [Z.hI1]; exact hp
  have hpT3 : p ∈ S.witnessClassAt_v3 t := by
    have hmem : p ∈ ({p} : Finset ℝ²) := by simp
    rw [← hpC1] at hmem
    exact (Finset.mem_inter.mp hmem).1
  rcases hC3choice with ha3C3 | hb3C3
  · have hx3T2 : (Z.a3 : ℝ²) ∈ S.witnessClassAt_v2 s := by
      have hmem : Z.a3 ∈ ({Z.a3} : Finset ℝ²) := by simp
      rw [← ha3C3] at hmem
      exact (Finset.mem_inter.mp hmem).1
    have hx3I3 : (Z.a3 : ℝ²) ∈ S.I3 := by rw [Z.hI3]; simp
    exact FiniteEndpointShell.b3n9m065_pinclash_from_reps Z hB hA2 hA2eq hv3C1 hI3sub
      hx3I3 hx3T2 hpI1 hpT3
  · have hx3T2 : (Z.b3 : ℝ²) ∈ S.witnessClassAt_v2 s := by
      have hmem : Z.b3 ∈ ({Z.b3} : Finset ℝ²) := by simp
      rw [← hb3C3] at hmem
      exact (Finset.mem_inter.mp hmem).1
    have hx3I3 : (Z.b3 : ℝ²) ∈ S.I3 := by rw [Z.hI3]; simp
    exact FiniteEndpointShell.b3n9m065_pinclash_from_reps Z hB hA2 hA2eq hv3C1 hI3sub
      hx3I3 hx3T2 hpI1 hpT3
end Problem97
end Batch3N9
end Batch3N9Unit065

-- Original module: Solutions.Batch3N9.N4d.ExcludesFormBv1
section Batch3N9Unit066
namespace Batch3N9
open scoped EuclideanGeometry
open Finset
namespace Problem97
namespace FiniteEndpointShell
theorem exists_capLayout
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    Nonempty (ZeroDefectCapLayout S) :=
  ⟨S.zeroDefectCapLayout⟩
end FiniteEndpointShell
theorem b3n9m066_v1_lt_v1v3_of_mem_I2_local
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {p : ℝ²}
    (hpI2 : p ∈ S.I2) :
    dist S.triangle.v1 p < dist S.triangle.v1 S.triangle.v3 := by
  classical
  have hpC2 : p ∈ S.CP.C2 := by
    unfold Problem97.FiniteEndpointShell.I2 at hpI2
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hpI2).2).2
  have hp_ne_v3 : p ≠ S.triangle.v3 := by
    unfold Problem97.FiniteEndpointShell.I2 at hpI2
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hpI2).2).1
  have hp_ne_v1 : p ≠ S.triangle.v1 := by
    unfold Problem97.FiniteEndpointShell.I2 at hpI2
    exact (Finset.mem_erase.mp hpI2).1
  rcases Problem97.CGN.CGN4g_capData_of_supportCap_oriented
      (A := A) (C := S.CP.C2) (M := S.triangle2)
      S.hconv S.hnoncol S.CP.C2_subset
      (fun x hxA => (S.CP.arc_membership x hxA).2.1)
      S.CP.v3_mem_C2 S.CP.v1_mem_C2 S.packet2 S.packet2.inner_at_v1 with
    ⟨m, L, Packet, Hside, Hord, hLC, hEnds⟩
  have hpL : p ∈ Finset.univ.image L.points := by
    rw [hLC]
    exact hpC2
  rcases Finset.mem_image.mp hpL with ⟨i, -, hi⟩
  rcases hEnds with hFirstLast | hLastFirst
  · have hi_ne_first : i ≠ Problem97.CGN.firstIndex Packet.hm := by
      intro hi_first
      apply hp_ne_v3
      calc
        p = L.points i := hi.symm
        _ = L.points (Problem97.CGN.firstIndex Packet.hm) := by simp [hi_first]
        _ = S.triangle.v3 := hFirstLast.1
    have hi_rev_lt_last : i.rev < Problem97.CGN.lastIndex Packet.hm := by
      apply Fin.lt_def.mpr
      rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
      have hi_pos : 0 < i.val := by
        apply Nat.pos_of_ne_zero
        intro hi_zero
        apply hi_ne_first
        ext
        simpa [Problem97.CGN.firstIndex] using hi_zero
      omega
    have hmono :
        Problem97.FiniteEndpoint.E3L20b_rightEndpoint_capDistance_strict
          (L.points (Problem97.CGN.lastIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev L) :=
      Problem97.FiniteEndpoint.E3L20b_of_cgnCapData Packet Hside Hord
    have hlt :=
      hmono (i := i.rev) (j := Problem97.CGN.lastIndex Packet.hm) hi_rev_lt_last
    have hlast_rev_first : (Problem97.CGN.lastIndex Packet.hm).rev =
        Problem97.CGN.firstIndex Packet.hm := by
      ext
      rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
      simp [Problem97.CGN.firstIndex]
      omega
    simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev_points,
      hi, hFirstLast.1, hFirstLast.2, hlast_rev_first] using hlt
  · have hi_lt_last : i < Problem97.CGN.lastIndex Packet.hm := by
      apply Fin.lt_def.mpr
      rw [Problem97.CGN.lastIndex_val]
      have hi_lt_top : i.val < m := i.is_lt
      have hi_ne_last : i ≠ Problem97.CGN.lastIndex Packet.hm := by
        intro hi_last
        apply hp_ne_v3
        calc
          p = L.points i := hi.symm
          _ = L.points (Problem97.CGN.lastIndex Packet.hm) := by simp [hi_last]
          _ = S.triangle.v3 := hLastFirst.2
      have hi_ne_top : i.val ≠ m - 1 := by
        intro hi_top
        apply hi_ne_last
        ext
        simpa [Problem97.CGN.lastIndex, Problem97.CGN.finIndex] using hi_top
      omega
    have hmono :
        Problem97.FiniteEndpoint.E3L20a_leftEndpoint_capDistance_strict
          (L.points (Problem97.CGN.firstIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap L) :=
      Problem97.FiniteEndpoint.E3L20a_of_cgnCapData Packet Hside Hord
    have hlt :=
      hmono (i := i) (j := Problem97.CGN.lastIndex Packet.hm) hi_lt_last
    simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap_points,
      hi, hLastFirst.1, hLastFirst.2] using hlt
theorem b3n9m066_v1_lt_v1v2_of_mem_I3_local
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {q : ℝ²}
    (hqI3 : q ∈ S.I3) :
    dist S.triangle.v1 q < dist S.triangle.v1 S.triangle.v2 := by
  classical
  have hqC3 : q ∈ S.CP.C3 := by
    unfold Problem97.FiniteEndpointShell.I3 at hqI3
    exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hqI3)
  have hq_ne_v2 : q ≠ S.triangle.v2 := by
    unfold Problem97.FiniteEndpointShell.I3 at hqI3
    exact (Finset.mem_erase.mp hqI3).1
  have hq_ne_v1 : q ≠ S.triangle.v1 := by
    unfold Problem97.FiniteEndpointShell.I3 at hqI3
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hqI3).2).1
  rcases Problem97.CGN.CGN4g_capData_of_supportCap_oriented
      (A := A) (C := S.CP.C3) (M := S.triangle3)
      S.hconv S.hnoncol S.CP.C3_subset
      (fun x hxA => (S.CP.arc_membership x hxA).2.2)
      S.CP.v1_mem_C3 S.CP.v2_mem_C3 S.packet3 S.packet3.inner_at_v1 with
    ⟨m, L, Packet, Hside, Hord, hLC, hEnds⟩
  have hqL : q ∈ Finset.univ.image L.points := by
    rw [hLC]
    exact hqC3
  rcases Finset.mem_image.mp hqL with ⟨i, -, hi⟩
  rcases hEnds with hFirstLast | hLastFirst
  ·
    have hi_ne_last : i ≠ Problem97.CGN.lastIndex Packet.hm := by
      intro hi_last
      apply hq_ne_v2
      calc
        q = L.points i := hi.symm
        _ = L.points (Problem97.CGN.lastIndex Packet.hm) := by simp [hi_last]
        _ = S.triangle.v2 := hFirstLast.2
    have hi_lt_last : i < Problem97.CGN.lastIndex Packet.hm := by
      apply Fin.lt_def.mpr
      rw [Problem97.CGN.lastIndex_val]
      have hi_lt_top : i.val < m := i.is_lt
      have hi_ne_top : i.val ≠ m - 1 := by
        intro hi_top
        apply hi_ne_last
        ext
        simpa [Problem97.CGN.lastIndex, Problem97.CGN.finIndex] using hi_top
      have hi_le_pred : i.val ≤ m - 1 := Nat.le_pred_of_lt hi_lt_top
      exact lt_of_le_of_ne hi_le_pred hi_ne_top
    have hmono :
        Problem97.FiniteEndpoint.E3L20a_leftEndpoint_capDistance_strict
          (L.points (Problem97.CGN.firstIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap L) :=
      Problem97.FiniteEndpoint.E3L20a_of_cgnCapData Packet Hside Hord
    have hlt :=
      hmono (i := i) (j := Problem97.CGN.lastIndex Packet.hm) hi_lt_last
    simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap_points,
      hi, hFirstLast.1, hFirstLast.2] using hlt
  ·
    have hi_ne_first : i ≠ Problem97.CGN.firstIndex Packet.hm := by
      intro hi_first
      apply hq_ne_v2
      calc
        q = L.points i := hi.symm
        _ = L.points (Problem97.CGN.firstIndex Packet.hm) := by simpa [hi_first]
        _ = S.triangle.v2 := hLastFirst.1
    have hi_rev_lt_last : i.rev < Problem97.CGN.lastIndex Packet.hm := by
      apply Fin.lt_def.mpr
      rw [Problem97.CGN.lastIndex_val]
      have hi_lt_top : i.val < m := i.is_lt
      have hi_pos : 0 < i.val := by
        apply Nat.pos_of_ne_zero
        intro hi_zero
        apply hi_ne_first
        ext
        simpa [Problem97.CGN.firstIndex] using hi_zero
      have h1 : 1 < i.val + 1 := Nat.succ_lt_succ hi_pos
      have hm1 : 1 < m := lt_of_lt_of_le h1 (Nat.succ_le_of_lt hi_lt_top)
      simpa [Fin.val_rev] using (Nat.sub_lt_sub_left hm1 h1)
    have hmono :
        Problem97.FiniteEndpoint.E3L20b_rightEndpoint_capDistance_strict
          (L.points (Problem97.CGN.lastIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev L) :=
      Problem97.FiniteEndpoint.E3L20b_of_cgnCapData Packet Hside Hord
    have hlt :=
      hmono (i := i.rev) (j := Problem97.CGN.lastIndex Packet.hm) hi_rev_lt_last
    have hlast_rev_first :
        (Problem97.CGN.lastIndex Packet.hm).rev = Problem97.CGN.firstIndex Packet.hm := by
      ext
      rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
      simp [Problem97.CGN.firstIndex]
      omega
    simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev_points,
      hi, hLastFirst.1, hLastFirst.2, hlast_rev_first] using hlt
theorem b3n9m066_v2_lt_v2v1_of_mem_I3_local
    {A : Finset ℝ²} (S : FiniteEndpointShell A) {q : ℝ²}
    (hqI3 : q ∈ S.I3) :
    dist S.triangle.v2 q < dist S.triangle.v2 S.triangle.v1 := by
  classical
  have hqC3 : q ∈ S.CP.C3 := by
    unfold Problem97.FiniteEndpointShell.I3 at hqI3
    exact Finset.mem_of_mem_erase (Finset.mem_of_mem_erase hqI3)
  have hq_ne_v2 : q ≠ S.triangle.v2 := by
    unfold Problem97.FiniteEndpointShell.I3 at hqI3
    exact (Finset.mem_erase.mp hqI3).1
  have hq_ne_v1 : q ≠ S.triangle.v1 := by
    unfold Problem97.FiniteEndpointShell.I3 at hqI3
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hqI3).2).1
  rcases Problem97.CGN.CGN4g_capData_of_supportCap_oriented
      (A := A) (C := S.CP.C3) (M := S.triangle3)
      S.hconv S.hnoncol S.CP.C3_subset
      (fun x hxA => (S.CP.arc_membership x hxA).2.2)
      S.CP.v1_mem_C3 S.CP.v2_mem_C3 S.packet3 S.packet3.inner_at_v1 with
    ⟨m, L, Packet, Hside, Hord, hLC, hEnds⟩
  have hqL : q ∈ Finset.univ.image L.points := by
    rw [hLC]
    exact hqC3
  rcases Finset.mem_image.mp hqL with ⟨i, -, hi⟩
  rcases hEnds with hFirstLast | hLastFirst
  · have hi_ne_last : i ≠ Problem97.CGN.lastIndex Packet.hm := by
      intro hi_last
      apply hq_ne_v2
      calc
        q = L.points i := hi.symm
        _ = L.points (Problem97.CGN.lastIndex Packet.hm) := by simp [hi_last]
        _ = S.triangle.v2 := hFirstLast.2
    have hi_rev_lt_last : i.rev < Problem97.CGN.lastIndex Packet.hm := by
      have hi_ne_zero : i.val ≠ 0 := by
        intro hi_zero
        have hi_first : i = Problem97.CGN.firstIndex Packet.hm := by
          ext
          simpa [Problem97.CGN.firstIndex] using hi_zero
        apply hq_ne_v1
        calc
          q = L.points i := hi.symm
          _ = L.points (Problem97.CGN.firstIndex Packet.hm) := by simp [hi_first]
          _ = S.triangle.v1 := hFirstLast.1
      have hi_pos : 0 < i.val := Nat.pos_of_ne_zero hi_ne_zero
      have hfirst_lt_i : Problem97.CGN.firstIndex Packet.hm < i := by
        rw [Fin.lt_def]
        simpa [Problem97.CGN.firstIndex] using hi_pos
      have hlast_rev_first' :
          (Problem97.CGN.lastIndex Packet.hm).rev = Problem97.CGN.firstIndex Packet.hm := by
        ext
        rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
        simp [Problem97.CGN.firstIndex]
        omega
      rw [Fin.rev_lt_iff]
      simpa [hlast_rev_first'] using hfirst_lt_i
    have hmono :
        Problem97.FiniteEndpoint.E3L20b_rightEndpoint_capDistance_strict
          (L.points (Problem97.CGN.lastIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev L) :=
      Problem97.FiniteEndpoint.E3L20b_of_cgnCapData Packet Hside Hord
    have hlt :=
      hmono (i := i.rev) (j := Problem97.CGN.lastIndex Packet.hm) hi_rev_lt_last
    have hlast_rev_first :
        (Problem97.CGN.lastIndex Packet.hm).rev = Problem97.CGN.firstIndex Packet.hm := by
      ext
      rw [Fin.val_rev, Problem97.CGN.lastIndex_val]
      simp [Problem97.CGN.firstIndex]
      omega
    simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev_points,
      hi, hFirstLast.1, hFirstLast.2, hlast_rev_first] using hlt
  · have hi_lt_last : i < Problem97.CGN.lastIndex Packet.hm := by
      apply Fin.lt_def.mpr
      rw [Problem97.CGN.lastIndex_val]
      have hi_lt_top : i.val < m := i.is_lt
      have hi_ne_last : i ≠ Problem97.CGN.lastIndex Packet.hm := by
        intro hi_last
        apply hq_ne_v1
        calc
          q = L.points i := hi.symm
          _ = L.points (Problem97.CGN.lastIndex Packet.hm) := by simp [hi_last]
          _ = S.triangle.v1 := hLastFirst.2
      have hi_ne_top : i.val ≠ m - 1 := by
        intro hi_top
        apply hi_ne_last
        ext
        simpa [Problem97.CGN.lastIndex, Problem97.CGN.finIndex] using hi_top
      omega
    have hmono :
        Problem97.FiniteEndpoint.E3L20a_leftEndpoint_capDistance_strict
          (L.points (Problem97.CGN.firstIndex Packet.hm))
          (Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap L) :=
      Problem97.FiniteEndpoint.E3L20a_of_cgnCapData Packet Hside Hord
    have hlt :=
      hmono (i := i) (j := Problem97.CGN.lastIndex Packet.hm) hi_lt_last
    simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap_points,
      hi, hLastFirst.1, hLastFirst.2] using hlt
theorem FiniteEndpointShell.n4d_bB_4_q_eq_E_impossible
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s t : ℝ}
    (hB : S.IsFormB_v1 r)
    (hB2 : (Z.b2 : ℝ²) ∈ S.I2)
    (hb2eq : S.witnessClassAt_v1 r ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²))
    (hI2sub : S.I2 ⊆ S.witnessClassAt_v2 s)
    (hC1eq : S.witnessClassAt_v2 s ∩ S.CP.C1 = ({S.triangle.v3} : Finset ℝ²))
    (hC3eq :
      (S.witnessClassAt_v2 s ∩ S.CP.C3 = ({Z.a3} : Finset ℝ²)) ∨
      (S.witnessClassAt_v2 s ∩ S.CP.C3 = ({Z.b3} : Finset ℝ²)))
    (hC2eq3 : S.witnessClassAt_v3 t ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²))
    (hI3sub : S.I3 ⊆ S.witnessClassAt_v3 t) :
    False := by
  classical
  rcases hB with ⟨_, _, _, hv2eq⟩
  let T : Finset ℝ² := S.witnessClassAt_v2 s
  have hv3T : S.triangle.v3 ∈ T := by
    have hmem : S.triangle.v3 ∈ ({S.triangle.v3} : Finset ℝ²) := by simp
    rw [← hC1eq] at hmem
    exact (Finset.mem_inter.mp hmem).1
  have hqset : (Z.a3 : ℝ²) ∈ T ∩ S.CP.C3 ∨ (Z.b3 : ℝ²) ∈ T ∩ S.CP.C3 := by
    rcases hC3eq with hqa3 | hqb3
    · left
      have hmem : Z.a3 ∈ ({Z.a3} : Finset ℝ²) := by simp
      rw [← hqa3] at hmem
      exact hmem
    · right
      have hmem : Z.b3 ∈ ({Z.b3} : Finset ℝ²) := by simp
      rw [← hqb3] at hmem
      exact hmem
  obtain ⟨q, hqI3, hqT2⟩ : ∃ q : ℝ², q ∈ S.I3 ∧ q ∈ T := by
    rcases hqset with hqa3 | hqb3
    · refine ⟨Z.a3, ?_, ?_⟩
      · rw [Z.hI3]
        simp
      · exact (Finset.mem_inter.mp hqa3).1
    · refine ⟨Z.b3, ?_, ?_⟩
      · rw [Z.hI3]
        simp
      · exact (Finset.mem_inter.mp hqb3).1
  have hb2T1 : Z.b2 ∈ S.witnessClassAt_v1 r := by
    have hb2mem : Z.b2 ∈ ({Z.b2} : Finset ℝ²) := by simp
    rw [← hb2eq] at hb2mem
    exact (Finset.mem_inter.mp hb2mem).1
  have hv2T1 : S.triangle.v2 ∈ S.witnessClassAt_v1 r := by
    have hv2mem : S.triangle.v2 ∈ ({S.triangle.v2} : Finset ℝ²) := by simp
    rw [← hv2eq] at hv2mem
    exact (Finset.mem_inter.mp hv2mem).1
  have hAE : dist S.triangle.v1 Z.b2 = dist S.triangle.v1 S.triangle.v2 := by
    have hb2r : dist S.triangle.v1 Z.b2 = r := by
      simpa using (Finset.mem_filter.mp hb2T1).2
    have hv2r : dist S.triangle.v1 S.triangle.v2 = r := by
      simpa using (Finset.mem_filter.mp hv2T1).2
    rw [hb2r, hv2r]
  have hBD : dist S.triangle.v2 S.triangle.v3 = dist S.triangle.v2 Z.b2 := by
    have hb2T2 : Z.b2 ∈ T := hI2sub hB2
    have hv3r : dist S.triangle.v2 S.triangle.v3 = s := by
      simpa [T] using (Finset.mem_filter.mp hv3T).2
    have hb2r : dist S.triangle.v2 Z.b2 = s := by
      simpa [T] using (Finset.mem_filter.mp hb2T2).2
    rw [hv3r, hb2r]
  have hBq : dist S.triangle.v2 q = dist S.triangle.v2 Z.b2 := by
    have hqT2' : q ∈ T := hqT2
    have hqr : dist S.triangle.v2 q = s := by
      simpa [T] using (Finset.mem_filter.mp hqT2').2
    have hb2r : dist S.triangle.v2 Z.b2 = s := by
      have hb2T2 : Z.b2 ∈ T := hI2sub hB2
      simpa [T] using (Finset.mem_filter.mp hb2T2).2
    rw [hqr, hb2r]
  have hDq : dist S.triangle.v3 q = dist S.triangle.v3 Z.b2 := by
    have hqT3 : q ∈ S.witnessClassAt_v3 t := hI3sub hqI3
    have hqr : dist S.triangle.v3 q = t := by
      simpa using (Finset.mem_filter.mp hqT3).2
    have hb2T3 : Z.b2 ∈ S.witnessClassAt_v3 t := by
      have hb2mem : Z.b2 ∈ ({Z.b2} : Finset ℝ²) := by simp
      rw [← hC2eq3] at hb2mem
      exact (Finset.mem_inter.mp hb2mem).1
    have hb2r : dist S.triangle.v3 Z.b2 = t := by
      simpa using (Finset.mem_filter.mp hb2T3).2
    rw [hqr, hb2r]
  have hlong : dist S.triangle.v1 S.triangle.v2 < dist S.triangle.v1 S.triangle.v3 := by
    simpa [hAE] using (b3n9m066_v1_lt_v1v3_of_mem_I2_local S hB2)
  have hEside :
      0 < signedArea2 Z.b2 S.triangle.v1 S.triangle.v2 *
        signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 :=
    S.c2_vertex_same_open_side_as_v3 hB2
  have hqE : q ≠ Z.b2 := by
    intro hqb2
    have hlt := b3n9m066_v1_lt_v1v2_of_mem_I3_local S hqI3
    rw [hqb2, hAE] at hlt
    exact lt_irrefl _ hlt
  exact S.qEqE_row_impossible_of_reflection hqI3 hAE hBD hBq hDq hlong hEside hqE
theorem FiniteEndpointShell.n4d_bB_5_q_eq_C_impossible
    {A : Finset ℝ²} (S : FiniteEndpointShell A)
    (Z : ZeroDefectCapLayout S) {r s t : ℝ}
    (hB : S.IsFormB_v1 r)
    (hB2 : (Z.b2 : ℝ²) ∈ S.I2)
    (hb2eq : S.witnessClassAt_v1 r ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²))
    (hI2sub : S.I2 ⊆ S.witnessClassAt_v2 s)
    (hC1eq : S.witnessClassAt_v2 s ∩ S.CP.C1 = ({S.triangle.v3} : Finset ℝ²))
    (hC3eq :
      (S.witnessClassAt_v2 s ∩ S.CP.C3 = ({Z.a3} : Finset ℝ²)) ∨
      (S.witnessClassAt_v2 s ∩ S.CP.C3 = ({Z.b3} : Finset ℝ²)))
    (hpacket : SelectorV3Qa2Packet S Z t) :
    False := by
  classical
  rcases hB with ⟨_, _, _, hv2eq⟩
  have hb2T1 : Z.b2 ∈ S.witnessClassAt_v1 r := by
    have hb2mem : Z.b2 ∈ ({Z.b2} : Finset ℝ²) := by simp
    rw [← hb2eq] at hb2mem
    exact (Finset.mem_inter.mp hb2mem).1
  have hv2T1 : S.triangle.v2 ∈ S.witnessClassAt_v1 r := by
    have hv2mem : S.triangle.v2 ∈ ({S.triangle.v2} : Finset ℝ²) := by simp
    rw [← hv2eq] at hv2mem
    exact (Finset.mem_inter.mp hv2mem).1
  have hAEb2 : dist S.triangle.v1 Z.b2 = dist S.triangle.v1 S.triangle.v2 := by
    have hb2r : dist S.triangle.v1 Z.b2 = r := by
      simpa using (Finset.mem_filter.mp hb2T1).2
    have hv2r : dist S.triangle.v1 S.triangle.v2 = r := by
      simpa using (Finset.mem_filter.mp hv2T1).2
    rw [hb2r, hv2r]
  have hlong : dist S.triangle.v1 S.triangle.v2 < dist S.triangle.v1 S.triangle.v3 := by
    simpa [hAEb2] using (b3n9m066_v1_lt_v1v3_of_mem_I2_local S hB2)
  have hA2I2 : Z.a2 ∈ S.I2 := by
    rw [Z.hI2]
    simp
  have hA2C2 : Z.a2 ∈ S.CP.C2 := by
    unfold Problem97.FiniteEndpointShell.I2 at hA2I2
    exact (Finset.mem_erase.mp (Finset.mem_erase.mp hA2I2).2).2
  have hA2T2 : Z.a2 ∈ S.witnessClassAt_v2 s := hI2sub hA2I2
  have hEside :
      0 < signedArea2 Z.a2 S.triangle.v1 S.triangle.v2 *
        signedArea2 S.triangle.v3 S.triangle.v1 S.triangle.v2 :=
    S.c2_vertex_same_open_side_as_v3 hA2I2
  rcases hpacket with ⟨hI3sub, hpacket⟩
  rcases hpacket with ⟨p, hpnamed, hpC1, hpC2⟩
  have hA2T3 : Z.a2 ∈ S.witnessClassAt_v3 t := by
    have hmem : Z.a2 ∈ ({Z.a2} : Finset ℝ²) := by simp
    rw [← hpC2] at hmem
    exact (Finset.mem_inter.mp hmem).1
  have hsmall : dist S.triangle.v2 S.triangle.v3 < dist S.triangle.v1 S.triangle.v2 := by
    rcases hC3eq with hqa3 | hqb3
    · have hqI3 : Z.a3 ∈ S.I3 := by
        rw [Z.hI3]
        simp
      have hqT2 : Z.a3 ∈ S.witnessClassAt_v2 s := by
        have hmem : Z.a3 ∈ ({Z.a3} : Finset ℝ²) := by simp
        rw [← hqa3] at hmem
        exact (Finset.mem_inter.mp hmem).1
      have hv3T2 : S.triangle.v3 ∈ S.witnessClassAt_v2 s := by
        have hmem : S.triangle.v3 ∈ ({S.triangle.v3} : Finset ℝ²) := by simp
        rw [← hC1eq] at hmem
        exact (Finset.mem_inter.mp hmem).1
      have hq_lt_base : dist S.triangle.v2 Z.a3 < dist S.triangle.v2 S.triangle.v1 :=
        b3n9m066_v2_lt_v2v1_of_mem_I3_local S hqI3
      have hqrad : dist S.triangle.v2 Z.a3 = s := by
        simpa using (Finset.mem_filter.mp hqT2).2
      have hv3rad : dist S.triangle.v2 S.triangle.v3 = s := by
        simpa using (Finset.mem_filter.mp hv3T2).2
      calc
        dist S.triangle.v2 S.triangle.v3 = dist S.triangle.v2 Z.a3 := by
          rw [hv3rad, hqrad]
        _ < dist S.triangle.v2 S.triangle.v1 := hq_lt_base
        _ = dist S.triangle.v1 S.triangle.v2 := by rw [dist_comm]
    · have hqI3 : Z.b3 ∈ S.I3 := by
        rw [Z.hI3]
        simp
      have hqT2 : Z.b3 ∈ S.witnessClassAt_v2 s := by
        have hmem : Z.b3 ∈ ({Z.b3} : Finset ℝ²) := by simp
        rw [← hqb3] at hmem
        exact (Finset.mem_inter.mp hmem).1
      have hv3T2 : S.triangle.v3 ∈ S.witnessClassAt_v2 s := by
        have hmem : S.triangle.v3 ∈ ({S.triangle.v3} : Finset ℝ²) := by simp
        rw [← hC1eq] at hmem
        exact (Finset.mem_inter.mp hmem).1
      have hq_lt_base : dist S.triangle.v2 Z.b3 < dist S.triangle.v2 S.triangle.v1 :=
        b3n9m066_v2_lt_v2v1_of_mem_I3_local S hqI3
      have hqrad : dist S.triangle.v2 Z.b3 = s := by
        simpa using (Finset.mem_filter.mp hqT2).2
      have hv3rad : dist S.triangle.v2 S.triangle.v3 = s := by
        simpa using (Finset.mem_filter.mp hv3T2).2
      calc
        dist S.triangle.v2 S.triangle.v3 = dist S.triangle.v2 Z.b3 := by
          rw [hv3rad, hqrad]
        _ < dist S.triangle.v2 S.triangle.v1 := hq_lt_base
        _ = dist S.triangle.v1 S.triangle.v2 := by rw [dist_comm]
  have hA2ne_base : dist S.triangle.v1 Z.a2 ≠ dist S.triangle.v1 S.triangle.v2 := by
    intro hEq
    have hA2neqb2 : Z.a2 ≠ Z.b2 := by
      intro hEq2
      have hcard : ({Z.a2, Z.b2} : Finset ℝ²).card = 2 := by
        simpa [Z.hI2] using S.I2_card_eq_two
      rw [hEq2] at hcard
      simp at hcard
    have hA2T1 : Z.a2 ∈ S.witnessClassAt_v1 r := by
      have hA2r : dist S.triangle.v1 Z.a2 = r := by
        rw [hEq, (Finset.mem_filter.mp hv2T1).2]
      change Z.a2 ∈ A.filter (fun x => dist S.triangle.v1 x = r)
      exact Finset.mem_filter.mpr ⟨S.CP.C2_subset hA2C2, hA2r⟩
    have hA2inter : Z.a2 ∈ S.witnessClassAt_v1 r ∩ S.CP.C2 := by
      exact Finset.mem_inter.mpr ⟨hA2T1, hA2C2⟩
    rw [hb2eq] at hA2inter
    have hEq2 : Z.a2 = Z.b2 := by
      simpa using hA2inter
    exact hA2neqb2 hEq2
  have hA3neqb3 : Z.a3 ≠ Z.b3 := by
    intro hEq
    have hcard : ({Z.a3, Z.b3} : Finset ℝ²).card = 2 := by
      simpa [Z.hI3] using S.I3_card_eq_two
    rw [hEq] at hcard
    simp at hcard
  rcases lt_or_gt_of_ne hA2ne_base with hAElt | hAEgt
  · rcases hC3eq with hqa3 | hqb3
    · have hqI3 : Z.a3 ∈ S.I3 := by
        rw [Z.hI3]
        simp
      have hqsI3 : Z.b3 ∈ S.I3 := by
        rw [Z.hI3]
        simp
      have hqT2 : Z.a3 ∈ S.witnessClassAt_v2 s := by
        have hmem : Z.a3 ∈ ({Z.a3} : Finset ℝ²) := by simp
        rw [← hqa3] at hmem
        exact (Finset.mem_inter.mp hmem).1
      have hv3T2 : S.triangle.v3 ∈ S.witnessClassAt_v2 s := by
        have hmem : S.triangle.v3 ∈ ({S.triangle.v3} : Finset ℝ²) := by simp
        rw [← hC1eq] at hmem
        exact (Finset.mem_inter.mp hmem).1
      have hBq : dist S.triangle.v2 Z.a3 = dist S.triangle.v2 S.triangle.v3 := by
        have hqrad : dist S.triangle.v2 Z.a3 = s := by
          simpa using (Finset.mem_filter.mp hqT2).2
        have hv3rad : dist S.triangle.v2 S.triangle.v3 = s := by
          simpa using (Finset.mem_filter.mp hv3T2).2
        rw [hqrad, hv3rad]
      have hqT3 : Z.a3 ∈ S.witnessClassAt_v3 t := hI3sub hqI3
      have hqsT3 : Z.b3 ∈ S.witnessClassAt_v3 t := hI3sub hqsI3
      have hDqs : dist S.triangle.v3 Z.b3 = dist S.triangle.v3 Z.a3 := by
        have hqrad3 : dist S.triangle.v3 Z.a3 = t := by
          simpa using (Finset.mem_filter.mp hqT3).2
        have hqsrad3 : dist S.triangle.v3 Z.b3 = t := by
          simpa using (Finset.mem_filter.mp hqsT3).2
        rw [hqsrad3, hqrad3]
      have hBE : dist S.triangle.v2 Z.a2 = dist S.triangle.v2 S.triangle.v3 := by
        have hErad : dist S.triangle.v2 Z.a2 = s := by
          simpa using (Finset.mem_filter.mp hA2T2).2
        have hv3rad : dist S.triangle.v2 S.triangle.v3 = s := by
          simpa using (Finset.mem_filter.mp hv3T2).2
        rw [hErad, hv3rad]
      have hDE : dist S.triangle.v3 Z.a2 = dist S.triangle.v3 Z.a3 := by
        have hErad3 : dist S.triangle.v3 Z.a2 = t := by
          simpa using (Finset.mem_filter.mp hA2T3).2
        have hqrad3 : dist S.triangle.v3 Z.a3 = t := by
          simpa using (Finset.mem_filter.mp hqT3).2
        rw [hErad3, hqrad3]
      have hqE : Z.a3 ≠ Z.a2 := by
        intro hEq
        exact (S.ne_of_mem_I2_of_mem_I3 hA2I2 hqI3) hEq.symm
      have hq_ne_qs : Z.a3 ≠ Z.b3 := hA3neqb3
      have hcap_opp :=
        S.qEqE_capOrder_opposite hqI3 hqsI3 hq_ne_qs
      exact S.qEqE_lowerArc_impossible (q := Z.a3) (qs := Z.b3) (E := Z.a2)
        hqI3 hqsI3 hDqs hBq hBE hDE hsmall hlong hAElt hEside hqE hcap_opp
    · have hqI3 : Z.b3 ∈ S.I3 := by
        rw [Z.hI3]
        simp
      have hqsI3 : Z.a3 ∈ S.I3 := by
        rw [Z.hI3]
        simp
      have hqT2 : Z.b3 ∈ S.witnessClassAt_v2 s := by
        have hmem : Z.b3 ∈ ({Z.b3} : Finset ℝ²) := by simp
        rw [← hqb3] at hmem
        exact (Finset.mem_inter.mp hmem).1
      have hv3T2 : S.triangle.v3 ∈ S.witnessClassAt_v2 s := by
        have hmem : S.triangle.v3 ∈ ({S.triangle.v3} : Finset ℝ²) := by simp
        rw [← hC1eq] at hmem
        exact (Finset.mem_inter.mp hmem).1
      have hBq : dist S.triangle.v2 Z.b3 = dist S.triangle.v2 S.triangle.v3 := by
        have hqrad : dist S.triangle.v2 Z.b3 = s := by
          simpa using (Finset.mem_filter.mp hqT2).2
        have hv3rad : dist S.triangle.v2 S.triangle.v3 = s := by
          simpa using (Finset.mem_filter.mp hv3T2).2
        rw [hqrad, hv3rad]
      have hqT3 : Z.b3 ∈ S.witnessClassAt_v3 t := hI3sub hqI3
      have hqsT3 : Z.a3 ∈ S.witnessClassAt_v3 t := hI3sub hqsI3
      have hDqs : dist S.triangle.v3 Z.a3 = dist S.triangle.v3 Z.b3 := by
        have hqrad3 : dist S.triangle.v3 Z.b3 = t := by
          simpa using (Finset.mem_filter.mp hqT3).2
        have hqsrad3 : dist S.triangle.v3 Z.a3 = t := by
          simpa using (Finset.mem_filter.mp hqsT3).2
        rw [hqsrad3, hqrad3]
      have hBE : dist S.triangle.v2 Z.a2 = dist S.triangle.v2 S.triangle.v3 := by
        have hErad : dist S.triangle.v2 Z.a2 = s := by
          simpa using (Finset.mem_filter.mp hA2T2).2
        have hv3rad : dist S.triangle.v2 S.triangle.v3 = s := by
          simpa using (Finset.mem_filter.mp hv3T2).2
        rw [hErad, hv3rad]
      have hDE : dist S.triangle.v3 Z.a2 = dist S.triangle.v3 Z.b3 := by
        have hErad3 : dist S.triangle.v3 Z.a2 = t := by
          simpa using (Finset.mem_filter.mp hA2T3).2
        have hqrad3 : dist S.triangle.v3 Z.b3 = t := by
          simpa using (Finset.mem_filter.mp hqT3).2
        rw [hErad3, hqrad3]
      have hqE : Z.b3 ≠ Z.a2 := by
        intro hEq
        exact (S.ne_of_mem_I2_of_mem_I3 hA2I2 hqI3) hEq.symm
      have hq_ne_qs : Z.b3 ≠ Z.a3 := hA3neqb3.symm
      have hcap_opp :=
        S.qEqE_capOrder_opposite hqI3 hqsI3 hq_ne_qs
      exact S.qEqE_lowerArc_impossible (q := Z.b3) (qs := Z.a3) (E := Z.a2)
        hqI3 hqsI3 hDqs hBq hBE hDE hsmall hlong hAElt hEside hqE hcap_opp
  · rcases hC3eq with hqa3 | hqb3
    · have hqI3 : Z.a3 ∈ S.I3 := by
        rw [Z.hI3]
        simp
      have hqsI3 : Z.b3 ∈ S.I3 := by
        rw [Z.hI3]
        simp
      have hqT2 : Z.a3 ∈ S.witnessClassAt_v2 s := by
        have hmem : Z.a3 ∈ ({Z.a3} : Finset ℝ²) := by simp
        rw [← hqa3] at hmem
        exact (Finset.mem_inter.mp hmem).1
      have hv3T2 : S.triangle.v3 ∈ S.witnessClassAt_v2 s := by
        have hmem : S.triangle.v3 ∈ ({S.triangle.v3} : Finset ℝ²) := by simp
        rw [← hC1eq] at hmem
        exact (Finset.mem_inter.mp hmem).1
      have hBq : dist S.triangle.v2 Z.a3 = dist S.triangle.v2 S.triangle.v3 := by
        have hqrad : dist S.triangle.v2 Z.a3 = s := by
          simpa using (Finset.mem_filter.mp hqT2).2
        have hv3rad : dist S.triangle.v2 S.triangle.v3 = s := by
          simpa using (Finset.mem_filter.mp hv3T2).2
        rw [hqrad, hv3rad]
      have hqT3 : Z.a3 ∈ S.witnessClassAt_v3 t := hI3sub hqI3
      have hqsT3 : Z.b3 ∈ S.witnessClassAt_v3 t := hI3sub hqsI3
      have hDqs : dist S.triangle.v3 Z.b3 = dist S.triangle.v3 Z.a3 := by
        have hqrad3 : dist S.triangle.v3 Z.a3 = t := by
          simpa using (Finset.mem_filter.mp hqT3).2
        have hqsrad3 : dist S.triangle.v3 Z.b3 = t := by
          simpa using (Finset.mem_filter.mp hqsT3).2
        rw [hqsrad3, hqrad3]
      have hBE : dist S.triangle.v2 Z.a2 = dist S.triangle.v2 S.triangle.v3 := by
        have hErad : dist S.triangle.v2 Z.a2 = s := by
          simpa using (Finset.mem_filter.mp hA2T2).2
        have hv3rad : dist S.triangle.v2 S.triangle.v3 = s := by
          simpa using (Finset.mem_filter.mp hv3T2).2
        rw [hErad, hv3rad]
      have hDE : dist S.triangle.v3 Z.a2 = dist S.triangle.v3 Z.a3 := by
        have hErad3 : dist S.triangle.v3 Z.a2 = t := by
          simpa using (Finset.mem_filter.mp hA2T3).2
        have hqrad3 : dist S.triangle.v3 Z.a3 = t := by
          simpa using (Finset.mem_filter.mp hqT3).2
        rw [hErad3, hqrad3]
      have hqE : Z.a3 ≠ Z.a2 := by
        intro hEq
        exact (S.ne_of_mem_I2_of_mem_I3 hA2I2 hqI3) hEq.symm
      have hq_ne_qs : Z.a3 ≠ Z.b3 := hA3neqb3
      have hcap_opp :=
        S.qEqE_capOrder_opposite hqI3 hqsI3 hq_ne_qs
      exact S.qEqE_lowerArc_impossible_flipped (q := Z.a3) (qs := Z.b3) (E := Z.a2)
        hqI3 hqsI3 hDqs hBq hBE hDE hsmall hlong hAEgt hA2C2 hEside hqE hcap_opp
    · have hqI3 : Z.b3 ∈ S.I3 := by
        rw [Z.hI3]
        simp
      have hqsI3 : Z.a3 ∈ S.I3 := by
        rw [Z.hI3]
        simp
      have hqT2 : Z.b3 ∈ S.witnessClassAt_v2 s := by
        have hmem : Z.b3 ∈ ({Z.b3} : Finset ℝ²) := by simp
        rw [← hqb3] at hmem
        exact (Finset.mem_inter.mp hmem).1
      have hv3T2 : S.triangle.v3 ∈ S.witnessClassAt_v2 s := by
        have hmem : S.triangle.v3 ∈ ({S.triangle.v3} : Finset ℝ²) := by simp
        rw [← hC1eq] at hmem
        exact (Finset.mem_inter.mp hmem).1
      have hBq : dist S.triangle.v2 Z.b3 = dist S.triangle.v2 S.triangle.v3 := by
        have hqrad : dist S.triangle.v2 Z.b3 = s := by
          simpa using (Finset.mem_filter.mp hqT2).2
        have hv3rad : dist S.triangle.v2 S.triangle.v3 = s := by
          simpa using (Finset.mem_filter.mp hv3T2).2
        rw [hqrad, hv3rad]
      have hqT3 : Z.b3 ∈ S.witnessClassAt_v3 t := hI3sub hqI3
      have hqsT3 : Z.a3 ∈ S.witnessClassAt_v3 t := hI3sub hqsI3
      have hDqs : dist S.triangle.v3 Z.a3 = dist S.triangle.v3 Z.b3 := by
        have hqrad3 : dist S.triangle.v3 Z.b3 = t := by
          simpa using (Finset.mem_filter.mp hqT3).2
        have hqsrad3 : dist S.triangle.v3 Z.a3 = t := by
          simpa using (Finset.mem_filter.mp hqsT3).2
        rw [hqsrad3, hqrad3]
      have hBE : dist S.triangle.v2 Z.a2 = dist S.triangle.v2 S.triangle.v3 := by
        have hErad : dist S.triangle.v2 Z.a2 = s := by
          simpa using (Finset.mem_filter.mp hA2T2).2
        have hv3rad : dist S.triangle.v2 S.triangle.v3 = s := by
          simpa using (Finset.mem_filter.mp hv3T2).2
        rw [hErad, hv3rad]
      have hDE : dist S.triangle.v3 Z.a2 = dist S.triangle.v3 Z.b3 := by
        have hErad3 : dist S.triangle.v3 Z.a2 = t := by
          simpa using (Finset.mem_filter.mp hA2T3).2
        have hqrad3 : dist S.triangle.v3 Z.b3 = t := by
          simpa using (Finset.mem_filter.mp hqT3).2
        rw [hErad3, hqrad3]
      have hqE : Z.b3 ≠ Z.a2 := by
        intro hEq
        exact (S.ne_of_mem_I2_of_mem_I3 hA2I2 hqI3) hEq.symm
      have hq_ne_qs : Z.b3 ≠ Z.a3 := hA3neqb3.symm
      have hcap_opp :=
        S.qEqE_capOrder_opposite hqI3 hqsI3 hq_ne_qs
      exact S.qEqE_lowerArc_impossible_flipped (q := Z.b3) (qs := Z.a3) (E := Z.a2)
        hqI3 hqsI3 hDqs hBq hBE hDE hsmall hlong hAEgt hA2C2 hEside hqE hcap_opp
theorem FiniteEndpointShell.N4dExcludesFormB_v1_proof
    {A : Finset ℝ²} (S : FiniteEndpointShell A) :
    S.N4dExcludesFormB_v1 := by
  classical
  intro r hr hcard hesc hB
  obtain ⟨Z⟩ := S.exists_capLayout
  rcases S.formB_v1_split Z hB with ⟨ha2, hxa2⟩ | ⟨hb2, hxb2⟩
  · rcases S.selectorShape_v2_split Z with ⟨s, hs, hsplit2⟩
    rcases hsplit2 with ⟨hTcard2, hI2sub, hcases2⟩
    rcases hcases2 with hqv1 | hlower
    · have hB2 : Xb2Pin S (Z.swapI2) r := by
        refine ⟨?_, ?_⟩
        · simpa [FiniteEndpointShell.ZeroDefectCapLayout.swapI2] using ha2
        · simpa [FiniteEndpointShell.ZeroDefectCapLayout.swapI2] using hxa2
      have hAinSB : AInSBPin S (Z.swapI2) s := by
        refine ⟨hs, hTcard2, hI2sub, ?_⟩
        simpa [SelectorV2Qv1Packet, FiniteEndpointShell.ZeroDefectCapLayout.swapI2] using hqv1
      exact S.n4d_bB1_impossible (Z := Z.swapI2) hB hcard hB2 hAinSB
    · rcases hlower with ha3 | hb3
      · rcases ha3 with ⟨p2, hp2, hp2C1, ha3C3⟩
        have hp2v3 : S.witnessClassAt_v2 s ∩ S.CP.C1 = ({S.triangle.v3} : Finset ℝ²) :=
          S.selectorShape_v2_lower_forces_v3 Z hr hs hcard hB ha2 hxa2 hI2sub hp2 hp2C1
        have hlowerPacket : FiniteEndpointShell.FormBv1A2SelectorV2LowerPacket S Z r s := by
          exact ⟨ha2, hxa2, hTcard2, hI2sub, hp2v3, Or.inl ha3C3⟩
        rcases S.selectorShape_v3_split Z with ⟨t, ht, hsplit3⟩
        rcases hsplit3 with ⟨_, hI3sub, hcases3⟩
        rcases hcases3 with hqv1 | hrest
        · exact S.n4d_bA_2_q_eq_v1_impossible Z hB hlowerPacket hqv1
        · rcases hrest with hqa2 | hqb2
          · exact S.n4d_bA_2_q_eq_C_impossible Z hB hlowerPacket ⟨hI3sub, hqa2⟩
          · rcases hqb2 with ⟨p3, hp3, hp3C1, hb2C2⟩
            rcases Finset.mem_insert.mp hp3 with hpa1 | hp3
            · exact Problem97.qEqE_b2_column_pinclash_false Z hB
                (by
                  simpa [FiniteEndpointShell.FormBv1A2SelectorV2LowerPacketPublic,
                    FiniteEndpointShell.FormBv1A2SelectorV2LowerPacket] using hlowerPacket)
                ⟨hI3sub, p3, by simpa [hpa1] using hp3, hp3C1, hb2C2⟩
            rcases Finset.mem_insert.mp hp3 with hpb1 | hpv2
            · exact Problem97.qEqE_b2_column_pinclash_false Z hB
                (by
                  simpa [FiniteEndpointShell.FormBv1A2SelectorV2LowerPacketPublic,
                    FiniteEndpointShell.FormBv1A2SelectorV2LowerPacket] using hlowerPacket)
                ⟨hI3sub, p3, by simpa [hpb1] using hp3, hp3C1, hb2C2⟩
            · have hpv2' : p3 = S.triangle.v2 := by simpa using hpv2
              rw [hpv2'] at hp3C1
              exact S.pEqB_column_impossible Z hB hlowerPacket
                (by
                  simpa [FiniteEndpointShell.SelectorV3PeqBPacket] using
                    (show FiniteEndpointShell.SelectorV3Pv2Packet S Z t from
                      ⟨hI3sub, hp3C1, Or.inr hb2C2⟩))
      · rcases hb3 with ⟨p2, hp2, hp2C1, hb3C3⟩
        have hp2v3 : S.witnessClassAt_v2 s ∩ S.CP.C1 = ({S.triangle.v3} : Finset ℝ²) :=
          S.selectorShape_v2_lower_forces_v3 Z hr hs hcard hB ha2 hxa2 hI2sub hp2 hp2C1
        have hlowerPacket : FiniteEndpointShell.FormBv1A2SelectorV2LowerPacket S Z r s := by
          exact ⟨ha2, hxa2, hTcard2, hI2sub, hp2v3, Or.inr hb3C3⟩
        rcases S.selectorShape_v3_split Z with ⟨t, ht, hsplit3⟩
        rcases hsplit3 with ⟨_, hI3sub, hcases3⟩
        rcases hcases3 with hqv1 | hrest
        · exact S.n4d_bA_2_q_eq_v1_impossible Z hB hlowerPacket hqv1
        · rcases hrest with hqa2 | hqb2
          · exact S.n4d_bA_2_q_eq_C_impossible Z hB hlowerPacket ⟨hI3sub, hqa2⟩
          · rcases hqb2 with ⟨p3, hp3, hp3C1, hb2C2⟩
            rcases Finset.mem_insert.mp hp3 with hpa1 | hp3
            · exact Problem97.qEqE_b2_column_pinclash_false Z hB
                (by
                  simpa [FiniteEndpointShell.FormBv1A2SelectorV2LowerPacketPublic,
                    FiniteEndpointShell.FormBv1A2SelectorV2LowerPacket] using hlowerPacket)
                ⟨hI3sub, p3, by simpa [hpa1] using hp3, hp3C1, hb2C2⟩
            rcases Finset.mem_insert.mp hp3 with hpb1 | hpv2
            · exact Problem97.qEqE_b2_column_pinclash_false Z hB
                (by
                  simpa [FiniteEndpointShell.FormBv1A2SelectorV2LowerPacketPublic,
                    FiniteEndpointShell.FormBv1A2SelectorV2LowerPacket] using hlowerPacket)
                ⟨hI3sub, p3, by simpa [hpb1] using hp3, hp3C1, hb2C2⟩
            · have hpv2' : p3 = S.triangle.v2 := by simpa using hpv2
              rw [hpv2'] at hp3C1
              exact S.pEqB_column_impossible Z hB hlowerPacket
                (by
                  simpa [FiniteEndpointShell.SelectorV3PeqBPacket] using
                    (show FiniteEndpointShell.SelectorV3Pv2Packet S Z t from
                      ⟨hI3sub, hp3C1, Or.inr hb2C2⟩))
  · rcases S.selectorShape_v2_split Z with ⟨s, hs, hsplit2⟩
    rcases hsplit2 with ⟨hTcard2, hI2sub, hcases2⟩
    rcases hcases2 with hqv1 | hlower
    · exact S.n4d_bB1_impossible Z hB hcard ⟨hb2, hxb2⟩ ⟨hs, hTcard2, hI2sub, hqv1⟩
    · rcases hlower with hqa3 | hqb3
      · rcases hqa3 with ⟨p2, hp2, hp2C1, ha3C3⟩
        have hB2 : (Z.b2 : ℝ²) ∈ S.I2 := hb2
        have hb2eq : S.witnessClassAt_v1 r ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²) := hxb2
        have hTcard3 : (S.witnessClassAt_v2 s).card = 4 := hTcard2
        have hI2sub3 : S.I2 ⊆ S.witnessClassAt_v2 s := hI2sub
        have hC1eq : S.witnessClassAt_v2 s ∩ S.CP.C1 = ({S.triangle.v3} : Finset ℝ²) :=
          S.selectorShape_v2_lower_forces_v3 (Z := Z.swapI2) hr hs hcard hB hb2 hxb2 hI2sub hp2 hp2C1
        have hC3eq :
            (S.witnessClassAt_v2 s ∩ S.CP.C3 = ({Z.a3} : Finset ℝ²)) ∨
              (S.witnessClassAt_v2 s ∩ S.CP.C3 = ({Z.b3} : Finset ℝ²)) :=
          Or.inl ha3C3
        rcases S.selectorShape_v3_split Z with ⟨t, ht, hsplit3⟩
        rcases hsplit3 with ⟨hTcard4, hI3sub, hcases3⟩
        rcases hcases3 with hqv1 | hrest
        · exact S.n4d_bB_2_q_eq_v1_impossible Z hB
            ⟨hB2, hb2eq, hTcard3, hI2sub3, hC1eq, hC3eq⟩
            hqv1
        · rcases hrest with hqa2 | hqb2
          · have hpacket : SelectorV3Qa2Packet S Z t := by
              dsimp [SelectorV3Qa2Packet]
              exact ⟨hI3sub, hqa2⟩
            exact S.n4d_bB_5_q_eq_C_impossible Z hB hB2 hb2eq hI2sub3 hC1eq hC3eq hpacket
          · rcases hqb2 with ⟨p, hp, hpeq, hqeqC2⟩
            exact S.n4d_bB_4_q_eq_E_impossible Z hB hB2 hb2eq hI2sub3 hC1eq hC3eq hqeqC2 hI3sub
      · rcases hqb3 with ⟨p2, hp2, hp2C1, hb3C3⟩
        have hB2 : (Z.b2 : ℝ²) ∈ S.I2 := hb2
        have hb2eq : S.witnessClassAt_v1 r ∩ S.CP.C2 = ({Z.b2} : Finset ℝ²) := hxb2
        have hTcard3 : (S.witnessClassAt_v2 s).card = 4 := hTcard2
        have hI2sub3 : S.I2 ⊆ S.witnessClassAt_v2 s := hI2sub
        have hC1eq : S.witnessClassAt_v2 s ∩ S.CP.C1 = ({S.triangle.v3} : Finset ℝ²) :=
          S.selectorShape_v2_lower_forces_v3 (Z := Z.swapI2) hr hs hcard hB hb2 hxb2 hI2sub hp2 hp2C1
        have hC3eq :
            (S.witnessClassAt_v2 s ∩ S.CP.C3 = ({Z.a3} : Finset ℝ²)) ∨
              (S.witnessClassAt_v2 s ∩ S.CP.C3 = ({Z.b3} : Finset ℝ²)) :=
          Or.inr hb3C3
        rcases S.selectorShape_v3_split Z with ⟨t, ht, hsplit3⟩
        rcases hsplit3 with ⟨hTcard4, hI3sub, hcases3⟩
        rcases hcases3 with hqv1 | hrest
        · exact S.n4d_bB_2_q_eq_v1_impossible Z hB
            ⟨hB2, hb2eq, hTcard3, hI2sub3, hC1eq, hC3eq⟩
            hqv1
        · rcases hrest with hqa2 | hqb2
          · have hpacket : SelectorV3Qa2Packet S Z t := by
              dsimp [SelectorV3Qa2Packet]
              exact ⟨hI3sub, hqa2⟩
            exact S.n4d_bB_5_q_eq_C_impossible Z hB hB2 hb2eq hI2sub3 hC1eq hC3eq hpacket
          · rcases hqb2 with ⟨p, hp, hpeq, hqeqC2⟩
            exact S.n4d_bB_4_q_eq_E_impossible Z hB hB2 hb2eq hI2sub3 hC1eq hC3eq hqeqC2 hI3sub
end Problem97
end Batch3N9
end Batch3N9Unit066
/-- The escaped Form `b` at `v₁` is impossible for a finite endpoint shell. -/
theorem solution {A : Finset ℝ²}
    (S : Batch3N9.Problem97.FiniteEndpointShell A) :
    S.N4dExcludesFormB_v1 :=
  Batch3N9.Problem97.FiniteEndpointShell.N4dExcludesFormB_v1_proof S
