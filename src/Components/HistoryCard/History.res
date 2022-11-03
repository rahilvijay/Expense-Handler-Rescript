
%%raw(`import './History.css';`)

@react.component
let make = (~expenses:array<Expense.t>,~onRemoveItem) => {

    <div className="history">
<h3>{StaticText.historyCardHeading->React.string}</h3>
<HistoryList expenses = {expenses} onRemoveItem = {onRemoveItem} />
    </div>
}