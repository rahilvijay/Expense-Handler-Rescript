%%raw(`import './Header.css';`)


@react.component
let make = (~subtotal:Types.subtotals) => {
    let total = subtotal.income +. subtotal.expense
    




    <div className="header">
<h3>{"Expense Tracker"->React.string}</h3>

<p className="header-para">{"Balance"->React.string}</p>
<p className="header-amount"><Converter amount ={total} /></p>

<DetailWidget subtotals ={subtotal} />
</div>
}