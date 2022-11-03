



@react.component
let make = (~amount:float) =>{

   
       <span> { (amount>0.0?`$${amount->Belt.Float.toString}`:`-$${amount->Js.Math.abs_float->Belt.Float.toString}`)-> React.string} </ span>
    
}