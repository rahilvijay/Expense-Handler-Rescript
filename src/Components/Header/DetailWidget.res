
%%raw(`import './DetailWidget.css';`)


@react.component
let make = (~subtotals:Types.subtotals) => {
    Js.log(subtotals.income)
     <div className="display">
    <div>
    <p>{"INCOME"->React.string}</p>
    <p className="income"><Converter amount={subtotals.income} /></p>
    </div>
    <div>
    <p>{"EXPENSE"->React.string}</p>
    <p className="expense"><Converter amount={subtotals.expense} /> </p>
    </div>
        </div>
}