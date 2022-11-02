@module("./logo.svg") external logo: string = "default"

%%raw(`import './App.css';`)
type addExpense = (Types.data, Types.expenses) => unit
let initialExpense:Types.expenses = [];
let initialTotals:Types.subtotals = {income:0.0,expense:0.0}

@react.component
let make = () => {
let(expenses:Types.expenses,setExpenses) = React.useState(_=>initialExpense);
let (nextId:int,setNextId) = React.useState(_=>2)
let (subtotals,setSubtotals) = React.useState(_=>initialTotals)
let (loginState,setLoLogjinState)= React.useState(_=>false);



React.useEffect1(() => {

       setSubtotals(_=>{income:Js.Array2.reduce(expenses,(sum,expense)=>expense.amount>0.0 ? expense.amount +. sum:sum,0.0),
                        expense:Js.Array2.reduce(expenses,(sum,expense)=>expense.amount<0.0?sum+.expense.amount:sum,0.0)
                        })

None
},[expenses])
         

let removeItemHandler=(ab:int) => {
      setExpenses(prev=>Js.Array2.filter(prev,expense=>expense.id!=ab))
                  setNextId(prev=>prev-1)
}

let addExpense = (a:Types.data) => {
      let value:Types.expense = {id:nextId,title:a.title,amount:a.amount} 
      setExpenses(prev=>Js.Array2.concat(prev,[value]))
      setNextId(prev=>prev+1)
      Js.log(expenses)  
}
let loginHandler = (data:LoginState.t)=> {
if(data.username!="" && data.password !="") {
      setLoLogjinState(_=>true)
}
}

 <div className="app">
      // {!loginState?<LoginPage />: <div>
      
      // <Header subtotal={subtotals} />
      // <History expenses={expenses} onRemoveItem = {removeItemHandler} />
      // <InputForm addItem ={addExpense} />
      

      //      </ div>
      // }
      <LoginPage handleLogin= {loginHandler} loginState = {loginState} />

      </ div>

}