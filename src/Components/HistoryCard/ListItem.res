%%raw(`import './ListItem.css';`)

@react.component
let make = (~amount: float, ~title: string, ~id: int, ~onRemoveItem) => {
  let incomeItemStyle = "item green"
  let expenseItemStyle = "item red"

  let clickHandler = () => {
    onRemoveItem(id)
  }
  let stylesString1: string = amount > 0.0 ? incomeItemStyle : expenseItemStyle

  <li key={id->Belt.Int.toString} className={stylesString1}>
    <span>
      <button onClick={_ => clickHandler()}> {React.string("x")} </button>
      {title->React.string}
    </span>
    <span>
      <Converter amount={amount} />
    </span>
  </li>
}
