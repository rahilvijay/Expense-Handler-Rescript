@react.component
let make = (~amount:float) =>{

   
       // <span> { (amount>=0.0?`$${Js.Float.toFixedWithPrecision(amount,~digits=2)}`:`-$${amount->Js.Math.abs_float->Js.Float.toFixedWithPrecision(~digits=2)}`)-> React.string} </ span>

    let rPosAmnt :float => string = (amount:float) => `$${Js.Float.toFixedWithPrecision(amount,~digits=2)}`;
    let rNegAmnt :float => string = (amount:float) => `-$${amount -> Js.Math.abs_float -> Js.Float.toFixedWithPrecision(~digits = 2)}`
    <span>
    { (amount >= 0.0 ?
       rPosAmnt(amount) :
       rNegAmnt(amount))
      -> React.string }
    </span>
}