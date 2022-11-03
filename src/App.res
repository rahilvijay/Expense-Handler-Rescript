@module("./logo.svg") external logo: string = "default"

%%raw(`import './App.css';`)


let initialExpense:array<Expense.t> = [];





@react.component
let make = () => {
let(expenses :array<Expense.t>,setExpenses) = React.useState(_=>[]);
let (nextId :int,setNextId) = React.useState(_=>2);
let (subtotals,setSubtotals) = React.useState(_=>Subtotals.initialSubTotals);
let (loginState,setLoLogjinState)= React.useState(_=>false);



React.useEffect1(() => {

       setSubtotals(_=>{income:Subtotals.calculate_Subtotal(expenses,"income"),
                        expense:Subtotals.calculate_Subtotal(expenses,"expense")
                        })

None
},[expenses])
         

let removeItemHandler=(ab:int) => {
      setExpenses(prev=>Js.Array2.filter(prev,expense=>expense.id!=ab))
                  setNextId(prev=>prev-1)
}

let addExpense: (InputData.t) => unit = (a:InputData.t) => {
      let value:Expense.t = {id:nextId,title:a.title,amount:a.amount} 
      setExpenses(prev=>Js.Array2.concat(prev,[value]))
      setNextId(prev=>prev+1)
}
let loginHandler = (data:LoginState.t)=> {
if(data.username!="" && data.password !="") {
      setLoLogjinState(_=>true)
}
}

 <div className="app">
      {!loginState?<LoginPage handleLogin= {loginHandler} loginState = {loginState} />: <div>
      
      <Header subtotal={subtotals} />
      <History expenses={expenses} onRemoveItem = {removeItemHandler} />
      <InputForm addItem ={addExpense} />
      

           </ div>
      }

      </ div>

}