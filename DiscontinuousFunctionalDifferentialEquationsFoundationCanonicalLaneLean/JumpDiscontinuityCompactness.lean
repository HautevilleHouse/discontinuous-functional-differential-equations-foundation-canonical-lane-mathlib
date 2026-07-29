import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DiscontinuousFDEPhysicalState

namespace HautevilleHouse
namespace JumpDiscontinuityCompactness

structure JumpDiscontinuityCompactnessPackage (P : DiscontinuousFDEPhysicalState.DiscontinuousFDEPhysicalStatePackage) where
  jumpSetCompact : Prop
  jumpOperatorContinuousOnCompact : Prop
  jumpSetVolumeFinite : Prop
  jumpSetCompactTerm : jumpSetCompact
  jumpOperatorContinuousOnCompactTerm : jumpOperatorContinuousOnCompact
  jumpSetVolumeFiniteTerm : jumpSetVolumeFinite

structure JumpDiscontinuityCompactnessEvidence
    {P : DiscontinuousFDEPhysicalState.DiscontinuousFDEPhysicalStatePackage}
    (J : JumpDiscontinuityCompactnessPackage P) where
  jumpSetCompactClosed : J.jumpSetCompact
  jumpOperatorContinuousOnCompactClosed : J.jumpOperatorContinuousOnCompact
  jumpSetVolumeFiniteClosed : J.jumpSetVolumeFinite

def JumpDiscontinuityCompactnessClosed
    {P : DiscontinuousFDEPhysicalState.DiscontinuousFDEPhysicalStatePackage}
    (J : JumpDiscontinuityCompactnessPackage P) : Prop :=
  J.jumpSetCompact ∧ J.jumpOperatorContinuousOnCompact ∧ J.jumpSetVolumeFinite

theorem jump_discontinuity_compactness_closed_from_evidence
    {P : DiscontinuousFDEPhysicalState.DiscontinuousFDEPhysicalStatePackage}
    (J : JumpDiscontinuityCompactnessPackage P)
    (E : JumpDiscontinuityCompactnessEvidence J) :
    JumpDiscontinuityCompactnessClosed J := by
  exact And.intro E.jumpSetCompactClosed
    (And.intro E.jumpOperatorContinuousOnCompactClosed E.jumpSetVolumeFiniteClosed)

end JumpDiscontinuityCompactness
end HautevilleHouse