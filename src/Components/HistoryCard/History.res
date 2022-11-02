
%%raw(`import './History.css';`)

@react.component
let make = (~expenses:Types.expenses,~onRemoveItem) => {

    <div className="history">
<h3>{"History"->React.string}</h3>
<HistoryList expenses = {expenses} onRemoveItem = {onRemoveItem} />
    </div>
}