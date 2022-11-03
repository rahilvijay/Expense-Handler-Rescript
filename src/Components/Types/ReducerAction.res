type t =
  | SetRemarkValue(string)
  | SetAmountValue(string)
  | SetRemarkValidState(string)
  | SetAmountValidState(float)
  | SetAmountTouchState(bool)
  | SetRemarkTouchState(bool)
  | SetInitial
