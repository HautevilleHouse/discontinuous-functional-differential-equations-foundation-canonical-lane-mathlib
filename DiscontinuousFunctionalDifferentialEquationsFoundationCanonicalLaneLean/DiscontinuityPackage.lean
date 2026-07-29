import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscontinuousFunctionalDifferentialEquationsFoundationCanonicalLaneLean

structure DiscontinuityPackage where
  jumpSet : Type u
  jumpTimes : Prop
  jumpMagnitude : Prop
  regularityBeforeJump : Prop
  regularityAfterJump : Prop

structure DiscontinuityEvidence (D : DiscontinuityPackage) where
  jumpTimesClosed : D.jumpTimes
  jumpMagnitudeClosed : D.jumpMagnitude
  regularityBeforeJumpClosed : D.regularityBeforeJump
  regularityAfterJumpClosed : D.regularityAfterJump

def DiscontinuityClosed (D : DiscontinuityPackage) : Prop :=
  D.jumpTimes ∧ D.jumpMagnitude ∧ D.regularityBeforeJump ∧ D.regularityAfterJump

theorem discontinuity_closed_from_evidence (D : DiscontinuityPackage) (E : DiscontinuityEvidence D) :
    DiscontinuityClosed D := by
  exact And.intro E.jumpTimesClosed (And.intro E.jumpMagnitudeClosed (And.intro E.regularityBeforeJumpClosed E.regularityAfterJumpClosed))

end DiscontinuousFunctionalDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse