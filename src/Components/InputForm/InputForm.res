%%raw(`import './InputForm.css';`)


type inputState = {title:string,amount:string,titleState:bool,amountState:bool,amountTouched:bool,titleTouched:bool}
let initialState = {title:"",amount:"",titleState:false,amountState:false,amountTouched:false,titleTouched:false};
type action = |SetTitle(string)
| SetAmount(string)
|SetTitleState(string)
| SetAmountState(float)
|SetAmountTouchState(bool)
|SetTitleTouchState(bool)
|SetInitial


let reducer = (state:inputState,action) => {
    switch action {
        |SetTitle(t) => {...state,title:t}
        |SetAmount(a) => {...state,amount:a}
        |SetTitleState(s) => s !==""?{...state,titleState:true}:{...state,titleState:false}
        |SetAmountState(i) => Js.Math.abs_float(i)>0.0?{...state,amountState:true}:{...state,amountState:false}
        |SetAmountTouchState(b)=> {...state,amountTouched:b}
        |SetTitleTouchState(b) => {...state,titleTouched:b}
        |SetInitial=> initialState
    }
}

@react.component
let make = (~addItem:(Types.data) => unit) => {
    let (inputState,dispatch) = React.useReducer(reducer,initialState )
    
    let onRemarkChangeHandler = event => {
        let value:string = (ReactEvent.Form.target(event)["value"]) 
        dispatch(SetTitle(value))
        dispatch(SetTitleState(value))

    }
        let onAmountChangeHandler = event => {
        let value = ReactEvent.Form.target(event)["value"]
        let valueResolved  = switch (value->Belt.Float.fromString) {|None =>0.0 | Some(a)=>a}
        dispatch(SetAmount(value))
        dispatch(SetAmountState(valueResolved))

    }

    let onTitleBur = () => {
        dispatch(SetTitleTouchState(true));

    }

      let onAmountBur = () => {
        dispatch(SetAmountTouchState(true));

    }
    let onSubmitHandler = event => {

            ReactEvent.Form.preventDefault(event);
            dispatch(SetTitleTouchState(true))
            dispatch(SetTitleTouchState(true))
             if(inputState.titleState && inputState.amountState) {
                let vaues = switch (inputState.amount->Belt.Float.fromString) {
                |None=>0.0 
                |Some(a)=>a
                }
                addItem({title:inputState.title,amount:vaues})
                dispatch(SetInitial)

            }else{
                dispatch(SetInitial)
                dispatch(SetTitleTouchState(true))


            }

        
    }


    <form className="form" onSubmit={onSubmitHandler}>
    <p className="warning">{((!inputState.titleState&& inputState.titleTouched)?"Please correct Input":"")->React.string}</p>
    <p className="warning">{((!inputState.amountState&& inputState.amountTouched)?"Please correct Input":"")->React.string}</p>
    <div className= "form-controls">
        <label>{"Remark"->React.string}</label>
        <input onBlur ={_=>onTitleBur()} onChange = {onRemarkChangeHandler} type_="text" placeholder="Please Enter Remarks" value={inputState.title} />
    </div>
    <div className= "form-controls">
        
        <label>{"Amount"->React.string}</label>
        <p>{"Please enter with a negative sign for expenses"->React.string}</p>
        <input onBlur={_=>onAmountBur()} onChange={onAmountChangeHandler} type_="number" placeholder="Please Enter Amount" value={inputState.amount} step=0.01/>
    </div>
    <button>{"Add New Expense"->React.string}</button>
</ form>
}