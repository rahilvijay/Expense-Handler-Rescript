%%raw(`import './InputForm.css';`)

let reducer = (state: InputState.t, action: ReducerAction.t) => {
  switch action {
  | SetRemarkValue(t) => {...state, title: t}
  | SetAmountValue(a) => {...state, amount: a}
  | SetRemarkValidState(s) =>
    s !== "" ? {...state, titleState: true} : {...state, titleState: false}
  | SetAmountValidState(i) =>
    Js.Math.abs_float(i) > 0.0 ? {...state, amountState: true} : {...state, amountState: false}
  | SetAmountTouchState(b) => {...state, amountTouched: b}
  | SetRemarkTouchState(b) => {...state, titleTouched: b}
  | SetInitial => InputState.initial
  }
}

@react.component
let make = (~addItem: InputData.t => unit) => {
  let (inputState: InputState.t, dispatch) = React.useReducer(reducer, InputState.initial)

  let onRemarkChangeHandler = event => {
    let value: string = ReactEvent.Form.target(event)["value"]
    dispatch(SetRemarkValidState(value))
    dispatch(SetRemarkValidState(value))
  }
  let onAmountChangeHandler = event => {
    let value = ReactEvent.Form.target(event)["value"]
    let valueResolved = switch value->Belt.Float.fromString {
    | None => 0.0
    | Some(a) => a
    }
    dispatch(SetAmountValue(value))
    dispatch(SetAmountValidState(valueResolved))
  }

  let onTitleBur = () => {
    dispatch(SetRemarkTouchState(true))
  }

  let onAmountBur = () => {
    dispatch(SetAmountTouchState(true))
  }
  let onSubmitHandler = event => {
    ReactEvent.Form.preventDefault(event)
    dispatch(SetRemarkTouchState(true))
    dispatch(SetAmountTouchState(true))
    if inputState.titleState && inputState.amountState {
      let vaues = switch inputState.amount->Belt.Float.fromString {
      | None => 0.0
      | Some(a) => a
      }
      addItem({title: inputState.title, amount: vaues})
      dispatch(SetInitial)
    } else {
      dispatch(SetInitial)
      dispatch(SetRemarkTouchState(true))
    }
  }

  <form className="form" onSubmit={onSubmitHandler}>
    <p className="warning">
      {(
        !inputState.titleState && inputState.titleTouched ? "Please correct Input" : ""
      )->React.string}
    </p>
    <p className="warning">
      {(
        !inputState.amountState && inputState.amountTouched ? "Please correct Input" : ""
      )->React.string}
    </p>
    <div className="form-controls">
      <label> {"Remark"->React.string} </label>
      <input
        onBlur={_ => onTitleBur()}
        onChange={onRemarkChangeHandler}
        type_="text"
        placeholder="Please Enter Remarks"
        value={inputState.title}
      />
    </div>
    <div className="form-controls">
      <label> {"Amount"->React.string} </label>
      <p> {"Please enter with a negative sign for expenses"->React.string} </p>
      <input
        onBlur={_ => onAmountBur()}
        onChange={onAmountChangeHandler}
        type_="number"
        placeholder="Please Enter Amount"
        value={inputState.amount}
        step=0.01
      />
    </div>
    <button> {"Add New Expense"->React.string} </button>
  </form>
}
