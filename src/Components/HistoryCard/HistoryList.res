%%raw(`import './HistoryList.css';`)


@react.component
let make =(~expenses:array<Expense.t>,~onRemoveItem) =>{

    <ul className="list">
    {Belt.Array.map(expenses,expense => {
 <ListItem 
                amount = {expense.amount}
                    title ={expense.title}
                    id= {expense.id}
                    onRemoveItem = {onRemoveItem} />
    })->React.array}
    </ul>
}