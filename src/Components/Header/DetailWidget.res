
%%raw(`import './DetailWidget.css';`)


@react.component
let make = (~subtotals:Subtotals.t) => {
     <div className="display">
    <div>
    <p>{StaticText.dtwHeading1 ->React.string}</p>
    <p className = "income"><Converter amount = {subtotals.income} /></p>
    </div>
    <div>
    <p>{StaticText.dtwHeading2->React.string}</p>
    <p className = "expense"><Converter amount = {subtotals.expense} /> </p>
    </div>
        </div>
}