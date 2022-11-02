type expense = {id:int,title:string,amount:float}
type subtotals = {income:float,expense:float}

type expenses = array<expense>

type data = {title:string,amount:float}

@react.component
let make = (~amount:float) =>{

   
       <span> { (amount>0.0?`$${amount->Belt.Float.toString}`:`-$${amount->Js.Math.abs_float->Belt.Float.toString}`)-> React.string} </ span>
    
}