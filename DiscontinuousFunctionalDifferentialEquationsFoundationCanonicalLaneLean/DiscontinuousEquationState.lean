import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscontinuousFunctionalDifferentialEquationsFoundationCanonicalLaneLean

structure DiscontinuousFunction where
  domain : Type u
  codomain : Type v
  jumpSet : Set domain
  piecewiseComponents : domain \\ jumpSet → codomain

structure FunctionalDifferentialEquationState where
  stateSpace : Type u
  timeDomain : Type v
  delay : timeDomain → timeDomain → Prop
  discontinuityStructure : DiscontinuousFunction
  delayFunctional : (timeDomain → stateSpace) → (timeDomain → stateSpace)
  delayFunctionalContinuous : Prop
  delayFunctionalBounded : Prop
  initialCondition : timeDomain → stateSpace

end DiscontinuousFunctionalDifferentialEquationsFoundationCanonicalLaneLean
end HautevilleHouse