type t = {
  title: string,
  amount: string,
  titleState: bool,
  amountState: bool,
  amountTouched: bool,
  titleTouched: bool,
}

let initial = {
  title: "",
  amount: "",
  titleState: false,
  amountState: false,
  amountTouched: false,
  titleTouched: false,
}
