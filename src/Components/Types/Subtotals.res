type t = {income:float,expense:float}


let calculate_Subtotal : (array<Expense.t>,string) => float = (expenses,str) => {
      let check_Income_Expense = (expense:Expense.t) => str==="income"? 
      expense.amount > 0.0: 
      expense.amount < 0.0

       let subtotal :float = Js.Array2.reduce(expenses,(sum,expense) => check_Income_Expense(expense) ? expense.amount +. sum:sum
,0.0)
subtotal
}

let initialSubTotals:t = {income:0.0,expense:0.0}