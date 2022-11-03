%%raw(`import './Header.css';`)

@react.component
let make = (~subtotal: Subtotals.t) => {
  let total = subtotal.income +. subtotal.expense

  <div className="header">
    <h3> {StaticText.headerHeading->React.string} </h3>
    <p className="header-para"> {StaticText.headerText->React.string} </p>
    <p className="header-amount">
      <Converter amount={total} />
    </p>
    <DetailWidget subtotals={subtotal} />
  </div>
}
