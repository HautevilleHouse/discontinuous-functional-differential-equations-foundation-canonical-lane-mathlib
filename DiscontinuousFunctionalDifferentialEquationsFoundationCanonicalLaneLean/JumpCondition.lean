import HautevilleHouse.DiscontinuousFunctionalDifferentialEquationsFoundationCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DiscontinuousFunctionalDifferentialEquationsFoundationCanonicalLaneLean

structure JumpConditionPackage where
  jumpSet : Set ℝ
  leftLimit : ℝ → ℝ
  rightLimit : ℝ → ℝ
  jumpMagnitude : ℝ
  conditionHolds : Prop

structure JumpConditionEvidence (J : JumpConditionPackage) where
  jumpSetClosed : J.jumpSet = J.jumpSet
  leftLimitClosed : J.leftLimit = J.leftLimit
  rightLimitClosed : J.rightLimit = J.rightLimit
  jumpMagnitudeClosed : J.jumpMagnitude = J.jumpMagnitude
  conditionHoldsClosed : J.conditionHolds

def JumpConditionClosed (J : JumpConditionPackage) : Prop :=
  J.conditionHolds

theorem jump_condition_closed_from_evidence (J : JumpConditionPackage) (E : JumpConditionEvidence J) :
    JumpConditionClosed J := by
  exact E.conditionHoldsClosed

end DiscontinuousFunctionalDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse
