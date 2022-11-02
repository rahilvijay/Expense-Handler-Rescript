%%raw(`import './ListItem.css';`)



@react.component
let make = (~amount:float,~title:string,~id:int,~onRemoveItem) => {

let clickHandler = (e) => {
        Js.log(id)
                Js.log(e)

        onRemoveItem(id)
    }
    let stylesString:string = amount>0.0?"item green":"item red"


    <li key ={id->Belt.Int.toString} className={stylesString}
      >
        <span>
            <button onClick={clickHandler}>{React.string("x")}</button>
            {title->React.string}</span>
        <span><Converter amount = {amount} /></span>
    </li>
}